package com.more.buss.eis.bd.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.common.method.Constants;

/**
 * @Title 修改工厂日历
 * @Description 修改工厂日历中的日历信息
 * @ClassName EditCalendarSereice
 * @author csh
 * @version 1.0 developer 2017-1-12 created
 * @see EditCalendarSereice
 * @since 2017-1-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class EditCalendarSereice implements FuncService {
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
    //工厂日历数据
    HttpServletRequest hsr = modelAction.getRequest();
    String formId = hsr.getParameter("formId");
    if(StringUtils.isBlank(formId)){
       formId = hsr.getParameter("formIds");
    }
    String iframeId = hsr.getParameter("iframeId");
    String calName = modelAction.getRequest().getParameter("calName");
    Integer calStartMonth = Integer.parseInt(hsr.getParameter("calStartMonth"));
    Integer calEndMonth = Integer.parseInt(hsr.getParameter("calEndMonth"));
    String calSatFlag = hsr.getParameter("calSatFlag");
    String calSunFlag = hsr.getParameter("calSunFlag");
    String calDefaultFlag = hsr.getParameter("calDefaultFlag");
    String id = hsr.getParameter("calId");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sqlflag = "select t.* from T_CO_CALENDAR t where t.CAL_DEFAULT_FLAG =? AND T.ID !=? and t.data_auth=?";
    int countflag = modelService.countSql(sqlflag,new Object[]{"Y",id,dataAuth});
    if (countflag != 0) {
      if ("Y".equals(calDefaultFlag)) {
        return modelAction.alertParentInfo(modelAction.getText("工厂日历已存在默认标识"));
      }
    }

    if (calSatFlag == null) {
      calSatFlag = "N";
    }
    if (calSunFlag == null) {
      calSunFlag = "N";
    }
    if (calDefaultFlag == null) {
      calDefaultFlag = "N";
    }
    String sql = "select t.CAL_NAME CAL_NAME from T_CO_CALENDAR t where t.ID=?";
    Map map = modelService.queryForMap(sql, new Object[] { id });
    if (!map.get("CAL_NAME").equals(calName)) {
      String sqlname = "select t.CAL_NAME from T_CO_CALENDAR t where t.CAL_NAME=? and t.data_auth=?";
      int count = modelService.countSql(sqlname, new Object[] { calName,dataAuth });
      if (count != 0) {
        return modelAction.reloadParent(modelAction.getText("日历名称已存在"));
      }
    }
    TableDataMapExt td = new TableDataMapExt();
    Map calmap = td.getColMap();
    List list = new ArrayList();
    td.setTableName("T_CO_CALENDAR");
    td.setSqlWhere(" and ID=?");
    list.add(id);
    td.setSqlWhereArgs(list);
    calmap.put("CAL_NAME", calName);
    calmap.put("CAL_START_MONTH", calStartMonth);
    calmap.put("CAL_END_MONTH", calEndMonth);
    calmap.put("CAL_SAT_FLAG", calSatFlag);
    calmap.put("CAL_SUN_FLAG", calSunFlag);
    calmap.put("CAL_DEFAULT_FLAG", calDefaultFlag);
    calmap.put("DATA_AUTH", dataAuth);
    modelService.edit(td);
    return modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_EDIT);
    //return modelAction.reloadParent(modelAction.getText("工厂日历修改成功"));
  }

}
