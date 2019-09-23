
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
</head>
<script type="text/javascript">
util.showTopLoading("数据加载中 请稍后。。。。")
</script>
<body style="height: 100%;width: 100%" onload="init()">
<div class="crumbs" id="crumbs" style="margin:5px 0px 0px 37px;">
    </div>
	<div style="display: hidden">
			<form id="exportForm" action="${path}sys/BussModelAction_exportMod.ms" method="post" target="submitFrame">
				<input type="hidden" id="exportJson" value="" name="paraMap.input">
			</form>
	</div>
	<div id=container>
		<div class=content1 id=content
			style="width: 100%;height:calc(100% - 28px)">
			<div id="content1" style="height: 90%">
				<div id="iframe1" style="height: 90%;">
					<%-- 模块树形列表 --%>
					<div class="iframe1_left" id="module_tree"
						style="width: 250px;float: left;height: 100%">
						<div>
							
<%--								<select id="moduleExportType" name="moduleExportType"--%>
<%--									style="width: 100%;height: 30px" onchange="changeModuleExportType()">--%>
<%--									<option value='2'><dict:lang value="公用类"/></option>--%>
<%--								</select>--%>
								<s:hidden name="moduleExportType" value="2" id="moduleExportType"></s:hidden>
								<h3 class="moduleTitle">公用类</h3>
							
						</div>
						 <div id="a">  
				            <input type="text"  id="key" class="layui-input"  placeholder="查询..."  style="width: 100%;box-sizing: border-box;"/>  
				        	<span id="clickUp" onclick="clickUp()" style=""></span>
				        	<span id="clickDown"  onclick="clickDown()"></span>
				        	<label id="number"></label>  	
				        </div>  
						<div id="index_tree" class="ztree" style="overflow: auto;height:calc(100% - 65px);box-sizing: border-box;"> 
							
						</div>
					</div>
					
						<div class="iframe1_right" id="module_detail"
						style="width:calc(100% - 255px);height: 100%;float: right; position:relative;">
