package com.morelean.mes.smt.mo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateJsonValueProcessor;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;


public class MoTableService implements FuncService {

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String pmMoNumber = null;
    if (modelAction.getParaMap2() != null) {
      pmMoNumber = modelAction.getParaMap2().get("pmMoNumber");
    }
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    StringBuilder sql = new StringBuilder(
        "SELECT T.PM_MO_NUMBER AS MKEY,T.PM_MO_NUMBER AS VAL,T.ID,T.PM_MODEL_CODE,T.PM_SCHEDULE_DATE,T.PM_DUE_DATE,T.PM_ISSUED_DATE,T.PM_TARGET_QTY,T.PM_UNIT_NUM,T2.CI_ITEM_NAME,T2.CI_ITEM_SPEC," +
        "T.PM_JIGSAW_NUM,T.PM_SN_RULE,T.PM_SUB_RULE,T.PM_REPAIR_MAX,T.PM_PROCESS_FACE,T.PM_ERROR_SCRAP,T.PM_AUTO_FQC,T.PM_FQC_NUM,T.PM_CONTROL_TYPE,T.PM_TRANSFER_RULE,"
            + "T.PM_PROJECT_ID,T.PM_AREA_SN,(CASE WHEN T.PM_PRODUCT_STEP='1' THEN 'SMT' WHEN T.PM_PRODUCT_STEP='2' THEN 'DIP' ELSE 'PACK' END) AS PM_PRODUCT_STEP,T.PM_TECH_SN AS PM_TECH_SN FROM T_PM_MO_BASE T "
            + "LEFT JOIN T_CO_ITEM T2 ON T2.CI_ITEM_CODE = T.PM_MODEL_CODE WHERE 1=1 ");
    String dataAuth = modelAction.getParaMap2().get("dataAuth");//获取页面组织机构
    String userId = modelAction.getSessionUser().getId();//用户id
    String[] authArr = dataAuth.split(",");
    int authSize = authArr.length;//1为单组织机构
    if(authSize==1) {
        sql.append(" AND t.DATA_AUTH = :DATA_AUTH  ");   
        sql.append(" AND t2.DATA_AUTH = :DATA_AUTH2  ");
        sqlParaMap.put("DATA_AUTH", dataAuth);
        sqlParaMap.put("DATA_AUTH2", dataAuth);
    }else {
    	sql.append(" AND t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID )  ");
    	sql.append(" AND t2.DATA_AUTH = t.DATA_AUTH   ");
        sqlParaMap.put("USER_ID", userId);
        //sqlParaMap.put("USER_ID2", userId);   	
    }   
    
    if (StringUtils.isNotBlank(pmMoNumber)) {
    	pmMoNumber =  pmMoNumber.trim();
      sql.append(" AND t.PM_MO_NUMBER LIKE ");
      sql.append("'%'");
      sql.append("|| :PMMONUMBER");
      sql.append("|| '%'");
      sqlParaMap.put("PMMONUMBER", pmMoNumber);
    }
    List<Map> userList = modelService.listSql(sql.toString().toUpperCase(), modelAction.getPage(), sqlParaMap, "order by T.PM_ISSUED_DATE desc",
        null);
   
    Map<String, Object> dataMap = new HashMap<String, Object>();
    dataMap.put("title", getTitle(modelAction));
    dataMap.put("tableData", userList);
    dataMap.put("setHiddenCol", setHiddenCol());
    //String a = org.apache.commons.httpclient.util.DateUtil.formatDate(date, pattern)
    //dataMap.put("javaScriptFun", javaScriptFun());
    JsonConfig jf = new JsonConfig();  
    jf.registerJsonValueProcessor(java.sql.Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));  
    //jf.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));  
    dataMap.put("page", pageData(modelAction.getPage()));
    CommMethod.mapToEscapeJs(dataMap);
    JSONObject jo = JSONObject.fromObject(dataMap,jf);
    String a = JSONObject.fromObject(dataMap,jf).toString();
    return a;
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
    map.put("VAL", modelAction.getText("制令单号"));
	map.put("ID", modelAction.getText("ID"));
    map.put("PM_MODEL_CODE", modelAction.getText("机种编码"));
	map.put("PM_SCHEDULE_DATE", modelAction.getText("PM_SCHEDULE_DATE"));
	map.put("PM_DUE_DATE", modelAction.getText("PM_DUE_DATE"));
	map.put("PM_ISSUED_DATE", modelAction.getText("PM_ISSUED_DATE"));
	map.put("PM_TARGET_QTY", modelAction.getText("PM_TARGET_QTY"));
	map.put("PM_UNIT_NUM", modelAction.getText("PM_UNIT_NUM"));
    map.put("CI_ITEM_NAME", modelAction.getText("机种名称"));
	map.put("CI_ITEM_SPEC", modelAction.getText("CI_ITEM_SPEC"));
	map.put("PM_JIGSAW_NUM", modelAction.getText("PM_JIGSAW_NUM"));
	map.put("PM_SN_RULE", modelAction.getText("PM_SN_RULE"));
	map.put("PM_SUB_RULE", modelAction.getText("PM_SUB_RULE"));
	map.put("PM_REPAIR_MAX", modelAction.getText("PM_REPAIR_MAX"));
	map.put("PM_PROCESS_FACE", modelAction.getText("PM_PROCESS_FACE"));
	map.put("PM_ERROR_SCRAP", modelAction.getText("PM_ERROR_SCRAP"));
	map.put("PM_AUTO_FQC", modelAction.getText("PM_AUTO_FQC"));
	map.put("PM_FQC_NUM", modelAction.getText("PM_FQC_NUM"));
	map.put("PM_CONTROL_TYPE", modelAction.getText("PM_CONTROL_TYPE"));
	map.put("PM_TRANSFER_RULE", modelAction.getText("PM_TRANSFER_RULE"));
    map.put("PM_PROJECT_ID", modelAction.getText("工单号"));
	map.put("PM_AREA_SN", modelAction.getText("PM_AREA_SN"));
    map.put("PM_PRODUCT_STEP", modelAction.getText("生产阶别"));
	map.put("PM_TECH_SN", modelAction.getText("PM_TECH_SN"));
    return map;
  }

  private List<String> setHiddenCol() {
    List<String> hiddList = new ArrayList<String>();
    hiddList.add("ROWNUM_");
    hiddList.add("MKEY");
    hiddList.add("ID");
    hiddList.add("PM_TECH_SN");
    hiddList.add("CI_ITEM_SPEC");
    hiddList.add("PM_SCHEDULE_DATE");
    hiddList.add("PM_DUE_DATE");
    hiddList.add("PM_ISSUED_DATE");
    hiddList.add("PM_TARGET_QTY");
    hiddList.add("PM_UNIT_NUM");
    hiddList.add("PM_JIGSAW_NUM");
    hiddList.add("PM_SN_RULE");
    hiddList.add("PM_SUB_RULE");
    hiddList.add("PM_REPAIR_MAX");
    hiddList.add("PM_ERROR_SCRAP");
    hiddList.add("PM_AUTO_FQC");
    hiddList.add("PM_FQC_NUM");
    hiddList.add("PM_CONTROL_TYPE");
    hiddList.add("PM_TRANSFER_RULE");
    hiddList.add("PM_AREA_SN");
    hiddList.add("PM_PROCESS_FACE");
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
    return "select t.PM_MO_NUMBER as mkey,t.PM_MO_NUMBER as val from T_PM_MO_BASE t  WHERE t.PM_MO_NUMBER = ";
  }

}