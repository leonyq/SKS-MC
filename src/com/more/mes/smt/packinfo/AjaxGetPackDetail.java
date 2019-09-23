package com.more.mes.smt.packinfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 加载包装策略明细信息
 * 
 * @author development
 */
public class AjaxGetPackDetail implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String pSn = request.getParameter("pSn");
		String dataAuth = request.getParameter("dataAuth");
		String sql = "select t.*, a.TBR_NAME, B.LABEL_NAME,c.ccc_configure_name " + " from T_PACK_TACTICS_DETAIL t "
				+ " left join T_CO_BARCODE_ROUL a " + " on a.ID = t.PTD_LABLE_RULE " + " left join ML_TEMPLATE B "
				+ " on B.ID = t.PTD_LABLE_TEMPLATE " + " left join T_CO_SN_CONFIGURE c " + " on c.id=t.ptd_create_rule "
				+ " where t.PTD_SN = ? and t.data_auth = ?";
		List pList = modelService.listDataSql(sql, new Object[] { pSn, dataAuth });
		CommMethod.listToEscapeJs(pList);
		modelAction.setAjaxList(pList);
		return BaseActionSupport.AJAX;
	}

}
