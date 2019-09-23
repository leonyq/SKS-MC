<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<html>
	<head>
	<script type="text/javascript">
	var zcount=1000;
	</script>
	 
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
		<%@ include file="/plf/common/pub_meta.jsp"%>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="datePicker" value="1" />
			<jsp:param name="zTree" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
		<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	    <title><dict:lang value="部门信息" /></title>
	<style type="text/css">
		body{overflow-y:hidden;}
		
	</style>
	</head>
	<body>
    <div  style="width: 100%;">
    	<div style="width: 17%;float: left;">
			<div class="block1" id='block1' style="width:92%;float: left;border-style:solid;border-width:1px; border-color:#eaeaea;background:#ffffff;padding:5px;margin-top: 40px;overflow: auto;">
       			<div id="index_tree" class="ztree">
      			</div>
      		</div>
      	</div>
        <div  style="width: 83%;float: left;" >
        			<div>
						<iframe id="deptiframe" name="deptiframe" frameBorder="0"
								src="${path}sys/DeptAction_listDept.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&deptDtoSh.upId=FA174AFF136D496A87B65443D22357E3" name="mainFrame"  scrolling="auto" style="border-right: 1px;width: 100%;" >
						</iframe>
						<input type="hidden" id="deptDtoUp_iframeid" name="deptDtoUp.iframeid" />
					</div>
        </div>
        <!-- content end -->        
    </div>
	
		<script>
			/*
			var nodeId = "-1";
			function tonclick(id,cid){
				nodeId = id;
				var url = "${path}sys/DeptAction_listDept.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&deptDtoSh.upId="+id+"&iframeid="+$("#deptDtoUp_iframeid").val();
				
			 	parentWindow = $("#deptiframe")[0].contentWindow;
				parentWindow.frameElement.src= url;
			}
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
			tree.setOnClickHandler(tonclick);
			tree.loadXML("${path}sys/DeptAction_listDeptTree.ms");
			tree.setXMLAutoLoading("${path}sys/DeptAction_listDeptTree.ms");
			*/
			
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

			var nodeId = "-1";
			function zTreeOnClick(event, treeId, treeNode) {
				nodeId = treeNode.id;
				var url = "${path}sys/DeptAction_listDept.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&deptDtoSh.upId="+treeNode.id+"&iframeid="+$("#deptDtoUp_iframeid").val()+"&temp="+treeNode.upId;
				
			 	parentWindow = $("#deptiframe")[0].contentWindow;
				parentWindow.frameElement.src= url;
				
			};
		    $(function(){
		    	$.ajax({
					type: "POST",
				    dataType: "json",
				    url: "${path}sys/FuncAction_listDeptTreeByZtree.ms",
					success: function(data){
						if(data){
							$.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
							
							var treeObj = $.fn.zTree.getZTreeObj("index_tree");
							var node = treeObj.getNodeByParam("id", "FA174AFF136D496A87B65443D22357E3", null);
							if(node!=null){
								treeObj.expandNode(node, true, false, true);
							}
							
						}
				    },
					error: function(msg){
							util.alert("error:"+msg.responseText);
					  }
					});
		    });
	
	function initHeight(){
		$('.block1').height($(window).height() - 40 - 12 - 10);//40:距离顶部  12：padding+border  10:距离底部
    	$('#deptiframe').height($(window).height()); 
	}
			
	$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#deptDtoUp_iframeid").val(window.name);
			}
		}
    	
    	initHeight();	
    	newScroll("block1")
    });
    
    $(window).resize(function(){
    
		initHeight();	  
		
	}); 
    
		function reloadPg(msg,title,width,height,time){
		//utilsFp.alert(msg,reloadPgExe);
    	msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		location.reload();
		top.$(".dialog-close").click();
	}
	
	function reloadIframe(){
		$("#deptiframe").attr("src",$("#deptiframe").attr("src"));
		if(nodeId != null && nodeId != "" && nodeId != undefined){
			tree.refreshItem(nodeId);
		}
		
	}
	
	function newScroll(id){   
	 	$("#" + id).mCustomScrollbar({
		    axis:"yx",
			snapAmount:40,
			theme:"minimal-dark",
			keyboard:{scrollAmount:40},
			mouseWheel:{deltaFactor:40,preventDefault:true},
			scrollInertia:80,
	  	});
	}
		</script>
	</body>	
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
	
</html>