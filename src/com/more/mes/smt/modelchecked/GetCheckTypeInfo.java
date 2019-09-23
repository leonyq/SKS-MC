package com.more.mes.smt.modelchecked;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 得到校验类型信息
 * 
 * @author development
 */
public class GetCheckTypeInfo implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String type = request.getParameter("type");
    String itemgenre = request.getParameter("itemgenre");
    String testStep = request.getParameter("testStep");
    String dataAuth = request.getParameter("dataAuth");
    String checkType = request.getParameter("checkType");
    String sampleType = request.getParameter("sampleType");
    
    List<Object> param = new ArrayList<Object>();
    if (!"showItemGenreInfo".equals(type))
    {
      String sql = "select t.*,t2.NAME DEPT,t3.VALUE ITEM_TYPE_NAME,t4.QSP_PLAN_NAME,t9.VALUE TEST_STEP_NAME,"
                   + "t5.VALUE ERROR_GRADE_NAME,t6.VALUE TEST_LEVEL_NAME,t7.VALUE TEST_GRADE_NAME,t8.VALUE fullFlag "
                   + "from T_QM_SAMPLE_TYPE t "
                   + "left join sy_dept t2 on t2.ID = t.DATA_AUTH "
                   + "left join sy_dict_val t3 on t3.CODE = t.QST_ITEM_TYPE and t3.dict_code = 'QTI_ITEM_TYPE' "
                   + "left join T_QM_SAMPLING_PLAN t4 on t4.ID = t.QST_SAMPLE_PLAN AND t4.DATA_AUTH = t.DATA_AUTH "
                   + "left join sy_dict_val t5 on t5.CODE = t.QST_ERROR_GRADE and t5.dict_code = 'QMS_ERROR_GRADE' "
                   + "left join sy_dict_val t6 on t6.CODE = t.QST_TEST_LEVEL and t6.dict_code = 'QMS_TEST_LEVEL' "
                   + "left join sy_dict_val t7 on t7.CODE = t.QST_TEST_GRADE and t7.dict_code = 'QMS_TEST_GRADE' "
                   + "left join sy_dict_val t8 on t8.CODE = t.QST_FULL_FLAG and t8.dict_code = 'YOrN' "
                   + "left join sy_dict_val t9 on t9.CODE = t.QST_TEST_STEP and t9.dict_code = 'QTI_TEST_STEP' ";
      String sqlWhere = "";
      if (StringUtils.isNotBlank(checkType))
      {
        sqlWhere += " and t.QST_TEST_STEP = ? ";
        param.add(checkType);
      }
      if (StringUtils.isNotBlank(dataAuth))
      {
        sqlWhere += " and t.DATA_AUTH = ? ";
        param.add(dataAuth);
      }
      if (StringUtils.isNotBlank(sampleType))
      {
        sqlWhere += " and t.QST_SAMPLE_TYPE= ? ";
        param.add(sampleType);
      }
      List checkTypeList = modelService.listSql(sql, modelAction.getPage(), sqlWhere, param, null,
        null);
      CommMethod.listToEscapeJs(checkTypeList);
      modelAction.setAjaxPage(modelAction.getPage());
      modelAction.getAjaxPage().setDataList(checkTypeList);
    }
    else
    {
      String sql = "select distinct t.*, " + " t2.NAME          DEPT, "
                   + " t3.VALUE         ITEM_TYPE_NAME, " + " t4.QSP_PLAN_NAME, "
                   + " t9.VALUE         TEST_STEP_NAME, " + " t5.VALUE         ERROR_GRADE_NAME, "
                   + " t6.VALUE         TEST_LEVEL_NAME, " + " t7.VALUE         TEST_GRADE_NAME, "
                   + " t8.VALUE         fullFlag, " + " T1.ID QST_ID "
                   + " from T_QM_MODEL_TYPE t " + " LEFT JOIN T_QM_SAMPLE_TYPE T1 "
                   + " ON T.QMT_TEST_STEP = T1.QST_TEST_STEP "
                   + " AND T.qmt_item_type = T1.qst_item_type "
                   + " AND T.qmt_sample_plan = T1.qst_sample_plan "
                   + " AND T.qmt_error_grade = T1.qst_error_grade AND T.QMT_SAMPLE_TYPE = T1.QST_SAMPLE_TYPE "
                   + " left join t_co_item a "
                   + " on t.qmt_item_genre = a.ci_item_genre " + " left join sy_dept t2 "
                   + " on t2.ID = t.DATA_AUTH " + " left join sy_dict_val t3 "
                   + " on t3.CODE = t.QMT_ITEM_TYPE " + " and t3.dict_code = 'QTI_ITEM_TYPE' "
                   + " left join T_QM_SAMPLING_PLAN t4 " + " on t4.ID = t.QMT_SAMPLE_PLAN "
                   + " left join sy_dict_val t5 " + " on t5.CODE = t.QMT_ERROR_GRADE "
                   + " and t5.dict_code = 'QMS_ERROR_GRADE' " + " left join sy_dict_val t6 "
                   + " on t6.CODE = t.QMT_TEST_LEVEL " + " and t6.dict_code = 'QMS_TEST_LEVEL' "
                   + " left join sy_dict_val t7 " + " on t7.CODE = t.QMT_TEST_GRADE "
                   + " and t7.dict_code = 'QMS_TEST_GRADE' " + " left join sy_dict_val t8 "
                   + " on t8.CODE = t.QMT_FULL_FLAG " + " and t8.dict_code = 'YOrN' "
                   + " left join sy_dict_val t9 " + " on t9.CODE = t.QMT_TEST_STEP "
                   + " and t9.dict_code = 'QTI_TEST_STEP' " + " where t.qmt_item_genre = ? "
                   + " and t.qmt_TEST_STEP = ? " + " and t.qmt_model_code is null and a.data_auth=? and t4.data_auth=?";
      List checkTypeList = modelService.listDataSql(sql, new Object[] {itemgenre, testStep,dataAuth,dataAuth});
      CommMethod.listToEscapeJs(checkTypeList);
      modelAction.setAjaxList(checkTypeList);
    }

    return BaseActionSupport.AJAX;
  }
}
