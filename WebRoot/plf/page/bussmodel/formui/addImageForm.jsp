<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="图片域" />UI <dict:lang value="配置" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
		<div class="all">
		<div class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_ID" />
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<table class="add_table element_table">

					<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span><dict:lang value="数据来源" />
						</td>
						<td >
							<dict:lang value="常量" />
							<input type="hidden" name="paraMap.UI_DATA_TYPE"
								value="<s:property value="%{@com.more.fw.core.common.method.ConstantsMc@UI_DATA_TYPE_1}" />" />
							
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="图片大小" />
						</td>
						<td >
							<select id="paraMap_UI_DATA_1" lay-search name="paraMap.UI_DATA_1" style="width: 100%"></select>
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="图片保存名称" />
						</td>
						<td >
							<select id="paraMap_UI_DATA_2" lay-search name="paraMap.UI_DATA_2" style="width: 100%"></select>
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="图片保存路径" />
						</td>
						<td >
							<select id="paraMap_UI_DATA_3" lay-search name="paraMap.UI_DATA_3" style="width: 100%"></select>
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="图片保存字节流" />
						</td>
						<td >
							<select id="paraMap_UI_DATA_4" lay-search name="paraMap.UI_DATA_4" style="width: 100%"></select>
						</td>
					</tr>
					
					<tr>
						<td  class="tr1 title" >
							<dict:lang value="预览图片宽度(px)" />
						</td>
						<td  colspan="3">
							<input type = "text" id="REVIEW_WIDTH" name="paraMap.REVIEW_WIDTH" value="<c:out value='${dataMap.REVIEW_WIDTH}'/>" />
						</td>
		 
					</tr>
					
					<tr>
						<td  class="tr1 title" >
							<dict:lang value="预览图片高度(px)" />
						</td>
						<td  colspan="3">
							<input type = "text" id="REVIEW_HEIGHT" name="paraMap.REVIEW_HEIGHT" value="<c:out value='${dataMap.REVIEW_HEIGHT}'/>" />
						</td>
		 
					</tr>
					
				</table>
				
				<div class="ptop_10 txac">			
			
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>							
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin_ui();" class="layui-btn layui-btn-danger">
							
				</div>
				
			</form>
		</div>
		</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		//window.parent.parent.reloadPg(msg);
		window.parent.parent.add();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(thisObj){
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
	}
        
	function valData(){    
		return true;
	}
	
	function setUiData(thisObj){
		$('#UI_DATA_2').hide();
		$('#UI_DATA_3').hide();
		$('#UI_DATA_4').hide();
		$('#UI_DATA_'+$(thisObj).val()).show();
	}
	
		
	function listFormCol(){
		util.showLoading();
		var url = "${path}sys/BussModelAction_listRelColAx.ms";
	    jQuery.ajax({
			type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.ID":"<s:property value="paraMap.FORM_ID" />"},
			success: function(data){
				if(null == data){return;}
				var innerTbody="";
				if(null !=data.ajaxList){
					var formColJqObj1 = $("#paraMap_UI_DATA_1");
					var formColJqObj2 = $("#paraMap_UI_DATA_2");
					var formColJqObj3 = $("#paraMap_UI_DATA_3");
					var formColJqObj4 = $("#paraMap_UI_DATA_4");
					formColJqObj1.append("<option value='' ><dict:lang value='--请选择--' /></option>");
					formColJqObj2.append("<option value='' ><dict:lang value='--请选择--' /></option>");
					formColJqObj3.append("<option value='' ><dict:lang value='--请选择--' /></option>");
					formColJqObj4.append("<option value='' ><dict:lang value='--请选择--' /></option>");
					jQuery.each(data.ajaxList, function(i, map) {
						var selected="";
						if(map.ID=="<s:property value="dataMap.UI_DATA_1" />"){
							selected="selected = \"selected\"";
						}else{
							selected="";
						}
						formColJqObj1.append("<option value='"+map.ID+"' " + selected + ">"+map.COL_NO+"("+map.TITLE_NAME+")"+"</option>");
						if(map.ID=="<s:property value="dataMap.UI_DATA_2" />"){
							selected="selected = \"selected\"";
						}else{
							selected="";
						}
						formColJqObj2.append("<option value='"+map.ID+"' " + selected + ">"+map.COL_NO+"("+map.TITLE_NAME+")"+"</option>");
						if(map.ID=="<s:property value="dataMap.UI_DATA_3" />"){
							selected="selected = \"selected\"";
						}else{
							selected="";
						}
						formColJqObj3.append("<option value='"+map.ID+"' " + selected + ">"+map.COL_NO+"("+map.TITLE_NAME+")"+"</option>");
						if(map.ID=="<s:property value="dataMap.UI_DATA_4" />"){
							selected="selected = \"selected\"";
						}else{
							selected="";
						}
						formColJqObj4.append("<option value='"+map.ID+"' " + selected + ">"+map.COL_NO+"("+map.TITLE_NAME+")"+"</option>");
					});
				}
				util.closeLoading();
				 form.render();
			},
			error: function(msg){
				util.alert("error:"+msg);
				util.closeLoading();
			}
		});
	}
	
	function init(){
		listFormCol();
	}
		setUiData($("#paraMap_UI_DATA_TYPE"));
		
	var form;
$(function(){
	layui.use('form', function(){
	    	 form = layui.form;
	          
			 form.on('submit(filterSubmit)', function (data) {
			 document.getElementById("mcIframeName").value=window.parent.location.href;
			 document.getElementById("curIframeName").value=window.parent.name;
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
	
	    });
	    
	    var REVIEW_WIDTH = document.getElementById("REVIEW_WIDTH");
		REVIEW_WIDTH.addEventListener("input",function()
		{
				$("#REVIEW_WIDTH").attr("value",$("#REVIEW_WIDTH").attr("value").replace(/\D+/g,""));
		});
		
		var REVIEW_HEIGHT = document.getElementById("REVIEW_HEIGHT");
		REVIEW_HEIGHT.addEventListener("input",function()
		{
				$("#REVIEW_HEIGHT").attr("value",$("#REVIEW_HEIGHT").attr("value").replace(/\D+/g,""));
		});
	    
	    
})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>