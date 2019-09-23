<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="菜单权限配置页面" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="zTree" value="1" />
	</jsp:include>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<style type="text/css">
		.edit .bod {
    		padding: 0px 26px 5px 50px;
		}
	</style>
	</head>
<body>
	 <div class="edit">
            <div class="hd">
			    <div class="optn" style="margin-bottom: 0px;">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <s:if test="menuIdValue!=''">
			        <button type="button" onclick="clearMenu(this);"><i class="ico ico-sc"></i>清空</button>
			        </s:if>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bod" style="margin-left: -70px;height:350px;overflow:auto;">
						<table  style="margin-left: 60px;">
							<tr>
								<td style="height:23px">
									<span class="Eng"><span id="error_msg"></span></span>
								<td>
							</tr>
							<tr>
								<td>
									<ul id="index_tree"  class="ztree" style="overflow:hidden">
								<td>
							</tr>
						</table>
						<s:hidden id ="menuId_Id" name="menuId"></s:hidden><!-- 父表单的菜单Id -->
						<s:hidden id ="menuId_value" name="menuIdValue"></s:hidden>
						<s:hidden id ="menuIdSelected"/>
						<s:hidden id ="menuName" name="menuName"></s:hidden><!-- 用于传给前台的菜单名称 -->
						<s:hidden  id="type" name="type"/><!-- 用于判断菜单类型 -->
						<s:hidden  id="menuName_id" name="menuNameId"/><!-- 父表单的菜单名称Id -->
						<s:hidden id="parentiframeId" name="iframeId"/><!-- 父表单的iframeId -->
		   </div>
</div>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>
<script type="text/javascript">
<%--	var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");//创建全局树对象--%>
	var menuNameParent=""
	var	menuIdSelected=""
		var zTreeObj=null;
<%--	tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");//设置树图片--%>
<%--	$(function(){--%>
<%--		var menuId_value=$("#menuId_value").val();--%>
<%--		$.ajax({--%>
<%--			type: "POST",--%>
<%--		    dataType: "json",--%>
<%--		    url: "${path}sys/AdKeyDataAction_treeLoad.ms",--%>
<%--		    success: function(data){--%>
<%--		    			tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");--%>
<%--		    			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");--%>
<%--		    			tree.setOnClickHandler(tonclick);//绑定点击树事件--%>
<%--						tree.loadXMLString(data.ajaxData);//加载树数据--%>
<%--						tree.selectItem(menuId_value);--%>
<%--						menuNameParent=tree.getSelectedItemText();--%>
<%--						menuIdSelected=tree.getSelectedItemId();--%>
<%--					},error: function(msg){--%>
<%--						util.closeLoading();--%>
<%--						util.alert("error:"+msg);--%>
<%--				  }--%>
<%--			});--%>
<%--		--%>
<%--	})--%>
<%--	function tonclick(id,cid){--%>
<%--				menuIdSelected= tree.getSelectedItemId();--%>
<%--				menuNameParent = tree.getSelectedItemText();--%>
<%--				var type=tree.getUserData(id,"type");--%>
<%--				$("#menuIdSelected").val(id);--%>
<%--				$("#type").val(type);--%>
<%--	}--%>
function tonclick(event, treeId, treeNode){
	menuIdSelected= treeNode.id;
	menuNameParent = treeNode.name;
	var nodes = zTreeObj.getCheckedNodes(true);
     for(var i=0;i<nodes.length;i++){  
			$("#menuIdSelected").val(nodes[i].id);
			$("#type").val(nodes[i].type);
      }  
<%--				var type=tree.getUserData(id,"type");--%>
<%--				$("#menuIdSelected").val(id);--%>
<%--				$("#type").val(type);--%>
}

var setting = {
data: {
	simpleData: {
		enable: true,
		pIdKey: "upId"
	},
	key:{
		url:"xUrl"
	}
},
check: {
    enable: true,
    chkStyle: "radio",  //单选框
    radioType: "all"   //对所有节点设置单选
},
callback: {
	onCheck: tonclick
}
};


$(function(){
var menuId_value=$("#menuId_value").val();
$.ajax({
	type: "POST",
    dataType: "json",
    url: "${path}sys/AdminTargetDataAction_treeLoad.ms",
	success: function(data){
		if(data){
			zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
			var node = zTreeObj.getNodeByParam("id",menuId_value);
			zTreeObj.checkNode(node, true, true);
			 var parent = node.getParentNode();  
	          if(!parent.open){  
	        	  zTreeObj.expandNode(parent,true,true);  
	          }  
			var nodes = zTreeObj.getCheckedNodes(true);
	         for(var i=0;i<nodes.length;i++){  
	        	 menuNameParent=nodes[i].name;
					menuIdSelected=nodes[i].id;
	          }  
			
		}
    },
	error: function(msg){
			util.alert("error:"+msg.responseText);
	  }
	});
});
	//菜单别名校验
	function valData(){
		   var type=$("#type").val();
			var menuId_value=$("#menuId_value").val();
		   if(type!=""){
			   if(type==0&&type!=""){
			   		document.getElementById("error_msg").innerHTML = "<dict:lang value="只能是功能级别菜单" />";
			    	window.setTimeout("closeValMsg('error_msg')", 2000);
			    	return false;
			   }
			   else{
			    	document.getElementById("error_msg").innerHTML = "";
			   }
		   }else if(menuId_value==null||menuId_value==""){
			   if(type==""){
				   	document.getElementById("error_msg").innerHTML = "<dict:lang value="请选择一个功能级别菜单" />";
			    	window.setTimeout("closeValMsg('error_msg')", 2000);
			    	return false;
			   }
		   }
    		return true;
    }
	  //显示错误信息
   function closeValMsg(objthis){
   		document.getElementById(objthis).innerText = "";
   }
	  //提交表单
   function add(thisObj){
		if(!valData()){
			return ;
		}
		var menuName_id=$("#menuName_id").val();
		var menuId=$("#menuId_Id").val();
		var parentiframeId=$("#parentiframeId").val();
		var parentFrame=top.document.getElementById(parentiframeId);//获取到父iframe对象
		var parentMenuName=parentFrame.contentWindow.document.getElementById(menuName_id);//通过父iframe找到菜单名称这个输入框
		var parentMenuId=parentFrame.contentWindow.document.getElementById(menuId);//通过父iframe找到菜单Id这个输入框
		parentMenuName.value=menuNameParent;
		parentMenuId.value=menuIdSelected;
		closeWindow();
	}
   function clearMenu(thisObj){
		var menuNameId=$("#menuName_id").val();
		var menuId=$("#menuId_Id").val();
		var parentiframeId=$("#parentiframeId").val();
		var parentFrame=top.document.getElementById(parentiframeId);//获取到父iframe对象
		var parentMenuName=parentFrame.contentWindow.document.getElementById(menuNameId);//通过父iframe找到菜单名称这个输入框
		var parentMenuId=parentFrame.contentWindow.document.getElementById(menuId);//通过父iframe找到菜单Id这个输入框
		parentMenuName.value="";
		parentMenuId.value="";
		closeWindow();
	}
</script>
<script>
	setPopScroll('.bod')
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>