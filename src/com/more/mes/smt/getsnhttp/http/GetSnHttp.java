/*
 * @File GetSnHttp.java
 * @Package com.more.mes.smt.linegetsn.http
 * @Copyinght Copyright (c) 2018
 * @Company morelean
 * @author csj
 * @date 2018-11-22 上午9:25:10
 * @version V1.0
 */

package com.more.mes.smt.getsnhttp.http;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.getsnhttp.service.GetSnService;

public class GetSnHttp extends InterfaceLog implements IhttpServiceJosn
{
  //
  /**
   * @param arg0
   * @param arg1
   * @return
   * @see com.more.fw.core.dbo.model.dao.BaseDao#find(java.lang.String, java.lang.Object[])
   */
  private ModelAction modelAction = (ModelAction)SpringContextUtil.getBean("modelAction");

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
    String configureId = String.valueOf(service.getDit().get("configureId"));
    String params = String.valueOf(service.getDit().get("params"));
    String codeNum = String.valueOf(service.getDit().get("codeNum")); // 条码个数
    String userId = String.valueOf(service.getDit().get("userId"));
    HttpServletRequest request = modelAction.getRequest();

    String datauth = request.getSession().getAttribute("mcDataAuth").toString();
    try
    {
      GetSnService gss = new GetSnService();
      
      service.getDit().put("dataList", gss.getSnByProcedure(datauth,configureId, params, codeNum));
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }

    return null;
  }

}
