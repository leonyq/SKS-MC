
package com.more.sawyer.oracle;

import java.util.*;
import com.more.fw.core.common.method.*;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.inf.ding.service.DingService;

public class DingTalk181010 implements IJobx
{
  /**
   * Args 参数设置类
   *  Map<String,Object> params 传人参数
   *  Object result 返回内容
  */
  @Override
  public void exec(Args args) throws Exception
  {
   DingService ding = (DingService)SpringContextUtil.getBean("dingService");
  
   Map map =  new HashMap();
   map.put("touser","023158056321722581");
  
   Map map2 =  new HashMap();
   map2.put("content","test\nlth");
   
   map.put("text",map2);

    
  }
}
