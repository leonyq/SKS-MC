
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><c:out value='${title}' /></title>
<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="zTree" value="1" />
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		
	</jsp:include>
<link
	href="${path}plf/page/common/msui/css/css_tab.css?_mc_res_version=<%=PlfStaticRes.CSS_TAB_CSS %>"
	rel="stylesheet" type="text/css" />
<style type="text/css">
html,body,#container {
	height: 100%;
	width: 100%;
}

body {
	overflow: hidden;
}
            
            #a{
            	height:30px;
            	position: relative;
            	margin-top: 5px;
            }
            
            #a input{
            	height:80%;
            	width:100%;
            	box-sizing:border-box;
            
            }
            
            #number{
            	position:absolute;
            	right:24px;
            	top:1px;
            }
            
            #a span{
            	 position:absolute;
            	width:20px;
            	height:15px;
            	background-image: url('${path}plf/page/fp/img/icon/search_up.png');
            	right:-2px;
            	top:2px;
            	background-repeat:no-repeat;
            	background-size:86% 68%;
            }
            
            
            #a span:nth-of-type(2){
            	background-image: url('${path}plf/page/fp/img/icon/search_down.png');
            	top:13px;
            	 background-repeat:no-repeat;
            	 background-size:80% 60%;
            }
            

            
</style>
<script type="text/javascript">
var exportModule = {};
util.showTopLoading("数据加载中 请稍后。。。。")
</script>
</head>
<body style="height: 100%;width: 100%">
	<div class="crumbs" id="crumbs" style="margin:5px 0px 0px 37px;">
    </div>
	<script type="text/javascript">
		
	</script>
	<DIV id=container>

		<div style="clear: both;"></div>
		
		<DIV class=content1 id=content
			style="width: 100%;height:calc(100% - 28px)">
			<DIV id="content1" style="height: 90%">
				<div id="iframe1" style="display: block;height: 90%;">
					<%-- 模块树形列表 --%>
					<div class="iframe1_left" id="module_tree"
						style="width: 250px;float: left;height: 100%">
						<!--  <h3 class="moduleTitle">对外接口</h3>-->
						</br>
						<div>
						
						<!--  接口类型:
						<s:select label="类型" headerKey="-1" headerValue="-请选择-" list="typelist"   
						cssStyle="width:100px" onchange="change(this)" 
						listKey="value" listValue="name" />
						-->
						
						<div  class="add_table_div">
						<form id="add_form" name="addForm" class="layui-form" >
						<select lay-filter="change" >
							<s:iterator value="typelist" status="index">
								<s:if test="${value} == '1'">
									<option value="<s:property value="value" />" selected="selected" ><s:property value="name" /></option>
								</s:if>
						        <s:else>
						            <option value="<s:property value="value" />" ><s:property value="name" /></option>
						        </s:else>
								
							</s:iterator>
						</select>
						</form>
						</div>
						
						</div>
						</br>
						<div id="index_tree" class="ztree" style="overflow: auto;height:calc(100% - 65px);box-sizing: border-box;"> 
							
						</div>
					</div>
					<%-- 模块详情 --%>
					<div class="iframe1_right" id="module_detail"
						style="width:calc(100% - 285px);height: 100%;float: right;">
						<iframe name="detailFrame" id="detailFrame" width="100%" height="100%" src="<%=CommMethodMc.getMainFrameUrl(request)%>">
							
						</iframe>
					</div>
						<div class="ptop_10 txac">
								<input id="nextButton"type="button" value="<dict:lang value="完成" />"  onclick="save(this);" class="layui-btn">
						
								<input id="upButton"type="button" value="<dict:lang value="上一步" />"  onclick="up(this);" class="layui-btn layui-btn-warm">
								<input id="nextButton"type="button" value="<dict:lang value="下一步" />"  onclick="next(this);" class="layui-btn layui-btn-warm">
						</div>
					<div style="clear: both;"></div>
				</div>
			</DIV>

	
		</DIV>
		<div style="display: none;">
				<form action="${path}sys/moduleMagAction_commClass.ms" id="submitForm" method="post" target="submitFrame1">
				
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				
				<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
				<s:hidden id="MODEL_NAME" name="paraMap.MODEL_NAME"></s:hidden>
				<s:hidden id="MODEL_SHOW_NAME" name="paraMap.MODEL_SHOW_NAME"></s:hidden>
				<s:hidden id="MODEL_VERSION" name="paraMap.MODEL_VERSION"></s:hidden>
				<s:hidden id="MODELS_NAME" name="paraMap.MODELS_NAME"></s:hidden>
				<s:hidden id="MODEL_TYPE" name="paraMap.MODEL_TYPE"></s:hidden>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:textarea id="MODEL_MEMO" name="paraMap.MODEL_MEMO"  cssStyle="display:none;word-wrap: normal;" wrap="off"></s:textarea>
				<s:hidden id="MODEL_START_ORDER" name="paraMap.MODEL_START_ORDER"></s:hidden>
				<s:hidden id="MODEL_DATABASE" name="paraMap.MODEL_DATABASE"></s:hidden>
				<s:hidden id="codeType" name="paraMap.paraCodeType"/>
				<s:hidden id="paraCodeId" name="paraMap.paraCodeId"/>
				<s:hidden id="className" name="paraMap.paraCodeName"/>
				<s:textarea id="classCode" name="paraMap.paraClsCode" value="%{paraMap.paraClsCode}" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:hidden id="MC_ID_MYSQL" name="paraMap.MC_ID_MYSQL" />
				<s:hidden id="MC_ID_SQLSERVER" name="paraMap.MC_ID_SQLSERVER" />
				<s:hidden id="MC_ID_ORACLE" name="paraMap.MC_ID_ORACLE" />
				<s:hidden id="MC_ID_BASE" name="paraMap.MC_ID_BASE" />
				<s:hidden id="MC_ID_PG" name="paraMap.MC_ID_PG"  />
				<s:hidden id="PAGE_ORDER" name="paraMap.PAGE_ORDER"/>
				</form>
				<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>
		</div>

	</DIV>
	<script type="text/javascript">
	var exportModule={};
	var wbsFlag=false;
	function init(){
		var em=$("#exportModule").val();
		for(key in exportModule) {
					if(key.indexOf("cls") != 0 && key.indexOf("page") != 0 && key.indexOf("file") != 0 && key.indexOf("jar") != 0) {
						var moduleDetailArr =exportModule[key]
						for(var i=0; i<moduleDetailArr.length; i++) {
							if(moduleDetailArr[i].source == "dingshi") {
								delete exportModule[key];
							}
						}
					}
		}
		if(em!=""){
			exportModule=JSON.parse(em);
 			for(key in exportModule) {
 				
				if(key.indexOf("websId") == 0)
				{
					
					wbsFlag=true;
					var ids="";
					var timearray = exportModule[key];
						for(var i=0; i<timearray.length; i++) {
							ids+=timearray[i].id+',';
						}
						if(ids!=null)
						{
							ids = ids.substr(0, ids.length - 1);  
						}
						$.ajax({
						type: "POST",
					    dataType: "json",
					  	url: "${path}sys/moduleMagAction_getWSCient.ms?paraMap.dingshi="+ids,
						success: function(data){
							var arr=data.ajaxList;
							for(var j = 0,len = arr.length; j < len; j++)
							{
								var tag=false;
								for(key in exportModule) {
					
										if(key.indexOf("cls") != 0 && key.indexOf("page") != 0 && key.indexOf("file") != 0 && key.indexOf("jar") != 0) {
									
										var moduleDetailArr = exportModule[key];
										
										if(containBussDetail(moduleDetailArr, arr[j].ID)) {
											tag=true;
											break;
										}}
									
									}
									if(!tag)
									{
											if(!exportModule[arr[j].UP_ID]) {
												exportModule[arr[j].UP_ID] = [];
											}
											var m_name=arr[j].MC_MODULE_NAME;
											if(m_name==null||m_name=="null")
											{
												m_name="";
											}else
											{
												m_name=arr[j].MC_MODULE_NAME;
											}
															exportModule[arr[j].UP_ID].push({
															"name":arr[j].MODEL_NAME,
															"id":arr[j].ID,
															"interfaceid":arr[j].INTERFACEID,
															"type":"inter",
															"modType":"inter",
															"flag":arr[j].FLAG,
															"source":"dingshi",
															"moduleName":m_name
											});
									}
							}
					    },
							error: function(msg){
									if(msg.responseText!=null && msg.responseText!=''){
						                top.util.alert("error:"+msg.responseText);
						            }
							  }
						}); 
				}
			}
 			if(!wbsFlag){
				for(key in exportModule) {
					
					if(key.indexOf("cls") != 0 && key.indexOf("page") != 0 && key.indexOf("file") != 0 && key.indexOf("jar") != 0) {
						var moduleDetailArr =exportModule[key]
						for(var i=0; i<moduleDetailArr.length; i++) {
							if(moduleDetailArr[i].source == "dingshi") {
								delete exportModule[key];
							}
						}
					}
				}
 			}


			//alert(exportModule);
		}
	}
	var currentOrder=9;
			$(function(){
				 var PAGE_ORDER=$("#PAGE_ORDER").val();
					var html="<ul>";
			  		var countPage=0;
			  		if(PAGE_ORDER!=""){
			  			var pageorders=PAGE_ORDER.split(",");
			  				if(pageorders.length!=11){
			  					if(pageorders.length==currentOrder-1){//从前一个页面进入 
			  						for(var i=0;i<pageorders.length;i++){
			  							pagename=null;
			  							pageName(pageorders[i])
			  							if(pageorders[i]==1){//当前为1时
			  								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
			  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  					            "<div class=\"line\"></div>"+
			  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  					            continue;
			  					         }
			  							if(pageorders[i]==currentOrder){//当前为1时
			  								html+="<li class=\"doing\"> <div class=\"line transparent\"></div>"+
			  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  					            "<div class=\"line\"></div>"+
			  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			  								continue;
			  							}else{
			  									html+="<li class=\"done\"> <div class=\"line\"></div>"+
			  						            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  						            "<div class=\"line line_right\"></div>"+
			  						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  						            continue;
			  							}
			  				       	}
			  						pageName(currentOrder)
			  						html+="<li class=\"doing\"> <div class=\"line\"></div>"+
			  			            "<div class=\"num\">"+currentOrder+"</div>"+
			  			            "<div class=\"line\"></div>"+
			  			            "<div class=\"text\"><a>"+pagename+"</a></div></li>";
			  						$("#PAGE_ORDER").val("1,2,3,4,5,6,7,8,9");
			  						countPage=2
			  					}else if(pageorders.length==currentOrder){
			  						for(var i=0;i<pageorders.length;i++){
			  							pagename=null;
			  							pageName(pageorders[i])
			  							if(pageorders[i]==1){//当前为1时
			  								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
			  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  					            "<div class=\"line\"></div>"+
			  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  					            continue;
			  					         }
			  							if(pageorders[i]==currentOrder){//当前为1时
			  								html+="<li class=\"doing\"> <div class=\"line\"></div>"+
			  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  					            "<div class=\"line\"></div>"+
			  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			  								continue;
			  							}else{
			  									html+="<li class=\"done\"> <div class=\"line\"></div>"+
			  						            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  						            "<div class=\"line line_right\"></div>"+
			  						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  						            continue;
			  							}
			  				       	}
			  						countPage=1
			  					}else{
			  						for(var i=0;i<pageorders.length;i++){
			  							pagename=null;
			  							pageName(pageorders[i])
			  							if(pageorders[i]==1){//当前为1时
			  								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
			  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  					            "<div class=\"line\"></div>"+
			  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  					            continue;
			  					         }
			  							if(pageorders[i]==currentOrder){//当前为1时
			  								html+="<li class=\"doing\"> <div class=\"line\"></div>"+
			  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  					            "<div class=\"line\"></div>"+
			  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			  								continue;
			  							}else{
			  									html+="<li class=\"done\"> <div class=\"line\"></div>"+
			  						            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  						            "<div class=\"line line_right\"></div>"+
			  						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  						            continue;
			  							}
			  				       	}
			  						countPage=1
			  					}
			  					for(var j=pageorders.length+countPage;j<12;j++){
			  							pagename=null;
			  							pageName(j)
			  							if(j==11){
			  								html+="<li class=\"undone\"> <div class=\"line\"></div>"+
			  					            "<div class=\"num\">"+j+"</div>"+
			  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			  					            continue;
			  							}else{
			  								html+="<li class=\"undone\"> <div class=\"line\"></div>"+
			  					            "<div class=\"num\">"+j+"</div>"+
			  					            "<div class=\"line\"></div>"+
			  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			  					            continue;
			  							}
			  					}
			  			}else{
			  				for(var i=0;i<pageorders.length;i++){
			  						pagename=null;
			  						pageName(pageorders[i])
			  						if(pageorders[i]==1){//当前为1时
			  							html+="<li class=\"done\"> <div class=\"line transparent\"></div>"+
			  				            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  				            "<div class=\"line\"></div>"+
			  				            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  							continue;
			  						}
			  						if(pageorders[i]==currentOrder){//当前为1时
			  							html+="<li class=\"doing\"> <div class=\"line\"></div>"+
			  				            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  				            "<div class=\"line\"></div>"+
			  				            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			  							continue;
			  						}else if(i==pageorders.length-1){
			  								html+="<li class=\"done\"> <div class=\"line\"></div>"+
			  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  					            continue;
			  						}else{
			  								html+="<li class=\"done\"> <div class=\"line\"></div>"+
			  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
			  					            "<div class=\"line\"></div>"+
			  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
			  					            continue;
			  						}
			  	            }
			  			}
			  			html+="</ul>";
			  		}
			          
			  		$("#crumbs").html(html);
			
		});
			function pageName(order){
				if(order==1){
					pagename="模块基本信息"	 
				}else if(order==2){
					pagename="模块依赖关系" 
				}else if(order==3){
					pagename="模块菜单" 
				}else if(order==4){
					pagename="业务模型" 
				}else if(order==5){
					pagename="公用页面"; 
				}else if(order==6){
					pagename="公用类" 
				}else if(order==7){
					pagename="静态资源" 
				}else if(order==8){
					pagename="触发器" 
				}else if(order==9){
					pagename="对外接口" 
				}else if(order==10){
					pagename="多语言" 
				}else if(order==11){
					pagename="数据字典" 
				}
			}
			function pageGo(order,pagename){
					var url=null;
					if(order==1){
					url="${path}sys/moduleMagAction_moduleName.ms";
					}else if(order==2){
					url="${path}sys/moduleMagAction_moduleType.ms";
					}else if(order==3){
					url="${path}sys/moduleMagAction_moduleFunc.ms";
					}else if(order==4){
					url="${path}sys/moduleMagAction_bussExport.ms";
					}else if(order==5){
					url="${path}sys/moduleMagAction_pageExport.ms";
					}else if(order==6){
					url="${path}sys/moduleMagAction_classExport.ms";
					}else if(order==7){
					url="${path}sys/moduleMagAction_moduleSourceExport.ms";
					}else if(order==8){
					url="${path}sys/moduleMagAction_trigTree.ms";
					}else if(order==9){
					url="${path}sys/moduleMagAction_interIframe.ms";
					}else if(order==10){
					url="${path}sys/moduleMagAction_languageExport.ms";
					pagename="多语言";
					}else if(order==11){
					url="${path}sys/moduleMagAction_dictExport.ms";
					}
					$("#exportModule").val(JSON.stringify(exportModule));
					document.getElementById("submitForm").target="";
					document.getElementById("submitForm").action=url;
					document.forms.submitForm.submit();
			}	
	</script>
	
	
