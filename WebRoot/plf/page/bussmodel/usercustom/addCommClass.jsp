<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="公用类" /> <dict:lang value="新增" />
	</title>
	
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
			
	</jsp:include>
	
</head>
<body>
	<div class="all">
		<div>
			<div  class="add_table_div">
			<form id="add_form" class="layui-form" name="addForm" action="${path}sys/UserCustomAction_addCommClass.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				 <input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				<table class="add_table">
					<!-- 
					<tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					-->
					
					<tr>
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="类说明" />
						</td>
						
						<td class="widget" >
							<!--  
							<s:textfield name="paraMap.CLASS_DESC" id="paraMap_CLASS_DESC"
								onkeyup="javascript:util.replaceLikeVal(this)"
							
							 maxlength="25" />
							 -->
							 
							 <input type="text" lay-verify="required" name="paraMap.CLASS_DESC" id="paraMap_CLASS_DESC"  onkeyup="util.replaceLikeVal(this)" maxlength="25"/>
							 
						</td>
					</tr> 
				</table>
				
				<div class="ptop_10 txac">
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
							
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
		
			</form>
			</div>
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
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		document.forms.add_form.submit();
		isSubmit = true;
	}
        
	function valData(){
		var paraMap_CLASS_DESC = document.getElementById("paraMap_CLASS_DESC");
   	if(val.isBlank(paraMap_CLASS_DESC)){
   		_alertValMsg(paraMap_CLASS_DESC,"<dict:lang value="类说明" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}
	
	$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
	    	  
	    	  form.on('submit(filterSubmit)', function (data) {
			 	document.getElementById("curIframeName").value=window.frameElement.name;
			 return true;
				       
			})
           
	    });
	    
	})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>