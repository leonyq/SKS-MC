package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class CloseSave implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
	    String iframeId = req.getParameter("iframeId");
	    String formId = req.getParameter("formId");

	    if (StringUtils.isBlank(formId))
	    {
	      formId = req.getParameter("formIds");
	    }		
		String reason = req.getParameter("paraMapObj.PM_CLOSE_REASON");
		String dataId = modelAction.getDataId();
		List<Object> sqlList = new ArrayList<Object>();
		TableDataMapExt table = new TableDataMapExt();
		table.setTableName("T_PM_MO_BASE");
		table.setSqlWhere(" AND ID= ?");
		sqlList.add(dataId);
		table.setSqlWhereArgs(sqlList);
		table.getColMap().put("PM_CLOSE_REASON", reason);
		table.getColMap().put("PM_STATUS", "4");
		modelService.edit(table);
		return modelAction.ajaxTablereloadParentFun(modelAction.getText("关结成功"), formId, iframeId);
	}

}
