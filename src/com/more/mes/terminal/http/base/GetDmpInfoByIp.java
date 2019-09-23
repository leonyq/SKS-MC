package com.more.mes.terminal.http.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.terminal.service.base.TerminalService;

/**
 * HttpCoreService 提供如下:
 *          Map result; 返回结果类型 key: json为json解析       xml 用xml解析     obj 返回对象
 *          Map<String, String> paramTo; 传递参数   service.getParamTo().get("name");
 *          Map resultDto; xml 解析时需要 对象的 .class：
 *                                      resultName.put("xmlBean", HttpConfigDto.class);
 *                                      service.setResultDto(resultName);
 *          DataInteraction dit;对象传输时用到：
 *                                      service.getDit().get("name");
 *                                      service.getDit().put("name", "test");  
 *          Map paramLog; log日志：
 *                          Map map = service.getParamLog();
 *                          map.put("message","用户自定义信息");
 *                          super.log(map);
 */
public class GetDmpInfoByIp extends InterfaceLog implements IhttpServiceJosn {

	  @Override
	  public String exeFunc(HttpCoreService service)
	  {
	      // TODO Auto-generated method stub
		  Map map = new HashMap();
		  try
	      {
			  String ip=service.getParamTo().get("ip");
			  List dataList= TerminalService.getDmpInfoByIp(ip);
			  String jsonStr=TerminalService.MapToJson(dataList);
			  map.put("json", jsonStr);
			  service.setResult(map);
	    	  return null;
	      }
	      catch(Exception e)
	      {
	    	  map.put("json", "{\"Error\":\""+e.toString()+"\"}");
	    	  service.setResult(map);
	          return null;
	      }
	  }
}
