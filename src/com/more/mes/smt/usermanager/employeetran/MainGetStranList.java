package com.more.mes.smt.usermanager.employeetran;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.BaseService;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @Title <主页获取培训列表>
 * @Description <主页获取培训列表> 
 * @ClassName MainGetStranList
 * @auther MaoZhongHao
 * @version 1.0 deverloper 2018-03-26 created
 * @see MainGetStranList
 * @since 2018-03-26
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class MainGetStranList implements FuncService {
	
	@Override
	/**
	 * 
	 * @Description: 主页获取培训列表 
	 * @param request
	 * @param modelAction
	 * @param modelService
	 * @return String
	 * @throws
	 */
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String loginName = modelAction.getParaMap().get("loginName");
		String name = modelAction.getParaMap().get("name");
		String tranName = modelAction.getParaMap().get("tranName");
		String tranCode = modelAction.getParaMap().get("tranCode");
		String tranDateBegin = modelAction.getParaMap().get("tranDateBegin");
		String tranDateEnd = modelAction.getParaMap().get("tranDateEnd");
		String dataAuth = modelAction.getRequest().getParameter("dataAuth");
		String userId = CommMethod.getSessionUser().getId();
		String sqlWhere = "";
    Map<String, String> map = new HashMap<String, String>();
    if (StringUtils.isNotBlank(dataAuth)) {
			sqlWhere += " and t1.data_auth = :data_auth  ";
			map.put("data_auth", dataAuth);
		}else {
			sqlWhere += " and t1.data_auth in (select DEPT_ID from sy_data_auth where user_id = :user_id)  ";
			map.put("user_id", userId);			
		}    
    
    if (StringUtils.isNotBlank(loginName)) {
			sqlWhere += " and t3.LOGIN_NAME LIKE '%' || :loginName || '%'";
			map.put("loginName", loginName);
		}
		if (StringUtils.isNotBlank(name)) {
			sqlWhere += " and t3.NAME LIKE '%' || :name || '%'";
			map.put("name", name);
		}
		if (StringUtils.isNotBlank(tranName)) {
			sqlWhere += " and t1.TRAN_NAME LIKE '%' || :tranName || '%'";
			map.put("tranName", tranName);
		}
		if (StringUtils.isNotBlank(tranCode)) {
			sqlWhere += " and t1.TRAN_CODE LIKE '%' || :tranCode || '%'";
			map.put("tranCode", tranCode);
		}
		if (StringUtils.isNotBlank(tranDateBegin)) {
			sqlWhere += " and t1.TRAN_DATE >= to_date(:tranDateBegin,'yyyy-MM-dd') ";
			map.put("tranDateBegin", tranDateBegin);
		}
		if (StringUtils.isNotBlank(tranDateEnd)) {
			sqlWhere += " and t1.TRAN_DATE <= to_date(:tranDateEnd,'yyyy-MM-dd') ";
			map.put("tranDateEnd", tranDateEnd);
		}

		String querySql = "select * from (select  distinct  t1.ID,t1.TRAN_CODE,t1.TRAN_DATE,t1.TRAN_NAME,t1.TRAN_USER_ID,"
				+ " t1.TRAN_COUNT,t1.TRAN_FILE_NAME,t1.TRAN_FILE_PATH,t1.TRAN_FILE_REAL_NAME,t1.TRAN_FILE_SIZE "
				+ " from T_USER_TRAN t1 "
				+ " left join T_USER_TRAN_USER t2 on t1.ID=t2.TRAN_ID "
				+ " left join SY_USER t3 on t2.USER_ID=t3.ID where 1=1"+sqlWhere
				+ " order by t1.TRAN_DATE DESC) t4";
		querySql = "select t4.ID  "
				+ "ID, TRAN_CODE TRAN_CODE, TRAN_DATE TRAN_DATE, USER_ID USER_ID, TRAN_FILE_REAL_NAME, "
				+ "TRAN_FILE_PATH, TRAN_FILE_NAME, TRAN_FILE_SIZE, t5.NAME AS NAME, TRAN_NAME    TRAN_NAME, TRAN_COUNT   "
				+ "TRAN_COUNT,t4.DATA_AUTH,t4.AUTHVAL from (select distinct tt.NAME AS DATA_AUTH,t1.ID  ID,t1.data_auth as AUTHVAL, t1.TRAN_CODE TRAN_CODE, t1.TRAN_DATE  TRAN_DATE, t1.TRAN_NAME TRAN_NAME, "
				+ "t1.TRAN_USER_ID USER_ID, t1.TRAN_COUNT TRAN_COUNT, t1.TRAN_FILE_NAME , t1.TRAN_FILE_PATH, t1.TRAN_FILE_REAL_NAME,"
				+ " t1.TRAN_FILE_SIZE from T_USER_TRAN t1 left join T_USER_TRAN_USER t2 on t1.ID = t2.TRAN_ID left join"
				+ " SY_USER t3 on t2.USER_ID = t3.ID left join sy_dept tt on tt.id = t1.data_auth where 1 = 1 "+sqlWhere + " order by t1.TRAN_DATE DESC)  t4 left join sy_user t5 on t4.user_id = t5.id";
		List tranList = modelService.listSql(querySql, modelAction.getPage(), map, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(tranList);
		modelAction.getAjaxPage().setDataList(tranList);
        
		return BaseActionSupport.AJAX;
	}
}
