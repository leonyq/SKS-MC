package com.more.mes.smt.wmssparekmanager;

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
 * 根据选择的入库单的物料料号获取入库详细信息
 * 
 * @author development
 */
public class AjaxPageSpareTotalInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime");
    String dataAuth = request.getParameter("dataAuth");
    String itemSn = request.getParameter("itemSn");// 物料SN
    String itemCode = request.getParameter("itemCode");// 物料料号
    String itemName = request.getParameter("itemName");// 物料名称
    String userId=modelAction.getUser().getId();
    String sql = "SELECT T.*,T1.CI_ITEM_NAME,T1.CI_ITEM_SPEC,A.NAME AS DATA_AUTH_NAME FROM T_WMS_SPARE_TOTAL T "
      + "LEFT JOIN T_CO_ITEM T1 ON T.WST_ITEM_CODE = T1.CI_ITEM_CODE AND T.DATA_AUTH=T1.DATA_AUTH "
      + "LEFT JOIN SY_DEPT A ON T.DATA_AUTH=A.ID ";
    String sqlWhere = " WHERE 1=1 ";
    Map<String,Object> paramMap = new HashMap<String,Object>();
    
      if (StringUtils.isNotBlank(dataAuth) && !"undefined".equals(dataAuth))
        {
          sql = "SELECT T.*,T1.CI_ITEM_NAME,T1.CI_ITEM_SPEC,A.NAME AS DATA_AUTH_NAME  FROM T_WMS_SPARE_TOTAL T "
      + "LEFT JOIN T_CO_ITEM T1 ON T.WST_ITEM_CODE = T1.CI_ITEM_CODE AND T1.DATA_AUTH=:DATA_AUTH "
      + "LEFT JOIN SY_DEPT A ON T.DATA_AUTH=A.ID  ";
      sqlWhere += " AND T.DATA_AUTH = :DATA_AUTH ";
          paramMap.put("DATA_AUTH", dataAuth);
        }else
        {
           sql = "SELECT T.*,T1.CI_ITEM_NAME,T1.CI_ITEM_SPEC,A.NAME AS DATA_AUTH_NAME  FROM T_WMS_SPARE_TOTAL T "
      + "LEFT JOIN T_CO_ITEM T1 ON T.WST_ITEM_CODE = T1.CI_ITEM_CODE AND t.DATA_AUTH =T1.DATA_AUTH  "
      + "LEFT JOIN SY_DEPT A ON T.DATA_AUTH=A.ID  ";
      sqlWhere += " AND T.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId ) ";
          paramMap.put("userId", userId);
        }
    if (StringUtils.isNotBlank(startTime) && !"undefined".equals(startTime)
            && StringUtils.isNotBlank(endTime) && !"undefined".equals(endTime))
        {
          sqlWhere += " AND T.CREATE_TIME BETWEEN TO_DATE('" + startTime
                      + "', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('" + endTime
                      + "', 'YYYY-MM-DD HH24:MI:SS')";
        }
        else
        {
          if (StringUtils.isNotBlank(startTime) && !"undefined".equals(startTime))
          {
            sqlWhere += " AND TO_DATE(:SDATE, 'YYYY-MM-DD HH24:MI:SS') <= T.CREATE_TIME";
            paramMap.put("SDATE", startTime);
          }
          else if (StringUtils.isNotBlank(endTime) && !"undefined".equals(endTime))
          {
            sqlWhere += " AND TO_DATE(:EDATE, 'YYYY-MM-DD HH24:MI:SS') > T.CREATE_TIME";
            paramMap.put("EDATE", endTime);
          }
        }

        if (StringUtils.isNotBlank(itemCode) && !"undefined".equals(itemCode))
        {
          sqlWhere += " AND T.WST_ITEM_CODE = :WST_ITEM_CODE ";
          paramMap.put("WST_ITEM_CODE", itemCode);
        }
//        if (StringUtils.isNotBlank(itemSn) && !"undefined".equals(itemSn))
//        {
//          sqlWhere += " AND T.WSI_ITEM_SN LIKE '%" + itemSn + "%'";
//        }
        if (StringUtils.isNotBlank(itemName) && !"undefined".equals(itemName))
        {
          sqlWhere += " AND T1.CI_ITEM_NAME LIKE '%' || :CI_ITEM_NAME || '%' ";
          paramMap.put("CI_ITEM_NAME", itemName);
        }
      
        List poList = modelService.listSql(sql+sqlWhere, modelAction.getPage(),paramMap , null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(poList);
    modelAction.getAjaxPage().setDataList(poList);
    return BaseActionSupport.AJAX;
  }

}
