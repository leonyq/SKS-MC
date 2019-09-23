package com.more.mes.smt.checklist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 品质检验单 获取检验单基本信息
 * @author development
 *
 */
public class GetCheckListInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String docSn = req.getParameter("DocSn");//检验单号
		String sql = "SELECT T1.QII_ITEM_CODE,T2.CI_ITEM_NAME,T2.CI_ITEM_SPEC,T3.SUPPLIER_NAME,T4.CUSTOMER,T1.QII_CONNECT_DOC," +
				"T5.VALUE AS QII_LIST_FLAG,T1.QII_SEND_NUM,T1.QII_ERROR_NUM,T1.QII_ACTUAL_NUM,T6.NAME AS QII_INSEPCT_EMP," +
				"TO_CHAR(T1.QII_SEND_TIME,'YYYY-MM-DD HH24:MI:SS') AS QII_SEND_TIME,T7.VALUE AS QII_INSEPCT_RESULT " +
				" FROM T_QM_INSPECT_INFO T1 " +
				"LEFT JOIN T_CO_ITEM T2 ON T1.QII_ITEM_CODE = T2.CI_ITEM_CODE " +
				"LEFT JOIN T_CO_SUPPLIER T3 ON T3.SUPPLIER_CODE = T1.QII_CUST_CODE " +
				"LEFT JOIN T_CO_CUSTOMER T4 ON T4.CUST_CODE = T1.QII_CUST_CODE " +
				"LEFT JOIN SY_DICT_VAL T5 ON T5.CODE = T1.QII_LIST_FLAG AND T5.DICT_CODE='LIST_FLAG' " +
				"LEFT JOIN SY_USER T6 ON T6.ID = T1.QII_INSEPCT_EMP " +
				"LEFT JOIN SY_DICT_VAL T7 ON T7.CODE = T1.QII_INSEPCT_RESULT AND T7.DICT_CODE='INSEPCT_RESULT' " +
				"WHERE T1.QII_INSPECT_SN = ?";
		List<Map> resList = modelService.listDataSql(sql,new Object[]{docSn});
		CommMethod.listToEscapeJs(resList);
		modelAction.setAjaxList(resList);
		return BaseActionSupport.AJAX;
	}

}
