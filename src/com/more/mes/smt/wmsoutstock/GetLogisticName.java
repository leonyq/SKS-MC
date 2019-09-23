package com.more.mes.smt.wmsoutstock;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 销售发货--获取物流公司名称
 * 
 * @author Administrator
 *
 */
public class GetLogisticName implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String LOGISTICS_ID = request.getParameter("LOGISTICS_ID");
		String sqllist = "SELECT LOGISTICS_COMPANY FROM T_CO_LOGISTICS_INFO WHERE ID=? ";

		List list = modelService.listDataSql(sqllist, new Object[] { LOGISTICS_ID });
		CommMethod.listToEscapeJs(list);
		modelAction.setAjaxList(list);
		return BaseActionSupport.AJAX;
	}

}
