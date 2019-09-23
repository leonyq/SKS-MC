package com.more.buss.device.service.pg;


import java.util.ArrayList;
import java.util.List;

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
		String myPlanSn = modelAction.getParaMap().get("myPlanSn");//计划代码
		//根据计划代码取出关联设备
		String sql = "SELECT row_number() over() as ROWNUM,t.*,a.cd_device_name,t1.cdii_item_name,b.CA_NAME,c.value DEVICE_TYPE,d.value DEVICE_CLASS " +
						"FROM T_CO_DEVICE_PLAN_CONNECT t " +
						"LEFT JOIN t_co_device_item_info t1 ON t1.cdii_item_code = t.cdpi_item_code  AND T1.CDII_DEVICE_SN=T.CDPI_DEVICE_SN " +
						"LEFT JOIN t_co_device a ON a.cd_device_sn=t.cdpi_device_sn " +
						"LEFT JOIN t_co_area b ON b.ca_id=t.cdpi_area_sn " +
						"LEFT JOIN SY_DICT_VAL c ON a.cd_device_type=c.code AND c.dict_code='DEVICE_TYPE' " +
						"LEFT JOIN SY_DICT_VAL d ON a.cd_device_class=d.code AND d.dict_code='DEVICE_CLASS' ";
		String sqlWhere=" and t.cdp_plan_sn = ? ";
		List listParam = new ArrayList();
		listParam.add(myPlanSn);
		List itemList = modelService.listSql(sql, modelAction.getPage(), sqlWhere, listParam, null,null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);

		return BaseActionSupport.AJAX;
	}

}
