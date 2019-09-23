package com.more.mes.smt.wmspoinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料信息
 * @author development
 *
 */
public class AjaxGetItemInfo implements FuncService{

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	  Map<String, Object> map = new HashMap<String, Object>();
	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	  
		String sql = "SELECT t.id,t.ci_item_code,t.ci_item_name,t.ci_item_spec FROM t_co_item t " +
				" where t.DATA_AUTH=:dataAuth ";
		map.put("dataAuth", dataAuth);
		List itemList = modelService.listSql(sql, modelAction.getPage(), map,  null,null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
