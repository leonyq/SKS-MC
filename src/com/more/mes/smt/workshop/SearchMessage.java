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
 * 车间建模----新增---查询信息
 * 
 * @author Administrator
 *
 */
public class SearchMessage implements FuncService {

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
		String sql = "select cw.ID, cw.CALW_GROUP  from T_CO_CALENDAR cc "
				+ "  inner join T_CO_CALENDAR_WORKTIME cw on cc.id=cw.CAL_ID and cw.data_auth=? "
				+ " where cc.id=? and cc.data_auth=? ";
		List worktimeList = modelService.listDataSql(sql, new Object[] { auth, calId, auth });
		CommMethod.listToEscapeJs(worktimeList);
		modelAction.setAjaxList(worktimeList);
		return BaseActionSupport.AJAX;
	}

	// 查询工厂日历
	public String queryCalendar(ModelAction modelAction, ModelService modelService) {
		List<Object> calendarList = null;
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		Map<String, String> map = new HashMap<String, String>();
		String sql = "SELECT T.*,T1.VALUE AS SSAT_FLAG,T2.VALUE AS SSUN_FLAG,T3.VALUE AS MR_FLAG "
				+ " FROM T_CO_CALENDAR T LEFT JOIN SY_DICT_VAL t1 on t1.CODE = T.CAL_SAT_FLAG "
				+ " LEFT JOIN SY_DICT_VAL t2 on t2.CODE = T.CAL_SUN_FLAG "
				+ " LEFT JOIN SY_DICT_VAL t3 on t3.CODE = T.CAL_DEFAULT_FLAG "
				+ " WHERE t1.dict_code= :code1 and t2.dict_code= :code2 and t3.dict_code=:code3 "
				+ " and t.data_auth=:auth ";
		map.put("code1", "YOrN");
		map.put("code2", "YOrN");
		map.put("code3", "YOrN");
		map.put("auth", auth);
		calendarList = modelService.listSql(sql + " ORDER BY t.CAL_NAME ", modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(calendarList);
		return BaseActionSupport.AJAX;

	}

	// 日历列表条件查询
	public String queryCalendarByCalName(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String calName = request.getParameter("calName");
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		List calendarInfoList = null;
		List<Object> param = new ArrayList<Object>();
		Map<String, String> pMap = new HashMap<String, String>();
		String sql = "SELECT T.*,T1.VALUE AS SSAT_FLAG,T2.VALUE AS SSUN_FLAG,T3.VALUE AS MR_FLAG "
				+ " FROM T_CO_CALENDAR T LEFT JOIN SY_DICT_VAL t1 on t1.CODE = T.CAL_SAT_FLAG "
				+ " LEFT JOIN SY_DICT_VAL t2 on t2.CODE = T.CAL_SUN_FLAG "
				+ " LEFT JOIN SY_DICT_VAL t3 on t3.CODE = T.CAL_DEFAULT_FLAG ";
		String sqlWhere = " where 1=1 and t1.dict_code=:code1 "
				+ " and t2.dict_code=:code2 and t3.dict_code=:code3 and t.data_auth=:auth ";
		pMap.put("code1", "YOrN");
		pMap.put("code2", "YOrN");
		pMap.put("code3", "YOrN");
		pMap.put("auth", auth);
		if (StringUtils.isNotBlank(calName)) {
			sqlWhere += " and CAL_NAME =:calName1";
			// param.add(calName);
			pMap.put("calName1", calName);
		}
		calendarInfoList = modelService.listSql(sql + sqlWhere + " ORDER BY CAL_NAME ", modelAction.getPage(), pMap,
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
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String type = request.getParameter("type").trim();
		String sn = request.getParameter("sn");
		String eqName = request.getParameter("eqName");
		String parentType = request.getParameter("parentType");
		String trackFlag = request.getParameter("trackFlag");
		String areaSn = request.getParameter("areaSn");
		if (parentType.equals("1") && trackFlag.equals("Y")) { // 上级为线别并且为双规
			String sql = "SELECT t.*,t1.value as dstatus,t2.value as dsup,t3.supplier_name,t4.name,t5.value as DEVTYPEVALUE "
					+ " FROM T_CO_DEVICE t " + "left join SY_DICT_VAL t1 on t1.CODE = t.CD_STATUS  and t1.dict_code= ? "
					+ "left join SY_DICT_VAL t2 on t2.CODE = t.CD_VALID_FLAG  and t2.dict_code=? "
					+ "left join T_CO_SUPPLIER t3 on t3.ID = t.CD_SUPPLIER_ID and data_auth=? "
					+ "left join SY_USER t4 on t4.ID = t.CD_CHARGE_MAN "
					+ "left join sy_dict_val t5 on t5.code = t.CD_DEVICE_TYPE and t5.dict_code =? ";
			String sqlW = " and not exists(select 1 from T_CO_AREA_DEVICE tt where tt.cad_device_id=t.id "
					+ "  and tt.CA_ID NOT IN(SELECT CA_ID FROM T_CO_AREA WHERE CA_PARENTAREAID=? and data_auth=?)"
					+ " and tt.data_auth=? )" + " AND t.CD_VALID_FLAG = ? and t.data_auth=? ";
			List<Object> param = new ArrayList<Object>();
			param.add("DEVICE_STATE");
			param.add("YOrN");
			param.add(areaSn);
			param.add("DEVICE_TYPE");
			param.add(areaSn);
			param.add(auth);
			param.add(auth);
			param.add("Y");
			param.add(auth);
			if (StringUtils.isNotBlank(type)) {
				sqlW += " and  t.CD_DEVICE_TYPE=?";
				param.add(type);

			}
			if (StringUtils.isNotBlank(sn)) {
				sqlW += " and t.CD_DEVICE_SN LIKE ? || '%' ";

				param.add(sn);
			}
			if (StringUtils.isNotBlank(eqName)) {
				sqlW += " and t.CD_DEVICE_NAME LIKE ? || '%'";

				param.add(eqName);
			}
			eqInfoList = modelService.listSql(sql, modelAction.getPage(), sqlW, param, "ORDER BY CD_DEVICE_NAME ",
					null);

			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(eqInfoList);
			modelAction.getAjaxPage().setDataList(eqInfoList);
		} else {
			String sql = "SELECT t.*,t1.value as dstatus,t2.value as dsup, "
					+ " t3.supplier_name,t4.name,t5.value as DEVTYPEVALUE FROM T_CO_DEVICE t "
					+ " left join SY_DICT_VAL t1 on t1.CODE = t.CD_STATUS  and t1.dict_code= ? "
					+ " left join SY_DICT_VAL t2 on t2.CODE = t.CD_VALID_FLAG  and t2.dict_code= ? "
					+ " left join T_CO_SUPPLIER t3 on t3.ID = t.CD_SUPPLIER_ID and t3.data_auth=? "
					+ " left join SY_USER t4 on t4.ID = t.CD_CHARGE_MAN "
					+ " left join sy_dict_val t5 on t5.code = t.CD_DEVICE_TYPE and t5.dict_code = ? ";
			String sqlW = " and not exists(select 1 from T_CO_AREA_DEVICE tt " + " where tt.cad_device_id=t.id "
					+ " and tt.data_auth=? ) AND t.CD_VALID_FLAG = ? " + " and t.data_auth=? ";
			List<Object> param = new ArrayList<Object>();
			param.add("DEVICE_STATE");
			param.add("YOrN");
			param.add(auth);
			param.add("DEVICE_TYPE");
			param.add(auth);
			param.add("Y");
			param.add(auth);
			if (StringUtils.isNotBlank(type)) {
				sqlW += " and  t.CD_DEVICE_TYPE=?";
				param.add(type);

			}
			if (StringUtils.isNotBlank(sn)) {
				sqlW += " and t.CD_DEVICE_SN LIKE ? || '%' ";

				param.add(sn);
			}
			if (StringUtils.isNotBlank(eqName)) {
				sqlW += " and t.CD_DEVICE_NAME LIKE ? || '%'";

				param.add(eqName);
			}
			eqInfoList = modelService.listSql(sql, modelAction.getPage(), sqlW, param, "ORDER BY CD_DEVICE_NAME ",
					null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(eqInfoList);
			modelAction.getAjaxPage().setDataList(eqInfoList);
		}
		return BaseActionSupport.AJAX;
	}

	// 设备信息查询 状态 有效标志
	public String queryWorkInfo(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String parentType = request.getParameter("parentType");
		String trackFlag = request.getParameter("trackFlag");
		String areaSn = request.getParameter("areaSn");
		Map<String, String> map = new HashMap<String, String>();
		List workShopList = null;
		if (parentType.equals("1") && trackFlag.equals("Y")) { // 上级为线别并且为双规
			String sql = "SELECT t.*,t1.value as dstatus,t2.value as dsup,t3.supplier_name, "
					+ " t4.name,t5.value as DEVTYPEVALUE FROM T_CO_DEVICE t "
					+ " left join SY_DICT_VAL t1 on t1.CODE = t.CD_STATUS and t1.dict_code=:DEVICE_STATE "
					+ " left join SY_DICT_VAL t2 on t2.CODE = t.CD_VALID_FLAG and t2.dict_code= :YOrN "
					+ " left join T_CO_SUPPLIER t3 on t3.ID = t.CD_SUPPLIER_ID and t3.data_auth=:auth "
					+ " left join SY_USER t4 on t4.ID = t.CD_CHARGE_MAN "
					+ " left join sy_dict_val t5 on t5.code = t.CD_DEVICE_TYPE and t5.dict_code =:DEVICE_TYPE "
					+ " where not exists(select 1 from T_CO_AREA_DEVICE tt " + " where tt.cad_device_id=t.id "
					+ " and tt.CA_ID NOT IN(SELECT CA_ID FROM T_CO_AREA WHERE CA_PARENTAREAID=:areaSn "
					+ " and data_auth=:auth ) and tt.data_auth=:auth )"
					+ " AND t.CD_VALID_FLAG =:FLAG and t.data_auth=:auth ";
			map.put("DEVICE_STATE", "DEVICE_STATE");
			map.put("YOrN", "YOrN");
			map.put("auth", auth);
			map.put("DEVICE_TYPE", "DEVICE_TYPE");
			map.put("areaSn", areaSn);
			map.put("FLAG", "Y");
			// modelService.listSql(sql, modelAction.getPage(), null,param, "ORDER BY
			// t.CD_DEVICE_NAME ", null);
			workShopList = modelService.listSql(sql + " ORDER BY t.CD_DEVICE_NAME ", modelAction.getPage(), map, null,
					null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(workShopList);
			modelAction.getAjaxPage().setDataList(workShopList);
		} else {
			String sql = "SELECT t.*,t1.value as dstatus,t2.value as dsup,t3.supplier_name, "
					+ " t4.name,t5.value as DEVTYPEVALUE FROM T_CO_DEVICE t "
					+ " left join SY_DICT_VAL t1 on t1.CODE = t.CD_STATUS and t1.dict_code=:DEVICE_STATE "
					+ " left join SY_DICT_VAL t2 on t2.CODE = t.CD_VALID_FLAG and t2.dict_code= :YOrN "
					+ " left join T_CO_SUPPLIER t3 on t3.ID = t.CD_SUPPLIER_ID "
					+ " left join SY_USER t4 on t4.ID = t.CD_CHARGE_MAN "
					+ " left join sy_dict_val t5 on t5.code = t.CD_DEVICE_TYPE and t5.dict_code =:DEVICE_TYPE "
					+ " where not exists(select 1 from T_CO_AREA_DEVICE tt where tt.cad_device_id=t.id "
					+ " and tt.data_auth=:auth ) " + " AND t.CD_VALID_FLAG =:FLAG and t.data_auth=:auth ";
			map.put("DEVICE_STATE", "DEVICE_STATE");
			map.put("YOrN", "YOrN");
			map.put("DEVICE_TYPE", "DEVICE_TYPE");
			map.put("auth", auth);
			map.put("FLAG", "Y");
			workShopList = modelService.listSql(sql + " ORDER BY t.CD_DEVICE_NAME ", modelAction.getPage(), map, null,
					null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(workShopList);
			modelAction.getAjaxPage().setDataList(workShopList);
		} // modelAction.setAjaxList(workShopList);

		return BaseActionSupport.AJAX;
	}

	// 员工列表查询
	public String queryUserList(ModelAction modelAction, ModelService modelService) {
		List userList = null;
		String dataAuth=(String) modelAction.getRequest().getSession().getAttribute("mcDataAuth");
		Map<String, String> map = new HashMap<String, String>();
		String sql = "SELECT T2.ID, T2.LOGIN_NAME,T2. NAME,T3. NAME deptName,t1.VALUE FROM sy_dict_val t1,sy_user t2,sy_dept t3 "
				+ "WHERE T1.code = T2.ENABLE AND T1.dict_code =:USER_STATE1 AND t2.dept_id = t3.ID AND T2.ENABLE =:ENABLE"
				+ " and t2.data_auth=:auth ";
		map.put("USER_STATE1", "USER_STATE");
		map.put("ENABLE", "1");
		map.put("auth", dataAuth);
		userList = modelService.listSql(sql + " ORDER BY t2.NAME ", modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(userList);
		modelAction.getAjaxPage().setDataList(userList);
		return BaseActionSupport.AJAX;

	}

	// 员工列表条件查询
	public String queryUserListBy(ModelAction modelAction, ModelService modelService) {
		List userList = null;
		String dataAuth=(String) modelAction.getRequest().getSession().getAttribute("mcDataAuth");
		HttpServletRequest request = modelAction.getRequest();
		String logName = request.getParameter("logName");
		String userName = request.getParameter("userName");
		String dept = request.getParameter("dept");
		Map<String, String> map = new HashMap<String, String>();
		String sql = "select ID,LOGIN_NAME,NAME,deptName,VALUE from ( "
				+ " SELECT T2.ID, T2.LOGIN_NAME,T2. NAME,T3. NAME deptName,T3. ID deptId,t1.VALUE "
				+ " FROM sy_dict_val t1,sy_user t2,sy_dept t3 "
				+ " WHERE T1.code = T2.ENABLE AND T1.dict_code =:USER_STATE1 "
				+ " AND t2.dept_id = t3.ID AND T2.ENABLE =:ENABLE1 and t2.data_auth=:auth   )  poe";
		map.put("USER_STATE1", "USER_STATE");
		map.put("ENABLE1", "1");
		map.put("auth", dataAuth);
		String sqlWhere = " where 1=1 ";
		List<Object> param = new ArrayList<Object>();
		if (StringUtils.isNotBlank(logName)) {
			sqlWhere += " and  LOGIN_NAME LIKE :logName1 || '%' ";

			map.put("logName1", logName);
			// param.add(logName);

		}
		if (StringUtils.isNotBlank(userName)) {
			sqlWhere += " and NAME LIKE :userName1 || '%' ";
			map.put("userName1", userName);
			// param.add(userName);
		}
		if (StringUtils.isNotBlank(dept)) {
			sqlWhere += " and deptId =:dept1 ";
			map.put("dept1", dept);
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
		List orderList = null;
		String sql = "SELECT t.* FROM t_command_set t ";
		String sqlW = " and 1=1 ";
		// String sqlW = " and not exists (select TCS_CODE FROM T_WORKSTATION_CMD t2
		// where t.TCS_CODE = t2.TCS_CODE ) ";
		orderList = modelService.listSql(sql, modelAction.getPage(), sqlW, null, "ORDER BY t.tcs_code ", null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(orderList);
		modelAction.getAjaxPage().setDataList(orderList);

		return BaseActionSupport.AJAX;
	}

	// 指令信息条件查询
	public String queryOrderfoBy(ModelAction modelAction, ModelService modelService) {
		List orderInfoList = null;
		Map<String, String> map = new HashMap<String, String>();
		HttpServletRequest request = modelAction.getRequest();
		String searchOrderCode = CommMethod.escapeJs(request.getParameter("searchOrderCode").trim());
		String searchOrderName = CommMethod.escapeJs(request.getParameter("searchOrderName").trim());

		// String sql="SELECT * FROM t_command_set ";
		// String sqlW=" ";
		String sql = "SELECT t.* FROM t_command_set t ";
		String sqlW = " where 1=1 ";
		// String sqlW=" and not exists (select TCS_CODE FROM T_WORKSTATION_CMD t2 where
		// t.TCS_CODE = t2.TCS_CODE ) ";
		List<Object> param = new ArrayList<Object>();
		if (StringUtils.isNotBlank(searchOrderCode)) {
			sqlW += " and  TCS_CODE=:searchOrderCode1";
			map.put("searchOrderCode1", searchOrderCode);
			// param.add(searchOrderCode);

		}
		if (StringUtils.isNotBlank(searchOrderName)) {
			sqlW += " and TCS_NAME=:searchOrderName1 ";
			map.put("searchOrderName1", searchOrderName);
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
