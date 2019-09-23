/*
 * @File TestAjaxCrossDomain.java
 * @Package com.more.mes.smt.linemonitor.http
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author hxh
 * @date 2017-8-15 下午2:31:50
 * @version V1.0
 */

package com.more.mes.smt.linemonitor.http;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

/**
 * @Title 〈一句话功能简述〉
 * @Description 〈功能详细描述〉
 * @ClassName TestAjaxCrossDomain
 * @author hxh
 * @version 1.0 developer 2017-8-15 created
 * @see TestAjaxCrossDomain
 * @since 2017-8-15
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class TestAjaxCrossDomain extends InterfaceLog implements IhttpServiceJosn
{
  //
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
    service.getResponse().addHeader("Access-Control-Allow-Origin", "*");
    service.getResponse().addHeader("Access-Control-Allow-Methods", "POST");
    service.getResponse().addHeader("Access-Control-Allow-Headers", "*");
    Map<String, String> map = new HashMap<String, String>();
    map.put("json", "{\"result\":\"success\"}");
    service.setResult(map);
    return "json";
  }

}
