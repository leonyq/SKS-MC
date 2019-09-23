<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title><dict:lang value="选择数据" /></title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="dhtmlxtree" value="1" />
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
	<div style="position:fixed;top:50px;left:0;overflow:no;height:82%;width:100%;">
		<div id="index_tree" class="tree" style="padding:10px;margin-bottom:10px;border:1px solid silver"/>
	</div>
	<script type="text/javascript">
	var split = "<c:out value='${split}' />";
	var isCheckBox = "<c:out value='${IS_SELECT_MULT}' />";
	var IS_AJAX_SUB = "<c:out value='${IS_AJAX_SUB}' />";
	var parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
	var tree = new dhtmlXTreeObject("index_tree","100%","100%","-1");
	tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
	
		<s:if test="null != #request.IS_SELECT_MULT && ''!= #request.IS_SELECT_MULT && 1 == #request.IS_SELECT_MULT">
			tree.enableCheckBoxes(1);//1启用checkbox
			tree.enableThreeStateCheckboxes(true);//是否级联选中
		</s:if>	
		//tree.setItemTopOffset(tree.getSelectedItemId(),"1px");
		if(IS_AJAX_SUB != "1"){
			<s:if test="null != #request.funcTreeXml && ''!= #request.funcTreeXml">
				tree.loadXMLString("<c:out value='${funcTreeXml}' />");
			</s:if>	
		}else{
			tree.loadXML("${path}buss/bussModel_showTreeXml.ms?paraMap.UI_DATA=<c:out value='${paraMap.UI_DATA}' />");
			tree.setXMLAutoLoading("${path}buss/bussModel_showTreeXml.ms?paraMap.UI_DATA=<c:out value='${paraMap.UI_DATA}' />");
		}

	//异步加载子节点 回填 单击事件
	function tonclickFeedBack(){
		var editName = $(parentWindow._thisSelObj).attr("editName");
		var hiddenVals = $("input[name='"+editName+"']",window.parentWindow.document).val();//$("input[name='"+editName+"']",window.parent.document).val();
		if(hiddenVals != "" && hiddenVals != null){
			//单选
			if(isCheckBox != 1){
				//根据ID获取节点
				var subNode = tree._globalIdStorageFind(hiddenVals);
				if(subNode != null){
					//选中节点
					tree._selectItem(subNode,null);					
				}

			}else{
				var hVals = hiddenVals.split(split);
				for ( var i = 0; i < hVals.length; i++) {
					tree.setCheck(hVals[i],1);
				}
			}
		}		
		if(isCheckBox != 1){
			//双击击事件
			tree.setOnDblClickHandler(function(){add()});
		}
	}

	function add(){
		
		if(isCheckBox != 1){
			//console.log("click:"+tree.getSelectedItemId()+":"+tree.getSelectedItemText());
			_key = tree.getSelectedItemId();
			_value = tree.getSelectedItemText();

		}else{
			var allChk = tree.getAllChecked();
			if(allChk != "" && allChk != null){
				allChk = allChk.split(",");
				_key = "";
				_value = "";
				for(var i = 0 ; i < allChk.length;i++){
					_key += allChk[i]+split;
					_value += tree.getItemText(allChk[i]) + split;
				}
				_key = _key.substring(0,_key.length - split.length);
				_value = _value.substring(0,_value.length - split.length);
				/*if(parent._thisSelObj.value != "" &&　parent._thisSelObj.value != null){
					_key = split + _key;
					_value = split + _value;
				}*/
				var editName = $(parent._thisSelObj).attr("editName");
				parentWindow._thisSelObj.value = "";
				//console.log($("input[name='"+editName+"']",window.parent.document).val());
				//$("input[name='"+editName+"']",window.parent.document).val("");
				$("input[name='"+editName+"']",window.parentWindow.document).val("");
				<s:if test="null == #request.ccbFun || \"\" == #request.ccbFun">
				parentWindow._setSelMultValue(_key,_value,_resObj,"");
				</s:if>				
			}
			//_setSelMultValue
		}
		
		if(null == _key){
			utilsFp.alert("<dict:lang value="选择项不能为空" />");
			return false;
		}
		var editName = $(parentWindow._thisSelObj).attr("editName");
		parentWindow._thisSelObj.value = "";
		//console.log($("input[name='"+editName+"']",window.parent.document).val());
		//$("input[name='"+editName+"']",window.parent.document).val("");
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
	
	var _key;
	var _value;
	var _resObj = new Object();
	
	//回填
	function feedBack(){
		var editName = $(parentWindow._thisSelObj).attr("editName");
		var hiddenVals = $("input[name='"+editName+"']",window.parentWindow.document).val();//$("input[name='"+editName+"']",window.parent.document).val();
		if(hiddenVals != "" && hiddenVals != null){
			//单选
			if(isCheckBox != 1){
				//根据ID获取节点
				var subNode = tree._globalIdStorageFind(hiddenVals);
				//tree.setCheck(hiddenVals,un);
				//展开节点
				tree.openItem(hiddenVals);
				//选中节点
				tree._selectItem(subNode,null);
			}else{
				var hVals = hiddenVals.split(split);
				for ( var i = 0; i < hVals.length; i++) {
					tree.setCheck(hVals[i],1);
					//展开节点
					tree.openItem(hVals[i]);
				}
			}
		}
		
		if(isCheckBox != 1){
			//双击击事件
			tree.setOnDblClickHandler(function(){add()});
		}
	}
	
	$(function(){
		if(IS_AJAX_SUB != "1"){
			feedBack();
		}
		else{
			tree.setOnOpenEndHandler(tonclickFeedBack);
		}
	});

</script>
		<!-- <div class="ptop_1 txac">
			<input id="submit_but" type="button" value="<dict:lang value="提交" />" onclick="add();" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="清空" />" onclick="clearSel();" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
		</div>
		
		<br>-->
</body>
<%@ include file="/plf/common/pub_end.jsp"%>