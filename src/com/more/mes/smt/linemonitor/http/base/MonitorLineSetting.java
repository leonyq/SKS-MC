/*
 * @File SaveMonitorLine.java
 * @Package com.more.mes.smt.linemonitor.http
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author hxh
 * @date 2017-8-10 下午1:29:59
 * @version V1.0
 */

package com.more.mes.smt.linemonitor.http.base;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.linemonitor.service.base.LineMonitorService;

/**
 * @Title 线体监控设置信息
 * @Description 〈功能详细描述〉
 * @ClassName SaveMonitorLine
 * @author hxh
 * @version 1.0 developer 2017-8-10 created
 * @see MonitorLineSetting
 * @since 2017-8-10
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class MonitorLineSetting extends InterfaceLog implements IhttpServiceJosn
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
    String opt = String.valueOf(service.getDit().get("opt"));// 操作类型0：新增，1：获取列表
    LineMonitorService lms = new LineMonitorService();
    String optName = "";
    try
    {
      if (StringUtils.isNotBlank(opt) && opt.equals("0"))
      {
        optName = "新增";
        service.getDit().put("dataList", lms.addSetting(service.getDit()));
      }
      else
      {
        optName = "获取";
        String caId = String.valueOf(service.getDit().get("caId"));// 操作类型0：新增，1：获取列表
        service.getDit().put("dataList", lms.getSetting(caId));
      }

    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
      service.getDit().put("dataList", e);
      throw new BussException(service.getText("监控参数" + optName + "失败"), e);
    }

    return null;
  }

}
