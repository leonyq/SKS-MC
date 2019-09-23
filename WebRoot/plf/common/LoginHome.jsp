
<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@page import="com.more.fw.core.common.method.CommMethod"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.more.fw.core.common.method.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.more.fw.core.common.method.Constants"%>
<%@page import="com.more.fw.core.common.method.SpringContextUtil"%>
<%@page import="com.more.fw.core.sysfa.auth.service.FuncService"%>
<%@page import="com.more.fw.core.common.tree.TreeView"%>



 <!-- 读配置文件 -->
<%!String flag = ReadProperties.getPorpertie("system.properties", "MC_LOGIN_INDEX");%>


 
 <%
 	
    
    /* 
 		数据库
 		1.session
 		2.jdbc
 		3.factory
 	 */
 	
 	 
 	 
 	 List<String> copyList = new ArrayList<String>();
 	 
 	 if("1".equals(flag)){
 	 
    List<Map<String, Object>> list = CommMethod.getBaseService().listDataSql("select '1' as flagX,t.id as \"id\",t.m_name as \"name\",CASE t.up_m_id WHEN '5d450463bda74b2b93e1c7b7818943b2' THEN 'mc0000012' ELSE t.up_m_id END  as \"upId\",if_show_model,t.path from MS_BUSS_MODEL t where path like '0-5d450463bda74b2b93e1c7b7818943b2-%' ");
		
	FuncService funcService = (FuncService) SpringContextUtil.getBean("funcService");
	List<TreeView> userFuncLs = funcService.listUserPlfFuncByZtree(CommMethod.getSessionUser(request),
      Constants.FUNC_TREE_ROOT_ID, false, "plf/js/dhtmlxtree/imgs/csh_bluebooks/");
		
		
	if (userFuncLs != null && !userFuncLs.isEmpty())
    {
      for (TreeView tv : userFuncLs)
      {
        copyList.add(buildZtreeItem2(tv));
      }
    }
    
		
  if (list != null && !list.isEmpty())
    {
      for (Map<String, Object> map : list)
      {
        String id = StringUtils.toString(map.get("id"));
        String name = StringUtils.toString(map.get("name"));
        String upId = StringUtils.toString(map.get("upId"));
        String pathX = StringUtils.toString(map.get("path"));
        //主节点
        copyList.add(buildZtreeItem(id, upId, id, name, "listOrmTree","sys/BussModelAction_listBussModel.ms", pathX));

		
		if (map.get("if_show_model") != null && "Y".equals(map.get("if_show_model").toString()))
        {
          copyList.add(buildZtreeItem(id + "_ORM", id, id, "持久模型", "listOrmTree",
            "sys/BussModelAction_listOrm.ms", pathX + "-" + id + "_ORM"));
          copyList.add(buildZtreeItem(id + "_FORM", id, id, "表单模型", "listFormTree",
            "sys/BussModelAction_listForm.ms", pathX + "-" + id + "_FORM"));
          copyList.add(buildZtreeItem(id + "_VIEW", id, id, "视图模型", "listViewTree",
            "sys/BussModelAction_listView.ms", pathX + "-" + id + "_VIEW"));
          copyList.add(buildZtreeItem(id + "_REP", id, id, "报表模型", "listRepTree",
            "rep/listReport.ms", pathX + "-" + id + "_REP"));
          copyList.add(buildZtreeItem(id + "_JCLZX", id, id, "类管理", "listClzMgrTree",
            "sys/MClzMgrAction_listCommClass.ms", pathX + "-" + id + "_JCLZX"));
        }
        
      }
    }
    };
    
    pageContext.setAttribute("copyList", copyList);
   
  %>
 
 <%!public String buildZtreeItem(String id, String upID, String mid, String model,
                                            String autoLoadAction, String actionMethod, String path)
  {
    Map<String, Object> spliceMap = new HashMap<String, Object>();
    String treeImg = Constants.ZTREE_IMG_PATH;
    spliceMap.put("id", id);
    spliceMap.put("upId", upID);
    spliceMap.put("mid", mid);
    spliceMap.put("name", model);
    spliceMap.put("autoLoadAction", autoLoadAction);
    spliceMap.put("actionMethod", actionMethod);
    spliceMap.put("path", path);
    spliceMap.put("flagX", "2");
    
    spliceMap.put("icon", treeImg + "ico-right-last.png");
    spliceMap.put("iconClose", treeImg + "ico-right-close.png");
    spliceMap.put("iconOpen", treeImg + "ico-right-open.png");
          
    return StringUtils.toString(JSONObject.fromObject(spliceMap));
  } %>
  
   <%!public String buildZtreeItem2( TreeView tv)
  {
    Map<String, Object> spliceMap = new HashMap<String, Object>();
    String treeImg = Constants.ZTREE_IMG_PATH;
    spliceMap.put("id", tv.getId());
    spliceMap.put("upId", tv.getUpId());
    spliceMap.put("name", tv.getName());
    spliceMap.put("path", tv.getPath());
    spliceMap.put("funcCode", tv.getFuncCode());
    spliceMap.put("openType", tv.getOpenType());
	spliceMap.put("type", tv.getType());
    
    spliceMap.put("icon", tv.getIcon());
    spliceMap.put("iconClose", tv.getIconClose());
    spliceMap.put("iconOpen", tv.getIconOpen());
    
    spliceMap.put("flagX", "1");      
    return StringUtils.toString(JSONObject.fromObject(spliceMap));
  } %>
  
 
 
  
  
  
  
 