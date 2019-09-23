<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="前台功能菜单发布" />
	</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="add_form" name="addForm" action="${path}sys/FuncAction_addFunc.ms" method="post" class="layui-form">
				<s:token />
				<s:hidden id="funcDtoUp_id" name="funcDtoUp.id" />
				<s:hidden id="funcDtoUp_name" name="funcDtoUp.name" />
				<s:hidden name="funcDto.isFront" value="1"/>
				<s:hidden name="funcDto.clientType" value="1"/>
				<s:hidden id="colPath" name="colPath" value=""/>
				<s:hidden name="funcDto.type" value="2"/>
				<s:hidden name="funcDto.isShow" value="1"/>
				<input type="hidden" name="jspViewId" value="<c:out value='${jspViewId}' />" id="jspViewId" />
				<table class="add_table">
					<tr>
						<td class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="功能名称" />
						</td>
						<td>
							<input type="text" name="funcDto.name" id="funcDto_name" value="<c:out value='${funcDto.name}' />" readOnly class="readonly"/>
							 <span id="funcDto_name_err"><c:out value='${errors["funcDto.name"][0]}' /></span>
						</td>
						<td>&nbsp;</td>
						<td class="tr1 title">
							功能模型ID
						</td>
						<td>
							<input type="text" name="funcDto.funcMId" id="funcDto_funcMId" maxlength="33" readOnly  class="readonly" value="<c:out value='${funcDto.funcMId}' /> "/>
						</td>					
					</tr>
					<tr>
						<td class="tr1 title">
							<dict:lang value="功能URL" />
						</td>
						<td colspan="4">
							<input type="text" name="funcDto.url" id="funcDto_url" readOnly class="readonly" maxlength="4000" style="width: 100%;" value="<c:out value='${funcDto.url}' />"/>
						</td>
					</tr>
					<tr>
						<td class="tr1 title">
							<dict:lang value="功能图标" />
						</td>
						<td>
							<input type="text" name="funcDto.img" id="funcDto_img" maxlength="30" />
							<span class="Eng"> <span id="funcDto_img_err"></span>
						</td>
						<td>&nbsp;</td>
						<td class="tr1 title">
							<dict:lang value="编码" />
						</td>
						<td>
							<input type="text" name="funcDto.funcCode" id="funcDto_funcCode" maxlength="33" title="<dict:lang value="不填则系统默认" />" />
							<span class="Eng"> <span id="funcDto_funcCode_err"></span>
						</td>						
					</tr>
					<tr>
						<td class="tr1 title">
							<dict:lang value="视图ID" />
						</td>
						<td>
							<input type="text" name="funcDto.viewId" readOnly class="readonly" id="funcDto_viewId" maxlength="33" value="<c:out value='${funcDto.viewId}' />"/>
						</td>
						<td>&nbsp;</td>
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="上级功能名称" />
						</td>
						<td>
							<!--  
							<input type="text" id="up_name" name="up_name" readOnly class="readonly"/>
							<img src="${IMG_PATH}/search.png?_mc_res_version=<%=PlfStaticRes.SEARCH_PNG %>" onclick="showMenuTree();" style="cursor:pointer;" width="20px" height="20px"/>
							<input type="hidden" id="funcdto_upid" name="funcDto.upId"/>
							 <span id="funcDto_upId_err"><c:out value='${errors["funcDto.upId"][0]}' />
							 -->
							 <div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
								<input type="text" id="up_name" name="up_name" readonly="readonly" class="input_indent">
                  		  		<i class="layui-icon layui-icon-search" onclick="showMenuTree();" style="position: absolute;top:11px;right: 8px;"></i>
                  		  		<input type="hidden" id="funcdto_upid" name="funcDto.upId">
               				</div>
						</td>
					</tr>
					<tr>
						<td class="tr1 title">
							<dict:lang value="顺序" />
						</td>
						<td>
							<input type="text" name="funcDto.orderBy" id="funcDto_orderBy" maxlength="3" onkeyup="this.value=this.value.replace(/[^1-9]/gi,'')" />
						</td>
						<td>&nbsp;</td>
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="是否权限控制" />
						</td>
						<td>
							<dict:radioDict id="funcDto_isAuth" name="funcDto.isAuth" dictCode="YESNO" style="width:20px;" onclick="showRole(this.value)"/>
							<span id="funcDto_isAuth_err"><c:out value="${errors['funcDto.isAuth'][0]}" /> </span>
							
						</td>
					</tr>
					<tr id="roleTrId">
						<td class="tr1 title">
							<dict:lang value="角色选择" />
						</td>
						<td colspan="4">
							<input type="text" id="role_name" name="role_name" readOnly class="readonly"/>
							<img src="${IMG_PATH}/search.png?_mc_res_version=<%=PlfStaticRes.SEARCH_PNG %>" onclick="showRoleWin();" style="cursor:pointer;" width="20px" height="20px"/>
							<input type="hidden" id="funcdto_roleid" name="funcDto.roleId"/>
						</td>
					</tr>					
				</table>
				
				<div class="ptop_10 txac">
			 		<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
			</form>
		</div>
		
		<!--  
		<div class="ptop_10 txac">
			<input type="button" value="提 交" onclick="add(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="关 闭" onclick="parent.closePopWin();" class="botton_img_search">
		</div>
		-->
	</div>

	<script type="text/javascript">

	function add(thisObj){

		if(!valData()){
			return ;
		}
		document.forms.add_form.submit();
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}<%-- 防止重复提交 --%>
	}
        
    function valData(){
    	var funcDtoName = document.getElementById("funcDto_name");
    	var funcDtoUpId = document.getElementById("funcdto_upid");
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
    	
    	if(val.isBlank(funcDtoUpId)){
    		document.getElementById("funcDto_upId_err").innerHTML = "<br/>上级功能-不能为空";
    		funcDtoName.focus();
    		return false;
    	}else{
    		document.getElementById("funcDto_upId_err").innerHTML = "";
    	}    
    	
    	var funcDto_img = document.getElementById("funcDto_img");
    	if(!val.isBlank(funcDto_img)){
    		if(funcDto_img.value.indexOf("'")!=-1 || funcDto_img.value.indexOf('"')!=-1 || funcDto_img.value.indexOf('<')!=-1 || funcDto_img.value.indexOf('>')!=-1 || funcDto_img.value.indexOf('?')!=-1){
		      funcDto_img.value = funcDto_img.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\?/g,"");
		      document.getElementById("funcDto_img_err").innerHTML = "<br/>功能图标-不能输入单引号双引号<>?";
    		  funcDto_img.focus();
		      return false;
		    }else{
		    	 document.getElementById("funcDto_img_err").innerHTML = "";
		    }
		    
    	}	
    	
    	var funcDto_funcCode = document.getElementById("funcDto_funcCode");
    	if(!val.isBlank(funcDto_funcCode)){
    		if(funcDto_funcCode.value.indexOf("'")!=-1 || funcDto_funcCode.value.indexOf('"')!=-1 || funcDto_funcCode.value.indexOf('<')!=-1 || funcDto_funcCode.value.indexOf('>')!=-1 || funcDto_funcCode.value.indexOf('?')!=-1){
		      funcDto_funcCode.value = funcDto_funcCode.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\?/g,"");
		      document.getElementById("funcDto_funcCode_err").innerHTML = "<br/>编码	-不能输入单引号双引号<>?";
    		  funcDto_funcCode.focus();
		      return false;
		    }else{
		    	 document.getElementById("funcDto_funcCode_err").innerHTML = "";
		    }
		    
    	}		
    	
    	return true;
    }
    
    //根据功能类型的值，改变是否显示按钮的状态
    function changeButtonsState(val){
    	if(val == "1"){
    		$("#buttonsId").show();
    	}else{
    		$("#buttonsId").hide();
    		$("#role_name").val("");
    		$("#funcdto_roleid").val("");
    	}
    }
    
    //显示菜单树
    function showMenuTree(){
		var url = "${path}sys/FuncAction_listFpFuncTree.ms";
      	showPopWin(url, 300, 400,null,"<dict:lang value="上级功能选择" />");
    }

    //是否显示权限添加窗口
    function showRole(val){
    	if(val == "1"){
    		$("#roleTrId").show();
    	}else{
    		$("#roleTrId").hide();
    	}
    }
    //显示权限窗口
    function showRoleWin(){
		var url = "${path}sys/RoleAction_listRolePublish.ms";
      	showPopWin(url, 500, 400,null,"<dict:lang value="角色选择" />");    	
    }
    
    $(function(){
    	$("#roleTrId").hide();
    	//$("#buttonsId").hide();
    	//$("input:radio[name=funcDto.type]:nth(2)").remove();
    });
    
    layui.use('form', function(){
   	  var form = layui.form;
   	  
   	  //监听提交
	   	 form.verify({
	   		numVerify: function(value,item){
				   if (value==""||/[^0-9]/gi.test(value)) {
		                return '不能为空且只能填入数字';
		            }
			    }
	      });
   });

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>