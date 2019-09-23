
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title>${title}</title>
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

#a {
	height: 30px;
	position: relative;
	margin-top: 5px;
}

#a input {
	height: 80%;
	width: 100%;
	box-sizing: border-box;
}

#number {
	position: absolute;
	right: 24px;
	top: 1px;
}

#a span {
	position: absolute;
	width: 20px;
	height: 15px;
	background-image: url('${path}plf/page/fp/img/icon/search_up.png');
	right: -2px;
	top: 2px;
	background-repeat: no-repeat;
	background-size: 86% 68%;
}

#a span:nth-of-type(2) {
	background-image: url('${path}plf/page/fp/img/icon/search_down.png');
	top: 13px;
	background-repeat: no-repeat;
	background-size: 80% 60%;
}
</style>
</head>
<script type="text/javascript">
	util.showTopLoading("数据加载中 请稍后。。。。")
</script>
<body style="height: 100%;width: 100%" onload="init()">
	<div style="display: hidden">
		<form id="exportForm" action="${path}sys/BussModelAction_exportMod.ms"
			method="post" target="submitFrame">
			<input type="hidden" id="exportJson" value="" name="paraMap.input">
		</form>
	</div>
		<div class="crumbs" id="crumbs" style="margin:5px 0px 0px 37px;">
    </div>
	<div id=container>
		<div class=content1 id=content
			style="width: 100%;height:calc(100% - 28px)">
			<div id="content1" style="height: 100%">
				<div id="iframe1" style="height: 85%;">
					<%-- 模块树形列表 --%>
					<div class="iframe1_left" id="module_tree"
						style="width: 250px;float: left;height: 100%">
						<h3 class="moduleTitle">触发器模型</h3>
						<div id="index_tree" class="ztree"
							style="overflow: auto;height:calc(100% - 65px);box-sizing: border-box;">
						</div>
					</div>

					<%-- 模块详情 --%>
					<div class="iframe1_right" id="module_detail"
						style="width:calc(100% - 255px);height: 100%;float: right;">
						<iframe name="detailFrame" id="detailFrame" width="100%"
							height="100%" src="<%=CommMethodMc.getMainFrameUrl(request)%>">
						</iframe>
					</div>
					<div class="ptop_10 txac">
					
						<input id="nextButton" type="button" value="<dict:lang value="完成" />"  onclick="save(this);" class="layui-btn">
						<input id="upButton" type="button" value="<dict:lang value="上一步" />" onclick="up(this);" class="layui-btn layui-btn-warm"> 
						<input id="nextButton" type="button" value="<dict:lang value="下一步" />" onclick="next(this);" class="layui-btn layui-btn-warm">

					</div>
					<div style="clear: both;"></div>
				</div>
			</div>

		</div>
		<div style="display: none;">
			<form action="${path}sys/moduleMagAction_commClass.ms"
				id="submitForm" method="post" target="submitFrame1">
				
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				
				<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
				<s:hidden id="MODEL_NAME" name="paraMap.MODEL_NAME"></s:hidden>
				<s:hidden id="MODEL_SHOW_NAME" name="paraMap.MODEL_SHOW_NAME"></s:hidden>
				<s:hidden id="MODEL_VERSION" name="paraMap.MODEL_VERSION"></s:hidden>
				<s:hidden id="MODELS_NAME" name="paraMap.MODELS_NAME"></s:hidden>
				<s:hidden id="MODEL_TYPE" name="paraMap.MODEL_TYPE"></s:hidden>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:textarea id="MODEL_MEMO" name="paraMap.MODEL_MEMO"
					cssStyle="display:none;word-wrap: normal;" wrap="off"></s:textarea>
				<s:hidden id="MODEL_START_ORDER" name="paraMap.MODEL_START_ORDER"></s:hidden>
				<s:hidden id="MODEL_DATABASE" name="paraMap.MODEL_DATABASE"></s:hidden>
				<s:hidden id="codeType" name="paraMap.paraCodeType" />
				<s:hidden id="paraCodeId" name="paraMap.paraCodeId" />
				<s:hidden id="className" name="paraMap.paraCodeName" />
				<s:textarea id="classCode" name="paraMap.paraClsCode"
					value="%{paraMap.paraClsCode}"
					cssStyle="display:none;word-wrap: normal;" wrap="off" />
				<s:hidden id="MC_ID_MYSQL" name="paraMap.MC_ID_MYSQL" />
				<s:hidden id="MC_ID_SQLSERVER" name="paraMap.MC_ID_SQLSERVER" />
				<s:hidden id="MC_ID_ORACLE" name="paraMap.MC_ID_ORACLE" />
				<s:hidden id="MC_ID_BASE" name="paraMap.MC_ID_BASE" />
				<s:hidden id="MC_ID_PG" name="paraMap.MC_ID_PG" />
				<s:hidden id="PAGE_ORDER" name="paraMap.PAGE_ORDER"/>
			</form>
			<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>
		</div>
	</div>
	<script type="text/javascript">
		var exportModule = {};
		function init() {
			var em = $("#exportModule").val()
			if (em != "") {
				exportModule = JSON.parse(em);
			}
			util.closeTopLoading();
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
		var currentOrder=8;
		$(function() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "${path}sys/moduleMagAction_trigTreeList.ms",
				success : function(data) {
					//exportModule.bussType=[]
<%--					if (selectId != 'null') {--%>
<%--						var node = zTreeObj.getNodeByParam("id", selectId);--%>
<%--						zTreeObj.checkNode(node, true, true);--%>
<%--						var parent = node.getParentNode();--%>
<%--						if (parent != null) {--%>
<%--							if (!parent.open) {--%>
<%--								zTreeObj.expandNode(parent, true, true);--%>
<%--							}--%>
<%--						}--%>
<%--					}--%>
					if(data){
						$.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
						var zTree = $.fn.zTree.getZTreeObj("index_tree");  
						
						var node = zTree.getNodeByTId("tree_1");
							zTree.expandNode(node, true, false, true);
						
						
						for( keys in exportModule){
							var arr = exportModule[keys]; //模块
							var node = zTree.getNodeByParam("id", keys, null);
							if(node!=null){
							 zTree.selectNode(node,false );
							 zTree.setting.callback.onClick(null, zTree.setting.treeId, node);//触发函数
							 }
						}
					}
				},
				error : function(msg) {
					util.closeLoading();
					util.alert("error:" + msg);
				}
			});
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
		})
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
					}else if(order==11){
					url="${path}sys/moduleMagAction_dictExport.ms";
					}
					$("#exportModule").val(JSON.stringify(exportModule));
					document.getElementById("submitForm").target="";
					document.getElementById("submitForm").action=url;
					document.forms.submitForm.submit();
			}	
		function up() {
			document.getElementById("submitForm").target="";
			$("#exportModule").val(JSON.stringify(exportModule));
			document.getElementById("submitForm").action = "${path}sys/moduleMagAction_moduleSourceExport.ms"
			document.forms.submitForm.submit();
		}
		function next() {
			document.getElementById("submitForm").target="";
			$("#exportModule").val(JSON.stringify(exportModule));
			document.getElementById("submitForm").action = "${path}sys/moduleMagAction_interIframe.ms"
			document.forms.submitForm.submit();
		}
		var isChange = false;
		var tree = null;
		var zTreeObj=null;
		var setting = {
				data: {
					simpleData: {
						enable: true,
						pIdKey: "upId"
					}
				},
				callback: {
					onClick: zTreeOnClick
				}
			};
	
		
		function zTreeOnClick(event, treeId, treeNode){
				var MODELS_NAME=$("#MODELS_NAME").val();
				var MODEL_NAME=$("#MODEL_NAME").val()
				var name=MODELS_NAME+"."+MODEL_NAME
				if(treeNode.id!="0") {
					url = "${path}sys/moduleMagAction_listTrigDetail.ms?paraMap.moduleId=" + treeNode.id+"&paraMap.moduleName="+name;
				}
				detailFrame.location.href= url;
			}
		var zTree = null;
