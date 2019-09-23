package com.more.mes.smt.maintenance.oracle;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

import net.sf.json.JSONArray;

/**
 * @Title 产品维修-----添加不良---操作类
 * @description
 * @ClassName ProductError
 * @author msad013
 * @version 1.0 developer 2017-6-16 created
 * @see ProductError
 * @since 2017-7-24
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ProductErrorInfo implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest t = modelAction.getRequest();
		String formId = t.getParameter("formId");
		String auth = t.getSession().getAttribute("mcDataAuth").toString();
		if (StringUtils.isBlank(formId)) {
			formId = t.getParameter("formIds");
		}
		String iframeId = t.getParameter("iframeId");

		String type = t.getParameter("type");
		String dataAuth = auth;// 数据权限
		String sql = null;
		List<Map> sList = null;
		if ("1".equals(type)) {
			String errorCode = t.getParameter("errorCode");
			sql = "select t.cec_desc from T_CO_ERROR_CODE t where t.CEC_CODE = ? and t.DATA_AUTH=? ";
			sList = modelService.listDataSql(sql, new Object[] { errorCode, auth });
			modelAction.setAjaxList(sList);
			return BaseActionSupport.AJAX;

		}
		if ("save".equals(type))// 添加不良保存
		{
			String workStation = t.getParameter("paraMap1@0#WT_WORK_STATION");// 工作中心

			String weSn = t.getParameter("paraMap1@0#WE_SN");
			sql = "select * from T_WIP_TRACKING where WT_SN = ? and DATA_AUTH=? ";
			sList = modelService.listDataSql(sql, new Object[] { weSn, auth });
			Map smap = new HashMap();
			if (sList != null && sList.size() > 0) {
				smap = sList.get(0);
			}

			String sql1 = "SELECT T.CA_GROUP  FROM T_CO_AREA T WHERE T.CA_ID = ?  AND ROWNUM = ?";

			// List<Map> list2 = modelService.listDataSql(sql1, new
			// Object[]{workStation,"1"});

			// String groupCode =list2.get(0).get("CA_GROUP").toString();

			String weLot = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd");
			java.sql.Timestamp timestamp = new java.sql.Timestamp(DateUtil.getCurDate().getTime());

			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = { 1, 2, 3 };
			int[] outplace = { 4, 5, 6, 7, 8, 9, 10 };
			List<Object> list = new ArrayList<Object>();
			List outType = new ArrayList<Object>();

			list.add(auth);
			list.add(timestamp);
			list.add(smap.get("WT_WORK_STATION"));
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			pf.setClassName("P_C_GET_PERIOD");// 存储过程的名字
			pf.setInPlace(inPlace);// 存储过程中in
			pf.setOutPlace(outplace); // 存储过程中out
			pf.setValArgs(list);// 存储过程中输入的参数
			pf.setTotalLen(list.size() + outType.size());// 总个数
			pf.setOutValType(outType);// 输出的参数
			List<Object> relist = modelService.procComm(pf);// 接收返回值
			String res = StringUtils.toString(relist.get(6));
			if (!"OK".equalsIgnoreCase(res)) {
				if (res.startsWith("NG:"))
					res = res.substring(3);
				modelAction.setAjaxString(res);
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				// return modelAction.AJAX;
				// String alertMsg = modelAction.getText(res);
				return modelAction.alertParentInfo(res);
			}

			String wePeriod = StringUtils.toString(relist.get(1));

			String weWorkGroup = StringUtils.toString(relist.get(2));

			TableDataMapExt tdMap = new TableDataMapExt();
			tdMap.setTableName("T_WIP_ERROR");
			Map<String, Object> map = tdMap.getColMap();
			CommMethod.addSysDefCol(map, modelAction.getUser());
			map.put("WE_MO_NUMBER", smap.get("WT_MO_NUMBER"));// 制令号
			map.put("WE_SN", weSn);
			map.put("WE_MODEL_CODE", smap.get("WT_MODEL_CODE"));
			map.put("WE_PERIOD", wePeriod);// 时段
			map.put("WE_WORK_GROUP", weWorkGroup);// 班制
			map.put("WE_LOT", weLot);// 生产批号.
			// map.put("WE_TEST_GROUP", groupCode);//测试工序
			map.put("WE_RECORD_TYPE", 1);// 记录类别 (,0表示测试站记录,1:维修站添加)
			map.put("WE_AREA_SN", smap.get("WT_AREA_SN"));
			map.put("WE_PROCESS_FACE", smap.get("WT_PROCESS_FACE"));
			map.put("WE_ERROR_CODE", t.getParameter("paraMap1@0#WE_ERROR_CODE"));
			map.put("WE_POINT", t.getParameter("paraMap1@0#WE_POINT"));
			map.put("WE_POINT_COUNT", t.getParameter("paraMap1@0#WE_POINT_COUNT"));
			map.put("WE_ERROR_NUM", t.getParameter("paraMap1@0#WE_ERROR_NUM"));
			sql = "select t.CA_GROUP from T_CO_AREA t where t.ca_id= ? and t.DATA_AUTH=? ";
			sList = modelService.listDataSql(sql, new Object[] { smap.get("WT_WORK_STATION"), auth });
			if (sList != null && !sList.isEmpty()) {
				map.put("WE_TEST_GROUP", sList.get(0).get("CA_GROUP"));

			}

			map.put("WE_TEST_EMP", CommMethod.getSessionUser().getLoginName());
			map.put("WE_WORK_STATION", smap.get("WT_WORK_STATION"));
			map.put("WE_TEST_TIME", DateUtil.getCurDate());
			if (dataAuth != null && !dataAuth.equals("")) {
				map.put("DATA_AUTH", dataAuth);
			}

			modelService.save(tdMap);
			String alertMsg = modelAction.getText("新增成功");
			return addParentData(modelAction, alertMsg);
		}

		if ("del".equals(type)) {// 删除不良
			String ids = t.getParameter("ids");
			String[] id = ids.split(";");
			Map<String, String> queryMap = new HashMap<>();
			if (null != id && id.length > 0) {
				int num = id.length;
				for (int i = 0; i < num; i++) {
					if (i == 0) {
						sql = "select WE_RECORD_TYPE,WE_REPAIR_FLAG from T_WIP_ERROR t where  t.id in (:id" + i + "";
						queryMap.put("id" + i, id[i]);
					} else {
						sql += "," + "':id" + i + "'";
						queryMap.put("id" + i, id[i]);
					}
				}
				sql += ")";
			}

			String qString = sql;

			// sql = "select WE_RECORD_TYPE,WE_REPAIR_FLAG from T_WIP_ERROR t where t.id in
			// ('"+ ids.replace(";", "','") + "')";
			// sList = modelService.listDataSql(sql);
			sList = modelService.listDataSql(sql, queryMap);
			String alertMsg1 = null;
			if (sList != null && !sList.isEmpty()) {
				int sNum = sList.size();
				for (int i = 0; i < sNum; i++) {
					Map map = sList.get(i);
					String recordType = StringUtils.toString(map.get("WE_RECORD_TYPE"));
					if ("0".equals(recordType)) {// 记录类别 (,0表示测试站记录,1:维修站添加)
						alertMsg1 = modelAction.getText("只能选择删除测试站添加的不良记录");
						modelAction.setAjaxString(alertMsg1);
						return BaseActionSupport.AJAX;
					}
					String repairFlag = StringUtils.toString(map.get("WE_REPAIR_FLAG"));
					if ("1".equals(repairFlag)) {// 维修状态(0待维修 ，1,完成维修)
						alertMsg1 = modelAction.getText("只能选择删除待维修的不良记录");
						modelAction.setAjaxString(alertMsg1);
						return BaseActionSupport.AJAX;
					}
				}
			}
			/*
			 * List list = new ArrayList<>(); Object[] object1 = null; if (null!=id &&
			 * id.length>0) { object1 =new Object[id.length] ;
			 * 
			 * for (int i = 0; i < id.length; i++ ) { if (i==0) { sql =
			 * "select WE_RECORD_TYPE,WE_REPAIR_FLAG from T_WIP_ERROR t where  t.id in (?";
			 * object1[i]=id[i];
			 * 
			 * }else { sql+=",?"; object1[i]=id[i];
			 * 
			 * } } sql+=")"; }
			 */
			sql = "delete from T_WIP_ERROR t where t.id in ('" + ids.replace(";", "','") + "')";
			// modelService.execSql(sql, object1);
			modelService.execSql(sql);
			alertMsg1 = modelAction.getText("删除成功");
			modelAction.setAjaxMap(msgPopData(modelAction, alertMsg1));
			return BaseActionSupport.AJAX;
		}
		if ("addRepair".equals(type))// 保存维修///////////////////////////////////////////////////////////////
		{
			String weSn = t.getParameter("paraMap1@0#WT_SN");
			String error = t.getParameter("errorArr");
			JSONArray errorArr = JSONArray.fromObject(error);
			TableDataMapExt tdMap = new TableDataMapExt();
			tdMap.setTableName("T_WIP_REPAIR");
			Map<String, Object> map = tdMap.getColMap();
			String auth2 = t.getSession().getAttribute("mcDataAuth").toString();
			sql = "select t.CA_GROUP from T_CO_AREA t where t.ca_id= ? and t.DATA_AUTH=?  ";
			String station = t.getParameter("paraMap1@0#WT_WORK_STATION");
			sList = modelService.listDataSql(sql, new Object[] { station, auth });
			if (sList != null && !sList.isEmpty()) {
				map.put("WR_REPAIR_GROUP", sList.get(0).get("CA_GROUP"));

			}
			map.put("WR_REPAIR_STATION", station);

			map.put("WR_MO_NUMBER", t.getParameter("paraMap1@0#WT_MO_NUMBER"));// 制令号
			map.put("WR_SN", weSn);

			map.put("WR_REASON_CODE", t.getParameter("paraMap2@0#WR_REASON_CODE"));
			map.put("WR_REPAIR_DESC", t.getParameter("paraMap2@0#WR_REPAIR_DESC"));
			map.put("WR_REPAIR_METHOD", t.getParameter("paraMap2@0#WR_REPAIR_METHOD"));
			map.put("WR_ERROR_ITEM", t.getParameter("paraMap2@0#WR_ERROR_ITEM"));
			map.put("WR_MEMO", t.getParameter("paraMap2@0#WR_MEMO"));
			map.put("WR_EMP", CommMethod.getSessionUser().getLoginName());
			map.put("WR_REPAIR_TIME", DateUtil.getCurDate());

			Map<String, Object> map1 = new HashMap<String, Object>();
			TableDataMapExt errtdMap = new TableDataMapExt();
			Map<String, Object> errmap = errtdMap.getColMap();
			int eNum = errorArr.size();
			for (int i = 0; i < eNum; i++) {
				map1 = (Map<String, Object>) errorArr.get(i);
				map.putAll(map1);

				String sql2 = "select COUNT(*) from T_WIP_REPAIR where WE_ID=? and WR_SN=? and WR_ERROR_CODE=? and data_auth=?";

				List list1 = modelService.listDataSql(sql2,
						new Object[] { map1.get("WE_ID"), weSn, map1.get("WR_ERROR_CODE"), auth2 });
				if (null != list1 && list1.size() > 0) {
					// CommMethod.editSysDefCol(map, modelAction.getUser());
					if (auth2 != null && !auth2.equals("")) {
						map.put("DATA_AUTH", auth2);
					}
					map.put("DATA_AUTH", dataAuth);
					tdMap.setSqlWhere(" and WE_ID=? and WR_SN=? and WR_ERROR_CODE=? and data_auth=?");
					List list = new ArrayList<>();
					list.add(map1.get("WE_ID"));
					list.add(weSn);
					list.add(map1.get("WR_ERROR_CODE"));
					list.add(auth2);
					tdMap.setSqlWhereArgs(list);
					modelService.edit(tdMap);
				} else {
					CommMethod.addSysDefCol(map, modelAction.getUser());
					if (auth2 != null && !auth2.equals("")) {
						map.put("DATA_AUTH", auth2);
					}
					modelService.save(tdMap);
				}

				// 保存维修信息

				// 修改不良信息
				errtdMap = new TableDataMapExt();
				errtdMap.setTableName("T_WIP_ERROR");
				errtdMap.setSqlWhere("and id = ? ");
				errtdMap.getSqlWhereArgs().add(map1.get("WE_ID"));
				errmap = errtdMap.getColMap();
				CommMethod.editSysDefCol(errmap, modelAction.getUser());
				errmap.put("WE_REPAIR_FLAG", "1");
				errmap.put("WE_ITEM_CODE", t.getParameter("paraMap2@0#WR_ERROR_ITEM"));
				modelService.edit(errtdMap);
			}
			String msg = modelAction.getDefinedMsg();
			if (StringUtils.isBlank(msg)) {
				msg = "不良维修成功";
			}
			String alertMsg = modelAction.getText(msg);
			// return addParentData(modelAction, alertMsg);
			return modelAction.reloadIframeByIds(iframeId, modelAction.getText("不良维修成功"), "1");
		}
		if ("saveScarp".equals(type))// 报废保存
		{
			String weSn = t.getParameter("paraMap1@0#WSC_SN");
			String pmMo = t.getParameter("paraMap1@0#WSC_MO_NUMBER");
			String pjsql = "select t1.project_id from t_pm_project_base t1 "
					+ "left join t_pm_mo_base t2 on t1.project_id = t2.pm_project_id "
					+ "where t2.pm_mo_number = ? and t1.DATA_AUTH=? and t2.DATA_AUTH=? ";
			List<Map> pjlist = modelService.listDataSql(pjsql, new Object[] { pmMo, auth, auth });
			List<Object> sqlList = new ArrayList<Object>();
			String pjNo = String.valueOf(pjlist.get(0).get("project_id"));// 工单号
			sqlList.add(pjNo);
			sqlList.add(auth);
			sql = "select * from T_WIP_TRACKING where WT_SN = ? and DATA_AUTH=? ";
			sList = modelService.listDataSql(sql, new Object[] { weSn, auth });
			Map smap = new HashMap();
			if (sList != null && sList.size() > 0) {
				smap = sList.get(0);
			}
			String wtNum = StringUtils.toString(smap.get("WT_NUM"));
			String wtscarpNum = StringUtils.toString(smap.get("WT_SCRAP_NUM"));// 已经报废
			String scarpNum = t.getParameter("paraMap1@0#WSC_SCARP_NUM");

			if (StringUtils.isBlank(wtNum))
				wtNum = "0";
			if (StringUtils.isBlank(scarpNum))
				wtNum = "0";
			if (StringUtils.isBlank(wtscarpNum))
				wtscarpNum = "0";
			BigDecimal wtNumDecimal = new BigDecimal(wtNum);
			BigDecimal scarpNumDecimal = new BigDecimal(scarpNum).add(new BigDecimal(wtscarpNum));
			if (scarpNumDecimal.compareTo(wtNumDecimal) > 0) {
				return modelAction.alertParentInfo(
						(modelAction.getText("报废数量不能大于产品当前可报废数量") + wtNumDecimal.subtract(new BigDecimal(wtscarpNum))));
			}
			TableDataMapExt pjTable = new TableDataMapExt();
			pjTable.setTableName("T_PM_PROJECT_BASE");
			pjTable.setSqlWhere(" AND project_id = ? and DATA_AUTH=?  ");
			pjTable.setSqlWhereArgs(sqlList);
			pjTable.getColMap().put("scrapped_qty", Integer.valueOf(scarpNum));
			modelService.edit(pjTable);
			TableDataMapExt tdMap = new TableDataMapExt();
			tdMap.setTableName("T_WIP_SN_SCARP_INFO");
			Map<String, Object> map = tdMap.getColMap();
			CommMethod.addSysDefCol(map, modelAction.getUser());
			map.put("WSC_MO_NUMBER", smap.get("WT_MO_NUMBER"));// 制令号
			map.put("WSC_SN", weSn);
			map.put("WSC_ITEM_CODE", smap.get("WT_MODEL_CODE"));
			map.put("WSC_WORK_STAION", t.getParameter("paraMap1@0#WSC_WORK_STAION"));// 工作中心
			map.put("WSC_PROJECT_ID", smap.get("WT_PROJECT_ID"));
			map.put("WSC_SCARP_TYPE", t.getParameter("paraMap1@0#WSC_SCARP_TYPE"));// 报废类型
			map.put("WSC_SCARP_REASON", t.getParameter("paraMap1@0#WSC_SCARP_REASON"));// 报废原因
			map.put("WSC_SCARP_NUM", Integer.valueOf(scarpNum));// 报废数量
			map.put("WSC_SCARP_FLAG", "0");
			map.put("WSC_SCARP_MAN", CommMethod.getSessionUser().getLoginName());
			map.put("WSC_SCARP_TIME", DateUtil.getCurDate());
			if (dataAuth != null && !dataAuth.equals("")) {
				map.put("DATA_AUTH", dataAuth);
			}

			modelService.save(tdMap);

			tdMap = new TableDataMapExt();
			tdMap.setTableName("T_WIP_TRACKING");
			map = tdMap.getColMap();
			map.put("WT_SCRAP_NUM", scarpNumDecimal);
			if (scarpNumDecimal.compareTo(wtNumDecimal) == 0) {
				map.put("WT_SCRAP_FLAG", "Y");
				map.put("WT_ERROR_FLAG", "3");// 品质状态(0正常、1不良、2维修、3报废)
			}
			tdMap.setSqlWhere("and WT_SN = ? and DATA_AUTH=? ");
			tdMap.getSqlWhereArgs().add(weSn);
			tdMap.getSqlWhereArgs().add(auth);
			modelService.edit(tdMap);
			// 产品不良信息表
			if (scarpNumDecimal.compareTo(wtNumDecimal) == 0) {
				tdMap = new TableDataMapExt();
				tdMap.setTableName("T_WIP_ERROR");
				map = tdMap.getColMap();
				map.put("WE_SCARP_FLAG", "Y");
				map.put("WE_REPAIR_FLAG", "1");
				tdMap.setSqlWhere("and WE_SN = ? and DATA_AUTH=? ");
				tdMap.getSqlWhereArgs().add(weSn);
				tdMap.getSqlWhereArgs().add(auth);
				modelService.edit(tdMap);
			}

			sql = "update T_PM_MO_BASE t set t.PM_SCRAP_QTY=(CASE WHEN T.PM_SCRAP_QTY IS NULL THEN 0 ELSE T.PM_SCRAP_QTY END) + ?"
					+ " where t.pm_mo_number = ? and t.DATA_AUTH=? ";
			modelService.execSql(sql, new Object[] { scarpNum, smap.get("WT_MO_NUMBER"), auth });

			String alertMsg1 = modelAction.getText("报废成功");
			return addParentData(modelAction, alertMsg1);
		}
		if ("completeRepair".equals(type)) {// 完成维修
			String weSn = t.getParameter("sn");
			String work_station = t.getParameter("work_station");
			String crc_nextgroup = t.getParameter("crc_nextgroup");
			String crc_next_seq = t.getParameter("crc_next_seq");
			if (StringUtils.isBlank(crc_nextgroup)) {// 未选择回流工序 若下一工序只有一个，则直接进行保存，不进行弹窗选择
				sql = "SELECT B.CT_ROUTE_CODE,A.WT_SCRAP_FLAG  FROM T_WIP_TRACKING A, T_CO_TECHNICS B "
						+ " WHERE A.WT_TECH_SN = B.CT_ID AND A.WT_SN = ? " + " and A.DATA_AUTH=? AND B.DATA_AUTH=?";
				sList = modelService.listDataSql(sql, new Object[] { weSn, auth, auth });
				String scrap = StringUtils.toString(sList.get(0).get("WT_SCRAP_FLAG"));
				String routeCode = StringUtils.toString(sList.get(0).get("CT_ROUTE_CODE"));
				sql = "select CA_GROUP from T_CO_AREA a where a.CA_ID=? and a.DATA_AUTH=? ";
				sList = modelService.listDataSql(sql, new Object[] { work_station, auth });
				String caGroup = StringUtils.toString(sList.get(0).get("CA_GROUP"));
				sql = "select distinct CRC_NEXT_GROUP val,CRC_NEXT_SEQ key from  T_CO_ROUTE_CONTROL a "
						+ "where a.CR_ROUTE_ID=? and a.crc_group_code=? and a.DATA_AUTH=? and A.CRC_CONNECTION='Y'  and exists (select 1  from (select b.* from t_wip_detail b "
						+ "       join t_wip_tracking c  on c.WT_MO_NUMBER = b.WD_MO_NUMBER   and c.WT_PROCESS_FACE = b.WD_PROCESS_FACE"
						+ " and b.WD_SN =? and c.WT_SN=? and b.DATA_AUTH=? and c.DATA_AUTH=? ) bb where bb.WD_GROUP_CODE=a.CRC_NEXT_GROUP  and bb.WD_GROUP_SEQ=a.CRC_NEXT_SEQ)";
				sList = modelService.listDataSql(sql,
						new Object[] { routeCode, caGroup, auth, weSn, weSn, auth, auth });
				if (sList == null || sList.isEmpty()) {
					modelAction.setAjaxString(modelAction
							.getText("未找到下一工序--" + routeCode + "---" + caGroup + "--" + weSn + "--" + work_station));
					return BaseActionSupport.AJAX;
				}
				if (sList != null && sList.size() > 1 && "N".equals(scrap)) {
					modelAction.setAjaxList(sList);
					return BaseActionSupport.AJAX;
				}
				crc_nextgroup = StringUtils.toString(sList.get(0).get("VAL"));
				crc_next_seq = StringUtils.toString(sList.get(0).get("KEY"));
			}

			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = { 1, 2, 3, 4, 5, 6 };
			int[] outplace = { 7 };
			List<Object> list = new ArrayList<Object>();
			List outType = new ArrayList<Object>();
			list.add(auth);
			list.add(weSn);
			list.add(work_station);
			list.add(CommMethod.getSessionUser().getLoginName());
			list.add(crc_nextgroup);
			list.add(crc_next_seq);
			outType.add("String");
			pf.setClassName("P_SMT_REPAIR_SAVE_INFO");// 存储过程的名字
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
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return BaseActionSupport.AJAX;
			}
			String alertMsg1 = modelAction.getText("产品维修成功");
			modelAction.setAjaxMap(msgPopData(modelAction, alertMsg1));
			return BaseActionSupport.AJAX;
		}
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;

	}

	private Map msgPopData(ModelAction modelAction, String alertMsg) {
		Map map = new HashMap<String, Object>();
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		map.put("title", title);
		map.put("width", width);
		map.put("height", height);
		map.put("time", time);
		map.put("alertMsg", alertMsg);
		return map;
	}

	private String addParentData(ModelAction modelAction, String alertMsg) {
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		StringBuffer content = new StringBuffer();
		content.append("<script>");
		content.append("try{");
		content.append("window.parent.addParentData('");
		content.append(alertMsg + "','" + title + "','" + width + "','" + height + "','" + time);
		content.append("');");
		content.append("}catch(e){alert(\"");
        content.append("\");}");
		content.append("</script>");
		modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
		return null;
	}
}
