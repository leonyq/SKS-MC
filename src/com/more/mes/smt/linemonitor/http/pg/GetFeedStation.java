/*
 * @File GetFeedStation.java
 * @Package com.more.mes.smt.linemonitor.http
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author csj
 * @date 2017-8-15 下午1:49:11
 * @version V1.0
 */

package com.more.mes.smt.linemonitor.http.pg;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.linemonitor.service.pg.LineMonitorService;

/**
 * @Title 获取线体料站信息
 * @Description 〈功能详细描述〉
 * @ClassName GetFeedStation
 * @author csj
 * @version 1.0 developer 2017-8-15 created
 * @see GetFeedStation
 * @since 2017-8-15
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class GetFeedStation extends InterfaceLog implements IhttpServiceJosn
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
    String areaSN = String.valueOf(service.getDit().get("areaSN")); // 线别
    String deviceSN = String.valueOf(service.getDit().get("deviceSN")); // 设备SN

    LineMonitorService lms = new LineMonitorService();

    service.getDit().put("dataList", lms.getFeedStation(areaSN, deviceSN));

    return null;
  }

}
