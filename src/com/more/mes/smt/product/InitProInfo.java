package com.more.mes.smt.product;

import java.util.ArrayList;
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

public class InitProInfo implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String workTime = CommMethod.escapeJs(req.getParameter("workTime"));
		String areaSn = CommMethod.escapeJs(req.getParameter("areaSn"));
		String dataAuth = modelAction.getRequest().getParameter("dataAuth");
		String userId = modelAction.getSessionUser().getId();
		String sql = "select t.*,b.name as data_auth_name,d.value as FACE,a.CA_NAME from t_mid_product_statistic t " +
				"left join sy_dict_val d on d.code = t.MPS_PROCESS_FACE and d.dict_code = 'CT_PROCESS_FACE' " +
				"left join t_co_area a on a.ca_id = t.MPS_AREA_SN left join sy_dept b on t.data_auth=b.id " +
				"where 1=1 ";
		List<Map> dataList = new ArrayList<Map>();
		Map<String, String> map = new HashMap<String, String>();
		String sqlWhere = "";
	      if(StringUtils.isNotBlank(dataAuth)) {
	        	sqlWhere += " and t.DATA_AUTH =  :DATA_AUTH and a.DATA_AUTH =  :DATA_AUTH2 ";
	        	map.put("DATA_AUTH", dataAuth);
	        	map.put("DATA_AUTH2", dataAuth);
	        }else {
	        	sqlWhere += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
	        	sqlWhere += " and a.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID2 ) ";
	        	map.put("USER_ID", userId); 
	        	map.put("USER_ID2", userId);
	        }
		if(StringUtils.isNotBlank(workTime) && StringUtils.isNotBlank(areaSn) ){
			sqlWhere = sqlWhere + " and MPS_WORK_DATE =:workTime";
			sqlWhere = sqlWhere + " and MPS_AREA_SN =:areaSn";
			map.put("workTime", workTime);
			map.put("areaSn", areaSn);
			String sql1 = sql+sqlWhere+" order by MPS_BEGIN_TIME asc ";
			dataList = modelService.listSql(sql1,modelAction.getPage(),map,null,null);
		}	
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(dataList);
		modelAction.getAjaxPage().setDataList(dataList);
		return BaseActionSupport.AJAX;
	}

}
