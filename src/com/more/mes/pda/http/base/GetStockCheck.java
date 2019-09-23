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

public class GetStockCheck  extends InterfaceLog implements IhttpServiceJosn {
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			String sqlStr="Select WID_DOC_NUM\r\n" + 
            		"from T_WMS_INVENTORY_DOC a\r\n" + 
            		"where WID_STATUS NOT IN ('3','4')\r\n" + 
            		"AND A.DATA_AUTH=?\r\n" + 
            		"order by a.WID_DOC_NUM desc";
			Object[] params=new Object[] {
					strOrgCode
			};
			PdaServiceUtils pdaServiceUtils = new PdaServiceUtils();
			List<Map> list = modelService.listDataSql(sqlStr,params);
			String jsonStr = "";
			if (list!=null&&list.size()>0) {
				jsonStr = pdaServiceUtils.MapListToJson(list);
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			}
			else{
				jsonStr= PdaBaseServiceUtils.foundNoInventoryData;
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
