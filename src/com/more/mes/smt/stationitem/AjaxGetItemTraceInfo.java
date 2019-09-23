package com.more.mes.smt.stationitem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class AjaxGetItemTraceInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
   
    String timeBegin = request.getParameter("timeBegin");
    String timeEnd = request.getParameter("timeEnd");
    String dataAuth = request.getParameter("dataAuth");
    String projectId = request.getParameter("projectId");//工单
    String moNumber = request.getParameter("moNumber");//制令单号
    String wsiItemSn = request.getParameter("wsiItemSn");//组别id
    String wsidataType = request.getParameter("wsidataType");
    String userId=modelAction.getUser().getId();
    String sqlWhere=" WHERE 1=1 AND T.WSI_ACTIONTYPE='0'   ";
    Map<String, String> map = new HashMap<String, String>();
    if (StringUtils.isNotBlank(timeBegin))
    {
      sqlWhere += " AND T.WSI_LOADTIME >=TO_DATE(:timeBegin,'yyyy-mm-dd HH24:MI:ss')";   
      map.put("timeBegin", timeBegin);
    }
    if (StringUtils.isNotBlank(timeEnd))
    {
      sqlWhere += " AND T.WSI_LOADTIME <=TO_DATE(:timeEnd,'yyyy-mm-dd HH24:MI:ss')";  
      map.put("timeEnd", timeEnd);
    }
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlWhere += " AND T.DATA_AUTH =:dataAuth ";
      map.put("dataAuth", dataAuth);
    }
    else
    {
      sqlWhere += " AND T.DATA_AUTH IN( SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID=:userId ) ";
      map.put("userId", userId);
    }
    if (StringUtils.isNotBlank(projectId))
    {
      sqlWhere += " AND J.PM_PROJECT_ID = :projectId ";
      map.put("projectId", projectId);
    }
    if (StringUtils.isNotBlank(moNumber))
    {
      sqlWhere += " AND T.WSI_MO_NUMBER = :moNumber ";
      map.put("moNumber", moNumber);
    }
    if (StringUtils.isNotBlank(wsiItemSn))
    {
      sqlWhere += " AND T.WSI_ITEM_SN = :wsiItemSn ";
      map.put("wsiItemSn", wsiItemSn);
    }
   

    String sql = null;
    String sql1 = null;
    String orderSql=" ORDER BY T.WSI_MO_NUMBER,T.WSI_ITEM_SN,T.WSI_LOADTIME ";
      //H.WIT_ID
      
      sql= "SELECT\r\n" + 
        "H.NAME AS DATA_AUTH,\r\n" + 
        "T.WSI_ITEM_SN,\r\n" + 
        "F.VALUE AS ITEM_TYPE,\r\n" + 
        "J.PM_PROJECT_ID AS WT_PROJECT_ID,  \r\n" + 
        "T.WSI_MO_NUMBER,\r\n" + 
        "T.WSI_MODEL_CODE,\r\n" + 
        "D.VALUE,\r\n" + 
        "B.CA_NAME,\r\n" + 
        "C.CA_NAME AS AREA_NAME1,\r\n" + 
        "T.WSI_ITEM_CODE,\r\n" + 
        "T.WSI_LOT_NO,\r\n" + 
        "T.WSI_ITEM_COUNT,\r\n" + 
        "T.WSI_POINT,\r\n" + 
        "T.WSI_POINT_NUM,\r\n" + 
        "G.SUPPLIER_NAME,\r\n" + 
        "T.WSI_DEVICE_SN,\r\n" + 
        "T.WSI_DEVICE_SEQ,\r\n" + 
        "T.WSI_TRUCK_NO,\r\n" + 
        "T.WSI_TABLE_NO,\r\n" + 
        "T.WSI_LOADPOINT_SN,\r\n" + 
        "T.WSI_FEEDER_SN,\r\n" + 
        "T.WSI_CHANEL_NO,\r\n" + 
        "T.WSI_TRAY_FLAG,\r\n" + 
        "T.WSI_REPEAT_FLAG,\r\n" + 
        "A.NAME,\r\n" + 
        "TO_CHAR(T.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME, \r\n" + 
        "E.VALUE AS ACTIONTYPE,  \r\n" + 
        "T.ID AS DATAID  \r\n" + 
        "FROM T_WIP_STATION_ITEM T\r\n" + 
        "LEFT JOIN T_PM_MO_BASE J ON J.PM_MO_NUMBER=T.WSI_MO_NUMBER AND T.DATA_AUTH=J.DATA_AUTH \r\n" + 
        "LEFT JOIN SY_USER A ON T.WSI_EMP=A.LOGIN_NAME  \r\n" + 
        "LEFT JOIN T_CO_AREA B ON B.CA_ID = T.WSI_AREA_ID AND T.DATA_AUTH=B.DATA_AUTH \r\n" + 
        "LEFT JOIN T_CO_AREA C ON C.CA_ID = T.WSI_WORKSTATION_SN AND T.DATA_AUTH=C.DATA_AUTH \r\n" + 
        "LEFT JOIN SY_DICT_VAL D ON D.DICT_CODE='MO_PROCESS_FACE' AND D.CODE=T.WSI_PROCESS_FACE  \r\n" + 
        "LEFT JOIN SY_DICT_VAL E ON E.DICT_CODE='ACTION_TYPE' AND E.CODE=T.WSI_ACTIONTYPE  \r\n" + 
        "LEFT JOIN SY_DICT_VAL F ON F.DICT_CODE='WSI_ITEM_TYPE' AND F.CODE=T.WSI_ITEM_TYPE  \r\n" + 
        "LEFT JOIN T_CO_SUPPLIER G on G.SUPPLIER_CODE=T.WSI_SUPPLIERS AND T.DATA_AUTH=G.DATA_AUTH  \r\n"+
        "LEFT JOIN SY_DEPT H ON T.DATA_AUTH=H.ID  \r\n"
        +sqlWhere +orderSql;
      
       sql1= "SELECT\r\n" + 
         "H.NAME AS DATA_AUTH,\r\n" + 
         "T.WSI_ITEM_SN,\r\n" + 
         "F.VALUE AS ITEM_TYPE,\r\n" + 
         "J.PM_PROJECT_ID AS WT_PROJECT_ID,  \r\n" + 
         "T.WSI_MO_NUMBER,\r\n" + 
         "T.WSI_MODEL_CODE,\r\n" + 
         "D.VALUE,\r\n" + 
         "B.CA_NAME,\r\n" + 
         "C.CA_NAME AS AREA_NAME1,\r\n" + 
         "T.WSI_ITEM_CODE,\r\n" + 
         "T.WSI_LOT_NO,\r\n" + 
         "T.WSI_ITEM_COUNT,\r\n" + 
         "T.WSI_POINT,\r\n" + 
         "T.WSI_POINT_NUM,\r\n" + 
         "G.SUPPLIER_NAME,\r\n" + 
         "T.WSI_DEVICE_SN,\r\n" + 
         "T.WSI_DEVICE_SEQ,\r\n" + 
         "T.WSI_TRUCK_NO,\r\n" + 
         "T.WSI_TABLE_NO,\r\n" + 
         "T.WSI_LOADPOINT_SN,\r\n" + 
         "T.WSI_FEEDER_SN,\r\n" + 
         "T.WSI_CHANEL_NO,\r\n" + 
         "T.WSI_TRAY_FLAG,\r\n" + 
         "T.WSI_REPEAT_FLAG,\r\n" + 
         "A.NAME,\r\n" + 
         "TO_CHAR(T.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME, \r\n" + 
         "E.VALUE AS ACTIONTYPE,  \r\n" + 
         "T.ID AS DATAID  \r\n" + 
         "FROM T_WIP_STATION_ITEM_LOG T\r\n" + 
         "LEFT JOIN T_PM_MO_BASE J ON J.PM_MO_NUMBER=T.WSI_MO_NUMBER AND T.DATA_AUTH=J.DATA_AUTH \r\n" + 
         "LEFT JOIN SY_USER A ON T.WSI_EMP=A.LOGIN_NAME  \r\n" + 
         "LEFT JOIN T_CO_AREA B ON B.CA_ID = T.WSI_AREA_ID AND T.DATA_AUTH=B.DATA_AUTH \r\n" + 
         "LEFT JOIN T_CO_AREA C ON C.CA_ID = T.WSI_WORKSTATION_SN AND T.DATA_AUTH=C.DATA_AUTH \r\n" + 
         "LEFT JOIN SY_DICT_VAL D ON D.DICT_CODE='MO_PROCESS_FACE' AND D.CODE=T.WSI_PROCESS_FACE  \r\n" + 
         "LEFT JOIN SY_DICT_VAL E ON E.DICT_CODE='ACTION_TYPE' AND E.CODE=T.WSI_ACTIONTYPE  \r\n" + 
         "LEFT JOIN SY_DICT_VAL F ON F.DICT_CODE='WSI_ITEM_TYPE' AND F.CODE=T.WSI_ITEM_TYPE  \r\n" + 
         "LEFT JOIN T_CO_SUPPLIER G on G.SUPPLIER_CODE=T.WSI_SUPPLIERS AND T.DATA_AUTH=G.DATA_AUTH  \r\n"+
         "LEFT JOIN SY_DEPT H ON T.DATA_AUTH=H.ID  \r\n"
         +sqlWhere +orderSql;
   
    List poList= new ArrayList();
    if(wsidataType.equals("1")){
         poList = modelService.listSql(sql, modelAction.getPage(), map, null, null);
    }
    if(wsidataType.equals("2")){
         poList = modelService.listSql(sql1, modelAction.getPage(), map, null, null);
    }
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(poList);
    modelAction.getAjaxPage().setDataList(poList);
    return BaseActionSupport.AJAX;
  }

}
