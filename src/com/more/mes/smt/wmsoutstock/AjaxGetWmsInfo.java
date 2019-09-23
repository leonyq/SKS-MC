package com.more.mes.smt.wmsoutstock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ajax加载仓库信息
 * 
 * @author development
 *
 */
public class AjaxGetWmsInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// String auth =
		// modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		// String auth = modelAction.getRequest().getParameter("dataAuth");
		// String type = modelAction.getRequest().getParameter("type");
		// if(type!=null&&type.equals("showDetail")){
		// auth = modelAction.getRequest().getParameter("dataAuth");
		// }
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getParameter("dataAuth");// 查看传组织机构
		if (auth == null || auth == "") {

			// 修改的取当前组织机构ID
			auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		}
		String sql = "SELECT t.wa_area_sn,t.wa_area_name FROM T_WMS_AREA t ";
		String sqlWhere = " where 1=1 and t.wa_area_type=:wa_area_type1 AND t.data_auth=:dataauth1 ";
		Map<String, String> map = new HashMap<String, String>();
		map.put("wa_area_type1", "1");
		map.put("dataauth1", auth);
		List poList = modelService.listSql(sql + sqlWhere + " ORDER BY t.wa_area_sn", null, map, null, null);
		CommMethod.listToEscapeJs(poList);
		modelAction.setAjaxList(poList);
		modelAction.setAjaxString(auth);
		return BaseActionSupport.AJAX;
	}

}
