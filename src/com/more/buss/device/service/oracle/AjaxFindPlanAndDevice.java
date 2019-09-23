package com.more.buss.device.service.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.CommMethod;

/**
 * 混合查询
 * @author development
 *
 */
public class AjaxFindPlanAndDevice implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String planSn = CommMethod.escapeJs(modelAction.getParaMap().get("planSn"));     //计划代码
	    String planName = CommMethod.escapeJs(modelAction.getParaMap().get("planName"));  //计划名称
	    String cdpCycle = CommMethod.escapeJs(modelAction.getParaMap().get("cdpCycle"));  //保养周期
	    String cdpType = CommMethod.escapeJs(modelAction.getParaMap().get("cdpType"));  //计划类型
	    String dataAuth = CommMethod.escapeJs(modelAction.getParaMap().get("dataAuth"));  //组织机构
	    String deviceSn = CommMethod.escapeJs(modelAction.getParaMap().get("deviceSn"));  //设备sn
	    String deviceArea = CommMethod.escapeJs(modelAction.getParaMap().get("deviceArea"));  //所属区域
	    String userId = modelAction.getSessionUser().getId();
	    Map<String,String> map = new HashMap<String, String>();
	    //根据保养计划信息以及关联设备信息查询
	    String querySql = "SELECT rownum,t.*,b.value CDPCYCLE,s.name as DATAAUTH " +
        		"FROM T_CO_DEVICE_PLAN_INFO t " +
        		"LEFT JOIN SY_DICT_VAL b ON t.cdp_cycle=b.code AND b.dict_code='CDP_CYCLE' "
        		+ " LEFT JOIN SY_DEPT s ON s.id = t.data_auth " +
        		"WHERE t.cdp_plan_sn IN "+
        		"(SELECT a.cdp_plan_sn FROM T_CO_DEVICE_PLAN_CONNECT a "+
        		"WHERE t.cdp_plan_sn = a.cdp_plan_sn ";
        if(StringUtils.isNotBlank(deviceSn)){
        	querySql += " AND a.cdpi_device_sn like '%'||:deviceSn||'%'";
        	map.put("deviceSn", deviceSn);
        }
        if(StringUtils.isNotBlank(deviceArea)){
        	querySql += " AND a.cdpi_area_sn = :deviceArea ";
        	map.put("deviceArea", deviceArea);
        }
        if(StringUtils.isNotBlank(dataAuth)) {
        	querySql += " AND a.data_auth = :data_auth0 ";
        	map.put("data_auth0", dataAuth); 
        }else {
        	querySql += " and a.data_auth IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID0 ) ";
        	map.put("USER_ID0", userId);        	
        }        
        
        
     
        querySql += ")";
        if(StringUtils.isNotBlank(planSn)){
        	querySql+=" and t.cdp_plan_sn LIKE '%'||:planSn||'%'";
        	map.put("planSn", planSn);
		}
		if(StringUtils.isNotBlank(planName)){
			querySql+=" and t.cdp_plan_name LIKE '%'||:planName||'%'";
      map.put("planName", planName);
		}
		if(StringUtils.isNotBlank(cdpCycle)){
			querySql+=" and t.cdp_cycle =:cdpCycle";
			map.put("cdpCycle", cdpCycle);
		}
		if(StringUtils.isNotBlank(cdpType)){
			querySql+=" and t.cdp_type =:cdpType";
			map.put("cdpType", cdpType);
		}
		if(StringUtils.isNotBlank(dataAuth)){
			querySql+=" and t.DATA_AUTH =:dataAuth";
			map.put("dataAuth", dataAuth);
		}else{  //取当前登录用户的组织机构
			querySql += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
        	map.put("USER_ID", userId);			
		}
		List itemList = modelService.listSql(querySql, modelAction.getPage(), map,null,null);
	    modelAction.setAjaxPage(modelAction.getPage());
	    CommMethod.listToEscapeJs(itemList);
	    modelAction.getAjaxPage().setDataList(itemList);
	    
	    return BaseActionSupport.AJAX;
	}

}
