package com.more.mes.smt.maintenance;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 产品维修---误判
 * @Description 产品维修---误判--视图加载前
 * @ClassName ErrorJudge
 * @author Administrator
 * @version 1.0 developer 2017-7-25 created
 * @see ErrorJudge
 * @since 2017-7-25
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ErrorJudge implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest t = modelAction.getRequest();
		String id = t.getParameter("id");
		String weSn = t.getParameter("weSn");
		String dataAuth = t.getParameter("dataAuth");
		modelAction.getParaMap().put("dataAuth", dataAuth);
		Map dataMap = new HashMap();
		String dataId = modelAction.getDataId();
		String sql = "SELECT T.ID,T.WE_ERROR_CODE,t.WE_MO_NUMBER,t.WE_SN,t.WE_MODEL_CODE,t.WE_PROCESS_FACE, A.CEC_DESC,T.WE_POINT,"
				+ "   T.WE_TEST_GROUP,    T.WE_WORK_STATION,      TO_CHAR(T.WE_TEST_TIME, 'YYYY-MM-DD HH24:MI:SS') WE_TEST_TIME,"
				+ "       D.NAME  FROM T_WIP_ERROR T   LEFT JOIN T_CO_ERROR_CODE A    ON A.CEC_CODE = T.WE_ERROR_CODE and a.data_auth=t.data_auth "
				+ " LEFT JOIN SY_USER D ON (D.ID=T.WE_TEST_EMP or d.login_name=T.WE_TEST_EMP) where t.id=? and t.WE_SN=? ";
		dataMap = modelService.queryForMap(sql, new Object[] { id, weSn });
		String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), DateUtil.yyyyMMddHHmmss);
		dataMap.put("nowDate", nowDate);
		dataMap.put("userId", CommMethod.getSessionUser().getId());
		CommMethod.mapToEscapeJs(dataMap);
		modelAction.setDataMap(dataMap);
		return modelAction.ActionForwardExeid(modelAction.getExeid());//
	}
}