
package com.morelean.mes.smt.item.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.more.fw.core.base.core.action.ModelAction;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ProjectIdTable implements FuncService {

  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String productId = null;
    if (modelAction.getParaMap2() != null) {
      productId = modelAction.getParaMap2().get("productId");
    }
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    StringBuilder sql = new StringBuilder("select t.project_id as mkey,t.project_id as val,t.PRODUCT_MATERIAL,"
        + "t.PRODUCT_NAME,t.PRODUCT_STANDARD,t.DESTROY_NO,t.PRODUCT_COUNT,t.project_step,t.fai_num "
        + "from T_PM_PROJECT_BASE t  "
        + "where 1=1");
    String dataAuth = modelAction.getParaMap2().get("dataAuth");//获取页面组织机构
    String userId = modelAction.getSessionUser().getId();//用户id
    String[] authArr = dataAuth.split(",");
    int authSize = authArr.length;//1为单组织机构
    //多组织机构控制
    if(authSize==1) {
        sql.append(" AND t.DATA_AUTH = :DATA_AUTH  ");   
        sqlParaMap.put("DATA_AUTH", dataAuth);
    }else {
    	sql.append(" AND t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID )  ");
        sqlParaMap.put("USER_ID", userId);  	
    }   

    if (StringUtils.isNotBlank(productId)) {
      productId = productId.trim();
      sql.append(" AND t.project_id LIKE ");
      sql.append("'%'");
      sql.append("|| :PRODUCTID");
      sql.append("|| '%'");
      sqlParaMap.put("PRODUCTID", productId);
    }
    List<Map> userList = modelService.listSql(sql.toString().toUpperCase(), modelAction.getPage(), sqlParaMap, null,
        null);
    Map<String, Object> dataMap = new HashMap<String, Object>();
    dataMap.put("title", getTitle(modelAction));
    dataMap.put("tableData", userList);
    dataMap.put("setHiddenCol", setHiddenCol());
    //dataMap.put("javaScriptFun", javaScriptFun());
    dataMap.put("page", pageData(modelAction.getPage()));
    CommMethod.mapToEscapeJs(dataMap);
    return JSONObject.fromObject(dataMap).toString();
  }

  private Map<String, Object> pageData(PaginationImpl paginationImpl) {
    Map<String, Object> pageMap = new HashMap<String, Object>();
    pageMap.put("currentPage", paginationImpl.getCurrentPage());
    pageMap.put("totalPage", paginationImpl.getTotalPage());
    pageMap.put("totalRecord", paginationImpl.getTotalRecord());
    pageMap.put("pageRecord", paginationImpl.getPageRecord());
    pageMap.put("first", paginationImpl.isFirst());
    pageMap.put("last", paginationImpl.isLast());
    return pageMap;
  }

  private Map<String, String> getTitle(ModelAction modelAction) {
    Map<String, String> map = new LinkedHashMap<String, String>();
	map.put("MKEY", modelAction.getText("MKEY"));
    map.put("VAL", modelAction.getText("工单号"));
    map.put("PRODUCT_MATERIAL", modelAction.getText("机种编码"));
    map.put("PRODUCT_NAME", modelAction.getText("机种名称"));
    map.put("PRODUCT_STANDARD", modelAction.getText("规格"));
    map.put("DESTROY_NO", modelAction.getText("销售单号"));
    map.put("PRODUCT_COUNT", modelAction.getText("计划数量"));
	map.put("PROJECT_STEP", modelAction.getText("PROJECT_STEP"));
	map.put("FAI_NUM", modelAction.getText("FAI_NUM"));
    return map;
  }

  private List<String> setHiddenCol() {
    List<String> hiddList = new ArrayList<String>();
    hiddList.add("ROWNUM_");
    hiddList.add("MKEY");
    hiddList.add("PROJECT_STEP");
    hiddList.add("FAI_NUM");
    return hiddList;
  }

  private String javaScriptFun() {
    StringBuilder sb = new StringBuilder();
    sb.append("function setJobNameValue(){\n");
    sb.append("console.log('sssssss')\n");
    sb.append("};setJobNameValue();\n");
    return sb.toString();
  }

  public String StringSql() {
    return "select t.project_id as mkey,t.project_id as val from T_PM_PROJECT_BASE t  WHERE t.project_id = ";
  }
  
  public String addPm(){
   return "测试一下";
  }

}
