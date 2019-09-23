package com.more.mes.smt.wmsitemchange;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 物料变更---获取库存信息
 * 
 * @author Administrator
 *
 */
public class AjaxGetItemInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String itemSn = request.getParameter("itemSn");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String getStockInfoSql = "SELECT DISTINCT T.WSI_DOC_NUM, " + " T.WSI_ITEM_CODE, " + " T.WSI_ITEM_NUM, "
					+ " T.WSI_LOT_NO, " + " T1.SUPPLIER_NAME   WSI_SUP_CODE, " + " T2.CUSTOMER        WSI_CUST_CODE, "
					+ " T.WSI_INVALID_DATE, " + " T3.WA_AREA_NAME    WSI_WH_CODE " + " FROM T_WMS_STOCK_INFO T "
					+ " LEFT JOIN T_CO_SUPPLIER T1 " + " ON T.WSI_SUP_CODE = T1.SUPPLIER_CODE AND T1.DATA_AUTH=? "
					+ " LEFT JOIN T_CO_CUSTOMER T2 " + " ON T.WSI_CUST_CODE = T2.CUST_CODE AND T2.DATA_AUTH=? "
					+ " LEFT JOIN T_WMS_AREA T3 " + " ON T.WSI_WH_CODE = T3.WA_AREA_SN AND T3.DATA_AUTH=? "
					+ " WHERE T.WSI_ITEM_SN = ? AND T.DATA_AUTH=? ";
			map = modelService.queryForMap(getStockInfoSql,
					new Object[] { dataAuth, dataAuth, dataAuth, itemSn, dataAuth });
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("查询失败"), e);
		}
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
