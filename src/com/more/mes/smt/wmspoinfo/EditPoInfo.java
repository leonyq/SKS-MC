package com.more.mes.smt.wmspoinfo;

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
 * 修改页面根据采购单号回填对应的物料信息
 * @author development
 *
 */
public class EditPoInfo implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String wpiPo = request.getParameter("wpi_po");//采购单号
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		
		String sql = "SELECT t.*,to_char(t.wpd_delivery_date,'yyyy-mm-dd') delivery_date," +
				"a.ci_item_name,a.ci_item_spec FROM T_WMS_PO_DETAIL t " +
				"LEFT JOIN t_co_item a ON a.ci_item_code=t.wpd_item_code where 1=1 and t.wpd_po =? and t.data_auth=? and a.data_auth=?  ";//
		List<Map<String,Object>> wmsList = modelService.listDataSql(sql, new Object[]{wpiPo,dataAuth,dataAuth});//
		//统计已下达的物料数量       T_WMS_RECEIVE_ITEM
		if(wmsList!=null && wmsList.size()>0){
			int num = wmsList.size();
			String querySql = "SELECT SUM(t.wri_plan_num) ALREADY_NUM FROM T_WMS_RECEIVE_ITEM t " +
					"WHERE t.wri_item_seq=? AND t.wri_item_code=? AND t.wri_connect_doc=? and t.data_auth=? ";
			List<Map<String,Object>> qList = null;
			for(int i=0;i<num;i++){
				qList = modelService.listDataSql(querySql, new Object[]{wmsList.get(i).get("WPD_ITEM_SEQ"),wmsList.get(i).get("WPD_ITEM_CODE"),wmsList.get(i).get("WPD_PO"),dataAuth});
				if(qList!=null && qList.size()>0){
				    wmsList.get(i).put("ALREADY_NUM", qList.get(0).get("ALREADY_NUM"));
				}
			}
		}
		//采购单信息
		String sql1 = "SELECT to_char(t.wpi_receive_time,'yyyy-mm-dd hh24:mi:ss') wpi_receive_time," +
				"t.WPI_SUP_CODE,t.wpi_memo,a.supplier_name FROM T_WMS_PO_INFO t " +
				"LEFT JOIN t_co_supplier a ON a.supplier_code=t.wpi_sup_code where 1=1 and t.wpi_po = ? and t.data_auth= ? ";
		List<Map> wmsList1 = modelService.listDataSql(sql1, new Object[]{wpiPo,dataAuth});
		Map<Object, Object> map = new HashMap<Object, Object>();
		if(wmsList1!=null && wmsList1.size()>0){
		    map.put("WPI_RECEIVE_TIME", wmsList1.get(0).get("WPI_RECEIVE_TIME"));
    		map.put("WPI_SUP_CODE", wmsList1.get(0).get("WPI_SUP_CODE"));
    		map.put("SUPPLIER_NAME", wmsList1.get(0).get("SUPPLIER_NAME"));
    		map.put("WPI_MEMO", wmsList1.get(0).get("WPI_MEMO"));
		}
		//CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		CommMethod.listMapToEscapeJs(wmsList);
		modelAction.setAjaxList(wmsList);
		return BaseActionSupport.AJAX;
	}

}
