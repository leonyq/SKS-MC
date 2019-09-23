package com.more.buss.firstpiece.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 首件检测 新增 校验输入的SN
 * @author development
 *
 */
public class CheckInputSn implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String productSn = request.getParameter("productSn");  //输入的产品SN
		String dataAuth = request.getParameter("dataAuth");
		String sql = "select WT_PROJECT_ID,WT_NUM from T_WIP_TRACKING where WT_SN = ? and DATA_AUTH=?";
		List sList = modelService.listDataSql(sql, new Object[] { productSn,dataAuth });
		CommMethod.listToEscapeJs(sList);
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}

}
