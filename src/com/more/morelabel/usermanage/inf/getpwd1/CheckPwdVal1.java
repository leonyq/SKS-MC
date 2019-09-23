package com.more.morelabel.usermanage.inf.getpwd1;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.base.login.model.CheckUser;
import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.common.method.ConstantsMc;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.morelabel.usermanage.inf.getpwd.CheckPwdVal;
import com.more.morelabel.usermanage.service.UserLoginPdaService;

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

public class CheckPwdVal1 extends InterfaceLog implements IhttpServiceJosn
{
	//private UserService<UserDto> userService = (UserService<UserDto>)SpringContextUtil.getBean("userService");
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
    UserDto dto = new UserDto();
    CheckUser checkUser = new CheckUser(false);
    
    UserLoginPdaService userService = new UserLoginPdaService();
    
    dto.setLoginName(login_name);
    dto.setPw(pwd);
    
    checkUser = userService.checkUser(login_name,pwd);
    
   // int res = CommMethodMc.getBaseService().checkPwdVal(pwd, login_name);
    /**
     * result为true时，验证通过
     * 为false时，具体错误信息取msg中的内容
     */
     if(checkUser.isResult()){
         //ervice.getRequest().getSession().setAttribute(ConstantsMc.SESSION_USERDTO_KEY, checkUser.getUserDto());
        /// service.getRequest().getSession().setAttribute("mcDataAuth","1");
         ///service.getRequest().getSession().setAttribute("mcDataAuthName","福建摩尔软件有限公司");
     }
     service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
     service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
     service.getResponse().setHeader("Access-Control-Allow-Headers", "*");

     service.getResponse().setHeader("Content-type", "application/json; charset=utf-8");
    //resmap.put("json", "{\"result\":\""+checkUser.isResult()+"\",\"msg\":"+checkUser.getMsg()+",\"sessionid\":\""+service.getRequest().getSession().getId()+"\"}");
   // resmap.put("json", "{\"checkoutRes\":\""+res+"\"}");
    service.setResult(resmap);
    return null;

  }

}
