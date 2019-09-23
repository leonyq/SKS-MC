package com.more.mes.pda.http.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.base.PdaServiceUtils;

public class GetCmd extends InterfaceLog implements IhttpServiceJosn{
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String dt_code = StringUtils.toString(service.getParamTo().get("dt_code"));
			String wh_code = StringUtils.toString(service.getParamTo().get("wh_code"));
			String user_name = StringUtils.toString(service.getParamTo().get("user_name"));
			String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			String sqlStr = null;
			Object[] params = null;
			PdaServiceUtils pdaServiceUtils = new PdaServiceUtils();
			if(null!=dt_code && !"".equals(dt_code)) {
				sqlStr="SELECT DISTINCT B.TCL_CODE,B.TCL_NAME\r\n" + 
						"FROM T_WMS_DOC_ORDER A\r\n" + 
						"LEFT JOIN T_COMMAND_LIST B ON A.WDO_ORDER_SN=B.TCL_CODE\r\n" + 
						"LEFT JOIN T_CO_JOB_CMDLIST T3 ON B.TCL_CODE = T3.CMJ_TCL_CODE   \r\n" + 
						"LEFT JOIN SY_JOB T2  ON T3.JOB_ID = T2.Id \r\n" + 
						"LEFT JOIN SY_USER_JOB T1  ON T1.JOB_ID = T2.ID\r\n" + 
						"LEFT JOIN SY_USER T0 ON T1.USER_ID = T0.ID\r\n" + 
						"WHERE A.WDO_TYPE_SN=? AND t0.Login_Name = ? AND A.DATA_AUTH=?";
				params=new Object[] {dt_code,user_name,strOrgCode};
			}
			else 
			{
			    sqlStr="SELECT DISTINCT A.TCL_CODE,B.TCL_NAME\r\n" + 
			    		"FROM T_COMMAND_SET_DETAIL A\r\n" + 
			    		"LEFT JOIN T_COMMAND_LIST B ON A.TCL_CODE=B.TCL_CODE\r\n" + 
			    		"LEFT JOIN T_WMS_AREA C ON A.TCS_CODE=C.WA_RELATE_ORDERSET\r\n" + 
			    		"LEFT JOIN T_CO_JOB_CMDLIST T3 ON B.TCL_CODE = T3.CMJ_TCL_CODE   \r\n" + 
			    		"LEFT JOIN SY_JOB T2  ON T3.JOB_ID = T2.Id \r\n" + 
			    		"LEFT JOIN SY_USER_JOB T1  ON T1.JOB_ID = T2.ID\r\n" + 
			    		"LEFT JOIN SY_USER T0 ON T1.USER_ID = T0.ID                          \r\n" + 
			    		"WHERE NOT EXISTS(SELECT B1.TCL_CODE,B1.TCL_NAME\r\n" + 
			    		"FROM T_WMS_DOC_ORDER A1\r\n" + 
			    		"LEFT JOIN T_COMMAND_LIST B1 ON A1.WDO_ORDER_SN=B1.TCL_CODE\r\n" + 
			    		"WHERE B.TCL_CODE=B1.TCL_CODE AND A1.DATA_AUTH = ?) AND C.WA_AREA_SN=? AND t0.Login_Name = ? AND C.DATA_AUTH=? ";
			    params=new Object[] {strOrgCode,wh_code,user_name,strOrgCode};
			}
			List<Map> list = modelService.listDataSql(sqlStr, params);
			String jsonStr = "";
			if (list!=null&&list.size()>0) {
				jsonStr = pdaServiceUtils.MapListToJson(list);
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			}
			else{
				jsonStr=PdaBaseServiceUtils.foundNoCmdData;
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
			}
			service.setResult(map);
			return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
	    	  service.setResult(map);
	          return null;
		}
	}

}
