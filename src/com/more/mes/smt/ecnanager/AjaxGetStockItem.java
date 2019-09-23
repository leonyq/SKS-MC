package com.more.mes.smt.ecnanager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ECN管理-新增   根据选择的物料料号获取库存物料明细
 * @author development
 *
 */
public class AjaxGetStockItem implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String myItemCode = request.getParameter("myItemCode");
		String[] itemCodes = new String[] {};
		if(StringUtils.isNotBlank(myItemCode)){
			itemCodes = myItemCode.split("@@");
		}
		String itemCode = "";
		Object[] praobj = new Object[itemCodes.length+1];
		praobj[0]=dataAuth;
		for(int i=1;i<itemCodes.length+1;i++){
			praobj[i] = itemCodes[i-1];
			if(i==1){
				itemCode = "?";
			}else{
				itemCode = itemCode + "," + "?";
			}
		}
	/*
		String sql = "SELECT t.wsi_item_code,sum(t.wsi_item_num) wsi_item_num," +
				"(SELECT a.ci_item_name FROM t_co_item a WHERE a.ci_item_code=t.wsi_item_code) ci_item_name," +
				"(SELECT b.ci_item_spec FROM t_co_item b WHERE b.ci_item_code=t.wsi_item_code) ci_item_spec " +
				"FROM t_wms_stock_info t LEFT JOIN t_co_item a ON a.ci_item_code=t.wsi_item_code " +
				"where 1=1 AND T.DATA_AUTH=? AND A.DATA_AUTH=? " +
				 "and t.wsi_item_code in("+itemCode+") "+
				 "GROUP BY t.wsi_item_code ";
		
		List itemList = modelService.listDataSql(sql,praobj);
	*/
	
		String sql = "SELECT t.wsi_item_code,sum(t.wsi_item_num) wsi_item_num,a.ci_item_name,b.ci_item_spec " +     
      " FROM t_wms_stock_info t  " +
      " LEFT JOIN t_co_item a ON a.ci_item_code=t.wsi_item_code and a.DATA_AUTH=T.DATA_AUTH "+
      " LEFT JOIN t_co_item b ON b.ci_item_code=t.wsi_item_code and b.DATA_AUTH=T.DATA_AUTH "+
      "where 1=1  and T.DATA_AUTH=?  ";
		
		if(StringUtils.isNotBlank(itemCode)) {
			sql += "and  t.wsi_item_code in("+itemCode+") ";
		}

		sql +="GROUP BY t.wsi_item_code,a.ci_item_name,b.ci_item_spec ";
  
  List itemList = modelService.listDataSql(sql, praobj); 
  
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}

}
