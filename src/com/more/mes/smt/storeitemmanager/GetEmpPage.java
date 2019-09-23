package com.more.mes.smt.storeitemmanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 物料管控信息人员分页
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class GetEmpPage implements FuncService
{

  @SuppressWarnings({"rawtypes", "static-access", "unused"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String wicCtrlEmp = request.getParameter("WIC_CTRL_EMP").trim();//员工号
    String wicItemCode = request.getParameter("WIC_ITEM_CODE").trim();//料号
    String ciItemName = request.getParameter("CI_ITEM_NAME").trim();//名称
    String ciItemGenre =request.getParameter("CI_ITEM_GENRE").trim();//类别
    String ciItemSpec = request.getParameter("CI_ITEM_SPEC").trim();//规格
    //String dataAuth = request.getParameter("dataAuth");//规格
    String dataAuth = request.getParameter("dataAuth");//组织机构  
    //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String userId =  modelAction.getSessionUser().getId();//用户id
    Map<String, String> map = new HashMap<String, String>();
    
    String t2SqlDataAuth = "";
    String t3SqlDataAuth = "";
    String querySql = "";
    if(StringUtils.isNotBlank(dataAuth)){
    	t2SqlDataAuth = " AND T2.DATA_AUTH = :DATA_AUTH2 ";
   
    	map.put("DATA_AUTH2", dataAuth);
    
    }else {
    	t2SqlDataAuth = " AND T2.DATA_AUTH IN ( SELECT DEPT_ID  FROM  SY_DATA_AUTH WHERE USER_ID = :USER_ID2 ) ";
    	
    	map.put("USER_ID2", userId);
    	
    }
    querySql="SELECT T1.ID,T1.LOGIN_NAME ,T1.NAME,T4.ID AS AUTH_VAL,T4.NAME AS NAMES,T1.DATA_AUTH AS DATA_AUTH2"+
            "  FROM SY_USER T1 LEFT JOIN SY_DEPT T4 ON T4.ID=T1.DATA_AUTH WHERE T1.LOGIN_NAME IN "+
            "(SELECT WIC_CTRL_EMP FROM T_WMS_ITEM_CONTRAL T2 LEFT join t_co_item t3 on t2.wic_item_code = t3.ci_item_code and t2.data_auth = t3.data_auth "+
            " WHERE 1=1 "+t2SqlDataAuth;
    
    
    if(StringUtils.isNotBlank(wicItemCode)){
      querySql += " AND T3.CI_ITEM_CODE LIKE '%' ||:wicItemCode1|| '%'";
      map.put("wicItemCode1", wicItemCode);
    }
    if(StringUtils.isNotBlank(ciItemName)){
      querySql += " AND T3.CI_ITEM_NAME LIKE '%' ||:ciItemName1|| '%'";
      map.put("ciItemName1", ciItemName);
    }
    if(StringUtils.isNotBlank(ciItemSpec)){
      querySql += " AND T3.CI_ITEM_SPEC LIKE '%' ||:ciItemSpec1|| '%'";
      map.put("ciItemSpec1", ciItemSpec);
    }
    if(StringUtils.isNotBlank(ciItemGenre)){
      querySql += " AND T3.CI_ITEM_GENRE LIKE '%' ||:ciItemGenre1|| '%'";
      map.put("ciItemGenre1", ciItemGenre);
    }
    querySql += ")";
    
    if(StringUtils.isNotBlank(wicCtrlEmp)){
      querySql += " AND T1.LOGIN_NAME LIKE '%' ||:wicCtrlEmp1|| '%'";
      map.put("wicCtrlEmp1", wicCtrlEmp);
    }
    
    if(StringUtils.isNotBlank(dataAuth)){
        querySql += " AND T1.DATA_AUTH=:DATA_AUTH1";// AND T4.DATA_AUTH=:DATA_AUTH4  ";
        map.put("DATA_AUTH1", dataAuth);
      
    }else {
        querySql += " AND T1.DATA_AUTH IN ( SELECT DEPT_ID  FROM  SY_DATA_AUTH WHERE USER_ID = :USER_ID1 )";
        map.put("USER_ID1", userId);	
    }
    
    
    
    List list = modelService.listSql(querySql, modelAction.getPage(), map, null, null);
    
    
    
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);
    
    return modelAction.AJAX;
  }

}
