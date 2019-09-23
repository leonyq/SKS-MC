package com.more.mes.smt.problemreport;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 改善措施页面回填原因分析信息
 * @author development
 *
 */
public class AjaxGetCauseInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		 String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String docNum = request.getParameter("docNum");
		String sql = "select t2.name as sname ,to_char(t1.cpc_cause_time,'YYYY-MM-DD hh24:mi:ss') as cpc_cause_time,t1.cpc_cause_type,t1.cpc_cause_analysis from T_CO_PROBLEM_CAUSE t1 "+
        "LEFT JOIN sy_user t2 on t2.id = t1.cpc_cause_emp "+
        "where t1.CPC_SN=? AND t1.data_auth=?  ";
		List pList = modelService.listDataSql(sql, new Object[] {docNum,dataAuth});
		CommMethod.listToEscapeJs(pList);
		modelAction.setAjaxList(pList);
		return BaseActionSupport.AJAX;
	}

}
