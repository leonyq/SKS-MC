package com.more.mes.smt.indicatorr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----模板项目配置---修改保存
 * 
 * @author development
 */
public class EditTemplateItemInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

			String templateName = request.getParameter("paraMapObj.CTP_TEMPLATE_NAME");// 模板名称
			String[] proCode = request.getParameterValues("PROJECT_CODE");// 项目编码
			List<Object> sqlList = new ArrayList<Object>();
			sqlList.add(templateName);
			sqlList.add(dataAuth);
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_CO_TEMPLATE_PROJECT");
			delwms1.setSqlWhere(" and CTP_TEMPLATE_NAME=? AND DATA_AUTH=? ");
			delwms1.setSqlWhereArgs(sqlList);
			modelService.del(delwms1);

			TableDataMapExt tMap = new TableDataMapExt();
			tMap.setTableName("T_CO_TEMPLATE_PROJECT");
			int num = proCode.length;
			for (int i = 0; i < num; i++) {
				String infoId = StringUtils.getUUID();
				CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
				tMap.getColMap().put("ID", infoId);
				tMap.getColMap().put("CTP_TEMPLATE_NAME", templateName);
				tMap.getColMap().put("CTP_PROJECT_CODE", proCode[i]);
				if (dataAuth != null) {
					tMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(tMap);
			}
			// 修改机种项目配置表 先删掉原先的记录 在新增所有记录 状态为未确认
			List<Object> sqlList2 = null;
			String sql = "SELECT DISTINCT T.CO_ITEM_CODE FROM T_CO_ITEM_PROJECT T "
					+ "WHERE T.CO_TEMPLATE_NAME=? AND T.DATA_AUTH=? ";
			List<Map<String, Object>> result = modelService.listDataSql(sql, new Object[] { templateName, dataAuth });
			if (!(result == null) && !result.isEmpty()) {
				int rNum = result.size();
				for (int i = 0; i < rNum; i++) {

					String itemCode = StringUtils.toString(result.get(i).get("CO_ITEM_CODE"));
					sqlList2 = new ArrayList<Object>();
					sqlList2.add(itemCode);
					sqlList2.add(dataAuth);
					TableDataMapExt delwms2 = new TableDataMapExt();
					delwms2.setTableName("T_CO_ITEM_PROJECT");
					delwms2.setSqlWhere(" and CO_ITEM_CODE=? AND DATA_AUTH=? ");
					delwms2.setSqlWhereArgs(sqlList2);
					modelService.del(delwms2);

					for (int j = 0; j < num; j++) {
						TableDataMapExt tMap2 = new TableDataMapExt();
						tMap2.setTableName("T_CO_ITEM_PROJECT");
						String infoId = StringUtils.getUUID();
						CommMethod.addSysDefCol(tMap2.getColMap(), modelAction.getUser());
						tMap2.getColMap().put("ID", infoId);
						tMap2.getColMap().put("CO_ITEM_CODE", itemCode);
						tMap2.getColMap().put("CO_PROJECT_CODE", proCode[j]);
						tMap2.getColMap().put("CO_TEMPLATE_NAME", templateName);
						tMap2.getColMap().put("CO_STATE", "1");
						if (dataAuth != null) {
							tMap2.getColMap().put("DATA_AUTH", dataAuth);
						}
						modelService.save(tMap2);
					}

					// 修改生产指示单 指示单明细状态
					String sql2 = "SELECT T.CO_INDICATORR_SN FROM T_CO_INDICATORR T "
							+ "WHERE T.CO_MODEL_CODE=? AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=?";
					List<Map<String, Object>> result2 = modelService.listDataSql(sql2,
							new Object[] { itemCode, dataAuth });
					if (result2 != null && !result2.isEmpty()) {
						String indicatorrSn = StringUtils.toString(result2.get(0).get("CO_INDICATORR_SN"));
						List<Object> sqlList3 = new ArrayList<Object>();
						sqlList3.add(indicatorrSn);
						sqlList3.add(dataAuth);
						TableDataMapExt tMap2 = new TableDataMapExt();
						tMap2.setTableName("T_CO_INDICATORR");
						CommMethod.editSysDefCol(tMap2.getColMap(), modelAction.getUser());
						tMap2.setSqlWhere(" and CO_INDICATORR_SN=? AND DATA_AUTH=? ");
						tMap2.setSqlWhereArgs(sqlList3);
						tMap2.getColMap().put("CO_STATE", "1");
						if (dataAuth != null) {
							tMap2.getColMap().put("DATA_AUTH", dataAuth);
						}
						modelService.edit(tMap2);
						// 修改指示单明细信息 先删除之前的数据 再全部新增
						TableDataMapExt delwms3 = new TableDataMapExt();
						delwms3.setTableName("T_CO_INDICATORR_PROJECT_INFO");
						delwms3.setSqlWhere(" and CO_INDICATORR_SN=? AND DATA_AUTH=? ");
						delwms3.setSqlWhereArgs(sqlList3);
						modelService.del(delwms3);

						String sql3 = "SELECT DISTINCT T.CO_ITEM_CODE, " + " T.CO_PROJECT_CODE, "
								+ " T2.CO_PROJECT_NAME, " + " T.CO_STATE         CO_MODEL_STATE, " + " T3.CO_DEPT_ID, "
								+ " T4.NAME            CO_DEPT_NAME, " + " T3.CO_CONFIRM_ID, "
								+ " T5.NAME            CO_CONFIRM_NAME, " + " T3.CO_CHECK_ID, "
								+ " T6.NAME            CO_CHECK_NAME, " + " T2.CO_AFFECT_INFO, "
								+ " T7.VALUE           AFFECT_INFO_NAME " + " FROM T_CO_TEMPLATE_PROJECT T8 "
								+ " LEFT JOIN T_CO_ITEM_PROJECT T " + " ON T.CO_PROJECT_CODE = T8.CTP_PROJECT_CODE "
								+ " AND T.CO_TEMPLATE_NAME = T8.CTP_TEMPLATE_NAME "
								+ " LEFT JOIN T_CO_INDICATORR_PROJECT T2 "
								+ " ON T8.CTP_PROJECT_CODE = T2.CO_PROJECT_CODE "
								+ " LEFT JOIN T_CO_INDICATORR_PERSONLIABLE T3 " + " ON T2.ID = T3.CO_PROJECT_CODE "
								+ " LEFT JOIN SY_DEPT T4 " + " ON T3.CO_DEPT_ID = T4.ID " + " LEFT JOIN SY_USER T5 "
								+ " ON T3.CO_CONFIRM_ID = T5.ID " + " LEFT JOIN SY_USER T6 "
								+ " ON T3.CO_CHECK_ID = T6.ID " + " LEFT JOIN SY_DICT_VAL T7 "
								+ " ON T2.CO_AFFECT_INFO = T7.CODE " + " AND T7.DICT_CODE = 'AFFECT_INFO' "
								+ " WHERE T.CO_ITEM_CODE = ? " + "  AND T8.CTP_TEMPLATE_NAME = ? "
								+ " AND T.DATA_AUTH=? AND T2.DATA_AUTH=? AND T3.DATA_AUTH=? " + "  ";
						List<Map<String, Object>> result3 = modelService.listDataSql(sql3,
								new Object[] { itemCode, templateName, dataAuth, dataAuth, dataAuth });
						int reNum = result3.size();
						for (int k = 0; k < reNum; k++) {
							TableDataMapExt detailMap = new TableDataMapExt();
							detailMap.setTableName("T_CO_INDICATORR_PROJECT_INFO");
							String detailInfoId = StringUtils.getUUID();
							CommMethod.addSysDefCol(detailMap.getColMap(), modelAction.getUser());
							detailMap.getColMap().put("ID", detailInfoId);
							detailMap.getColMap().put("CO_INDICATORR_SN", indicatorrSn);
							detailMap.getColMap().put("CO_PROJECT_CODE", result3.get(k).get("CO_PROJECT_CODE"));
							detailMap.getColMap().put("CO_STATE", "1");
							detailMap.getColMap().put("CO_CONFIRM_ID", result3.get(k).get("CO_CONFIRM_ID"));
							detailMap.getColMap().put("CO_CHECK_ID", result3.get(k).get("CO_CHECK_ID"));
							detailMap.getColMap().put("CO_DEPT_ID", result3.get(k).get("CO_DEPT_ID"));
							if (dataAuth != null) {
								detailMap.getColMap().put("DATA_AUTH", dataAuth);
							}
							modelService.save(detailMap);
						}
					}
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
