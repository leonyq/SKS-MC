package com.more.mes.smt.line.http.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.line.service.pg.LineListService;

public class GetWorkstationList extends InterfaceLog implements IhttpServiceJosn
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
    String dataAuth = service.getRequest().getParameter("dataAuth");
    LineListService lls = new LineListService();

    JSONArray json = null;
    List list = lls.getWorksationInfoWithDataAuth(dataAuth);
    
    if (list != null && !list.isEmpty())
    {
      json = JSONArray.fromObject(list);
    }
    Map map = new HashMap();
    map.put("json", json);
    service.setResult(map);

    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
    return null;
  }

}
