package com.more.mes.smt.labelhttp.http;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.labelhttp.service.LabelInfoService;
import com.more.mes.smt.linemonitor.http.base.GetFeedStation;

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

public class GetDataItem extends InterfaceLog implements IhttpServiceJosn
{
  //
  /**
   * @param arg0
   * @param arg1
   * @return
   * @see 
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
    String dataAuth = String.valueOf(service.getDit().get("dataAuth"));
    LabelInfoService lis = new LabelInfoService();
    
    service.getDit().put("dataList", lis.getDataItem(labelId,itemSn,dataAuth));

    return null;
  }

}