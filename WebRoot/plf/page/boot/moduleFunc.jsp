<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	<title><dict:lang value="模块功能树" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="zTree" value="1" />
			
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
	</jsp:include>
	<script type="text/javascript">
	util.showTopLoading("数据加载中 请稍后。。。。")
	</script>
	
	<style>
	ul.ztree{
		padding-top: 0px;
	}
	</style>
	
  </head>

	<body onload="init()">
	<div class="crumbs" id="crumbs" style="margin:5px 0px 0px 37px;">
    </div>
		<div style="display: none;">
				<form action="${path}sys/moduleMagAction_bussExport.ms" class="layui-form" id="submitForm" method="post" target="submitFrame1">
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
				
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				</form>
		</div>
		<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>
		<div class="moduleFrameWrap moduleFunWrap" style="height:85%">
			<div class="moduleContentWrap">
				<div class="moduleContent">
					
					<!-- 内容部分  开始-->
					<div class="moduleContentTop" style="height:100%;">
					
						<!-- 内容 左侧部分 -->
						<div class="moduleContentLeft">
							<!-- 菜单树 start -->
							<div>
								<h3 class="moduleTitle" style="margin-bottom: 10px;">菜单树导出</h3>
			<ul id="index_tree" class="ztree" ></ul>
			<script>
			var currentOrder=3;
			var zTreeObj=null;
			var exportModule = {};	
			function init(){
				var em=$("#exportModule").val()
				if(em!=""&&em.length>2){
					exportModule=JSON.parse(em);
<%--					alert(exportModule);--%>
				}
				
			}
			
			function alertInfo(msg){
				util.alert(msg);
			}
			function save()
			{
				$("#submitForm").attr("target","submitFrame1"); 
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
				document.getElementById("submitForm").action="${path}sys/moduleMagAction_moduleType.ms"
				document.forms.submitForm.submit();
			}
			function next(thisObj){
				document.getElementById("submitForm").target="";
				$("#exportModule").val(JSON.stringify(exportModule));
<%--				alert($("#exportModule").val())--%>
				document.getElementById("submitForm").action="${path}sys/moduleMagAction_bussExport.ms"
				document.forms.submitForm.submit();
			}
			var setting = {
					data: {
						simpleData: {
							enable: true,
							pIdKey: "upId"
						},
						key: {
							url: "xUrl"
						}
					},
					callback: {
						onCheck: zTreeOnClick
					},
					check: {
						enable: true,
						chkboxType: { "Y": "ps", "N": "ps" }
					},
				};
			
				function zTreeOnClick(event, treeId, treeNode){
					var zTreesArr = zTreeObj.getCheckedNodes(true);
<%--					alert(zTreesArr.length)--%>
					var MODELS_NAME=$("#MODELS_NAME").val();
					var MODEL_NAME=$("#MODEL_NAME").val()
					var name=MODELS_NAME+"."+MODEL_NAME
					if(zTreesArr.length>0){
						exportModule.func=[]
						for (var i = 0; i < zTreesArr.length; i++) { 
								if(!zTreesArr[i].children){//判断不包含子结点
									if(zTreesArr[i].moduleName!=undefined&&zTreesArr[i].moduleName!=name){
										util.alert("选择"+zTreesArr[i].name+"会导致本模块与"+zTreesArr[i].moduleName+"模块冲突,本模块将无法与"+zTreesArr[i].moduleName+"模块共同安装")
										}	
								}
								exportModule.func.push({
										"id": zTreesArr[i].id,
								});
						}
					}else{
						delete exportModule.func
					}
				}
				
				 $(function(){
		    	  $.ajax({
					type: "POST",
				    dataType: "json",
				    url: "${path}sys/FuncAction_listFpFuncTreeAllData.ms",
					success: function(data){
						if(data){
							zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
							var node = zTreeObj.getNodeByTId("tree_1");
							zTreeObj.expandNode(node, true, false, true);
							var arr = exportModule.func; //模块
							if(arr==null||arr==undefined){
								util.closeTopLoading();
								return;
							}
							var MODELS_NAME=$("#MODELS_NAME").val();
							var MODEL_NAME=$("#MODEL_NAME").val()
							var name=MODELS_NAME+"."+MODEL_NAME
							for(var i=0;i<arr.length;i++){
								var node = zTreeObj.getNodesByParamFuzzy("id", arr[i].id);
								if(node[0]!=null){
									if(!node[0].children){//判断不包含子结点
										if(node[0].moduleName!=undefined&&node[0].moduleName!=name){
											util.alert("选择"+node[0].name+"会导致本模块与"+node[0].moduleName+"模块冲突,本模块将无法与"+node[0].moduleName+"模块共同安装")
										}
									}
									zTreeObj.selectNode(node[0]);
									zTreeObj.checkNode(node[0],true,false);
								}
							}
							util.closeTopLoading();
						}
				    },
					error: function(msg){
							if(msg.responseText!=null && msg.responseText!=''){
								top.util.alert("error:"+msg.responseText);
							}
					  }
					});
		    	  
		    	  var PAGE_ORDER=$("#PAGE_ORDER").val();
		  		var html="<ul>";
		  		var count=0;
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
		  						$("#PAGE_ORDER").val("1,2,3");
		  						count=2
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
		  						count=1
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
		  						count=1
		  					}
		  					for(var j=pageorders.length+count;j<12;j++){
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
			
				var form;
				$(function(){
					layui.use('form', function(){
				    	form = layui.form;
				    	form.render();
				    	  
			           	
				    });
				    
				})
			</script>
	</div>
							<!-- 菜单树 end -->
						</div>
						
						<!-- 内容 右侧部分 -->
						<div class="moduleContentRight">
							<div class="treeExportWrap">
								<div class="treeExport">
									<div class="treeExportImg"></div>
									菜单树导出
								</div>
								
							</div>
						</div>
					</div>
					<!-- 内容部分 结束 -->
					
					<!-- 按钮部分 -->
					<div class="moduleContentBtn">
						<div class="ptop_10 txac btn">
						    <input type="button" value="完成" class="layui-btn"  onclick="save(this);"/>
							<input id="saveButton" type="button" value="<dict:lang value="上一步" />" onclick="up(this);" class="layui-btn layui-btn-warm">
							<input id="nextButton"type="button" value="<dict:lang value="下一步" />"  onclick="next(this);" class="layui-btn layui-btn-warm">
					
						</div>
					</div>
					
				</div>
			</div>
		</div>	
	</body>
<%@ include file="/plf/common/pub_end.jsp" %>