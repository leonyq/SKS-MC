package com.more.mes.aps.month.oracle;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.aps.service.oracle.GetCommonInfo;

/**
 * 月排程----月排程查询
 * 
 */
public class MonthAction implements FuncService {

	private static final ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	private static final String PC_PREFIX = "DJ26";

	private static final Log log = LogFactory.getLog("com.more.mes.aps.service.MonthAction");

	@SuppressWarnings({ "static-access" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		UserDto loginUser = CommMethod.getSessionUser();
		String oper = request.getParameter("operator");
		// --------------------------------------------------------------update by cc
		// 2018-5-21
		String jsonData = null;
		List ajaxList = null;
		HttpServletRequest httpServletRequest = modelAction.getRequest();
		if ("getMonthGantt".equals(oper)) {
			jsonData = GetCommonInfo.getMonthGantt(httpServletRequest);
		} else if ("saveMonthGantt".equals(oper)) {
			jsonData = GetCommonInfo.saveMonthGantt(httpServletRequest, modelAction, modelService).toString();
		} else if ("deleteMonthPlanTask".equals(oper)) {
			jsonData = GetCommonInfo.deleteMonthPlanTask(httpServletRequest, modelService).toString();
		}
		/*
		 * else if("getSplitInfo".equals(oper)){
		 * ajaxList=GetCommonInfo.getSplitInfo(httpServletRequest); }
		 */
		else if ("saveSplit".equals(oper)) {
			jsonData = GetCommonInfo.saveSplit(httpServletRequest, modelAction, modelService).toString();
		} else if ("getMonthPlanDoc".equals(oper)) {
			ajaxList = GetCommonInfo.getMonthPlanDoc(httpServletRequest, modelAction, modelService);
		} else if ("getSingleStepWorkTime".equals(oper)) {
			jsonData = GetCommonInfo.getSingleStepWorkTime(httpServletRequest);
		} else if ("getProjectByContian".equals(oper)) {
			ajaxList = GetCommonInfo.getProjectByContian(httpServletRequest);
		} else if ("validateMonthCanToDelete".equals(oper)) {
			ajaxList = GetCommonInfo.validateMonthCanToDelete(httpServletRequest);
		} else if ("getPlanMonumberInfo".equals(oper)) {
			ajaxList = GetCommonInfo.getPlanMonumberInfo(httpServletRequest);
		}

		if (null != jsonData) {// 直接返回json，适用于没有分页的情况下
			return modelAction.outJson(jsonData, Constants.CHARACTER_ENCODING_UTF_8);
		} else if (null != ajaxList) {// 返回List，适用于有分页的情况下
			modelAction.setAjaxList(ajaxList);
			return modelAction.AJAX;
		} else {
			return modelAction.AJAX;
		}
	}
}
