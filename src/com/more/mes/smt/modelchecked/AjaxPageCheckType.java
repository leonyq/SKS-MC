package com.more.mes.smt.modelchecked;

import java.util.ArrayList;
import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 校验类型信息分页
 * 
 * @author development
 */
public class AjaxPageCheckType implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String checkType = modelAction.getParaMap().get("checkType");
    String sampleType = modelAction.getParaMap().get("sampleType");
    String modelType = modelAction.getParaMap().get("modelType");
    String dataAuth = modelAction.getParaMap().get("dataAuth");
    List<Object> param = new ArrayList<Object>();
    String sql = "select t.*,t2.NAME DEPT,t3.VALUE ITEM_TYPE_NAME,t4.QSP_PLAN_NAME,t9.VALUE TEST_STEP_NAME,"
                 + "t5.VALUE ERROR_GRADE_NAME,t6.VALUE TEST_LEVEL_NAME,t7.VALUE TEST_GRADE_NAME,t8.VALUE fullFlag "
                 + "from T_QM_SAMPLE_TYPE t "
                 + "left join sy_dept t2 on t2.ID = t.DATA_AUTH "
                 + "left join sy_dict_val t3 on t3.CODE = t.QST_ITEM_TYPE and t3.dict_code = 'QTI_ITEM_TYPE' "
                 + "left join T_QM_SAMPLING_PLAN t4 on t4.ID = t.QST_SAMPLE_PLAN "
                 + "left join sy_dict_val t5 on t5.CODE = t.QST_ERROR_GRADE and t5.dict_code = 'QMS_ERROR_GRADE' "
                 + "left join sy_dict_val t6 on t6.CODE = t.QST_TEST_LEVEL and t6.dict_code = 'QMS_TEST_LEVEL' "
                 + "left join sy_dict_val t7 on t7.CODE = t.QST_TEST_GRADE and t7.dict_code = 'QMS_TEST_GRADE' "
                 + "left join sy_dict_val t8 on t8.CODE = t.QST_FULL_FLAG and t8.dict_code = 'YOrN' "
                 + "left join sy_dict_val t9 on t9.CODE = t.QST_TEST_STEP and t9.dict_code = 'QTI_TEST_STEP' ";
    String sqlWhere = "";
    if (StringUtils.isNotBlank(checkType))
    {
      checkType = CommMethod.escapeJs(checkType);
      sqlWhere += " and t.QST_TEST_STEP = ? ";
      param.add(checkType);
    }
    if (StringUtils.isNotBlank(sampleType))
    {
      sampleType = CommMethod.escapeJs(sampleType);
      sqlWhere += " and t.QST_SAMPLE_TYPE = ? ";
      param.add(sampleType);
    }
    if (StringUtils.isNotBlank(modelType))
    {
      modelType = CommMethod.escapeJs(modelType);
      sqlWhere += " and t.QST_ITEM_TYPE = ? ";
      param.add(modelType);
    }
    if (StringUtils.isNotBlank(dataAuth))
    {
      dataAuth = CommMethod.escapeJs(dataAuth);
      sqlWhere += " and t.DATA_AUTH =  ?";
      param.add(dataAuth);
      //param.add(dataAuth);
    }
    List checkTypeList = modelService.listSql(sql, modelAction.getPage(), sqlWhere, param, null,
      null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(checkTypeList);
    modelAction.getAjaxPage().setDataList(checkTypeList);
    return BaseActionSupport.AJAX;
  }

}
