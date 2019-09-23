package com.more.mes.smt.workshop;

import java.util.ArrayList;
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
 * 车间建模----修改---查询信息
 * 
 * @author Administrator
 *
 */
public class SearchMessageForEdit implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		int flag = Integer.parseInt(request.getParameter("flag"));
		switch (flag)

		{

		case 1:

			return this.queryCalwGroup1(modelAction, modelService);

		case 2:

			return this.queryCalendar(modelAction, modelService);

		case 3:

			return this.queryCalendarByCalName(modelAction, modelService);

		case 4:

			return this.queryEqinfoBy(modelAction, modelService);

		case 5:

			return this.queryWorkInfo(modelAction, modelService);

		case 6:

			return this.queryUserList(modelAction, modelService);

		case 7:

			return this.queryUserListBy(modelAction, modelService);

		case 8:

			return this.queryOrderCode(modelAction, modelService);

		case 9:

			return this.queryOrderfoBy(modelAction, modelService);

		default:

			return BaseActionSupport.AJAX;

		}
	}

	// 查询班别
	public String queryCalwGroup1(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String calId = request.getParameter("calId");
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sql = "select cw.ID, cw.CALW_GROUP " + " from T_CO_CALENDAR cc "
				+ " inner join T_CO_CALENDAR_WORKTIME cw on cc.id=cw.CAL_ID and cw.data_auth=? "
				+ " where cc.id=? and cc.data_auth=? ";
		List worktimeList = modelService.listDataSql(sql, new Object[] { auth, calId, auth });
		CommMethod.listToEscapeJs(worktimeList);
		modelAction.setAjaxList(worktimeList);
		return BaseActionSupport.AJAX;
	}

	// 查询工厂日历
	public String queryCalendar(ModelAction modelAction, ModelService modelService) {
		List calendarList = null;
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		Map<String, String> map = new HashMap<String, String>();
		String sql = "SELECT T.*,T1.VALUE AS SSAT_FLAG,T2.VALUE AS SSUN_FLAG, " + " T3.VALUE AS MR_FLAG "
				+ " FROM T_CO_CALENDAR T " + " LEFT JOIN SY_DICT_VAL t1 on t1.CODE = T.CAL_SAT_FLAG "
				+ "LEFT JOIN SY_DICT_VAL t2 on t2.CODE = T.CAL_SUN_FLAG "
				+ "LEFT JOIN SY_DICT_VAL t3 on t3.CODE = T.CAL_DEFAULT_FLAG "
				+ " WHERE t1.dict_code=:dict_code1 and t2.dict_code=:dict_code2 "
				+ " and t3.dict_code=:dict_code3 and t.data_auth=:auth ";
		map.put("dict_code1", "YOrN");
		map.put("dict_code2", "YOrN");
		map.put("dict_code3", "YOrN");
		map.put("auth", auth);
		calendarList = modelService.listSql(sql + " ORDER BY t.CAL_NAME ", modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(calendarList);
		modelAction.getAjaxPage().setDataList(calendarList);
		return BaseActionSupport.AJAX;

	}

	// 日历列表条件查询
	public String queryCalendarByCalName(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String calName = request.getParameter("calName");
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		List calendarInfoList = null;
		Map<String, String> map = new HashMap<String, String>();
		List<Object> param = new ArrayList<Object>();
		String sql = "SELECT T.*,T1.VALUE AS SSAT_FLAG,T2.VALUE AS SSUN_FLAG, " + " T3.VALUE AS MR_FLAG "
				+ " FROM T_CO_CALENDAR T " + " LEFT JOIN SY_DICT_VAL t1 on t1.CODE = T.CAL_SAT_FLAG "
				+ "LEFT JOIN SY_DICT_VAL t2 on t2.CODE = T.CAL_SUN_FLAG "
				+ "LEFT JOIN SY_DICT_VAL t3 on t3.CODE = T.CAL_DEFAULT_FLAG ";
		String sqlWhere = " where 1 = 1 and t1.dict_code=:dict_code1 "
				+ " and t2.dict_code=:dict_code2 and t3.dict_code=:dict_code3 and t.data_auth=:auth ";
		map.put("dict_code1", "YOrN");
		map.put("dict_code2", "YOrN");
		map.put("dict_code3", "YOrN");
		map.put("auth", auth);
		if (StringUtils.isNotBlank(calName)) {
			sqlWhere += " and CAL_NAME =:calName1";
			map.put("calName1", calName);
			// param.add(calName);

		}
		calendarInfoList = modelService.listSql(sql + sqlWhere + " ORDER BY CAL_NAME ", modelAction.getPage(), map,
				null, null);
		// modelAction.setAjaxList(calendarInfoList);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(calendarInfoList);
		modelAction.getAjaxPage().setDataList(calendarInfoList);
		return BaseActionSupport.AJAX;
	}

	// 设备信息条件查询
	public String queryEqinfoBy(ModelAction modelAction, ModelService modelService) {
		List eqInfoList = null;
		Map<String, String> map = new HashMap<String, String>();
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String type = request.getParameter("type").trim();
		String sn = request.getParameter("sn");
		String eqName = request.getParameter("eqName");
		String parentType = request.getParameter("parentType");
		String trackFlag = request.getParameter("trackFlag");
		String areaSn = request.getParameter("areaSn");
		if (parentType.equals("1") && trackFlag.equals("Y")) { // 上级为线别并且为双规
			String sql = "SELECT t.*,t1.value as dstatus,t2.value as dsup,t3.supplier_name, "
					+ " t4.name,t5.value as DEVTYPEVALUE FROM T_CO_DEVICE t "
					+ " left join SY_DICT_VAL t1 on t1.CODE = t.CD_STATUS  and t1.dict_code= :DEVICE_STATE1 "
					+ " left join SY_DICT_VAL t2 on t2.CODE = t.CD_VALID_FLAG  and t2.dict_code= :dict_code1 "
					+ " left join T_CO_SUPPLIER t3 on t3.ID = t.CD_SUPPLIER_ID and t3.data_auth=:auth "
					+ " left join SY_USER t4 on t4.ID = t.CD_CHARGE_MAN "
					+ " left join sy_dict_val t5 on t5.code = t.CD_DEVICE_TYPE and t5.dict_code =:DEVICE_TYPE1 ";
			String sqlW = " where 1=1 and t.data_auth=:auth " + " and not exists(select 1 from T_CO_AREA_DEVICE tt "
					+ " where tt.cad_device_id=t.id "
					+ " and tt.data_auth=:auth and tt.CA_ID NOT IN(SELECT CA_ID FROM T_CO_AREA "
					+ " WHERE CA_PARENTAREAID=:areaSn1 and data_auth=:auth )) "
					+ " AND t.CD_VALID_FLAG =:CD_VALID_FLAG1 ";
			map.put("DEVICE_STATE1", "DEVICE_STATE");
			map.put("dict_code1", "YOrN");
			map.put("DEVICE_TYPE1", "DEVICE_TYPE");
			map.put("areaSn1", areaSn);
			map.put("auth", auth);
			map.put("CD_VALID_FLAG1", "Y");
			List<Object> param = new ArrayList<Object>();
			// param.add(areaSn);
			if (StringUtils.isNotBlank(type)) {
				sqlW += " and  t.CD_DEVICE_TYPE=:type1";
				map.put("type1", type);

				// param.add(type);

			}
			if (StringUtils.isNotBlank(sn)) {
				sqlW += " and t.CD_DEVICE_SN LIKE :sn1 || '%' ";
				map.put("sn1", sn);
				// param.add(sn);
			}
			if (StringUtils.isNotBlank(eqName)) {
				sqlW += " and t.CD_DEVICE_NAME LIKE :eqName1 || '%'";
				map.put("eqName1", eqName);
				// param.add(eqName);
			}
			eqInfoList = modelService.listSql(sql + sqlW + " ORDER BY CD_DEVICE_NAME ", modelAction.getPage(), map,
					null, null);

			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(eqInfoList);
			modelAction.getAjaxPage().setDataList(eqInfoList);
		} else {
			String sql = "SELECT t.*,t1.value as dstatus,t2.value as dsup,t3.supplier_name,t4.name,t5.value as DEVTYPEVALUE FROM T_CO_DEVICE t "
					+ "left join SY_DICT_VAL t1 on t1.CODE = t.CD_STATUS  and t1.dict_code=:DEVICE_STATE1 "
					+ "left join SY_DICT_VAL t2 on t2.CODE = t.CD_VALID_FLAG  and t2.dict_code=:dict_code1 "
					+ "left join T_CO_SUPPLIER t3 on t3.ID = t.CD_SUPPLIER_ID and t3.data_auth=:auth "
					+ "left join SY_USER t4 on t4.ID = t.CD_CHARGE_MAN "
					+ "left join sy_dict_val t5 on t5.code = t.CD_DEVICE_TYPE and t5.dict_code =:DEVICE_TYPE1 ";
			String sqlW = " where 1=1 " + " and not exists(select 1 from T_CO_AREA_DEVICE tt "
					+ " where tt.cad_device_id=t.id and tt.data_auth=:auth ) "
					+ " AND t.CD_VALID_FLAG =:CD_VALID_FLAG1 and t.data_auth=:auth  ";
			map.put("DEVICE_STATE1", "DEVICE_STATE");
			map.put("dict_code1", "YOrN");
			map.put("DEVICE_TYPE1", "DEVICE_TYPE");
			map.put("CD_VALID_FLAG1", "Y");
			map.put("auth", auth);
			List<Object> param = new ArrayList<Object>();
			if (StringUtils.isNotBlank(type)) {
				sqlW += " and  t.CD_DEVICE_TYPE=:type1";
				map.put("type1", type);
				// param.add(type);

			}
			if (StringUtils.isNotBlank(sn)) {
				sqlW += " and t.CD_DEVICE_SN LIKE :sn1 || '%' ";
				map.put("sn1", sn);
				// param.add(sn);
			}
			if (StringUtils.isNotBlank(eqName)) {
				sqlW += " and t.CD_DEVICE_NAME LIKE :eqName || '%' ";
				map.put("eqName", eqName);
				param.add(eqName);
			}
			eqInfoList = modelService.listSql(sql + sqlW + " ORDER BY CD_DEVICE_NAME ", modelAction.getPage(), map,
					null, null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(eqInfoList);
			modelAction.getAjaxPage().setDataList(eqInfoList);
		}
		return BaseActionSupport.AJAX;
	}

	// 设备信息查询 状态 有效标志
	public String queryWorkInfo(ModelAction modelAction, ModelService modelService) {
		List workShopList = null;
		HttpServletRequest request = modelAction.getRequest();
		String parentType = request.getParameter("parentType");
		String trackFlag = request.getParameter("trackFlag");
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String areaSn = request.getParameter("areaSn");
		Map<String, String> map = new HashMap<String, String>();
		if (parentType.equals("1") && trackFlag.equals("Y")) { // 上级为线别并且为双规
			String sql = "SELECT t.*,t1.value as dstatus,t2.value as dsup,t3.supplier_name,t4.name,t5.value as DEVTYPEVALUE FROM T_CO_DEVICE t "
					+ "left join SY_DICT_VAL t1 on t1.CODE = t.CD_STATUS and t1.dict_code= :DEVICE_STATE1 "
					+ "left join SY_DICT_VAL t2 on t2.CODE = t.CD_VALID_FLAG and t2.dict_code=:dict_code1 "
					+ "left join T_CO_SUPPLIER t3 on t3.ID = t.CD_SUPPLIER_ID  and t.data_auth=:auth  "
					+ "left join SY_USER t4 on t4.ID = t.CD_CHARGE_MAN "
					+ "left join sy_dict_val t5 on t5.code = t.CD_DEVICE_TYPE and t5.dict_code =:DEVICE_TYPE1 "
					+ "where not exists(select 1 from T_CO_AREA_DEVICE tt " + " where tt.cad_device_id=t.id "
					+ " and tt.CA_ID NOT IN(SELECT CA_ID FROM T_CO_AREA WHERE CA_PARENTAREAID=:areaSn "
					+ " and data_auth=:auth ) " + " and tt.data_auth=:auth  ) "
					+ " AND t.CD_VALID_FLAG =:CD_VALID_FLAG1 " + " and t.data_auth=:auth ";
			map.put("DEVICE_STATE1", "DEVICE_STATE");
			map.put("dict_code1", "YOrN");
			map.put("DEVICE_TYPE1", "DEVICE_TYPE");
			map.put("areaSn", areaSn);
			map.put("CD_VALID_FLAG1", "Y");
			map.put("auth", auth);
			// modelService.listSql(sql, modelAction.getPage(), null,param, "ORDER BY
			// t.CD_DEVICE_NAME ", null);
			workShopList = modelService.listSql(sql + " ORDER BY t.CD_DEVICE_NAME ", modelAction.getPage(), map, null,
					null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(workShopList);
			modelAction.getAjaxPage().setDataList(workShopList);
		} else {
			String sql = "SELECT t.*,t1.value as dstatus,t2.value as dsup,t3.supplier_name,t4.name,t5.value as DEVTYPEVALUE FROM T_CO_DEVICE t "
					+ "left join SY_DICT_VAL t1 on t1.CODE = t.CD_STATUS and t1.dict_code=:DEVICE_STATE1 "
					+ "left join SY_DICT_VAL t2 on t2.CODE = t.CD_VALID_FLAG and t2.dict_code=:dict_code1 "
					+ "left join T_CO_SUPPLIER t3 on t3.ID = t.CD_SUPPLIER_ID and t3.data_auth=:auth "
					+ "left join SY_USER t4 on t4.ID = t.CD_CHARGE_MAN "
					+ "left join sy_dict_val t5 on t5.code = t.CD_DEVICE_TYPE and t5.dict_code =:DEVICE_TYPE1 "
					+ "where not exists(select 1 from T_CO_AREA_DEVICE "
					+ " tt where tt.cad_device_id=t.id and tt.data_auth=:auth) "
					+ " AND t.CD_VALID_FLAG =:CD_VALID_FLAG1 " + " and t.data_auth=:auth ";
			map.put("DEVICE_STATE1", "DEVICE_STATE");
			map.put("dict_code1", "YOrN");
			map.put("DEVICE_TYPE1", "DEVICE_TYPE");
			map.put("CD_VALID_FLAG1", "Y");
			map.put("auth", auth);
			workShopList = modelService.listSql(sql + " ORDER BY t.CD_DEVICE_NAME ", modelAction.getPage(), map, null,
					null);
			// modelAction.setAjaxList(workShopList);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(workShopList);
			modelAction.getAjaxPage().setDataList(workShopList);
		}
		return BaseActionSupport.AJAX;
	}

	// 员工列表查询
	public String queryUserList(ModelAction modelAction, ModelService modelService) {
		List userList = null;
		Map<String, String> map = new HashMap<String, String>();
		String sql = "SELECT T2.ID, T2.LOGIN_NAME,T2. NAME,T3. NAME deptName,t1.VALUE FROM sy_dict_val t1,sy_user t2,sy_dept t3 "
				+ "WHERE T1.code = T2.ENABLE AND T1.dict_code =:USER_STATE1 AND t2.dept_id = t3.ID AND T2.ENABLE =:ENABLE1 ";
		map.put("USER_STATE1", "USER_STATE");
		map.put("ENABLE1", "1");
		userList = modelService.listSql(sql + " ORDER BY t2.NAME ", modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(userList);
		modelAction.getAjaxPage().setDataList(userList);
		return BaseActionSupport.AJAX;

	}

	// 员工列表条件查询
	public String queryUserListBy(ModelAction modelAction, ModelService modelService) {
		List userList = null;
		HttpServletRequest request = modelAction.getRequest();
		String logName = request.getParameter("logName");
		String userName = request.getParameter("userName");
		String dept = request.getParameter("dept");
		Map<String, String> map = new HashMap<String, String>();
		String sql = "select ID,LOGIN_NAME,NAME,deptName,VALUE from (SELECT T2.ID, T2.LOGIN_NAME,T2. NAME,T3. NAME deptName,T3.ID deptId,t1.VALUE FROM sy_dict_val t1,sy_user t2,sy_dept t3 "
				+ "WHERE T1.code = T2.ENABLE AND T1.dict_code =:USER_STATE1 AND t2.dept_id = t3.ID AND T2.ENABLE =:ENABLE1)  fod";
		map.put("USER_STATE1", "USER_STATE");
		map.put("ENABLE1", "1");
		String sqlWhere = " where 1=1 ";
		List<Object> param = new ArrayList<Object>();
		if (StringUtils.isNotBlank(logName)) {
			sqlWhere += " and  LOGIN_NAME LIKE :logName || '%'";
			// param.add(logName);
			map.put("logName", logName);

		}
		if (StringUtils.isNotBlank(userName)) {
			sqlWhere += " and NAME LIKE :userName || '%' ";
			map.put("userName", userName);
			// param.add(userName);
		}
		if (StringUtils.isNotBlank(dept)) {
			sqlWhere += " and deptId = :dept ";
			map.put("dept", dept);
			// param.add(dept);
		}
		userList = modelService.listSql(sql + sqlWhere + " ORDER BY NAME ", modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(userList);
		modelAction.getAjaxPage().setDataList(userList);
		// modelAction.setAjaxList(userList);

		return BaseActionSupport.AJAX;
	}

	// 查询指令集
	public String queryOrderCode(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		List orderList = null;
		String calId = request.getParameter("gzzx");
		Map<String, String> map = new HashMap<String, String>();
		String sql = "SELECT t.* FROM t_command_set t ";
		// String sqlW = "and TCS_CODE='jueshinidecuo' ";
		// String sqlW = " and 1=1 ";
		String sqlW = " where 1=1 and not exists (select TCS_CODE FROM  T_WORKSTATION_CMD t2  where t.TCS_CODE = t2.TCS_CODE and t2.TW_STATIONSN = :calId ) ";
		map.put("calId", calId);
		orderList = modelService.listSql(sql + sqlW + " ORDER BY t.tcs_code ", modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(orderList);
		modelAction.getAjaxPage().setDataList(orderList);

		return BaseActionSupport.AJAX;
	}

	// 指令信息条件查询
	public String queryOrderfoBy(ModelAction modelAction, ModelService modelService) {
		List orderInfoList = null;
		HttpServletRequest request = modelAction.getRequest();
		String searchOrderCode = request.getParameter("searchOrderCode").trim();
		String searchOrderName = request.getParameter("searchOrderName").trim();
		String caId = request.getParameter("gzzx");
		Map<String, String> map = new HashMap<String, String>();
		// String sql="SELECT * FROM t_command_set ";
		// String sqlW=" ";
		String sql = "SELECT t.* FROM t_command_set t ";
		// String sqlW = " and 1=1 ";
		String sqlW = "where 1=1 and not exists (select TCS_CODE FROM  T_WORKSTATION_CMD t2  where t.TCS_CODE = t2.TCS_CODE and t2.TW_STATIONSN =:caId ) ";
		map.put("caId", caId);
		List<Object> param = new ArrayList<Object>();
		if (StringUtils.isNotBlank(searchOrderCode)) {
			sqlW += " and  TCS_CODE=:searchOrderCode ";
			map.put("searchOrderCode", searchOrderCode);
			// param.add(searchOrderCode);

		}
		if (StringUtils.isNotBlank(searchOrderName)) {
			sqlW += " and TCS_NAME=:searchOrderName ";
			map.put("searchOrderName", searchOrderName);
			// param.add(searchOrderName);
		}

		orderInfoList = modelService.listSql(sql + sqlW + " ORDER BY TCS_CODE ", modelAction.getPage(), map, null,
				null);

		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(orderInfoList);
		modelAction.getAjaxPage().setDataList(orderInfoList);

		return BaseActionSupport.AJAX;

	}
}
