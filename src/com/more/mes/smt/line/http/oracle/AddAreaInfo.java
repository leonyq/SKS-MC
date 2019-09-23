package com.more.mes.smt.line.http.oracle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONArray;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.line.service.oracle.LineListService;

public class AddAreaInfo extends InterfaceLog implements IhttpServiceJosn
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
    String jsonStr = "";
    jsonStr = service.getParamTo().get("object");

    String areaSn = "";
    areaSn = service.getParamTo().get("areaSn");
    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
    
    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");

    LineListService lls = new LineListService();
    lls.addAreaInfo(jsonStr, areaSn);
    Map map = new HashMap();
    map.put("json", "{\"result\":\"success\"}");
    service.setResult(map);
    return null;
  }

  public List JsonToMap(String jsonStr)
  {

    JSONArray jsonArray = JSONArray.fromObject(jsonStr);

    List<Map<String, Object>> mapList = jsonArray;

    List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
    for (int i = 0; i < mapList.size(); i++ )
    {
      Map<String, Object> map = mapList.get(i);
      for (Entry<String, Object> entry : map.entrySet())
      {
        String keyStr = entry.getKey();
        Object valStr = entry.getValue();
      }
    }
    return result;
  }
}
