/*
 * @File GetAuthByUserName.java
 * @Package com.morelean.fywms.system.inf
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author hys
 * @date 2017-12-26 上午11:18:20
 * @version V1.0
 */

package com.morelean.fywms.system.inf;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;

import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.webservice.service.ServerMgrService;
/**
 * @Title 登录用户名与所属组织信息
 * @Description 登录用户名与所属组织信息接口
 * @ClassName GetAuthByUserName
 * @author hys
 * @version 1.0 developer 2017-12-25 created
 * @see DetailEdit
 * @since 2017-12-25
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class AvailableOrganizations
{
  private final Log log = LogFactory.getLog(this.getClass());

  public String of(String userName)
  {
    String result="";
    String isSuccess = "Y";
    String errorMsg = "";
    String data = "";
    Map<String, String> paramMap = new HashMap<String, String>();
    if (StringUtils.isEmpty(userName))
    {
      isSuccess = "N";
      errorMsg =  CommMethod.getText("用户名不能为空");
      paramMap.put("data", data);
      paramMap.put("errorMsg", errorMsg);
      paramMap.put("isSuccess", isSuccess);
      return CommMethod.toJson(paramMap);
    }
    try
    {
      ServerMgrService serverMgrService = (ServerMgrService)SpringContextUtil.getBean("serverMgrService");
      Map dataMap = serverMgrService.execWebService(
        "com.morelean.fywms.system.service.GetAuthByUserNameService2", userName);
      result = CommMethod.toJson(dataMap);
    }
    catch (BeansException e)
    {
      log.error(e);
      isSuccess = "N";      
      errorMsg =  CommMethod.getText("接口异常");
      paramMap.put("data", data);
      paramMap.put("errorMsg", errorMsg);
      paramMap.put("isSuccess", isSuccess);
      return CommMethod.toJson(paramMap);
    }
    return result;
  }
}
