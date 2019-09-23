package com.more.mes.smt.wmsreceivemanager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.smt.getsnhttp.service.GetSnService;

/**
 * 保存新增的生产退料信息
 * 
 * @author development
 */
public class AddProductReturn implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
      String wrdDispatchSn = request.getParameter("paraMap1@0#T2#WRD_DISPATCH_SN");// 收发类型
      String wrdDeliveryDate = request.getParameter("paraMap1@0#WPD_DELIVERY_DATE");// 入库日期
      String wrdUrgentFlag = request.getParameter("paraMap1@0#WRD_URGENT_FLAG");// 紧急标志
      String wrdSupCode = request.getParameter("paraMap1@0#WRD_SUP_CODE");// 供应商
      String wrdMemo = request.getParameter("paraMap1@0#WRD_MEMO");// 备注
      String[] itemCodes = request.getParameterValues("CI_ITEM_CODE");// 物料料号
      String[] planNums = request.getParameterValues("PLAN_NUM");// 计划数量
      String[] packNums = request.getParameterValues("MIN_PACK");// 标准包装数量
      String[] itemSeqs = request.getParameterValues("ITEM_SEQ");// 项次
      String[] wpiPos = request.getParameterValues("WPI_PO");// 工单号
      String[] wmsSelects = request.getParameterValues("wmsSelect");// 仓库
      String[] lotNos = request.getParameterValues("WRI_LOT_NO");// 生产批号
      String[] productDates = request.getParameterValues("WRI_PRODUCE_DATE");// 生产日期
      // 判断机种料号是否有相同的
      for (int i = 0; i < itemCodes.length; i++ )
      {
        for (int j = i + 1; j < itemCodes.length; j++ )
        {
          if (itemCodes[i].equals(itemCodes[j]))
          { // 如果机种料号相同则判断项次
            if (itemSeqs[i].equals(itemSeqs[j]))
            {
              return modelAction.alertParentInfo(modelAction.getText("相同物料料号,项次需不同"));
            }
          }
        }
      }
      // String WRD_DOC_NUM = getReceiveNo(dataAuth, "DJ03", WRD_DISPATCH_SN, modelService);// 入库单号
      GetSnService gss = new GetSnService();
      String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
      String wrdDocNum = gss.getSnForDocNum("DJ03", wrdDispatchSn, userId, dataAuth);
      if (wrdDocNum.indexOf("NG") != -1)
      {
        return modelAction.alertParentInfo(wrdDocNum);
      }
      if (wrdUrgentFlag == null || wrdUrgentFlag == "" || wrdUrgentFlag.equals(""))
      {
    	  wrdUrgentFlag = "N";
      }
      // 增加仓库单据信息表数据
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_DOC_INFO");
      CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
      // wms.getColMap().put("ID", StringUtils.getUUID());
      wms.getColMap().put("WDI_DOC_NUM", wrdDocNum);
      wms.getColMap().put("WDI_STATUS", "1");
      wms.getColMap().put("WDI_URGENT_FLAG", wrdUrgentFlag);
      wms.getColMap().put("WDI_SUP_CODE", wrdSupCode);
      wms.getColMap().put("WDI_DOC_TYPE", "DJ03");
      wms.getColMap().put("WDI_DISPATCH_TYPE", wrdDispatchSn);
      wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
      wms.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
      wms.getColMap().put("WDI_MEMO", wrdMemo);
      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(wms);
      // 插入入库单信息
      TableDataMapExt receive = new TableDataMapExt();
      receive.setTableName("T_WMS_RECEIVE_DOC");
      CommMethod.addSysDefCol(receive.getColMap(), modelAction.getUser());
      receive.getColMap().put("ID", StringUtils.getUUID());
      receive.getColMap().put("WRD_DOC_NUM", wrdDocNum);
      receive.getColMap().put("WRD_DOC_TYPE", "DJ03");
      receive.getColMap().put("WRD_STATUS", "1");
      receive.getColMap().put("WRD_SUP_CODE", wrdSupCode);
      if (!wrdDeliveryDate.equals(""))
      {
        receive.getColMap().put("WPD_DELIVERY_DATE", sdf2.parse(wrdDeliveryDate));
      }
      receive.getColMap().put("WRD_URGENT_FLAG", wrdUrgentFlag);
      receive.getColMap().put("WRD_DISPATCH_SN", wrdDispatchSn);
      receive.getColMap().put("WRD_MEMO", wrdMemo);
      receive.getColMap().put("WRD_CREATE_MAN", CommMethod.getSessionUser().getId());
      receive.getColMap().put("WRD_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
      if (dataAuth != null)
      {
        receive.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(receive);
      // 插入入库单物料信息
      TableDataMapExt receive1 = new TableDataMapExt();
      receive1.setTableName("T_WMS_RECEIVE_ITEM");
      for (int i = 0; i < itemCodes.length; i++ )
      {
        receive1.getColMap().clear();
        CommMethod.addSysDefCol(receive1.getColMap(), modelAction.getUser());
        receive1.getColMap().put("ID", StringUtils.getUUID());
        receive1.getColMap().put("WRI_DOC_NUM", wrdDocNum);
        receive1.getColMap().put("WRI_STATUS", "1");
        receive1.getColMap().put("WRI_ITEM_CODE", itemCodes[i]);
        receive1.getColMap().put("WRI_ITEM_SEQ", Integer.valueOf(itemSeqs[i]));
        receive1.getColMap().put("WRI_PLAN_NUM", Integer.valueOf(planNums[i]));
        receive1.getColMap().put("WRI_PACK_NUM", Integer.valueOf(packNums[i]));
        receive1.getColMap().put("WRI_CONNECT_DOC", wpiPos[i]);
        receive1.getColMap().put("WRI_WH_CODE", wmsSelects[i]);
        receive1.getColMap().put("WRI_LOT_NO", lotNos[i]);
        if (!productDates[i].equals(""))
        {
          receive1.getColMap().put("WRI_PRODUCE_DATE", sdf2.parse(productDates[i]));
        }
        if (dataAuth != null)
        {
          receive1.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(receive1);
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

  @SuppressWarnings("unchecked")
  public String getReceiveNo(String dataAuth, String prefix, String dispatchSn,
                             ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3};
    int[] outplace = {4, 5};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(dataAuth);
    list.add(prefix);
    list.add(dispatchSn);
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String res = (String)relist.get(0); // 结果
    return res;
  }

}
