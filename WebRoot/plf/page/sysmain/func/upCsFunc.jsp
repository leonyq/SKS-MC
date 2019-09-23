<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="功能菜单修改" /></title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
</head>
<body>
	<div class="all">
		<div  class="add_table_div">
			<form id="up_form" name="upForm" class="layui-form" action="${path}sys/FuncAction_upFunc.ms" method="post">
				<s:token />
				<s:hidden name="funcDto.id" />
				<s:hidden id="funcDtoUp_id" name="funcDto.upId" />
				<s:hidden id="clientType" name="clientType" />
				<s:hidden id="type" name="type" />
				<table class="add_table">
					<tr>
						<td  class="tr1 title">
							<dict:lang value="菜单类型" />
						</td>
						<td class="widget">
							<dict:lang value="CS"/>
							<s:hidden name="funcDto.clientType" value="2"></s:hidden>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							功能类型
						</td>
						<td class="widget">
							<s:if test="type==0&&funcDto.upId=='60'">
								<dict:lang value="模块" />
								<s:hidden value="0" name="funcDto.type"/>
							</s:if>
							<s:if test="type==0&&funcDto.upId!='60'">
								<dict:lang value="功能" />
								<s:hidden value="1" name="funcDto.type"/>
							</s:if>
							<s:if test="type==1">
								<dict:lang value="操作按钮" />
								<s:hidden value="2" name="funcDto.type"/>
							</s:if>
						</td>
					</tr>
					
					<tr>
						<td  class="tr1 title">
						<span class="Eng">*</span>
							功能名称
						</td>
						<td class="widget">
							<input type="text" lay-verify="required" maxlength="30" value="<c:out value='${funcDto.name }' />" name="funcDto.name" id="funcDto_name" />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							功能图标
						</td>
						<td class="widget">
							<input type="text" lay-verify="required" name="funcDto.img" value="<c:out value='${funcDto.img}' />" id="funcDto_img" maxlength="300" />
						</td>
					</tr>
					
					<tr>
						<td  class="tr1 title">
						<span class="Eng">*</span>
							顺序
						</td>
						<td class="widget">
							<input type="text" lay-verify="required" value="<c:out value='${funcDto.orderBy}' />" name="funcDto.orderBy" id="funcDto_orderBy" maxlength="3" />
						</td>
						<td>&nbsp;</td>
						<s:hidden value="0" name="funcDto.isShow"></s:hidden>
						<td  class="tr1 title">
						<span class="Eng">*</span>
							权限控制
						</td>
						<td class="widget">
							<dict:radioDict id="funcDto_isAuth" name="funcDto.isAuth" dictCode="YESNO" dictValue="%{funcDto.isAuth}" style="width:20px;"/>
						</td>
					</tr>
					<s:if test="type==0&&funcDto.upId!='60'">
					<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							菜单类全名
						</td>
						<td  colspan="4">
							<s:textfield name="funcDto.className" maxlength="60" cssStyle="width: 100%;"/>
							
						</td>
						
					</tr>
						</s:if>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="上级功能名称" />
						</td>
						<td  colspan="4">
							<script>
								var mcIframeName= "<c:out value='${mcIframeName}' />";
								var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
								document.write(mcWindow.frames['mainFrame'].getUpName());
							</script>
						</td>
					</tr>	
<%--					<tr>--%>
<%--					   <td   class="tr1 title">--%>
<%--					 <dict:lang value="视图全路径" />  --%>
<%--					     </td>--%>
<%--					   <td colspan="3"> ${funcDto.fullPath  }--%>
<%--					   </td>--%>
<%--					</tr>				--%>
				</table>
				<br />
				<br />
				<br />
				<div class="ptop_10 txac">
					<input type="button" value="提 交" onclick="edit(this);" class="layui-btn">
					<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	var clientType=$("#clientType").val();
	var type=$("#type").val();
	var funcDtoUp_id=$("#funcDtoUp_id").val();
	function edit(thisObj){
		document.forms.up_form.submit();
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}<%-- 防止重复提交 --%>
	}
        
    function valData(){
    	var funcDtoName = document.getElementById("funcDto_name");
    	if(val.isBlank(funcDtoName)){
    		document.getElementById("funcDto_name_err").innerHTML = "<br/>功能名称-不能为空";
    		funcDtoName.focus();
    		return false;
    	}else{
    		document.getElementById("funcDto_name_err").innerHTML = "";
    	}


    	if(undefined == $("input[name='funcDto.isAuth']:checked").val()){
    		document.getElementById("funcDto_isAuth_err").innerHTML = "<br/>是否权限控制-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_isAuth_err").innerHTML = "";
    	}
    	
    	var funcDtoFuncCode = document.getElementById("funcDto_funcCode");
    	
    	if(clientType==2&&type==2){
	    	if(val.isBlank(funcDtoFuncCode)){
	    		document.getElementById("funcDto_funcCode_err").innerHTML = "<br/>编码-不能为空";
	    		funcDtoFuncCode.focus();
	    		return false;
	    	}else{
	    		document.getElementById("funcDto_funcCode_err").innerHTML = "";
	    	}
    	}
    	var funcDto_orderBy = document.getElementById("funcDto_orderBy");
    	if(val.isBlank(funcDto_orderBy.value)){
    		document.getElementById("funcDto_orderBy_err").innerHTML = "<br/>顺序-不能为空";
    		funcDto_orderBy.focus();
    		return false;
    	}
	   	if(isNaN(funcDto_orderBy.value)){
	   	
    		document.getElementById("funcDto_orderBy_err").innerHTML = "<br/>顺序-只能为数字";
    		funcDto_orderBy.focus();
    		return false;
	   	}
	   	var funcDto_className = document.getElementById("funcDto_className");
	   	if(type==0&&funcDtoUp_id!=60){
		   	if(funcDto_className!=undefined&&val.isBlank(funcDto_className.value)){
	    		document.getElementById("funcDto_className_err").innerHTML = "<br/>菜单类全名不能为空";
	    		funcDto_className.focus();
	    		return false;
		   	}else{
	    		document.getElementById("funcDto_className_err").innerHTML = "";
	    	}
	   	}
    	return true;
    }
    $(function(){
    	$("#funcDto_isShow").val("<c:out value='${funcDto.isShow}'/>");
    	$("#funcDto_isFront").val("<c:out value='${funcDto.isFront}'/>");
    	$("#funcDto_upName").val(mcWindow.frames['mainFrame'].getUpName());
    });
    
    layui.use('form', function(){
    	  var form = layui.form;
    	  //监听提交
    });
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>