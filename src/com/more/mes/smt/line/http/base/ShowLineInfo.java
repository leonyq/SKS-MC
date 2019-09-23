/*
 * @File ShowLineList.java
 * @Package com.more.mes.cs.http
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author csj
 * @date 2017-8-14
 * @version V1.0
 */

package com.more.mes.smt.line.http.base;

import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.line.service.oracle.LineListService;

/**
 * @Title 线体仿真展示
 * @Description 〈功能详细描述〉
 * @ClassName ShowLineList
 * @author csj
 * @version 1.0 developer 2017-8-14 created
 * @see ShowLineList
 * @since 2017-8-14
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class ShowLineInfo extends InterfaceLog implements IhttpServiceJosn
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
    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");

    LineListService lls = new LineListService();

    JSONArray json = null;
    List list = lls.getShowLineList();
    if (list != null && !list.isEmpty())
    {
      json = JSONArray.fromObject(list);
    }

    return json.toString();
  }

}
