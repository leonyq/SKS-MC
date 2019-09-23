<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="功能菜单修改" /></title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>
<body>
	<div class="all">
		<div  class="add_table_div">
			<form id="up_form" class="layui-form" name="upForm" action="${path}sys/FuncAction_upFunc.ms" method="post">
				<s:token />
				<s:hidden name="funcDto.id" />
				<s:hidden id="funcDtoUp_id" name="funcDtoUp.id" />
				<s:hidden id="funcDtoUp_name" name="funcDtoUp.name" />
				<table class="add_table">
					<tr>
						<td style="width: 100px;" class="tr1">
						<span class="Eng">*</span>
							<dict:lang value="功能名称" />
							
						</td>
						<td style="width: 270px;">
							<s:textfield name="funcDto.name" maxlength="30"  onkeyup="javascript:util.replaceLikeVal(this)" />
						
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="菜单类型" />
						</td>
						<td style="width: 270px;">
							<dict:lang value="PDA"/>
							<s:hidden name="funcDto.clientType" value="3"></s:hidden>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="功能URL" />
						</td>
						<td colspan="4">
							<s:textfield name="funcDto.url" maxlength="4000" cssStyle="width:100%" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1">
							
							<dict:lang value="功能图标" />
						</td>
						<td style="width: 270px;">
							<s:textfield name="funcDto.img" maxlength="300" />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="功能类型" />
						</td>
						<td >
							<dict:radioDict dictCode="FUNC_TYPE" bindEvent="radioChange" dictValue="%{funcDto.type}" id="funcDto_type" name="funcDto.type"
								style="cursor: pointer;width:20px;" onclick="showOpenType(this.value)"/>
							
						</td>
					</tr>
					<!-- 20180131czh-功能标识begin --> 
					<tr id="openTypeTr" <c:if test="${funcDto.type !=1}"> style="display: none;"</c:if>>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="功能标识" />
						</td>
						<td style="width: 270px;">
							<select name="funcDto.funcFlag" id="funcDto_funcFlag" <c:if test="${funcDto.type !=1}"> disabled="disabled"</c:if> >
								<option value="0" <c:if test="${funcDto.funcFlag == '0' }">selected</c:if>><dict:lang value="平台" /></option>
								<option value="1" <c:if test="${funcDto.funcFlag == '1' }">selected</c:if>><dict:lang value="业务" /></option>
							</select>
							<%-- <span class="Eng">* <span id="funcDto_needLogin_err">${errors['funcDto.needLogin'][0]}</span>
							</span> --%>
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="菜单弹出方式" />
						</td>
						<td style="width: 270px;">
							<select name="funcDto.openType" id="funcDto_openType" <c:if test="${funcDto.type !=1}"> disabled="disabled"</c:if>>
								<option value="0" <c:if test="${funcDto.openType == '0' }">selected</c:if>><dict:lang value="系统标签" /></option>
								<option value="1" <c:if test="${funcDto.openType == '1' }">selected</c:if>><dict:lang value="浏览器标签" /></option>
							</select>
							<%-- <span class="Eng">* <span id="funcDto_isAuth_err">${errors['funcDto.isAuth'][0]}</span>
							</span> --%>
						</td>
					</tr>
					<!-- 20180131czh-功能标识end -->
					<tr>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="编码" />
						</td>
						<td style="width: 270px;">
							<s:textfield name="funcDto.funcCode" maxlength="33" />
							
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="菜单类名称" />
						</td>
						<td style="width: 270px;">
							<s:textfield name="funcDto.className" maxlength="60" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="视图ID" />
						</td>
						<td style="width: 270px;">
							<s:textfield name="funcDto.viewId" maxlength="33" onkeyup="javascript:util.replaceLikeVal(this)" />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="功能模型ID" />
						</td>
						<td style="width: 270px;">
							<s:textfield name="funcDto.funcMId" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="是否登录控制" />
						</td>
						<td style="width: 270px;">
							<dict:radioDict id="funcDto_needLogin" name="funcDto.needLogin" dictCode="YESNO" dictValue="%{funcDto.needLogin}" style="width:20px;"/>
						
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="是否权限控制" />
						</td>
						<td style="width: 270px;">
							<dict:radioDict id="funcDto_isAuth" name="funcDto.isAuth" dictCode="YESNO" dictValue="%{funcDto.isAuth}" style="width:20px;"/>
						
						</td>
					</tr>
					
					<tr>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="是否前台菜单" />
						</td>
						<td style="width: 270px;">
							<select name="funcDto.isFront" id="funcDto_isFront">
								<option value="0"><dict:lang value="否" /></option>
								<option value="1" selected><dict:lang value="是" /></option>
							</select>
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="是否显示" />
						</td>
						<td style="width: 270px;">
							<select name="funcDto.isShow" id="funcDto_isShow" width="50px;">
								<option value="0"><dict:lang value="否" /></option>
								<option value="1"><dict:lang value="是" /></option>
							</select>
						</td>							
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1">
							<dict:lang value="上级功能名称" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="funcDto_upName" name="funcDto.upName" readOnly class="readonly input_indent" value=''/>
							<i class="layui-icon layui-icon-search" onclick="showModelTree();" style="    position: absolute;cursor: pointer;left: 392px;bottom: 144px;"></i>
							<input type="hidden" id="funcDto_upId" name="funcDto.upId" value='<s:property value="funcDto.upId"/>'/>
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1">
							顺序
						</td>
						<td style="width: 270px;">
							<s:textfield name="funcDto.orderBy" maxlength="3" />
						
						</td>
					</tr>	
					
					<tr>
					   <td  style="width: 100px;" class="tr1"> <dict:lang value="视图全路径" />  </td>
					   <td colspan="3"><c:out value='${funcDto.fullPath }'/>
					   </td>
					</tr>
					<tr>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="加载类型" />
						</td>
						<td class="widget" >
							<select name="funcDto.loadType"  id="funcDto_loadType">
								<option value="0"><dict:lang value="本地" /></option>
								<option value="1" selected><dict:lang value="网页" /></option>
							</select>
						</td>
						<td>&nbsp;</td>
					</tr>
					
									
				</table>
				<br />
				<br />
				<br />
				<div class="ptop_10 txac">
					<input type="button" value="提 交" onclick="edit(this);" class="layui-btn">
					<input type="reset" value="重 置" class="layui-btn layui-btn-primary" />
					<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	

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

    	if(undefined == $("input[name='funcDto.type']:checked").val()){
    		document.getElementById("funcDto_type_err").innerHTML = "<br/>功能类型-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_type_err").innerHTML = "";
    	}

    	if(undefined == $("input[name='funcDto.isAuth']:checked").val()){
    		document.getElementById("funcDto_isAuth_err").innerHTML = "<br/>是否权限控制-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_isAuth_err").innerHTML = "";
    	}

    	if(undefined == $("input[name='funcDto.needLogin']:checked").val()){
    		document.getElementById("funcDto_needLogin_err").innerHTML = "<br/>是否登录控制-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_needLogin_err").innerHTML = "";
    	}
    	
    	var funcDtoFuncCode = document.getElementById("funcDto_funcCode");
    	if(val.isBlank(funcDtoFuncCode)){
    		document.getElementById("funcDto_funcCode_err").innerHTML = "<br/>编码-不能为空";
    		funcDtoFuncCode.focus();
    		return false;
    	}else{
    		document.getElementById("funcDto_funcCode_err").innerHTML = "";
    	}
    	var funcDto_orderBy = document.getElementById("funcDto_orderBy");
	   	if(isNaN(funcDto_orderBy.value)){
    		document.getElementById("funcDto_orderBy_err").innerHTML = "<br/>顺序-只能为数字";
    		funcDto_orderBy.focus();
    		return false;
	   	}
    	
    	return true;
    }
    
    //功能树
    function showModelTree(){
		var url = "${path}sys/FuncAction_upFuncTree.ms?paraMap.piframeName="+window.frameElement.name;
      	showPopWin(url, 500, 400,null,"<dict:lang value="上级功能菜单" />");
    }
    
	function replaceLikeVal(comp){  
        if (comp.value.indexOf("'") != -1 || comp.value.indexOf("\"") != -1|| comp.value.indexOf("<") != -1|| comp.value.indexOf(">") != -1) 
        {  
            //comp.value = comp.value.substring(0, comp.value.length-1);  
            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"");  
            _alertValMsg($(comp),"<dict:lang value="不能输入单引号双引号<>" />");
        }  
    } 
    $(function(){
    	
    	$("#funcDto_isShow").val("<c:out value='${funcDto.isShow}'/>");
    	$("#funcDto_isFront").val("<c:out value='${funcDto.isFront}'/>");
    	$("#funcDto_loadType").val("<c:out value='${funcDto.loadType}'/>");
    	var mcIframeName= "<c:out value='${mcIframeName}' />";
		var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
    	$("#funcDto_upName").val(mcWindow.frames['mainFrame'].getUpName());
    });
    
    function showOpenType(val) {
    	if(val == "1") {
    		$("#openTypeTr").show();
    		$("#funcDto_openType").removeAttr("disabled");
    		$("#funcDto_funcFlag").removeAttr("disabled");
    	}else {
    		$("#openTypeTr").hide();
    		$("#funcDto_openType").attr("disabled","disabled");
    		$("#funcDto_funcFlag").attr("disabled","disabled");
    	}
     }
    
    layui.use('form', function(){
  	  var form = layui.form;
  	  
  	  //监听提交
  	  form.on('submit(formDemo)', function(data){
  	    layer.msg(JSON.stringify(data.field));
  	    return false;
  	  });
  	  
  	 form.on('radio(radioChange)', function(data){
		  var val = data.value;
		  if(val=="1") {
     		$("#openTypeTr").show();
     		$("#funcDto_funcFlag").removeAttr("disabled");
     		$("#funcDto_openType").removeAttr("disabled");
     	  }else {
     		$("#openTypeTr").hide();
     		$("#funcDto_funcFlag").attr("disabled","disabled");
     		$("#funcDto_openType").attr("disabled","disabled");
     	  };
     	  form.render("select");
	  });
  	});
  	
  	function upFunc(_key,_value){
  		$("#funcDto_upId").val(_key);
		$("#funcDto_upName").val(_value);
  	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>