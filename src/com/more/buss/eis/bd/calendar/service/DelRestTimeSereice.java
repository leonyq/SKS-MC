package com.more.buss.eis.bd.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 删除休息时间
 * @Description 删除选中行休息时间
 * @ClassName DelRestTimeSereice
 * @author csh
 * @version 1.0 developer 2017-1-12 created
 * @see DelRestTimeSereice
 * @since 2017-1-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class DelRestTimeSereice implements FuncService {

  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return AJAX
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction, com.more.fw.core.dbo.model.service.ModelService)
   */
  private final Log log = LogFactory.getLog(this.getClass());

  public String exeFunc(ModelAction modelAction, ModelService modelService) {

    String restId = modelAction.getParaMap().get("rowRestIdStr");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    List<Object> list = new ArrayList<Object>();
    String sql = "select tr.CALW_ID CALW_ID, "+
      "  ROWNUM from T_CO_CALENDAR_RESTTIME tr where tr.ID = ?  and rownum =1";
    Map map = modelService.queryForMap(sql, new Object[] { restId });
    String calwId = (String) map.get("CALW_ID");

    TableDataMapExt rttd = new TableDataMapExt();
    
    rttd.setTableName("T_CO_CALENDAR_RESTTIME");
    rttd.setSqlWhere(" and ID=?");
    List list2 = new ArrayList();
    list2.add(restId);
    rttd.setSqlWhereArgs(list2);
    int delcount = modelService.del(rttd);
    list.add(0, delcount);
    modelAction.setAjaxList(list);

    String sqlrest = "select coalesce(sum(t.CALR_REST), 0) CALR_REST "
        + "from T_CO_CALENDAR_RESTTIME t where t.CALW_ID = ? and t.data_auth= ? ";
    int count = modelService.countSql(sqlrest, new Object[] { calwId , dataAuth});
    if (count != 0) {
      String wtsql = "update T_CO_CALENDAR_WORKTIME set calw_rest_total = ("
          + "select coalesce(sum(t.CALR_REST), 0) CALR_REST " + "from T_CO_CALENDAR_RESTTIME t where t.CALW_ID = ? and t.data_auth= ? ) "
          + "where id = ? ";
      
      modelService.execSql(wtsql, new Object[] { calwId, dataAuth, calwId });
    } else {
      String wtsql = "update T_CO_CALENDAR_WORKTIME tw set tw.calw_rest_total = 0 " + "where tw.id = ? ";
      modelService.execSql(wtsql, new Object[] { calwId, calwId });
    }
    return BaseActionSupport.AJAX;
  }

}
