package com.more.buss.eis.bd.calendar.service;

import java.util.ArrayList;
import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 删除工作时间
 * @Description 删除选中行工作时间
 * @ClassName DelWorkTimeSereice
 * @author csh
 * @version 1.0 developer 2017-1-12 created
 * @see DelWorkTimeSereice
 * @since 2017-1-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class DelWorkTimeSereice implements FuncService {
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return String AJAX
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction, com.more.fw.core.dbo.model.service.ModelService)
   */
  private final Log log = LogFactory.getLog(this.getClass());

  public String exeFunc(ModelAction modelAction, ModelService modelService) {

    String workId = modelAction.getParaMap().get("rowWorkIdStr");
    String dataId = modelAction.getParaMap().get("dataId");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    List<Object> list = null;
    ArrayList wtRep = new ArrayList();
    TableDataMapExt wttd = new TableDataMapExt();
    wttd.setTableName("T_CO_CALENDAR_WORKTIME");
    wttd.setSqlWhere(" and ID=?");
    wtRep.add(workId);
    wttd.setSqlWhereArgs(wtRep);
    int delcount = modelService.del(wttd);

    TableDataMapExt rttd = new TableDataMapExt();
    rttd.setTableName("T_CO_CALENDAR_RESTTIME");
    rttd.setSqlWhere(" and CALW_ID=?");
    rttd.setSqlWhereArgs(wtRep);
    modelService.del(rttd);
    String sql = "SELECT t.ID,to_char(t.CALW_START,'HH24:mi') CALW_START,to_char(t.CALW_END,'HH24:mi') CALW_END,t.CALW_GROUP,t.CALW_TIME,t.CAL_ID,t.CALW_OVER_FALG,t.CALW_INTER_DAY,t.CALW_REST_TOTAL FROM T_CO_CALENDAR_WORKTIME T WHERE T.CAL_ID = ? AND T.data_auth = ? ";
    list = modelService.listDataSql(sql, new Object[]{dataId,dataAuth});
    modelAction.setAjaxList(list);

    return BaseActionSupport.AJAX;
  }

}
