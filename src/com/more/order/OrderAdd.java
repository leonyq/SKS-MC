package com.more.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 自定义视图
 * 
 * @author tpdg
 */
public class OrderAdd implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
		modelAction.getDataList();// 执行查询视图列表数据
		String dataId = modelAction.getDataId();
		
		Map dataMap =new HashMap(); 
		CommMethod.getSessionUser().getId();
		DateUtil.getCurDate();
		String nowDate=DateUtil.formatDate(DateUtil.getCurDate(),DateUtil.yyyyMMddHHmmss);
		dataMap.put("nowDate", nowDate);
		dataMap.put("userId", CommMethod.getSessionUser().getId());
		modelAction.setDataMap(dataMap);
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
  }
  }
