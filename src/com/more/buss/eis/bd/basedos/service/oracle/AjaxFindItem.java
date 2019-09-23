package com.more.buss.eis.bd.basedos.service.oracle;

import java.util.ArrayList;
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
 * @Description 物料组--根据物料查询
 * @ClassName AjaxFindItem
 * @author 
 */
public class AjaxFindItem implements FuncService {
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		//String groupSn =request.getParameter("myGroupSn");  //计划代码
		String groupSn = modelAction.getParaMap().get("myGroupSn");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		//根据物料组编码sn取出物料信息
		 String querySql = "select rownum,t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec from T_CO_ITEM t " +
		 		"LEFT JOIN T_CO_ITEM_CONNECT a ON t.ci_item_code=a.cic_item_code and a.data_auth= t.data_auth " +
       "where a.cig_sn = :groupSn and t.data_auth= :dataAuth1  ";
		 Map<String, String> map =new HashMap<String,String>();
		 map.put("groupSn", groupSn);
		 map.put("dataAuth1", dataAuth);

        List itemList = modelService.listSql(querySql, modelAction.getPage(), map, null,null);
        modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);

		return BaseActionSupport.AJAX;
		
	}

}
