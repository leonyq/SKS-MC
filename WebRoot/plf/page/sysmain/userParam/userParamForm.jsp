<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="视图模型" /> <dict:lang value="新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	<style type="text/css">
	.ico-search-input {
		background: url(plf/page/fp/img/ico-search-h-c.png?_mc_res_version=<%=PlfStaticRes.ICO_SEARCH_H_C_PNG%>) no-repeat right;
		cursor: pointer;
		left: 230px;
		top: 6px; 
		height:21px;
		border: 1px solid #A9A9A9;
	}
	</style>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="add_form" class="layui-form" name="addForm" action="${path}sys/FuncAction_addUserParamForm.ms" method="post">
				<s:token />
				<input type="hidden" id="paraMap_ID" name="paraMap.ID" value="<c:out value='${userParam.ID}'/>" />
				<input type="hidden" id="paraMap_DATA_AUTH" name="paraMap.DATA_AUTH" value="<c:out value='${userParam.DATA_AUTH}'/>" />
				
				
				<table class="add_table">
					<s:if test="${isEnableAuth eq '1'}">
						<tr>
							<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
								<span class="Eng">*</span><dict:lang value="组织机构" />
							</td>
							<td>
								<s:if test="${not empty platformParam.ID}">
									<input type="text" readonly style="width: 100%;" value="<c:out value="${authDataName}"/>"/>
								</s:if>
								<s:else>
								    <input type="text" readonly style="width: 100%;" value="<c:out value="${sessionScope.mcDataAuthName}"/>"/>
								</s:else>
							</td>
						</tr>
					</s:if>
					<tr>
						<td class="tr1 mc_form_title mc_form_title"><span class="Eng">*</span><dict:lang value="初始参数" /></td>
						<td>
							<dict:radioDict id="userParam_IS_INIT" verify="paraMapIsInit" name="paraMap.IS_INIT"  dictValue="${userParam.IS_INIT}"  dictCode="YESNO" style="width:20px;"/>
<%--  						    <select class="input_sh" lay-search name="paraMap.IS_INIT">
									<option value="0" <s:if test="${userParam.IS_INIT eq '0'}">selected</s:if>><dict:lang value="否" /></option>
									<option value="1" <s:if test="${userParam.IS_INIT eq '1'}">selected</s:if>><dict:lang value="是" /></option>
							</select> --%>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="参数KEY" />
						</td>
						<td style="width: 270px;">
							<input id="paraMap_PNAME" lay-verify="required" type="text" style="width: 100%;" <c:if test="${not empty userParam.ID}">readonly="readonly"</c:if> name="paraMap.PNAME"  value="<c:out value='${userParam.PNAME}'/>" >
							
						</td>
					</tr>
					<tr >
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="参数VALUE" />
						</td>
						<td colspan="4">
							<textarea name="paraMap.PVALUE" lay-verify="required" id="paraMap_PVALUE"  rows="5" cols="150" style="width: 100%;" ><c:out value='${userParam.PVALUE}'/></textarea>
						</td>
					</tr>
					
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="*" onclick="/*add(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
			</form>
		</div>
		
		
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
	  	  form.render("select");
	  	  form.render("radio");
		  form.on('submit(*)', function(data){
		 		document.forms.add_form.submit();
		 		
		 });
		form.verify({
    		  paraMapIsInit: function(value,item){
    			  var val=$('input:radio[name="paraMap.IS_INIT"]:checked').val();
    		      if(!val){
    		        return '<dict:lang value="初始参数不能为空" />';
    		      }
    		    }
           });
	});
	
	function add(thisObj){
		var pName = $("#paraMap_PNAME").val();
		var pValue = $("#paraMap_PVALUE").val();
		if(pName.trim()==""){
			_alertValMsg($("#paraMap_PNAME"),"<dict:lang value="参数KEY" /> -- <dict:lang value="不能为空" />");
   			return false;
		}
		
		if(pValue.trim()==""){
			_alertValMsg($("#paraMap_PVALUE"),"<dict:lang value="参数VALUE" /> -- <dict:lang value="不能为空" />");
   			return false;
		}
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.add_form.submit();
		isSubmit = true;
	}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>