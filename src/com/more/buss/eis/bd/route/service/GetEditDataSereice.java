package com.more.buss.eis.bd.route.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 获取流程回显信息
 * @Description 获取流程回显信息
 * @ClassName GetRouteSereice
 * @author csh.
 * @version 1.0 developer 2017-4-11 created
 * @see GetRouteSereice
 * @since 2017-4-11
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GetEditDataSereice implements FuncService
{
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return String
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction,
   *      com.more.fw.core.dbo.model.service.ModelService)
   */
  private final Log log = LogFactory.getLog(this.getClass());

  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    HttpServletRequest hsr = modelAction.getRequest();
    Map ajaxMap = new HashMap<String, Object>();
    //long start = System.currentTimeMillis();
    try
    {
      String dataId = hsr.getParameter("dataId");
      String sql1 = "SELECT DATA_AUTH FROM T_CO_ROUTE WHERE ID=?";
      String auth;
      Map<String, String> map=modelService.queryForMap(sql1, new Object[]{dataId});
      if (null!=map && map.size()>0)
      {
        auth=map.get("DATA_AUTH");
      }else {
        auth = hsr.getSession().getAttribute("mcDataAuth").toString();
      }
      String routeCode = hsr.getParameter("routeCode");
      String userId = modelAction.getSessionUser().getId();
      //String auth = hsr.getSession().getAttribute("mcDataAuth").toString();
      // 获取当前登入人下有权限的部门信息
      String depthql = "SELECT DE.ID AS ID,DE.NAME AS NAME FROM SY_DATA_AUTH DA,SY_DEPT DE WHERE DA.DEPT_ID = DE.ID AND DA.USER_ID = ?";
      List<Map> deptMapLs = modelService.listDataSql(depthql, new Object[] {userId});
      CommMethod.listToEscapeJs(deptMapLs);
      ajaxMap.put("authLs", deptMapLs);
      // 获取工序信息
      String sqlRoute = "SELECT T.ID,T.GROUP_CODE,T.GROUP_NAME,T.GROUP_DESC,T.MS_CODE,T.VALID_FLAG,T.DEPT_ID , " +
      		" T.CREATE_USER,T.CREATE_TIME,T.EDIT_USER,T.EDIT_TIME,T.PHOTO_SIZE,T.PHOTO_NAME, " +
      		" T.PHOTO_PATH,T.GROUP_COLOR,T.DATA_AUTH,T.GROUP_TYPE,T.CROUP_TEST_MAX " +
      		" FROM T_CO_GROUP T WHERE T.VALID_FLAG = ? and t.data_auth=? ORDER BY T.GROUP_NAME";// 下拉框值排序
      List<Object> groupList = modelService.listDataSql(sqlRoute,new Object[]{"Y",auth});
      
      ajaxMap.put("groupList", groupList);
      // 获取流程信息
      String groupSql = "SELECT A.* FROM T_CO_ROUTE A WHERE A.CR_ROUTE_ID = ? and a.data_auth=? ";
      List<Object> flowList = modelService.listDataSql(groupSql, new Object[] {routeCode,auth});
      ajaxMap.put("flowList", flowList);
      // 获取流程统计设置信息
      String countSql = "SELECT A.*, B.GROUP_NAME AS CRCO_START_NAME, " +
      		" C.GROUP_NAME AS CRCO_END_NAME FROM T_CO_ROUTE_COUNT A " +
      		" LEFT JOIN T_CO_GROUP B ON B.GROUP_CODE = A.CRCO_START_GROUP and b.data_auth=? " +
      		" LEFT JOIN T_CO_GROUP C ON C.GROUP_CODE = A.CRCO_END_GROUP and c.data_auth=? " +
      		" WHERE A.CR_ROUTE_ID = ? and a.data_auth=? ";
      List<Object> countList = modelService.listDataSql(countSql, new Object[] {auth,auth,routeCode,auth});
      ajaxMap.put("countList", countList);
      //long end = System.currentTimeMillis();
      //long ss = end - start;
      //log.error("…………………………………………………………获取流程相关信息耗时："+ss);
    }
    catch (Exception e)
    {
      log.error(e);
      ajaxMap.put("res", "error");
      ajaxMap.put("msg", modelAction.getText("获取流程信息失败"));
    }
   // modelAction.setAjaxMap(ajaxMap);
   // modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
    //long allend = System.currentTimeMillis();
    //long sss = allend - start;
    //log.error("…………………………%%%%%%%%……获取流程相关信息耗时："+sss);
    //return modelAction.AJAX;
    CommMethod.mapToEscapeJs(ajaxMap);
    return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
  }

}
