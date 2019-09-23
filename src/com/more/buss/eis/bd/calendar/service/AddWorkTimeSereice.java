package com.more.buss.eis.bd.calendar.service;

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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 添加工作时间
 * @Description 添加一条工作时间
 * @ClassName AddWorkTimeSereice
 * @author csh
 * @version 1.0 developer 2017-1-12 created
 * @see AddWorkTimeSereice
 * @since 2017-1-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class AddWorkTimeSereice implements FuncService {
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
    String dataId = (String) map.get("dataId");
    String id = StringUtils.getUUID();
    String calwGroup = (String) map.get("calwGroup");
    String calwTime= (String) map.get("calwTime");
    String calwOverFalg = (String) map.get("calwOverFalg");
    String calwInterDay = (String) map.get("calwInterDay");
    String calwStartH = (String) map.get("calwStartH");
    String calwStartM = (String) map.get("calwStartM");
    String calwEndH = (String) map.get("calwEndH");
    String calwEndM = (String) map.get("calwEndM");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));

    try {
      SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
      Date sdate = sdf.parse(calwStartH.trim() + ":" + calwStartM.trim());
      Date edate = sdf.parse(calwEndH.trim() + ":" + calwEndM.trim());
      TableDataMapExt wttd = new TableDataMapExt();
      Map wtMap = wttd.getColMap();
      wttd.setTableName("T_CO_CALENDAR_WORKTIME");
      wtMap.put("ID", id);
      wtMap.put("CAL_ID", dataId);
      wtMap.put("CALW_GROUP", calwGroup);
      wtMap.put("CALW_TIME", calwTime);
      wtMap.put("CALW_START", sdate);
      wtMap.put("CALW_END", edate);
      wtMap.put("CALW_OVER_FALG", calwOverFalg);
      wtMap.put("CALW_INTER_DAY", calwInterDay);
      wtMap.put("CALW_REST_TOTAL", 0);
      wtMap.put("DATA_AUTH", dataAuth);
      modelService.save(wttd);
      List<Object> workList = null;
      String sql = "SELECT t.ID,to_char(t.CALW_START,'HH24:mi') CALW_START,to_char(t.CALW_END,'HH24:mi') CALW_END,t.CALW_GROUP,t.CALW_TIME,t.CAL_ID,t.CALW_OVER_FALG,t.CALW_INTER_DAY,t.CALW_REST_TOTAL FROM T_CO_CALENDAR_WORKTIME T WHERE T.CAL_ID = ?  ";
      workList = modelService.listDataSql(sql, new Object[]{dataId});
      modelAction.setAjaxList(workList);
    } catch (Exception e) {
      log.error(e);
      throw new BussException(modelAction.getText("新增工作时间失败"), e);
    }
    return BaseActionSupport.AJAX;
  }

}
