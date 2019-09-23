package com.more.mes.pda.http;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.PdaService;

public class GetPdaSetting extends InterfaceLog implements IhttpServiceJosn {

	/**
	   * @param arg0
	   * @return
	   * @see com.more.fw.http.service.IhttpServiceJosn#exeFunc(com.more.fw.http.service.HttpCoreService)
	   */
	  @Override
	  public String exeFunc(HttpCoreService service)
	  {
	    // TODO Auto-generated method stub
		  Map map = new HashMap();
		  try
	      {
			  String type = StringUtils.toString(service.getParamTo().get("settingType"));//获取PDA设置的类型
			  Map dataMap =PdaService.getPdaSetting(type);
			  String jsonStr=PdaService.MapToJson(dataMap);
			  map.put("json", jsonStr);
			  service.setResult(map);
			  return null;
	      }
	      catch(Exception e)
	      {
	    	  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
	    	  service.setResult(map);
	          return null;
	      }
	  }
}