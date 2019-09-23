package com.more.mes.aps.week.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.aps.service.base.GetCommonInfo;
import com.morelean.mes.smt.indicator.service.IndicatorTableService;
/**
 * 获取周排程数据接口
 * @author Chaos
 *
 */
public class GetWeekPlanInfo implements FuncService
{
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		//获取操作标识
		HttpServletRequest httpServletRequest = modelAction.getRequest();
		PaginationImpl impl=modelAction.getPage();//定义分页变量
		//获取分页变量
		String dataAuth =httpServletRequest.getSession().getAttribute("mcDataAuth").toString();
		String currentPage=httpServletRequest.getParameter("currentPage");
		String pageRecord=httpServletRequest.getParameter("pageRecord");
		impl.setCurrentPage(null==currentPage?1:Integer.parseInt(currentPage));
		impl.setPageRecord(null==pageRecord?20:Integer.parseInt(pageRecord));
		//获取操作方法
		String opt=httpServletRequest.getParameter("opt");
		
		String jsonData=null;
		List ajaxList=null;
		//根据不同的操作标识进行处理
		if("getPlanInfo".equals(opt)){
			ajaxList=GetCommonInfo.getPlanInfo(httpServletRequest,impl);
			modelAction.setAjaxPage(impl);
		}
		else if("getWeekGantt".equals(opt)){
			jsonData=GetCommonInfo.getWeekGantt(httpServletRequest);
		}
		else if("saveWeekGantt".equals(opt)){
			jsonData=GetCommonInfo.saveWeekGantt(httpServletRequest,modelAction,modelService).toString();
		}
		else if("getExpectInfo".equals(opt)){
			ajaxList=GetCommonInfo.getExpectInfo(httpServletRequest);
		}
		else if("getStandarTime".equals(opt)){
			ajaxList=GetCommonInfo.getStandarTime(httpServletRequest);
		}
		else if("getLineInfo".equals(opt)){
			ajaxList=GetCommonInfo.getLineInfo(httpServletRequest);
		}
		else if("getFaceInfo".equals(opt)){
			ajaxList=GetCommonInfo.getFaceInfo(httpServletRequest);
		}
		else if("getSingleLineWorkTime".equals(opt)){
			jsonData=GetCommonInfo.getSingleLineWorkTime(httpServletRequest);
		}
		else if("saveTransmit".equals(opt)){
			jsonData=GetCommonInfo.saveTransmit(httpServletRequest,modelAction,modelService).toString();
		}
		else if("getMonumber".equals(opt)){
			ajaxList=GetCommonInfo.getMonumber(httpServletRequest);
		}
		else if("deleteTask".equals(opt)){
			jsonData=GetCommonInfo.deleteTask(httpServletRequest,modelService).toString();
		}
		else if("getPerFace".equals(opt)){
			ajaxList=GetCommonInfo.getPerFace(httpServletRequest);
		}
		else if("getCurOrPerFaceMoCount".equals(opt)){
			ajaxList=GetCommonInfo.getCurOrPerFaceMoCount(httpServletRequest);
		}
		else if("getManufacture".equals(opt)){
			ajaxList=GetCommonInfo.getManufacture(httpServletRequest);
		}
		else if("getTrackInfo".equals(opt)){
			ajaxList=GetCommonInfo.getTrackInfo(httpServletRequest);
		}
		else if("getFaceCanPlanNum".equals(opt)){
			ajaxList=GetCommonInfo.getFaceCanPlanNum(httpServletRequest);
		}
		else if("checkInstruction".equals(opt)){
			String projectId=httpServletRequest.getParameter("project");
			String step=httpServletRequest.getParameter("step");
			IndicatorTableService idService = new IndicatorTableService();
			List<Map> mapList=new ArrayList();
			Map msg=new HashMap();
			msg.put("msg", idService.checkMoNum(dataAuth,modelAction, modelService, projectId, step));
			mapList.add(msg);
			ajaxList=mapList;
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
}
