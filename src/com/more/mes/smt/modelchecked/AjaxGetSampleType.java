package com.more.mes.smt.modelchecked;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 机种检测项目 根据项目类型获取检验项目信息
 * @author development
 *
 */
public class AjaxGetSampleType implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String itemType = request.getParameter("itemType");
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String sql = "select t.*,a.qsp_plan_name from T_QM_SAMPLE_TYPE t "
                 + "LEFT JOIN T_QM_SAMPLING_PLAN a ON a.id=t.qst_sample_plan ";
    String sqlWhere = " and t.qst_item_type = ? and t.data_auth=? and a.data_auth=? ";
    List listParam = new ArrayList();
    listParam.add(itemType);
    listParam.add(dataAuth);
    listParam.add(dataAuth);
    List itemList = modelService.listSql(sql, null, sqlWhere, listParam, null, null);
    CommMethod.listToEscapeJs(itemList);
    modelAction.setAjaxList(itemList);
    return BaseActionSupport.AJAX;
  }
}
