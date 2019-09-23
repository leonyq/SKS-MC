package com.more.buss.device.service.pg;

import java.util.List;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetPlanInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String sql = "SELECT t.CDP_PLAN_SN,t.CDP_PLAN_NAME " +
				"FROM T_CO_DEVICE_PLAN_INFO t " +
				"order by convert_to(t.CDP_PLAN_NAME,'GBK') asc";
		List sList = modelService.listDataSql(sql);
		CommMethod.listToEscapeJs(sList);
		modelAction.setDataList(sList);
		//return modelAction.dynamicForwardExeid(modelAction.getJSP_VIEW_ID());// 该ID为功能对应的视图ID
		return modelAction.ActionForwardExeid(modelAction.getExeid());
	}

}
