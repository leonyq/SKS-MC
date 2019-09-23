package com.more.mes.smt.checklist;

import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 品质检验单 获取同物料检验单
 * @author development
 *
 */
public class GetOneItemDoc implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String itemCode = req.getParameter("itemCode");
		String sql = "SELECT T1.QII_INSPECT_SN,T2.SUPPLIER_NAME,T3.CUSTOMER,T4.VALUE AS QII_INSEPCT_RESULT" +
				" FROM T_QM_INSPECT_INFO T1 " +
				"LEFT JOIN T_CO_SUPPLIER T2 ON T2.SUPPLIER_CODE = T1.QII_CUST_CODE " +
				"LEFT JOIN T_CO_CUSTOMER T3 ON T3.CUST_CODE = T1.QII_CUST_CODE " +
				"LEFT JOIN SY_DICT_VAL T4 ON T4.CODE = T1.QII_INSEPCT_RESULT AND T4.DICT_CODE = 'INSEPCT_RESULT' " +
				"WHERE T1.QII_ITEM_CODE = ?";
			List<Map> resList = modelService.listSql(sql, modelAction.getPage(), null, new java.lang.Object[] {itemCode}, new int[] {Types.VARCHAR},
	          "ORDER BY T1.QII_SEND_TIME ASC", null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(resList);
			modelAction.getAjaxPage().setDataList(resList);
		return BaseActionSupport.AJAX;
	}

}
