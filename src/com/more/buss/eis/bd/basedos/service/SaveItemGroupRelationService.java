package com.more.buss.eis.bd.basedos.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SaveItemGroupRelationService implements FuncService {
    
	
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	
		String type = request.getParameter("runType");
		
		if(type.equals("searchItem")){
		   
			String groupId = request.getParameter("groupId");
			queryItem(groupId,modelAction,modelService);
		}
		
	
		String cig_name = request.getParameter("cig_name");
 		String ci_item_name_arry = modelAction.getRequest()
				.getParameter("ci_item_name");
	
		String ci_item_name_arry2 = request.getParameter("ci_item_name2");
		String[] ci_item_name_text = ci_item_name_arry.split(";");
		String[] ci_item_name_text2 = ci_item_name_arry2.split(";");
		String sql = "";
		String sql2 = "";
		String ci_item_name = "";
		String ci_item_name2 = "";
		List l;
		for (int i = 0; i < ci_item_name_text.length; i++) {
			ci_item_name = ci_item_name_text[i];
			sql = "update T_CO_ITEM set CI_GROUP_ID = ? where CI_ITEM_NAME = ?";
			modelService.execSql(sql,new Object[]{cig_name,ci_item_name});
		}

		for (int i = 0; i < ci_item_name_text2.length; i++) {
			ci_item_name2 = ci_item_name_text2[i];
			sql2 = "select CI_GROUP_ID from T_CO_ITEM where CI_ITEM_NAME = ?";//
			l = modelService.listDataSql(sql2, new Object[]{ci_item_name2});
			
			Map map = (Map)l.get(0);
			String cig_name2 = StringUtils.toString(map.get("CI_GROUP_ID"));
			
			if (cig_name2.equals(cig_name)) {
				sql2 = "update T_CO_ITEM set CI_GROUP_ID = '000' where CI_ITEM_NAME = ?";//
				modelService.execSql(sql2,new Object[]{ci_item_name2});
			}
		}
		// 读取物料组名称并存入datalist
				String sql3 = "select cig_name,ID from T_CO_ITEM_GROUP where 1=1";
				List l2;
				l2 = modelService.listSql(sql3, null, null, null, null, null);
				modelAction.setDataList(l2);
				// 取出物料以及对应的物料组
				List l3;
				String sql4 = "select CI_ITEM_NAME,CI_GROUP_ID from T_CO_ITEM where 1=1";
				l3 = modelService.listSql(sql4, null, null, null, null, null);
				modelAction.setAjaxList(l3);
				return BaseActionSupport.AJAX;
		
	}
	
	public String queryItem(String itemGroupId,ModelAction modelAction, ModelService modelService){
		//根据物料组id取出已分配当前组的物料信息
		String querySql = "select t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec from T_CO_ITEM t WHERE t.ci_group_id=?";
		List itemList = modelService.listDataSql(querySql, new Object[] { itemGroupId });
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}

}
