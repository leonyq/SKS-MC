/*
 * @File GetAuthByUserNameService.java
 * @Package com.morelean.fywms.system.service
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author 12786
 * @date 2017-12-26 上午11:22:45
 * @version V1.0
 */

package com.morelean.fywms.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;
/**
 * @Title 登录用户名与所属组织信息
 * @Description 登录用户名与所属组织信息业务方法
 * @ClassName GetAuthByUserNameService
 * @author hys
 * @version 1.0 developer 2017-12-25 created
 * @see DetailEdit
 * @since 2017-12-25
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GetAuthByUserNameService2 implements IWebService
{
  private final Log log = LogFactory.getLog(this.getClass());

  private ModelService ms = (ModelService)new SpringContextUtil().getBean("modelService");
  @Override
  public Map<String, Object> excute(Object... objs)
  {
    Object userName = objs[0];//用户名
    String isSuccess = "Y";
    String errorMsg = "";
    String authMsg = "";
    List dataList = new ArrayList();
    Map<String,Object> dataMap = new HashMap<String,Object>();
    String sql = "select distinct t1.user_id, t2.name as username,t1.dept_id,t3.name as deptname from sy_data_auth t1  " +
    		"left join sy_user t2 on t2.id = t1.user_id " +
    		"left join sy_dept t3 on t3.id = t1.dept_id " +
    		"where t2.login_name = ? ";
    try
    {
      dataList = ms.listDataSql(sql, new Object[]{userName});
      if(dataList==null || dataList.isEmpty()){
        isSuccess = "Y";
        errorMsg = CommMethod.getText("非法用户");        
        dataMap.put("authMsg", dataList);
        dataMap.put("isSuccess", isSuccess);
        dataMap.put("errorMsg", errorMsg);
        return dataMap;        
      }
      dataMap.put("authMsg", dataList);
      dataMap.put("isSuccess", isSuccess);
      dataMap.put("errorMsg", errorMsg);
      return dataMap;       
    }
    catch (Exception e)
    {
     log.error(e);
     isSuccess = "N";
     errorMsg = CommMethod.getText("权限列表获取出错");
     dataMap.put("isSuccess", isSuccess);
     dataMap.put("errorMsg", errorMsg);
     dataMap.put("authMsg", dataList);
     return dataMap;
    }
    
  }

}
