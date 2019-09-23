package com.more.mes.smt.maintenance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 产品维修----加载产品不良信息
 * 
 * @author Administrator
 *
 */
public class MaintenanceAdd implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest t = modelAction.getRequest();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
		String weSn = t.getParameter("weSn");
		String type = t.getParameter("type");
		String resString = "";
		String auth = t.getSession().getAttribute("mcDataAuth").toString();
		String tempSql = "SELECT T.* FROM T_WIP_TRACKING T WHERE T.WT_SN=? and T.DATA_AUTH=?";
		tempList = modelService.listDataSql(tempSql, new Object[] { weSn, auth });

		if ((tempList == null) || tempList.isEmpty()) {
			resString = "FALSE";
		}
		if ("queryErrorList".equals(type)) {
			if (!"FALSE".equals(resString)) {
				String work_station = t.getParameter("work_station");
				String flag = t.getParameter("flag");
				if ("check".equals(flag)) {
					ProFuncDto pf = new ProFuncDto();
					int[] inPlace = { 1, 2, 3, 4 };
					int[] outplace = { 5 };
					List<Object> list = new ArrayList<Object>();
					list.add(auth);
					list.add(weSn);
					list.add("");
					list.add(work_station);
					List outType = new ArrayList<Object>();
					outType.add("String");
					pf.setClassName("P_C_CHECK_SN_ROUTE");// 存储过程的名字
					pf.setInPlace(inPlace);// 存储过程中in
					pf.setOutPlace(outplace); // 存储过程中out
					pf.setValArgs(list);// 存储过程中输入的参数
					pf.setTotalLen(list.size() + outType.size());// 总个数
					pf.setOutValType(outType);// 输出的参数
					List<Object> relist = modelService.procComm(pf);// 接收返回值
					String res = StringUtils.toString(relist.get(0));
					if (!"OK".equalsIgnoreCase(res)) {
						if (res.startsWith("NG:"))
							res = res.substring(3);
						modelAction.setAjaxString(res);
						return BaseActionSupport.AJAX;
					}
				}

				String sql = "SELECT T.ID, T.WE_ERROR_CODE,  A.CEC_DESC, T.WE_POINT, T.WE_TEST_GROUP,    B.GROUP_NAME,   T.WE_WORK_STATION, T.WE_REPAIR_FLAG,"
						+ "  C.CA_NAME,  (CASE WHEN T.WE_REPAIR_FLAG='0' THEN '待维修' WHEN T.WE_REPAIR_FLAG='1' THEN  '已维修' END ) WE_REPAIR_FLAG_NAME,"
						+ "  TO_CHAR(T.WE_TEST_TIME, 'YYYY-MM-DD HH24:MI:SS') WE_TEST_TIME,D.NAME,T.WE_ERROR_IMG "
						+ "  FROM T_WIP_ERROR T   "
						+ "LEFT JOIN T_CO_ERROR_CODE A    ON A.CEC_CODE = T.WE_ERROR_CODE and a.DATA_AUTH=t.DATA_AUTH "
						+ "  LEFT JOIN T_CO_GROUP B ON B.GROUP_CODE=T.WE_TEST_GROUP and b.DATA_AUTH=t.data_auth "
						+ "LEFT JOIN T_CO_AREA C ON C.CA_ID=T.WE_WORK_STATION and c.DATA_AUTH=t.data_auth "
						+ " LEFT JOIN SY_USER D ON D.LOGIN_NAME=T.WE_TEST_EMP "
						+ " WHERE T.WE_SN =? and t.DATA_AUTH=?   " + "ORDER BY T.WE_REPAIR_FLAG ASC,WE_TEST_TIME DESC ";

				List sList = modelService.listDataSql(sql, new Object[] { weSn, auth });

				String sql2 = "SELECT T.WT_SN, " + " T.WT_MO_NUMBER, " + " T.WT_MODEL_CODE, " + " T1.CI_ITEM_NAME, "
						+ " T1.CI_ITEM_SPEC," + " 'up_load/comm/' || CB_BOTTOM_FILE_NAME GDO_BOTTOM, "
						+ " 'up_load/comm/' || CB_TOP_FILE_NAME GDO_TOP, "
						+ " 'up_load/comm/' || CB_DRAW_FILE_NAME VB_AIS," + " T2.ID BOM_ID " + " FROM T_WIP_TRACKING T "
						+ " LEFT JOIN T_CO_ITEM T1 ON T1.CI_ITEM_CODE = T.WT_MODEL_CODE and t1.DATA_AUTH=t.DATA_AUTH "
						+ " LEFT JOIN T_CO_BOM T2 ON T2.CB_ITEM_CODE=T.WT_MODEL_CODE AND T2.CB_DEFAULT='Y' AND T2.DATA_AUTH=t.DATA_AUTH "
						+ " WHERE  T.WT_SN=?  and t.DATA_AUTH=?  ";

				map = modelService.queryForMap(sql2, new Object[] { weSn, auth });
				if (!map.isEmpty()) {
					Map<String, Object> tempMap1 = new HashMap<String, Object>();
					String moNum = StringUtils.toString(map.get("WT_MO_NUMBER"));
					String sql3 = "SELECT T.PM_REPAIR_MAX  FROM T_PM_MO_BASE T"
							+ " WHERE T.PM_MO_NUMBER=? and t.DATA_AUTH=? ";

					tempMap1 = modelService.queryForMap(sql3, new Object[] { moNum, auth });

					Map<String, Object> tempMap2 = new HashMap<String, Object>();
					String sql4 = "SELECT COUNT(*) L_COUNT FROM T_WIP_REPAIR T "
							+ " WHERE T.WR_SN=? AND T.WR_FINISH_FLAG=? and t.DATA_AUTH=? ";

					tempMap2 = modelService.queryForMap(sql4, new Object[] { weSn, "Y", auth });

					int repairMax = Integer.parseInt(StringUtils.toString(tempMap1.get("PM_REPAIR_MAX")));
					if (repairMax != 0) {
						int lCount = Integer.parseInt(StringUtils.toString(tempMap2.get("L_COUNT")));
						if (repairMax <= lCount) {
							resString = "REPAIRMAXERROR";
						}
					}
				}
				// 获取点位信息
				if (map != null && !map.isEmpty()) {
					sql = "SELECT " + "\n" + "TCC_BOM_ID bom_id,\n" + "TCC_POINT code,\n" + "TCC_PACK pack,\n"
							+ "TCC_ROTATION rotation,\n" + "TCC_XAXIS x,\n" + "TCC_YAXIS y,\n"
							+ "TCC_FACE face FROM T_XA_COORDINATE_CONTENT WHERE TCC_BOM_ID=?";

					List<Map> mItemList = modelService.listDataSql(sql, new Object[] { map.get("BOM_ID") });

					map.put("coor_content", mItemList);
				}
				modelAction.setAjaxList(sList);
			}
			modelAction.setAjaxString(resString);
			modelAction.setAjaxMap(map);
			return BaseActionSupport.AJAX;
		}
		return null;

	}
}
