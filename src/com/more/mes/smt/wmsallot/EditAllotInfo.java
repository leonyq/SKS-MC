package com.more.mes.smt.wmsallot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 修改页面回填调拨单信息
 * 
 * @author development
 *
 */
public class EditAllotInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String docNum = request.getParameter("docNum");// 调拨单号
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sql = "SELECT t.*,a.ci_item_name,a.ci_item_spec,"
				+ "to_char(t.wai_allot_date,'yyyy-mm-dd') allot_date FROM T_WMS_ALLOT_ITEM t "
				+ "LEFT JOIN t_co_item a ON a.ci_item_code=t.wai_item_code and a.DATA_AUTH=? where t.wai_doc_num = ? and t.DATA_AUTH=? ";
		List itemList = modelService.listDataSql(sql, new Object[] { auth, docNum, auth });
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}

}
