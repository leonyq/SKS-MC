package com.more.buss.eis.bd.calendar.service.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 修改工厂日历显示列表
 * @Description 修改工厂日历显示列表
 * @ClassName EditListCalendarSereice
 * @author csh
 * @version 1.0 developer 2017-1-12 created
 * @see EditListCalendarSereice
 * @since 2017-1-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class EditListCalendarSereiceSee implements FuncService {
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return String
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction, com.more.fw.core.dbo.model.service.ModelService)
   */
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String dataId = modelAction.getRequest().getParameter("dataId");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    Map<Object, Object> map = new HashMap<Object, Object>();
    List<Object> workList = null;
    List<Object> restList = null;
    List<Object> areaList = null;
    String sqlCal = "select * from t_co_calendar t where id = ?";
    map = modelService.queryForMap(sqlCal, new Object[] { dataId });
    modelAction.setDataMap(map);
    String sqlWork = "select t.ID,to_char(t.CALW_START,'HH24:mi') CALW_START,"
        + "to_char(t.CALW_END,'HH24:mi') CALW_END,t.CALW_GROUP,t.CALW_TIME,t.CAL_ID,t.CALW_OVER_FALG,t.CALW_INTER_DAY,t.CALW_REST_TOTAL "
        + "from T_CO_CALENDAR_WORKTIME t where CAL_ID = ? and t.data_auth =? order by t.CALW_START";
    workList = modelService.listDataSql(sqlWork, new Object[] { dataId,dataAuth });
    modelAction.setDataList(workList);
    String sqlRest = "select tr.ID,to_char(tr.CALR_START,'HH24:mi') CALR_START,to_char(tr.CALR_END,'HH24:mi') CALR_END, "
        + "tws.CALW_GROUP,tws.CALW_TIME from T_CO_CALENDAR_RESTTIME tr,(select * "
        + "from (select tw.ID ID,tw.CALW_GROUP CALW_GROUP,tw.CALW_TIME CALW_TIME,ROW_NUMBER() OVER (ORDER BY id ASC) AS ROWNUM "
        + "from T_CO_CALENDAR_WORKTIME tw where tw.CAL_ID = ? and tw.data_auth = ? order by tw.CALW_START) as w  "
        + "where rownum = 1) tws where tr.CALW_ID = tws.ID and tr.data_auth = ?  order by tr.CALR_START";
    restList = modelService.listDataSql(sqlRest, new Object[] { dataId,dataAuth,dataAuth});
    modelAction.setDataList0(restList);

    String sqlArea = "select t.CA_ID as areaid,t.CA_NAME as areaname from t_co_area t where CA_ID in (select area_id from t_co_calendar_line where cal_id=?  and data_auth=? )  and t.data_auth=? ";
    areaList = modelService.listDataSql(sqlArea, new Object[] { dataId });
    modelAction.setDataList1(areaList);

    //return modelAction.dynamicForwardExeid(modelAction.getJSP_VIEW_ID());// 该ID为功能对应的视图ID
    return modelAction.ActionForward("/buss/viewCode/MC-MES/f5613844eb20467bbc4381cfea15f5f9/seeMaterialClendar.jsp");
  }

}