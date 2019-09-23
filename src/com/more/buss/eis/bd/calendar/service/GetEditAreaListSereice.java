package com.more.buss.eis.bd.calendar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
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
public class GetEditAreaListSereice implements FuncService {
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
    String calId = modelAction.getRequest().getParameter("calId");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    List list = new ArrayList<Object>();
    Map<String, String> map = new HashMap<String, String>();  
    String sqlAreaList = " select distinct t.CA_ID as areaid, t.CA_NAME as areaname, t1.ca_name prantareaname from t_co_area t left join t_co_area t1 on t1.ca_id = t.ca_parentareaid and t1.data_auth=:dataAuth1 where t.CA_TYPE =:CA_TYPE1  and not exists (select 1 from T_CO_CALENDAR_LINE t2 where t2.CAL_ID != :calId1 and t2.area_id = t.ca_id ) and t.data_auth=:dataAuth2  ";
    //String sqlAreaList = "select t.CA_ID as areaid,t.CA_NAME as areaname,t1.ca_name prantareaname from t_co_area t left join t_co_area t1 on t1.ca_id = t.ca_parentareaid where t.CA_TYPE = '1' ";
    map.put("CA_TYPE1", "1");
    map.put("calId1", calId);
    map.put("dataAuth1", dataAuth);
    map.put("dataAuth2", dataAuth);
    list = modelService.listSql(sqlAreaList+" ORDER BY T.CA_NAME ", modelAction.getPage(), map, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);

    return BaseActionSupport.AJAX;
  }

}