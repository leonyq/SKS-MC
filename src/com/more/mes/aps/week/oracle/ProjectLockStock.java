
package com.more.mes.aps.week.oracle;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.other.common.method.CommonMethod;
import com.more.mes.other.common.method.CommonMethod.DataStruct;
import com.more.mes.other.common.method.CommonMethod.DataStruct.Condition;
import com.more.mes.other.common.method.CommonMethod.DataStruct.PageImpl;
import com.more.mes.other.common.method.CommonMethod.Enums;
 /**
  *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
  *
  */
public class ProjectLockStock implements FuncService
{
	private static final Log log = LogFactory
			.getLog("com.more.mes.aps.week.ProjectLockStock");
	private static final DataStruct ds = new DataStruct();
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		//获取操作标识
		HttpServletRequest httpServletRequest = modelAction.getRequest();
		PaginationImpl impl=modelAction.getPage();//定义分页变量
		//获取分页变量
		String currentPage=httpServletRequest.getParameter("currentPage");
		String pageRecord=httpServletRequest.getParameter("pageRecord");
		impl.setCurrentPage(null==currentPage?1:Integer.parseInt(currentPage));
		impl.setPageRecord(null==pageRecord?20:Integer.parseInt(pageRecord));
		//获取操作方法
		String opt=httpServletRequest.getParameter("opt");
		
