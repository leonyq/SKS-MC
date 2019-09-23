package com.more.mes.smt.visual;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GoodsShelves implements FuncService 
{
 /**
  *	1:这个类跟自定义视图类的区别是这个方法是嵌入在页面或数据显示之前的一段代码，原有的数据及逻辑流程正常执行，不能改变跳转页面.
  *	 要根据  private String viewShowScenc;// 视图显示场景(0:视图页面解析，1同步查询列表数据显示子表单，2异步列表数据显示，3异步列表数据显示子表单...)
  *	 这个变量(modelAction.getViewShowScenc())来区分当前是在哪个视图显示场景下。
  * 常量类中可以取到判断的值Constants.VIEW_SHOW_SCENC_0：
  */
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		return null;
	}
}
