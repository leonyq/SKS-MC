package com.morelean.mes.smt.dept.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class DeptTableService implements FuncService {

  private List<Map<String, Object>> resultlist = new ArrayList<Map<String, Object>>();//树形结构排序之后的list
  private List<Map<String, Object>> Plist = new ArrayList<Map<String, Object>>();//上級的list
  private List<Map<String, Object>> Clist = new ArrayList<Map<String, Object>>();//下級的list

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    String name = null;
    resultlist.clear();
    if (modelAction.getParaMap2() != null) {
      name = modelAction.getParaMap2().get("name");
    }
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    StringBuilder sql = new StringBuilder("select t.id as mkey,t.name as val,t.up_id as pid,t3.name as pname,"
        + "t1.name as rolename,t2.job_name as jobname from sy_dept t "
        + "left join sy_role t1 on t1.id = t.role_id left join sy_job t2 on t2.id = t.job_id "
        + "left join sy_dept t3 on t3.id = t.up_id where 1=1 ");
    if (StringUtils.isNotBlank(name)) {
      sql.append(" AND t.NAME LIKE ");
      sql.append("'%'");
      sql.append("|| :NAME");
      sql.append("|| '%'");
      sqlParaMap.put("NAME", name);
    }
    List dataList = modelService.listSql(sql.toString().toUpperCase(), null, sqlParaMap, null, null);
    List<Map<String, Object>> newdataList = new ArrayList<Map<String, Object>>();
    newdataList.addAll(dataList);
    //List alldataList = modelService.listSql(sql.toString().toUpperCase(), modelAction.getPage(), null, null, null);
    for (int i = 0; i < dataList.size(); i++) {
      Map<String, Object> map = (Map<String, Object>) dataList.get(i);
      newdataList.addAll(getSuperior(map, dataList));
      newdataList.addAll(getChildAll(map, dataList));
    }
    dataList = removeDuplicate(newdataList);
    buildTreeData(dataList);
    //modelAction.setDataList(resultlist);
    //modelAction.setAjaxList(resultlist);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(resultlist);
    modelAction.getAjaxPage().setDataList(resultlist);
    /*
     * Map<String, Object> dataMap = new HashMap<String, Object>(); dataMap.put("title", getTitle(modelAction)); dataMap.put("tableData", userList); dataMap.put("setHiddenCol",
     * setHiddenCol()); //dataMap.put("javaScriptFun", javaScriptFun()); dataMap.put("page", pageData(modelAction.getPage())); return JSONObject.fromObject(dataMap).toString();
     */
    return BaseActionSupport.AJAX;
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
    map.put("val", modelAction.getText("工单名称"));
    map.put("PRODUCT_MATERIAL", modelAction.getText("机种"));
    map.put("PRODUCT_STANDARD", modelAction.getText("规格"));
    map.put("DESTROY_NO", modelAction.getText("销 售单号"));
    map.put("PRODUCT_COUNT", modelAction.getText("计划数量"));
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
    sb.append("console.log('sssssss')\n");
    sb.append("};setJobNameValue();\n");
    return sb.toString();
  }

  public String StringSql() {
    return "select t.project_id as mkey,t.PRODUCT_NAME as val from T_PM_PROJECT_BASE t  WHERE t.project_id = ";
  }

  private List<Map<String, Object>> buildTreeData(List<Map<String, Object>> dataList) {
    Collections.sort(dataList, new Comparator<Map<String, Object>>() {
      @Override
      public int compare(Map<String, Object> o1, Map<String, Object> o2) {
        String s1 = (String) o1.get("VAL");
        String s2 = (String) o2.get("VAL");
        if (s1 == null && s2 != null)
          return 1;
        if (s2 == null && s1 != null)
          return -1;
        if (s1 == null && s2 == null)
          return 0;
        return s1.compareTo(s2);

      }

    });
    for (Map<String, Object> map : dataList) {
      Object pid = map.get("PID");
      if ("-1".equals(pid)) {
        resultlist.add(map);//添加一级节点
        build(map, dataList);//获取二级
      }
    }
    return resultlist;
  }

  //循环子节点
  private void build(Map<String, Object> datamap, List<Map<String, Object>> dataList) {
    List<Map<String, Object>> childlist = getChildren(datamap, dataList);
    if (childlist != null && !childlist.isEmpty()) {
      for (Map<String, Object> map : childlist) {
        datamap.put("hasChild", "1");
        resultlist.add(map);//添加子节点 
        build(map, dataList);
      }
    }
  }

  private List<Map<String, Object>> getChildren(Map<String, Object> datamap, List<Map<String, Object>> dataList) {
    List<Map<String, Object>> childlist = new ArrayList<Map<String, Object>>();
    Object id = datamap.get("MKEY");
    for (Map<String, Object> map : dataList) {
      if (id != null && id.equals(map.get("PID"))) {
        childlist.add(map);//添加一级节点
      }
    }
    return childlist;
  }

  //获取上级
  private List<Map<String, Object>> getSuperior(Map<String, Object> datamap, List<Map<String, Object>> dataList) {
    Object pid = datamap.get("PID");
    if ("-1".equals(pid)) {
      return Plist;
    }
    for (Map<String, Object> map : dataList) {
      if (pid != null && pid.equals(map.get("MKEY"))) {
        Plist.add(map);//添加上一级节点
        if (!"-1".equals(map.get("PID"))) {
          getSuperior(map, dataList);
        }

      }
    }
    return Plist;
  }

  //获取下级
  private List<Map<String, Object>> getChildAll(Map<String, Object> datamap, List<Map<String, Object>> dataList) {
    Object id = datamap.get("MKEY");
    for (Map<String, Object> map : dataList) {
      if (id != null && id.equals(map.get("PID"))) {
        Clist.add(map);//添加子一级节点
        getChildAll(map, dataList);
      }
    }
    return Clist;
  }

  //剔除重複
  private List removeDuplicate(List list) {
    HashSet h = new HashSet(list);
    list.clear();
    list.addAll(h);
    return list;
  }
}