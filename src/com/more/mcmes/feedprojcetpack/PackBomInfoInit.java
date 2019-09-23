package com.more.mcmes.feedprojcetpack;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * -初始化数据
 * 
 * 
 */
public class PackBomInfoInit implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
        String projectId = req.getParameter("projectId");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		//String dataId = req.getParameter("dataId");
		/*String sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T4.FEED_NUM "
		  + "FROM T_PM_PROJECT_DETAIL T1 "
		  + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID AND T2.DATA_AUTH=? "
		  + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE AND T3.DATA_AUTH=? "
          + "LEFT JOIN T_PM_PROJECT_FEED_DETAIL T4 ON T4.PROJECT_ID = T1.PROJECT_ID AND T4.DATA_AUTH=? "
		  + "WHERE T2.PROJECT_ID = ? AND T1.DATA_AUTH=? ";*/
      String sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC "
		  + "FROM T_PM_PROJECT_DETAIL T1 "
		  + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
		  + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
		  + "WHERE 1=1 AND T2.PROJECT_ID = ?  ";
		List<Map> dataList = modelService.listDataSql(sql, new Object[]{projectId});
      
	    CommMethod.listToEscapeJs(dataList);
		modelAction.setAjaxList(dataList);
		return BaseActionSupport.AJAX;
	}

}
