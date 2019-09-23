package com.more.mes.smt.modelchecked;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 回填机种检测类型的检验项目信息的值
 * 
 * @author development
 */
public class AjaxSetEditValue implements FuncService
{

  @SuppressWarnings("unused")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String modelCode = request.getParameter("modelCode");
    String testStep = request.getParameter("testStep");
    String itemGenre = request.getParameter("itemGenre");
    String dataAuth = request.getParameter("dataAuth");
    String sql = "";
    List modelList = null;
    if (!"".equals(modelCode))
    {
      sql = "SELECT t.*, a.value TEST_STEP_NAME, b.value ITEM_TYPE_NAME,T1.ID QST_ID "
            + " FROM T_QM_MODEL_TYPE t " + " LEFT JOIN T_QM_SAMPLE_TYPE T1 "
            + " ON T.QMT_TEST_STEP = T1.QST_TEST_STEP "
            + " AND T.qmt_item_type = T1.qst_item_type "
            + " AND T.qmt_sample_plan = T1.qst_sample_plan "
            + " AND T.qmt_error_grade = T1.qst_error_grade  and t.qmt_sample_type = t1.qst_sample_type and t1.data_auth=? " + " LEFT JOIN sy_dict_val a "
            + " ON a.code = t.qmt_test_step " + " AND a.dict_code = 'QTI_TEST_STEP' "
            + " LEFT JOIN sy_dict_val b " + " ON b.code = t.qmt_item_type "
            + " AND b.dict_code = 'QTI_ITEM_TYPE' " + " where t.QMT_MODEL_CODE = ? "
            + " and t.QMT_TEST_STEP = ? and t.data_auth=? ";
      modelList = modelService.listDataSql(sql, new Object[] {dataAuth,modelCode, testStep,dataAuth});
    }
    else
    {
      sql = "SELECT t.*, a.value TEST_STEP_NAME, b.value ITEM_TYPE_NAME, T1.ID QST_ID "
            + " FROM T_QM_MODEL_TYPE t " + " LEFT JOIN T_QM_SAMPLE_TYPE T1 "
            + " ON T.QMT_TEST_STEP = T1.QST_TEST_STEP "
            + " AND T.qmt_item_type = T1.qst_item_type "
            + " AND T.qmt_sample_plan = T1.qst_sample_plan "
            + " AND T.qmt_error_grade = T1.qst_error_grade AND T.QMT_SAMPLE_TYPE = T1.QST_SAMPLE_TYPE and t1.data_auth=? " + " LEFT JOIN sy_dict_val a "
            + " ON a.code = t.qmt_test_step " + " AND a.dict_code = 'QTI_TEST_STEP' "
            + " LEFT JOIN sy_dict_val b " + " ON b.code = t.qmt_item_type "
            + " AND b.dict_code = 'QTI_ITEM_TYPE' " + " where t.qmt_item_genre = ? "
            + " and t.QMT_TEST_STEP = ?  AND t.QMT_MODEL_CODE IS NULL and t.data_auth=? ";
      modelList = modelService.listDataSql(sql, new Object[] {dataAuth,itemGenre, testStep,dataAuth});
    }
    CommMethod.listToEscapeJs(modelList);
    modelAction.setAjaxList(modelList);
    return BaseActionSupport.AJAX;
  }

}
