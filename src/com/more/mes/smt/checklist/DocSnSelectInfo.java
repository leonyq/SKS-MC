package com.more.mes.smt.checklist;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 品质检验单 检验单下拉框初始化
 * @author development
 *
 */
public class DocSnSelectInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	    //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "SELECT DISTINCT QII_INSPECT_SN FROM T_QM_INSPECT_INFO  ORDER BY QII_INSPECT_SN ASC";
	//	List<Map> resList = new ArrayList<Map>();
	//	 resList =  modelService.listDataSql(sql, new Object[]{dataAuth});
		List<Map> resList = modelService.listDataSql(sql);
		CommMethod.listToEscapeJs(resList);
		modelAction.setAjaxList(resList);
		return BaseActionSupport.AJAX;
	}

}
