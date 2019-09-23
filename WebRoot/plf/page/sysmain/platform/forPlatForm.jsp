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
			<form id="add_form" class="layui-form" name="addForm" action="${path}sys/FuncAction_addPlatForm.ms" method="post">
				<s:token />
				<input type="hidden" id="paraMap_ID" name="paraMap.ID" value="<c:out value='${platformParam.ID}'/>" />
				<table class="add_table">
				<s:if test="${isEnableAuth eq '1'}">
					<tr>
						<td style="width: 105px;" class="tr1 mc_form_title">
							<span class="Eng">*</span><dict:lang value="组织机构" />
						</td>
						<td>
							<s:if test="${not empty platformParam.ID}">
								<input type="text" readonly style="width:240px;" title="<c:out value="${authDataName}"/>" value="<c:out value="${authDataName}"/>"/>
							</s:if>
							<s:else>
							    <input type="text" readonly style="width:240px;" title="<c:out value="${sessionScope.mcDataAuthName}"/>" value="<c:out value="${sessionScope.mcDataAuthName}"/>"/>
							</s:else>
						</td>
					</tr>
				</s:if>
					<tr>
						<td class="tr1 mc_form_title">
							<span class="Eng">*</span><dict:lang value="参数KEY" />
						</td>
						<td style="width: 240px;">
							<input id="paraMap_PNAME" lay-verify="required" type="text" style="width:240px;"  <c:if test="${not empty platformParam.ID}">readonly="readonly"</c:if> name="paraMap.PNAME"  value="<c:out value='${platformParam.PNAME}'/>" >
							
						</td>
						<td>
							&nbsp;
						</td>
						<td style="width: 115px;" class="tr1 mc_form_title">
							<dict:lang value="参数类型" />
						</td>
						<td style="width: 240px;">
						<dict:selectDict dictCode="PLATFORM_PARAMS_TYPE" style="width:240px;" dictValue="<c:out value='${ platformParam.PTYPE}'/>"  id="paraMap_PTYPE" name="paraMap.PTYPE" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
						</td>
					</tr>
					
					<tr>
						<td class="tr1 mc_form_title">
							<span class="Eng">*</span><dict:lang value="状态" />
						</td>
						<td style="width: 240px;">
							<label for="STATE1" class="cursor_hand">
							<input type="radio" id="STATE1" name="paraMap.STATE" title="启用" value="1"  <c:if test="${empty platformParam.ID}">checked="checked"</c:if>  <c:if test="${platformParam.STATE eq '1'}">checked="checked"</c:if>    />
							</label>
							<label for="STATE2" class="cursor_hand">
							<input type="radio" id="STATE2" name="paraMap.STATE" title="禁用" value="2" <c:if test="${platformParam.STATE eq '2'}">checked="checked"</c:if>  />
							</label>
						</td>
						<td>
							&nbsp;
						</td>
						<td class="tr1 mc_form_title">
							<span class="Eng">*</span><dict:lang value="是否立即生效" />
						</td>
						<td style="width: 240px;">
							<label for="STATE1" class="cursor_hand">
							<input type="radio" id="STATE1" name="paraMap.WIE" title="是" value="1"   <c:if test="${platformParam.WIE eq '1'}">checked="checked"</c:if> />
							</label>
							<label for="STATE2" class="cursor_hand">
							<input type="radio" id="STATE2" name="paraMap.WIE" title="否" value="2" <c:if test="${empty platformParam.ID}">checked="checked"</c:if>  <c:if test="${platformParam.WIE eq '2'}">checked="checked"</c:if>  />
							</label>
						</td>
					</tr>
					<tr >
						<td class="tr1 mc_form_title">
							<dict:lang value="参数VALUE" />
						</td>
						<td colspan="4">
							<textarea name="paraMap.PVALUE" lay-verify="required" id="paraMap_PVALUE"  rows="5" cols="150" style="width: 100%;" ><c:out value='${platformParam.PVALUE}'/></textarea>
						</td>
					</tr>
					
					<tr >
						<td class="tr1 mc_form_title">
							<dict:lang value="参数说明" />
						</td>
						<td colspan="4">
							<textarea name="paraMap.PTEXT" id="paraMap_PTEXT"  rows="5" cols="150" style="width: 100%;" ><c:out value='${platformParam.PTEXT}'/></textarea>
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