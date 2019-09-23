package com.more.buss.eis.bd.calendar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 获取所属车间信息列表
 * @Description 获取所属车间信息列表
 * @ClassName GetAreaSereice
 * @author csh
 * @version 1.0 developer 2017-3-8 created
 * @see GetAreaListSereice
 * @since 2017-3-8
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GetAreaListSereice implements FuncService {
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return AJAX
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction, com.more.fw.core.dbo.model.service.ModelService)
   */
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    

	  String flag = modelAction.getParaMap().get("flag");
	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    
	  if("checkArea".equals(flag)){
		  String areaId = modelAction.getParaMap().get("areaId");
	      Integer calStartMonth = Integer.parseInt(modelAction.getParaMap().get("calStartMonth"));
	      Integer calEndMonth = Integer.parseInt(modelAction.getParaMap().get("calEndMonth"));
	      
	      JSONArray areaIdArray = JSONArray.fromObject(areaId);

	      Map areaIdMap = null;
	      String areasql = "select t2.cal_name,t4.ca_name,t.cal_start_month,t.cal_end_month from t_co_calendar t," +
	        		"(select t1.cal_id from T_CO_CALENDAR_LINE t1 where t1.area_id = ?  ) t3 " +
	        		"left join T_CO_CALENDAR t2 on t2.id = t3.cal_id " +
	        		"left join T_CO_AREA t4 on t4.ca_id = ? and t4.data_auth = ? " +
	        		"where t.id in (t3.cal_id) and t.data_auth=? ";
	        List<Map> areaLists = null;
	        Map areaListMap = null;
	        int areaListSize;
	        int calStartMonth_s = 0;
	        int caEndMonth_s = 0;
	        String areaID = null;
	      for (int i = 0; i < areaIdArray.size(); i++) {
	        areaIdMap = (Map) areaIdArray.get(i);
	        areaID = (String) areaIdMap.get("areaId");
	        areaLists = modelService.listDataSql(areasql, new Object[] {areaID,areaID,dataAuth,dataAuth});
	        areaListSize = areaLists.size();
	        if (!areaLists.isEmpty()) {
	        	for (int j = 0; j < areaListSize; j++) {
	        		areaListMap = areaLists.get(j);
	        		if (""!=areaListMap.get("CAL_START_MONTH")&&null!=areaListMap.get("CAL_START_MONTH")&&""!=areaListMap.get("CAL_END_MONTH")&&null!=areaListMap.get("CAL_END_MONTH")) {
						calStartMonth_s = Integer.parseInt(areaListMap.get("CAL_START_MONTH").toString());
		        		caEndMonth_s = Integer.parseInt(areaListMap.get("CAL_END_MONTH").toString());
						if ((calStartMonth<=caEndMonth_s && calStartMonth>=calStartMonth_s) || (calEndMonth<=caEndMonth_s && calEndMonth>=calStartMonth_s) || (calStartMonth<=caEndMonth_s  && calEndMonth>=caEndMonth_s )) {
							modelAction.setAjaxString(modelAction.getText(areaListMap.get("CA_NAME")+"在"+areaListMap.get("CAL_NAME")+"下已存在"));
						}
					}
				}
			}
	        
	      }
	  }else{
		List<Object> areaList = null;
	    List list = new ArrayList<Object>();
	    //String sqlAreaList = "select t.CA_ID as areaid,t.CA_NAME as areaname,t1.ca_name prantareaname from t_co_area t left join t_co_area t1 on t1.ca_id = t.ca_parentareaid where t.CA_TYPE = '1' ";
	    String sqlAreaList = "select distinct t.CA_ID as areaid, t.CA_NAME as areaname, t1.ca_name prantareaname from t_co_area t left join t_co_area t1 on t1.ca_id = t.ca_parentareaid and t1.data_auth = :data_auth1"+
	    " where t.CA_TYPE =:CA_TYPE1"+
	    " and not exists (select 1 from T_CO_CALENDAR_LINE t2 where t2.area_id = t.ca_id ) and t.data_auth = :data_auth2";
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("CA_TYPE1", "1");
	    map.put("data_auth1", dataAuth);
	    map.put("data_auth2", dataAuth);
	    list = modelService.listSql(sqlAreaList+" ORDER BY T.CA_NAME ", modelAction.getPage(), map, null, null);
	    modelAction.setAjaxPage(modelAction.getPage());
	    CommMethod.listToEscapeJs(list);
	    modelAction.getAjaxPage().setDataList(list);
	  }
	  
    return BaseActionSupport.AJAX;
  }

}
