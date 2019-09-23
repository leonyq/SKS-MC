package com.morelean.mes.smt.bom.service;

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

public class BomTableService implements FuncService {

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String cbItemCode = null;
    String cbItemName = null;
    String cbItemSpec = null;
    String dataAuth = modelAction.getParaMap2().get("dataAuth");//获取页面组织机构
    String userId = modelAction.getSessionUser().getId();//用户id
    String[] authArr = dataAuth.split(",");
    int authSize = authArr.length;//1为单组织机构
    if (modelAction.getParaMap2() != null) {
      cbItemCode = modelAction.getParaMap2().get("cbItemCode");
      cbItemName = modelAction.getParaMap2().get("cbItemName");
      cbItemSpec = modelAction.getParaMap2().get("cbItemSpec");
    }
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    StringBuilder sql = new StringBuilder(
        "select CB_ITEM_CODE mkey,CI_ITEM_NAME val,CI_ITEM_SPEC itemSpec,"
            + " T.CB_VER, to_char(T.CREATE_TIME,'yyyy-MM-DD') creattime ,T.ID from T_CO_BOM t "
            + "LEFT JOIN T_CO_ITEM t3 ON t.cb_item_code=t3.ci_item_code "
            + " where 1=1 and t.CB_DEFAULT='Y' ");//LEFT JOIN T_CO_CUSTOMER t2 ON t3.ci_cust_code=t2.cust_code
    //多组织机构控制
    if(authSize==1) {
        sql.append(" AND t.DATA_AUTH = :DATA_AUTH  ");   
        //sql.append(" AND t2.DATA_AUTH = :DATA_AUTH2  ");
        sql.append(" AND t3.DATA_AUTH = :DATA_AUTH3  ");
        sqlParaMap.put("DATA_AUTH", dataAuth);
       // sqlParaMap.put("DATA_AUTH2", dataAuth);
        sqlParaMap.put("DATA_AUTH3", dataAuth);
    }else {
    	sql.append(" AND t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID )  ");
    	//sql.append(" AND t2.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID2 )  ");
    	sql.append(" AND t3.DATA_AUTH = t.DATA_AUTH  ");
        sqlParaMap.put("USER_ID", userId);
       // sqlParaMap.put("USER_ID2", userId);
    }
    if (StringUtils.isNotBlank(cbItemCode)) {
      cbItemCode = cbItemCode.trim();
      sql.append(" AND t.CB_ITEM_CODE LIKE ");
      sql.append("'%'");
      sql.append("|| :CBITEMCODE");
      sql.append("|| '%'");
      sqlParaMap.put("CBITEMCODE", cbItemCode);
    }
    if (StringUtils.isNotBlank(cbItemName)) {
      cbItemName = cbItemName.trim();
      sql.append(" AND t3.CI_ITEM_NAME LIKE ");
      sql.append("'%'");
      sql.append("|| :CBITEMNAME");
      sql.append("|| '%'");
      sqlParaMap.put("CBITEMNAME", cbItemName);
    }
    if (StringUtils.isNotBlank(cbItemSpec)) {
      cbItemSpec = cbItemSpec.trim();
      sql.append(" AND t3.CI_ITEM_SPEC LIKE ");
      sql.append("'%'");
      sql.append("|| :CBITEMSPEC");
      sql.append("|| '%'");
      sqlParaMap.put("CBITEMSPEC", cbItemSpec);
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
    map.put("MKEY", modelAction.getText("料号"));
    map.put("VAL", modelAction.getText("机种名称"));
    map.put("ITEMSPEC", modelAction.getText("机种规格"));
    //map.put("CUSTOMER", modelAction.getText("所属客户"));
    map.put("CB_VER", modelAction.getText("机种版本号"));
    map.put("CREATTIME", modelAction.getText("创建时间"));
    map.put("ID", modelAction.getText("ID"));
    return map;
  }

  private List<String> setHiddenCol() {
    List<String> hiddList = new ArrayList<String>();
    hiddList.add("ROWNUM_");
    hiddList.add("ID");
    //hiddList.add("mkey");
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
    return "select t.ci_item_code  as mkey,t.ci_item_code as val,t.CI_ITEM_NAME, t.CI_ITEM_SPEC  from t_co_item t  WHERE t.ci_item_code = ";
  }

}