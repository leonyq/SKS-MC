package com.more.mes.smt.wmspickscheme;

import java.util.ArrayList;
import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 新增页面获取捡货策略信息
 * @author development
 *
 */
public class AjaxGetPickTactics implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "select t.* from T_WMS_PICK_TACTICS t  ";
		List sqlwList = new ArrayList<>();
		sqlwList.add(dataAuth);
		List wmsList = modelService.listSql(sql, null, null, null, " ORDER BY t.wpt_tactics_sn",null);
		CommMethod.listToEscapeJs(wmsList);
		modelAction.setAjaxList(wmsList);
		return BaseActionSupport.AJAX;
	}

}
