package com.more.mes.smt.wmsreceivemanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import examples.newsgroups;

/**
 * 机种信息分页及查询
 * @author development
 *
 */
public class AjaxPageBomInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String itemCode = modelAction.getParaMap().get("itemCode");
		String itemName = modelAction.getParaMap().get("itemName");
		String projectId = modelAction.getParaMap().get("projectId");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		Map<String, String> map = new HashMap<String, String>();
		String sql="SELECT T.PROJECT_ID,T.PRODUCT_MATERIAL,T.PRODUCT_NAME,T.PRODUCT_STANDARD,A.CUSTOMER,b.CI_MIN_PACK,c.PM_MO_NUMBER "+
                    " FROM T_PM_PROJECT_BASE T "+
                    " LEFT JOIN t_co_customer A ON T.CUST_CODE=A.CUST_CODE and a.data_auth=t.data_auth "+
                    " left join t_co_item b on b.CI_ITEM_CODE=t.PRODUCT_MATERIAL and b.data_auth=t.data_auth "+
                    " left join T_PM_MO_BASE c on c.PM_PROJECT_ID=t.PROJECT_ID and c.data_auth=t.data_auth where 1=1 ";
                   
		
	/*	String sql="SELECT T.PROJECT_ID,T.PRODUCT_MATERIAL,T.PRODUCT_NAME,T.PRODUCT_STANDARD,A.CUSTOMER,b.CI_MIN_PACK "+
                    " FROM T_PM_PROJECT_BASE T "+
                    " LEFT JOIN t_co_customer A ON T.CUST_CODE=A.CUST_CODE "+
                    " left join t_co_item b on b.CI_ITEM_CODE=t.PRODUCT_MATERIAL";
                    */
		String sqlWhere = " ";
		if(StringUtils.isNotBlank(projectId)){
			sqlWhere += " and c.PM_MO_NUMBER like '%' || :projectId1 || '%' ";
			map.put("projectId1", projectId);
		}
		if(StringUtils.isNotBlank(itemCode)){
			sqlWhere += " and t.PRODUCT_MATERIAL like '%' || :itemCode1 || '%' ";
			map.put("itemCode1", itemCode);
		}
		if(StringUtils.isNotBlank(itemName)){
			sqlWhere += " and T.PRODUCT_NAME like '%' || :itemName1 || '%' ";
			map.put("itemName1", itemName);
		}
			if(StringUtils.isNotBlank(dataAuth)){
			sqlWhere += " and T.DATA_AUTH  = :dataAuth1  ";//AND A.DATA_AUTH = :dataAuth2 AND B.DATA_AUTH=dataAuth3 AND C.DATA_AUTH=dataAuth4
			map.put("dataAuth1", dataAuth);
		//	map.put("dataAuth2", dataAuth);
		//	map.put("dataAuth3", dataAuth);
		//	map.put("dataAuth4", dataAuth);
		}
		String sql1="Select * from ("+sql+sqlWhere+")  ewr";
		List itemList = modelService.listSql(sql1, modelAction.getPage(), map, null,null);
		modelAction.setAjaxPage(modelAction.getPage());
	CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}
        

}
