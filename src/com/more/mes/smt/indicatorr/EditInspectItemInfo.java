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
 * 生产指示单----检查项目---修改保存
 * 
 * @author development
 */
public class EditInspectItemInfo implements FuncService {

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
			String infoId = modelAction.getDataId();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

			String proCode = request.getParameter("paraMapObj.CO_PROJECT_CODE");// 项目编码
			String proName = request.getParameter("paraMapObj.CO_PROJECT_NAME");// 项目名称
			String proType = request.getParameter("paraMapObj.CO_PROJECT_TYPE");// 项目类型
			String coDefault = request.getParameter("paraMapObj.CO_DEFAULT");// 默认标识
			String proStep = request.getParameter("paraMapObj.CO_PRODUCT_STEP");// 生产阶别
			String affectInfo = request.getParameter("paraMapObj.CO_AFFECT_INFO");// 影响因素
			String mome = request.getParameter("paraMapObj.CO_REMARK");// 备注

			String[] deptIds = request.getParameterValues("DEPT_ID_VAL");// 部门ID
			String[] confirmIds = request.getParameterValues("CONFIRM_EMP_VAL");// 确认人ID
			String[] checkIds = request.getParameterValues("CHECK_EMP_VAL");// 审核人ID

			String sql1 = "SELECT T.ID FROM T_CO_INDICATORR_PROJECT T WHERE T.CO_PROJECT_CODE=? AND T.ID!=? AND T.DATA_AUTH=? ";
			List<String> result = modelService.listDataSql(sql1, new Object[] { proCode, infoId, dataAuth });
			if (!(result == null) && !result.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("项目编码已存在，请更换"));
			}
			String sql2 = "SELECT T.ID FROM T_CO_INDICATORR_PROJECT T WHERE T.CO_PROJECT_NAME=? AND T.ID!=? AND T.DATA_AUTH=? ";
			List<String> result2 = modelService.listDataSql(sql2, new Object[] { proName, infoId, dataAuth });
			if (!(result2 == null) && !result2.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("项目名称已存在，请更换"));
			}
			if ("Y".equals(coDefault)) {
				String sql3 = "SELECT T.ID FROM T_CO_INDICATORR_PROJECT T WHERE T.CO_DEFAULT='Y' AND T.ID!=? AND T.DATA_AUTH=? ";
				List<String> result3 = modelService.listDataSql(sql3, new Object[] { infoId, dataAuth });
				if (!(result3 == null) && !result3.isEmpty()) {
					return modelAction.alertParentInfo(modelAction.getText("已存在默认的检查项目"));
				}
			}
			// String sql = "SELECT T.ID FROM T_CO_ITEM_FORBIDDEN T WHERE T.CF_ITEM_CODE =
			// ?";
			// List<String> result = modelService.listDataSql(sql, new Object[]
			// {itemCodes[i]});
			// if (!(result == null) && !result.isEmpty())
			// {
			// return modelAction.alertParentInfo(modelAction.getText("物料包含禁用料，请更换"));
			// }

			if (coDefault == null || coDefault == "" || coDefault.equals("")) {
				coDefault = "N";
			}
			List<Object> sqlList = new ArrayList<Object>();
			List<Object> sqlList2 = new ArrayList<Object>();
			// 增加指示单项目表
			sqlList.add(infoId);
			TableDataMapExt tMap = new TableDataMapExt();
			tMap.setTableName("T_CO_INDICATORR_PROJECT");
			CommMethod.editSysDefCol(tMap.getColMap(), modelAction.getUser());
			tMap.setSqlWhere(" and ID=? ");
			tMap.setSqlWhereArgs(sqlList);
			tMap.getColMap().put("CO_PROJECT_CODE", proCode);
			tMap.getColMap().put("CO_PROJECT_NAME", proName);
			tMap.getColMap().put("CO_PROJECT_TYPE", proType);
			tMap.getColMap().put("CO_DEFAULT", coDefault);
			tMap.getColMap().put("CO_PRODUCT_STEP", proStep);
			tMap.getColMap().put("CO_AFFECT_INFO", affectInfo);
			tMap.getColMap().put("CO_REMARK", mome);
			if (dataAuth != null) {
				tMap.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(tMap);
			sqlList2.add(infoId);
			sqlList2.add(dataAuth);
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_CO_INDICATORR_PERSONLIABLE");
			delwms1.setSqlWhere(" and CO_PROJECT_CODE=? AND DATA_AUTH=? ");
			delwms1.setSqlWhereArgs(sqlList2);
			modelService.del(delwms1);

			// 插入指示单项目责任人
			TableDataMapExt tMap2 = new TableDataMapExt();
			tMap2.setTableName("T_CO_INDICATORR_PERSONLIABLE");
			int num = deptIds.length;
			for (int i = 0; i < num; i++) {
				tMap2.getColMap().clear();
				CommMethod.addSysDefCol(tMap2.getColMap(), modelAction.getUser());
				tMap2.getColMap().put("CO_PROJECT_CODE", infoId);// 项目编码
				tMap2.getColMap().put("CO_DEPT_ID", deptIds[i]);// 部门ID
				tMap2.getColMap().put("CO_CONFIRM_ID", confirmIds[i]);// 确认人ID
				tMap2.getColMap().put("CO_CHECK_ID", checkIds[i]);// 审核人ID
				if (dataAuth != null) {
					tMap2.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(tMap2);
			}
			String sql3 = "";
			List<Map<String, Object>> result3 = null;
			sql3 = "SELECT DISTINCT T.CO_ITEM_CODE FROM T_CO_ITEM_PROJECT T WHERE T.CO_PROJECT_CODE=? AND T.DATA_AUTH=? ";
			result3 = modelService.listDataSql(sql3, new Object[] { proCode, dataAuth });
			if ("1".equals(affectInfo)) {
				if (!(result3 == null) && !result3.isEmpty()) {
					int num3 = result3.size();
					for (int i = 0; i < num3; i++) {
						String modelCode = StringUtils.toString(result3.get(i).get("CO_ITEM_CODE"));

						String tempSql = "UPDATE T_CO_ITEM_PROJECT T SET T.CO_STATE = '1' WHERE T.CO_ITEM_CODE = ? AND T.DATA_AUTH=? ";

						modelService.execSql(tempSql, new Object[] { modelCode, dataAuth });
						tempSql = "UPDATE T_CO_INDICATORR T SET T.CO_STATE = '1' WHERE T.CO_MODEL_CODE = ? AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=? ";

						modelService.execSql(tempSql, new Object[] { modelCode, dataAuth });
						tempSql = "UPDATE T_CO_INDICATORR_PROJECT_INFO T " + " SET T.CO_STATE = '1' "
								+ " WHERE T.CO_INDICATORR_SN = " + " (SELECT T2.CO_INDICATORR_SN "
								+ " FROM T_CO_INDICATORR T2 "
								+ " WHERE T2.CO_MODEL_CODE = ?  AND T2.CO_MO_NUMBER IS NULL  AND T2.DATA_AUTH=? )"
								+ " AND T.DATA_AUTH=? ";

						modelService.execSql(tempSql, new Object[] { modelCode, dataAuth, dataAuth });
					}
				}
			} else {
				if (!(result3 == null) && !result3.isEmpty()) {
					int num3 = result3.size();
					for (int i = 0; i < num3; i++) {
						String modelCode = StringUtils.toString(result3.get(i).get("CO_ITEM_CODE"));

						String tempSql = "UPDATE T_CO_ITEM_PROJECT T SET T.CO_STATE = '1' WHERE T.CO_ITEM_CODE = ? AND T.CO_PROJECT_CODE=? AND T.DATA_AUTH=? ";

						modelService.execSql(tempSql, new Object[] { modelCode, proCode, dataAuth });
						tempSql = "UPDATE T_CO_INDICATORR T SET T.CO_STATE = '1' WHERE T.CO_MODEL_CODE = ? AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=? ";

						modelService.execSql(tempSql, new Object[] { modelCode, dataAuth });
						tempSql = "UPDATE T_CO_INDICATORR_PROJECT_INFO T " + " SET T.CO_STATE = '1' "
								+ " WHERE T.CO_INDICATORR_SN = " + " (SELECT T2.CO_INDICATORR_SN "
								+ " FROM T_CO_INDICATORR T2 "
								+ " WHERE T2.CO_MODEL_CODE = ?  AND T2.CO_MO_NUMBER IS NULL AND T2.DATA_AUTH=? ) "
								+ "AND T.CO_PROJECT_CODE = ? AND T.DATA_AUTH=? ";

						modelService.execSql(tempSql, new Object[] { modelCode, proCode, dataAuth, dataAuth });
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
