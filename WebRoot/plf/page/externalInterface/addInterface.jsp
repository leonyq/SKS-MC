<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="对外接口" /> <dict:lang value="新增模块接口" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>
<body>
	<div class="all" >
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}exInterface/externalInterfaceAction_addModule.ms" method="post" target="submitFrame">
				<table class="add_table">
					<%-- <tr>
						<td colspan="4">
							<blockquote class="layui-elem-quote"><span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span></blockquote>
							
					</td>
					</tr>--%>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="新增类型" />
						</td>
						<td style="width: 270px;">							
							<dict:selectDict name="paraMap.TYPE" id="TYPE" dictCode="MC_EXTERNAL_TYPE" dictValue="${fn:escapeXml(paraMap.TYPE)}" onchange="changeReType();"/>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="名称" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required" id="MODEL_NAME" maxlength="100" name="paraMap.MODEL_NAME" value="<s:property value="paraMap.MODEL_NAME"/>" class="_VAL_NULL _VAL_DATABASE" />
						</td>
					</tr>
					<tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="模块说明" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required" maxlength="300" id="MODEL_MEMO" name="paraMap.MODEL_MEMO" class="_VAL_NULL _VAL_DATABASE" value="<s:property value="paraMap.MODEL_MEMO"/>"  />
						</td>
					</tr>
				
				
				<%--<table class="add_table" id="interface" style="display:none"> --%>
					<tr id="interface" style="display:none">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口类型：" />
						</td>
						<td style="width: 270px;">
							<c:set var='FLAG_set' value='<c:out value="${paraMap.FLAG}"/>'/>
							
							<dict:selectDict name="paraMap.FLAG" id="FLAG" dictCode="MC_EXTERNAL_INTERFACE" dictValue="${fn:escapeXml(FLAG_set)}" />
						</td>
					</tr> 
					<tr>
					</table>
				<%--</table>--%>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="*" onclick="/*save(this);*/" class="layui-btn">
					<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<input type="hidden" id="typeFlag" name="paraMap.typeFlag" value="<s:property value="ajaxMap.typeFlag"/>">
				<input type="hidden" id="id" name="paraMap.id" value="<s:property value="ajaxMap.id"/>">
				<input type="hidden" id="UP_ID" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
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
				$("#interface").attr("style","display:none;");
			}else{
				$("#interface").attr("style","");
			}
  			//console.info(val);
		});
  		form.on('submit(*)', function(data){
  			save();
  	 	});
  		form.render("select");
	});
	var mcIframeName = '<s:property value="ajaxMap.mcIframeName"/>';
	var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
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
		var typeFlag = $("#typeFlag").val();
		var id = $("#id").val();
		var TYPE = $("#TYPE").val();
		var MODEL_NAME = $("#MODEL_NAME").val();
		var MODEL_MEMO = $("#MODEL_MEMO").val();
		var FLAG = $("#FLAG").val();
		var UP_ID = $("#UP_ID").val();
		
		/* var reg = /^[a-zA-Z0-9\\_]{0,}$/;
		if(!reg.test(MODEL_NAME)){
			util.alert("<dict:lang value="名称，只能由字母、数字、_组成请检查" />...");
			return ;
		}
		if(!reg.test(MODEL_MEMO)){
			util.alert("<dict:lang value="模块说明，只能由字母、数字、_组成请检查" />...");
			return ;
		} */
		var dataContext={"paraMap.id":id,"paraMap.TYPE":TYPE,"paraMap.MODEL_NAME":MODEL_NAME
			,"paraMap.MODEL_MEMO":MODEL_MEMO,"paraMap.FLAG":FLAG,"paraMap.UP_ID":UP_ID,"paraMap.typeFlag":typeFlag};
			 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}exInterface/externalInterfaceAction_addModule.ms",
    		    data: dataContext,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								top.util.alert("<dict:lang value="操作成功！" />");
    								if(data.ajaxMap.modifyId!=undefined){
    								    if(TYPE==0){
    								    	mcWindow.frames['mainFrame'].modifyTree(data.ajaxMap.modifyId,data.ajaxMap.MODEL_NAME);
    								    }
    								}else{
    									if(TYPE==0){
    										mcWindow.frames['mainFrame'].addTree(data.ajaxMap.addId,data.ajaxMap.MODEL_NAME,UP_ID);
    									}
    								}
    								mcWindow.frames['mainFrame'].flashPage();
    								closePopWin();
    							}else{
    								top.util.alert("<dict:lang value="操作失败：" />:"+data.ajaxMap.msg);
    							}
         				}
    				},
    			error: function(msg){
    					util.closeLoading();
    					util.alert("error:"+msg);
    			  }
    			});		
	}
	function init(){
		changeReType();
	}
	function changeReType(){
		var type=$("#TYPE").val();
		if(type=="0"){
			$("#interface").hide();
		}else{
			$("#interface").show();
		}
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>