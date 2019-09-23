package com.more.buss.eis.bd.calendar.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import edu.emory.mathcs.backport.java.util.concurrent.TimeUnit;

/**
 * @Title 添加休息时间
 * @Description 添加选中工作时间的一条休息时间
 * @ClassName AddRestTimeSereice
 * @author csh
 * @version 1.0 developer 2017-1-12 created
 * @see AddRestTimeSereice
 * @since 2017-1-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class AddRestTimeSereice implements FuncService {
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

    Map map = modelAction.getParaMap();
    String id = StringUtils.getUUID();
    String workTimeId = (String) map.get("rowRestIdStr");
    String calrStartH = (String) map.get("calrStartH");
    String calrStartM = (String) map.get("calrStartM");
    String calrEndH = (String) map.get("calrEndH");
    String calrEndM = (String) map.get("calrEndM");
    String calwInterDay = (String) map.get("calwInterDay");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    long rt = 0;
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
    Date sdate, edate;
    try {
      sdate = sdf.parse(calrStartH.trim() + ":" + calrStartM.trim());
      edate = sdf.parse(calrEndH.trim() + ":" + calrEndM.trim());
    } catch (ParseException e) {
      log.error(e);
      throw new BussException(modelAction.getText("休息时间出错"), e);
    }
    TableDataMapExt rttd = new TableDataMapExt();
    Map rtMap = rttd.getColMap();
    rttd.setTableName("T_CO_CALENDAR_RESTTIME");
    rtMap.put("ID", id);
    rtMap.put("CALW_ID", workTimeId);
    rtMap.put("CALR_START", sdate);
    rtMap.put("CALR_END", edate);
    rtMap.put("DATA_AUTH", dataAuth);
    rt = (TimeUnit.MINUTES.toMillis(edate.getTime() - sdate.getTime()) / (60 * 1000)) / 60000;
    if (calwInterDay.equals("Y")) {
      if (sdate.getTime()<86400000&&edate.getTime()<sdate.getTime())
      {
        rt = (1440 + rt);
      }
    }
    rtMap.put("CALR_REST", rt);
    modelService.save(rttd);
    String wtsql = "update T_CO_CALENDAR_WORKTIME  set calw_rest_total = ((select t.CALW_REST_TOTAL CALW_REST_TOTAL from T_CO_CALENDAR_WORKTIME t where t.ID=?)+?) where id=?";
    modelService.execSql(wtsql, new Object[] { workTimeId, rt, workTimeId });
    List<Object> restList = new ArrayList<Object>();
    restList.add(0, id);
    modelAction.setAjaxList(restList);
    return BaseActionSupport.AJAX;
  }

}
