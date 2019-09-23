/*
 * @File GetOhterReason.java
 * @Package com.morelean.fywms.account.sercice
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author lyc
 * @date 2017年12月27日 上午9:31:25
 * @version V1.0
 */

package com.morelean.fywms.account.sercice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;


/**
 * @Title 账户别名原因获取
 * @description 获取账户别名原因
 * @ClassName GetOhterReason
 * @author lyc
 * @version 1.0 developer 2017年12月27日 created
 * @see GetOhterReason
 * @since 2017年12月27日
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class GetOtherReason implements IWebService{
private ModelService modelService=(ModelService)new SpringContextUtil().getBean("modelService");
private ModelAction modelAction=new ModelAction();
private Log log = LogFactory.getLog(this.getClass());
private Map<String, Object> map=new HashMap<String, Object>();
/**
* 
* @param objs : 可变数组 ：
*                      Object name = objs[0]; 第一个参数
*                      Object ages = objs[1]; 第二个参数。。。
* @return
* @see com.more.fw.webservice.service.IWebService#excute(java.lang.Object[])
*/
@Override
public Map<String, Object> excute(Object... objs) {
      String isSuccess = "Y";
      String errorMsg = "";
  try {
    //获取T_WMS_OTHER_INOUT_REASON
    String sql="select * from T_WMS_OTHER_INOUT_REASON";
    List List = modelService.listDataSql(sql);
    if (List.size()==0)
    {
      errorMsg=CommMethod.getText("未获取到账户别名原因信息");
      map.put("isSuccess", "N");
      map.put("errorMsg", errorMsg);
      return map;
    }
    map.put("isSuccess", "Y");
    map.put("T_WMS_OTHER_INOUT_REASON", List);
    map.put("errorMsg", errorMsg);
  } catch (Exception e) {
    log.error(e);
    errorMsg=CommMethod.getText("获取账户别名原因信息异常");
    map.put("isSuccess", "N");
    map.put("errorMsg", errorMsg+e.toString());
    return map;
  }
  
  return map;
}

}