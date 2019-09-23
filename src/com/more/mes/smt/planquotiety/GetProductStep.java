package com.more.mes.smt.planquotiety;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 影响系数---新增---阶别判断
 * 
 * @author Administrator
 *
 */
public class GetProductStep implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub

		String sql = "select code KEY,value as val from sy_dict_val where  code "
				+ " not in(select PPQ_PRODUCT_STEP  from T_PM_PLAN_QUOTIETY )" + "and dict_code = ?";

		List list = modelService.listDataSql(sql, new Object[] { "PROJECT_STEP" });

		modelAction.setAjaxList(list);

		return BaseActionSupport.AJAX;
	}

}
