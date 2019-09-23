<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title><dict:lang value="选择数据" /></title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		
		<jsp:param name="zTree" value="1" />
		
	</jsp:include>
	<style type="text/css">
		body{overflow:hidden;}
	</style>
</head>
<body>
	<div class="optn" style="position:fixed;top:0;left:30%;margin-bottom:10px;margin-top:5px;">
        <button onclick="add();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        <button onclick="clearSel();"><i class="ico ico-cancel"></i><dict:lang value="清空" /></button>
        <button onclick="parent.closePopWinFp('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');"><i class="ico ico-sc "></i><dict:lang value="关闭" /></button>
	</div>
	<div id="ztree_div" style="position:fixed;top:50px;left:0;overflow:no;height:82%;width:100%;">
	
		<div id="index_tree" class="ztree">
		
	</div>
	
<script type="text/javascript">
	var split = "<c:out value='${split}' />";// 分割符
	var isCheckBox = "<c:out value='${IS_SELECT_MULT}' />";// 是否多选
	var IS_AJAX_SUB = "<c:out value='${IS_AJAX_SUB}' />";// 是否异步加载子节点
	var parentWindow;
	try {
		parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
	}
	catch(err) {
		parentWindow =window.parent;
	}
	var ccbFun = "<c:out value='${ccbFun}' />";
	
	var _key;
	var _value;
	var _resObj = new Object();
	
	var UI_DATA = _mcBase64JsToJava.getMcDealBase64Encode('<c:out value="${UI_DATA}" />');  
	
	//多组织机构数据权限改造lth
	var dataAuth=  '<c:out value="${dataAuth}" />';
	
	var setting = {
		data: {
			simpleData: {
				enable: true,
				pIdKey: "upid"
			}
		},
		callback: {
			onClick: zTreeOnClick,
			onDblClick: add
		},
		async: {
			enable: true,
			url: "${path}buss/bussModel_showTreebyztreeajax.ms?paraMap.UI_DATA="+UI_DATA+"&paraMap.dataAuth="+dataAuth,
			autoParam: ["id"],
			dataFilter: ajaxDataFilter
		},
		edit: {
			enable: true,
			showRemoveBtn: false,
			showRenameBtn: false
		}
	};
	
	var setting_checkbox = {
		data: {
			simpleData: {
				enable: true,
				pIdKey: "upid"
			}
		},
		callback: {
			onClick: zTreeOnClick
		},
		async: {
			enable: true,
			url: "${path}buss/bussModel_showTreebyztreeajax.ms?paraMap.UI_DATA="+UI_DATA,
			autoParam: ["id"],
			dataFilter: ajaxDataFilter
		},
		edit: {
			enable: true,
			showRemoveBtn: false,
			showRenameBtn: false
		},
		
		check: {
			enable: true,
			chkboxType: { "Y": "s", "N": "s" }
		}
		
	};
	
	function zTreeOnClick(event, treeId, treeNode){
		//_key = tree.getSelectedItemId();
		//_value = tree.getSelectedItemText();
		
		_key = treeNode.id;
		_value = treeNode.name;
		
	}
	
	function ajaxDataFilter(treeId, parentNode, responseData) {
	    return responseData.ajaxList;
	};
	
	$(function(){	
		if(IS_AJAX_SUB != "1"){
			//同步
			if(isCheckBox!=null && isCheckBox!='' && isCheckBox=='1'){
				$.fn.zTree.init($("#index_tree"), setting_checkbox);
			}else{
				$.fn.zTree.init($("#index_tree"), setting);
			}
		
			setTimeout(feedBack,3000);//延时3秒 
		}else{
			//异步加载子节点
			//tree.setOnOpenEndHandler(tonclickFeedBack);
			
			if(isCheckBox!=null && isCheckBox!='' && isCheckBox=='1'){
				$.fn.zTree.init($("#index_tree"), setting_checkbox);
			}else{
				$.fn.zTree.init($("#index_tree"), setting);
			}
		
			setTimeout(feedBack,3000);//延时3秒 
			
		}
		
	 _newScroll("ztree_div");//美化滚动条
					
	});
	
	function add(){
		if(isCheckBox != 1){
			//_key = tree.getSelectedItemId();
			//_value = tree.getSelectedItemText();

		}else{
			//var allChk = tree.getAllChecked();
			var treeObj = $.fn.zTree.getZTreeObj("index_tree");
			var allChk = treeObj.getCheckedNodes(true);
			if(allChk != null && allChk.length>0){
				//allChk = allChk.split(",");
				_key = "";
				_value = "";
				for(var i = 0 ; i < allChk.length;i++){
					//_key += allChk[i]+split;
					//_value += tree.getItemText(allChk[i]) + split;
					
					var treeNode=allChk[i];
										
					_key += treeNode.id+split;
					_value += treeNode.name + split;
					
				}
				_key = _key.substring(0,_key.length - split.length);
				_value = _value.substring(0,_value.length - split.length);

				var editName = $(parent._thisSelObj).attr("editName");
				parentWindow._thisSelObj.value = "";

				$("input[name='"+editName+"']",window.parentWindow.document).val("");
				<s:if test="null == #request.ccbFun || \"\" == #request.ccbFun">
				parentWindow._setSelMultValue(_key,_value,_resObj,"");
				</s:if>		
						
			}
			
		}
		
		if(null == _key){
			utilsFp.alert("<dict:lang value="选择项不能为空" />");
			return false;
		}
		var editName = $(parentWindow._thisSelObj).attr("editName");
		parentWindow._thisSelObj.value = "";
		
		$("input[name='"+editName+"']",window.parentWindow.document).val("");
		<s:if test="null == #request.ccbFun || \"\" == #request.ccbFun">
			parentWindow._setSelMultValue(_key,_value,_resObj,"");
		</s:if>			
		<s:else>
		parentWindow.<c:out value='${ccbFun}' />(_key,_value,_resObj);<%-- 加入自定义回调函数 --%>
		</s:else>
		parent.closePopWinFp('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');
	}
	
	function clearSel(){
		<s:if test="null == #request.ccbFun || \"\" == #request.ccbFun">
			parentWindow._setSelValue("","",null);
		</s:if>
		<s:else>
			parentWindow.<c:out value='${ccbFun}' />("","",null);<%-- 加入自定义回调函数 --%>
		</s:else>
		parent.closePopWinFp('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');
	}
	
	//回填
	function feedBack(){
		var editName = $(parentWindow._thisSelObj).attr("editName");
		var hiddenVals = $("input[name='"+editName+"']",window.parentWindow.document).val();//$("input[name='"+editName+"']",window.parent.document).val();
		if(hiddenVals != "" && hiddenVals != null){
			//单选
			if(isCheckBox != 1){
				/*
				//根据ID获取节点
				var subNode = tree._globalIdStorageFind(hiddenVals);
				//tree.setCheck(hiddenVals,un);
				//展开节点
				tree.openItem(hiddenVals);
				//选中节点
				tree._selectItem(subNode,null);
				*/
				
		        checknode(hiddenVals);//选中节点
		        expandnode(hiddenVals);//展开节点
		        
			}else{
				var hVals = hiddenVals.split(split);
				for ( var i = 0; i < hVals.length; i++) {
					/*
					tree.setCheck(hVals[i],1);
					//展开节点
					tree.openItem(hVals[i]);
					*/
					
					checknode(hVals[i]);//选中节点
		        	expandnode(hVals[i]);//展开节点
					
				}
			}
		}
		
		/*
		if(isCheckBox != 1){
			//双击击事件
			tree.setOnDblClickHandler(function(){add()});
		}
		*/
		
	}
	
	//根据id选中节点
	function checknode(nodeid){
		if(nodeid!=null && nodeid!=''){
			var treeObj = $.fn.zTree.getZTreeObj("index_tree");
		    var node = treeObj.getNodeByParam("id",nodeid, null);//根据ID获取节点
		    if(node!=null){
		          treeObj.checkNode(node, true, false);//选中节点
		          treeObj.selectNode(node);
			          
			 }
		 
		}
		 
	}
	//根据id展开节点
	function expandnode(nodeid){
		if(nodeid!=null && nodeid!=''){
			var treeObj = $.fn.zTree.getZTreeObj("index_tree");
		    var node = treeObj.getNodeByParam("id",nodeid, null);//根据ID获取节点
		    if(node!=null){
		          treeObj.expandNode(node, true, false, false);//展开节点
			          
			 }
		 
		}
		 
	}
	
	//异步加载子节点 回填 单击事件
	function tonclickFeedBack(){
		var editName = $(parentWindow._thisSelObj).attr("editName");
		var hiddenVals = $("input[name='"+editName+"']",window.parentWindow.document).val();//$("input[name='"+editName+"']",window.parent.document).val();
		if(hiddenVals != "" && hiddenVals != null){
			//单选
			if(isCheckBox != 1){
				/*
				//根据ID获取节点
				var subNode = tree._globalIdStorageFind(hiddenVals);
				if(subNode != null){
					//选中节点
					tree._selectItem(subNode,null);					
				}
				*/
				
				checknode(hiddenVals);//选中节点

			}else{
				var hVals = hiddenVals.split(split);
				for ( var i = 0; i < hVals.length; i++) {
					//tree.setCheck(hVals[i],1);
					
					checknode(hVals[i]);//选中节点
					
				}
			}
		}		
		
		/*
		if(isCheckBox != 1){
			//双击击事件
			tree.setOnDblClickHandler(function(){add()});
		}
		*/
		
	}
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>