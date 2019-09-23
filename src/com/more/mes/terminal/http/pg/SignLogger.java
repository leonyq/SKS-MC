package com.more.mes.terminal.http.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.terminal.service.pg.TerminalService;

public class SignLogger extends InterfaceLog implements IhttpServiceJosn {
	
	/**
	   * @param arg0
	   * @param arg1
	   * @return
	   * @see com.more.fw.core.dbo.model.dao.BaseDao#find(java.lang.String, java.lang.Object[])
	   */
	  public List find(String arg0, Object... arg1)
	  {
	    // TODO Auto-generated method stub
	    return null;
	  }

	  /**
	   * @param arg0
	   * @param arg1
	   * @param arg2
	   * @return
	   * @see com.more.fw.core.dbo.model.dao.BaseDao#find(org.springframework.orm.hibernate3.HibernateTemplate,
	   *      java.lang.String, java.lang.Object[])
	   */
	  public List find(HibernateTemplate arg0, String arg1, Object... arg2)
	  {
	    // TODO Auto-generated method stub
	    return null;
	  }

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
			  String controllerIp=service.getParamTo().get("controllerIp");
			  String workStation=service.getParamTo().get("workStation");
			  String sensor=service.getParamTo().get("sensor");
			  String smema=service.getParamTo().get("smema");
			  String redGreenLight=service.getParamTo().get("redGreenLight");
			  String yellow=service.getParamTo().get("yellow");
			  String scaner=service.getParamTo().get("scaner");
			  String call=service.getParamTo().get("call");
			  String pass=service.getParamTo().get("pass");
			  String lastTime=service.getParamTo().get("lastTime");
			  Map<String,String>  mapData=new HashMap();
			  mapData.put("controllerIp", controllerIp);
			  mapData.put("workStation", workStation);
			  mapData.put("sensor", sensor);
			  mapData.put("smema", smema);
			  mapData.put("redGreenLight", redGreenLight);
			  mapData.put("yellow", yellow);
			  mapData.put("scaner", scaner);
			  mapData.put("call", call);
			  mapData.put("pass", pass);
			  mapData.put("lastTime", lastTime);
			  String result=TerminalService.loggerSign(mapData);
			  map.put("json", "{\"Result\":\""+result+"\"}");
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

