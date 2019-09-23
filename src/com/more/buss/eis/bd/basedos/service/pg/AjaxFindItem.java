package com.more.buss.eis.bd.basedos.service.pg;

import java.util.ArrayList;
import java.util.List;

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
		String groupSn = modelAction.getParaMap().get("myGroupSn");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		//根据物料组编码sn取出物料信息
        String querySql = "select row_number() over() as ROWNUM,t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec "
        		+ " from T_CO_ITEM t LEFT JOIN T_CO_ITEM_CONNECT a "
        		+ " ON t.ci_item_code=a.cic_item_code and a.data_auth= t.data_auth ";
    
		String sqlWhere=" and a.cig_sn = ? and t.data_auth=? ";
        List listParam = new ArrayList();
        listParam.add(groupSn);
        listParam.add(dataAuth);
        List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlWhere, listParam, null,null);
        modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);

		return BaseActionSupport.AJAX;
		
	}

}
