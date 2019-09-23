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
 * 品质检验单 获取样本检测信息
 * @author development
 *
 */
public class GetSampDetInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String docSn = req.getParameter("DocSn");
		String sql = "SELECT T1.QII_SN,T1.QII_SUBSET_SN,T2.VALUE AS QII_ITEM_TYPE,T1.QII_ITEM_NAME,T3.VALUE AS QII_ITEM_CLASS,T1.QII_ITEM_UNIT,T1.QII_ITEM_MAXVALUE,T1.QII_ITEM_MINVALUE,T1.QII_ACTUAL_VALUE,T4.VALUE AS QII_TEST_RESULT,T1.QII_ERROR_CODE,T5.CEC_NAME,T6.VALUE AS QII_ERROR_GRADE,T1.QII_TEST_METHOD,T1.QII_TEST_CONTENT,T1.QII_MEMO,T1.QII_ERROR_NUM FROM T_QM_INSPECT_ITEM_INFO T1 "+
"LEFT JOIN SY_DICT_VAL T2 ON T2.CODE = T1.QII_ITEM_TYPE AND T2.DICT_CODE = 'QTI_ITEM_TYPE' "+ 
"LEFT JOIN SY_DICT_VAL T3 ON T3.CODE = T1.QII_ITEM_CLASS AND T3.DICT_CODE = 'ITEM_CLASS' "+
"LEFT JOIN SY_DICT_VAL T4 ON T4.CODE = T1.QII_TEST_RESULT AND T4.DICT_CODE = 'CQI_RESULT_CHECK' "+
"LEFT JOIN T_CO_ERROR_CODE T5 ON T5.CEC_CODE = T1.QII_ERROR_CODE "+
"LEFT JOIN SY_DICT_VAL T6 ON T6.CODE = T1.QII_ERROR_GRADE AND T6.DICT_CODE = 'QMS_ERROR_GRADE' "+
"WHERE T1.QII_INSPECT_SN = ?";
		List<Map> resList = modelService.listDataSql(sql,new Object[]{docSn});
		CommMethod.listToEscapeJs(resList);
		modelAction.setAjaxList(resList);		
		return BaseActionSupport.AJAX;
	}

}
