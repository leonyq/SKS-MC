<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="视图模型" /> <dict:lang value="新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
  
  </head>
  <body>
  
  
  </body>
  
   <script type="text/javascript">
       var mcIframeName = "<c:out value='${mcIframeName}' />";
       var curIframeName = "<c:out value='${curIframeName}' />";
       var mcSource = "<c:out value='${mcSource}' />";
       var msg = "<c:out value='${msg}' />";
       var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
       
       var curWindow=getSrcByIframeName({mcIframeName:curIframeName,type:'window'});
       if(mcSource == "1"){ // 新增视图
    	   //closePage();
    	   curWindow.closePage();
           top.util.alert(msg);
           mcWindow.frames['mainFrame'].location.reload();
           
        }else if("imgManageError" == mcSource){//图片管理错误信息 
    	   curWindow.closePage();
           top.alterWindows(msg,5);
           mcWindow.frames['mainFrame'].location.reload();
        }else if(mcSource == "cfgForm" || "msgSend" == mcSource){//cfgForm：控件  msgSend：消息发送
        	curWindow.closePage();
           	top.util.alert(msg);
           	mcWindow.location.reload();
           
        }else if( mcSource == "addSearch" || mcSource == "updateSearch" || mcSource == "addFunc" || mcSource == "addBussModel" ){
        	
        	curWindow.closePage();
           	top.util.alert(msg);
           	mcWindow.location.reload();
           
        }else if(mcSource == "formui"){
        
        	curWindow.closePage();
           	top.util.alert(msg);
           	mcWindow.reloadPgExe();
           	
        }else if(mcSource == "commReloadParent"){//reloadParent  方法改造  统一图片管理
        	curWindow.closePage();
        	top.util.alert(msg);
        	mcWindow.frames['mainFrame'].location.reload();
        	var flag=true;
        	if(mcWindow.frames['leftFrame']!=null){
        		var ztree=mcWindow.frames['leftFrame'].$.fn.zTree.getZTreeObj('index_tree');
        		if(ztree!=null && ztree!='undefined'){
        			ztree.reAsyncChildNodes(null, 'refresh');
        			flag=false;
        		}
        	}
        }
        else if(mcSource == "picControlReloadParent"){//reloadParent  方法改造  统一图片管理
           	//curWindow.closePage();
           	//top.util.alert(msg);
           	mcWindow.frames['mainFrame'].location.reload();
           	top.util.alert(msg);
           	
        }
        else if("commAlertMsg" == mcSource){//报表新增错误信息
        	curWindow.closePage();
        	top.alterWindows(msg,5);
        	mcWindow.frames['mainFrame'].location.reload();
        	var flag=true;
        	if(mcWindow.frames['leftFrame']!=null){
        		var ztree=mcWindow.frames['leftFrame'].$.fn.zTree.getZTreeObj('index_tree');
        		if(ztree!=null && ztree!='undefined'){
        			ztree.reAsyncChildNodes(null, 'refresh');
        			flag=false;
        		}
        	}
        }else if(mcSource == "reloadTree"){//reloadTree  报表模型--发布报表
        	curWindow.closePage();
        	top.util.alert(msg);
        	mcWindow.frames['mainFrame'].location.reload();
        	var type = "<c:out value='${type}' />";
        	var mapJakcson = "<c:out value='${mapJakcson}' />";
        	try {
        		mapJakcson = mapJakcson.replace(/&#034;/g,'"');
            	if(mcWindow.frames['leftFrame']){
            		mcWindow.frames['leftFrame'].actionIs(type,mapJakcson);
            	}
			} catch (e) {
			
			}
        }else if(mcSource == "classManage"){ //业务模型   类管理 修改
        	 var module = "<c:out value='${module}' />";
        	if(module){
        		curWindow.closePage();
        		mcWindow.location.reload();
        	}else{
        		curWindow.reloadPgExe("");
        		curWindow.closePage();
            	top.util.alert(msg);
        	}
        }else if(mcSource == "classManageFail"){
        	top.util.alert(msg);
        }
        else if(mcSource == "userEmail"){ //数据交互  邮件服务  新增修改    没有树结构
        	curWindow.closePage();
        	top.util.alert(msg);
        	mcWindow.location.reload();
        }else if(mcSource == "delSearch" || mcSource == "editSearch" || mcSource == "cfgFunc" || mcSource == "delFunc"){
        	top.util.alert(msg);
           	mcWindow.location.reload();
        }else if(mcSource == "delView" || mcSource == "delBussModel" ){
        	 top.util.alert(msg);
             mcWindow.frames['mainFrame'].location.reload();
        }else if(mcSource == "reloadLeftTree"){
        	 curWindow.closePage();
              top.util.alert(msg);
              mcWindow.frames['mainFrame'].location.reload();
              var json = '${mapJakcson}';
              if(mcWindow.frames['leftFrame']){
            	  mcWindow.frames['leftFrame'].actionIs("${type}" ,json);
              }
              var addPublishFunc = "${addPublishFunc}";
			  if(!addPublishFunc){
				  mcWindow.frames['leftFrame'].actionIs("${type}" ,json); 
			  }
        }else if(mcSource == "delBussModelF"){
        	  top.util.alert(msg);
        }else if(mcSource == "defFormui"){
        	 var uiName = "<c:out value='${uiName}' />";
             var uiId = "<c:out value='${uiId}' />";
        	 curWindow.closePage();
        	 $("#paraMap_SEARCH_UI",mcWindow.document).val(uiId);
        	 $("#paraMap_SEARCH_UI_NAME",mcWindow.document).val(uiName);
        }else if(mcSource == "delormcol"){		
        	var mid = "<c:out value='${mid}' />";
        	var ormid = "<c:out value='${ormid}' />";	
        	        	
        	var url = "${path}sys/BussModelAction_forEditOrm.ms?paraMap.MID="+mid+"&paraMap.ORMID="+ormid;
        	
			mcWindow.location.href=url;
		
        }else if(mcSource =="addViewFail"){
        	top.util.alert(msg);
        }else if(mcSource=="addMcModel" || mcSource=="commPage"|| mcSource=="commClass"){
        	var treeTid = "<c:out value='${treeTid}' />";
        	try {
        		curWindow.closePage();
            	top.util.alert(msg);
            	mcWindow.frames['mainFrame'].location.reload();
            	if(mcWindow.frames['leftFrame']){
            		mcWindow.frames['leftFrame'].actionIs(treeTid);
            	}
			} catch (e) {
				top.util.alert(msg);
            	mcWindow.frames['mainFrame'].location.reload();
            	if(mcWindow.frames['leftFrame']){
            		mcWindow.frames['leftFrame'].actionIs(treeTid);
            	}
			}
        }
        
        
        
			</script>
</html>
