package com.more.mcmes.projectBasePrepare;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.*;
import java.util.HashMap;
import java.util.Map;

 /**
  *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
  *
  */
public class EditPackNum implements FuncService{
    @SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
    	
      	//HttpServletRequest request = modelAction.getRequest();
    	//String finishCount = request.getParameter("FINISH_COUNT");
      	//String projectId = request.getParameter("PROJECT_ID");
      	//String productCount = request.getParameter("PRODUCT_COUNT");
        //String iframeId = request.getParameter("iframeId");
		//MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象

       // String querySql = "SELECT PROJECT_STATUS,FINISH_COUNT FROM T_PM_PROJECT_BASE A WHERE 1=1 AND A.PROJECT_ID = ?";        
 		//Map<String, String> map=modelService.queryForMap(querySql, new Object[]{projectId});
		//String projectStatus = map.get("PROJECT_STATUS");
		//String  finishCountInSql =  map.get("FINISH_COUNT");
      	
		return modelAction.alertParentInfo((modelAction.getText("计划数量不能大于")));

		      	
	}
}
