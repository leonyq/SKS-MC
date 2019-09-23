package com.more.mes.smt.ecnanager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ECN管理-新增   根据选择的机种获取成品库存信息
 * @author development
 *
 */
public class AjaxGetProductStock implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String modelCode = request.getParameter("modelCode");
		String sql = "SELECT SUM(t.wt_num) TRACKNUM FROM t_wip_tracking t " +
				" where t.wt_model_code=? AND t.wt_finish_flag='Y' AND T.DATA_AUTH=? ";
		Map<String, Object> map = modelService.queryForMap(sql, new Object[] { modelCode, dataAuth});
		String sql1 = "SELECT SUM(t.wsi_item_num) STOCKNUM FROM T_WMS_STOCK_INFO t " +
				" where t.wsi_item_code=? AND T.DATA_AUTH=? ";
		Map<String, Object> map1 = modelService.queryForMap(sql1, new Object[] { modelCode ,dataAuth});
		map.put("STOCKNUM", map1.get("STOCKNUM"));
		List<Map> list = new ArrayList<Map>();
		if(map.get("TRACKNUM")!=null||map.get("STOCKNUM")!=null){
			list.add(map);
		}
		CommMethod.listToEscapeJs(list);
		modelAction.setAjaxList(list);
		return BaseActionSupport.AJAX;
	}

}
