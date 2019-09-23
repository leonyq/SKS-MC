package com.morelean.mes.smt.technics.service;

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

public class TechnicsTableService implements FuncService {

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String ctId = null;
    String ctName = null;
    if (modelAction.getParaMap2() != null) {
      ctId = modelAction.getParaMap2().get("ctId");
      ctName = modelAction.getParaMap2().get("ctName");
    }
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    StringBuilder sql = new StringBuilder("SELECT CT_ID MKEY,CT_NAME VAL,T1.VALUE as PROJECT_STEP,"
        + "(case when t.CT_VALID_FLAG = 'Y' then '是' else'否' end) CT_VALID_FLAG, "
        + " TO_CHAR(T.CREATE_TIME, 'YYYY-MM-DD') CREATE_TIME "
        + " FROM T_CO_TECHNICS T LEFT JOIN SY_DICT_VAL T1 ON T1.DICT_CODE = 'PROJECT_STEP'"
        + " AND T1.DICT_CODE = T.CT_PRODUCT_STEP where 1=1 ");
    String dataAuth = modelAction.getParaMap2().get("dataAuth");//获取页面组织机构
   //String dataAuth = "9c4420b809e14f4baa3148ae60217327";
    String userId = modelAction.getSessionUser().getId();//用户id
    String[] authArr = dataAuth.split(",");
    int authSize = authArr.length;//1为单组织机构
    //多组织机构控制
    if(authSize==1) {
        sql.append(" AND t.DATA_AUTH = :DATA_AUTH  ");   
        sqlParaMap.put("DATA_AUTH", dataAuth);
    }
    else {
    	sql.append(" AND t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID )  ");
        sqlParaMap.put("USER_ID", userId); 
        //sql.append(" AND t.DATA_AUTH = :DATA_AUTH  ");   
        //sqlParaMap.put("DATA_AUTH", dataAuth);
    }       
    if (StringUtils.isNotBlank(ctId)) {
      ctId = ctId.trim();
      sql.append(" AND t.CT_ID LIKE ");
      sql.append("'%'");
      sql.append("|| :CTID");
      sql.append("|| '%'");
      sqlParaMap.put("CTID", ctId);
    }
    if (StringUtils.isNotBlank(ctName)) {
      ctName = ctName.trim();
      sql.append(" AND t.CT_NAME LIKE ");
      sql.append("'%'");
      sql.append("|| :CTNAME");
      sql.append("|| '%'");
      sqlParaMap.put("CTNAME", ctName);
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
    map.put("mkey", modelAction.getText("工艺代码"));
    map.put("val", modelAction.getText("工艺名称"));
    map.put("PROJECT_STEP", modelAction.getText("生产阶别"));
    map.put("CT_VALID_FLAG", modelAction.getText("有效标识"));
    map.put("CREATE_TIME", modelAction.getText("创建时间"));
    return map;
  }

  private List<String> setHiddenCol() {
    List<String> hiddList = new ArrayList<String>();
    hiddList.add("ROWNUM_");
    //hiddList.add("MKEY");
    return hiddList;
  }

  private String javaScriptFun() {
    StringBuilder sb = new StringBuilder();
    sb.append("function setJobNameValue(){\n");
    sb.append("alert('sssssss')\n");
    //sb.append("console.log('sssssss')\n");
    sb.append("};setJobNameValue();\n");
    return sb.toString();
  }

  public String StringSql() {
    return "select t.ct_id as mkey,t.ct_name as val from T_CO_TECHNICS t  WHERE t.ct_id = ";
  }

}