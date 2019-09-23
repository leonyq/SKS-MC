
package com.more.mes.aps.change.oracle;

import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 计划稳定率---数据交互
 *
 */
public class ChangeRate implements FuncService {
	private static final Log log = LogFactory.getLog("com.more.mes.aps.change.oracle.ChangeRate");

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		// 获取操作标识
		HttpServletRequest httpServletRequest = modelAction.getRequest();
		PaginationImpl impl = modelAction.getPage();// 定义分页变量
		// 获取分页变量
		String currentPage = httpServletRequest.getParameter("currentPage");
		String pageRecord = httpServletRequest.getParameter("pageRecord");
		impl.setCurrentPage(null == currentPage ? 1 : Integer.parseInt(currentPage));
		impl.setPageRecord(null == pageRecord ? 20 : Integer.parseInt(pageRecord));
		// 获取操作方法
		String opt = httpServletRequest.getParameter("opt");

		String jsonData = null;
		List ajaxList = null;
		// 根据不同的操作标识进行处理
		if ("getPlanChangeRate".equals(opt)) {
			ajaxList = this.getPlanChangeRate(httpServletRequest, modelService, impl);
		}

		if (null != jsonData) {// 直接返回json，适用于没有分页的情况下
			return modelAction.outJson(jsonData, Constants.CHARACTER_ENCODING_UTF_8);
		} else if (null != ajaxList) {// 返回List，适用于有分页的情况下
			modelAction.setAjaxList(ajaxList);
			modelAction.setAjaxPage(impl);
			return BaseActionSupport.AJAX;
		} else {
			modelAction.setAjaxPage(impl);
			return BaseActionSupport.AJAX;
		}
	}

	/**
	 * 获取计划稳定率
	 * 
	 * @param httpServletRequest
	 * @return
	 */
	private List getPlanChangeRate(HttpServletRequest httpServletRequest, ModelService modelService,
			PaginationImpl impl) {
		try {
			// 获取查询条件
			String dataAuth = httpServletRequest.getParameter("dataAuth");
			String startTime = httpServletRequest.getParameter("startTime");
			String endTime = httpServletRequest.getParameter("endTime");
			String projectId = httpServletRequest.getParameter("projectId");
			String itemCode = httpServletRequest.getParameter("itemCode");
			List<Object> paramObject = new ArrayList();
			List<Integer> paramTypeVar = new ArrayList();
			String strWhere = "";
			if (StringUtils.isNotEmpty(dataAuth)) {
				strWhere += " AND A.DATA_AUTH=?";
				paramObject.add(dataAuth);
				paramTypeVar.add(Types.VARCHAR);
				strWhere += " AND B.DATA_AUTH=?";
				paramObject.add(dataAuth);
				paramTypeVar.add(Types.VARCHAR);
			} else {
				strWhere += " AND A.DATA_AUTH=?";
				paramObject.add(dataAuth);

			}
			if (StringUtils.isNotEmpty(startTime)) {
				strWhere += " AND A.PROLEPSIS_START_DATE>=TO_DATE('?','YYYY-MM-DD HH24:MI:SS')";
				paramObject.add(startTime);
				paramTypeVar.add(Types.VARCHAR);
			}
			if (StringUtils.isNotEmpty(endTime)) {
				strWhere += " AND A.PROLEPSIS_END_DATE<=TO_DATE('?','YYYY-MM-DD HH24:MI:SS')";
				paramObject.add(endTime);
				paramTypeVar.add(Types.VARCHAR);
			}
			if (StringUtils.isNotEmpty(projectId)) {
				strWhere += " AND A.PROJECT_ID LIKE ?||'%'";
				paramObject.add(projectId);
				paramTypeVar.add(Types.VARCHAR);
			}
			if (StringUtils.isNotEmpty(itemCode)) {
				strWhere += " AND A.PRODUCT_MATERIAL LIKE ?||'%'";
				paramObject.add(itemCode);
				paramTypeVar.add(Types.VARCHAR);
			}
			// 查询数据
			String sqlStr = "SELECT\r\n" + "D.NAME DATA_AUTH, \r\n" + "A.PROJECT_ID,\r\n"
					+ "NVL(A.PRODUCT_MATERIAL,' ') AS PRODUCT_MATERIAL,\r\n"
					+ "NVL(B.CI_ITEM_NAME,' ') AS CI_ITEM_NAME,\r\n" + "NVL(B.CI_ITEM_SPEC,' ') AS CI_ITEM_SPEC,\r\n"
					+ "NVL(A.PRODUCT_COUNT,0) AS PRODUCT_COUNT,\r\n" + "NVL(A.FQC_COUNT,0) AS FQC_COUNT,\r\n"
					+ "NVL(A.FINISH_COUNT,0) AS FINISH_COUNT,\r\n" + "A.PROJECT_STATUS,\r\n"
					+ "NVL(TO_CHAR(A.PROLEPSIS_START_DATE,'YYYY-MM-DD HH24:MI:SS'),' ') AS PROLEPSIS_START_DATE,\r\n"
					+ "NVL(TO_CHAR(A.PROLEPSIS_END_DATE,'YYYY-MM-DD HH24:MI:SS'),' ') AS PROLEPSIS_END_DATE,\r\n"
					+ "NVL(TO_CHAR(A.TPPB_PLAN_DELIVERY_DATE,'YYYY-MM-DD HH24:MI:SS'),' ') AS TPPB_PLAN_DELIVERY_DATE,\r\n"
					+ "NVL(A.PM_CHANGE_TIMES,0) AS PM_CHANGE_TIMES,\r\n" + "C.VALUE AS PROJECT_STATUS_TEXT\r\n"
					+ "FROM T_PM_PROJECT_BASE A\r\n"
					+ "LEFT JOIN T_CO_ITEM B ON A.PRODUCT_MATERIAL=B.CI_ITEM_CODE AND A.DATA_AUTH=B.DATA_AUTH \r\n"
					+ "LEFT JOIN SY_DICT_VAL C ON C.DICT_CODE='PROJECT_STATUS' AND C.CODE=A.PROJECT_STATUS\r\n"
					+ "LEFT JOIN SY_DEPT D ON A.DATA_AUTH=D.ID\r\n" + "WHERE 1=1 AND NVL(A.PM_CHANGE_TIMES,0)>0  %s";
			int[] paramType = new int[paramTypeVar.size()];
			for (int i = 0, len = paramTypeVar.size(); i < len; i++) {
				paramType[i] = paramTypeVar.get(i);
			}
			return modelService.listSql(String.format(sqlStr, strWhere), impl, null, paramObject.toArray(), paramType,
					"ORDER BY PROLEPSIS_START_DATE DESC", null);
		} catch (Exception ex) {
			log.error("getPlanChangeRate:", ex);
			return null;
		}
	}
}
