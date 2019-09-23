package com.more.mes.smt.stationitem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 物料作业记录
 * @author development
 *
 */
public class GetStationItem implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String type = request.getParameter("type");
    String timeBegin = request.getParameter("timeBegin");
    String timeEnd = request.getParameter("timeEnd");
    String dataAuth = request.getParameter("dataAuth");
    String userId = modelAction.getSessionUser().getId();
    String areaId = request.getParameter("areaId");
    String moNumber = request.getParameter("moNumber");
    String itemCode = request.getParameter("itemCode");
    String feederSn = request.getParameter("feederSn");
    
    
    
    String sqlWhere="where 1=1";
    Map<String, String> map = new HashMap<String, String>();
    if (StringUtils.isNotBlank(timeBegin))
    {
      sqlWhere += " and T.WSI_LOADTIME >=to_timestamp(:timeBegin,'yyyy-mm-dd HH24:MI:ss')";
      map.put("timeBegin", timeBegin);
    }
    if (StringUtils.isNotBlank(timeEnd))
    {
      sqlWhere += " and T.WSI_LOADTIME <=to_timestamp(:timeEnd,'yyyy-mm-dd HH24:MI:ss')";
      map.put("timeEnd", timeEnd);
    }
    /*
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlWhere += " and T.DATA_AUTH ='" + dataAuth + "'";
    }*/
    if (StringUtils.isNotBlank(areaId))
    {
      sqlWhere += " and T.WSI_AREA_ID =:areaId";
      map.put("areaId", areaId);
    }
    
    if (StringUtils.isNotBlank(feederSn))
    {
      sqlWhere += " and T.WSI_FEEDER_SN like '%' || :feederSn || '%' ";
      map.put("feederSn", feederSn);
    }
    
    if (StringUtils.isNotBlank(moNumber))
    {
      sqlWhere += " and T.WSI_MO_NUMBER like '%' || :moNumber || '%'";
      map.put("moNumber", moNumber);
    }
    if (StringUtils.isNotBlank(itemCode))
    {
      sqlWhere += " and T.WSI_ITEM_CODE like '%' || :itemCode || '%'";
      map.put("itemCode", itemCode);
    }
    
    String sqlWhere1="where 1=1";
    if (StringUtils.isNotBlank(timeBegin))
    {
      sqlWhere1 += " and T1.WSI_LOADTIME >=to_timestamp(:timeBegin1,'yyyy-mm-dd HH24:MI:ss')"; 
      map.put("timeBegin1", timeBegin);
    }
    if (StringUtils.isNotBlank(timeEnd))
    {
      sqlWhere1 += " and T1.WSI_LOADTIME <=to_timestamp(:timeEnd1,'yyyy-mm-dd HH24:MI:ss')";   
      map.put("timeEnd1", timeEnd);
    }
    /*
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlWhere1 += " and T1.DATA_AUTH ='" + dataAuth + "'";
    }
    */
    if (StringUtils.isNotBlank(areaId))
    {
      sqlWhere1 += " and T1.WSI_AREA_ID =:areaId1";
      map.put("areaId1", areaId);
    }
    if (StringUtils.isNotBlank(moNumber))
    {
      sqlWhere1 += " and T1.WSI_MO_NUMBER like '%' || :moNumber1 || '%'";
      map.put("moNumber1", moNumber);
    }
    if (StringUtils.isNotBlank(itemCode))
    {
      sqlWhere1 += " and T1.WSI_ITEM_CODE like '%' || :itemCode1 || '%'";
      map.put("itemCode1", itemCode);
    }
    
    String orderSql = " order by WSI_LOADTIME";
    
    
    String sql = null;
    if (type.equals("1"))
    {
      String actionType = request.getParameter("actionType");
      
      String itemType = request.getParameter("itemType");
      String wsiItemSn = request.getParameter("wsiItemSn");
      String wsiOnlineFlag = request.getParameter("wsiOnlineFlag");
      
      if (StringUtils.isNotBlank(wsiItemSn))
      {
        sqlWhere += " and T.WSI_ITEM_SN like '%' || :wsiItemSn || '%'";
        map.put("wsiItemSn", wsiItemSn);
      }
      if (StringUtils.isNotBlank(wsiOnlineFlag))
      {
        sqlWhere += " and T.WSI_ONLINE_FLAG like '%' || :wsiOnlineFlag || '%'";
        map.put("wsiOnlineFlag", wsiOnlineFlag);
      }
      if (StringUtils.isNotBlank(itemType))
      {
        sqlWhere += " and T.WSI_ITEM_TYPE =:itemType";
        map.put("itemType", itemType);
      }
      
      if (StringUtils.isNotBlank(itemType))
      {
        sqlWhere1 += " and T1.WSI_ITEM_TYPE =:itemType1";
        map.put("itemType1", itemType);
      }
      if (StringUtils.isNotBlank(actionType))
      {
        sqlWhere1 += " and T1.WSI_ACTIONTYPE =:actionType";
        map.put("actionType", actionType);
      }
      
      if (StringUtils.isNotBlank(actionType))
      {
        sqlWhere += " and T.WSI_ACTIONTYPE =:actionType1";
        map.put("actionType1", actionType);
      }
      if (StringUtils.isNotBlank(wsiItemSn))
      {
        sqlWhere1 += " and T1.WSI_ITEM_SN like '%' || :wsiItemSn1 || '%'";
        map.put("wsiItemSn1", wsiItemSn);
      }
      if (StringUtils.isNotBlank(wsiOnlineFlag))
      {
        sqlWhere1 += " and T1.WSI_ONLINE_FLAG like '%' || :wsiOnlineFlag1 || '%'";
        map.put("wsiOnlineFlag1", wsiOnlineFlag);
      }
      if(StringUtils.isNotBlank(dataAuth)) {
      	sqlWhere += " and t.DATA_AUTH =  :DATA_AUTH  ";//and B.DATA_AUTH =  :DATA_AUTH2 and C.DATA_AUTH =  :DATA_AUTH3 and G.DATA_AUTH =  :DATA_AUTH4 
      	map.put("DATA_AUTH", dataAuth);
      	//map.put("DATA_AUTH2", dataAuth);
      //	map.put("DATA_AUTH3", dataAuth);
      //	map.put("DATA_AUTH4", dataAuth);
      }else {
      	sqlWhere += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
      //	sqlWhere += " and B.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID2 ) ";
      //	sqlWhere += " and C.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID3 ) ";
      //	sqlWhere += " and G.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID4 ) ";
      	map.put("USER_ID", userId); 
      //	map.put("USER_ID2", userId);
      	//map.put("USER_ID3", userId);
      	//map.put("USER_ID4", userId);
      }
      if(StringUtils.isNotBlank(dataAuth)) {
        	sqlWhere1 += " and T1.DATA_AUTH =  :DATA_AUTH5 ";//and TB.DATA_AUTH =  :DATA_AUTH6 and TC.DATA_AUTH =  :DATA_AUTH7 and TG.DATA_AUTH =  :DATA_AUTH8  
        	map.put("DATA_AUTH5", dataAuth);
        	//map.put("DATA_AUTH6", dataAuth);
        //	map.put("DATA_AUTH7", dataAuth);
        //	map.put("DATA_AUTH8", dataAuth);
        }else {
        	sqlWhere1 += " and t1.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID5 ) ";
        //	sqlWhere1 += " and TB.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID6 ) ";
        //	sqlWhere1 += " and TC.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID7 ) ";
        //	sqlWhere1 += " and TG.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID8 ) ";
        	map.put("USER_ID5", userId); 
        //	map.put("USER_ID6", userId);
        //	map.put("USER_ID7", userId);
        //	map.put("USER_ID8", userId);
        }      
      
      sql="select sd.name as data_auth2,A.NAME,B.CA_NAME,C.ca_name AS AREA_NAME1,D.VALUE,E.VALUE AS ACTIONTYPE, "+
      "T.ID,T.wsi_mo_number,T.WSI_MODEL_CODE,T.WSI_ITEM_SN,T.WSI_ITEM_CODE,T.WSI_LOT_NO,T.WSI_ITEM_COUNT,T.WSI_INIT_COUNT,T.WSI_POINT, "+
        "T.WSI_POINT_NUM,T.WSI_ITEM_SN_OLD,T.WSI_ITEM_CODE_OLD,T.WSI_LOT_NO_OLD,T.WSI_COUNT_OLD,T.WSI_DEVICE_SN,T.WSI_DEVICE_SEQ,T.WSI_TRUCK_NO, "+
        "T.WSI_TABLE_NO,T.WSI_LOADPOINT_SN,T.WSI_FEEDER_SN,T.WSI_CHANEL_NO, T.WSI_LOADTIME,T.WSI_ONLINE_FLAG,T.WSI_TRAY_FLAG,T.WSI_REPEAT_FLAG,"+
        "F.VALUE AS ITEM_TYPE,to_char(T.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME, G.SUPPLIER_NAME "+
        " from T_WIP_STATION_ITEM T"+
        " left join sy_user A on T.WSI_EMP=A.LOGIN_NAME "+
        " LEFT JOIN t_co_area B ON B.ca_id = T.WSI_AREA_ID and B.data_auth = t.data_auth "+
        "LEFT JOIN t_co_area C ON C.ca_id = T.WSI_WORKSTATION_SN  and c.data_auth = t.data_auth "+
        " left join sy_dict_val D ON D.DICT_CODE='MO_PROCESS_FACE' AND D.CODE=T.WSI_PROCESS_FACE "+
        " left join sy_dict_val E ON E.DICT_CODE='ACTION_TYPE' AND E.CODE=T.WSI_ACTIONTYPE "+
        " left join sy_dict_val F ON F.DICT_CODE='WSI_ITEM_TYPE' AND F.CODE=T.WSI_ITEM_TYPE "+
        "  left join t_co_supplier G on G.SUPPLIER_CODE=T.WSI_SUPPLIERS  "
        + " left join sy_dept sd on sd.id = t.data_auth "
        +sqlWhere+
        " union  all "+
        "select ssd.name as  data_auth2,TA.NAME,TB.CA_NAME,TC.ca_name AS AREA_NAME1,TD.VALUE,TE.VALUE AS ACTIONTYPE, "+
        "T1.ID,T1.wsi_mo_number,T1.WSI_MODEL_CODE,T1.WSI_ITEM_SN,T1.WSI_ITEM_CODE,T1.WSI_LOT_NO,T1.WSI_ITEM_COUNT,T1.WSI_INIT_COUNT,T1.WSI_POINT, "+
        "T1.WSI_POINT_NUM,T1.WSI_ITEM_SN_OLD,T1.WSI_ITEM_CODE_OLD,T1.WSI_LOT_NO_OLD,T1.WSI_COUNT_OLD,T1.WSI_DEVICE_SN,T1.WSI_DEVICE_SEQ,T1.WSI_TRUCK_NO, "+
        "T1.WSI_TABLE_NO,T1.WSI_LOADPOINT_SN,T1.WSI_FEEDER_SN,T1.WSI_CHANEL_NO, T1.WSI_LOADTIME,T1.WSI_ONLINE_FLAG,T1.WSI_TRAY_FLAG,T1.WSI_REPEAT_FLAG,"+
        "TF.VALUE AS ITEM_TYPE,to_char(T1.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME,TG.SUPPLIER_NAME "+
        "from T_WIP_STATION_ITEM_LOG T1 "+
        " left join sy_user TA on T1.WSI_EMP=TA.LOGIN_NAME "+
        " LEFT JOIN t_co_area TB ON TB.ca_id = T1.WSI_AREA_ID  and tb.data_auth = t1.data_auth "+
        "LEFT JOIN t_co_area TC ON TC.ca_id = T1.WSI_WORKSTATION_SN   and tc.data_auth = t1.data_auth "+
        " left join sy_dict_val TD ON TD.DICT_CODE='MO_PROCESS_FACE' AND TD.CODE=T1.WSI_PROCESS_FACE "+
        " left join sy_dict_val TE ON TE.DICT_CODE='ACTION_TYPE' AND TE.CODE=T1.WSI_ACTIONTYPE "+
        " left join sy_dict_val TF ON TF.DICT_CODE='WSI_ITEM_TYPE' AND TF.CODE=T1.WSI_ITEM_TYPE "+
        "  left join t_co_supplier TG on TG.SUPPLIER_CODE=T1.WSI_SUPPLIERS "
        + "  left join sy_dept ssd on ssd.id = t1.data_auth "
        +sqlWhere1;
    }else if (type.equals("2")) {//离线记录
        if(StringUtils.isNotBlank(dataAuth)) {
          	sqlWhere += " and t.DATA_AUTH =  :DATA_AUTH  ";
          	map.put("DATA_AUTH", dataAuth);
          //	map.put("DATA_AUTH2", dataAuth);
          //	map.put("DATA_AUTH3", dataAuth);
          //	map.put("DATA_AUTH4", dataAuth);
          }else {
          	sqlWhere += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
          	//sqlWhere += " and B.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID2 ) ";
          //	sqlWhere += " and C.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID3 ) ";
          //	sqlWhere += " and G.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID4 ) ";
          	map.put("USER_ID", userId); 
          //	map.put("USER_ID2", userId);
          //	map.put("USER_ID3", userId);
         // 	map.put("USER_ID4", userId);
          }
          if(StringUtils.isNotBlank(dataAuth)) {
            	sqlWhere1 += " and T1.DATA_AUTH =  :DATA_AUTH5 ";
            	map.put("DATA_AUTH5", dataAuth);
            	//map.put("DATA_AUTH6", dataAuth);
            	//map.put("DATA_AUTH7", dataAuth);
                //map.put("DATA_AUTH8", dataAuth);
            }else {
            	sqlWhere1 += " and t1.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID5 ) ";
            	//sqlWhere1 += " and TB.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID6 ) ";
            //	sqlWhere1 += " and TC.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID7 ) ";
            //	sqlWhere1 += " and TG.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID8 ) ";
            	map.put("USER_ID5", userId); 
            //	map.put("USER_ID6", userId);
            //	map.put("USER_ID7", userId);
            //	map.put("USER_ID8", userId);
            }      
      sql= "select sd.name as data_auth2,T.*,A.NAME,B.CA_NAME,C.ca_name AS AREA_NAME1,D.VALUE,E.VALUE AS ACTIONTYPE, "+
        "to_char(T.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME, G.SUPPLIER_NAME "+
        " from T_WIP_PREPARE_ITEM_OFFLINE T"+
        " left join sy_user A on T.WSI_EMP=A.LOGIN_NAME "+
        " LEFT JOIN t_co_area B ON B.ca_id = T.WSI_AREA_ID and B.DATA_AUTH = T.DATA_AUTH "+
        "LEFT JOIN t_co_area C ON C.ca_id = T.WSI_WORKSTATION_SN  and C.DATA_AUTH = T.DATA_AUTH  "+
        " left join sy_dict_val D ON D.DICT_CODE='MO_PROCESS_FACE' AND D.CODE=T.WSI_PROCESS_FACE "+
        " left join sy_dict_val E ON E.DICT_CODE='ACTION_TYPE' AND E.CODE=T.WSI_ACTIONTYPE "+
        "  left join t_co_supplier G on G.SUPPLIER_CODE=T.WSI_SUPPLIERS "
        + " left join sy_dept sd on sd.id = t.data_auth "
        +sqlWhere+
        " union all "+
         "select ssd.name as data_auth2,T1.*,TA.NAME,TB.CA_NAME,TC.ca_name AS AREA_NAME1,TD.VALUE,TE.VALUE AS ACTIONTYPE, "+
        "to_char(T1.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME,TG.SUPPLIER_NAME "+
        "from T_WIP_PREPARE_ITEM_LOG T1 "+
        " left join sy_user TA on T1.WSI_EMP=TA.LOGIN_NAME "+
        " LEFT JOIN t_co_area TB ON TB.ca_id = T1.WSI_AREA_ID  and TB.DATA_AUTH = T1.DATA_AUTH  "+
        " LEFT JOIN t_co_area TC ON TC.ca_id = T1.WSI_WORKSTATION_SN  and TC.DATA_AUTH = T1.DATA_AUTH  "+
        " left join sy_dict_val TD ON TD.DICT_CODE='MO_PROCESS_FACE' AND TD.CODE=T1.WSI_PROCESS_FACE "+
        " left join sy_dict_val TE ON TE.DICT_CODE='ACTION_TYPE' AND TE.CODE=T1.WSI_ACTIONTYPE "+
        "  left join t_co_supplier TG on TG.SUPPLIER_CODE=T1.WSI_SUPPLIERS "
        + " left join sy_dept ssd on ssd.id = t1.data_auth "
        +sqlWhere1;
    }
    
    
    String sql1 = "select * from ("+sql+")aa "+orderSql;
    
    List poList = modService.listSql(sql1, modelAction.getPage(), map, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(poList);
    modelAction.getAjaxPage().setDataList(poList);
    return BaseActionSupport.AJAX;
  }

}
