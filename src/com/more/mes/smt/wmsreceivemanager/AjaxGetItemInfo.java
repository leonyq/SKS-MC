package com.more.mes.smt.wmsreceivemanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料信息
 * @author development
 *
 */
public class AjaxGetItemInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	    
	    
	    
	  Map<String, String> map = new HashMap<String, String>();
	  
	 String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
	    
			// 		String sql = "SELECT t.id,t.ci_item_code,t.ci_item_name,t.ci_item_spec,t.CI_MIN_PACK," +
// 				"a.SUPPLIER_NAME,b.value ITEM_TYPE " +
// 				"FROM t_co_item t " +
// 				"LEFT JOIN t_co_supplier a ON a.supplier_code=t.ci_supplier_code " +
// 				"LEFT JOIN sy_dict_val b ON b.code=t.ci_item_type   ";
		
// 		String sqlWhere = "  where (b.dict_code= 'CI_ITEM_TYPE' or t.ci_item_type is null) and t.DATA_AUTH=:DATA_AUTH1  ";
		//String sqlWhere = "  where  t.DATA_AUTH=:DATA_AUTH1  ";
		//map.put("CI_ITEM_TYPE1", "CI_ITEM_TYPE");
		
		String sql = "SELECT t.id,t.ci_item_code,t.ci_item_name,t.ci_item_spec,t.CI_MIN_PACK," +
				"a.SUPPLIER_NAME " +
				"FROM t_co_item t " +
				"LEFT JOIN t_co_supplier a ON a.supplier_code=t.ci_supplier_code  AND A.DATA_AUTH=:DATA_AUTH1" ;
		
    	String sqlWhere = "  where  t.DATA_AUTH=:DATA_AUTH1  ";
		map.put("DATA_AUTH1", auth);
	
	
		
		List itemList = modelService.listSql(sql+sqlWhere, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
