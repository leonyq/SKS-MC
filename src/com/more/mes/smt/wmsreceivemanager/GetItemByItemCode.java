package com.more.mes.smt.wmsreceivemanager;

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
 * @author development
 *
 */
public class GetItemByItemCode implements FuncService{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    String itemId = request.getParameter("itemId");//物料id
    String itemCode = request.getParameter("itemCode");
    String dataAuth = request.getParameter("dataAuth");
    //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String docNum = request.getParameter("docNum");//入库单号
    String supCode = request.getParameter("supCode");//供应商
    String connectDoc = request.getParameter("connectDoc");//关联单号
    String itemStatus = request.getParameter("itemStatus");//物料状态
    String docType = request.getParameter("docType");//单据类型
    String userId=modelAction.getUser().getId();
    Map<String, String> sqlParaMap = new HashMap<String, String>();
	String sqlWhere = " where 1=1 ";
    // String beginTime = request.getParameter("beginTime");
    // String endTime = request.getParameter("endTime");
    String sql = "SELECT T3.NAME AS DATAAUTH,t.DATA_AUTH AS DATA_AUTH2, t.*,"+
        "d.WA_AREA_NAME wh_name,t1.SUPPLIER_NAME," +
        
        "b.ci_item_name,b.ci_item_spec,t2.NAME RECEIVE_EMP," +
        "TO_CHAR(t.WRD_RECEIVE_TIME,'yyyy-mm-dd hh24:mi:ss') RECEIVE_TIME "+
        "FROM T_WMS_RECEIVE_DETAIL t " ;
        /*
        "LEFT JOIN t_co_item b ON b.ci_item_code=t.wrd_item_code " +
        "LEFT JOIN T_WMS_RECEIVE_DOC c ON c.WRD_DOC_NUM=t.WRD_DOC_NUM " +
        "LEFT JOIN T_WMS_AREA d ON d.WA_AREA_SN=t.WRD_WH_CODE " +
        "LEFT JOIN T_WMS_RECEIVE_ITEM f ON T.WRD_ITEM_ID = F.ID " +
        "LEFT JOIN T_CO_SUPPLIER t1 ON t1.SUPPLIER_CODE=t.WRD_SUP_TRACE " +
        "LEFT JOIN SY_USER t2 ON t2.LOGIN_NAME=t.WRD_RECEIVE_EMP " +
        "LEFT JOIN SY_DEPT t3 ON t3.ID=T.DATA_AUTH ";
        */
    if(StringUtils.isNotBlank(dataAuth)){
        sqlWhere += " and t.DATA_AUTH = :dataAuth  ";
      sql +=  "LEFT JOIN t_co_item b ON b.ci_item_code=t.wrd_item_code " +
                   " and b.DATA_AUTH = t.DATA_AUTH " +
                   "LEFT JOIN T_WMS_RECEIVE_DOC c ON c.WRD_DOC_NUM=t.WRD_DOC_NUM " +
                   " and c.DATA_AUTH = t.DATA_AUTH " +
                   "LEFT JOIN T_WMS_AREA d ON d.WA_AREA_SN=t.WRD_WH_CODE " +
                   " and d.DATA_AUTH = t.DATA_AUTH " +
                   "LEFT JOIN T_WMS_RECEIVE_ITEM f ON T.WRD_ITEM_ID = F.ID " +
                   " and f.DATA_AUTH = t.DATA_AUTH " +
                   "LEFT JOIN T_CO_SUPPLIER t1 ON t1.SUPPLIER_CODE=t.WRD_SUP_TRACE " +
                   " and t1.DATA_AUTH =t.DATA_AUTH " +
                   "LEFT JOIN SY_USER t2 ON (t2.LOGIN_NAME=T.WRD_RECEIVE_EMP or  t2.id=T.WRD_RECEIVE_EMP)"+
                  
                   "LEFT JOIN SY_DEPT t3 ON t3.ID=T.DATA_AUTH ";
                   //" and t.DATA_AUTH = :dataAuth7 " ;
      sqlParaMap.put("dataAuth", dataAuth);
      //sqlParaMap.put("dataAuth1", dataAuth);
       //sqlParaMap.put("dataAuth2", dataAuth);
      //  sqlParaMap.put("dataAuth3", dataAuth);
      //   sqlParaMap.put("dataAuth4", dataAuth);
      //    sqlParaMap.put("dataAuth5", dataAuth);
         
            //sqlParaMap.put("dataAuth7", dataAuth);
             //sqlParaMap.put("dataAuth8", dataAuth);
    }
     else 
    {
        sqlWhere += " and t.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )";	
         sql += "LEFT JOIN t_co_item b ON b.ci_item_code=t.wrd_item_code and b.DATA_AUTH = t.DATA_AUTH" +
                    	
                   " LEFT JOIN T_WMS_RECEIVE_DOC c ON c.WRD_DOC_NUM=t.WRD_DOC_NUM  and c.DATA_AUTH = t.DATA_AUTH" +
                    	
                   " LEFT JOIN T_WMS_AREA d ON d.WA_AREA_SN=t.WRD_WH_CODE and d.DATA_AUTH = t.DATA_AUTH " +
                   	
                   " LEFT JOIN T_WMS_RECEIVE_ITEM f ON T.WRD_ITEM_ID = F.ID and f.DATA_AUTH = t.DATA_AUTH " +
               	
                   " LEFT JOIN T_CO_SUPPLIER t1 ON t1.SUPPLIER_CODE=t.WRD_SUP_TRACE and t1.DATA_AUTH = t.DATA_AUTH " +
                   	
                   //" LEFT JOIN SY_USER t2 ON t2.LOGIN_NAME=t.WRD_RECEIVE_EMP " +
                   
                     "LEFT JOIN SY_USER t2 ON (t2.LOGIN_NAME=T.WRD_RECEIVE_EMP or  t2.id=T.WRD_RECEIVE_EMP)"+
                   
                   " LEFT JOIN SY_DEPT t3 ON t3.ID=T.DATA_AUTH ";
                   
       
       sqlParaMap.put("userId1", userId);
      
       
      
  
    }   
   // String sqlWhere = " where 1=1 ";
    if(StringUtils.isNotBlank(itemId)){
      sqlWhere += " and t.WRD_ITEM_ID = :itemId1";
      sqlParaMap.put("itemId1", itemId);
    }
        if(StringUtils.isNotBlank(docType)){
      sqlWhere += " and c.WRD_DOC_TYPE = :docType1";
      sqlParaMap.put("docType1", docType);
    }
    if(StringUtils.isNotBlank(itemCode)){
      sqlWhere += " and t.wrd_item_code like '%'|| :itemCode1 || '%'";
      sqlParaMap.put("itemCode1", itemCode);
    }
    if(StringUtils.isNotBlank(supCode)){
      sqlWhere += " and T1.SUPPLIER_NAME like '%'|| :supCode1 || '%'";
      sqlParaMap.put("supCode1", supCode);
    }
    
