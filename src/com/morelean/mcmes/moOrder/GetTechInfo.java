package com.morelean.mcmes.moOrder;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetTechInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String caId = req.getParameter("caId"); 
		String sql = "select t.ID,t.CT_ID,t.CT_NAME,t2.value as CT_PRODUCT_STEP,t3.value as CT_PROCESS_FACE,t4.CR_ROUTE_NAME as CT_ROUTE_CODE,t.CT_PREPOSE_TECH,t.CT_DEFAULT_FLAG,t.CT_VALID_FLAG,t5.name as CREATE_USER,t6.name as EDIT_USER,to_char(t.CREATE_TIME,'yyyy-MM-dd hh24:mi:ss') as CREATE_TIME,to_char(t.EDIT_TIME,'yyyy-MM-dd hh24:mi:ss') as EDIT_TIME  from t_co_technics t " +
				"left join sy_dict_val t2 on t2.code = t.CT_PRODUCT_STEP and t2.dict_code = 'PROJECT_STEP' " +
				"left join sy_dict_val t3 on t3.code = t.CT_PROCESS_FACE and t3.dict_code = 'CT_PROCESS_FACE' " +
				"left join t_co_route t4 on t4.CR_ROUTE_ID = t.CT_ROUTE_CODE " +
				"left join sy_user t5 on t5.id = t.CREATE_USER " +
				"left join sy_user t6 on t6.id = t.EDIT_USER " +//
				"where t.CT_ID = ? ";
		List<Map> dataList = modelService.listDataSql(sql,new Object[]{caId});
		modelAction.setAjaxList(dataList);
		return BaseActionSupport.AJAX;
	}

}
