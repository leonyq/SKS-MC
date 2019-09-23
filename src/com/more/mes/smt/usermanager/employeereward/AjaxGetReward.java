package com.more.mes.smt.usermanager.employeereward;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.BaseService;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义的查询奖惩信息列表接口
 * 
 * @author development
 */

public class AjaxGetReward implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String loginName = modelAction.getParaMap().get("loginName");
		String name = modelAction.getParaMap().get("name");
		String rewardName = modelAction.getParaMap().get("rewardName");
		String rewardType = modelAction.getParaMap().get("rewardType");
		String rewardDateBegin = modelAction.getParaMap().get("rewardDateBegin");
		String rewardDateEnd = modelAction.getParaMap().get("rewardDateEnd");
		String dataAuth = modelAction.getRequest().getParameter("dataAuth");
		String userId = modelAction.getSessionUser().getId();
		String sqlWhere = "";
        Map<String, String> map = new HashMap<String, String>();
        if(StringUtils.isNotBlank(dataAuth)) {
        	sqlWhere += " and t1.DATA_AUTH =  :DATA_AUTH ";
        	map.put("DATA_AUTH", dataAuth);
        }else {
        	sqlWhere += " and t1.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
        	map.put("USER_ID", userId);        	
        }
        	if (StringUtils.isNotBlank(loginName)) {
			sqlWhere += " and t3.LOGIN_NAME LIKE '%' || :loginName || '%' ";
		//	sqlWhere += " and t3.LOGIN_NAME LIKE '%" + loginName + "%'";
		 map.put("loginName", loginName);
		}
		if (StringUtils.isNotBlank(name)) {
			sqlWhere += " and t3.NAME LIKE '%' || :name || '%' ";
		//	sqlWhere += " and t3.NAME LIKE '%" + name + "%'";
		 map.put("name", name);
		}
		if (StringUtils.isNotBlank(rewardName)) {
			sqlWhere += " and t1.REWARD_NAME LIKE '%' || :rewardName || '%' ";
		//	sqlWhere += " and t1.REWARD_NAME LIKE '%" + rewardName + "%'";
		 map.put("rewardName", rewardName);
		}
		if (StringUtils.isNotBlank(rewardType)) {
			sqlWhere += " and t1.REWARD_TYPE =  :rewardType ";
	//	sqlWhere += " and t1.REWARD_TYPE = '" + rewardType + "'";
		 map.put("rewardType", rewardType);
		}

		if (StringUtils.isNotBlank(rewardDateBegin)) {
		   sqlWhere += " and t1.REWARD_DATE >= to_date( :rewardDateBegin ,'yyyy-MM-dd') ";
		//	sqlWhere += " and t1.REWARD_DATE >= to_date('" + rewardDateBegin + "','yyyy-MM-dd') ";
		 map.put("rewardDateBegin", rewardDateBegin);
		}
		if (StringUtils.isNotBlank(rewardDateEnd)) {
	    sqlWhere += " and t1.REWARD_DATE <= to_date( :rewardDateEnd ,'yyyy-MM-dd') ";
		//	sqlWhere += " and t1.REWARD_DATE <= to_date('" + rewardDateEnd + "','yyyy-MM-dd') ";
		map.put("rewardDateEnd", rewardDateEnd);
		}

		String querySql = "select * from (select  distinct  t6.NAME as DATA_AUTH,t1.ID,t1.DATA_AUTH as AUTHVAL,t1.REWARD_CODE,t1.REWARD_DATE,t1.REWARD_NAME,t1.REWARD_TYPE,"
				+ "t1.REWARD_COUNT,t1.REWARD_FILE_NAME,t1.REWARD_FILE_PATH,t1.REWARD_FILE_REAL_NAME,t1.REWARD_FILE_SIZE,t5.VALUE "
				+ " from T_USER_REWARD t1 "
				+ " left join T_USER_REWARD_USER t2 on t1.ID=t2.REWARD_ID "
				+ " left join SY_USER t3 on t2.USER_ID=t3.ID "+
				"   left join SY_DICT_VAL t5 on t1.REWARD_TYPE=t5.code"
				+ " left join SY_DEPT t6 on t6.id = t1.DATA_AUTH "
				+" where 1=1 and t5.DICT_CODE='REWARD_TYPE' "
				+sqlWhere
				+ " order by t1.REWARD_TYPE, t1.REWARD_DATE DESC) t4";

		List rewardList = modelService.listSql(querySql, modelAction.getPage(),
				map, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(rewardList);
        CommMethod.listMapToEscapeJs(rewardList);
		return BaseActionSupport.AJAX;
	}

}
