package com.more.buss.device.service.pg;

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
		String planSn = modelAction.getParaMap().get("planSn");     //计划代码
	    String planName = modelAction.getParaMap().get("planName");  //计划名称
	    String cdpCycle = modelAction.getParaMap().get("cdpCycle");  //保养周期
	    String cdpType = modelAction.getParaMap().get("cdpType");  //计划类型
	    String dataAuth =modelAction.getParaMap().get("dataAuth");  //组织机构
	    String deviceSn = modelAction.getParaMap().get("deviceSn");  //设备sn
	    String deviceArea =modelAction.getParaMap().get("deviceArea");  //所属区域
	    Map<String,String> map = new HashMap<String, String>();
	    //根据保养计划信息以及关联设备信息查询
	    String querySql = "SELECT row_number() over() as rownum,t.*,b.value CDPCYCLE " +
        		"FROM T_CO_DEVICE_PLAN_INFO t " +
        		"LEFT JOIN SY_DICT_VAL b ON t.cdp_cycle=b.code AND b.dict_code='CDP_CYCLE' " +
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
       	querySql += " AND a.data_auth = :data_auth0 ";
    	map.put("data_auth0", dataAuth);
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
			String sql = "select de.id as id,de.name as name " +
					"from sy_data_auth da,sy_dept de where da.dept_id = de.id and da.user_id = ?";
			List<Map> sList = modelService.listDataSql(sql, new Object[] { CommMethod.getSessionUser().getId() });
			String currDataAuth = "";
			if(sList!=null&&sList.size()>0){
				for(int i=0;i<sList.size();i++){
					if(i==0){
						currDataAuth = (String) sList.get(i).get("ID");
						querySql+=" and t.DATA_AUTH in (:currDataAuth"+i;
						
						map.put("currDataAuth"+i, currDataAuth);
					}else{
						//currDataAuth += ","+(String) sList.get(i).get("ID");
					  currDataAuth = (String) sList.get(i).get("ID");
						querySql+=",:currDataAuth"+i;
						map.put("currDataAuth"+i, currDataAuth);
					}
				}
			}
			 querySql+=")";
			
		}
		List itemList = modelService.listSql(querySql, modelAction.getPage(), map,null,null);
	    modelAction.setAjaxPage(modelAction.getPage());
	    CommMethod.listToEscapeJs(itemList);
	    modelAction.getAjaxPage().setDataList(itemList);
	    
	    return BaseActionSupport.AJAX;
	}

}
