package com.more.mes.pda.http.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.oracle.PdaServiceUtils;

public class GetSNList extends InterfaceLog implements IhttpServiceJosn{
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			String ITEM_SN = StringUtils.toString(service.getParamTo().get("ITEM_SN"));
			String DOC_NUMBER = StringUtils.toString(service.getParamTo().get("DOC_NUMBER"));
			PdaServiceUtils serviceUtils=new PdaServiceUtils();
			List<Map> list = serviceUtils.getSNList(ITEM_SN, DOC_NUMBER, strOrgCode);
			String jsonStr = "";
			if(null==list || list.size()<=0){
				  jsonStr=PdaBaseServiceUtils.foundNoItemSnData;
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
			  }
			  else {
				  jsonStr=serviceUtils.MapListToJson(list);
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
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