<%--选择模块js--%>

	<script>
	

	var isChange=false;
	function changeModuleExportType() {
		loadModuleListbyztree();
		window.frames.detailFrame.location.href="<%=CommMethodMc.getMainFrameUrl(request)%>";
		var zTree = $.fn.zTree.getZTreeObj("index_tree");  
		document.getElementById("number").innerHTML="";  
		$("#key").val("");  
	    zTree.cancelSelectedNode();
	    nodeList = [];
	    document.getElementById("key").focus();
	    isChange=true;
	}
		var typeFlag=-1;
		function change(obj)
	{
		var v = $(obj).children('option:selected').val();
		
		if(v>0)
		{
			typeFlag=v;
			loadModuleListbyztree();
			window.frames.detailFrame.location.href="<%=CommMethodMc.getMainFrameUrl(request)%>";
		}else
		{
			
			$("#index_tree").html("");
			window.frames.detailFrame.location.href="<%=CommMethodMc.getMainFrameUrl(request)%>";
		}
	}
		function tonclick(id,cid){ //id = "id_type"
			var MID = "";
			var type = "";
			var moduleExportType = $("#moduleExportType").val();
			if(typeof (this.getUserData(id,"MID")) !='undefined'){
				MID=this.getUserData(id,"MID");
			}
			
			if(typeof (this.getUserData(id,"autoLoadAction")) !='undefined'){
				type=this.getUserData(id,"autoLoadAction");
			}
			
			if(undefined == tree.getUserData(id,"actionMethod")){
				return;
			}
			
			var moduleName = tree.getItemText(id);
			var url = "${path}"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.treeID="+id+"&paraMap.type="+type+"&moduleExportType=" + moduleExportType+"&paraMap.moduleName="+moduleName;
			window.detailFrame.location.href= url;
			
		}

		var tree= null;
				//包含业务模型子集
	function containBussDetail(arr,obj) {
		for(var i=0; i<arr.length; i++) {
			if(arr[i].id == obj) {
				arr[i].source="dingshi"
				return true;
			}
		}
		
		return false;
	}
		function initTree() {
			$("#index_tree").html("");s
			tree = new dhtmlXTreeObject("index_tree","100%","100%","-1");
			//tree.setXMLAutoLoading("${path}sys/BussModelAction_");//该功能树为一次性加载，不需要设置该方法
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_scbrblue/");
			tree.setOnClickHandler(tonclick);
			
<%--			tree.enableDragAndDrop(true);--%>
<%--			tree.attachEvent("onDrag", function(sId,tId,id,sObject,tObject){--%>
<%--				if(sObject.hasChildren(sId) == 0){--%>
<%--					alert("<dict:lang value="模型不能拖拽"/>");--%>
<%--					return false;--%>
<%--				}--%>
<%--				var r = confirm("<dict:lang value="确定移动该目录吗？"/>");--%>
<%--				if(r){--%>
<%--					return updateDragData(sId,tId);--%>
<%--				}else{--%>
<%--					return false;--%>
<%--				}--%>
<%--			});--%>
		}
		
		