    if(StringUtils.isNotBlank(docNum)){
      sqlWhere += " and t.WRD_DOC_NUM like '%' || :docNum1 || '%'";
      sqlParaMap.put("docNum1", docNum);
    }

    if(StringUtils.isNotBlank(connectDoc)){
      sqlWhere += " and t.WRD_CONNECT_DOC like '%' || :connectDoc1 || '%'";
      sqlParaMap.put("connectDoc1", connectDoc);
    }
    if(StringUtils.isNotBlank(itemStatus)){
			sqlWhere += " and f.WRI_STATUS = :itemStatus1";
			sqlParaMap.put("itemStatus1", itemStatus);
		}

      /*  if(StringUtils.isNotBlank(beginTime)){
      sqlWhere += " and t.WRD_RECEIVE_TIME >= to_date('"+beginTime+"','yyyy-mm-dd hh24:mi:ss')";
    }
    if(StringUtils.isNotBlank(endTime)){
      sqlWhere += " and t.WRD_RECEIVE_TIME <= to_date('"+endTime+"','yyyy-mm-dd hh24:mi:ss')";
    }*/
    //String sql1 = "select * from("+sql +" where 1=1 "+ sqlWhere+ ")";
    
    //String sql1 = "select * from ("+sql+sqlWhere+" )";
    
    List poList = modelService.listSql(sql+sqlWhere, modelAction.getPage(), sqlParaMap, null,null);
    //List poList = modelService.listSql(sql1, modelAction.getPage(), sqlWhere, null, " order by t.WRD_RECEIVE_TIME desc ",null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(poList);
    modelAction.getAjaxPage().setDataList(poList);
    return BaseActionSupport.AJAX;
  }

}