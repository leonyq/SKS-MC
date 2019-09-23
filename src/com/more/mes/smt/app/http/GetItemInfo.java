package com.more.mes.smt.app.http;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 解析数据源
 * 
 * @author development
 */
public class GetItemInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String labelSql = request.getParameter("labelSql");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> itemList = null;
		List<Map<String, Object>> tempList = null;
		List itemList2 = new ArrayList<String>();
		// String resStr = "";
		String resStr = "SUCCESS";
		try {
			// labelSql = labelSql.trim();
			labelSql = labelSql.toUpperCase();
			labelSql = labelSql.replaceAll("\\s{1,}", " ");
			labelSql = labelSql.replaceAll(";", "");
			/*
			 * if (labelSql.getBytes().length == labelSql.length()) { resStr = "SUCCESS";;
			 * //全是英文 } else { resStr = "ERROR";; }
			 */
			/*
			 * String[] a = labelSql.split("，"); if (a.length>0) { resStr = "ERROR"; }
			 */

			String tempSql = "";

			if (labelSql.indexOf("WHERE") != -1) {
				labelSql = labelSql.replaceAll("=\\s*\\{[^{}]+\\}", " IS NOT NULL");
				tempSql = labelSql.replaceAll("\\{[^{}]+\\}", "''");
				labelSql = "SELECT * FROM (" + labelSql + ") as td";
			}
			/*
			 * else { tempSql = labelSql + "  WHERE ROWNUM=1"; labelSql = labelSql +
			 * "  WHERE ROWNUM=1"; }
			 */if (StringUtils.isNotBlank(tempSql)) {
				tempList = modelService.listDataSql(tempSql);
			}

			itemList = modelService.listDataSql(labelSql);

		} catch (Exception e) {
			log.error(e);
			// 数据库查询出错
			resStr = "ERROR";
		}
		// resStr = "SUCCESS";

		// modelAction.setAjaxString("SUCCESS");
		modelAction.setAjaxString(resStr);
		return BaseActionSupport.AJAX;
	}

}
