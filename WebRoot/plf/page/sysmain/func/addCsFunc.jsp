<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="功能菜单新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
</head>
<body>
	<div class="all">
		<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/FuncAction_addFunc.ms" method="post">
				<s:token />
				<s:hidden id="funcDtoUp_id" name="funcDto.upId" />			
				<s:hidden id="clientType" name="clientType" />
				<input type="hidden" name="colPath" value="<c:out value='${colPath}' />">
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
						<td  class="tr1">
							<dict:lang value="功能类型" />
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
						<td  class="tr1">
						    <span class="Eng">*</span>
							<dict:lang value="功能名称" />
						</td>
						<td class="widget">
							<input type="text" lay-verify="required" name="funcDto.name" id="funcDto_name" />
						</td>
						<td>&nbsp;</td>
						<td class="tr1">
						    <span class="Eng">*</span>
							<dict:lang value="功能图标" />
						</td>
						<td class="widget">
							<input type="text" lay-verify="required" name="funcDto.img" id="funcDto_img" maxlength="300" />
							
						</td>
					</tr>
					
					<tr>
						<td  class="tr1">
						    <span class="Eng">*</span>
							<dict:lang value="顺序" />
						</td>
						<td class="widget">
							<input type="text" lay-verify="required" name="funcDto.orderBy" id="funcDto_orderBy" maxlength="3" />
						</td>
						<td>&nbsp;</td>
						<s:hidden value="0" name="funcDto.isShow"></s:hidden>
						<td  class="tr1">
						    <span class="Eng">*</span>
							<dict:lang value="权限控制" />
						</td>
						<td class="widget">
							<dict:radioDict id="funcDto_isAuth" name="funcDto.isAuth" dictValue="0" dictCode="YESNO" style="width:20px;"/>
						</td>
					
							
					</tr>
					<s:if test="type==0&&funcDto.upId!='60'">
					<tr>
							
						<td  class="tr1">
							<span class="Eng">*</span>
							<dict:lang value="菜单类全名" />
						</td>
						<td class="widget" colspan="3">
							<input type="text" name="funcDto.className" id="funcDto_className" maxlength="130" style="width: 93%;" title="<dict:lang value="CS菜单类型需要填写" />"/>
						</td>
						
					</tr>
					</s:if>
					<tr>
						<td  class="tr1">
							<dict:lang value="上级功能名称" />
						</td>
						<td class="widget" colspan="3">
							<script><%--
							 var shows = top.document.getElementById("LAY_app_body").getElementsByClassName("layui-show")[0];
							 var iframe = shows.getElementsByTagName("iframe");
							 document.write(iframe[0].contentWindow['getUpName']());
						--%>
						var mcIframeName= "<c:out value='${mcIframeName}' />";
						var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
						document.write(mcWindow.frames['mainFrame'].getUpName());
						</script>
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
			 <button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div>
			</form>
		</div>
		<br />
		<br />
		<br />
		
	</div>

	<script type="text/javascript">
	var clientType=$("#clientType").val();
	var funcDtoUp_id=$("#funcDtoUp_id").val();
	var type=$("#type").val();
	function add(thisObj){
		if(!valData()){
			return ;
		}
		document.forms.add_form.submit();
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}<%-- 防止重复提交 --%>
	}
        
    function valData(){
    	var funcDtoName = document.getElementById("funcDto_name");
    	if(val.isBlank(funcDtoName.value)){
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
    	var funcDto_orderBy = document.getElementById("funcDto_orderBy");
	   	if(isNaN(funcDto_orderBy.value)){
    		document.getElementById("funcDto_orderBy_err").innerHTML = "<br/>顺序-只能为数字";
    		funcDto_orderBy.focus();
    		return false;
	   	}
	   	if(val.isBlank(funcDto_orderBy.value)){
    		document.getElementById("funcDto_orderBy_err").innerHTML = "<br/>顺序-不能为空";
    		funcDto_orderBy.focus();
    		return false;
    	}
    	var funcDto_className = document.getElementById("funcDto_className");
    	if(type==0&&funcDtoUp_id!=60){
	    	if(val.isBlank(funcDto_className.value)){
	    		document.getElementById("funcDto_className_error").innerHTML = "<br/>类全名-不能为空";
	    		funcDto_className.focus();
	    		return false;
	    	}else{
	    		document.getElementById("funcDto_className").innerHTML = "";
	    	}
    	}
    	var funcDto_img = document.getElementById("funcDto_img");
	    	if(val.isBlank(funcDto_img.value)){
	    		document.getElementById("funcDto_img_error").innerHTML = "<br/>功能图标-不能为空";
	    		funcDto_img.focus();
	    		return false;
	    	}else{
	    		document.getElementById("funcDto_img_error").innerHTML = "";
	    	}
    	return true;
    }
    
    
    layui.use('form', function(){
  	  var form = layui.form;
  	  //监听提交
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
  	  form.verify({
  		  funcDtoType: function(value,item){
  			  var val=$('input:radio[name="funcDto.type"]:checked').val();
  		      if(!val){
  		        return '功能类型不能为空！';
  		      }
  		    },
  		  funcDtoIsAuth: function(value,item){
				  var val=$('input:radio[name="funcDto.isAuth"]:checked').val();
			      if(!val){
			        return '权限控制不能为空！';
			      }
			  }
         });
  	  
  });

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>