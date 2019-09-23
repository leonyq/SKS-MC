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

/**
 * 根据供应商获取采购单信息分页及查询
 * @author development
 *
 */
public class AjaxPagePoInfo implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String supCode = modelAction.getParaMap().get("supCode");//供应商
		String poCode = modelAction.getParaMap().get("poCode");//采购单号
		String itemCode = modelAction.getParaMap().get("itemCode");//物料料号
		String beginTime = modelAction.getParaMap().get("beginTime");
		String endTime = modelAction.getParaMap().get("endTime");
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		Map<String, String> map = new HashMap<String, String>();
		
		String sql = "SELECT t.id,t.wpd_po,t.wpd_item_code,t.wpd_item_seq,b.ci_item_name,b.ci_item_spec," +
	    		"b.ci_min_pack,a.wpi_sup_code,t.wpd_plan_num,c.supplier_name,t.WPD_RECEIVE_NUM," +
	    		"to_char(t.wpd_delivery_date,'yyyy-mm-dd') delivery_date " +
	    		"FROM T_WMS_PO_DETAIL t " +
	    		"LEFT JOIN T_WMS_PO_INFO a ON a.wpi_po=t.wpd_po " +
	    		"LEFT JOIN t_co_item b ON b.ci_item_code=t.wpd_item_code " +
	    		"LEFT JOIN t_co_supplier c ON c.supplier_code=a.wpi_sup_code ";
	    String sqlWhere = " where 1 =1    ";
	    if(StringUtils.isNotBlank(supCode)){
			sqlWhere+=" and a.wpi_sup_code= :supCode1";
			map.put("supCode1", supCode);
		}
	    if(StringUtils.isNotBlank(poCode)){
			sqlWhere+=" and t.wpd_po like '%' || :poCode1 || '%'";
			map.put("poCode1", poCode);
		}
		if(StringUtils.isNotBlank(itemCode)){
			sqlWhere+=" and t.wpd_item_code like '%' || :itemCode1 || '%'";
			map.put("itemCode1", itemCode);
		}
		if(StringUtils.isNotBlank(beginTime)){
			sqlWhere+=" and a.wpi_create_time > to_date(:beginTime1,'yyyy-mm-dd hh24:mi:ss')";
			map.put("beginTime1", beginTime);
		}
		if(StringUtils.isNotBlank(endTime)){
			sqlWhere+=" and a.wpi_create_time < to_date(:endTime1,'yyyy-mm-dd hh24:mi:ss')";
			map.put("endTime1", endTime);
		}
		if(StringUtils.isNotBlank(auth)){
			sqlWhere+=" and t.data_auth=:dataauth and a.data_auth=:dataauth2 and b.data_auth=:dataauth3 and c.data_auth=:dataauth4";
			map.put("dataauth", auth);
			map.put("dataauth2", auth);
			map.put("dataauth3", auth);
			map.put("dataauth4", auth);
		}
		List<Map<String, Object>> poList = modelService.listSql(sql+sqlWhere+" ORDER BY t.wpd_po", modelAction.getPage(), map, null,null);
	    if(poList!=null && poList.size()>0){
			int num = poList.size();
			String querySql = "SELECT SUM(t.wri_plan_num) ALREADY_NUM FROM T_WMS_RECEIVE_ITEM t " +
					"WHERE t.wri_item_seq=? AND t.wri_item_code=? AND t.wri_connect_doc=? and t.data_auth=?  ";
			List<Map<String,Object>> qList = null;
			for(int i=0;i<num;i++){
				qList = modelService.listDataSql(querySql, new Object[]{poList.get(i).get("WPD_ITEM_SEQ"),poList.get(i).get("WPD_ITEM_CODE"),poList.get(i).get("WPD_PO"),auth});
				poList.get(i).put("ALREADY_NUM", qList.get(0).get("ALREADY_NUM"));
			}
		}
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(poList);
		modelAction.getAjaxPage().setDataList(poList);
		return BaseActionSupport.AJAX;
	}

}
