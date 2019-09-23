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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 查询所属车间信息列表
 * @Description 查询所属车间信息列表
 * @ClassName GetAreaSereice
 * @author csh
 * @version 1.0 developer 2017-3-8 created
 * @see SreachAreaSereice
 * @since 2017-3-8
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class SreachAreaSereice implements FuncService {
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
    String searchArea = modelAction.getParaMap().get("searchArea");
    String areaId = modelAction.getParaMap().get("areaId");
    String areaName = modelAction.getParaMap().get("areaName");

String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));

    Map<String, String> map = new HashMap<String, String>();
    List<Object> areaList = null;
    List list = new ArrayList<Object>();
    String sqlArea = "select  t.CA_ID as areaid, t.CA_NAME as areaname, t1.ca_name prantareaname from t_co_area t"+
                    " left join t_co_area t1 on t1.ca_id = t.ca_parentareaid and t1.data_auth = :data_auth1 where t.CA_TYPE =:CA_TYPE1 "+
      " and not exists (select 1 from T_CO_CALENDAR_LINE t2 where t2.area_id = t.ca_id) and t.data_auth = :data_auth2 ";
    map.put("data_auth1",dataAuth);
    map.put("CA_TYPE1","1");
    map.put("data_auth2",dataAuth);
    if (StringUtils.isNotBlank(searchArea))
    {
      sqlArea += " and t.CA_PARENTAREAID= :searchArea1 ";
      map.put("searchArea1",searchArea);
    }
    if (StringUtils.isNotBlank(areaId))
    {
      sqlArea +=  " and t.CA_ID like '%'||:areaId1||'%' ";
      map.put("areaId1",areaId);
    }
    if (StringUtils.isNotBlank(areaName))
    {
      sqlArea +=  " and t.CA_NAME like '%'||:areaName1||'%' ";
      map.put("areaName1",areaName);
    }
    list = modelService.listSql(sqlArea+" ORDER BY T.CA_NAME ", modelAction.getPage(),  map, null, null);
    /*
    if (areaId.isEmpty() && areaName.isEmpty()) {
      //areaList = modelService.listDataSql(sqlArea+"and t.CA_PARENTAREAID= ? order by t.CA_NAME", new Object[] { searchArea, searchArea });
      if (!searchArea.isEmpty()) {
        sqlArea = sqlArea + "and t.CA_PARENTAREAID= :searchArea1";
        map.put("searchArea1",searchArea);
      }
      list = modelService.listSql(sqlArea+" ORDER BY T.CA_NAME ", modelAction.getPage(), map,null , null);
    }
    if (areaId.isEmpty() && !areaName.isEmpty()) {
      //areaList = modelService.listDataSql(sqlArea+"and t.CA_NAME= ? order by t.CA_NAME", new Object[] { searchArea,areaName });
      sqlArea = sqlArea + "and t.CA_NAME like '%'||:areaName1||'%'";
      map.put("areaName1",areaName);
      list = modelService.listSql(sqlArea+" ORDER BY T.CA_NAME ", modelAction.getPage(), map, null, null);
    }
    if (areaName.isEmpty() && !areaId.isEmpty()) {
      //areaList = modelService.listDataSql(sqlArea+"and t.CA_ID= ? order by t.CA_NAME", new Object[] { searchArea,areaId});
      sqlArea = sqlArea + "and t.CA_ID like '%'||:areaId1||'%'";
      map.put("areaId1",areaId);
      list = modelService.listSql(sqlArea+" ORDER BY T.CA_NAME ", modelAction.getPage(),  map, null, null);
    }
    */
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);
    //modelAction.setAjaxList(areaList);
    return BaseActionSupport.AJAX;
  }

}
