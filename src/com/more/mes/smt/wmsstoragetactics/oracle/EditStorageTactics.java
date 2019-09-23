package com.more.mes.smt.wmsstoragetactics.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 仓库存储策略信息修改前执行
 * @author development
 *
 */
public class EditStorageTactics implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String id = request.getParameter("dataId");
		String dataAuth = request.getParameter("dataAuth");//String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "SELECT t.wst_area_sn,t.wst_contral_type,t.wst_contral_value " +
				"FROM T_WMS_STORAGE_TACTICS t " +
				" WHERE t.id=? ";
		List<Map> sList = modelService.listDataSql(sql, new Object[] { id });
		if(sList!=null && !sList.isEmpty()) {
			String areaSn = (String) sList.get(0).get("WST_AREA_SN"); //编码
			String querySql = "select a.* from( select * from T_WMS_AREA t start with t.wa_area_sn=? " +
					"connect by prior t.wa_superior_sn=t.wa_area_sn ) a where a.data_auth = ?";
			List<Map> pList = modelService.listDataSql(querySql, new Object[] { areaSn,dataAuth });
			String wstWarhouse = "";//仓库
			String wstWarHouseName = "";
			String wstWareArea = "";//库区
			String wstWareAreaName = "";
			String wstWareSite = "";//库位
			String wstWareSiteName = "";
			String areaType = "";
			if(pList!=null && !pList.isEmpty()) {
				if(pList.size()==1){ //仓库
					wstWarhouse = (String) pList.get(0).get("WA_AREA_SN");
					wstWarHouseName = (String) pList.get(0).get("WA_AREA_NAME");
				}else if(pList.size()==2){ //库区
					wstWareArea = (String) pList.get(0).get("WA_AREA_SN");
					wstWareAreaName = (String) pList.get(0).get("WA_AREA_NAME");
					wstWarhouse = (String) pList.get(1).get("WA_AREA_SN");
					wstWarHouseName = (String) pList.get(1).get("WA_AREA_NAME");
					areaType = (String) pList.get(0).get("WA_AREA_TYPE");
				}else{ //库位
					wstWareSite = (String) pList.get(0).get("WA_AREA_SN");
					wstWareSiteName = (String) pList.get(0).get("WA_AREA_NAME");
					wstWareArea = (String) pList.get(1).get("WA_AREA_SN");
					wstWareAreaName = (String) pList.get(1).get("WA_AREA_NAME");
					wstWarhouse = (String) pList.get(2).get("WA_AREA_SN");
					wstWarHouseName = (String) pList.get(2).get("WA_AREA_NAME");
				}
			}
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("WST_WAREHOUSE", wstWarhouse);
			map.put("WST_WAREHOUSE_NAME", wstWarHouseName);
			map.put("WST_WARE_AREA", wstWareArea);
			map.put("WST_WARE_AREA_NAME", wstWareAreaName);
			map.put("WST_WARE_SITE", wstWareSite);
			map.put("WST_WARE_SITE_NAME", wstWareSiteName);
			map.put("areaType", areaType);
			String ctrlValue = (String) sList.get(0).get("WST_CONTRAL_VALUE"); //管控值
			map.put("ctrlValue", ctrlValue);
			CommMethod.mapToEscapeJs(map);
			modelAction.setDataMap(map);
		}
	//	return modelAction.dynamicForwardExeid(modelAction.getJSP_VIEW_ID());// 该ID为功能对应的视图ID
			return modelAction.ActionForwardExeid(modelAction.getExeid());
	}

}
