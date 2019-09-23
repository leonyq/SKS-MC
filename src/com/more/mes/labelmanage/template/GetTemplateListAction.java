package com.more.mes.labelmanage.template;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 根据登录人员组织机构记载出当前 标签模版
 * @Description 根据登录人员组织机构记载出当前 标签模版
 * @ClassName GetTemplateListAction
 * @author Administrator
 * @version 1.0 developer 2017-11-14 created
 * @see GetTemplateListAction
 * @since 2017-11-14
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class GetTemplateListAction implements FuncService
{

  /**
   * @param modelAction
   * @param modelService
   * @return
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction,
   *      com.more.fw.core.dbo.model.service.ModelService)
   */
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    HttpServletRequest request = modelAction.getRequest();
    String type = request.getParameter("type");
    if ("listTemplate".equals(type))
    {
      return listTemplate(request, modelAction, modelService);
    }
    else if ("printLable".equals(type))
    {
      printLable(request, modelAction, modelService);
    }

    return null;
  }

  private String printLable(HttpServletRequest request, ModelAction modelAction,
                            ModelService modelService)
  {

    Map ajaxMap = new HashMap();
    String deptId = CommMethod.getSessionUser().getDeptId();
    String id = request.getParameter("dataId");
    String sql = "SELECT T.MODEL_FILE,T.LABELCSS FROM ML_TEMPLATE T where id = ?";
    List<Map> slist = modelService.listDataSql(sql, new Object[] {id});
    String modelPath = StringUtils.toString(slist.get(0).get("MODEL_FILE"));
    String labelcss = StringUtils.toString(slist.get(0).get("LABELCSS"));
    if (StringUtils.isBlank(labelcss))
    {
      ajaxMap.put("res", "error");
      ajaxMap.put("msg", modelAction.getText("标签模板未编辑 "));
    }
    else
    {
      ajaxMap.put("res", "success");
      ajaxMap.put("LABELCSS", labelcss);
    }
    return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);

  }

  private String listTemplate(HttpServletRequest request, ModelAction modelAction,
                              ModelService modelService)
  {
    String userId = CommMethod.getSessionUser().getId();

/*    String sql = " select t.ID,t.LABEL_NAME,t.STATUS,t.SAMPLE_MAP,LABEL_LENGTH,LABEL_WIDTH,SIZE_UNIT,t.PRINT_NUM from ML_TEMPLATE t where t.DATA_AUTH IN (SELECT S.DEPT_ID FROM SY_DATA_AUTH S WHERE S.USER_ID =?)  order by t.LABEL_NAME";

    List<Map> templateList = modelService.listDataSql(sql, new Object[] {userId});*/

    String sql = " select t.ID,t.LABEL_NAME,t.STATUS,t.SAMPLE_MAP,LABEL_LENGTH,LABEL_WIDTH,SIZE_UNIT,t.PRINT_NUM from ML_TEMPLATE t ";
    String labelNameSearch=request.getParameter("labelNameSearch");
    //String sqlWhere = " AND t.DATA_AUTH=? ";
    String sqlWhere = " ";
    List<Object> param = new ArrayList<Object>();
    //param.add(deptId);
    if (StringUtils.isNotBlank(labelNameSearch))
    {
      sqlWhere += "AND T.LABEL_NAME LIKE '%"+labelNameSearch+"%' ";
      param.add(labelNameSearch.trim());
    }
    List<Map> templateList= modelService.listSql(sql, null, sqlWhere, null," order by t.LABEL_NAME", null);

    Map<String, Object> ajaxMap = new HashMap<String, Object>();
    ajaxMap.put("templateList", templateList);

    modelAction.setAjaxMap(ajaxMap);
    return ModelAction.AJAX;
  }

}
