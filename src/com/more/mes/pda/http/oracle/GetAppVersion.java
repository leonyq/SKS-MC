package com.more.mes.pda.http.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.oracle.PdaServiceUtils;

/**
 * 登录APP版本升级接口
 * @author ZLK
 *
 */
public class GetAppVersion extends InterfaceLog implements IhttpServiceJosn{

	@Override
	public String exeFunc(HttpCoreService arg0) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			PdaServiceUtils pdaServiceUtils = new PdaServiceUtils();
			List<Map> list = pdaServiceUtils.getAppVersion();
			String jsonStr = "";
			if(null==list || list.size()<=0){
				  jsonStr=PdaBaseServiceUtils.foundNoVersion;
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
			  }
			  else {
				  jsonStr="\""+list.get(0).get("VERSION_NO").toString()+"\"";
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			  }
			arg0.setResult(map);
			return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
			arg0.setResult(map);
	          return null;
		}
	}
		
}
