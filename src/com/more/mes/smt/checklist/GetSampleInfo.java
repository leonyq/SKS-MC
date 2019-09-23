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
 * 品质检验单 获取样本
 * @author development
 *
 */
public class GetSampleInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String sflag = req.getParameter("sflag");
		String qSn = req.getParameter("DocSn");
		String sqlWhere = "";
		String sql = "SELECT T.QIP_SN,T.QIP_ITEM_NUM,T.QIP_SAMPLE_NUM,T.QIP_SCARP_NUM,T.QIP_ERROR_NUM,T2.VALUE AS QIP_TEST_RESULT,T3.NAME AS QIP_TEST_EMP,TO_CHAR(T.QIP_TEST_TIME,'YYYY-MM-DD HH24:MI:SS') AS QIP_TEST_TIME,T.QIP_ITEM_CODE,T.QIP_SAMPLE_FLAG  FROM T_QM_INSEPCT_PARENT_INFO T " +
				"LEFT JOIN SY_DICT_VAL T2 ON T.QIP_TEST_RESULT = T2.CODE AND T2.DICT_CODE = 'TEST_RESULT' " +
				"LEFT JOIN SY_USER T3 ON T3.ID = T.QIP_TEST_EMP " +
				"WHERE T.QIP_INSPECT_SN = ? ";
		if("Y".equals(sflag)){
			sqlWhere = " AND T.QIP_INSPECT_FLAG = 'Y' ";
		}
		List<Map> resList = modelService.listDataSql(sql+sqlWhere,new Object[]{qSn});
		CommMethod.listToEscapeJs(resList);
		modelAction.setAjaxList(resList);
		return BaseActionSupport.AJAX;
	}

}
