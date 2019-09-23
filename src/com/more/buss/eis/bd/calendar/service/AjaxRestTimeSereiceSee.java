package com.more.buss.eis.bd.calendar.service;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 显示休息时间
 * @Description 显示选中工作时间对应的休息时间
 * @ClassName AjaxRestTimeSereice
 * @author csh
 * @version 1.0 developer 2017-1-12 created
 * @see AjaxRestTimeSereice
 * @since 2017-1-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class AjaxRestTimeSereiceSee implements FuncService {
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
    String workId = modelAction.getParaMap().get("workId");
   //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    List<Object> restList = null;
    String sqlRest = "select t.ID,to_char(t.CALR_START,'HH24:mi') CALR_START,"
        + "to_char(t.CALR_END,'HH24:mi') CALR_END " + "from t_co_calendar_resttime t "
        + "where CALW_ID = ?  order by t.CALR_START";
    restList = modelService.listDataSql(sqlRest, new Object[] { workId });
    modelAction.setAjaxList(restList);
    return BaseActionSupport.AJAX;
  }

}
