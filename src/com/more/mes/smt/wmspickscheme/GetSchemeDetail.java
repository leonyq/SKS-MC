package com.more.mes.smt.wmspickscheme;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据方案代码取出关联的策略信息
 * @author development
 *
 */
public class GetSchemeDetail implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String schemeSn = request.getParameter("schemeSn");
	    String id =  request.getParameter("cid");
	    //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));

	    String sql = "SELECT t.* FROM T_WMS_PICK_SCHEME_DETAIL t WHERE t.pcd_scheme_sn=? and t.data_auth=?  ";
	    List sList = modelService.listDataSql(sql, new Object[] {schemeSn,id});
	    //CommMethod.listToEscapeJs(sList);
	    modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}
}
