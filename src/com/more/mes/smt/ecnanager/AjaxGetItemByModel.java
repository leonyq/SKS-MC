package com.more.mes.smt.ecnanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ECN管理-新增    根据机种加载物料明细信息
 * @author development
 *
 */
public class AjaxGetItemByModel implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String modelCode = request.getParameter("modelCode");
		String sql = "SELECT t.*,b.ci_item_name,b.ci_item_spec FROM t_co_bom_detail t " +
				"LEFT JOIN t_co_bom a ON a.id=t.cb_bomid AND A.DATA_AUTH=:DATA_AUTH " +
				"LEFT JOIN t_co_item b ON b.ci_item_code=t.cbd_item_code AND B.DATA_AUTH=:DATA_AUTH ";
		String sqlWhere = " WHERE 1=1 ";
		Map<String,Object> map = new HashMap<String,Object>();
		sqlWhere += " AND T.DATA_AUTH=:DATA_AUTH  ";
		map.put("DATA_AUTH", dataAuth);
		if(StringUtils.isNotBlank(modelCode)){
			sqlWhere += " AND a.CB_ITEM_CODE=:CB_ITEM_CODE ";
			map.put("CB_ITEM_CODE", modelCode);
		}
		List itemList = modelService.listSql(sql+sqlWhere, modelAction.getPage(),map, null, null);
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
