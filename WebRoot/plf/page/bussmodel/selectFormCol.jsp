<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title><dict:lang value="关联表单字段选择" /></title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="0" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
		
	</jsp:include>
	<link href="${path}/plf/page/fp/css/chosen.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${path}/plf/page/fp/js/iframe-design.js"></script>
	<script type="text/javascript" src="${path}/plf/page/fp/js/chosen.jquery.js"></script>
</head>
<body>

			<div  class="add_table_div">
			<form id="submitForm" class="layui-form" name="submitForm" action="${path}sys/BussModelAction_cfgForm.ms" method="post" target="submitFrame">
				<input type="hidden" name="paraMap.FORM_COL_ID" value="<s:property value="paraMap.ID" />" />
				<input type="hidden" name="paraMap.FORM_ID_S" value="<s:property value="paraMap.FORMID_S" />" />
				<input type="hidden" name="paraMap.FORM_ID_D_UP" value="<s:property value="paraMap.FORMID" />" />
				
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				<table id="add_table" class="add_table">
					<tbody>
						<tr>
							<td class="tr1 title">
								选择关联表单
							</td>
							<td class="widget">
								<!--  
								<select id="paraMap_FORM_ID_D" name="paraMap.FORM_ID_D" class="IS_SELECT_FILTER dept_select" style="width: 99%;"   onchange="listFormCol(this);">
									<s:iterator value="listData">
										<option value="<s:property value='ID'/>">
											<s:property value='FORM_NAME' />
										</option>
									</s:iterator>
								</select>
								-->
								
								<select id="paraMap_FORM_ID_D" name="paraMap.FORM_ID_D"  lay-filter="listFormCol" lay-search>
									<s:iterator value="listData">
										<option value="<s:property value='ID'/>"><s:property value='FORM_NAME' /></option>
									</s:iterator>
								</select>
								
							</td>
						</tr>
						
						<tr>
							<td class="tr1 title">
								选择关联表单字段
							</td>
							<td class="widget">
								<select id="paraMap_FORM_COL_ID_D" name="paraMap.FORM_COL_ID_D" lay-search>
									<s:iterator value="#request.listColData">
										<option value="<s:property value='ID'/>"><s:property value='COL_NO' />(<s:property value='TITLE_NAME' />)</option>
									</s:iterator>
								</select>
							</td>
						</tr>
						
					</tbody>
				</table>
				
				<div class="ptop_10 txac">			
			
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
							
					&nbsp;&nbsp;
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
							
				</div>
				
			</form>
			</div>
		<br>
		<br>
		<br>
		<br>
		<br>

	

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		parent.closePopWin();
		window.parent.reloadPg(msg);
	}
	
	function add(){
		if(null == $("#paraMap_FORM_COL_ID_D").val() || "" == $("#paraMap_FORM_COL_ID_D").val()){
			util.alert("<dict:lang value="选择项不能为空" />");
			return false;
		}
		//document.submitForm.submit();
		return true;
	}
	
	function listFormCol(thisObj){
		util.showLoading();
		var url = "${path}sys/BussModelAction_listRelColAx.ms";
	    jQuery.ajax({
			type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.ID":$(thisObj).val()},
			success: function(data){
				if(null == data){return;}
				var innerTbody="";
				if(null !=data.ajaxList){
					var formJqObj = $(thisObj);
					var formColJqObj = $("#paraMap_FORM_COL_ID_D");
					formColJqObj.empty();
					jQuery.each(data.ajaxList, function(i, map) {
						formColJqObj.append("<option value='"+map.ID+"'>"+map.COL_NO+"("+map.TITLE_NAME+")"+"</option>");
					});
				}
				form.render();
				util.closeLoading();
			},
			error: function(msg){
				util.alert("error:"+msg);
				util.closeLoading();
			}
		});
	}
	
	var form;
	$(function(){
			setChosen();
			//$("#paraMap_FORM_COL_ID_D").chosen();
			
			layui.use('form', function(){
	    	 form = layui.form;
	         form.render();
	          
			 form.on('submit(filterSubmit)', function (data) {
			  document.getElementById("curIframeName").value=window.frameElement.name;
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
			
			form.on('select(listFormCol)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				listFormCol(data.elem);
			
		 	});
	
	    });
	    
	});
	
	function init(){
		
	}
	

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>