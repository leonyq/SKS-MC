package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.List;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class DelAppMoudle implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		String[] delId = modelAction.getRequest().getParameterValues("isSelect");
		String iframeId = modelAction.getRequest().getParameter("iframeId");
		StringBuffer delIds = new StringBuffer();
		TableDataMapExt ext = new TableDataMapExt();
		ext.setTableName("T_APP_MOUDLE");
		for (int i = 0; i < delId.length; i++) {
			ext.getColMap().clear();
			ext.setSqlWhere(" and  ID=?");
	        List<Object> wList = new ArrayList<Object>();
	        wList.add(delId[i]);
	        ext.setSqlWhereArgs(wList);
	        modelService.del(ext);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}
	
}