<%--		//tree.loadXMLString("${treeXml}"); --%>
		
		function updateDragData(sId,tId){
			var flag = true;
			var data = {"paraMap.sId":sId,"paraMap.tId":tId,"paraMap.treeDataType":"modelTree"};
			$.ajax({
			    type: "POST",
				dataType: "json",
		        url: "${path}sys/BussModelAction_updateTreeDragDataAx.ms",
		        data:data,
			    success: function(data){
				    var status = data.ajaxString;
				    if(status == "0"){
				    	flag = false;
				    }
				},
				error: function(XMLHttpRequest,textStatus,errorThrown){
					flag = false;
				}
		    });
			return flag;
		}
		
		
		
		//加载模块列表
		function loadModuleList() {
			$.post("${path}sys/BussModelAction_listModule.ms",{moduleExportType:$("#moduleExportType").val()},function(data) {
				initTree();
				tree.loadXMLString(data.ajaxString);
								
			});
		}
		
		
	
		function zTreeOnClick(event, treeId, treeNode) {
			//mid-id
			//autoLoadAction-add1
			//actionMethod-add2
			
			var id=treeNode.id;
		
			var MID = "";
			var type = "";
			var moduleExportType = $("#moduleExportType").val();
			
			//if(typeof (this.getUserData(id,"MID")) !='undefined'){
			//	MID=this.getUserData(id,"MID");
			//}
			MID=id;
			
			//if(typeof (this.getUserData(id,"autoLoadAction")) !='undefined'){
			//	type=this.getUserData(id,"autoLoadAction");
			//}
			type=treeNode.add1;
			
			//if(undefined == tree.getUserData(id,"actionMethod")){
			//	return;
			//}
			if(treeNode.add2==null || treeNode.add2==''){
				return;
			}
			
			//var moduleName = tree.getItemText(id);
			//var url = "${path}"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.treeID="+id+"&paraMap.type="+type+"&moduleExportType=" + moduleExportType+"&paraMap.moduleName="+moduleName;
			//window.detailFrame.location.href= url;
			
			var moduleName = treeNode.name;
			var url = "${path}"+treeNode.add2+"?paraMap.MID="+MID+"&paraMap.treeID="+id+"&paraMap.type="+type+"&moduleExportType=" + moduleExportType+"&paraMap.moduleName="+moduleName;
			//alert(url);
			window.detailFrame.location.href= url;
			
		};
		//ztree部分
		var setting = {
			data: {
				simpleData: {
					enable: true,
					pIdKey: "upId"
				}
			},
			callback: {
				onClick: zTreeOnClick
			}
		};
	function up(){
		document.getElementById("submitForm").target="";
		$("#exportModule").val(JSON.stringify(exportModule));
		document.getElementById("submitForm").action="${path}sys/moduleMagAction_trigTree.ms"
		document.forms.submitForm.submit();
	}
	function save()
	{
		document.getElementById("submitForm").target="submitFrame1";
		$("#exportModule").val(JSON.stringify(exportModule));
		var MODEL_ID=$("#MODEL_ID").val();
		if(MODEL_ID!=null&&MODEL_ID!=""){
			document.getElementById("submitForm").action="${path}sys/moduleMagAction_modifyModule.ms";
		}else{
			document.getElementById("submitForm").action="${path}sys/moduleMagAction_saveModule.ms";
		}
		
		document.getElementById("curIframeName").value=window.frameElement.name;
		
		document.forms.submitForm.submit();
	}
	function next(){
		document.getElementById("submitForm").target="";
		$("#exportModule").val(JSON.stringify(exportModule));
		document.getElementById("submitForm").action="${path}sys/moduleMagAction_languageExport.ms"
				
		document.forms.submitForm.submit();
	}
		//加载模块列表 ztree
		function loadModuleListbyztree() {
		
			$("#index_tree").html("");
			$.ajax({
				type: "POST",
			    dataType: "json",
			  	url: "${path}sys/moduleMagAction_interfaceTree.ms?paraMap.typeFlag="+typeFlag,
				success: function(data){
					if(data){
						var tree=$.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
						
						var node = tree.getNodeByTId("tree_1");
							tree.expandNode(node, true, false, true);
						
						
					}
			    },
				error: function(msg){
						if(msg.responseText!=null && msg.responseText!=''){
			                top.util.alert("error:"+msg.responseText);
			            }
				  }
			});
			
		}
		  
	</script>
	
	<script type="text/javascript">
	//移除模块
	function removeModule() {
		
		var win = window.selectFrame;
		if($(win.document).find("input[name='id'][type='checkbox']:checked").length == 0) {
			window.util.alert("<dict:lang value="请至少选择一条记录移除"/>");
			return ;
		} 
		$(win.document).find("input[name='id'][type='checkbox']:checked").each(function(i,e){
			var type = e.value.split("_")[1];
			var id = e.value.split("_")[0];
			
			if( type == "orm" || type == "form" || type == "view" || type == "class") {
				var key = e.value.split("_")[2];
				var arr = exportModule[key];
				for(var j=0;j<arr.length;j++) {
					if(id == arr[j].id && type == arr[j].type) {
						//删除
						arr.splice(j,1);
						break;
					}
				}
				if(arr.length == 0) {
					delete exportModule[key];
				}
			}else if(type == "cls") {
				var arr = exportModule.cls;
				for(var j=0;j<arr.length; j++) {
					if(id == arr[j].id) {
						arr.splice(j,1);
						break;
					}
				}
				
				if(arr.length == 0) {
					delete exportModule.cls;
				}
				
			}else if(type == "page") {
				var arr = exportModule.page;
				for(var j=0;j<arr.length; j++) {
					if(id == arr[j].id) {
						arr.splice(j,1);
						break;
					}
				}
				if(arr.length == 0) {
					delete exportModule.page;
				}
			}
		});
		window.frames.detailFrame.location.reload();
		alreadySelectModule();
	};
	
	// 导出模块
	function moduleExport() {
		var flag = false;
		for(key in exportModule) {
			flag = true;
			break;
		}
		
		if(!flag) {
			window.util.alert("<dict:lang value="导出模块列表为空，请选择"/>");
			return;
		}
		document.getElementById("exportJson").value = JSON.stringify(exportModule);
		document.forms.exportForm.submit();
	}
	
	//已选模块
	function alreadySelectModule() {
		//showRightBtn();
		window.selectFrame.location.href = "${path}plf/page/bussmodel/selectModule.jsp";
		//hideMainFrameSet();
	}
	</script>
</body>

<script language="javascript">
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	$(function(){
		typeFlag='2';
		loadModuleListbyztree();
		layui.use('form', function(){
	    	  form = layui.form;
	    	  
	    	  form.on('select(change)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				change(data.elem);
			
		 	});
		 	
	           
		    });
	
	});
	    
</script>
<%@ include file="/plf/common/pub_end.jsp"%>