<%--						<iframe name="detailFrame" id="detailFrame" width="100%" height="100%" src="<%=CommMethodMc.getMainFrameUrl(request)%>">--%>
<%--							--%>
<%--						</iframe>--%>
						<div class="treeExportWrap">
								<div class="treeExport">
									<div class="treeExportImg"></div>
									公用类
								</div>
								
							</div>
					</div>
					<div class="ptop_10 txac">
						<input type="button" value="完成" class="layui-btn"  onclick="save(this);"/>
						<input id="upButton"type="button" value="<dict:lang value="上一步" />"  onclick="up(this);" class="layui-btn layui-btn-warm">
						<input id="nextButton"type="button" value="<dict:lang value="下一步" />"  onclick="next(this);" class="layui-btn layui-btn-warm">
						
				</div>
					<div style="clear: both;"></div>
				</div>
			</div>
	
		</div>
		<div style="display: none;">
				<form action="${path}sys/moduleMagAction_commClass.ms" id="submitForm"method="post" target="submitFrame1">
				
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				
				<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
				<s:hidden id="MODEL_NAME" name="paraMap.MODEL_NAME"></s:hidden>
				<s:hidden id="MODEL_SHOW_NAME" name="paraMap.MODEL_SHOW_NAME"></s:hidden>
				<s:hidden id="MODEL_VERSION" name="paraMap.MODEL_VERSION"></s:hidden>
				<s:hidden id="MODELS_NAME" name="paraMap.MODELS_NAME"></s:hidden>
				<s:textarea id="MODEL_MEMO" name="paraMap.MODEL_MEMO"  cssStyle="display:none;word-wrap: normal;" wrap="off"></s:textarea>
				<s:hidden id="MODEL_TYPE" name="paraMap.MODEL_TYPE"></s:hidden>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:hidden id="MODEL_START_ORDER" name="paraMap.MODEL_START_ORDER"></s:hidden>
				<s:hidden id="MODEL_DATABASE" name="paraMap.MODEL_DATABASE"></s:hidden>
				<s:hidden id="codeType" name="paraMap.paraCodeType"/>
				<s:hidden id="paraCodeId" name="paraMap.paraCodeId"/>
				<s:hidden id="className" name="paraMap.paraCodeName"/>
				<s:hidden id="MC_ID_MYSQL" name="paraMap.MC_ID_MYSQL" />
				<s:hidden id="MC_ID_SQLSERVER" name="paraMap.MC_ID_SQLSERVER" />
				<s:hidden id="MC_ID_ORACLE" name="paraMap.MC_ID_ORACLE" />
				<s:hidden id="MC_ID_BASE" name="paraMap.MC_ID_BASE" />
				<s:hidden id="MC_ID_PG" name="paraMap.MC_ID_PG"  />
				<s:hidden id="PAGE_ORDER" name="paraMap.PAGE_ORDER"/>
				<s:textarea id="classCode" name="paraMap.paraClsCode" value="%{paraMap.paraClsCode}" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				</form>
				<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>
		</div>
	</div>
	<script type="text/javascript">
	var currentOrder=6;
	var exportModule = {};
	var zTree =null;
	function alertInfo(msg){
		util.alert(msg);
	}
	function init(){
		var em=$("#exportModule").val();
		
		if(em!=""){
			exportModule=JSON.parse(em);
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
		function up(){
			document.getElementById("submitForm").target="";
			$("#exportModule").val(JSON.stringify(exportModule));
			document.getElementById("submitForm").action="${path}sys/moduleMagAction_pageExport.ms"
			document.forms.submitForm.submit();
		}
		function next(){
			document.getElementById("submitForm").target="";
			$("#exportModule").val(JSON.stringify(exportModule));
<%--			alert($("#exportModule").val())--%>
			document.getElementById("submitForm").action="${path}sys/moduleMagAction_moduleSourceExport.ms"
			document.forms.submitForm.submit();
		}
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
			loadModuleListbyztree();
			var exportModule=$("#exportModule").val()
			for( key in exportModule){
				var arr = exportModule[key]; //模块
				for(var i=0 ; i<arr.length; i++) {
				}
			}
			document.getElementById("key").value = ""; //清空搜索框中的内容  
			    //绑定事件  
			    key = $("#key");  
			    key.bind("focus", focusKey)  
			        .bind("blur", blurKey)
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
		  						$("#PAGE_ORDER").val("1,2,3,4,5,6");
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
	    var isChange=false;
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
			var url = "${rootPath}"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.treeID="+id+"&paraMap.type="+type+"&paraMap.moduleExportType=" + moduleExportType+"&paraMap.moduleName="+moduleName;
			window.detailFrame.location.href= url;
			
		}
		var tree= null;
<%--		function initTree() {--%>
<%--			$("#index_tree").html("");--%>
<%--			tree = new dhtmlXTreeObject("index_tree","100%","100%","-1");--%>
<%--			//tree.setXMLAutoLoading("${rootPath}sys/BussModelAction_");//该功能树为一次性加载，不需要设置该方法--%>
<%--			tree.setImagePath("${rootPath}plf/js/dhtmlxtree/imgs/csh_scbrblue/");--%>
<%--			tree.setOnClickHandler(tonclick);--%>
<%--		}--%>
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
<%--		//加载模块列表--%>
<%--		function loadModuleList() {--%>
<%--			$.post("${path}sys/BussModelAction_listModule.ms",{moduleExportType:$("#moduleExportType").val()},function(data) {--%>
<%--				initTree();--%>
<%--				tree.loadXMLString(data.ajaxString);--%>
<%--								--%>
<%--			});--%>
<%--		}--%>
		function zTreeOnClick(event, treeId, treeNode) {
<%--			var id=treeNode.id;--%>
<%--		--%>
<%--			var MID = "";--%>
<%--			var type = "";--%>
<%--			var moduleExportType = $("#moduleExportType").val();--%>
<%--			MID=id;--%>
<%--			type=treeNode.add1;--%>
<%--			if(treeNode.add2==null || treeNode.add2==''){--%>
<%--				return;--%>
<%--			}--%>
<%--			var moduleName = treeNode.name;--%>
<%--			var url = "${rootPath}"+treeNode.add2+"?paraMap.MID="+MID+"&paraMap.treeID="+id+"&paraMap.type="+type+"&paraMap.moduleExportType=" + moduleExportType+"&paraMap.moduleName="+moduleName;--%>
<%--			window.detailFrame.location.href= url;--%>
			var zTreesArr = zTree.getCheckedNodes(true);
			var MODELS_NAME=$("#MODELS_NAME").val();
			var MODEL_NAME=$("#MODEL_NAME").val()
			var name=MODELS_NAME+"."+MODEL_NAME
			if(zTreesArr.length>0){
				exportModule.classType=[]
				for (var i = 0; i < zTreesArr.length; i++) { 
					if(!zTreesArr[i].children){//判断不包含子结点
						if(zTreesArr[i].moduleName!=undefined&&zTreesArr[i].moduleName!=name){
							util.alert("选择"+zTreesArr[i].name+"会导致本模块与"+zTreesArr[i].moduleName+"模块冲突,本模块将无法与"+zTreesArr[i].moduleName+"模块共同安装")
						}	
						exportModule.classType.push({
								"id": zTreesArr[i].id,
						});
					}
			    }
			}else{
				delete exportModule.classType
			}
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
					onCheck: zTreeOnClick
				},
				check: {
					enable: true,
					chkboxType: { "Y": "ps", "N": "ps" }
				},
				async:{
					enable:true,//虽然是同步，但是这里要写true才回调用方法  否则方法无效
				}
		};
		//加载模块列表 ztree
		function loadModuleListbyztree() {
			$("#index_tree").html("");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/moduleMagAction_listModulebyztree.ms?paraMap.moduleExportType="+$("#moduleExportType").val(),
				success: function(data){
					if(data){
						$.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
						zTree = $.fn.zTree.getZTreeObj("index_tree");  
						
						var node = zTree.getNodeByTId("tree_1");
							zTree.expandNode(node, true, false, true);
						
						
						var arr = exportModule.classType; //模块
						var lg=zTree.getNodes();
						if(arr==null||arr==undefined){
							return;
						}
						var MODELS_NAME=$("#MODELS_NAME").val();
						var MODEL_NAME=$("#MODEL_NAME").val()
						var name=MODELS_NAME+"."+MODEL_NAME
						for(var i=0;i<arr.length;i++){
							var node = zTree.getNodesByParamFuzzy("id", arr[i].id);
							if(node!=null){
								if(node[0].moduleName!=undefined&&node[0].moduleName!=name){
									util.alert("选择"+node[0].name+"会导致本模块与"+node[0].moduleName+"模块冲突,本模块将无法与"+node[0].moduleName+"模块共同安装")
								}
								zTree.selectNode(node[0]);
					            zTree.checkNode(node[0],true,true);
							}
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
		    }else{  
		        //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框  
		        zTree.selectNode(nodeList[clickCount-2], false);  
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
		        clickCount ++;  
		    }  
		    document.getElementById("key").focus();  
		    //显示当前所在的条数  
		    document.getElementById("number").innerHTML = "[" + clickCount + "/" + nodeList.length + "]";  
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
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>