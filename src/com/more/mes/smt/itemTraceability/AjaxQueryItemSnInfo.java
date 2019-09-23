package com.more.mes.smt.itemTraceability;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 物料追溯信息 ---根据物料sn查询基本信息
 * @author development
 *
 */
public class AjaxQueryItemSnInfo implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String itemSn = request.getParameter("itemSn");
		//String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		List<Map> itemList = null;
		String userId = modelAction.getSessionUser().getId();
		String sql = "SELECT * FROM(SELECT t.*,to_char(t1.wsi_produce_date,'YYYY-MM-DD HH24:MI:SS') produce_date,"
				+"to_char(t1.wsi_invalid_date,'YYYY-MM-DD HH24:MI:SS') invalid_date,t1.WSI_ITEM_FLAG,"
				+"to_char(t1.wsi_receive_time,'YYYY-MM-DD HH24:MI:SS') receive_time,"
				+"T2.VALUE STOCK_FLAG,T3.SUPPLIER_NAME,t4.ci_item_name,t4.ci_item_spec "
				+"FROM t_wms_mid_item t "
				+"LEFT JOIN t_wms_stock_info t1 ON t1.wsi_item_sn = t.wmi_item_sn  "
				+"LEFT JOIN SY_DICT_VAL T2 ON T2.CODE = T1.WSI_STOCK_FLAG AND T2.DICT_CODE='STOCK_FLAG' "
				+"LEFT JOIN T_CO_SUPPLIER T3 ON T3.SUPPLIER_CODE = T.WMI_SUP_CODE  " +
				"LEFT JOIN t_co_item t4 ON t4.ci_item_code = t.wmi_item_code "
				+"WHERE t.wmi_item_sn = ? and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = ? )" +
				"ORDER BY t.wmi_create_date DESC ) aa ";
		itemList = modelService.listDataSql(sql, new Object[]{itemSn,userId});
		if(itemList.size()==0){ //没有数据则查询日志表
			String sql1 = "SELECT * FROM(SELECT t.*,to_char(t1.wsi_produce_date,'YYYY-MM-DD HH24:MI:SS') produce_date,"
					+"to_char(t1.wsi_invalid_date,'YYYY-MM-DD HH24:MI:SS') invalid_date,t1.WSI_ITEM_FLAG,"
					+"to_char(t1.wsi_receive_time,'YYYY-MM-DD HH24:MI:SS') receive_time,"
					+"T2.VALUE STOCK_FLAG,T3.SUPPLIER_NAME,t4.ci_item_name,t4.ci_item_spec "
					+"FROM t_wms_mid_item_l t "
					+"LEFT JOIN t_wms_stock_info t1 ON t1.wsi_item_sn = t.wmi_item_sn  "
					+"LEFT JOIN SY_DICT_VAL T2 ON T2.CODE = T1.WSI_STOCK_FLAG AND T2.DICT_CODE='STOCK_FLAG' "
					+"LEFT JOIN T_CO_SUPPLIER T3 ON T3.SUPPLIER_CODE = T.WMI_SUP_CODE  " +
					"LEFT JOIN t_co_item t4 ON t4.ci_item_code = t.wmi_item_code  "
					+"WHERE t.wmi_item_sn = ?  and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = ? )" +
					"ORDER BY t.wmi_create_date DESC ) aa ";
			itemList = modelService.listDataSql(sql1, new Object[]{itemSn,userId});
		}
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}

}
