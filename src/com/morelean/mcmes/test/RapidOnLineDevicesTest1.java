
package com.morelean.mcmes.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
 /**
  *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
  *
  */
public class RapidOnLineDevicesTest1 implements FuncService
{
    private final Log log = LogFactory.getLog(this.getClass());
    
    @SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
    		try {
			HttpServletRequest request = modelAction.getRequest();
		    String name = request.getParameter("name");
		    String num = request.getParameter("num");
		    Map<String,Object> paramMap = new HashMap<String, Object>();
		    List ajaxList = new ArrayList();
		    paramMap.put("name", name);
		    paramMap.put("num", num);
		    //加载当前制令单信息
		    String moSql = "SELECT name,num FROM P_TEST_PIE where name = :name and num = :num";
		    List<Map> thisList = modelService.listSql(moSql, modelAction.getPage(), paramMap, null, null);
		   
			       

			        modelAction.setAjaxPage(modelAction.getPage());
			        CommMethod.listToEscapeJs(thisList);
			        modelAction.getPage().setDataList(thisList);
			
		} catch (Exception e) {
			log.error(e);
		}
		return modelAction.AJAX;
	
	}
}
