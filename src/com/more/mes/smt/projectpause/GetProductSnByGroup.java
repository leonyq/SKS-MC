package com.more.mes.smt.projectpause;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 挂起-----通过制令单、工序获取产品sn信息
 * @author Administrator
 *
 */
public class GetProductSnByGroup implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String moNumber = request.getParameter("moNumber");
		String groupCode = request.getParameter("groupCode");
		//获取工序名称
		String gSql = "select t.GROUP_NAME from t_co_group t where t.GROUP_CODE=? ";
		Map<String, Object> map = modelService.queryForMap(gSql, new Object[]{groupCode});
		String sql = "SELECT t.wt_sn\r\n" + 
				"from t_wip_tracking t\r\n" + 
				"left join t_co_technics a on \r\n" + 
				"a.ct_id=t.wt_tech_sn\r\n" + 
				"left join t_co_route_control b \r\n" + 
				"on b.cr_route_id=a.ct_route_code\r\n" + 
				"where b.crc_group_code=t.wt_group_code\r\n" + 
				"and (b.crc_next_group=? or b.crc_group_code=? )\r\n" + 
				"and b.crc_step_sequ=t.wt_group_seq\r\n" + 
				"and t.wt_mo_number=? ";
		List list = modelService.listDataSql(sql, new Object[]{groupCode,groupCode,moNumber});
		modelAction.setAjaxMap(map);
		modelAction.setAjaxList(list);
		return BaseActionSupport.AJAX;
	}

}
