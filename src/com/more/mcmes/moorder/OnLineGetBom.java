package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * tab获取BOM页面信息
 * @author Administrator
 *
 */
public class OnLineGetBom implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String projectId = req.getParameter("projectId");
		String dataAuthId = modelAction.getRequest().getParameter("dataAuthId");
		if (dataAuthId != null && !dataAuthId.equals("") && !dataAuthId.equals("undefined"))
      {
        dataAuth=dataAuthId;
      }
		String sql = null;
		List ajaxList = new ArrayList();
		 //工单BOM
        sql="select t.*,t2.ci_item_name as CBD_ITEM_NAME,t2.ci_item_spec as CBD_ITEM_SPEC "
            +" from t_pm_project_detail t "
            + "left join t_co_item t2 on t.cbd_item_code=t2.ci_item_code AND T2.DATA_AUTH=? "
            + "where t.PROJECT_ID = ? AND T.DATA_AUTH=?  ";
        List dataList=modelService.listDataSql(sql, new Object[] {dataAuth,projectId,dataAuth});
        if(dataList == null || dataList.isEmpty()){
        	CommMethod.listToEscapeJs(ajaxList);
        	modelAction.setAjaxList(ajaxList);
			return BaseActionSupport.AJAX;
        }else{
        	CommMethod.listToEscapeJs(dataList);
        	modelAction.setAjaxList(dataList);
			return BaseActionSupport.AJAX;
        }
		
	}

}
