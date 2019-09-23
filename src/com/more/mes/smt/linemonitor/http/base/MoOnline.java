/*
 * @File MoOnline.java
 * @Package com.more.mes.smt.linemonitor.http
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author hxh
 * @date 2017-8-15 下午1:49:11
 * @version V1.0
 */

package com.more.mes.smt.linemonitor.http.base;

import java.util.List;
import java.util.Map;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.linemonitor.service.base.LineMonitorService;

/**
 * @Title 在线制令单
 * @Description 〈功能详细描述〉
 * @ClassName MoOnline
 * @author hxh
 * @version 1.0 developer 2017-8-15 created
 * @see MoOnline
 * @since 2017-8-15
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class MoOnline extends InterfaceLog implements IhttpServiceJosn
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
    String opt = String.valueOf(service.getDit().get("opt"));// 操作类型0：获取制令单
    LineMonitorService lms = new LineMonitorService();
    if (StringUtils.isNotBlank(opt) && "0".equals(opt))
    {
      String caId = StringUtils.toString(service.getDit().get("caId"));// 工作中心sn
      Map map = lms.getMoOnLineList(caId);
      if (map != null && !map.isEmpty())
      {
        service.getDit().put("dataList", map.get("moList"));
        service.getDit().put("caName", map.get("caName"));
      }
    }
    else if (StringUtils.isNotBlank(opt) && "1".equals(opt))
    {
      String caId = StringUtils.toString(service.getDit().get("caId"));// 工作中心sn
      String deviceSn = StringUtils.toString(service.getDit().get("deviceSn"));// 设备sn
      List list = lms.getDeviceOnLineList(caId, deviceSn);
      service.getDit().put("dataList", list);
    }

    return null;
  }

}
