package com.more.mes.ledshelf.http;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.linemonitor.service.base.LineMonitorService;
import com.more.mes.ledshelf.service.*;

public class LedShelfHttpService extends InterfaceLog implements IhttpServiceJosn
{
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
	   * @see com.more.fw.core.dbo.model.dao.BaseDao#find
	   *      (org.springframework.orm.hibernate3.HibernateTemplate, java.lang.String,
	   *      java.lang.Object[])
	   */
	  public List find(HibernateTemplate arg0, String arg1, Object... arg2)
	  {
	    // TODO Auto-generated method stub
	    return null;
	  }

	  /**
	   * @param arg0
	   * @return
	   * @see com.more.fw.http.service.IhttpServiceJosn#exeFunc
	   *      (com.more.fw.http.service.HttpCoreService)
	   */
	  @Override
	  public String exeFunc(HttpCoreService service)
	  {
		  try
		  {
			    String cmd=service.getParamTo().get("CMD");
			    com.more.mes.ledshelf.service.LedShelfService a=new com.more.mes.ledshelf.service.LedShelfService();
			    a.aa(cmd);
			    Map<String, String> map=new HashMap<String, String>();
			    map.put("json", "{\"result\":\"ok\"}");
			    service.setResult(map);
	    
		  }
		  catch(Exception ex)
		  {
			  Map<String, String> map=new HashMap<String, String>();
			  map.put("json", "{\"error\":\""+ex.toString()+"\"}");
			  service.setResult(map);
		  }
		  return null; 
	  }
}
