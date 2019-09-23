package com.more.mes.smt.planquotiety.pg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 月排程----新增工单---获取工单信息
 * 
 * @author Administrator
 *
 */
public class GetProject implements FuncService {
	private static final Log log = LogFactory.getLog("com.more.mes.smt.planquotiety.GetProject");

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		try {
			HttpServletRequest request = modelAction.getRequest();
			PaginationImpl impl = modelAction.getPage();// 定义分页变量
			String currentPage = request.getParameter("currentPage");
			String pageRecord = request.getParameter("pageRecord");
			System.out.println("当前页" + currentPage);
			System.out.println("页记录" + pageRecord);
			impl.setCurrentPage(null == currentPage ? 1 : Integer.parseInt(currentPage));
			impl.setPageRecord(null == pageRecord ? 20 : Integer.parseInt(pageRecord));

			String dataAuth = request.getParameter("dataAuth");
			String PPW_PROJECT_ID = request.getParameter("PPW_PROJECT_ID");
			String exsitPorjectIds = request.getParameter("exsitPorjectIds");
			String PPW_STEP = request.getParameter("PPW_STEP");

			String PRODUCT_MATERIAL = request.getParameter("PRODUCT_MATERIAL");
			String planStartDate = request.getParameter("planStartDate");
			String planEndDate = request.getParameter("planEndDate");

			String expProjects = null;
			if (null != exsitPorjectIds && !"".equals(exsitPorjectIds)) {
				String[] exsitProject = exsitPorjectIds.split(",");
				for (String project : exsitProject) {
					if (null == expProjects) {
						expProjects = "'" + project + "'";
					} else {
						expProjects += ",'" + project + "'";
					}
				}
			}

			/*
			 * List<Map> taskMaps = CommonMethod.Common.jsonStr2Map(exsitPorjectIds); String
			 * expProjects=null; Object vP=null; for(Map map:taskMaps){
			 * vP=map.get("projectid"); if(null==vP || StringUtils.isEmpty(vP.toString())){
			 * continue; } if(StringUtils.isEmpty(expProjects)){
			 * expProjects="'"+vP.toString()+"'"; } else {
			 * expProjects+=",'"+vP.toString()+"'"; } }
			 */

			String sql = "SELECT  \r\n" + "A.ID,  \r\n" + "A.PROJECT_ID,  \r\n" + "A.PROJECT_STEP,  \r\n"
					+ "A.PRODUCT_COUNT,  \r\n" + "A.PRODUCT_MATERIAL, \r\n"
					+ "COALESCE(A.PRODUCT_COUNT,0)-COALESCE(I.SUM_NOW_NUM,0) AS CANPLAN,  \r\n"
					+ "A.PRODUCT_NAME,  \r\n"
					+ "TO_CHAR(A.PROLEPSIS_START_DATE,'YYYY-MM-DD HH24:MI:SS') AS PROLEPSIS_START_DATE,  \r\n"
					+ "TO_CHAR(A.PROLEPSIS_END_DATE,'YYYY-MM-DD HH24:MI:SS') AS PROLEPSIS_END_DATE,  \r\n"
					+ "TO_CHAR(A.TPPB_PLAN_DELIVERY_DATE,'YYYY-MM-DD HH24:MI:SS') AS TPPB_PLAN_DELIVERY_DATE,  \r\n"
					+ "f_get_language(B.VALUE) AS STEP_NAME,  \r\n"
					+ "COALESCE(F.CST_STANDARD_TIME,0) AS CST_STANDARD_TIME  \r\n" + "FROM T_PM_PROJECT_BASE A  \r\n"
					+ "LEFT JOIN SY_DICT_VAL B ON B.DICT_CODE='PROJECT_STEP' AND A.PROJECT_STEP=B.CODE  \r\n"
					+ "LEFT JOIN (  \r\n" + "SELECT  \r\n" + "E.CST_MODEL_CODE,  \r\n" + "E.CST_STEP_CODE,  \r\n"
					+ "COALESCE(SUM(E.CST_STANDARD_TIME),0) AS CST_STANDARD_TIME  \r\n"
					+ "FROM T_CO_STANDARD_TIME E  \r\n" + "WHERE E.CST_SCHEDULE_FLAG='Y'  \r\n"
					+ "GROUP BY E.CST_MODEL_CODE,E.CST_STEP_CODE  \r\n"
					+ ") F ON A.PRODUCT_MATERIAL=F.CST_MODEL_CODE AND A.PROJECT_STEP=F.CST_STEP_CODE \r\n"
					+ "LEFT JOIN ( \r\n" + "SELECT \r\n" + "H.PPW_PROJECT_ID, \r\n"
					+ "COALESCE(SUM(H.PPW_NOW_NUM),0) SUM_NOW_NUM \r\n" + "FROM T_PM_PLAN_INFO H \r\n"
					+ "GROUP BY H.PPW_PROJECT_ID \r\n" + ") I ON A.PROJECT_ID=I.PPW_PROJECT_ID";

			String sqlWhere = " AND A.PROJECT_STATUS='0'\r\n" + " AND A.PROLEPSIS_START_DATE>=TO_DATE('" + planStartDate
					+ "','YYYY-MM-DD HH24:MI:SS')\r\n" + " AND A.PROLEPSIS_START_DATE<=TO_DATE('" + planEndDate
					+ "','YYYY-MM-DD HH24:MI:SS')";
			// 过滤处于T_PM_PLAN_INFO表中且计划数量已达标的工单
			sqlWhere += " AND A.PRODUCT_COUNT>COALESCE(I.SUM_NOW_NUM,0)";
			// 过滤前端已添加入甘特图中，但未保存的工单
			if (!StringUtils.isEmpty(expProjects)) {
				sqlWhere += " AND A.PROJECT_ID NOT IN (" + expProjects + ")";
			}

			sqlWhere += " AND A.DATA_AUTH IN (\r\n" + "SELECT\r\n" + "B.DEPT_ID\r\n" + "FROM SY_USER A\r\n"
					+ "LEFT JOIN SY_DATA_AUTH B ON A.ID=B.USER_ID\r\n" + "WHERE A.ID='"
					+ modelAction.getCurrUser().getId() + "'\r\n" + ")";

			if (StringUtils.isNotBlank(dataAuth)) {
				sqlWhere += " and A.DATA_AUTH='" + dataAuth + "'";
			}
			if (StringUtils.isNotBlank(PRODUCT_MATERIAL)) {
				sqlWhere += " and A.PRODUCT_MATERIAL like '%" + PRODUCT_MATERIAL + "%'";
			}
			if (StringUtils.isNotBlank(PPW_STEP)) {
				sqlWhere += " and A.PROJECT_STEP like '%" + PPW_STEP + "%'";
			}
			if (StringUtils.isNotBlank(PPW_PROJECT_ID)) {
				sqlWhere += " and A.PROJECT_ID like '%" + PPW_PROJECT_ID + "%'";
			}

			List list = modelService.listSql(sql, impl, sqlWhere, null, null, null);

			modelAction.setAjaxPage(impl);
			modelAction.getAjaxPage().setDataList(list);

			return BaseActionSupport.AJAX;
		} catch (Exception ex) {
			log.error(ex);
			return null;
		}
	}

}
