package com.more.buss.eis.bd.basedos.service.oracle;


import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 物料组--根据组获取物料	
 * @ClassName AjaxGetItemByGroupSn
 * @author 
 */
public class AjaxGetItemByGroupSn implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String groupSn = request.getParameter("groupSn");
		String groupId = request.getParameter("groupId");
		PaginationImpl page = modelAction.getPage();
		String sql0 = "select data_auth from T_CO_ITEM_GROUP where id = ?";
		List<Map> list0 = modelService.listDataSql(sql0,new Object[] {groupId});
		if(null!=list0 && list0.size()>0){
			String dataAuth = String.valueOf(list0.get(0).get("DATA_AUTH"));
			//根据物料组编码sn取出物料信息
	                String querySql = "select  ROWNUM,t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec,t.data_auth,t3.name as data_auth2 "
	                		+ " from T_CO_ITEM t LEFT JOIN T_CO_ITEM_CONNECT a "
	                		+ " ON t.ci_item_code=a.cic_item_code and a.data_auth =t.data_auth "
	                		+ " left join sy_dept t3 on t3.id = t.data_auth  ";
			        String sqlWhere=" and a.cig_sn = ? and t.data_auth = ?  ";
	                List listParam = new ArrayList();
	                listParam.add(groupSn);
	                listParam.add(dataAuth);
	                List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlWhere, listParam, null,null);
	                modelAction.setAjaxPage(modelAction.getPage());
			modelAction.getAjaxPage().setDataList(itemList);
		}else {
			modelAction.setAjaxPage(modelAction.getPage());
			modelAction.getAjaxPage().setDataList(list0);

			
		}
		

		return BaseActionSupport.AJAX;
		
	}

}