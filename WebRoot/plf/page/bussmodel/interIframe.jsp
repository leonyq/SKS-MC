
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
</script>
</head>
<body style="height: 100%;width: 100%">

	<script type="text/javascript">
		
	</script>
	<DIV id=container>

		<div style="clear: both;"></div>
		
		<DIV class=content1 id=content
			style="width: 100%;height:calc(100% - 28px)">
			<DIV id="content1" style="height: 100%">
				<div id="iframe1" style="display: block;height: 100%;">
					<%-- 模块树形列表 --%>
					<div class="iframe1_left" id="module_tree"
						style="width: 250px;float: left;height: 100%">
						<h3 class="moduleTitle">对外接口</h3>
						<div>接口类型:<s:select label="类型" headerKey="-1" headerValue="-请选择-" list="typelist"   cssStyle="width:100px" onchange="change(this)" listKey="value" listValue="name" /></div>
						<div id="index_tree" class="ztree" style="overflow: auto;height:calc(100% - 65px);box-sizing: border-box;"> 
							
						</div>
					</div>
					<%-- 模块详情 --%>
					<div class="iframe1_right" id="module_detail"
						style="width:calc(100% - 255px);height: 100%;float: right;">
						<iframe name="detailFrame" id="detailFrame" width="100%" height="100%" src="<%=CommMethodMc.getMainFrameUrl(request)%>">
							
						</iframe>
					</div>
					<div style="clear: both;"></div>
				</div>
			</DIV>

	
		</DIV>
		<div style="display: none;">
				<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>
		</div>

	</DIV>
	
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
		}
		
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
			
			var id=treeNode.id;
		
			var MID = "";
			var type = "";
			var moduleExportType = $("#moduleExportType").val();
			
			MID=id;
			type=treeNode.add1;
			if(treeNode.add2==null || treeNode.add2==''){
				return;
			}
			
			var moduleName = treeNode.name;
			var url = "${path}"+treeNode.add2+"?paraMap.MID="+MID+"&paraMap.treeID="+id+"&paraMap.type="+type+"&moduleExportType=" + moduleExportType+"&paraMap.moduleName="+moduleName;
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
						tree.expandAll(true);
					}
			    },
				error: function(msg){
						util.alert("error:"+msg.responseText);
				  }
			});
			
		}
		  
	</script>
	
	<script type="text/javascript">
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
	
	</script>
</body>

<script language="javascript">
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
</script>
<%@ include file="/plf/common/pub_end.jsp"%>