package com.morelean.mes.smt.item.service;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import net.sf.json.JSONObject;

import java.util.*;

public class FeedItemTableService implements FuncService {

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String ciItemCode = null;
    String ciItemName = null;
    String ciItemSpec = null;
    String ciStockCode = null;
    if (modelAction.getParaMap2() != null) {
      ciItemCode = modelAction.getParaMap2().get("ciItemCode");
      ciItemName = modelAction.getParaMap2().get("ciItemName");
      ciItemSpec = modelAction.getParaMap2().get("ciItemSpec");
      ciStockCode = modelAction.getParaMap2().get("ciStockCode");
    }
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    StringBuilder sql = new StringBuilder(
            " SELECT T.CI_ITEM_CODE MKEY," +
            " T.CI_ITEM_NAME VAL," +
            " T.STOCK_CODE   STOCK_CODE," +
            " T.CI_ITEM_SPEC ITEMSPEC," +
            " T.CI_MIN_PACK  MINPACK " +
            " FROM T_CO_ITEM T " +
            " WHERE 1 = 1");
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
    if (StringUtils.isNotBlank(ciItemCode)) {
      ciItemCode = ciItemCode.trim();
      sql.append(" AND t.CI_ITEM_CODE LIKE ");
      sql.append("'%'");
      sql.append("|| :CIITEMCODE");
      sql.append("|| '%'");
      sqlParaMap.put("CIITEMCODE", ciItemCode);
    }
    if (StringUtils.isNotBlank(ciItemName)) {
      ciItemName = ciItemName.trim();
      sql.append(" AND t.CI_ITEM_NAME LIKE ");
      sql.append("'%'");
      sql.append("|| :CIITEMNAME");
      sql.append("|| '%'");
      sqlParaMap.put("CIITEMNAME", ciItemName);
    }
    if (StringUtils.isNotBlank(ciItemSpec)) {
      ciItemSpec = ciItemSpec.trim();
      sql.append(" AND t.CI_ITEM_SPEC LIKE ");
      sql.append("'%'");
      sql.append("|| :CIITEMSPEC");
      sql.append("|| '%'");
      sqlParaMap.put("CIITEMSPEC", ciItemSpec);
    }
    if (StringUtils.isNotBlank(ciStockCode)) {
      ciStockCode = ciStockCode.trim();
      sql.append(" AND t.STOCK_CODE LIKE ");
      sql.append("'%'");
      sql.append("|| :STOCK_CODE");
      sql.append("|| '%'");
      sqlParaMap.put("STOCK_CODE", ciStockCode);
    }
    List<Map> userList = modelService.listSql(sql.toString().toUpperCase(), modelAction.getPage(), sqlParaMap, null,null);
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
    map.put("mkey", modelAction.getText("物料料号"));
    map.put("val", modelAction.getText("物料名称"));
    map.put("ITEMSPEC", modelAction.getText("物料规格"));
    map.put("STOCK_CODE", modelAction.getText("存货代码"));
    map.put("MINPACK", modelAction.getText("最小包装数"));
    return map;
  }

  private List<String> setHiddenCol() {
    List<String> hiddList = new ArrayList<String>();
    hiddList.add("ROWNUM_");
    //hiddList.add("KEY");
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
    return " SELECT T.CI_ITEM_CODE AS MKEY," +
           " T.CI_ITEM_CODE AS VAL," +
           " T.STOCK_CODE   AS STOCK_CODE," +
           " T.CI_ITEM_NAME," +
           " T.CI_ITEM_SPEC AS CIITEMSPEC " +
           " FROM T_CO_ITEM T " +
           " WHERE T.CI_ITEM_CODE = ";
  }

}