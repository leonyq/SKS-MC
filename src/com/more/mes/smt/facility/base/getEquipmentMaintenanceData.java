package com.more.mes.smt.facility.base;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
 * @Title 设备保养计划获取查询条件及列表数据相关类
 * @Description 设备保养计划获取查询条件及列表数据相关类
 * @ClassName getEquipmentMaintenanceData
 * @author csh
 * @version 1.0 developer 2017-9-18 created
 * @see getEquipmentMaintenanceData
 * @since 2017-9-18
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class getEquipmentMaintenanceData implements FuncService
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
	
  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Map map = new HashMap<String, Object>();
    HttpServletRequest hsr = modelAction.getRequest();
    String dataAuth = hsr.getParameter("DATA_AUTH");
    String falg = hsr.getParameter("falg");
    List<Map> leftLs = null;
    List listParam = new ArrayList();
    List listParam1 = new ArrayList();
    List listParam2 = new ArrayList();
    List listParam3 = new ArrayList();
    if (falg.equals("getSearch"))
    {
      CommMethod commMethod = new CommMethod();
      String userId = CommMethod.getSessionUser().getId();
      // 获取当前登入人下有权限的部门信息
      String depthql = "select de.id as id,de.name as name from sy_data_auth da,sy_dept de where da.dept_id = de.id and da.user_id = ?";
      List<Map> deptMapLs = modelService.listDataSql(depthql, new Object[] {userId});
      CommMethod.listToEscapeJs(deptMapLs);
      modelAction.setAjaxList(deptMapLs);
      // 获取所属区域
      String areahql = "select t.ca_id as id,t.ca_name as name,t.ca_parentareaid as upid from T_CO_AREA t "
        + "where t.data_auth in (select de.id from sy_data_auth da,sy_dept de where da.dept_id = de.id and da.user_id = ?)";
      List<Map> areaMapLs = modelService.listDataSql(areahql,new Object[] {userId});
      map.put("areaLs", areaMapLs);
      // sql   like '%' || :DATA_AUTH || '%'
      // map.put("DATA_AUTH", datauth);
      //modelService.listSql(arg0, arg1, arg2, arg3,null);

    }
    else
    {
      Map<String, String> sqlParaMap = new HashMap<String, String>();

      String cdpiAreaSn = hsr.getParameter("CDPI_AREA_SN");
      String cdpiDeviceSn = hsr.getParameter("CDPI_DEVICE_SN");
      String cdpiItemName = hsr.getParameter("CDPI_ITEM_NAME");
      StringBuilder leftLsSql = null;
      if (falg.equals("getListData"))
      {
        // 获取设备列表信息
        leftLsSql = new StringBuilder(
          "select t.CD_DEVICE_SN as CDPI_DEVICE_SN,t.CD_DEVICE_NAME,t.CDP_PLAN_SN,T1.CA_NAME,T2.CD_MT_DATE,T3.CDP_TYPE,T3.CDP_SPACE from T_CO_DEVICE t LEFT JOIN T_CO_AREA T1 ON T1.CA_ID = T.CD_DEVICE_SN LEFT JOIN T_CO_DEVICE T2 ON T2.CD_DEVICE_SN = T.CD_DEVICE_SN INNER JOIN T_CO_DEVICE_PLAN_INFO T3 ON T3.CDP_PLAN_SN = T.CDP_PLAN_SN WHERE 1=1 ");
        if (StringUtils.isNotBlank(dataAuth))
        {
          leftLsSql.append(" AND t.DATA_AUTH LIKE ");
          leftLsSql.append("'%'");
          leftLsSql.append("|| :DATA_AUTH");
          leftLsSql.append("|| '%'");
          sqlParaMap.put("DATA_AUTH", dataAuth);
        }
        if (StringUtils.isNotBlank(cdpiAreaSn))
        {
          leftLsSql.append(" AND T.CD_DEVICE_SN IN (SELECT a.CDPI_DEVICE_SN FROM T_CO_DEVICE_PLAN_CONNECT a WHERE t3.cdp_plan_sn = a.cdp_plan_sn AND a.cdpi_area_sn = :CDPI_AREA_SN) ");
          
         /* leftLsSql.append(" AND t1.CA_ID LIKE ");
          leftLsSql.append("'%'");
          leftLsSql.append("|| :CDPI_AREA_SN");
          leftLsSql.append("|| '%'");*/
          sqlParaMap.put("CDPI_AREA_SN", cdpiAreaSn);
        }
        if (StringUtils.isNotBlank(cdpiDeviceSn))
        {
          leftLsSql.append(" AND t2.CD_DEVICE_SN LIKE ");
          leftLsSql.append("'%'");
          leftLsSql.append("|| :CDPI_DEVICE_SN");
          leftLsSql.append("|| '%'");
          sqlParaMap.put("CDPI_DEVICE_SN", cdpiDeviceSn);
        }
      }
      else if (falg.equals("getPlanData"))
      {
        if (StringUtils.isBlank(cdpiDeviceSn))
        {
          return modelAction.alertParentInfo((modelAction.getText("请选择一条设备")));
        }
        // 获取保养计划列表信息
        leftLsSql = new StringBuilder(
          "SELECT T.*,T1.CA_NAME,T2.CD_DEVICE_NAME,T2.CD_MT_DATE,T3.CDP_TYPE,T3.CDP_SPACE,T4.CDII_ITEM_NAME AS CDI_ITEM_NAME FROM T_CO_DEVICE_PLAN_CONNECT T LEFT JOIN T_CO_AREA T1 ON T1.CA_ID = T.CDPI_AREA_SN LEFT JOIN T_CO_DEVICE T2  ON T2.CD_DEVICE_SN = T.CDPI_DEVICE_SN LEFT JOIN T_CO_DEVICE_PLAN_INFO T3 ON T3.CDP_PLAN_SN = T.CDP_PLAN_SN LEFT JOIN T_CO_DEVICE_ITEM_INFO T4 ON T4.CDII_ITEM_CODE = T.CDPI_ITEM_CODE AND T4.CDII_DEVICE_SN=T.CDPI_DEVICE_SN WHERE 1=1 ");
        leftLsSql.append(" AND t2.CD_DEVICE_SN LIKE ");
        leftLsSql.append("'%'");
        leftLsSql.append("|| :CDPI_DEVICE_SN");
        leftLsSql.append("|| '%'");
        sqlParaMap.put("CDPI_DEVICE_SN", cdpiDeviceSn);
      }

      leftLs = modelService.listSql(leftLsSql.toString(), modelAction.getPage(), sqlParaMap,
        "order by T.CDP_PLAN_SN desc", null);// "order by T.CD_DEVICE_NAME desc"
      map.put("leftLs", leftLs);

      
      String allDetailSql = "SELECT T.* FROM T_CO_DEVICE_PLAN_DETAIL T  ";
      String mtTimeSql = "SELECT T.* FROM T_CO_DEVICE_MT_INFO T  ";
      String sqlWhere2="";
      String sqlWhere3="";
      if (StringUtils.isNotBlank(dataAuth))
      {
        sqlWhere2="AND t.data_auth=? ";
        sqlWhere3="and t.data_auth=? ";
        listParam2.add(dataAuth);
        listParam3.add(dataAuth);
      }
      // 获取保养计划明细信息
      List<Map> allDetailLs = modelService.listSql(allDetailSql, null, sqlWhere2, listParam2, null,null);

      // 获取设备保养信息   
      List<Map> mtTimeLs = modelService.listSql(mtTimeSql, null, sqlWhere3, listParam3, null,null);
     
      
      Map leftMap = null;
      Map detailMap = null;
      Map mtTimeMap = null;
      Map infoMap = null;
      Map listMap = null;
      List listList = null;
      List mtTimeList = null;
      String mtTime = null;
      if (leftLs != null && !leftLs.isEmpty() && allDetailLs != null && !allDetailLs.isEmpty())
      {
        int leftSize = leftLs.size();
        int allDetailSize = allDetailLs.size();
        for (int i = 0; i < leftSize; i++ )
        {
          infoMap = new HashMap<String, Object>();
          listList = new ArrayList<Object>();
          mtTimeList = new ArrayList<Object>();
          leftMap = leftLs.get(i);

          // 设备已保养的时间
          if (mtTimeLs != null && !mtTimeLs.isEmpty())
          {
            int mtTimeSize = mtTimeLs.size();
            for (int x = 0; x < mtTimeSize; x++ )
            {
              mtTimeMap = mtTimeLs.get(x);
              if (leftMap.get("CDPI_DEVICE_SN").equals(mtTimeMap.get("CDM_DEVICE_SN")))
              {
                mtTime = sdf.format(mtTimeMap.get("CDM_MT_TIME"));
                mtTimeList.add(mtTime);
              }
            }
          }

          // 判断计划类型是周期还是间隔
          if ("1".equals(leftMap.get("CDP_TYPE")))
          {
            for (int j = 0; j < allDetailSize; j++ )
            {
              detailMap = allDetailLs.get(j);
              if (leftMap.get("CDP_PLAN_SN").equals(detailMap.get("CDP_PLAN_SN")))
              {
                // 获取保养周期为周的数据
                if ("1".equals(detailMap.get("CDPD_CYCLE"))) // 周期
                {
                  listMap = new HashMap<String, Object>();
                  listMap.put("WEEK", detailMap.get("CDPD_WEEK"));
                  listList.add(listMap);
                  infoMap.put("WEEK", listList);
                  infoMap.put("MTTIME", mtTimeList);
                }
                // 获取保养周期为月的数据
                if ("2".equals(detailMap.get("CDPD_CYCLE")))
                {
                  listMap = new HashMap<String, Object>();
                  listMap.put("DATE", detailMap.get("CDPD_DATE"));
                  listList.add(listMap);
                  infoMap.put("MONTH", listList);
                  infoMap.put("MTTIME", mtTimeList);
                }
                // 获取保养周期为季度的数据
                if ("3".equals(detailMap.get("CDPD_CYCLE")))
                {
                  listMap = new HashMap<String, Object>();
                  listMap.put("QUARTER", detailMap.get("CDPD_QUARTER"));
                  listMap.put("MONTH", detailMap.get("CDPD_MONTH"));
                  listMap.put("DATE", detailMap.get("CDPD_DATE"));
                  listList.add(listMap);
                  infoMap.put("QUARTER", listList);
                  infoMap.put("MTTIME", mtTimeList);
                }
                // 获取保养周期为半年的数据
                if ("4".equals(detailMap.get("CDPD_CYCLE")))
                {
                  listMap = new HashMap<String, Object>();
                  listMap.put("YEAR", detailMap.get("CDPD_HALF_YEAR"));
                  listMap.put("QUARTER", detailMap.get("CDPD_QUARTER"));
                  listMap.put("MONTH", detailMap.get("CDPD_MONTH"));
                  listMap.put("DATE", detailMap.get("CDPD_DATE"));
                  listList.add(listMap);
                  infoMap.put("HALFYEAR", listList);
                  infoMap.put("MTTIME", mtTimeList);
                }
                // 获取保养周期为全年的数据
                if ("5".equals(detailMap.get("CDPD_CYCLE")))
                {
                  listMap = new HashMap<String, Object>();
                  listMap.put("YEAR", detailMap.get("CDPD_HALF_YEAR"));
                  listMap.put("QUARTER", detailMap.get("CDPD_QUARTER"));
                  listMap.put("MONTH", detailMap.get("CDPD_MONTH"));
                  listMap.put("DATE", detailMap.get("CDPD_DATE"));
                  listList.add(listMap);
                  infoMap.put("YEAR", listList);
                  infoMap.put("MTTIME", mtTimeList);
                }
              }
            }
          }
          else if ("2".equals(leftMap.get("CDP_TYPE"))) // 间隔
          {
            listMap = new HashMap<String, Object>();
            listMap.put("DAY", leftMap.get("CDP_SPACE"));
            if (StringUtils.isNotBlank(leftMap.get("CD_MT_DATE")))
            {
              String str = sdf.format(leftMap.get("CD_MT_DATE"));
              listMap.put("CD_MT_DATE", str);
              infoMap.put("INTERVAL", listMap);
            }
            infoMap.put("MTTIME", mtTimeList);
          }
          if (falg.equals("getListData")){
            if (StringUtils.isNotBlank(leftMap.get("CDPI_DEVICE_SN")))
            {
              map.put(leftMap.get("CDPI_DEVICE_SN"), infoMap);
            }
          }else if (falg.equals("getPlanData")){
            if (StringUtils.isNotBlank(leftMap.get("CDP_PLAN_SN")))
            {
              map.put(leftMap.get("CDP_PLAN_SN"), infoMap);
            }
          }
          //

        }
      }
    }
    CommMethod.mapToEscapeJs(map);
    modelAction.setAjaxMap(map);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(leftLs);
    modelAction.getAjaxPage().setDataList(leftLs);
    return BaseActionSupport.AJAX;
  }
}
