
package com.more.mes.smt.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 修改工厂日历---获取信息
 * @author Administrator
 *
 */
public class  ToEditCalendarJsp  implements FuncService 
{
 /**
  *	1:这个类跟自定义视图类的区别是这个方法是嵌入在页面或数据显示之前的一段代码，原有的数据及逻辑流程正常执行，不能改变跳转页面.
  *	 要根据  private String viewShowScenc;// 视图显示场景(0:视图页面解析，1同步查询列表数据显示子表单，2异步列表数据显示，3异步列表数据显示子表单...)
  *	 这个变量(modelAction.getViewShowScenc())来区分当前是在哪个视图显示场景下。
  * 常量类中可以取到判断的值Constants.VIEW_SHOW_SCENC_0：
  */
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String dataAuthSql="select NAME  from sy_dept  where  ID=?";
    List<Map> dataList = modelService.listDataSql(dataAuthSql,new Object[]{dataAuth});
    String dataAuthName = String.valueOf(dataList.get(0).get("NAME"));
    	Map nameMap =new HashMap(); 
	String mcIsOpenAuth=CommMethodMc.getIsOpenAuth();
	nameMap.put("mcIsOpenAuth", mcIsOpenAuth);
	nameMap.put("dataAuthName", dataAuthName);
	nameMap.put("dataAuthId", dataAuth);
  	modelAction.setAjaxMap(nameMap);
  	    
    return BaseActionSupport.AJAX;
	}
}
