package com.more.mes.smt.usermanager.employeetran;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 
 * @Title <新增获取员工列表>
 * @Description <新增获取员工列表> 
 * @ClassName AddGetStranUserList
 * @auther MaoZhongHao
 * @version 1.0 deverloper 2018-03-26 created
 * @see AddGetStranUserList
 * @since 2018-03-26
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class AddGetStranUserList implements FuncService{

	@Override
	/**
	 * 
	 * @Description: 新增获取员工列表
	 * @param request
	 * @param modelAction
	 * @param modelService
	 * @return String
	 * @throws
	 */
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));//组织机构 
		String zjSn = request.getParameter("zj_sn");
		String sqlString = "select usr.ID,usr.LOGIN_NAME,usr.NAME,dept.NAME DEPT_NAME from SY_USER usr " + " left join SY_DEPT dept on usr.DEPT_ID=dept.ID  ";
		sqlString += "where 1=1 and usr.DATA_AUTH = :DATA_AUTH ";
		map.put("DATA_AUTH", dataAuth);		
		if(StringUtils.isNotBlank(zjSn)){
			sqlString += "and usr.NAME like '%' || :zjSn || '%'";
			map.put("zjSn", zjSn);
		}
		List zjList = modelService.listSql(sqlString, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(zjList);
		CommMethod.listMapToEscapeJs(zjList);
		return BaseActionSupport.AJAX;
	}

}
