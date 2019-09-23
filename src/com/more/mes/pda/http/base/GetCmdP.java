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

/**
 * 生产页面加载指令按钮
 * @author Administrator
 *
 */
public class GetCmdP extends InterfaceLog implements IhttpServiceJosn{
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String userName = StringUtils.toString(service.getParamTo().get("userName"));
			String cmbArea = StringUtils.toString(service.getParamTo().get("cmbArea"));
			String sqlStr="SELECT DISTINCT T3.CMJ_TCL_CODE AS COMMANDCODE, T4.TCL_NAME AS COMMANDNAME\r\n" + 
					"                         FROM t_command_list T4\r\n" + 
					"                           LEFT JOIN T_CO_JOB_CMDLIST T3 ON T4.TCL_CODE = T3.CMJ_TCL_CODE   LEFT JOIN SY_JOB T2\r\n" + 
					"                                ON T3.JOB_ID = T2.Id LEFT JOIN SY_USER_JOB T1\r\n" + 
					"                                 ON T1.JOB_ID = T2.ID\r\n" + 
					"                                  LEFT JOIN SY_USER T0 ON T1.USER_ID = T0.ID\r\n" + 
					"                                   where t0.Login_Name = ?\r\n" + 
					"                                    and T3.CMJ_TCL_CODE in (select T4.TCL_CODE\r\n" + 
					"                                    from T_CO_AREA A \r\n" + 
					"                                       LEFT JOIN T_WORKSTATION_CMD B ON A.CA_ID = B.TW_STATIONSN\r\n" + 
					"                                        LEFT JOIN T_COMMAND_SET_DETAIL C\r\n" + 
					"                                         ON C.TCS_CODE = B.TCS_CODE\r\n" + 
					"                                         LEFT JOIN t_command_list t4\r\n" + 
					"                                          ON T4.TCL_CODE = C.TCL_CODE\r\n" + 
					"                                        AND T4.TCL_TYPE = 'B'\r\n" + 
					"                                          WHERE A.CA_ID = ?\r\n" + 
					"                                          )\r\n" + 
					"                                        ORDER BY T3.CMJ_TCL_CODE";
			PdaServiceUtils pdaServiceUtils = new PdaServiceUtils();
			Object[] params=new Object[] {
					userName,cmbArea
			};
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
