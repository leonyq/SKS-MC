package com.more.mes.smt.wmspickschemeconfigure;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根剧选择的捡货方案获取方案描述
 * @author development
 *
 */
public class AjaxGetPickMemo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String schemeSn = request.getParameter("schemeSn");
	    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String sql = "SELECT t.wps_memo FROM T_WMS_PICK_SCHEME  t WHERE t.wps_scheme_sn=? and t.data_auth=? ";
	    List pList = modelService.listDataSql(sql, new Object[] { schemeSn,dataAuth });
	    //CommMethod.listToEscapeJs(pList);
	    modelAction.setAjaxList(pList);
		return BaseActionSupport.AJAX;
	}

}