		String jsonData=null;
		List ajaxList=null;
		//根据不同的操作标识进行处理
		if("query".equals(opt)){
			ajaxList=query(httpServletRequest,impl,modelService);
			modelAction.setAjaxPage(impl);
		}
		if(null!=jsonData){//直接返回json，适用于没有分页的情况下
			return modelAction.outJson(jsonData,Constants.CHARACTER_ENCODING_UTF_8); 
		}
		else if(null!=ajaxList){//返回List，适用于有分页的情况下
			modelAction.setAjaxList(ajaxList);
			modelAction.setAjaxPage(impl);
			return BaseActionSupport.AJAX;
		}
		else {
			modelAction.setAjaxPage(impl);
			return BaseActionSupport.AJAX;
		}
	}
	
	/**
	 * 获取工单齐套信息
	 * @return
	 */
	private List query(HttpServletRequest httpServletRequest,PaginationImpl impl,ModelService modelService){
		try{
			//获取参数
			String projectId=httpServletRequest.getParameter("projectId");
			String isKitting=httpServletRequest.getParameter("isKitting");
			String dataAuth =httpServletRequest.getParameter("dataauth");
			String sqlStr="SELECT\r\n" + 
					"T.*\r\n" + 
					"FROM (\r\n" + 
					"SELECT \r\n" + 
					"A.PROJECT_ID, \r\n" + 
					"B.CBD_ITEM_CODE, \r\n" + 
					"NVL(C.CI_ITEM_NAME,' ') AS CI_ITEM_NAME, \r\n" + 
					"NVL(C.CI_ITEM_SPEC,' ') AS CI_ITEM_SPEC, \r\n" + 
					"NVL(B.CBD_ITEM_NUM,0) AS CBD_ITEM_NUM, \r\n" + 
					"(NVL(A.PRODUCT_COUNT,0)-NVL(A.FINISH_COUNT,0))*NVL(B.CBD_ITEM_NUM,0) AS TOTAL_NEED_NUM, \r\n" + 
					"NVL(STOCK.WSI_ITEM_NUM,0) AS STOCK_NUM, \r\n" + 
					"NVL(STOCK.WSI_ITEM_NUM,0)-NVL(LOCK_INFO.WLD_LOCK_NUM,0) AS CAN_LOCK,\r\n" + 
					"CASE WHEN NVL(B.CBD_ITEM_NUM,0)=0 \r\n" + 
					"  THEN 0 \r\n" + 
					"    ELSE \r\n" + 
					"     CASE WHEN ROUND((NVL(STOCK.WSI_ITEM_NUM,0)-NVL(LOCK_INFO.WLD_LOCK_NUM,0))/NVL(B.CBD_ITEM_NUM,0),0)> (NVL(A.PRODUCT_COUNT,0)-NVL(A.FINISH_COUNT,0)) THEN (NVL(A.PRODUCT_COUNT,0)-NVL(A.FINISH_COUNT,0))\r\n" + 
					"       ELSE ROUND((NVL(STOCK.WSI_ITEM_NUM,0)-NVL(LOCK_INFO.WLD_LOCK_NUM,0))/NVL(B.CBD_ITEM_NUM,0),0) END\r\n" + 
					"     END KITTING,\r\n" + 
					"CASE WHEN ((NVL(A.PRODUCT_COUNT,0)-NVL(A.FINISH_COUNT,0))*NVL(B.CBD_ITEM_NUM,0))>(NVL(STOCK.WSI_ITEM_NUM,0)-NVL(LOCK_INFO.WLD_LOCK_NUM,0))\r\n" + 
					"  THEN '2'\r\n" + 
					"    ELSE '1' END IS_KITTING\r\n," + 
					"A.DATA_AUTH \r\n"+
					"FROM T_PM_PROJECT_BASE A \r\n" + 
					"LEFT JOIN T_PM_PROJECT_DETAIL B ON A.PROJECT_ID=B.PROJECT_ID \r\n" + 
					"LEFT JOIN T_CO_ITEM C ON B.CBD_ITEM_CODE=C.CI_ITEM_CODE \r\n" + 
					"LEFT JOIN ( \r\n" + 
					"SELECT \r\n" + 
					"A.WSI_ITEM_CODE, \r\n" + 
					"NVL(SUM(A.WSI_ITEM_NUM),0) AS WSI_ITEM_NUM \r\n" + 
					"FROM T_WMS_STOCK_INFO A \r\n" + 
					"WHERE (A.WSI_STOCK_FLAG = '2' OR A.WSI_STOCK_FLAG = '6') \r\n" + 
					"AND A.WSI_INSPECT_FLAG = 'Y'  \r\n" + 
					"AND A.WSI_FREEZE_FLAG = 'N'  \r\n" + 
					"GROUP BY A.WSI_ITEM_CODE \r\n" + 
					")STOCK ON B.CBD_ITEM_CODE=STOCK.WSI_ITEM_CODE \r\n" + 
					"LEFT JOIN ( \r\n" + 
					"SELECT \r\n" + 
					"A.WLD_ITEM_CODE, \r\n" + 
					"NVL(SUM(A.WLD_LOCK_NUM),0) AS WLD_LOCK_NUM \r\n" + 
					"FROM T_WMS_LOCKSTOCK_DETAIL A \r\n" + 
					"LEFT JOIN T_WMS_LOCKSTOCK_DOC B ON A.WLD_LOCK_DOC=B.WLD_LOCK_DOC \r\n" + 
					"WHERE A.WLD_LOCK_STATUS='1' \r\n" + 
					"AND B.WLD_LOCK_STATUS='1' \r\n" + 
					"GROUP BY A.WLD_ITEM_CODE \r\n" + 
					")LOCK_INFO ON B.CBD_ITEM_CODE=LOCK_INFO.WLD_ITEM_CODE \r\n" + 
					") T WHERE 1=1  %s";
			List<Condition> conditions = new ArrayList();
			if (!StringUtils.isEmpty(projectId)) {
				conditions.add(ds.new Condition("T",Enums.conditionReference.rightLike,
						Enums.conditionType.varchar, "PROJECT_ID",
						projectId));
			}
			if (!StringUtils.isEmpty(isKitting)) {
				conditions.add(ds.new Condition("T",Enums.conditionReference.equal,
						Enums.conditionType.varchar, "IS_KITTING",
						isKitting));
			}
			if (!StringUtils.isEmpty(dataAuth)){
			    conditions.add(ds.new Condition("T",Enums.conditionReference.equal,
			            Enums.conditionType.varchar,"DATA_AUTH",
			            dataAuth));
			}
			
			PageImpl pIpml = ds.new PageImpl(impl,
					"ORDER BY T.PROJECT_ID,T.CBD_ITEM_CODE");
			// 查询
			return CommonMethod.Common.getDataList(sqlStr, conditions, pIpml);
		}
		catch(Exception ex){
			log.error("query:",ex);
			return null;
		}
	}
}
