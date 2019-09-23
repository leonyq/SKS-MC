package com.more.buss.device.service.oracle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;

/**
 * 保养计划查询分页
 * @author development
 *
 */
public class AjaxFindPlanCode implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String planSn = modelAction.getParaMap().get("planSn");     //计划代码
	    String planName = modelAction.getParaMap().get("planName");  //计划名称
	    String cdpCycle = modelAction.getParaMap().get("cdpCycle");  //保养周期
	    String cdpType = modelAction.getParaMap().get("cdpType");  //计划类型
	    String dataAuth = modelAction.getParaMap().get("dataAuth"); 
	    String userId = modelAction.getSessionUser().getId();
	    List<Object> sqlWList = new ArrayList<Object>();
	    String sqlWhere = "";
	    String querySql = "SELECT s.name as DATAAUTH,ROWNUM,t.*,a.value CDPCYCLE " +
	    		"FROM T_CO_DEVICE_PLAN_INFO t " +
	    		"LEFT JOIN SY_DICT_VAL a ON t.cdp_cycle=a.code AND a.dict_code='CDP_CYCLE' "+
	    			" LEFT JOIN sy_dept s ON s.id=t.DATA_AUTH ";
	    		
	      if(StringUtils.isNotBlank(dataAuth)) {
	    	  sqlWhere+=" and t.data_auth = :data_auth ";
	    	  sqlWList.add(dataAuth);
	        }else {
	        	sqlWhere += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
	        	sqlWList.add(userId);      	
	        }
	    
	    
	        if(StringUtils.isNotBlank(planSn)){
			sqlWhere+=" and t.cdp_plan_sn LIKE '%' || ? || '%'";
			sqlWList.add(planSn);
		}
		if(StringUtils.isNotBlank(planName)){
			sqlWhere+=" and t.cdp_plan_name LIKE '%' || ? || '%'";
			sqlWList.add(planName);
		}
		if(StringUtils.isNotBlank(cdpCycle)){
			sqlWhere+=" and t.cdp_cycle = ? ";
			sqlWList.add(cdpCycle);
		}
		if(StringUtils.isNotBlank(cdpType)){
			sqlWhere+=" and t.cdp_type = ? ";
			sqlWList.add(cdpType);
		}
        List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlWhere, sqlWList, " order by t.CDP_PLAN_SN ",null);
        modelAction.setAjaxPage(modelAction.getPage());
        CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);

		return BaseActionSupport.AJAX;
	}

}
