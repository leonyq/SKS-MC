package com.more.mes.smt.handitem;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 手工作业解除关联判断产品sn信息
 * @author Administrator
 *
 */
public class CheckHandSn implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String proSn = request.getParameter("whlSn");//产品SN
		Map<String, Object> map = new HashMap<String, Object>();
		//判断产品sn有没有进行手工作业
		String sql = "select id from T_WIP_HAND_ITEM_LOG where WHL_SN=? ";
		int count = modelService.countSql(sql, new Object[]{proSn});
		if(count>0){
			map.put("res", "succ");
			map.put("type", "hand");
		}else{
			String sql1 = "select id from T_WIP_HANDSTICK_LOG where WHL_SN=?";
			int count1 = modelService.countSql(sql1, new Object[]{proSn});
			if(count1>0){
				map.put("res", "succ");
				map.put("type", "stick");
			}else{
				map.put("res", "err");
			}
		}
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
