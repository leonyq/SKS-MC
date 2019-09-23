package com.more.mes.pda.http.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.pg.PdaServiceUtils;

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
public class GetDocForType extends InterfaceLog implements IhttpServiceJosn {

	  @Override
	  public String exeFunc(HttpCoreService service)
	  {
		  // TODO Auto-generated method stub
		  Map map = new HashMap();
		  try
	      {
			  String strDocType = StringUtils.toString(service.getParamTo().get("strDocType"));//单据类型
			  String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));//组织机构
			  String areaSn = StringUtils.toString(service.getParamTo().get("areaSn"));//组织机构
			  PdaServiceUtils serviceUtils=new PdaServiceUtils();
			  List<Map> dataList =serviceUtils.getDocForType(strDocType, strOrgCode, areaSn);
			  String jsonStr="";
			  if(null==dataList || dataList.size()<=0){
				  jsonStr="未获取到单据";
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
			  }
			  else {
				  jsonStr=serviceUtils.MapListToJson(dataList);
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			  }
			  service.setResult(map);
			  return null;
	      }
	      catch(Exception e)
	      {
	    	  map.put("json", "{\"Error\":\""+e+"\"}");
	    	  service.setResult(map);
	          return null;
	      }
	  }
}
