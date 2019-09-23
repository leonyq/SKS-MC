package com.more.morelabel.usermanage.inf.getpwd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.commu.cloader.spring.SpringBeanUtil;
import com.more.fw.core.dbo.model.service.impl.base.BaseServiceImpl;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.morelabel.usermanage.service.UserDataService;

/**
 * @Title 验证密码是否正确
 * @Description 验证密码是否正确 返回值：0——密码错误；1——密码正确；2——用户不存在
 * @ClassName CheckPwdVal
 * @author csh
 * @version 1.0 developer 2017-11-16 created
 * @see CheckPwdVal
 * @since 2017-11-16
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class CheckPwdVal extends InterfaceLog implements IhttpServiceJosn
{
  private UserDataService userDataService = new UserDataService();

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
   * @return 返回值：0——密码错误；1——密码正确；2——用户不存在
   * @see com.more.fw.http.service.IhttpServiceJosn#exeFunc(com.more.fw.http.service.HttpCoreService)
   */
  @Override
  public String exeFunc(HttpCoreService service)
  {
    String pwd = service.getParamTo().get("PWD");
    String login_name = service.getParamTo().get("LOGIN_NAME");
    Map<String, Object> resmap = new HashMap<String, Object>();
    
    int res = CommMethod.getBaseService().checkPwdVal(pwd, login_name);
    /**
     * 返回值：0——密码错误；1——密码正确；2——用户不存在
     */
    //resmap.put("json", "{\"checkoutRes\":\""+res+"\",\"sessionid\":\""+service.getRequest().getSession().getId()+"\"}");
    resmap.put("json", "{\"checkoutRes\":\""+res+"\"}");
    service.setResult(resmap);
    return null;

  }

}
