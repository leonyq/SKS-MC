package com.more.buss.eis.bd.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 删除线别信息
 * @Description 删除选中行线别信息
 * @ClassName DelWorkTimeSereice
 * @author csh
 * @version 1.0 developer 2017-3-11 created
 * @see DelWorkTimeSereice
 * @since 2017-3-11
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class DelAreaSereice implements FuncService {
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

    String calId = modelAction.getParaMap().get("calId");
    String areaId = modelAction.getParaMap().get("areaId");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    JSONArray areaIdArray = JSONArray.fromObject(areaId);

    List<Object> list = null;
    ArrayList wtRep = null;
    TableDataMapExt rttd = null;
    Map areaIdMap = null;
    int delcount = 0;
    String areaId_s = null;
    for (int i = 0; i < areaIdArray.size(); i++) {
      areaIdMap = (Map) areaIdArray.get(i);
      areaId_s = (String) areaIdMap.get("areaId");
      list = new ArrayList<Object>();
      wtRep = new ArrayList();
      rttd = new TableDataMapExt();
      rttd.setTableName("T_CO_CALENDAR_LINE");
      rttd.setSqlWhere(" and CAL_ID=? AND AREA_ID=? and data_auth=? ");
      wtRep.add(calId);
      wtRep.add(areaId_s);
      wtRep.add(dataAuth);
      rttd.setSqlWhereArgs(wtRep);
      delcount = modelService.del(rttd);
    }
    list.add(0, delcount);
   
    modelAction.setAjaxList(list);

    return BaseActionSupport.AJAX;
  }

}
