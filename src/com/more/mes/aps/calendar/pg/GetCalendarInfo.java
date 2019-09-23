package com.more.mes.aps.calendar.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.lang3.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.aps.service.pg.GetCommonInfo;

/**
 * 获取产能日历信息数据相关类
 * @author Chaos 
 *
 */
public class GetCalendarInfo implements FuncService
{
	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		try
		{
			HttpServletRequest httpServletRequest = modelAction.getRequest();
			PaginationImpl impl=modelAction.getPage();//定义分页变量
			String userDataAuth = String.valueOf(httpServletRequest.getSession().getAttribute("mcDataAuth"));
			//获取分页变量
			String currentPage=httpServletRequest.getParameter("currentPage");
			String pageRecord=httpServletRequest.getParameter("pageRecord");
			impl.setCurrentPage(null==currentPage?1:Integer.parseInt(currentPage));
			impl.setPageRecord(null==pageRecord?20:Integer.parseInt(pageRecord));
			//获取操作方法
			String opt=httpServletRequest.getParameter("operation");
			if(opt.equals("getUserDataAuth"))
			{
				//获取组织机构
				String userId=CommMethod.getSessionUser().getId();
				List dataAuthList=GetCommonInfo.getUserDataAuth(userId);
				modelAction.setAjaxList(dataAuthList);
			}
			else if(opt.equals("getLineArea"))
			{
				//String dataAuth=httpServletRequest.getParameter("dataAuth");
				List lineArea=GetCommonInfo.getLineArea(userDataAuth);
				modelAction.setAjaxList(lineArea);
			}
			else if(opt.equals("getProductStep"))
			{
				String areaSn=httpServletRequest.getParameter("areaSn");
				List step=GetCommonInfo.getProductStep(areaSn);
				modelAction.setAjaxList(step);
			}
			else if(opt.equals("getCalendarInfo"))	
			{
				String dataAuth=httpServletRequest.getParameter("dataAuth");
				String year=httpServletRequest.getParameter("year");
				String month=httpServletRequest.getParameter("month");
				String areaSn=httpServletRequest.getParameter("areaSn");
				String step=httpServletRequest.getParameter("step");
				
				Map<String,Object> paramObj=new HashMap();
                if(!StringUtils.isEmpty(dataAuth))
                {
                	paramObj.put("DATA_AUTH", dataAuth);
                }
                if(!StringUtils.isEmpty(areaSn))
                {
                	paramObj.put("PPC_AREA_SN", areaSn);
                }
                if(!StringUtils.isEmpty(step))
                {
                	paramObj.put("PPC_PRODUCT_STEP", step);
                }
                List calDataList=GetCommonInfo.getCalendarInfo(paramObj, year, month,impl);
                modelAction.setAjaxList(calDataList);
			}
			else if(opt.equals("delete"))
			{
				String calId=httpServletRequest.getParameter("dataId");
				if(!StringUtils.isEmpty(calId))
				{
					GetCommonInfo.delCalendarInfo(calId);
				}
			}
			else if(opt.equals("getNoWriteLine"))
			{
				String currentArea=httpServletRequest.getParameter("currentArea");
				List areaList = GetCommonInfo.getNoWriteLine(currentArea);
				modelAction.setAjaxList(areaList);
			}
			else if("getLineCalWorkTimeInfo".equals(opt)){
				String lineSn=httpServletRequest.getParameter("lineSn");
				String startTime=httpServletRequest.getParameter("startTime");
				String endTime=httpServletRequest.getParameter("endTime");
				Map<String,List> returnMap=GetCommonInfo.getLineCalWorkTimeInfo(lineSn,startTime,endTime);
				modelAction.setAjaxMap(returnMap);
			}
			else if("getExceptionAvaliableTime".equals(opt)){
				String lineSn=httpServletRequest.getParameter("lineSn");
				String startTime=httpServletRequest.getParameter("startTime");
				String endTime=httpServletRequest.getParameter("endTime");
				String exptType=httpServletRequest.getParameter("exptType");
				int avaTime=GetCommonInfo.getExceptionAvaliableTime(lineSn,startTime,endTime,exptType);
				return modelAction.outJson(Integer.toString(avaTime),Constants.CHARACTER_ENCODING_UTF_8);
			}
			
			modelAction.setAjaxPage(impl);
			return BaseActionSupport.AJAX;
		}
		catch(Exception ex)
		{
			return null;
		}
	}
}
