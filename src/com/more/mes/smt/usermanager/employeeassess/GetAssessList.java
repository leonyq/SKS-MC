package com.more.mes.smt.usermanager.employeeassess;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/*
异步刷新首页显示数据，根据查询条件输出对应的数据
*/

public class GetAssessList implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String loginName = modelAction.getParaMap().get("loginName");//获取员工号
		String name = modelAction.getParaMap().get("name");//员工姓名
		String assessCode = modelAction.getParaMap().get("assessCode");//考核编号
		String assessLevelB = modelAction.getParaMap().get("assessLevelB");//考核前等级
		String assessLevelA = modelAction.getParaMap().get("assessLevelA");//考核后等级
		String assessDateBegin = modelAction.getParaMap().get("assessDateBegin");//开始时间
		String assessDateEnd = modelAction.getParaMap().get("assessDateEnd");//截止时间
		String dataAuth = modelAction.getRequest().getParameter("dataAuth");
		String userId = modelAction.getSessionUser().getId();
		String sqlWhere = "";//模糊查询
		 Map<String, String> map = new HashMap<String, String>();
		 
		 List<Object> sqlwList = new ArrayList<>();
	       if(StringUtils.isNotBlank(dataAuth)) {
	        	sqlWhere += " and t1.DATA_AUTH =  :DATA_AUTH ";
	        	map.put("DATA_AUTH", dataAuth);
	        }else {
	        	sqlWhere += " and t1.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
	        	map.put("USER_ID", userId);        	
	        }
			if (StringUtils.isNotBlank(loginName)) {
			//sqlWhere += " and t3.LOGIN_NAME LIKE '%" + loginName + "%'";
			sqlWhere += " and t3.LOGIN_NAME LIKE '%' || :loginName || '%' ";
			map.put("loginName", loginName);
		}
		if (StringUtils.isNotBlank(name)) {
		//	sqlWhere += " and t3.NAME LIKE '%" + name + "%'";
			sqlWhere += " and t3.NAME LIKE '%' || :name || '%' ";
			map.put("name", name);
		}
		if (StringUtils.isNotBlank(assessCode)) {
		//	sqlWhere += " and t1.ASSESS_CODE LIKE '%" + assessCode + "%'";
			sqlWhere += " and t1.ASSESS_CODE LIKE '%' || :assessCode || '%' ";
			map.put("assessCode", assessCode);
		}
		if (StringUtils.isNotBlank(assessLevelB)) {
		//	sqlWhere += " and t1.ASSESS_LEVEL_B = '" + assessLevelB + "'";
			sqlWhere += " and t1.ASSESS_LEVEL_B = :assessLevelB ";
			map.put("assessLevelB", assessLevelB);
		}
		if (StringUtils.isNotBlank(assessLevelA)) {
		//	sqlWhere += " and t1.ASSESS_LEVEL_A = '" + assessLevelA + "'";
			sqlWhere += " and t1.ASSESS_LEVEL_A = :assessLevelA ";
			map.put("assessLevelA", assessLevelA);
		}

		if (StringUtils.isNotBlank(assessDateBegin)) {
		//	sqlWhere += " and t1.ASSESS_DATE >= to_date('" + assessDateBegin + "','yyyy-MM-dd') ";
			sqlWhere += " and t1.ASSESS_DATE >= to_date( :assessDateBegin ,'yyyy-MM-dd') ";
			map.put("assessDateBegin", assessDateBegin);
		}
		if (StringUtils.isNotBlank(assessDateEnd)) {
		//	sqlWhere += " and t1.ASSESS_DATE <= to_date('" + assessDateEnd + "','yyyy-MM-dd') ";
			sqlWhere += " and t1.ASSESS_DATE <= to_date( :assessDateEnd ,'yyyy-MM-dd') ";
			map.put("assessDateEnd", assessDateEnd);
		}


		String querySql = " select * from (select  distinct t7.NAME AS DATA_AUTH2,t1.DATA_AUTH,t1.ID,t1.ASSESS_CODE,t1.ASSESS_DATE,t1.ASSESS_LEVEL_B,t1.ASSESS_LEVEL_A, "
                            + "t1.ASSESS_COUNT,t1.ASSESS_FILE,t1.ASSESS_FILE_PATH,t1.ASSESS_FILE_REAL_NAME,t1.ASSESS_FILE_SIZE,t5.VALUE VALUE1,T6.VALUE VALUE2 "
                            + " from T_USER_ASSESS t1 "
                            + " left join T_USER_ASSESS_USER t2 on t1.ID=t2.ASSESS_ID "
                            + " left join SY_USER t3 on t2.USER_ID=t3.ID "
                            + " left join SY_DICT_VAL t5 on t1.ASSESS_LEVEL_B=t5.code "
                            + " left join SY_DICT_VAL t6 on t1.ASSESS_LEVEL_A=t6.code "
                            + " left join SY_DEPT t7 on t1.data_auth=t7.id "
                            + " where 1=1 and t5.DICT_CODE='USER_LEVEL' and t6.DICT_CODE='USER_LEVEL'"
                            + sqlWhere
                            + " order by t1.ASSESS_DATE DESC) t4";

	
		List assessList = modelService.listSql(querySql, modelAction.getPage(),
				map, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(assessList);
        CommMethod.listMapToEscapeJs(assessList);
		return BaseActionSupport.AJAX;
	}

}
