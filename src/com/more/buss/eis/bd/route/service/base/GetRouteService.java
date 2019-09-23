package com.more.buss.eis.bd.route.service.base;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;

/**
 * @Title 获取工序信息
 * @Description 获取工序信息
 * @ClassName GetRouteSereice
 * @author csh.
 * @version 1.0 developer 2017-4-11 created
 * @see GetRouteSereice
 * @since 2017-4-11
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GetRouteService implements FuncService {
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return String
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction, com.more.fw.core.dbo.model.service.ModelService)
   */
  private final Log log = LogFactory.getLog(this.getClass());
  public HttpServletRequest hsr = null;

  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    hsr = modelAction.getRequest();
    List<Object> groupList = null;
    List<Object> modelList = null;
    List<Object> itemList = null;
    Map<String, Object> ajaxMap = new HashMap<String, Object>();
    try {
      String flag = hsr.getParameter("flag");
      if ("getGroup".equals(flag)) {
        String routeStep = hsr.getParameter("routeStep");
        //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        //String sqlRoute = "select t.* from t_co_group t where t.ms_code like ? order by NLSSORT(t.group_name,'NLS_SORT = SCHINESE_PINYIN_M') asc";//下拉框值排序
        String sqlRoute = "SELECT T.ID,T.group_code,T.group_name,T.group_desc,T.ms_code,T.valid_flag,T.dept_id ,T.create_user,T.create_time,T.edit_user,T.edit_time,T.photo_size,T.photo_name,T.photo_path,T.group_color,T.data_auth,T.group_type,T.croup_test_max from t_co_group t where t.ms_code like ? and t.data_auth=? order by t.group_name";//下拉框值排序
        groupList = modelService.listDataSql(sqlRoute, new Object[] { routeStep,dataAuth });
        ajaxMap.put("groupList", groupList);
        //modelAction.setAjaxList(groupList);
      } else if ("editHuixian".equals(flag)) {
        String assisItem = hsr.getParameter("assisItem");
        String ctiModelCode = hsr.getParameter("ctiModelCode");
        String ctiItemCode = hsr.getParameter("ctiItemCode");
        String icsql = "select distinct t.id,t1.ci_item_name,t1.ci_item_spec from t_co_item t1 left join T_CO_BOM t on t1.ci_item_code = t.cb_item_code and t1.data_auth=t.data_auth where t1.ci_item_code = ? and t1.data_auth=? ";
        String icsql_s = "select distinct t.id,t1.ci_item_name,t1.ci_item_spec from T_CO_ITEM t1 left join T_CO_BOM t on t1.ci_item_code = t.cb_item_code and t1.data_auth=t.data_auth where t1.ci_item_code = ? and t1.data_auth=? ";
        String icsql_f = "select distinct t1.ASSISTANTTOOLNAME as ci_item_name,t1.ASSISTANTTOOLSPEC as ci_item_spec from T_CO_ASSISTANTTOOL t1 where t1.ASSISTANTTOOLNO = ? and t1.data_auth=? ";
        if (ctiModelCode != null && ctiModelCode != "") {
          modelList = modelService.listDataSql(icsql, new Object[] { ctiModelCode.trim(),dataAuth });
          ajaxMap.put("modelList", modelList);
          //modelAction.setAjaxList(modelList);
        }
        if (ctiItemCode != null && ctiItemCode != "") {
          if ("0".equals(assisItem)) {
            itemList = modelService.listDataSql(icsql_s, new Object[] { ctiItemCode.trim(),dataAuth });
            ajaxMap.put("itemList", itemList);
            //modelAction.setDataList(itemList);
          } else if ("1".equals(assisItem)) {
            itemList = modelService.listDataSql(icsql_f, new Object[] { ctiItemCode.trim(),dataAuth });
            ajaxMap.put("itemList", itemList);
            //modelAction.setDataList(itemList);
          }

        }

      }

    } catch (Exception e) {
      log.error(e);
      throw new BussException(modelAction.getText("获取工序信息失败"), e);
    }
    CommMethod.mapToEscapeJs(ajaxMap);
    return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
    //return modelAction.AJAX;
  }

}
