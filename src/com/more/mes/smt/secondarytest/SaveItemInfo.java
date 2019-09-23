package com.more.mes.smt.secondarytest;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

/**
 * 保存二次送检信息
 * 
 * @author development
 */
public class SaveItemInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String isCloseWin = CommMethod.escapeJs(request.getParameter("isCloseWin"));// 是否关闭窗口
    String formId = CommMethod.escapeJs(request.getParameter("formId"));
    List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
    if (StringUtils.isBlank(formId))
    {
      formId = CommMethod.escapeJs(request.getParameter("formIds"));
    }
    String iframeId = CommMethod.escapeJs(request.getParameter("iframeId"));
    try
    {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String memo = CommMethod.escapeJs(request.getParameter("paraMap1@0#WFI_THAW_MEMO"));// 冻结原因
      String itemSnStr=request.getParameter("itemSn");
      String inspectSnStr=request.getParameter("inspectSn");
      String[] itemSns=new String[] {};
      String[] inspectSns=new String[] {};
      if(itemSnStr!=null&&!"".equals(itemSnStr)) {
    	  itemSns = request.getParameter("itemSn").split(",");// 物料/产品SN
      }
      if(inspectSnStr!=null&&!"".equals(inspectSnStr)) {
    	  inspectSns = request.getParameter("inspectSn").split(",");// 物料/产品SN
      }
      String tempSql = "SELECT T1.QIP_DOC_NUM, " + " T1.QIP_ITEM_NUM, " + " T.QII_ITEM_CODE, "
                       + " T.QII_TEST_STEP, " + " T.QII_SAMPLE_TYPE,T.QII_CUST_CODE "
                       + " FROM T_QM_INSEPCT_PARENT_INFO T1 " + " LEFT JOIN T_QM_INSPECT_INFO T "
                       + " ON T.QII_INSPECT_SN = T1.QIP_INSPECT_SN " + " WHERE T1.QIP_SN = ?  AND T1.DATA_AUTH=? AND T.DATA_AUTH=?  ";
      String testStep = "";
      String sampleType = "";
      String itemCode = "";
      String connectDoc = "";
      String custCode = "";
      String testNum = "";
      TableDataMapExt qscMap = new TableDataMapExt();
      qscMap.setTableName("T_QM_SECONDARY_CHECKLOG");
      for (int i = 0; i < itemSns.length; i++ )
      {
        // 调用生成检验批存储过程
        String itemSn = CommMethod.escapeJs(itemSns[i]);
        String inspectSn = CommMethod.escapeJs(inspectSns[i]);
        tempList = modelService.listDataSql(tempSql, new Object[] {itemSn,dataAuth,dataAuth});
        if (tempList != null && !tempList.isEmpty())
        {
          testStep = StringUtils.toString(tempList.get(0).get("QII_TEST_STEP"));
          sampleType = StringUtils.toString(tempList.get(0).get("QII_SAMPLE_TYPE"));
          itemCode = StringUtils.toString(tempList.get(0).get("QII_ITEM_CODE"));
          connectDoc = StringUtils.toString(tempList.get(0).get("QIP_DOC_NUM"));
          custCode = StringUtils.toString(tempList.get(0).get("QII_CUST_CODE"));
          testNum = StringUtils.toString(tempList.get(0).get("QIP_ITEM_NUM"));

          ProFuncDto pf = new ProFuncDto();
          int[] inPlace = {1, 2, 3, 4, 5, 6, 7, 8, 9};
          int[] outplace = {10, 11};
          List<Object> list = new ArrayList<Object>();
          List<Object> outType = new ArrayList<Object>();
          String deptId = CommMethod.getSessionUser().getDeptId();
          String emp = CommMethod.getSessionUser().getId();
          list.add(testStep);
          list.add(sampleType);
          list.add(CommMethod.getSessionUser().getDeptId());
          list.add(itemSn);
          list.add(itemCode);
          list.add(connectDoc);
          list.add(testNum);
          list.add(CommMethod.getSessionUser().getLoginName());
          list.add(dataAuth);
          outType.add("String");
          outType.add("String");
          pf.setClassName("P_C_SAVE_QM_BATCH");// 生成检验批
          pf.setInPlace(inPlace);// 存储过程中in
          pf.setOutPlace(outplace); // 存储过程中out
          pf.setValArgs(list);// 存储过程中输入的参数
          pf.setTotalLen(list.size() + outType.size());// 总个数
          pf.setOutValType(outType);// 输出的参数
          List<Object> relist = modelService.procComm(pf);// 接收返回值
          String res = (String)relist.get(1); // 结果
          String newInspectSn = (String)relist.get(0); // 结果

          if (!"OK".equals(res))
          {
            return modelAction.alertParentInfo(res);
          }
          else
          {
            // 保存二次送检信息
            CommMethod.addSysDefCol(qscMap.getColMap(), modelAction.getUser());

            // if ("".equals(newInspectSn) || newInspectSn == null)
            // {
            // qscMap.getColMap().put("QSC_INSPECT_NEWSN", inspectSn);// 新检验单号
            // }
            // else
            // {
            qscMap.getColMap().put("QSC_INSPECT_NEWSN", newInspectSn);// 新检验单号
            // }
            qscMap.getColMap().put("QSC_INSPECT_OLDSN", inspectSn);// 旧检验单号
            qscMap.getColMap().put("QSC_ITEM_CODE", itemCode);// 物料料号
            qscMap.getColMap().put("QSC_TEST_STEP", testStep);// 检测阶别
            qscMap.getColMap().put("QSC_SAMPLE_TYPE", sampleType);// 检验类型
            qscMap.getColMap().put("QSC_SEND_NUM", Integer.parseInt(testNum));// 送检数量
            qscMap.getColMap().put("QSC_TARGET_NUM", Integer.parseInt(testNum));// 应抽数量
            qscMap.getColMap().put("QSC_CUST_CODE", custCode);// 客户/供应商
            qscMap.getColMap().put("QSC_CONNECT_DOC", connectDoc);// 关联单号
            qscMap.getColMap().put("QSC_SEND_DEP", CommMethod.getSessionUser().getId());// 送检部门
            qscMap.getColMap().put("QSC_INSEPCT_TIME", sdf.parse(sdf.format(new Date())));// 操作时间
            qscMap.getColMap().put("QSC_INSEPCT_EMP", CommMethod.getSessionUser().getId());// 操作人
            if (dataAuth != null)
            {
                qscMap.getColMap().put("DATA_AUTH", dataAuth);
            }
            modelService.save(qscMap);
          }
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("送检失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("送检成功"), isCloseWin);
  }

}
