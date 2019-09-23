<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="前台功能菜单发布" />
	</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
</head>
<body>
	<div class="all">
		<div  class="add_table_div">
			<form id="add_form" class="layui-form" name="addForm" action="${path}sys/FuncAction_addFunc.ms" method="post">
				<s:token />
				<s:hidden id="funcDtoUp_id" name="funcDtoUp.id" />
				<s:hidden id="funcDtoUp_name" name="funcDtoUp.name" />
				<s:hidden id="colPath" name="colPath" value=""/>
				<s:hidden name="funcDto.isFront" value="1"/>
				<s:hidden name="funcDto.clientType" value="1"/>
				<s:hidden name="funcDto.type" value="1"/>
				<s:hidden name="addPublishFunc" value="addPublishFunc"/>
				<table class="add_table">
					<tr>
						<td  class="tr1 title">
						    <span class="Eng">*  </span>
							<dict:lang value="功能名称" />
						</td>
						<td class="widget">
							<input type="text"  lay-verify="required"  name="funcDto.name" id="funcDto_name" value="<c:out value='${funcDto.name}' />"/>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<dict:lang value="是否显示" />
						</td>
						<td class="widget">
							<select name="funcDto.isShow" id="funcDto_isShow">
								<option value="0"><dict:lang value="否" /></option>
								<option value="1" selected><dict:lang value="是" /></option>
							</select>
						</td>						
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="功能URL" />
						</td>
						<td  colspan="4">
							<input type="text" name="funcDto.url" id="funcDto_url" readOnly class="readonly" maxlength="4000" style="width: 100%;" value="<c:out value='${paraMap.URL}' />"/>
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<span class="Eng"></span>
							<dict:lang value="功能图标" />
						</td>
						<td class="widget">
							<input type="text" name="funcDto.img" id="funcDto_img" maxlength="30" />
							
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng" id="funcDto_funcCode_err"></span>
							<dict:lang value="编码" />
						</td>
						<td class="widget">
							<input type="text" name="funcDto.funcCode" id="funcDto_funcCode" maxlength="33" title="<dict:lang value="不填则系统默认" />" />
							
						</td>						
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="视图ID" />
						</td>
						<td class="widget">
							<input type="text" name="funcDto.viewId" readOnly class="readonly" id="funcDto_viewId" maxlength="33" value="<c:out value='${funcDto.viewId}' />"/>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="上级功能名称" />
						</td>
						<td class="widget">
							<%--<input type="text" id="up_name" name="up_name" readOnly class="readonly"/>
							<img src="${IMG_PATH}/search.png?_mc_res_version=<%=PlfStaticRes.SEARCH_PNG %>" onclick="showMenuTree();" style="cursor:pointer;" width="20px" height="20px"/>
							<input type="hidden" id="funcdto_upid" name="funcDto.upId"/>
							
							--%><div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
								<input type="text" id="up_name"  lay-verify="required" name="up_name" readonly="readonly" class="input_indent" >
                  		  		<i class="layui-icon layui-icon-search" onclick="showMenuTree();" style="position: absolute;top:11px;right: 8px;"></i>
                  		  		<input type="hidden" id="funcdto_upid" name="funcDto.upId"/>
               				</div>
							
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<span class="Eng"><span id="funcDto_orderBy_err"></span></span>
							<dict:lang value="顺序" />
						</td>
						<td class="widget">
							<input type="text" name="funcDto.orderBy" id="funcDto_orderBy" maxlength="3" />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="权限控制" />
						</td>
						<td class="widget">
							<dict:radioDict id="funcDto_isAuth" bindEvent="radioChange" name="funcDto.isAuth" dictValue="0" dictCode="YESNO" style="width:20px;" onclick="showRole(this.value)"/>
							
						</td>
					</tr>
					<tr id="roleTrId">
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="角色选择" />
						</td>
						<td colspan="3">
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
								<input type="text"  lay-verify="role_name_rge"   id="role_name" name="role_name" readOnly class="readonly input_indent"/>
                  		  		<i class="layui-icon layui-icon-search" onclick="showRoleWin();" style="position: absolute;top:11px;right: 8px;"></i>
                  		  		<input type="hidden" id="funcdto_roleid" name="funcDto.roleId"/>
               				</div>
							
						</td>
					</tr>
					<!-- 业务功能发布，菜单弹出方式begin -->					
					<tr id="openType">
						<td  class="tr1 title">
							<dict:lang value="菜单弹出方式" />
						</td>
						<td  colspan="3">
							<select name="funcDto.openType" id="funcDto_openType">
								<option value="0" selected><dict:lang value="系统标签" /></option>
								<option value="1" ><dict:lang value="浏览器标签" /></option>
							</select>
						</td>
					</tr>
					<!-- 业务功能发布，浏览器打开方式end -->					
					<tr id="buttonsId">
						<td  class="tr1 title">
							<dict:lang value="操作功能" />
						</td>
						<td  colspan="4">
							<s:iterator value="dataList" status="index">
								<input type="checkbox" title="<s:property value="ACT_NAME"/>" value="<s:property value="ID"/>;<s:property value="TYPE"/>"  name="paraMap.commonButton" style="cursor: pointer;width:20px;" id="paraMap_commonButton_<s:property value="#index.count"/>" />
								<%--<label for="paraMap_commonButton_<s:property value="#index.count"/>"><s:property value="ACT_NAME"/></label>
								--%><input type="hidden" id="paraMap_<s:property value="ID"/>" name="paraMap._<s:property value="ID"/>" value="<s:property value="ACT_NAME"/>"/>
								<input type="hidden" id="paraMap_<s:property value="ID"/>_<s:property value="JSP_VIEW_ID"/>" name="paraMap._<s:property value="ID"/>_JSP_VIEW_ID" value="<s:property value="JSP_VIEW_ID"/>"/>
							</s:iterator>
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="备注说明" />
						</td>
						<td  colspan="4">
							<textarea rows="3" name="funcDto.remarkText" id="funcDto_remarkText" class="" maxlength="4000" style="width: 100%;resize:none;" ><c:out value='${paraMap.remarkText}' /></textarea>
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
		 <button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div>
			</form>
		</div>
		
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
    	
    	//跨站脚本漏洞处理lth
	   	if(funcDtoName.value.indexOf("'")!=-1 || funcDtoName.value.indexOf('"')!=-1 || funcDtoName.value.indexOf('<')!=-1 || funcDtoName.value.indexOf('>')!=-1){
	   	 	funcDtoName.value = funcDtoName.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"");
	   		document.getElementById("funcDto_name_err").innerHTML = "<br/>功能名称-不能输入单引号双引号<>";
	   		return false;
	   	}
	   	var funcDto_funcCode = document.getElementById("funcDto_funcCode");
	   	if(funcDto_funcCode.value!=''){
	   		if(funcDto_funcCode.value.indexOf("'")!=-1 || funcDto_funcCode.value.indexOf('"')!=-1 || funcDto_funcCode.value.indexOf('<')!=-1 || funcDto_funcCode.value.indexOf('>')!=-1){
		   	 	funcDto_funcCode.value = funcDto_funcCode.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"");
		   		document.getElementById("funcDto_funcCode_err").innerHTML = "<br/>编码-不能输入单引号双引号<>";
		   		return false;
		   	}else{
		   		document.getElementById("funcDto_funcCode_err").innerHTML = "";
		   	}
		   	
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
    		if(funcDto_img.value.indexOf("'")!=-1 || funcDto_img.value.indexOf('"')!=-1 || funcDto_img.value.indexOf('<')!=-1 || funcDto_img.value.indexOf('>')!=-1){
		   	 	funcDto_img.value = funcDto_img.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"");
		   		document.getElementById("funcDto_img_err").innerHTML = "<br/>功能图标-不能输入单引号双引号<>";
		   		return false;
		   	}else{
		   		document.getElementById("funcDto_img_err").innerHTML = "";
		   	}
	   	
    	}
    	
    	var funcDto_orderBy = document.getElementById("funcDto_orderBy");
    	if(!val.isBlank(funcDto_orderBy)){
    		if(isNaN(funcDto_orderBy.value)){
				document.getElementById("funcDto_orderBy_err").innerHTML = "<br/>顺序-只能输入数字";
		   		return false;
			}else{
		   		document.getElementById("funcDto_orderBy_err").innerHTML = "";
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
    	}
    }
    
    //显示菜单树
    function showMenuTree(){
		var url = "${path}sys/FuncAction_listFpFuncTree.ms?curIframeName="+ window.frameElement.name;
      	showPopWin(url, 400, 500,null,"<dict:lang value="上级功能选择" />");
    }
    
    //是否显示权限添加窗口
    function showRole(val){
    	if(val == "1"){
    		$("#roleTrId").show();
    	}else{
    		$("#roleTrId").hide();
    		$("#role_name").val("");
    		$("#funcdto_roleid").val("");
    	}
    }
    //显示权限窗口
    function showRoleWin(){
		var url = "${path}sys/RoleAction_listRolePublish.ms?curIframeName="+ window.frameElement.name;
      	showPopWin(url, 800, 600,null,"<dict:lang value="角色选择" />");    	
    }
    $(function(){
    	$("#roleTrId").hide();
    	//$("#buttonsId").hide();
    	//$("input:radio[name=funcDto.type]:nth(2)").remove();
    });
    
    layui.use('form', function(){
     	  var form = layui.form;
     	  //监听提交
     	  form.on('radio(radioChange)', function(data){
    		  var val = data.value;
    		  if(val == "1"){
    	    		$("#roleTrId").show();
    	    	}else{
    	    		$("#roleTrId").hide();
    	    		$("#role_name").val("");
    	    		$("#funcdto_roleid").val("");
    	    	}
          	form.render("select");
    	  });
     	  
     	 form.verify({
     		role_name_rge: function(value,item){
  			   var isAuth = $("input[name='funcDto.isAuth']:checked").val();
  			   if(isAuth=="1"&&value==""){
  				 return "<dict:lang value="角色不能为空！" />";
  			   };
  		    }
        });
     });

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>