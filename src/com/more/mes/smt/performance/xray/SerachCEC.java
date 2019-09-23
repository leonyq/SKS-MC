package com.more.mes.smt.performance.xray;

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
 * @ClassName:SerachCEC
 * @Description:X-Ray检测过站 分页查询CEC
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年3月25日上午1:55:14
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SerachCEC implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		HttpServletRequest request = modelAction.getRequest();
		String itemCode = request.getParameter("itemCode");
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sql = "select id  , t.CEC_CODE   ,t.cec_name,t.cec_desc  from T_CO_ERROR_CODE t where 1=1 ";
		String sqlWhere = "";
		Map<String,Object> parMap = new HashMap<String,Object>();
		if (StringUtils.isNotBlank(itemCode)) {
			sqlWhere += " and t.CEC_CODE like '%' || :CEC_CODE || '%' ";
			parMap.put("CEC_CODE", itemCode);
		}
		if (StringUtils.isNotBlank(auth)) {
      sqlWhere += " and t.DATA_AUTH  =:auth";
      parMap.put("auth", auth);
    }
		modelAction.setAjaxMap(new HashMap<String,Object>());
		List itemList;
		try {
			itemList = modelService.listSql(sql+sqlWhere, modelAction.getPage() , parMap, null, null);
		} catch (Exception e) {
			modelAction.getAjaxMap().put("error", e.toString());
			return BaseActionSupport.AJAX;
		}

		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
