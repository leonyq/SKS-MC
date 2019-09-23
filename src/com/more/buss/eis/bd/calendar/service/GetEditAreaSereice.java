package com.more.buss.eis.bd.calendar.service;

import java.util.List;

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
 * @see GetEditAreaSereice
 * @since 2017-3-8
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GetEditAreaSereice implements FuncService {
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
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    List areaList = null;
    String sqlArea = "select t.CA_ID as caid,t.CA_PARENTAREAID as parentareaid,t.CA_NAME as areaname from t_co_area t where t.CA_TYPE=? and t.data_auth=? order by t.CA_NAME";
    areaList = modelService.listDataSql(sqlArea,new Object[]{"0" , dataAuth});
    CommMethod.listToEscapeJs(areaList);
    modelAction.setAjaxList(areaList);
    return BaseActionSupport.AJAX;
  }

}
