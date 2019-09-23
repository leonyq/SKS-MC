package com.more.mes.smt.wmsmsdrule;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 通过MSD规则代码获取规则明细信息
 * @author development
 *
 */
public class AjaxGetDetailBySn implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String ruleSn = request.getParameter("ruleSn");
		String dataAuth = modelAction.getRequest().getParameter("dataAuth");
		String type = request.getParameter("type");
		String dd ="";
		if(!"edit".equals(type)) {
			String sql0 = "select data_auth from T_WMS_MSD_RULE where id = ? ";
			List<Map> dataList = modelService.listDataSql(sql0, new Object[] {dataAuth});
			if(dataList==null || dataList.size()<=0) {
				modelAction.setAjaxList(dataList);
				return BaseActionSupport.AJAX;
			}else {
				dd= String.valueOf(dataList.get(0).get("DATA_AUTH"));
			}
						
		}else {
			dd = dataAuth;
		}

		String sql = "select * from T_WMS_MSD_RULE_DETAIL where WSRD_RULE_SN=? and data_auth=? ";
		List ruleList = modelService.listDataSql(sql, new Object[] {ruleSn,dd});
		CommMethod.listToEscapeJs(ruleList);
		modelAction.setAjaxList(ruleList);
		return BaseActionSupport.AJAX;
	}

}
