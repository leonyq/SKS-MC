package com.more.buss.device.service.oracle;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;


/**
 * 保养计划设备分页
 * @author development
 *
 */
public class AjaxFindDevice implements FuncService {

	@SuppressWarnings({"unchecked", "rawtypes"})
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataId = modelAction.getRequest().getParameter("myleftId");
		
		String sql0 = "select CDP_PLAN_SN,DATA_AUTH from T_CO_DEVICE_PLAN_INFO where id=? ";
		List<Map> dataList0 = modelService.listDataSql(sql0, new Object[] {dataId});
		List itemList = new ArrayList<>();
		if (dataList0==null||dataList0.isEmpty()) {
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(itemList);
			modelAction.getAjaxPage().setDataList(itemList);
			return BaseActionSupport.AJAX;
		}
		String myPlanSn = dataList0.get(0).get("CDP_PLAN_SN").toString();//计划代码
		String auth =  dataList0.get(0).get("DATA_AUTH").toString();
		//根据计划代码取出关联设备
		String sql = "SELECT ROWNUM,t.*,a.cd_device_name,t1.cdii_item_name,t1.cdii_cycle,b.CA_NAME,c.value DEVICE_TYPE,d.value DEVICE_CLASS " +
						"FROM T_CO_DEVICE_PLAN_CONNECT t " +
						"LEFT JOIN t_co_device_item_info t1 ON t1.cdii_item_code = t.cdpi_item_code  AND T1.CDII_DEVICE_SN=T.CDPI_DEVICE_SN AND t1.data_auth = ?  " +
						"LEFT JOIN t_co_device a ON a.cd_device_sn=t.cdpi_device_sn AND a.data_auth = ?  " +
						"LEFT JOIN t_co_area b ON b.ca_id=t.cdpi_area_sn  AND b.data_auth =?  " +
						"LEFT JOIN SY_DICT_VAL c ON a.cd_device_type=c.code AND c.dict_code='DEVICE_TYPE' " +
						"LEFT JOIN SY_DICT_VAL d ON a.cd_device_class=d.code AND d.dict_code='DEVICE_CLASS' ";
		String sqlWhere=" and t.cdp_plan_sn = ? AND t.data_auth = ? ";
		List listParam = new ArrayList();

		listParam.add(auth);
		listParam.add(auth);
		listParam.add(auth);
		listParam.add(myPlanSn);		
		listParam.add(auth);
		itemList = modelService.listSql(sql, modelAction.getPage(), sqlWhere, listParam, " order by t.CDPI_DEVICE_SN ",null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);

		return BaseActionSupport.AJAX;
	}

}
