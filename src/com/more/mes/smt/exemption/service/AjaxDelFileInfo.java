package com.more.mes.smt.exemption.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ajax删除附件相关信息
 * @author development
 *
 */
public class AjaxDelFileInfo implements FuncService{

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataId = request.getParameter("delDataId");
		TableDataMapExt exemption = new TableDataMapExt();
		exemption.setTableName("T_QM_EXEMPTION_INFO");
	    CommMethod.editSysDefCol(exemption.getColMap(), modelAction.getUser());
	    exemption.setSqlWhere(" and ID=? ");
	    ArrayList delList = new ArrayList();
        delList.add(dataId);
        exemption.setSqlWhereArgs(delList);
	    exemption.getColMap().put("QEI_FILE_NAME", "");
    	exemption.getColMap().put("QEI_SAVEFILE_NAME", "");
    	exemption.getColMap().put("QEI_FILE_PATH", "");
    	exemption.getColMap().put("QEI_FILE_SIZE", "");
    	modelService.edit(exemption);
		return BaseActionSupport.AJAX;
	}

}
