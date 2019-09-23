package com.more.mes.common;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class AjaxAddSuppliesControls implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		String sql =" select T.ID, T.CI_ITEM_CODE, T.CI_ITEM_NAME, T.CI_ITEM_SPEC, M.WRI_PACK_NUM, T.CI_ITEM_GENRE FROM T_CO_ITEM T LEFT JOIN T_WMS_RECEIVE_ITEM M ON M.WRI_ITEM_CODE = T.CI_ITEM_CODE";
		
		List itemList = modelService.listSql(sql, modelAction.getPage(), null, null, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);
		
		return BaseActionSupport.AJAX;
	}

}
