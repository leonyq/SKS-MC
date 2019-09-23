package com.more.mes.smt.devicedataset.http.pg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.devicedataset.service.pg.DeviceDataService;
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
public class DeviceDataSeting extends InterfaceLog implements IhttpServiceJosn {

	@Override
	public String exeFunc(HttpCoreService service) {
		 Map<String,Object> map=new HashMap<String,Object>();
		  try
	      {
		//数据传递取值(设备SN)
		  String deviceSn = service.getParamTo().get("deviceSn");
		  Map<String,Object> mapValue=DeviceDataService.GetDeviceSetData(deviceSn);
		  JSONArray json = null;
		  List list=new ArrayList<>();
		  json = JSONArray.fromObject(mapValue);
		  map.put("json", json);
		  service.setResult(map);
		  service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		  service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
		  service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
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