<%--		function zTreeOnClick(event, treeId, treeNode) {--%>
<%--			var zTreesArr = zTree.getCheckedNodes(true);--%>
<%--			var MODELS_NAME = $("#MODELS_NAME").val();--%>
<%--			var MODEL_NAME = $("#MODEL_NAME").val()--%>
<%--			var name = MODELS_NAME + "." + MODEL_NAME--%>
<%--			if (zTreesArr.length > 0) {--%>
<%--				exportModule.bussType = []--%>
<%----%>
<%--				for ( var i = 0; i < zTreesArr.length; i++) {--%>
<%--					if (!zTreesArr[i].children) {//判断不包含子结点--%>
<%--						if (zTreesArr[i].moduleName != undefined--%>
<%--								&& zTreesArr[i].moduleName != name) {--%>
<%--							util.alert("选择" + zTreesArr[i].name + "会导致本模块与"--%>
<%--									+ zTreesArr[i].moduleName + "模块冲突,本模块将无法与"--%>
<%--									+ zTreesArr[i].moduleName + "模块共同安装")--%>
<%--						}--%>
<%--						exportModule.bussType.push({--%>
<%--							"id" : zTreesArr[i].id,--%>
<%--						});--%>
<%--					}--%>
<%--				}--%>
<%--			} else {--%>
<%--				delete exportModule.bussType--%>
<%--			}--%>
<%----%>
<%--		};--%>
		//加载模块列表 ztree
		function loadModuleListbyztree() {
			$("#index_tree").html("");
			$.ajax({
				type : "POST",
				dataType : "json",
				async : true,
				url : "${path}sys/moduleMagAction_trigTreeList.ms",
				success : function(data) {
					if (data) {
						$.fn.zTree.init($("#index_tree"), setting,
								data.ajaxList);
						zTree = $.fn.zTree.getZTreeObj("index_tree");
						var arr = exportModule.bussType; //模块
						var lg = zTree.getNodes();
						if (arr == null || arr == undefined) {
							return;
						}
						var MODELS_NAME = $("#MODELS_NAME").val();
						var MODEL_NAME = $("#MODEL_NAME").val()
						var name = MODELS_NAME + "." + MODEL_NAME
						for ( var i = 0; i < arr.length; i++) {
							var node = zTree.getNodesByParamFuzzy("id",
									arr[i].id);
							if (node != null) {
								if (node[0].moduleName != undefined
										&& node[0].moduleName != name) {
									util.alert("选择" + node[0].name + "会导致本模块与"
											+ node[0].moduleName
											+ "模块冲突,本模块将无法与"
											+ node[0].moduleName + "模块共同安装")
								}
								zTree.selectNode(node[0]);
								zTree.checkNode(node[0], true, true);
							}
						}
					}
				},
				error : function(msg) {
					util.alert("error:" + msg.responseText);
				}
			});

		}

		function _dynIframesize() {
			var tabIndex = 1;
			if (null != currentTag && "" != currentTag) {
				tabIndex = currentTag.substr(3, currentTag.length);
			}
			dynIframesize("iframe" + tabIndex);
		}

		if (window.addEventListener) {
			window.addEventListener("resize", _dynIframesize, false);
		} else {
			if (window.attachEvent) {
				window.attachEvent("onresize", _dynIframesize);
			} else {
				window.onresize = _dynIframesize;
			}
		}
		function alertInfo(msg) {
			isSubmit = false;
			util.alert(msg);
		}
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>