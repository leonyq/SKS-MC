package com.more.mes.smt.linemonitor.http.base;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.linemonitor.service.base.LineMonitorService;

public class LoggerSign extends InterfaceLog implements IhttpServiceJosn
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
		String controller = String.valueOf(service.getDit().get("controller"));//控制器IP
		String workStation = String.valueOf(service.getDit().get("workStation"));//工作中心SN
		String signFlag = String.valueOf(service.getDit().get("signFlag"));//信号类型标识
		String sign = String.valueOf(service.getDit().get("sign"));//信号
		
	    LineMonitorService lms = new LineMonitorService();
	    service.getDit().put("dataList", lms.loggerSign(controller, workStation, signFlag, sign));

	    return null;
	  }

	}

