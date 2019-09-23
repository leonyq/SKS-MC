<%@page language="java" errorPage="/plf/error.jsp" isErrorPage="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>

<html>
	<head>
		<title><dict:lang value="无权限页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
	<style>
	html,body{
	  height:100%;
	}
   .limit{
	   width:100%;
	   height:100%;
	   text-align: center;
	   display: table;
	   font-size:16px;
	   color:#b5b5b6;
	     
	  }
	  .limit-message{
	     display: table-cell;
         vertical-align: middle;
         
	  }
	  .limit-message img{
	     display: block;
         margin: 0 auto;
	  }
	</style>
	<body bgcolor="#ffffff">
      <!--  
	        <br>
			<br>
		<h2 style="text-align: center;">
			<br>
			<font color="#FF0000">Unauthorized access to this function</font>
			<br>
			<br>
		</h2>

		<hr width="80%">
		<h3 style="text-align: center;">
			<br>
			<br>
			<dict:lang value="无权限访问该功能" />
			<br>
			<br>
		</h3>
		<hr width="80%">
		<br>
		<s:actionerror />  -->
		<div class="limit">
		    <p class="limit-message">
		     <img alt="noAccess" src="/mc/plf/images/noAccess.png">
		     <dict:lang value="无权限访问该功能~" />
		               
		    </p>
		</div>

	</body>
	
	<script type="text/javascript">
		$(function(){
			var isPlatform =  "<c:out value='${isPlatform}' />";
			if(isPlatform=="1"){
				var config = {
						type: 2,
						skin: 'layui-layer-molv',
						title:'权限认证',
						area: ['500px', '350px'],
						min: function(index, layero){
						},
						success: function(){
							
						}
					};
					  var mcIframeName = window.frameElement.name;
					  var type = "1";
					  if(mcIframeName=="leftFrame"){
						  mcIframeName = window.parent.name;
						   type = "2";
						  
					  }else if(window.frameElement.name=="mainFrame"){
						  mcIframeName = window.parent.name;
						  type = "3";
					  }
					  config.content = "${path}fp/FpAction_forPlatFormLogin.ms?mcIframeName="+mcIframeName+"&type="+type;
					  top.layer.open(config);
			}
		});	
		function reloadPage(){
			window.location.reload();
		}
		
	</script>
</html>