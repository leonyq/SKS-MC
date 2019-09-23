package com.more.mes.smt.line.http.oracle;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.line.service.oracle.LineListService;
/**
 * @Title 获取时段直通率
 * @Description 〈功能详细描述〉
 * @ClassName ShowLineList
 * @author csj
 * @version 1.0 developer 2017-8-14 created
 * @see ShowLineList
 * @since 2017-8-14
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GetCkcAreaSn extends InterfaceLog implements IhttpServiceJosn {

	@Override
	public String exeFunc(HttpCoreService service)
	{
		  String areaSn = "";
		  Map map = new HashMap();
	      areaSn = service.getParamTo().get("areaSn");
	      LineListService vs=new LineListService();
		  List dataList = null;
		  dataList = vs.getCkcAreaSn(areaSn);
	      JSONArray json = new JSONArray();
	      if (dataList != null && !dataList.isEmpty())
	      {
	       json = JSONArray.fromObject(dataList);
	      }
	      map.put("json", json);
		  service.setResult(map);

	    return null;
	  }
}
