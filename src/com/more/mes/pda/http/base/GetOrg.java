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
 * 登录获取组织机构信息
 * @author Administrator
 *
 */
public class GetOrg extends InterfaceLog implements IhttpServiceJosn{

	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");

	
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String strUserNO = StringUtils.toString(service.getParamTo().get("strUserNO"));
			String sqlStr="SELECT C.ID AS O_CODE,C.NAME AS O_NAME FROM SY_USER A\r\n" + 
					"LEFT JOIN SY_DATA_AUTH B ON A.ID=B.USER_ID\r\n" + 
					"LEFT JOIN SY_DEPT C ON B.DEPT_ID=C.ID\r\n" + 
					"WHERE A.LOGIN_NAME=?";
			PdaServiceUtils pdaServiceUtils = new PdaServiceUtils();
			Object[] params=new Object[] {
					strUserNO
			};
			List<Map> list = modelService.listDataSql(sqlStr, params);
			String jsonStr = "";
			if (list!=null&&list.size()>0) {
				jsonStr = pdaServiceUtils.MapToJson(list.get(0));
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			}
			else{
				jsonStr=PdaBaseServiceUtils.userNameError;
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
