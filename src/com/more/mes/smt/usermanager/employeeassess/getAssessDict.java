package com.more.mes.smt.usermanager.employeeassess;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class getAssessDict implements FuncService {
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
        
        String dictSql = "select code,value from SY_DICT_VAL where DICT_CODE='USER_LEVEL'";
     
        List dictList= modelService.listDataSql(dictSql,new Object[]{});
        
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("dictList", dictList);
		
        modelAction.setAjaxMap(map);
        CommMethod.listMapToEscapeJs(dictList);

		return BaseActionSupport.AJAX;
	}


}
