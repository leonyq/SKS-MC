package com.more.mes.smt.modelchecked;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取检验项目类型所需的下拉框
 * 
 * @author development
 */
public class AjaxGetNeedSel implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String testStep = request.getParameter("testStep");
    String dataAuth = request.getParameter("dataAuth");
    List<Object> param = new ArrayList<Object>();
    // 从抽样方案表获取抽样方案 T_QM_SAMPLING_PLAN
    String samplSql = "select t.id,t.qsp_plan_name from T_QM_SAMPLING_PLAN t ";
    String sqlWhere = " and t.QSP_TEST_STEP = ? and t.DATA_AUTH=?";
    param.add(testStep);
    param.add(dataAuth);
    List samplList = modelService.listSql(samplSql, null, sqlWhere, param, null, null);
    // 缺陷等级
    String errorSql = "select * from sy_dict_val where dict_code='QMS_ERROR_GRADE' ";
    List errorList = modelService.listSql(errorSql, null, null, null, null, null);
    // 检查水平
    String testLevelSql = "select * from sy_dict_val where dict_code='QMS_TEST_LEVEL' ";
    List testLevelList = modelService.listSql(testLevelSql, null, null, null, null, null);
    // 水平等级
    String testGradeSql = "select * from sy_dict_val where dict_code='QMS_TEST_GRADE' ";
    List testGradeList = modelService.listSql(testGradeSql, null, null, null, null, null);
    // 全检标志
    String fullSql = "select * from sy_dict_val where dict_code='YOrN' ";
    List fullList = modelService.listSql(fullSql, null, null, null, null, null);
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("samplList", samplList);
    map.put("errorList", errorList);
    map.put("testLevelList", testLevelList);
    map.put("testGradeList", testGradeList);
    map.put("fullList", fullList);
    CommMethod.mapToEscapeJs(map);
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }

}
