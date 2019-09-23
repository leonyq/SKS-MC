package com.more.mes.smt.indicatorr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----机种项目配置---修改删除校验
 * 
 * @author development
 */
public class CheckConfirmInfoBfDel implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String resStr = "";
		try {
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			String delId = request.getParameter("delId");// 需要删除的id
			String checkProCode = request.getParameter("checkProCode");// 需要删除的检查项目编号
			String[] strArray = checkProCode.split(",");
			// 判断删除的id有没有明细
			String sql1 = "SELECT DISTINCT T1.ID " + " FROM T_CO_INDICATORR T1 " + " LEFT JOIN T_PM_MO_BASE T2 "
					+ " ON T1.CO_MO_NUMBER = T2.PM_MO_NUMBER " + " LEFT JOIN T_CO_INDICATORR_PROJECT_INFO T3 "
					+ " ON T1.CO_INDICATORR_SN = T3.CO_INDICATORR_SN " + " LEFT JOIN T_CO_ITEM_PROJECT T "
					+ " ON T.CO_ITEM_CODE = T2.PM_MODEL_CODE " + " WHERE T.ID = ? "
					+ " AND T3.CO_PROJECT_CODE = ? AND T1.DATA_AUTH=? "
					+ " AND T2.DATA_AUTH=? AND T3.DATA_AUTH=? AND T.DATA_AUTH=? ";
			List<Map> itemList = null;
			int num = strArray.length;
			for (int i = 0; i < num; i++) {
				itemList = modelService.listDataSql(sql1,
						new Object[] { delId, strArray[i], dataAuth, dataAuth, dataAuth, dataAuth });

				if (itemList != null && !itemList.isEmpty()) {
					resStr = "false";
				}
			}
			if ("false".equals(resStr)) {
				for (int i = 0; i < num; i++) {
					String sql = "DELETE FROM T_CO_ITEM_PROJECT T WHERE T.ID=? AND T.CO_PROJECT_CODE=? AND T.DATA_AUTH=? ";
					modelService.execSql(sql, new Object[] { delId, strArray[i], dataAuth });
				}
			}

		} catch (Exception e) {
			log.error(e);
			resStr = "error";
		}
		modelAction.setAjaxString(resStr);
		return BaseActionSupport.AJAX;
	}

}
