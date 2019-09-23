package com.more.mes.smt.firstInspect;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 通过产品sn获取信息
 * @author Administrator
 *
 */
public class GetInfoByProductSn implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, Object> map = new HashMap<String, Object>();
		String snInfo = request.getParameter("snInfo");
		//判断产品sn存在不存在
		String sql = "select t1.product_material,t1.project_id,t1.product_model,t1.product_ver " +
				"from t_wip_tracking t\r\n" + 
				"left join t_pm_project_base t1 on t1.project_id=t.wt_project_id where t.WT_SN=? ";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[]{snInfo});
		if(list!=null&&list.size()>0){
			modelAction.setAjaxList(list);
			map.put("res", "succ");
		}else{
			map.put("res", "产品信息不存在");
		}
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
