package com.more.mes.smt.wmsmodel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import examples.newsgroups;

/**
 * 根据仓库编码获取编码信息
 * @author development
 *
 */
public class GetWmsInfoBySn implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String areaSn = request.getParameter("areaSn");
		String dataAuth = request.getParameter("dataAuth");
		String sql = "select t.*,a.value AREA_TYPE_NAME,b.tcs_name RELATE_ORDERSET_NAME from T_WMS_AREA t " +
					  "left join sy_dict_val a on a.code=t.WA_AREA_TYPE AND a.dict_code=:WMS_TYPE1 " +
					  "LEFT JOIN t_Command_Set b ON b.tcs_code=t.wa_relate_orderset where 1 = 1 ";
		Map<String, String> map = new HashMap<String, String>();
		map.put("WMS_TYPE1", "WMS_TYPE");
		//'WMS_TYPE'
		String sqlWhere = " and t.WA_AREA_SN = :areaSn1 and t.DATA_AUTH = :dataAuth ";
		map.put("areaSn1", areaSn);
		map.put("dataAuth", dataAuth);
		List wmsList = modelService.listSql(sql+sqlWhere, modelAction.getPage(), map, null,null);
		CommMethod.listToEscapeJs(wmsList);
		modelAction.setAjaxList(wmsList);
		return BaseActionSupport.AJAX;
	}

}
