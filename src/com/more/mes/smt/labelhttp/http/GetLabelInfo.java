package com.more.mes.smt.labelhttp.http;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.labelhttp.service.LabelInfoService;

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

public class GetLabelInfo extends InterfaceLog implements IhttpServiceJosn
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
    String dataAuth = "";
    dataAuth = StringUtils.toString(service.getParamTo().get("dataAuth"));
    LabelInfoService lis = new LabelInfoService();
    JSONArray json = new JSONArray();
    List list = lis.getLabelIdAndName(dataAuth);
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
    service.getResponse().setCharacterEncoding("gbk");
    return null;
  }

}