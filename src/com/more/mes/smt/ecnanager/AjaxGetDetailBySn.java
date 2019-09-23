package com.more.mes.smt.ecnanager;

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
 * 通过ECN 的sn获取对应的明细信息
 * @author development
 *
 */
public class AjaxGetDetailBySn implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		 String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String ecnSn = request.getParameter("ecnSn");
		String dataId = request.getParameter("dataId");
		  String dataAuthId = modelAction.getRequest().getParameter("dataAuthId");
	    if (dataAuthId != null && !dataAuthId.equals("") && !dataAuthId.equals("undefined"))
      {
        dataAuth=dataAuthId;
      }
		String sql = "select t.*,a.ci_item_name,a.ci_item_spec from T_CO_ECN_ITEM_DETAIL t " +
				"LEFT JOIN t_co_item a ON a.ci_item_code=t.CEID_ITEM_CODE AND A.DATA_AUTH=? " +
				"where t.CEID_ECN_SN=? and t.data_auth=? ";
		List itemList = modelService.listDataSql(sql, new Object[] {dataAuth,ecnSn,dataAuth });
		String sql1 = "select t.*,to_char(t.cepd_track_countdate,'yyyy-mm-dd') track_date," +
				"to_char(t.cepd_stock_countdate,'yyyy-mm-dd') stock_date," +
				"to_char(t.cepd_shipment_countdate,'yyyy-mm-dd') ship_date" +
				" from T_CO_ECN_PRODUCTSTOCK_DETAIL t where t.CEPD_ECN_SN=? and t.data_auth=? ";
		List proList = modelService.listDataSql(sql1, new Object[] { ecnSn,dataAuth });
		String sql2 = "select t.*,a.ci_item_name,a.ci_item_spec," +
				"TO_CHAR(T.CEID_STOCK_COUNTDATE,'YYYY-MM-DD') STOCK_DATE," +
				"TO_CHAR(T.CEID_ORDERITEM_COUNTDATE,'YYYY-MM-DD') ORDER_DATE " +
				"from T_CO_ECN_ITEMSTOCK_DETAIL t " +
				"LEFT JOIN t_co_item a ON a.ci_item_code=t.ceid_item_code AND A.DATA_AUTH=? " +
				"where t.CEID_ECN_SN=? and t.data_auth=?  ";
		List stockList = modelService.listDataSql(sql2, new Object[] { dataAuth,ecnSn,dataAuth });
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemList", itemList);
		map.put("proList", proList);
		map.put("stockList", stockList);
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
