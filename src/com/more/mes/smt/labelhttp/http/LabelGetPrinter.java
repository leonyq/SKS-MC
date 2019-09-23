package com.more.mes.smt.labelhttp.http;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.labelhttp.service.LabelInfoService;
import com.more.mes.smt.linemonitor.http.oracle.GetFeedStation;

/**
 * @Title 云标签获取打印工具
 * @Description 〈功能详细描述〉
 * @ClassName LabelGetPrinter
 * @author csj
 * @version 1.0 developer 2018-4-25 created
 * @see LabelGetPrinter
 * @since 2018-4-25
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class LabelGetPrinter extends InterfaceLog implements IhttpServiceJosn
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
    String itemSn = String.valueOf(service.getDit().get("itemSn"));
    String labelId = String.valueOf(service.getDit().get("labelId"));

    LabelInfoService lis = new LabelInfoService();

    service.getDit().put("dataList", lis.getDataItem("",labelId, itemSn));

    return null;
  }

}
