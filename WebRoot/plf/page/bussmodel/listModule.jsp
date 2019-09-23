<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="模型菜单树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
	</jsp:include>
  </head>

	<body style="background:#EEEEEE;">123
		<script type="text/javascript"><%--
			function test() {
				//alert(window.parent.frames["headFrame"].objArr);
			}
		--%>
			function changeModuleExportType() {
				window.frames.form.submit();
				parent.mainFrame.location.href='<%=CommMethodMc.getMainFrameUrl(request)%>';
			}
		</script>
		
		<form action="${path}sys/BussModelAction_listModule.ms" id="form">
			<select id="moduleExportType" name="moduleExportType" style="width: 100%" onchange="changeModuleExportType()">
				<option value='1' <c:if test="${moduleExportType == 1 }">selected</c:if>>业务模型</option>
				<option value='2' <c:if test="${moduleExportType == 2 }">selected</c:if>>公用类</option>
				<option value='3' <c:if test="${moduleExportType == 3 }">selected</c:if>>公用页面</option>
			</select>
		</form>
		
		<!-- div><a href="javascript:add();"><dict:lang value="新建模型" />+</a></div -->
		<s:if test="null != #request.treeXml && '' != #request.treeXml">
			<div id="index_tree" class="tree" />
			<script>
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
					//var url = "${path}sys/BussModelAction_"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.ID="+id;
					//alert(url);
					parent.mainFrame.location.href= url;
				}

				var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
				
				//tree.setXMLAutoLoading("${path}sys/BussModelAction_");//该功能树为一次性加载，不需要设置该方法
				tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_scbrblue/");
				tree.setOnClickHandler(tonclick);
				tree.enableDragAndDrop(true);
				tree.attachEvent("onDrag", function(sId,tId,id,sObject,tObject){
					if(sObject.hasChildren(sId) == 0){
						alert("<dict:lang value="模型不能拖拽"/>");
						return false;
					}
					var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
					if(r){
						return updateDragData(sId,tId);
					}else{
						return false;
					}
				});
				tree.loadXMLString("<c:out value='${treeXml}' />");
				
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
			</script>
		</s:if>

	<script type="text/javascript">
		function add(){
			var url = "${path}sys/BussModelAction_forAddBussModel.ms";
			parent.mainFrame.location.href= url;
		}

	</script>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>