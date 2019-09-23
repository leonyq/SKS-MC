package com.more.mes.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SearchPaging implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String WIC_WMS_CODE = request.getParameter("WIC_WMS_CODE");
		String sql="select t.CI_ITEM_CODE,t.CI_ITEM_NAME,t.CI_ITEM_SPEC,m.WRI_PACK_NUM,t.CI_ITEM_GENRE"
				+"from T_CO_ITEM t"+
				"LEFT JOIN T_WMS_RECEIVE_ITEM m on t.CI_ITEM_CODE=m.WRI_ITEM_CODE";
		
		List list = modelService.listSql(sql, modelAction.getPage(), null, null, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		
		modelAction.getAjaxPage().setDataList(list);
		
		return BaseActionSupport.AJAX;
	}

}
