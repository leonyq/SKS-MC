package com.more.mes.smt.stationitem;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class QueryOneLotMsg implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		List dataList = new ArrayList<>();
		String lot = req.getParameter("lot");//批次
		String item = req.getParameter("item");//机种
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = null;
		if(lot == null || "null".equals(lot) || "".equals(lot)){
			modelAction.setAjaxPage(modelAction.getPage());
			modelAction.getAjaxPage().setDataList(dataList);
			return BaseActionSupport.AJAX;
		}else{
			sql = "select WT_SN,WT_MO_NUMBER from t_wip_tracking where WT_LOT = ? and WT_MODEL_CODE = ?  ";//and DATA_AUTH=?
			List listParam = new ArrayList();
	        listParam.add(lot);
	        listParam.add(item);
	        //listParam.add(dataAuth);
			dataList = modelService.listSql(sql,modelAction.getPage(),null,listParam," order by WT_SN",null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listMapToEscapeJs(dataList);
			modelAction.getAjaxPage().setDataList(dataList);
			return BaseActionSupport.AJAX;
		}
	}

}

