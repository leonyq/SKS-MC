package com.more.mes.visual.http.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.line.service.pg.LineListService;
import com.more.mes.smt.linemonitor.service.pg.LineMonitorService;
import com.more.mes.visual.service.pg.VisualService;

import net.sf.json.JSONArray;

public class PoInCount extends InterfaceLog implements IhttpServiceJosn
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
		  Map map = new HashMap();
		  String areaSn = "";//仓库编码
		  if(service.getParamTo().get("areaSn")!=null){
				 areaSn = service.getParamTo().get("areaSn");
			 }
		  try
		  {    
			      VisualService vs=new VisualService();
				  List dataList= vs.poInCount(areaSn);
                  JSONArray json = new JSONArray();
                  if (dataList != null && !dataList.isEmpty())
                  {
                   json = JSONArray.fromObject(dataList);
                  }
	              map.put("json", json);
				  service.setResult(map);
			    
	    
		  }
		  catch(Exception ex)
		  {
			  map.put("json", "{\"error\":\""+ex.toString()+"\"}");
			  service.setResult(map);
		  }
		  service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
          service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
          service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
          service.getResponse().setHeader("Content-type", "text/html;charset=UTF-8"); 
		  return null; 
	  }

}
