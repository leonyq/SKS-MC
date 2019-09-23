package com.more.mcmes.projectpack;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * -数据保存
 * 
 * 
 */
public class projectpacksave implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
        String projectId = req.getParameter("projectId");
        String finishCount = req.getParameter("finishCount");
        String iframeId = req.getParameter("iframeId");
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        String edituser =  modelAction.getCurrUser().getId();
        String updateSql = "UPDATE T_PM_PROJECT_BASE A " +
                    "SET A.EDIT_TIME = SYSDATE, A.PROJECT_STATUS = '5',A.FINISH_COUNT=? ,A.EDIT_USER=?" +
                    "WHERE 1 = 1 AND A.PROJECT_ID = ? ";
        modelService.execSql(updateSql, new Object[]{finishCount,edituser,projectId});
      
		
      
		 return modelAction.reloadIframeByIds(iframeId, modelAction.getText("包装成功"), "0");
	}

}
