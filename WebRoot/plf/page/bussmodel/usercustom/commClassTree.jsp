<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="公用类树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
	
	<style>
	.layui-form-select {
    	 width: auto;
	}
	</style>
	
  </head>

	<body>
		<form id="addForm" name="addForm" class="layui-form">
			<select lay-filter="exchange"  id="selected" >
				<option value="0">菜单类管理模式</option>
				<option value="1">包路径管理模式</option>
			</select>
		</form>
		
		<div id="index_tree" class="tree" style="margin-top:1px;"  ></div>
		<script>
		var url;
			 function tonclick(id,cid,row){
				if("<c:out value='${paraMap.source}' />"){
					var mcIframeName="${mcIframeName}";
					var obj={"mcIframeName":mcIframeName,"type":"window"};	
					var par_win=getSrcByIframeName(obj).frames['mainFrame'];
					
					var hasChildren = tree.hasChildren(id);
					if(hasChildren!=0){
						return;
					}
					$("#paraMap_UI_DATA_VALUE_2",par_win.document).val(id);
					$("#paraMap_UI_DATA_TEXT_2",par_win.document).val(row.label);
					closePopWin();
				}else{
					url = "${path}sys/UserCustomAction_listCommClass.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&paraMap.UP_ID="+id+"&paraMap.seeAll=y";
					parent.mainFrame.location.href= url;
				}
			} 
			function tonPackClick(id,cid,row){
				if("<c:out value='${paraMap.source}' />"){
					var mcIframeName="${mcIframeName}";
					var obj={"mcIframeName":mcIframeName,"type":"window"};	
					var par_win=getSrcByIframeName(obj).frames['mainFrame'];
					var hasChildren = tree.hasChildren(id);
					
					if(hasChildren!=0){
						return;
					}
					
					//$("#paraMap_UI_DATA_VALUE_3",par_win.document).val(id);
					//$("#paraMap_UI_DATA_TEXT_3",par_win.document).val(row.label);
					$("#paraMap_UI_DATA_VALUE_2",par_win.document).val(id);
					$("#paraMap_UI_DATA_VALUE_2",par_win.document).val(row.label);
					
					closePopWin();
				}else{
					url = "${path}sys/UserCustomAction_listCommPack.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&paraMap.namePath="+id;
					parent.mainFrame.location.href= url;
				}
			} 
			var tree;
			function doOnLoad(){
				var obj=document.getElementById('selected');
				var index=obj.selectedIndex;
				var value=obj.options[index].value;
				if(value==0){
					tree=new dhtmlXTreeObject("index_tree","100%",null,"-1");
					tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
					tree.setOnClickHandler(tonclick);
					tree.enableTreeLines(false); 
					tree.setOnLoadingEnd(openItem);
					dragAndDrop();
					tree.loadXML("${path}sys/UserCustomAction_listCommClassTree.ms");
					tree.setXMLAutoLoading("${path}sys/UserCustomAction_listCommClassTree.ms");
				}else{
					url = "${path}sys/UserCustomAction_listCommPack.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30";
					//parent.mainFrame.location.href= url;
					tree=new dhtmlXTreeObject("index_tree","100%",null,"/");
					tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
					tree.getAllChildless();
					tree.enableTreeLines(false); 
					tree.setOnClickHandler(tonPackClick);
					tree.loadXML("${path}sys/UserCustomAction_listCommPackegeTree.ms");
					tree.setXMLAutoLoading("${path}sys/UserCustomAction_listCommPackegeTree.ms");
				}
				
				
			}
			doOnLoad();
			function exchange(){
				document.getElementById('index_tree').innerHTML="";
				var obj=document.getElementById('selected');
				var index=obj.selectedIndex;
				var value=obj.options[index].value;
				if(0==value){
					url = "${path}sys/UserCustomAction_listCommClass.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&paraMap.UP_ID=0";
					//parent.mainFrame.location.href= url;
					tree=new dhtmlXTreeObject("index_tree","100%",null,"-1");
					tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
					tree.setOnClickHandler(tonclick);
					tree.enableTreeLines(false); 
					tree.setOnLoadingEnd(openItem);
					dragAndDrop();
					tree.loadXML("${path}sys/UserCustomAction_listCommClassTree.ms");
					tree.setXMLAutoLoading("${path}sys/UserCustomAction_listCommClassTree.ms");
				}else{
					url = "${path}sys/UserCustomAction_listCommPack.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30";
					//parent.mainFrame.location.href= url;
					tree=new dhtmlXTreeObject("index_tree","100%",null,"/");
					tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
					tree.getAllChildless();
					tree.enableTreeLines(false); 
					tree.setOnLoadingEnd(openItem);
					tree.setOnClickHandler(tonPackClick);
					tree.loadXML("${path}sys/UserCustomAction_listCommPackegeTree.ms");
					tree.setXMLAutoLoading("${path}sys/UserCustomAction_listCommPackegeTree.ms");
				}
			}
			
			function dragAndDrop(){
				tree.enableDragAndDrop(true);
				tree.attachEvent("onDrag", function(sId,tId,id,sObject,tObject){
					var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
					if(r){
						return updateDragData(sId,tId);
					}else{
						return false;
					}
				});
			}
			
			function updateDragData(sId,tId){
				var flag = true;
				var data = {"paraMap.sId":sId,"paraMap.tId":tId,"paraMap.treeDataType":"classTree"};
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
			
			$(function(){
		 		layui.use('form', function(){
	    	  		var form = layui.form;

					form.on('select(exchange)', function(data){
		
						exchange();
					
				 	});
					
		    	});
			    
			});
		 var openId;
		 function openItem(){
			    tree.selectItem(openId);
				tree.openItem(openId);
			}	
		 function actionIs(treeTid){
			 $("#index_tree").empty();
			 openId= treeTid;
			 doOnLoad();
		 }

		</script>
		
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>