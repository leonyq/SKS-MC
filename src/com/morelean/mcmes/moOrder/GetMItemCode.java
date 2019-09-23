package com.morelean.mcmes.moOrder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetMItemCode implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService ModelService) {
		String sql = "SELECT * FROM T_CO_ITEM ";
		List<Map> dataList = new ArrayList<>();
		dataList = ModelService.listDataSql(sql);
		modelAction.setAjaxList(dataList);
		return BaseActionSupport.AJAX;
	}

}
