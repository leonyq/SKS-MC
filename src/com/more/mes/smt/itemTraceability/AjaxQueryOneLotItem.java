package com.more.mes.smt.itemTraceability;

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
 * 查询同一批次的物料
 * @author development
 *
 */
public class AjaxQueryOneLotItem implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		//String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String itemLot =  request.getParameter("itemLot");
		String userId = modelAction.getSessionUser().getId();
		
		String sql = "SELECT DISTINCT t.wmi_item_sn,T2.VALUE STOCK_FLAG FROM t_wms_mid_item t " + 
				"LEFT JOIN t_wms_stock_info t1 ON t1.wsi_item_sn = t.wmi_item_sn  AND t.DATA_AUTH=t1.DATA_AUTH " + 
				"LEFT JOIN SY_DICT_VAL T2 ON T2.CODE = T1.WSI_STOCK_FLAG AND T2.DICT_CODE='STOCK_FLAG'  " + 
				"WHERE t.wmi_lot_no = ? and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = ? ) " + 
				"UNION ALL " + 
				"SELECT DISTINCT t.wmi_item_sn,T2.VALUE STOCK_FLAG FROM t_wms_mid_item_l t " + 
				"LEFT JOIN t_wms_stock_info t1 ON t1.wsi_item_sn = t.wmi_item_sn AND t.DATA_AUTH=t1.DATA_AUTH " + 
				"LEFT JOIN SY_DICT_VAL T2 ON T2.CODE = T1.WSI_STOCK_FLAG AND T2.DICT_CODE='STOCK_FLAG'  " + 
				"WHERE t.wmi_lot_no = ? and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = ? ) ";
		Map map = new HashMap();
		map.put("userId1", userId); 
		String sql1 = "select DISTINCT wmi_item_sn,STOCK_FLAG from("+sql+")aa ";
		
		List listParam = new ArrayList();
        listParam.add(itemLot);
        //listParam.add(dataAuth);
        listParam.add(userId);
        listParam.add(itemLot);
        
        listParam.add(userId);
        //listParam.add(dataAuth);
        List itemList = modelService.listSql(sql1, modelAction.getPage(), null, listParam, " ORDER BY wmi_item_sn",null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
