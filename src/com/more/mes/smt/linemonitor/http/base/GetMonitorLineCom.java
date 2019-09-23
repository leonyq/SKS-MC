/*
 * @File GetMonitorLineCom.java
 * @Package com.more.mes.cs.http
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author hxh
 * @date 2017-7-31 下午5:00:50
 * @version V1.0
 */

package com.more.mes.smt.linemonitor.http.base;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.linemonitor.service.base.LineMonitorService;

/**
 * @Title 获取监控线体、工作中心下拉列表
 * @Description 〈功能详细描述〉
 * @ClassName GetMonitorLineCom
 * @author hxh
 * @version 1.0 developer 2017-7-31 created
 * @see GetMonitorLineCom
 * @since 2017-7-31
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class GetMonitorLineCom extends InterfaceLog implements IhttpServiceJosn
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
    String type = String.valueOf(service.getDit().get("type"));// 类型:0为线体，1为工作中心，2为设备列表
    LineMonitorService lms = new LineMonitorService();
    if (StringUtils.isNotBlank(type) && type.equals("1"))
    {
      String parentId = String.valueOf(service.getDit().get("parentId"));
      service.getDit().put("dataList", lms.getWorkCenterCom(parentId));
    }
    else if (StringUtils.isNotBlank(type) && type.equals("2"))
    {
      String caId = String.valueOf(service.getDit().get("caId"));
      service.getDit().put("dataList", lms.getDeviceList(caId));
    }
    else
    {
      // 线体
      service.getDit().put("dataList", lms.getMonitorLineCom());
    }

    return null;
  }

}
