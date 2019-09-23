package com.more.mes.smt.packinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 包装策略明细获取下拉数据
 * @ClassName AjaxGetTemplate
 * @author WZY
 * 
 */
public class AjaxGetTemplate implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub

		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql1 = "SELECT ID AS MKEY,LABEL_NAME AS VAL FROM ML_TEMPLATE where 1=1 ORDER BY LABEL_NAME ASC";// 标签模板

		String sql2 = "SELECT t.id MKEY,t.TBR_NAME VAL FROM T_CO_BARCODE_ROUL t WHERE t.tbr_type=? and t.data_auth=? ";// 条码规则

		String sql3 = "SELECT t.MODEL_NAME MKEY,t.MODEL_NAME VAL from T_CO_BARCODEMODEL t where t.data_auth=? ";// 标签模板

		String sql4 = "select t.id MKEY,t.ccc_configure_name VAL from T_CO_SN_CONFIGURE t where t.ccc_configure_type='3' and t.data_auth=? "; // 生成规则

		List list1 = modelService.listDataSql(sql1);
		List list2 = modelService.listDataSql(sql2, new Object[] { "8", dataAuth });
		List list3 = modelService.listDataSql(sql3, new Object[] { dataAuth });
		List list4 = modelService.listDataSql(sql4, new Object[] { dataAuth });

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);

		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);

		return BaseActionSupport.AJAX;
	}

}
