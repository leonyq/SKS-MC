package com.more.mes.smt.handitem;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

public class GetErrorInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest t = modelAction.getRequest();
    Map<String, Object> map = new HashMap<String, Object>();
    modelAction.setAjaxMap(map);
    List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
    String weSn = t.getParameter("weSn");
    String type = t.getParameter("type");
    String resString = "";

    /*String tempSql = "SELECT T.* FROM T_WIP_TRACKING T WHERE T.WT_SN=?";
    tempList = modelService.listDataSql(tempSql, new Object[] {weSn});

    if ((tempList == null) || tempList.isEmpty())
    {
      resString = "FALSE";
    }*/
    
      if (!"FALSE".equals(resString))
      {
        String work_station = t.getParameter("work_station");
         
    
        String sql = "SELECT T.ID, T.WE_ERROR_CODE,  A.CEC_DESC, T.WE_POINT, T.WE_TEST_GROUP,    B.GROUP_NAME,   T.WE_WORK_STATION, T.WE_REPAIR_FLAG,"
                     + "  C.CA_NAME,  (CASE WHEN T.WE_REPAIR_FLAG=0 THEN '待维修' WHEN T.WE_REPAIR_FLAG=1 THEN  '已维修' END ) WE_REPAIR_FLAG_NAME,"
                     + "  TO_CHAR(T.WE_TEST_TIME, 'YYYY-MM-DD HH24:MI:SS') WE_TEST_TIME,D.NAME,T.WE_ERROR_IMG"
                     + "  FROM T_WIP_ERROR T   LEFT JOIN T_CO_ERROR_CODE A    ON A.CEC_CODE = T.WE_ERROR_CODE"
                     + "  LEFT JOIN T_CO_GROUP B ON B.GROUP_CODE=T.WE_TEST_GROUP  LEFT JOIN T_CO_AREA C ON C.CA_ID=T.WE_WORK_STATION"
                     + " LEFT JOIN SY_USER D ON D.LOGIN_NAME=T.WE_TEST_EMP  WHERE T.WE_SN =? ORDER BY T.WE_REPAIR_FLAG ASC,WE_TEST_TIME DESC ";
    
        List sList = modelService.listDataSql(sql, new Object[] {weSn});
    
        String sql2 =   "SELECT T.WT_SN,\n" +
                        "       T.WT_MO_NUMBER,\n" + 
                        "       T.WT_MODEL_CODE,\n" + 
                        "       T1.CI_ITEM_NAME,\n" + 
                        "       T1.CI_ITEM_SPEC,\n" + 
                        "       'up_load/comm/' || CB_BOTTOM_ADDRESS || '/' || CB_BOTTOM_FILE_NAME GDO_BOTTOM,\n" + 
                        "       'up_load/comm/' || CB_TOP_ADDRESS || '/' || CB_TOP_FILE_NAME GDO_TOP,\n" + 
                        "       'up_load/comm/' || CB_DRAW_ADDRESS || '/' || CB_DRAW_FILE_NAME VB_AIS,\n" + 
                        "       B.ID BOM_ID\n" + 
                        "  FROM T_WIP_TRACKING T\n" + 
                        "  LEFT JOIN T_CO_ITEM T1\n" + 
                        "    ON T1.CI_ITEM_CODE = T.WT_MODEL_CODE\n" + 
                        "  LEFT JOIN T_PM_PROJECT_BASE A\n" + 
                        "    ON A.PROJECT_ID = T.WT_PROJECT_ID\n" + 
                        "  LEFT JOIN T_CO_BOM B\n" + 
                        "    ON A.PRODUCT_MATERIAL = B.CB_ITEM_CODE\n" + 
                        "   AND A.PRODUCT_VER = B.CB_VER\n" + 
                        "   AND B.CB_STATUS = 'Y'\n" + 
                        " WHERE T.WT_SN = ?";
    
        map = modelService.queryForMap(sql2, new Object[] {weSn});
        if (map!=null&&!map.isEmpty())
        {
          Map<String, Object> tempMap1 = new HashMap<String, Object>();
          String moNum = StringUtils.toString(map.get("WT_MO_NUMBER"));
          String sql3 = "SELECT T.PM_REPAIR_MAX  FROM T_PM_MO_BASE T WHERE T.PM_MO_NUMBER=?";
    
          tempMap1 = modelService.queryForMap(sql3, new Object[] {moNum});
    
          Map<String, Object> tempMap2 = new HashMap<String, Object>();
          String sql4 = "SELECT COUNT(*) L_COUNT FROM T_WIP_REPAIR T WHERE T.WR_SN=? AND T.WR_FINISH_FLAG='Y'";
    
          tempMap2 = modelService.queryForMap(sql4, new Object[] {weSn});
    
          int repairMax = Integer.parseInt(StringUtils.toString(tempMap1.get("PM_REPAIR_MAX")));
          if (repairMax != 0)
          {
            int lCount = Integer.parseInt(StringUtils.toString(tempMap2.get("L_COUNT")));
            if (repairMax <= lCount)
            {
              resString = "REPAIRMAXERROR";
            }
          }
          
          
        }
        if(map!=null&&!map.isEmpty()){
           sql="SELECT " + 
                "\n" +
                "TCC_BOM_ID bom_id,\n" + 
                "TCC_POINT code,\n" + 
                "TCC_PACK pack,\n" + 
                "TCC_ROTATION rotation,\n" + 
                "TCC_XAXIS x,\n" + 
                "TCC_YAXIS y,\n" + 
                "TCC_FACE face FROM T_XA_COORDINATE_CONTENT WHERE TCC_BOM_ID=?";

           List<Map> mItemList= modelService.listDataSql(sql,new Object[]{/*"d5787c7c72444b978582b0efef3c79d3"*/map.get("BOM_ID")});
         
		   modelAction.getAjaxMap().put("coor_content",mItemList); 
        }
        modelAction.setAjaxList(sList);
      }
      modelAction.getAjaxMap().put("product_map",map);
      modelAction.setAjaxString(resString);
      return BaseActionSupport.AJAX;

  }
}
