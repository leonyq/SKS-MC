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
 * 修改页面回填策略信息
 * @author development
 *
 */
public class EditPickScheme implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String schemeSn = request.getParameter("schemeSn");
	    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    //取出所有的策略信息
		String sql = "select t.* from T_WMS_PICK_TACTICS t ";
		List sqlwList = new ArrayList<>();
		sqlwList.add(dataAuth);
		List<Map> wmsList = modelService.listSql(sql, null, null, null, " ORDER BY t.wpt_tactics_sn",null);
		//根据方案代码获取已关联的策略信息
		String sql1 = "select t.* from T_WMS_PICK_SCHEME_DETAIL t where t.PCD_SCHEME_SN=? and t.data_auth=? ";
		List<Map> wmsList1 = modelService.listDataSql(sql1, new Object[] { schemeSn,dataAuth });
		//对比策略代码
		String TACTICS_SN = null;
		String TACTICS_SN1 = null;
		for(int i=0;i<wmsList.size();i++){
			TACTICS_SN = (String) wmsList.get(i).get("WPT_TACTICS_SN");
			for(int j=0;j<wmsList1.size();j++){
				TACTICS_SN1 = (String) wmsList1.get(j).get("PCD_TACTICS_SN");
				if(TACTICS_SN1.equals(TACTICS_SN)){
					wmsList.get(i).put("checkFlag", "Y");
					wmsList.get(i).put("PCD_ORDER_BY", wmsList1.get(j).get("PCD_ORDER_BY"));
				}
			}
		}
		CommMethod.listToEscapeJs(wmsList);
		modelAction.setAjaxList(wmsList);
		return BaseActionSupport.AJAX;
	}

}
