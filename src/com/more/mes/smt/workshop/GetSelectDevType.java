package com.more.mes.smt.workshop;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 车间建模---新增---获取设备类型
 * 
 * @author Administrator
 *
 */
public class GetSelectDevType implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub

		String sql = "select code,value from sy_dict_val where dict_code = ?";

		List dataList = modelService.listDataSql(sql, new Object[] { "DEVICE_TYPE" });
		CommMethod.listToEscapeJs(dataList);
		modelAction.setAjaxList(dataList);

		return BaseActionSupport.AJAX;
	}

}
