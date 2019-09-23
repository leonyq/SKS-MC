<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改任务接口" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all" style="height:260px;">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}sys/workMagAction_addModule.ms" method="post" target="submitFrame">
				<table class="add_table">
					<%--<tr>
						<td colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr> 
					<blockquote class="layui-elem-quote"><span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span></blockquote>
					--%><tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="名称：" />
						</td>
						<td colspan="4">
							<input type="text" lay-verify="required" id="MODEL_NAME" maxlength="100" name="paraMap.MODEL_NAME" value="<s:property value="paraMap.MODEL_NAME"/>" class="_VAL_NULL _VAL_DATABASE" style="width:100%;" onkeyup="javascript:replaceLikeVal(this)" />
						</td>
					</tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="任务说明：" />
						</td>
						<td colspan="4">
							<input type="text" lay-verify="required" maxlength="300" id="MODEL_MEMO" name="paraMap.MODEL_MEMO" class="_VAL_NULL _VAL_DATABASE" value="<s:property value="paraMap.MODEL_MEMO"/>" onkeyup="javascript:replaceLikeVal(this)" style="width:100%;" />
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="go" onclick="/*save(this);*/" class="layui-btn">
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<input type="hidden" id="id" name="paraMap.id" value="<s:property value="paraMap.id"/>">
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
	layui.use('form', function(){
	  	  var form = layui.form;
	  	form.on('submit(go)', function(data){
  			save();
  	 	});
	});
	function replaceLikeVal(comp){  
       util.replaceLikeVal(comp)
    }      
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
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
		var dataContext={"paraMap.id":id,"paraMap.TYPE":TYPE,"paraMap.MODEL_NAME":MODEL_NAME
			,"paraMap.MODEL_MEMO":MODEL_MEMO};
			 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}sys/workMagAction_editModule.ms",
    		    data: dataContext,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								top.util.alert("<dict:lang value="操作成功！" />");
    								if(data.ajaxMap.modifyId!=undefined){
    									mcWindow.frames['mainFrame'].modifyTree(data.ajaxMap.modifyId,data.ajaxMap.MODEL_NAME);
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
    					top.util.alert("error:"+msg);
    			  }
    			});		
	}
	/* function init(){
		changeReType();
	}
	function changeReType(){
		var type=$("#TYPE").val();
		if(type=="0"){
			$("#interface").hide();
		}else{
			$("#interface").show();
		}
	} */
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>