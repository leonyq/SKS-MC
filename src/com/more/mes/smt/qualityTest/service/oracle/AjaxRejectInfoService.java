package com.more.mes.smt.qualityTest.service.oracle;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 获取物料/产品信息
 * 
 * @author development
 */
public class AjaxRejectInfoService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String dataId = request.getParameter("dataId");
    String resStr = request.getParameter("res");
    String docStr = request.getParameter("doc");
    String insnStr = request.getParameter("insnStr");
    String itemNumStr = request.getParameter("itemNumStr");
    String itemCodeStr = request.getParameter("itemCodeStr");
    String[] dataIds = dataId.split(",", -1);
    String[] resStrs = resStr.split(",", -1);
    String[] docStrs = docStr.split(",", -1);
    String[] insnStrs = insnStr.split(",", -1);
    String[] itemNumStrs = itemNumStr.split(",", -1);
    String[] itemCodeStrs = itemCodeStr.split(",", -1);

    int lengt = insnStrs.length - 1;
    try
    {
      for (int i = 0; i < lengt; i++ )
      {
        // 修改检验单状态为批退
        ArrayList<Object> paraList = new ArrayList<Object>();
        TableDataMapExt examineMap = new TableDataMapExt();
        examineMap.setTableName("T_QM_INSPECT_INFO");
        CommMethod.editSysDefCol(examineMap.getColMap(), modelAction.getUser());
        // examineMap.setSqlWhere("and QII_INSPECT_SN='" + insnStrs[i] + "'");
        examineMap.setSqlWhere(" and QII_INSPECT_SN= ? AND DATA_AUTH=?");
        paraList.add(insnStrs[i]);
        paraList.add(dataAuth);
        examineMap.setSqlWhereArgs(paraList);
        
        examineMap.getColMap().put("QII_LIST_FLAG", "6");// 状态(1-待检 ，2-检验中，3-检验完成 ，4-已审核，
                                                         // 5-撤销、6-批退)
        // examineMap.getColMap().put("QII_REVIEW_TIME", DateUtil.getCurDate());// 审核时间
        // examineMap.getColMap().put("QII_REVIEW_EMP", CommMethod.getSessionUser().getId());// 审核人
        modelService.edit(examineMap);

        // 获取当前检验单下的母本信息
        String sql = "";

        // 修改采购单接受数量为送检数量
        /*
         * TableDataMapExt poMap = new TableDataMapExt(); poMap.setTableName("T_WMS_PO_DETAIL");
         * CommMethod.editSysDefCol(poMap.getColMap(), modelAction.getUser());
         * poMap.setSqlWhere("and WPD_PO='" + docStrs[i] + "'");
         * poMap.setSqlWhere("and WPD_ITEM_CODE='" + itemCodeStrs[i] + "'");
         * poMap.getColMap().put("WPD_RECEIVE_NUM", Integer.parseInt(itemNumStrs[i]));// 接收数量
         * modelService.edit(poMap);
         */
        String editPoSql = "UPDATE T_WMS_PO_DETAIL T "
                           + " SET T.WPD_RECEIVE_NUM = T.WPD_RECEIVE_NUM - ? "
                           + " WHERE (T.WPD_PO, T.WPD_ITEM_CODE) IN "
                           + " (SELECT A.WRI_CONNECT_DOC, A.WRI_ITEM_CODE "
                           + " FROM T_WMS_RECEIVE_ITEM A " + " LEFT JOIN T_QM_INSPECT_INFO B "
                           + " ON A.WRI_DOC_NUM = B.QII_CONNECT_DOC "
                           + " AND A.WRI_ITEM_CODE = B.QII_ITEM_CODE "
                           + " WHERE B.QII_INSPECT_SN = ? " + " AND B.QII_ITEM_CODE = ? AND B.DATA_AUTH=?) AND T.DATA_AUTH=?";
        modelService.execSql(editPoSql, new Object[] {Integer.parseInt(itemNumStrs[i]),
          insnStrs[i], itemCodeStrs[i],dataAuth,dataAuth});

        // 调用新增其他出库信息存储过程
        String res = saveOutStockInfo(docStrs[i], insnStrs[i],dataAuth, modelService);
        if (!res.equals("OK"))
        {
          return modelAction.alertParentInfo(res);
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    return BaseActionSupport.AJAX;
  }

  public String saveOutStockInfo(String doc, String inSn,String dataAuth, ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3,4};
    int[] outplace = {5};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(doc);
    list.add(inSn);
    String userString = CommMethod.getSessionUser().getId();
    list.add(CommMethod.getSessionUser().getId());
    list.add(dataAuth);
    outType.add("String");
    pf.setClassName("P_W_REJECT_SAVE_INFO");
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
