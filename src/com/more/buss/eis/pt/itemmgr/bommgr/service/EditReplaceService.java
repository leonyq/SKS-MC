package com.more.buss.eis.pt.itemmgr.bommgr.service;

import java.util.HashMap;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 替代料修改--页面加载前
 * @author fs
 *
 */
public class EditReplaceService implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String paraid = modelAction.getRequest().getParameter("paraId");
		Map<String,String> paraMap1 = new HashMap<String,String>();
		paraMap1.put("paraid", paraid);
		modelAction.setDataMap1(paraMap1);
				return null;
	}

}
