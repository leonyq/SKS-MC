package com.more.mes.smt.wmsreceivemanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ajax加载仓库信息
 * 
 * @author development
 */
public class AjaxGetWmsInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    Map<String, String> map = new HashMap<String, String>();
    HttpServletRequest request = modelAction.getRequest();
    String auth=request.getParameter("trDataAuth");//查看传组织机构
	if(auth==null||auth==""){
		//修改的取当前组织机构ID
		auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
	}
    String sql = "SELECT t.wa_area_sn,t.wa_area_name FROM T_WMS_AREA t where 1=1";
    String sqlWhere = " and t.wa_area_type=:type and t.data_auth=:dataauth1 ";
    map.put("type", "1");
    map.put("dataauth1", auth);
    List poList = modelService.listSql(sql + sqlWhere, null, map, null, null);
    // List poList = modelService.listSql(sql, null, sqlWhere, null,
    // " ORDER BY t.wa_area_sn",null);
    CommMethod.listToEscapeJs(poList);
    modelAction.setAjaxList(poList);
    return BaseActionSupport.AJAX;
  }

}
