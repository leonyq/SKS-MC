package com.more.mes.smt.wmsreceivemanager;

import java.sql.Types;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashSet;
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
 * 采购入库但信息
 * 
 * @author wzy
 */
public class GetReceiveInfo implements FuncService
{

  @SuppressWarnings("unused")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    String itemId = request.getParameter("itemId");//物料id
    String dataAuth = request.getParameter("dataAuth");
    //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String docNum = request.getParameter("docNum");
    String supCode = request.getParameter("supCode");
    String connectDoc = request.getParameter("connectDoc");
    String itemStatus = request.getParameter("itemStatus");
    String itemCode = request.getParameter("itemCode");
    String beginTime = request.getParameter("beginTime");
    String endTime = request.getParameter("endTime");
    String userId=modelAction.getUser().getId();
    LinkedHashSet<String> gCodeMap = new LinkedHashSet<String>();
    Map<String, String> map = new HashMap<String, String>();
    //String sqlWhere = " where 1=1 ";
    String sql = "select t.id AS ID, t7.NAME as DATA_AUTH,t.WRD_DOC_NUM , t.DATA_AUTH as DATA_AUTH2,  t.WRD_DOC_TYPE,t.WRD_ERP_FLAG,t.WRD_ERP_SYN_TIMES,t.WRD_MEMO, "  // 
                 + " t.WRD_STATUS,t.WRD_URGENT_FLAG,t.WRD_CLOSE_REASON,t.WRD_DISPATCH_SN, "
                 + " TO_CHAR(t.WPD_DELIVERY_DATE,'yyyy-mm-dd') DELIVERY_DATE, "
                 + " TO_CHAR(t.WRD_RECEIVE_TIME,'yyyy-mm-dd hh24:mi:ss') RECEIVE_TIME, "
                 + " TO_CHAR(t.WRD_CREATE_TIME,'yyyy-mm-dd hh24:mi:ss') CREATE_TIME, "
                 + " TO_CHAR(t.WRD_CLOSE_TIME,'yyyy-mm-dd hh24:mi:ss') CLOSE_TIME,t6.WDT_TYPE_NAME, "
                 + " t1.CUSTOMER,t2.SUPPLIER_NAME,t4.name as CREATE_MAN,t5.name as CLOSE_MAN "
                 + " from T_WMS_RECEIVE_DOC t";
                String sqlWhere = "  ";
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlWhere += " and t.DATA_AUTH = :dataAuth   ";  
      sql +=    " left join t_co_customer t1 on t.WRD_CUST_CODE=t1.CUST_CODE"
                 +" and t1.DATA_AUTH = :dataAuth1 " 
                 + " left join T_CO_SUPPLIER t2 on t2.SUPPLIER_CODE = t.WRD_SUP_CODE"
                 + " and t2.DATA_AUTH = :dataAuth2 " 
                 + " left join sy_user t4 on t4.id=t.WRD_CREATE_MAN"
                 + " left join sy_user t5 on t5.id = t.WRD_CLOSE_MAN"
                 + " left join T_WMS_DOC_TYPE  t6 on t6.WDT_TYPE_SN = t.WRD_DOC_TYPE"
                 +" and t6.DATA_AUTH = :dataAuth5 " 
                 + " left join SY_DEPT  t7 on t7.ID = t.DATA_AUTH"
                
                 + " where t.WRD_DOC_NUM in (select  t3.WRI_DOC_NUM from T_WMS_RECEIVE_ITEM t3 "
                 + " where t3.WRI_DOC_NUM=t.WRD_DOC_NUM   ";
      map.put("dataAuth", dataAuth);
      map.put("dataAuth1", dataAuth);
      map.put("dataAuth2", dataAuth);
      map.put("dataAuth5", dataAuth);
     
          

    }
    else 
    {
         sqlWhere += " and t.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 ) ";	
         sql +=   " left join t_co_customer t1 on t.WRD_CUST_CODE=t1.CUST_CODE and t1.DATA_AUTH = t.DATA_AUTH"
                 + " left join T_CO_SUPPLIER t2 on t2.SUPPLIER_CODE = t.WRD_SUP_CODE and t2.DATA_AUTH = t.DATA_AUTH "
                 + " left join sy_user t4 on t4.id=t.WRD_CREATE_MAN"
                 + " left join sy_user t5 on t5.id = t.WRD_CLOSE_MAN"
                 + " left join T_WMS_DOC_TYPE  t6 on t6.WDT_TYPE_SN = t.WRD_DOC_TYPE and t6.DATA_AUTH = t.DATA_AUTH"
                 + " left join SY_DEPT  t7 on t7.ID = t.DATA_AUTH"
                 + " where t.WRD_DOC_NUM in (select t3.WRI_DOC_NUM from T_WMS_RECEIVE_ITEM t3 "
                 + " where t3.WRI_DOC_NUM=t.WRD_DOC_NUM  ";
                   
       
       map.put("userId1", userId);
      
      

  
    }    
    int nums = 0;
   
    if (StringUtils.isNotBlank(itemCode))
    {

      sqlWhere += " and t3.WRI_ITEM_CODE like '%'||:itemCode||'%'";
     map.put("itemCode", itemCode);
    }
    if (StringUtils.isNotBlank(connectDoc))
    {
      sqlWhere += " and t3.WRI_CONNECT_DOC like  '%'||:connectDoc||'%'";
      map.put("connectDoc", connectDoc);
    }
    
     if(StringUtils.isNotBlank(itemId)){
      sqlWhere += " and t.WRD_ITEM_ID = :itemId1";
      map.put("itemId1", itemId);
    }
    if (StringUtils.isNotBlank(itemStatus))
    {
      sqlWhere += " and t3.WRI_STATUS =:itemStatus";
      map.put("itemStatus", itemStatus);
    }
    sqlWhere += " ) and t.WRD_DOC_TYPE=:WRD_DOC_TYPE1";
    map.put("WRD_DOC_TYPE1", "DJ02");

    if (StringUtils.isNotBlank(docNum))
    {
      sqlWhere += " and t.WRD_DOC_NUM like '%'||:docNum||'%' ";
      map.put("docNum", docNum);
    }
    if (StringUtils.isNotBlank(supCode))
    {
      sqlWhere += " and t2.SUPPLIER_NAME like '%'||:supCode||'%' ";
      map.put("supCode", supCode);
    }
    if (StringUtils.isNotBlank(beginTime))
    {
      sqlWhere += " and T.WPD_DELIVERY_DATE >=to_date(:beginTime,'yyyy-mm-dd hh24:mi:ss')";
      map.put("beginTime", beginTime);
    }
    if (StringUtils.isNotBlank(endTime))
    {
      sqlWhere += " and T.WPD_DELIVERY_DATE <=to_date(:endTime,'yyyy-mm-dd hh24:mi:ss')";
      map.put("endTime", endTime);
    }

    String order = " order by t.WRD_CREATE_TIME desc,t.WRD_DOC_NUM desc";
    String sql1 = "select * from(" + sql + sqlWhere + order + ") ret";

    List poList = modelService.listSql(sql1, modelAction.getPage(),map, null, null);

    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(poList);
    modelAction.getAjaxPage().setDataList(poList);
    return BaseActionSupport.AJAX;
  }

}
