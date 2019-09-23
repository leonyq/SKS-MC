package com.more.mes.smt.wmspoinfo;

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
 * 保存新增的采购单以及采购单明细信息
 * 
 * @author development
 */
public class AddPoInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
     //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    //String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
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

      String wpiReceiveTime = request.getParameter("paraMap1@0#WPI_RECEIVE_TIME");// 到货时间
      String wpiSupCode = request.getParameter("paraMap1@0#WPI_SUP_CODE");// 供应商
      String wpiMemo = request.getParameter("paraMap1@0#WPI_MEMO");// 备注
      String[] itemCodes = request.getParameterValues("CI_ITEM_CODE");// 物料料号
      String[] itemSeqs = request.getParameterValues("WPD_ITEM_SEQ");// 项次
      String[] deliveryDates = request.getParameterValues("WPD_DELIVERY_DATE");// 交货日期
      String[] planNums = request.getParameterValues("WPD_PLAN_NUM");// 计划数量
      String[] memos = request.getParameterValues("WPI_MEMO");// 备注
      // 判断物料料号是否有相同的
      for (int i = 0; i < itemCodes.length; i++ )
      {
        for (int j = i + 1; j < itemCodes.length; j++ )
        {
          if (itemCodes[i].equals(itemCodes[j]))
          { // 如果物料料号相同则判断项次
            if (itemSeqs[i].equals(itemSeqs[j]))
            {
              return modelAction.alertParentInfo(modelAction.getText("相同物料料号,项次需不同"));
            }
          }
        }
      }
      //String WPI_PO = getPoNo(dataAuth, modelService);// 采购单号
      GetSnService gss = new GetSnService();
      String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
      String wpiPo = gss.getSnForDocNum("DJ01", "", userId,dataAuth);
      if (wpiPo.indexOf("NG") != -1)
      {
        return modelAction.alertParentInfo(wpiPo);
      }
      
      if(!StringUtils.isNotEmpty(wpiPo)){
          return modelAction.alertParentInfo(modelAction.getText("未配置条码规则"));
      }
       // 增加仓库单据信息表数据
      TableDataMapExt wms0 = new TableDataMapExt();
      wms0.setTableName("T_WMS_DOC_INFO");
      CommMethod.addSysDefCol(wms0.getColMap(), modelAction.getUser());
      wms0.getColMap().put("ID", StringUtils.getUUID());
      wms0.getColMap().put("WDI_DOC_NUM", wpiPo);
      wms0.getColMap().put("WDI_STATUS", "1");
      wms0.getColMap().put("WDI_URGENT_FLAG", "N");
      wms0.getColMap().put("WDI_SUP_CODE", wpiSupCode);
      wms0.getColMap().put("WDI_DOC_TYPE", "DJ01");
      wms0.getColMap().put("WDI_DISPATCH_TYPE", "");
      wms0.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
      wms0.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
      wms0.getColMap().put("WDI_MEMO", wpiMemo);
      if (dataAuth != null)
      {
        wms0.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(wms0);
      
      
      // 插入采购单信息
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_PO_INFO");
      CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
      wms.getColMap().put("WPI_PO", wpiPo);
      wms.getColMap().put("WPI_RECEIVE_TIME", sdf1.parse(wpiReceiveTime));
      wms.getColMap().put("WPI_STATUS", "1");
      wms.getColMap().put("WPI_SUP_CODE", wpiSupCode);
      wms.getColMap().put("WPI_MEMO", wpiMemo);
      wms.getColMap().put("WPI_CREATE_MAN", CommMethod.getSessionUser().getId());
      wms.getColMap().put("WPI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(wms);
      // 插入采购单明细信息
      TableDataMapExt wms1 = new TableDataMapExt();
      wms1.setTableName("T_WMS_PO_DETAIL");
      for (int i = 0; i < itemCodes.length; i++ )
      {
        wms1.getColMap().clear();
        CommMethod.addSysDefCol(wms1.getColMap(), modelAction.getUser());
        wms1.getColMap().put("WPD_PO", wpiPo);
        wms1.getColMap().put("WPD_ITEM_CODE", itemCodes[i]);
        wms1.getColMap().put("WPD_ITEM_SEQ", Integer.parseInt(itemSeqs[i]));
        if (!deliveryDates[i].equals(""))
        {
          wms1.getColMap().put("WPD_DELIVERY_DATE", sdf2.parse(deliveryDates[i]));
        }
        wms1.getColMap().put("WPD_PLAN_NUM", Integer.parseInt(planNums[i]));
        wms1.getColMap().put("WPD_RECEIVE_NUM", 0);
        wms1.getColMap().put("WPD_MEMO", memos[i]);
        if (dataAuth != null)
        {
          wms1.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(wms1);
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
  public String getPoNo(String dataAuth, ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3};
    int[] outplace = {4, 5};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(dataAuth);
    list.add("PO");
    list.add(null);
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
