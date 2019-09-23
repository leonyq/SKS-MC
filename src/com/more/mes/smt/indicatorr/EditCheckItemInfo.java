package com.more.mes.smt.indicatorr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----生产指示单---部门审核--保存
 * 
 * @author development
 */
public class EditCheckItemInfo implements FuncService {

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

			String infoId = modelAction.getDataId();
			String memo = request.getParameter("paraMapObj.CO_MEMO");
			List<Object> sqlList = new ArrayList<Object>();
			sqlList.add(infoId);
			TableDataMapExt tMap = new TableDataMapExt();
			tMap.setTableName("T_CO_INDICATORR");
			CommMethod.editSysDefCol(tMap.getColMap(), modelAction.getUser());
			tMap.setSqlWhere(" and ID=? ");
			tMap.setSqlWhereArgs(sqlList);
			tMap.getColMap().put("CO_MEMO", memo);
			if (dataAuth != null) {
				tMap.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(tMap);

			String indicatorSn = request.getParameter("indicatorSn");
			String infoIdStr = request.getParameter("infoIdStr");
			String[] infoIds = infoIdStr.split(",", -1);
			String proCodeStr = request.getParameter("proCodeStr");
			String[] proCodes = proCodeStr.split(",", -1);
			String itemCode = request.getParameter("itemCode");// 机种料号
			int num = infoIds.length;
			for (int i = 0; i < num; i++) {
				List<Object> sqlList2 = new ArrayList<Object>();
				sqlList2.add(infoIds[i]);
				TableDataMapExt detailMap = new TableDataMapExt();
				detailMap.setTableName("T_CO_INDICATORR_PROJECT_INFO");
				CommMethod.editSysDefCol(detailMap.getColMap(), modelAction.getUser());
				detailMap.setSqlWhere(" and ID=? ");
				detailMap.setSqlWhereArgs(sqlList2);
				detailMap.getColMap().put("CO_STATE", "3");
				detailMap.getColMap().put("CO_CHECK_TIME", DateUtil.getCurDate());
				if (dataAuth != null) {
					detailMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(detailMap);

				/*
				 * TableDataMapExt tMap = new TableDataMapExt();
				 * tMap.setTableName("T_CO_INDICATORR");
				 * CommMethod.editSysDefCol(tMap.getColMap(), modelAction.getUser());
				 * tMap.setSqlWhere(" and CO_INDICATORR_SN='" + infoIds[i] + "'");
				 * tMap.getColMap().put("CO_STATE", "2"); if (dataAuth != null) {
				 * tMap.getColMap().put("DATA_AUTH", dataAuth); } modelService.edit(tMap);
				 */
			}
			int pNum = proCodes.length;
			for (int i = 0; i < pNum; i++) {
				/*
				 * TableDataMapExt tMap = new TableDataMapExt();
				 * tMap.setTableName("T_CO_ITEM_PROJECT");
				 * CommMethod.editSysDefCol(tMap.getColMap(), modelAction.getUser());
				 * tMap.setSqlWhere(" and CO_ITEM_CODE='" + itemCode + "'");
				 * tMap.setSqlWhere(" and CO_PROJECT_CODE='" + proCodes[i] + "'");
				 * tMap.getColMap().put("CO_STATE", "2"); if (dataAuth != null) {
				 * tMap.getColMap().put("DATA_AUTH", dataAuth); } modelService.edit(tMap);
				 */
				String tempSql = "UPDATE T_CO_ITEM_PROJECT T " + " SET CO_STATE = '2' " + " WHERE T.CO_ITEM_CODE = ? "
						+ " AND T.CO_PROJECT_CODE NOT IN " + " (SELECT T1.CO_PROJECT_CODE "
						+ " FROM T_CO_INDICATORR_PROJECT_INFO T1 "
						+ " WHERE T1.CO_STATE != '3' AND T1.CO_INDICATORR_SN=? AND T1.DATA_AUTH=? ) "
						+ " AND T.DATA_AUTH=? ";
				modelService.execSql(tempSql, new Object[] { itemCode, indicatorSn, dataAuth, dataAuth });

				String tempSql2 = "SELECT T.CO_INDICATORR_SN FROM T_CO_INDICATORR_PROJECT_INFO T "
						+ "WHERE T.CO_INDICATORR_SN=? AND T.CO_STATE !='3' AND T.DATA_AUTH=? ";
				List<String> result = modelService.listDataSql(tempSql2, new Object[] { indicatorSn, dataAuth });
				if (result == null || result.isEmpty()) {
					String tempSql3 = "UPDATE T_CO_INDICATORR T SET CO_STATE = '2' WHERE T.CO_INDICATORR_SN  = ? AND T.DATA_AUTH=? ";
					modelService.execSql(tempSql3, new Object[] { indicatorSn, dataAuth });
				}
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("审核失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("审核成功"), "0");
	}
}
