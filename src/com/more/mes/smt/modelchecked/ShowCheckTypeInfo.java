package com.more.mes.smt.modelchecked;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 机种检测类型查看
 * 
 * @author development
 */
public class ShowCheckTypeInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String modelCode = request.getParameter("modelCode");
    String objId = request.getParameter("dataId");
    String dataAuth = request.getParameter("dataAuth");
    String sql = "";
    List<Map<String, Object>> modelList = new ArrayList<Map<String, Object>>();
    if (!"".equals(modelCode))
    {
      sql = "SELECT distinct t.*, " + " a.value         TEST_STEP_NAME, "
            + " b.value         ITEM_TYPE_NAME, " + " c.qsp_plan_name PLAN_NAME, "
            + " d.value         ERROR_GRADE, " + " e.value         TEST_LEVEL, "
            + " f.value         TEST_GRADE " + " FROM T_QM_MODEL_TYPE t "
            + " left join T_QM_MODEL_TYPE t1 " + " on t.qmt_model_code = t1.qmt_model_code "
            + " and t.qmt_item_genre = t1.qmt_item_genre " + " LEFT JOIN sy_dict_val a "
            + " ON a.code = t.qmt_test_step " + " AND a.dict_code = 'QTI_TEST_STEP' "
            + " LEFT JOIN sy_dict_val b " + " ON b.code = t.qmt_item_type "
            + " AND b.dict_code = 'QTI_ITEM_TYPE' " + " LEFT JOIN T_QM_SAMPLING_PLAN c "
            + " ON c.id = t.qmt_sample_plan " + " LEFT JOIN sy_dict_val d "
            + " ON d.code = t.qmt_error_grade " + " AND d.dict_code = 'QMS_ERROR_GRADE' "
            + " LEFT JOIN sy_dict_val e " + " ON e.code = t.qmt_test_level "
            + " AND e.dict_code = 'QMS_TEST_LEVEL' " + " LEFT JOIN sy_dict_val f "
            + " ON f.code = t.qmt_test_grade " + " AND f.dict_code = 'QMS_TEST_GRADE' "
            + " where (t.qmt_model_code, t.qmt_item_genre) in "
            + " (select t2.qmt_model_code, t2.qmt_item_genre " + " from T_QM_MODEL_TYPE t2 "
            + " where t2.id = ? " + " and t2.data_auth = ?) " + "  "
            + " and t.data_auth = ? and t1.data_auth = ? " + "  ";
      modelList = modelService.listDataSql(sql, new Object[] {objId,dataAuth,dataAuth,dataAuth});
    }
    else
    {
      sql = "SELECT distinct t.*, " + " a.value         TEST_STEP_NAME, "
            + " b.value         ITEM_TYPE_NAME, " + " c.qsp_plan_name PLAN_NAME, "
            + " d.value         ERROR_GRADE, " + " e.value         TEST_LEVEL, "
            + " f.value         TEST_GRADE " + " FROM T_QM_MODEL_TYPE t "
            + " left join T_QM_MODEL_TYPE t1 " + " on t.qmt_item_genre = t1.qmt_item_genre "
            + " LEFT JOIN sy_dict_val a " + " ON a.code = t.qmt_test_step "
            + " AND a.dict_code = 'QTI_TEST_STEP' " + " LEFT JOIN sy_dict_val b "
            + " ON b.code = t.qmt_item_type " + " AND b.dict_code = 'QTI_ITEM_TYPE' "
            + " LEFT JOIN T_QM_SAMPLING_PLAN c " + " ON c.id = t.qmt_sample_plan "
            + " LEFT JOIN sy_dict_val d " + " ON d.code = t.qmt_error_grade "
            + " AND d.dict_code = 'QMS_ERROR_GRADE' " + " LEFT JOIN sy_dict_val e "
            + " ON e.code = t.qmt_test_level " + " AND e.dict_code = 'QMS_TEST_LEVEL' "
            + " LEFT JOIN sy_dict_val f " + " ON f.code = t.qmt_test_grade "
            + " AND f.dict_code = 'QMS_TEST_GRADE' "
            + " where t.qmt_item_genre in (select t2.qmt_item_genre " + " from T_QM_MODEL_TYPE t2 "
            + " where t2.id = ? " + " and t2.data_auth = ? ) " + " and t1.qmt_model_code is null "
            + " and t.data_auth = ? " + " and t1.data_auth = ? " + "  ";
      modelList = modelService.listDataSql(sql, new Object[] {objId,dataAuth,dataAuth,dataAuth});
    }
    CommMethod.listMapToEscapeJs(modelList);
    modelAction.setDataList(modelList);

    return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
  }
}
