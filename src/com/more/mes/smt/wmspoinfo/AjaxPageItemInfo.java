package com.more.mes.smt.wmspoinfo;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 物料信息分页及查询
 * @author development
 *
 */
public class AjaxPageItemInfo implements FuncService{

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String itemCode = modelAction.getParaMap().get("itemCode");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		String sql = "SELECT t.id,t.ci_item_code,t.ci_item_name,t.ci_item_spec FROM t_co_item t where 1=1 " +
				" and t.DATA_AUTH=:dataAuth ";
		sqlParaMap.put("dataAuth", dataAuth);
		
		if(StringUtils.isNotBlank(itemCode)){
			sql += " and t.ci_item_code like '%'||:itemCode||'%'";
			sqlParaMap.put("itemCode", itemCode);
		}
		List itemList = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null,null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
