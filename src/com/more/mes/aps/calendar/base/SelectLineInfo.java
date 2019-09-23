package com.more.mes.aps.calendar.base;

import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SelectLineInfo implements FuncService
{
	private static final Log log = LogFactory.getLog("com.more.mes.aps.calendar.base.SelectLineInfo");
	
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
		//是否关闭窗口
		String isCloseWin=httpServletRequest.getParameter("isCloseWin");
		
		String jsonData=null;
		List ajaxList=null;
		//根据不同的操作标识进行处理
		if("getLineInfo".equals(opt)){
			ajaxList=this.getLineInfo(httpServletRequest,modelService,impl);
		}
		if("getStep".equals(opt)){
			ajaxList=this.getStep(httpServletRequest,modelService);
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
	 * 获取线体信息
	 * @param httpServletRequest
	 * @return
	 */
	private List getLineInfo(HttpServletRequest httpServletRequest,ModelService modelService,PaginationImpl impl){
		try{
			//获取查询条件
			String step=httpServletRequest.getParameter("step");
			String exceptLine=httpServletRequest.getParameter("exceptLine");
			String exceptionnotexist=httpServletRequest.getParameter("exceptionnotexist");
			String whereStr="";
			List<Object> paramObject=new ArrayList();
			List<Integer> paramTypeVar=new ArrayList();
			if(StringUtils.isNotEmpty(step)){
				whereStr+=" AND A.CA_PROJECT_STEP=?";
				paramObject.add(step);
				paramTypeVar.add(Types.VARCHAR);
			}
			if(StringUtils.isNotEmpty(exceptLine)){
				whereStr+=" AND A.CA_ID<>?";
				paramObject.add(exceptLine);
				paramTypeVar.add(Types.VARCHAR);
			}
			if(StringUtils.isNotEmpty(exceptionnotexist)){
				whereStr+=" AND A.CA_ID NOT IN(\r\n" + 
						"SELECT\r\n" + 
						"B.PPC_AREA_SN\r\n" + 
						"FROM T_PM_PLAN_CALENDAR B \r\n" + 
						")";
			}
			//查询数据
			String sqlStr="SELECT\r\n" + 
					"A.CA_ID,\r\n" + 
					"A.CA_NAME\r\n" + 
					"FROM T_CO_AREA A\r\n" + 
					"WHERE A.CA_TYPE='1' %s";
			int[] paramType=new int[paramTypeVar.size()];
			for(int i=0,len=paramTypeVar.size();i<len;i++){
				paramType[i]=paramTypeVar.get(i);
			}
			return modelService.listSql(String.format(sqlStr, whereStr),impl,null,paramObject.toArray(),paramType,"ORDER BY CA_NAME ASC",null);
		}
		catch(Exception ex){
			log.error("getSourceLine:",ex);
			return null;
		}
	}
	
	/**
	 * 获取阶别信息
	 * @param httpServletRequest
	 * @param modelService
	 * @param impl
	 * @return
	 */
	private List getStep(HttpServletRequest httpServletRequest,ModelService modelService){
		try{
			//查询数据
			String sqlStr="SELECT\r\n" + 
					"f_c_get_multilingual(A.VALUE) AS STEP_NAME,\r\n" + 
					"A.CODE AS STEP_CODE\r\n" + 
					"FROM SY_DICT_VAL A\r\n" + 
					"WHERE A.DICT_CODE='PROJECT_STEP'\r\n" + 
					"ORDER BY A.CODE ASC";
			return modelService.listDataSql(sqlStr);
		}
		catch(Exception ex){
			log.error("getStep:",ex);
			return null;
		}
	}
}
