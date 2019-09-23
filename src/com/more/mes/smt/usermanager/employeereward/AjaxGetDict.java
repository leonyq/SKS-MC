package com.more.mes.smt.usermanager.employeereward;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义的查询奖惩信息列表接口
 * 
 * @author development
 */
 
public class AjaxGetDict implements FuncService {
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
        
        String dictSql = "select code,value from SY_DICT_VAL where DICT_CODE='REWARD_TYPE'";
        List dictList = modelService.listDataSql(dictSql,new Object[]{});
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("dictList", dictList);
        modelAction.setAjaxMap(map);
        CommMethod.listMapToEscapeJs(dictList);
		return BaseActionSupport.AJAX;
	}

}
