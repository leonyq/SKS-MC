package com.more.buss.eis.bd.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 增加线别信息
 * @Description 线别信息
 * @ClassName AddCalendarSereice
 * @author csh.
 * @version 1.0 developer 2017-3-11 created
 * @see AddCalendarSereice
 * @since 2017-3-11
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class AddAreaSereice implements FuncService {
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return String
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction, com.more.fw.core.dbo.model.service.ModelService)
   */
  private final Log log = LogFactory.getLog(this.getClass());

  public String exeFunc(ModelAction modelAction, ModelService modelService) {

    try { //工厂日历数据

      String calId = modelAction.getParaMap().get("calId");
      String areaId = modelAction.getParaMap().get("areaId");
      Integer calStartMonth = Integer.parseInt(modelAction.getParaMap().get("calStartMonth"));
      Integer calEndMonth = Integer.parseInt(modelAction.getParaMap().get("calEndMonth"));
      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      JSONArray areaIdArray = JSONArray.fromObject(areaId);

      TableDataMapExt areatd = null;
      String areaID = null;
      String aid = null;
      Map areaMap = null;

      ArrayList wtRep = new ArrayList();
      TableDataMapExt rttd = new TableDataMapExt();
      rttd.setTableName("T_CO_CALENDAR_LINE");
      rttd.setSqlWhere(" and CAL_ID=? and data_auth=? ");
      wtRep.add(calId);
      wtRep.add(dataAuth);
      rttd.setSqlWhereArgs(wtRep);
      //modelService.del(rttd);

      //插入线别信息
      Map areaIdMap = null;
      String areasql = "select t3.cal_id,t2.cal_name,t4.ca_name,t.cal_start_month,t.cal_end_month from t_co_calendar t," +
        		"(select t1.cal_id,t1.area_id from T_CO_CALENDAR_LINE t1 where t1.area_id = ?  ) t3 " +
        		"left join T_CO_CALENDAR t2 on t2.id = t3.cal_id " +
        		"left join T_CO_AREA t4 on t4.ca_id = ? and t4.data_auth=? " +
        		"where t.id in (t3.cal_id) and t.data_auth=? ";
        List<Map> areaLists = null;
        Map areaListMap = null;
        int areaListSize;
        int calStartMonth_s = 0;
        int caEndMonth_s = 0;
        String areaId_s = null;
      for (int i = 0; i < areaIdArray.size(); i++) {
        areaIdMap = (Map) areaIdArray.get(i);
        areaID = (String) areaIdMap.get("areaId");
        areaLists = modelService.listDataSql(areasql, new Object[] {areaID,areaID ,dataAuth ,dataAuth });
        areaListSize = areaLists.size();
        if (!areaLists.isEmpty()) {
        	for (int j = 0; j < areaListSize; j++) {
        		areaListMap = areaLists.get(j);
        		if (""!=areaListMap.get("CAL_START_MONTH")&&null!=areaListMap.get("CAL_START_MONTH")&&""!=areaListMap.get("CAL_END_MONTH")&&null!=areaListMap.get("CAL_END_MONTH")) {
        		  calStartMonth_s = Integer.parseInt(areaListMap.get("CAL_START_MONTH").toString());
	        		caEndMonth_s = Integer.parseInt(areaListMap.get("CAL_END_MONTH").toString());
	        		areaId_s = areaListMap.get("CAL_ID").toString();
	        	if (!calId.equals(areaId_s))
            {
	        	  if ((calStartMonth<=caEndMonth_s && calStartMonth>=calStartMonth_s) || (calEndMonth<=caEndMonth_s && calEndMonth>=calStartMonth_s) || (calStartMonth<=caEndMonth_s && calEndMonth>=caEndMonth_s )) {
	              modelAction.setAjaxString(modelAction.getText(areaListMap.get("CA_NAME")+"在"+areaListMap.get("CAL_NAME")+"下已存在"));
	              return BaseActionSupport.AJAX;
	            }
            }
					
				}
			}
		}
        areatd = new TableDataMapExt();
        areaMap = areatd.getColMap();
        aid = StringUtils.getUUID();
        areatd.setTableName("T_CO_CALENDAR_LINE");
        areaMap.put("ID", aid);
        areaMap.put("CAL_ID", calId);
        areaMap.put("AREA_ID", areaID);
        areaMap.put("DATA_AUTH", dataAuth);
        modelService.save(areatd);
        List<Object> areaList = new ArrayList<Object>();
        areaList.add(0, aid);
        modelAction.setAjaxList(areaList);
      }

    } catch (Exception e) {
      log.error(e);
      throw new BussException(modelAction.getText("新增线别信息失败"), e);
    }

    return BaseActionSupport.AJAX;
  }

}
