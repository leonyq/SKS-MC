<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增模块接口" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	
</head>
<body>
	<div class="all">
		<div class="add_table_div" style="margin-top: 50px;">
			<form id="addForm" class="layui-form" name="addForm" action="${path}sys/workMagAction_addModule.ms" method="post" target="submitFrame">
				<table class="add_table">
					<%-- 
					<tr>
						<td colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<blockquote class="layui-elem-quote"><span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span></blockquote>
					--%><tr>
						<td style="width: 140px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="任务类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict name="paraMap.TYPE" id="TYPE" dictCode="MC_EXTERNAL_TYPE" dictValue="<s:property value='paraMap.TYPE'/>" onchange="changeReType();"/>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="名称" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required" id="MODEL_NAME" maxlength="100" name="paraMap.MODEL_NAME" value="<c:out value='${paraMap.MODEL_NAME}'/>" class="_VAL_NULL _VAL_DATABASE" onkeyup="javascript:replaceLikeVal(this)"  />
						</td>
					</tr>
					<tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="任务说明" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required" maxlength="300" id="MODEL_MEMO" name="paraMap.MODEL_MEMO" class="_VAL_NULL _VAL_DATABASE" value="<s:property value="paraMap.MODEL_MEMO"/>" onkeyup="javascript:replaceLikeVal(this)"  />
						</td>
					</tr>
				
				<%-- <table class="add_table" id="interface" style="display:none">--%>
					<tr id="interface" style="display:none">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict name="paraMap.FLAG" id="FLAG" dictCode="MC_WORK_TYPE" dictValue="<s:property value='paraMap.FLAG'/>" />
						</td>
					</tr> 
					
				<%--</table>--%>
				</table>
				<div class="ptop_10 txac">
					<input id="saveButton" type="button" lay-submit lay-filter="go" value="<dict:lang value="保存" />" onclick="/*save(this);*/" class="layui-btn">
					<input id="nextButton"type="button" lay-submit lay-filter="gon" value="<dict:lang value="下一步" />"  onclick="/*next(this);*/" class="layui-btn layui-btn-warm">
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<input type="hidden" id="id" name="paraMap.id" value="<s:property value="ajaxMap.id"/>">
				<input type="hidden" id="UP_ID" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
			</form>
		</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<form id="workSubmit" name="workSubmit" action="${path}sys/workMagAction_toWorkPage.ms" method="post">
		<input type="hidden" id="upId" name="paraMap.UP_ID" />
		<input type="hidden" id="workType" name="paraMap.FLAG"/>
		<input type="hidden" id="modelMemo" name="paraMap.MODEL_MEMO"/>
		<input type="hidden" id="modelName" name="paraMap.MODEL_NAME"/>
		<input type="hidden" id="type" name="paraMap.TYPE"/>
	</form>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	function replaceLikeVal(comp){  
      util.replaceLikeVal(comp);
    }
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	$(function(){
		$("#TYPE").attr("lay-filter","changeReType");
	});
	layui.use('form', function(){
	  	  var form = layui.form;
	  		form.on('select(changeReType)',function(data){   
	  		  var val=data.value;
		  		if(val=="0"){
					$("#interface").hide();
					$("#nextButton").hide();
					$("#saveButton").show();
				}else{
					$("#saveButton").hide();
					$("#interface").show();
					$("#nextButton").show();
				}
	  			//console.info(val);
			});
	  		form.render("select");
	  		form.on('submit(go)', function(data){
	  			save();
	  	 	});
	  		form.on('submit(gon)', function(data){
	  			next();
	  	 	});
		});
	function next(thisObj){
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		if(!val.valDataBaseSetData()){
			return ;
		}
		var interf=$("#interface").val();
		$("#workType").val($("#FLAG").val());
		$("#modelMemo").val($("#MODEL_MEMO").val());
		$("#modelName").val($("#MODEL_NAME").val());
		$("#upId").val($("#UP_ID").val());
		$("#type").val($("#TYPE").val());
		document.forms.workSubmit.submit();
	}
	
	function save(thisObj){
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		if(!val.valDataBaseSetData()){
			return ;
		}
		var mcIframeName = $("#mcIframeName").val();
		var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
		var id = $("#id").val();
		var TYPE = $("#TYPE").val();
		var MODEL_NAME = $("#MODEL_NAME").val();
		var MODEL_MEMO = $("#MODEL_MEMO").val();
		var FLAG = $("#FLAG").val();
		var UP_ID = $("#UP_ID").val();
		var dataContext={"paraMap.id":id,"paraMap.TYPE":TYPE,"paraMap.MODEL_NAME":MODEL_NAME
			,"paraMap.MODEL_MEMO":MODEL_MEMO,"paraMap.FLAG":FLAG,"paraMap.UP_ID":UP_ID};
			 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}sys/workMagAction_addModule.ms",
    		    data: dataContext,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								top.util.alert("<dict:lang value="操作成功！" />");
    								mcWindow.frames['mainFrame'].addTree(data.ajaxMap.addId,data.ajaxMap.MODEL_NAME);
    								mcWindow.frames['mainFrame'].flashPage();
    								closePopWin();
    							}else{
    								top.util.alert("<dict:lang value="操作失败：" />:"+data.ajaxMap.msg);
    							}
         				}
         				
    				},
    			error: function(XMLHttpRequest, textStatus, errorThrown){
    				alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                    alert(errorThrown);
<%--    					util.closeLoading();--%>
<%--    					util.alert("error:"+msg);--%>
    			  }
    			});		
	}
	function init(){
		changeReType();
		$("#nextButton").hide();
	}
	function changeReType(){
		var type=$("#TYPE").val();
		if(type=="0"){
			$("#interface").hide();
			$("#nextButton").hide();
			$("#saveButton").show();
		}else{
			$("#saveButton").hide();
			$("#interface").show();
			$("#nextButton").show();
		}
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>