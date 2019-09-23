
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
            	 top:26px;
            	 background-repeat:no-repeat;
            	 background-size:80% 60%;
            }
            .layui-form-select{
                margin-top: 10px;
   				width: 250px;
   				margin-left: 2px;
            }
</style>
<script type="text/javascript">
	var exportModule = {};
</script>
</head>
<body style="height: 100%;width: 100%">
	<div style="display: hidden">
			<form id="exportForm" action="${path}sys/BussModelAction_exportMod.ms" method="post" target="submitFrame">
				<input type="hidden" id="exportJson" value="" name="paraMap.input">
			</form>
	</div>
	<script type="text/javascript">
		
	</script>
		
		
		<DIV id="container">
		<DIV id=title class="mc-tab">
			<UL class="layui-tab-title" style="margin-top: 10px;">
					<LI id="tag1"><A
					onclick="switchTag('tag1','content1','');this.blur();"
					href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="选择模块"/></SPAN> </A></LI>
				<LI id="tag4"><A
					onclick="switchTag('tag4','content4','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="定时器"/></SPAN> </A></LI>
				<LI id="tag5"><A
					onclick="switchTag('tag5','content5','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="对外接口"/></SPAN> </A></LI>
				<LI id="tag6"><A
					onclick="switchTag('tag6','content6','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="多语言"/></SPAN> </A></LI>
				<LI id="tag7"><A
					onclick="switchTag('tag7','content7','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="数据字典"/></SPAN> </A></LI>
				<LI id="tag2"><A
					onclick="switchTag('tag2','content2','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="关联资源"/></SPAN> </A></LI>
				<LI id="tag3"><A
					onclick="switchTag('tag3','content3','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="已选模块"/></SPAN> </A></LI>
			</UL>
		</DIV>
		
		<div id="btn" style="float: right;display: none;margin: 10px 34px 10px 0;">
			<input type="button" class="layui-btn layui-btn-danger" value="<dict:lang value="移除"/>" onclick="removeModule()">
			<input type="button" class="layui-btn" value="<dict:lang value="导出"/>" onclick="moduleExport()">
		</div>
		<div style="clear: both;"></div>
		
		<DIV class=content1 id=content
			style="width: 100%;height:calc(100% - 28px)">
			<DIV id="content1" style="height: 100%">
				<div id="iframe1" style="display: none;height: 100%;">
					<%-- 模块树形列表 --%>
					<div class="iframe1_left" id="module_tree"
						style="width: 250px;float: left;height: 100%">
						<div>
							<form class="layui-form" action="${path}sys/BussModelAction_listModule.ms" id="form">
								<select id="moduleExportType" lay-filter="changeModuleExportType"  name="moduleExportType"
									style="width: 100%;height: 30px;margin: 15px 10px 0 2px;" >
									<option value='1'><dict:lang value="业务模型"/></option>
									<option value='2'><dict:lang value="公用类"/></option>
									<option value='3'><dict:lang value="公用页面"/></option>
								</select>
							</form>
						</div>
						 <div id="a">  
				            <input type="text"  id="key" class="empty form-control layui-input"  placeholder="查询..."  style="width: 100%;box-sizing: border-box;margin: 0 2px 0 2px;"/>  
				        	<span id="clickUp" onclick="clickUp()" style=""></span>
				        	<span id="clickDown"  onclick="clickDown()"></span>
				        	<label id="number"></label>  	
				        </div>  
						<div id="index_tree" class="ztree" style="overflow: auto;height:calc(100% - 100px);box-sizing: border-box;"> 
							
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
			<DIV id="content2" style="height: 100%">
				<div id="iframe2" style="display: none;height: 100%;">
					<iframe name="sourceFrame" id="sourceFrame" width="100%" height="100%" src="${path}plf/page/bussmodel/moduleSourceExport.jsp"></iframe>
				</div>
			</DIV>

			<DIV id="content3" style="height: 100%">
				<div id="iframe3" style="display: none;height: 100%;">
					<iframe name="selectFrame" id="selectFrame" width="100%" height="100%" src="${path}plf/page/bussmodel/selectModule.jsp"></iframe>
				</div>
			</DIV>
			<DIV id="content4" style="height: 100%">
				<div id="iframe4" style="display: none;height: 100%;">
					<%-- 模块树形列表 --%>
					<div class="iframe1_left" id="trig_tree"
						style="width: 250px;float: left;height: 100%">
						<div>
							<form class="layui-form" action="${path}sys/BussModelAction_listTrig.ms" id="form">
								<select id="trigExportType"  name="trigExportType"
									style="width: 100%;height: 30px;margin: 15px 10px 0 2px;" >
									<option value='1'><dict:lang value="定时器"/></option>
								</select>
							</form>
						</div>
						<div id="index_tree1" class="ztree" style="overflow: auto;height:calc(100% - 65px);box-sizing: border-box;"> 
							
						</div>
					</div>
					<%-- 模块详情 --%>
					<div class="iframe1_right" id="trig_detail"
						style="width:calc(100% - 255px);height: 100%;float: right;">
						<iframe name="trigDetailFrame" id="trigDetailFrame" width="100%" height="100%" src="<%=CommMethodMc.getMainFrameUrl(request)%>">
							
						</iframe>
					</div>
					<div style="clear: both;"></div>
				</div>
			</DIV>
			<DIV id="content5" style="height: 100%">
					<div id="iframe5" style="display: block;height: 100%;">
					<%-- 模块树形列表 --%>
					<div class="iframe1_left" id="module_tree"
						style="width: 250px;float: left;height: 100%">
						<div>
						<form class="layui-form" action="${path}sys/BussModelAction_listTrig.ms" id="form">
						<select id="typelist" label="类型" headerKey="-1" lay-filter="changeThis"  headerValue="-请选择-" class="dept_select" name="typelist"   style="width: 100%;height: 30px;margin: 10px 10px 0 2px;"  >
						
						</select>
						</form>
						</div>
						<div id="inter_tree" class="ztree" style="overflow: auto;height:calc(100% - 65px);box-sizing: border-box;"> 
							
						</div>
					</div>
					<%-- 模块详情 --%>
					<div class="iframe1_right" id="inter_detail"
						style="width:calc(100% - 255px);height: 100%;float: right;">
						<iframe name="interFrame" id="interFrame" width="100%" height="100%" src="<%=CommMethodMc.getMainFrameUrl(request)%>">
							
						</iframe>
					</div>
					<div style="clear: both;"></div>
				</div>
			</DIV>
			<DIV id="content6" style="height: 100%">
				<div id="iframe6" style="display: none;height: 100%;">
					<iframe name="languageFrame" id="languageFrame" width="100%" height="100%" src=""></iframe>
				</div>
			</DIV>
			<DIV id="content7" style="height: 100%">
				<div id="iframe7" style="display: none;height: 100%;">
					<iframe name="dictFrame" id="dictFrame" width="100%" height="100%" src=""></iframe>
				</div>
			</DIV>
		
		<div style="display: none;">
			<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
		</div>
	</DIV>
	<script type="text/javascript">
		var count=1;
		
		$(function() {
			var flag=false;
			if(count==1){
				flag=true;
			}			
			$(document).on('input propertychange','#key',{}, function() {				
				if(flag){
					searchNode();
					callNumber();
				}
			}).on('compositionstart','#key',{},function(){
				flag=false;
			}).on('compositionend','#key',{},function(){
				flag=true;
				count--;
				searchNode();
				callNumber();
			});
			switchTag("tag1", "content1", "");
			loadModuleListbyztree();
			document.getElementById("key").value = ""; //清空搜索框中的内容  
			    //绑定事件  
			    key = $("#key");  
			    key.bind("focus", focusKey)  
			        .bind("blur", blurKey)  
		});
		function initInter(){
			$.ajax({
				type: "POST",
			    dataType: "json",
			    async:false,
			  	url: "${path}sys/BussModelAction_initInter.ms",
				success: function(data){
			    		var amap=data.ajaxMap.list;
			    		$("#typelist").empty();
			    		$("#typelist").append("<option value=''>"+"-请选择-"+"</option>");
			    		for(var i=0;i<amap.length;i++){
			    				$("#typelist").append("<option value='"+amap[i].value+"'>"+amap[i].name+"</option>");
			    		}
				},
				error: function(msg){
						util.alert("error:"+msg.responseText);
				}
			});
		}
		initInter();
	</script>
	
		<script>
		var isChange=false;
		function changeModuleExportType() {
			loadInterListbyztree();
			window.frames.detailFrame.location.href="<%=CommMethodMc.getMainFrameUrl(request)%>";
			var zTree = $.fn.zTree.getZTreeObj("inter_tree");  
		}
		var typeFlag=-1;
		function change(v)
		{
			
			if(v>0)
			{
				typeFlag=v;
				loadInterListbyztree();
			}else
			{
				
				$("#inter_tree").html("");
				window.frames.interFrame.location.href="<%=CommMethodMc.getMainFrameUrl(request)%>";
			}
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
			$("#inter_tree").html("");s
			tree = new dhtmlXTreeObject("inter_tree","100%","100%","-1");
			//tree.setXMLAutoLoading("${path}sys/BussModelAction_");//该功能树为一次性加载，不需要设置该方法
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_scbrblue/");
			tree.setOnClickHandler(tonclick);
		}
		function interOnClick(event, treeId, treeNode) {
			
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
			window.interFrame.location.href= url;
			
		};
		//ztree部分
		var trigsetting = {
			data: {
				simpleData: {
					enable: true,
					pIdKey: "upId"
				}
			},
			callback: {
				onClick: interOnClick
			}
		};
		//加载模块列表 ztree
		function loadInterListbyztree() {
		
			$("#index_tree").html("");
			$.ajax({
				type: "POST",
			    dataType: "json",
			  	url: "${path}sys/BussModelAction_interfaceTree.ms?paraMap.typeFlag="+typeFlag,
				success: function(data){
					if(data){
						var tree=$.fn.zTree.init($("#inter_tree"), trigsetting, data.ajaxList);
						tree.expandAll(true);
					}
			    },
				error: function(msg){
						util.alert("error:"+msg.responseText);
				  }
			});
			
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
		function initTree() {
			$("#index_tree").html("");
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
			    url: "${path}sys/BussModelAction_listModulebyztree.ms?moduleExportType="+$("#moduleExportType").val(),
				success: function(data){
					if(data){
						//$.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
						var zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
						var node = zTreeObj.getNodeByTId("tree_1");
						zTreeObj.expandNode(node, true, false, true);
					}
			    },
				error: function(msg){
						util.alert("error:"+msg.responseText);
				  }
			});
			
		}
		function trigZTreeOnClick(event, treeId, treeNode) {
			var id=treeNode.id;
			var url ="${path}sys/BussModelAction_listTrigDetail.ms?paraMap.moduleId="+id
			window.trigDetailFrame.location.href= url;
		};
		//ztree部分
		var setting1 = {
			data: {
				simpleData: {
					enable: true,
					pIdKey: "upId"
				}
			},
			callback: {
				onClick: trigZTreeOnClick
			}
		};
		//加载模块列表 ztree
		function loadTrigListbyztree() {
			$("#index_tree").html("");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/BussModelAction_listTrigTree.ms",
				success: function(data){
					if(data){
						var zTreeObj = $.fn.zTree.init($("#index_tree1"), setting1, data.ajaxList);
						var zTree1 = $.fn.zTree.getZTreeObj("index_tree1");  
						var node = zTreeObj.getNodeByTId("tree_1");
						zTreeObj.expandNode(node, true, false, true);
						var flag1=true;
						for(key in exportModule) {
							if(key.indexOf("cls") != 0 && key.indexOf("page") != 0 && key.indexOf("file") != 0 && key.indexOf("jar") != 0) {
								var node = zTree1.getNodesByParamFuzzy("id", key);
								if(node!=null&&node.length!=0){
									zTree1.selectNode(node[0]);
									zTree1.checkNode(node[0],true,true);
									var url ="${path}sys/BussModelAction_listTrigDetail.ms?paraMap.moduleId="+node[0].id
									window.trigDetailFrame.location.href= url;
									flag1=false;
								}
							}
						}
						if(flag1){
							window.trigDetailFrame.location.href= "<%=CommMethodMc.getMainFrameUrl(request)%>";
						}
						
					}
			    },
				error: function(msg){
						util.alert("error:"+msg.responseText);
				  }
			});
			
		}
		  
	</script>
	
	<script type="text/javascript">
	function alertInfo(msg){
		util.alert(msg);
	}
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
			}else if(type == "trig") {
				var id = e.value.split("_")[0];
				
				if( type == "trig" ) {
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
			}
			}else if(type == "inter") {
					var id = e.value.split("_")[0];
					
					if( type == "inter" ) {
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
				}
			}else if(type == "language") {
			var id = e.value.split("_")[0];
				if( type == "language" ) {
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
				}
			}else if(type == "dict") {
			var id = e.value.split("_")[0];
				if( type == "dict" ) {
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
	var loaded = 1;
	var tab_len = 7;
	var currentTag;
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		for (i = 1; i < (tab_len + 1); i++) {
	if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
				if(tag == "tag4") {
					loadTrigListbyztree();
					$("#btn").hide();
				}
				if(tag == "tag1") {
					loadModuleListbyztree();
					$("#btn").hide();
				}
				if(tag == "tag3") {
					document.getElementById("selectFrame").src = "${path}plf/page/bussmodel/selectModule.jsp";
					$("#btn").show();
				}
				if(tag == "tag5") {
					initInter();
					$("#inter_tree").html("");
					document.getElementById("interFrame").src= "<%=CommMethodMc.getMainFrameUrl(request)%>";
					$("#btn").hide();
				}
				if(tag == "tag6") {
					document.getElementById("languageFrame").src = "${path}sys/BussModelAction_languageExport.ms";
					$("#btn").hide();
				}
				if(tag == "tag7") {
					document.getElementById("dictFrame").src = "${path}sys/BussModelAction_dictExport.ms";
					$("#btn").hide();
				}if(tag == "tag2") {
					$("#btn").hide();
				}
				dynIframesize("iframe" + i);
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}
	
	var iframehide = "yes";
	function dynIframesize(frameId) {
		if (document.getElementById) {
			dyniframe = document.getElementById(frameId);
			if (dyniframe && !window.opera) {
				dyniframe.style.display = "block";
				if (dyniframe.contentDocument
						&& dyniframe.contentDocument.body.offsetHeight) {
					//dyniframe.height = dyniframe.contentDocument.body.offsetHeight+10;//全显示
					dyniframe.height = getViewportHeight() - 38;
				} else {
					if (dyniframe.Document
							&& dyniframe.Document.body.scrollHeight) {
						//dyniframe.height = dyniframe.Document.body.scrollHeight;//全显示
						dyniframe.height = getViewportHeight() - 38;
					}
				}
			}
		}
		if ((document.all || document.getElementById) && iframehide == "no") {
			var tempobj = document.all ? document.all[iframeids[i]] : document
					.getElementById(iframeids[i]);
			tempobj.style.display = "block";
		}
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
	
	var lastValue = "", nodeList = [], fontCss = {};  
	//键盘释放：当输入框的键盘按键被松开时，把查询到的数据结果显示在标签中  
	function callNumber(){
	    var zTree = $.fn.zTree.getZTreeObj("index_tree");  
	  
	    //清空输入框
	    if($("#key").val()==""){
	    	zTree.cancelSelectedNode();
	 	    nodeList = [];
	 	    document.getElementById("key").focus();
	    };
	  //如果结果有值，则显示比例；如果结果为0，则显示"[0/0]"；如果结果为空，则清空标签框；  
	    if(nodeList.length){  
	        //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框  
	        zTree.selectNode(nodeList[0],false );  
	        document.getElementById("key").focus();  
	  
	        clickCount=1; //防止重新输入的搜索信息的时候，没有清空上一次记录  
	  
	        //显示当前所在的是第一条  
	        document.getElementById("number").innerHTML="["+clickCount+"/"+nodeList.length+"]";
	        zTree.setting.callback.onClick(null, zTree.setting.treeId, nodeList[0]);//触发函数
	  
	    }else if(nodeList.length == 0){  
	        document.getElementById("number").innerHTML="[0/0]";
	        zTree.cancelSelectedNode(); //取消焦点  
	    }  
	  
	    //如果输入框中没有搜索内容，则清空标签框  
	    if(document.getElementById("key").value ==""){  
	        document.getElementById("number").innerHTML="";  
	        zTree.cancelSelectedNode();  
	        nodeList = [];
	    }  
	}  
	function focusKey(e) {  
	    if (key.hasClass("empty")) {  
	        key.removeClass("empty");  
	    }  
	}  
	function blurKey(e) {  
	    if (key.get(0).value === "") {  
	        key.addClass("empty");  
	    }  
	}  
	//搜索节点  
	function searchNode(e) {  
	    var zTree = $.fn.zTree.getZTreeObj("index_tree");  
	    var value = $.trim(key.get(0).value); 
	    var keyType = "name";  
	  
	    if (key.hasClass("empty")) {  
	        value = "";  
	    }  
	    if(isChange){
	    	if (lastValue === value){
	    		isChange=false;
	    	}
	    }else{
	    	if (lastValue === value) return;
	    }  
	    lastValue = value;  
	    if (value === ""){  
	        updateNodes(false);  
	        return;  
	    };  
	    nodeList = zTree.getNodesByParamFuzzy(keyType, value); //调用ztree的模糊查询功能，得到符合条件的节点  
	    updateNodes(true); //更新节点  
	}  
	//高亮显示被搜索到的节点  
	function updateNodes(highlight) {  
	    var zTree = $.fn.zTree.getZTreeObj("index_tree");  
	    for( var i=0, l=nodeList.length; i<l; i++) {  
	        nodeList[i].highlight = highlight; //高亮显示搜索到的节点(highlight是自己设置的一个属性)
	        zTree.expandNode(nodeList[i].getParentNode(), true, false, false); //将搜索到的节点的父节点展开  
	        zTree.updateNode(nodeList[i]); //更新节点数据，主要用于该节点显示属性的更新  
	    }  
	}  
	//设置颜色  
	function getFontCss(treeId, treeNode) {  
	    return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};  
	}  //点击向上按钮时，将焦点移向上一条数据  
	function clickUp(){  
	    var zTree = $.fn.zTree.getZTreeObj("index_tree");  
	    //如果焦点已经移动到了最后一条数据上，就返回第一条重新开始，否则继续移动到下一条  
	    if(nodeList.length==0){  
	    	util.alert("没有搜索结果！");  
	        return ;  
	    }else if(clickCount==1) {  
	    	util.alert("您已位于第一条记录上！");  
	        return;  
	        //让结果集里边的下一个节点获取焦点（主要为了设置背景色），再把焦点返回给搜索框  
	        //zTree.selectNode(nodeList[clickCount], false)  
	    }else{  
	        //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框  
	        zTree.selectNode(nodeList[clickCount-2], false);  
	        zTree.setting.callback.onClick(null, zTree.setting.treeId, nodeList[clickCount-2]);//触发函数
	        clickCount --;  
	    }  
	    document.getElementById("key").focus();  
	    //显示当前所在的是条数  
	    document.getElementById("number").innerHTML = "[" + clickCount + "/" + nodeList.length + "]";  
	}  
	//点击向上按钮时，将焦点移向下一条数据  
	function clickDown(){  
	    var zTree = $.fn.zTree.getZTreeObj("index_tree");  
	    //如果焦点已经移动到了最后一条数据上，则提示用户（或者返回第一条重新开始），否则继续移动到下一条  
	    if(nodeList.length==0){  
	    	util.alert("没有搜索结果！");  
	        return ;  
	    }else if(nodeList.length==clickCount)  
	    {  
	    	util.alert("您已位于最后一条记录上！")  
	        return;  
	    }else{  
	        //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框  
	        zTree.selectNode(nodeList[clickCount], false);
	        zTree.setting.callback.onClick(null, zTree.setting.treeId, nodeList[clickCount]);//触发函数
	        clickCount ++;  
	    }  
	    document.getElementById("key").focus();  
	    //显示当前所在的条数  
	    document.getElementById("number").innerHTML = "[" + clickCount + "/" + nodeList.length + "]";  
	}  
	
	 layui.use('form', function(){
	   	  var form = layui.form;
	   	  form.on('select(changeModuleExportType)', function(data){
	   		changeModuleExportType();
	      });
	   	  form.on('select(changeThis)', function(data){
	   		change(data.value);
		  });
	   });
</script>
<%@ include file="/plf/common/pub_end.jsp"%>