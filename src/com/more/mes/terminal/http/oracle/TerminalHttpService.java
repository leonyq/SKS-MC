package com.more.mes.terminal.http.oracle;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.terminal.service.*;
import com.more.mes.terminal.service.oracle.TerminalService;

public class TerminalHttpService extends InterfaceLog implements IhttpServiceJosn
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
			  String sql=service.getParamTo().get("sql");
			  List dataList= TerminalService.DoSingleSqlQuery(sql);
			  //Map dataMap=(Map)dataList.get(0);
			  JSONArray json = JSONArray.fromObject(dataList);
			  map.put("json", json.toString());
			  service.setResult(map);
	    	  return null;
	      }
	      catch(Exception e)
	      {
	    	  map.put("json", "{\"Error\":\""+e.getMessage()+"\"}");
	    	  service.setResult(map);
	          return null;
	      }
	  }
}
