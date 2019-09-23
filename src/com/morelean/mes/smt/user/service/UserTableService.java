package com.morelean.mes.smt.user.service;

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

public class UserTableService implements FuncService {

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String name = null;
    String loginName = null;
    if (modelAction.getParaMap2() != null) {
      name = modelAction.getParaMap2().get("name");
      loginName = modelAction.getParaMap2().get("userid");
    }

    
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    StringBuilder sql = new StringBuilder(
        "select t.id as mkey,t.login_name as loginname, t.name as val,  t1.name as deptname from sy_user t left join sy_dept t1 on t.dept_id = t1.id where 1=1 ");
    
    String dataAuth = modelAction.getParaMap2().get("dataAuth");//获取页面组织机构
    String userId = modelAction.getSessionUser().getId();//用户id
    String[] authArr = dataAuth.split(",");
    int authSize = authArr.length;//1为单组织机构
   // 多组织机构控制
    if(authSize==1) {
        sql.append(" AND t.DATA_AUTH = :DATA_AUTH  ");   
        sqlParaMap.put("DATA_AUTH", dataAuth);
    }else {
    	sql.append(" AND t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID )  ");
        sqlParaMap.put("USER_ID", userId);   	
    }       
    if (StringUtils.isNotBlank(name)) {
      sql.append(" AND t.name LIKE ");
      sql.append("'%'");
      sql.append("|| :NAME");
      sql.append("|| '%'");
      sqlParaMap.put("NAME", name);
    }
    if (StringUtils.isNotBlank(loginName)) {
        sql.append(" AND t.login_name LIKE ");
        sql.append("'%'");
        sql.append("|| :LOGINNAME");
        sql.append("|| '%'");
        sqlParaMap.put("LOGINNAME", loginName);
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
	map.put("MKEY", modelAction.getText("员工ID"));
    map.put("LOGINNAME", modelAction.getText("员工编号"));	
    map.put("VAL", modelAction.getText("员工名称"));
    map.put("DEPTNAME", modelAction.getText("所属部门"));
    return map;
  }

  private List<String> setHiddenCol() {
    List<String> hiddList = new ArrayList<String>();
    hiddList.add("ROWNUM_");
    hiddList.add("MKEY");
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
    return "select t.id as mkey,t.name as val from sy_user t  WHERE id = ";
  }

}