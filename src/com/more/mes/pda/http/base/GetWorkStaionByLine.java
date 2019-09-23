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

public class GetWorkStaionByLine extends InterfaceLog implements IhttpServiceJosn{
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");

	
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String strLine = StringUtils.toString(service.getParamTo().get("strLine"));
			String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			String sqlStr="select CA_ID as stationsn,CA_NAME as stationname \r\n" + 
            		"from T_CO_AREA \r\n" + 
            		"where CA_PARENTAREAID = ? AND CA_TYPE ='2' AND DATA_AUTH=?\r\n" + 
            		"order by CA_NAME";
			PdaServiceUtils pdaServiceUtils = new PdaServiceUtils();
			Object[] params=new Object[] {
					strLine,strOrgCode
			};
			List<Map> list = modelService.listDataSql(sqlStr, params);
			String jsonStr = "";
			if (list!=null&&list.size()>0) {
				jsonStr = pdaServiceUtils.MapListToJson(list);
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			}
			else{
				jsonStr= PdaBaseServiceUtils.foundNoWorkStationData;
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
