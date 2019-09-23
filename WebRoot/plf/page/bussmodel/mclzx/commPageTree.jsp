<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${rootPath}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="公用类树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
	</jsp:include>

  </head>

	<body>
		<div id="index_tree" class="tree" >
		<script>
			function tonclick(id,cid,row){
				if("${paraMap.source}"){
					$("#paraMap_UI_DATA_VALUE_1",window.parent.document).val(id);
					$("#paraMap_UI_DATA_TEXT_1",window.parent.document).val(row.label);
					window.parent.closePopWin();
				}else{
					var url = "${rootPath}sys/UserCustomAction_listCommPage.ms?<s:property value="@com.more.fw.core.common.method.Constants@FUNC_CODE"/>=F30&shMap.UP_ID="+id;
					parent.mainFrame.location.href= url;
				}
			}
			
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${rootPath}plf/js/dhtmlxtree/imgs/csh_books/");
			tree.setOnClickHandler(tonclick);
			tree.enableDragAndDrop(true);
			tree.attachEvent("onDrag", function(sId,tId,id,sObject,tObject){
				var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
				if(r){
					return updateDragData(sId,tId);
				}else{
					return false;
				}
			});
			tree.loadXML("${path}sys/UserCustomAction_listCommPageTree.ms");
			tree.setXMLAutoLoading("${path}sys/UserCustomAction_listCommPageTree.ms");
			
			function updateDragData(sId,tId){
				var flag = true;
				var data = {"paraMap.sId":sId,"paraMap.tId":tId,"paraMap.treeDataType":"pageTree"};
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
		</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>