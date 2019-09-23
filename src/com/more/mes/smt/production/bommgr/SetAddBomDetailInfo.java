package com.more.mes.smt.production.bommgr;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;

import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SetAddBomDetailInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();



		String itemCode = request.getParameter("paraMap1@0#CBD_ITEM_CODE");//物料代码
		String itemName = request.getParameter("paraMap1@0#CBD_ITEM_NAME");//物料名称
		String itemSpec = request.getParameter("paraMap1@0#CBD_ITEM_SPEC");//物料规格
		String unit =  request.getParameter("paraMap1@0#CBD_UNITS");//单位
		String point = request.getParameter("paraMap1@0#CBD_POINT");//点位
		String itemNum = request.getParameter("paraMap1@0#CBD_ITEM_NUM");//用量
		String itemSection = request.getParameter("paraMap1@0#CBD_ITEM_SECTION");//物料阶别
		String topPoint = request.getParameter("paraMap1@0#CBD_TOP_POINT");//正面点位
		String bottomPoint  = request.getParameter("paraMap1@0#CBD_BOTTOM_POINT");//反面点位
		String topNum = request.getParameter("paraMap1@0#CBD_TOP_NUM");//正面用量
		String bottomNum = request.getParameter("paraMap1@0#CBD_BOTTOM_NUM");//反面用量
		String itemType = request.getParameter("paraMap1@0#CBD_ITEM_TYPE");//物料类型
	
		Map<String,String> resMap = new HashMap<String,String>();
		resMap.put("CBD_ITEM_CODE", itemCode);
		resMap.put("CBD_ITEM_NAME", itemName);
		resMap.put("CBD_ITEM_SPEC", itemSpec);
		resMap.put("CBD_UNITS", unit);
		resMap.put("CBD_POINT", point);
		resMap.put("CBD_ITEM_NUM", itemNum);
		resMap.put("CBD_ITEM_SECTION", itemSection);
		resMap.put("CBD_TOP_POINT", topPoint);
		resMap.put("CBD_BOTTOM_POINT", bottomPoint);
		resMap.put("CBD_TOP_NUM", topNum);
		resMap.put("CBD_BOTTOM_NUM", bottomNum);
		resMap.put("CBD_ITEM_TYPE", itemType);
		modelAction.setAjaxMap(resMap);
		return BaseActionSupport.AJAX;
	}

}
