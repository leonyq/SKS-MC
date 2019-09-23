package com.more.mes.smt.packing.httpinterface.base;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
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
public class GetPackingPrintInfo extends InterfaceLog implements IhttpServiceJosn {

	@Override
	public String exeFunc(HttpCoreService service) {
		
		return null;
	}

}
