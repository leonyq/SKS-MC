package com.more.mes.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SearchDetailFuns implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String itemCode = request.getParameter("itemCode");
		String itemName = request.getParameter("itemName");
		String itemSpce = request.getParameter("itemSpce");
		String itemGenre = request.getParameter("itemGenre");
		String sql="select t.ID, t.CI_ITEM_CODE,t.CI_ITEM_NAME,t.CI_ITEM_SPEC,R.SUPPLIER_NAME,t.CI_ITEM_GENRE"+
		        " FROM T_CO_ITEM t"+
				" LEFT JOIN T_WMS_RECEIVE_DETAIL m on t.CI_ITEM_CODE=m.WRD_ITEM_CODE"+
				" LEFT JOIN T_CO_SUPPLIER R ON t.CI_SUPPLIER_CODE = R.SUPPLIER_CODE";
		String sqlWhere="";
		if (StringUtils.isNotBlank(itemCode)) {
			sqlWhere += " and t.ci_item_code like '%"+itemCode+"%'";
		}
		if (StringUtils.isNotBlank(itemName)) {
			sqlWhere +=" and t.CI_ITEM_NAME like '%"+itemName+"%'";
		}
		if (StringUtils.isNotBlank(itemSpce)) {
			sqlWhere +=" and t.CI_ITEM_SPEC like '%"+itemSpce+"%'";
		}
		if (StringUtils.isNotBlank(itemGenre)) {
			sqlWhere +=" and t.CI_ITEM_GENRE like '%"+itemGenre+"%'";
		}
		
		List list = modelService.listSql(sql, modelAction.getPage(), sqlWhere, null, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		
		modelAction.getAjaxPage().setDataList(list);
		
		return BaseActionSupport.AJAX;
	}

}