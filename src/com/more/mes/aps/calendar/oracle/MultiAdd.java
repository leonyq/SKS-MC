package com.more.mes.aps.calendar.oracle;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 产能日历------批量生成
 * 
 * @author Administrator
 *
 */
public class MultiAdd implements FuncService {
	private static final Log log = LogFactory.getLog("com.more.mes.aps.calendar.oracle.MultiAdd");

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
		String iframeId = httpServletRequest.getParameter("iframeId");
		String isCloseWin = httpServletRequest.getParameter("isCloseWin");
		// 获取操作方法
		String opt = httpServletRequest.getParameter("opt");

		String jsonData = null;
		List ajaxList = null;
		// 根据不同的操作标识进行处理
		if ("getSourceLine".equals(opt)) {
			ajaxList = this.getSourceLine(httpServletRequest, modelService);
		}
		if ("getExceptionTime".equals(opt)) {
			ajaxList = this.getExceptionTime(httpServletRequest, modelService);
		}
		if ("getMultiLineExceptionTime".equals(opt)) {
			ajaxList = this.getMultiLineExceptionTime(httpServletRequest, modelService);
		}
		if ("saveMulti".equals(opt)) {
			/*
			 * Boolean isSuc=this.saveMulti(httpServletRequest,modelService,modelAction);
			 * if(isSuc){ return modelAction.reloadIframeByIds(iframeId,
			 * modelAction.getText("批量生成成功"), isCloseWin); } else {
			 * jsonData=isSuc.toString(); }
			 */
			jsonData = this.saveMulti(httpServletRequest, modelService, modelAction).toString();
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
	 * 获取来源线体
	 * 
	 * @param httpServletRequest
	 * @return
	 */
	private List getSourceLine(HttpServletRequest httpServletRequest, ModelService modelService) {
		try {
			// 查询数据
			String sqlStr = "SELECT\r\n" + "A.CA_ID,\r\n" + "A.CA_NAME,\r\n" + "B.ID AS CAL_ID\r\n"
					+ "FROM T_CO_AREA A\r\n" + "INNER JOIN T_PM_PLAN_CALENDAR B ON A.CA_ID=B.PPC_AREA_SN";
			return modelService.listDataSql(sqlStr);
		} catch (Exception ex) {
			log.error("getSourceLine:", ex);
			return null;
		}
	}

	/**
	 * 获取来源线体例外时间
	 * 
	 * @param httpServletRequest
	 * @return
	 */
	private List getExceptionTime(HttpServletRequest httpServletRequest, ModelService modelService) {
		try {
			// 获取例外信息主表ID
			String calId = httpServletRequest.getParameter("calId");
			// 查询数据
			String sqlStr = "SELECT\r\n" + "A.ID,\r\n" + "A.PPE_EXECPTION_TYPE,\r\n" + "B.VALUE AS EXCEPTION_NAME,\r\n"
					+ "TO_CHAR(A.PPE_BEGIN_TIME,'YYYY-MM-DD HH24:MI:SS') AS PPE_BEGIN_TIME,\r\n"
					+ "TO_CHAR(A.PPE_END_TIME,'YYYY-MM-DD HH24:MI:SS') AS PPE_END_TIME,\r\n"
					+ "NVL(A.PPE_DURATION,0) AS PPE_DURATION\r\n" + "FROM T_PM_PLAN_EXECPTION A\r\n"
					+ "LEFT JOIN SY_DICT_VAL B ON B.DICT_CODE='CAL_EXP_TYPE' AND A.PPE_EXECPTION_TYPE=B.CODE\r\n"
					+ "WHERE A.PPC_ID=?";
			return modelService.listDataSql(sqlStr, new Object[] { calId });
		} catch (Exception ex) {
			log.error("getExceptionTime:", ex);
			return null;
		}
	}

	/**
	 * 获取例外时间
	 * 
	 * @return
	 */
	private List getMultiLineExceptionTime(HttpServletRequest httpServletRequest, ModelService modelService) {
		try {
			Object[] lineInfo = httpServletRequest.getParameter("line").split(",");
			String lines = null;
			for (int i = 0, len = lineInfo.length; i < len; i++) {
				if (lines == null) {
					lines = "?";
				} else {
					lines += ",?";
				}
			}
			String strSql = "SELECT\r\n" + "A.PPC_AREA_SN,\r\n" + "C.CA_NAME,\r\n" + "B.PPE_EXECPTION_TYPE,\r\n"
					+ "B.PPE_BEGIN_TIME,\r\n" + "B.PPE_END_TIME\r\n" + "FROM T_PM_PLAN_CALENDAR A\r\n"
					+ "LEFT JOIN T_PM_PLAN_EXECPTION B ON A.ID=B.PPC_ID\r\n"
					+ "LEFT JOIN T_CO_AREA C ON A.PPC_AREA_SN=C.CA_ID\r\n" + "WHERE A.PPC_AREA_SN IN (%s)\r\n"
					+ "ORDER BY A.ID ASC";
			return modelService.listDataSql(String.format(strSql, lines), lineInfo);
		} catch (Exception ex) {
			log.error("getMultiLineExceptionTime:", ex);
			return null;
		}
	}

	/**
	 * 保存
	 * 
	 * @param httpServletRequest
	 * @param modelService
	 * @return
	 */
	private Boolean saveMulti(HttpServletRequest httpServletRequest, ModelService modelService,
			ModelAction modelAction) {
		MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
		try {
			// 获取参数
			String calId = httpServletRequest.getParameter("calId");
			String excid = httpServletRequest.getParameter("excid");
			String line = httpServletRequest.getParameter("line");
			String[] ids = excid.split(",");
			String[] lines = line.split(",");
			String detId = null;
			for (String d : ids) {
				if (null == detId) {
					detId = "'" + d + "'";
				} else {
					detId += ",'" + d + "'";
				}
			}
			// 循环处理数据
			String strSql = "";
			int isSuc = 0;
			String masterId = null;
			String userId = modelAction.getUser().getId();
			List<Map> list;
			for (String li : lines) {
				// 判定产能日历是否存在
				strSql = "SELECT\r\n" + "A.ID\r\n" + "FROM T_PM_PLAN_CALENDAR A\r\n" + "WHERE A.PPC_AREA_SN=?";
				list = modelService.listDataSql(strSql, new Object[] { li });
				if (null != list && list.size() > 0) {
					masterId = list.get(0).get("ID").toString();
				} else {
					masterId = java.util.UUID.randomUUID().toString();
					// 插入主表
					strSql = "INSERT INTO T_PM_PLAN_CALENDAR \r\n" + "( \r\n" + "ID, \r\n" + "DEPT_ID, \r\n"
							+ "CREATE_USER, \r\n" + "CREATE_TIME, \r\n" + "EDIT_USER, \r\n" + "EDIT_TIME, \r\n"
							+ "DATA_AUTH, \r\n" + "PPC_AREA_SN, \r\n" + "PPC_SAT_FLAG, \r\n" + "PPC_SUN_FLAG, \r\n"
							+ "PPC_DEFAULT_FLAG, \r\n" + "PPC_MEMO, \r\n" + "PPC_PRODUCT_STEP \r\n" + ") \r\n"
							+ "SELECT \r\n" + "?, \r\n" + "DEPT_ID, \r\n" + "CREATE_USER, \r\n" + "CREATE_TIME, \r\n"
							+ "EDIT_USER, \r\n" + "EDIT_TIME, \r\n" + "DATA_AUTH, \r\n" + "?, \r\n"
							+ "PPC_SAT_FLAG, \r\n" + "PPC_SUN_FLAG, \r\n" + "PPC_DEFAULT_FLAG, \r\n" + "PPC_MEMO, \r\n"
							+ "(SELECT CA_PROJECT_STEP FROM T_CO_AREA WHERE CA_ID=? AND ROWNUM=1)\r\n"
							+ "FROM T_PM_PLAN_CALENDAR \r\n" + "WHERE ID=?";
					isSuc = modelService.execSql(strSql, new Object[] { masterId, li, li, calId });
					if (isSuc <= 0) {
						hbtran.rollback();
						return false;
					}
				}
				// 保存明细信息
				strSql = "INSERT INTO T_PM_PLAN_EXECPTION \r\n" + "(\r\n" + "ID,\r\n" + "DEPT_ID,\r\n"
						+ "CREATE_USER,\r\n" + "CREATE_TIME,\r\n" + "EDIT_USER,\r\n" + "EDIT_TIME,\r\n"
						+ "DATA_AUTH,\r\n" + "PPC_ID,\r\n" + "PPE_AREA_SN,\r\n" + "PPE_BEGIN_TIME,\r\n"
						+ "PPE_END_TIME,\r\n" + "PPE_DURATION,\r\n" + "PPE_CREATE_TIME,\r\n" + "PPE_EMP,\r\n"
						+ "PPC_MEMO,\r\n" + "PPE_EXECPTION_TYPE\r\n" + ")\r\n" + "SELECT\r\n" + "f_c_getnewid(),\r\n"
						+ "DEPT_ID,\r\n" + "CREATE_USER,\r\n" + "CREATE_TIME,\r\n" + "EDIT_USER,\r\n" + "EDIT_TIME,\r\n"
						+ "DATA_AUTH,\r\n" + "'" + masterId + "',\r\n" + "'" + li + "',\r\n" + "PPE_BEGIN_TIME,\r\n"
						+ "PPE_END_TIME,\r\n" + "PPE_DURATION,\r\n" + "PPE_CREATE_TIME,\r\n" + "'" + userId + "',\r\n"
						+ "PPC_MEMO,\r\n" + "PPE_EXECPTION_TYPE\r\n" + "FROM T_PM_PLAN_EXECPTION\r\n" + "WHERE ID IN ("
						+ detId + ")";
				isSuc = modelService.execSql(strSql);
				if (isSuc <= 0) {
					hbtran.rollback();
					return false;
				}
			}

			hbtran.commit();
			return true;
		} catch (Exception ex) {
			log.error("saveMulti:", ex);
			hbtran.rollback();
			return false;
		}
	}
}
