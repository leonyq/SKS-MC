
package com.more.sawyer.pg;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import org.apache.commons.logging.*;

public class Sawyer_MC101502 implements IJobx
{
  /**
   * Args 参数设置类
   *  Map<String,Object> params 传人参数
   *  Object result 返回内容
  */
  private final Log log = LogFactory.getLog(this.getClass());
  @Override
  public void exec(Args args) throws Exception
  {
	log.info("<<<<<<<<<<<pg++++++++++++++++++++++++++++pg Sawyer---101502Java测试+++++++++++++++++++++++++++++++>>>>>>>>>>>");	
    
  }
}
