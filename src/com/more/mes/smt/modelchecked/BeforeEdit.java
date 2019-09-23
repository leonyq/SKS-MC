package com.more.mes.smt.modelchecked;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 修改页面加载项目信息
 * 
 * @author development
 */
public class BeforeEdit implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String modelCode = request.getParameter("modelCode");
    String testStep = request.getParameter("testStep");
    String itemGenre = request.getParameter("itemGenre");
    String dataAuth = request.getParameter("dataAuth");
    String sql2 = "";
    List<Map> dataList2 = null;
    if (!"".equals(modelCode))
    {
      sql2 = "SELECT T.*, T2.VALUE AS MTYPE, T3.VALUE AS MSTEP, T4.VALUE AS MCLASS "
             + " FROM T_QM_MODEL_ITEM T " + " LEFT JOIN SY_DICT_VAL T2 "
             + " ON T2.DICT_CODE = 'QTI_ITEM_TYPE' " + " AND T2.CODE = T.QMI_ITEM_TYPE "
             + " LEFT JOIN SY_DICT_VAL T3 " + " ON T3.DICT_CODE = 'QTI_TEST_STEP' "
             + " AND T3.CODE = T.QMI_TEST_STEP " + " LEFT JOIN SY_DICT_VAL T4 "
             + " ON T4.DICT_CODE = 'QTI_ITEM_CLASS' " + " AND T4.CODE = T.QMI_ITEM_CLASS "
             + " WHERE T.QMI_MODEL_CODE = ? " + " AND T.QMI_TEST_STEP = ? "
             + " AND T.QMI_ITEM_GENRE = ? and t.data_auth=? ";
      dataList2 = modelService.listDataSql(sql2, new Object[] {modelCode, testStep, itemGenre,dataAuth});
    }
    else
    {
      sql2 = "SELECT T.*, " + " T2.VALUE AS MTYPE, " + " T3.VALUE AS MSTEP, "
             + " T4.VALUE AS MCLASS, " + " A.ID     QTI_ID " + " FROM T_QM_MODEL_ITEM T "
             + " LEFT JOIN T_QM_TEST_ITEM A " + " ON T.QMI_ITEM_SN = A.QTI_ITEM_SN  AND A.DATA_AUTH=? "
             + " LEFT JOIN SY_DICT_VAL T2 " + " ON T2.DICT_CODE = 'QTI_ITEM_TYPE' "
             + " AND T2.CODE = T.QMI_ITEM_TYPE " + " LEFT JOIN SY_DICT_VAL T3 "
             + " ON T3.DICT_CODE = 'QTI_TEST_STEP' " + " AND T3.CODE = T.QMI_TEST_STEP "
             + " LEFT JOIN SY_DICT_VAL T4 " + " ON T4.DICT_CODE = 'QTI_ITEM_CLASS' "
             + " AND T4.CODE = T.QMI_ITEM_CLASS " + " WHERE T.QMI_TEST_STEP = ? "
             + " AND T.QMI_ITEM_GENRE = ? " + " AND T.QMI_MODEL_CODE IS NULL AND T.DATA_AUTH=?";
      dataList2 = modelService.listDataSql(sql2, new Object[] {dataAuth,testStep, itemGenre,dataAuth});
    }
    CommMethod.listToEscapeJs(dataList2);
    modelAction.setAjaxList(dataList2);
    return BaseActionSupport.AJAX;
  }

}