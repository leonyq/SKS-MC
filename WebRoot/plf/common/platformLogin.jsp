<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="功能菜单新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
    <script type="text/javascript" src="${basePath}plf/js/login.js?_mc_res_version=<%=PlfStaticRes.LOGIN_JS %>"></script>
</head>
<body>
	<div >
		<div  class="add_table_div">
			<form class="layui-form" action="">
			 <div class="layui-form-item">
	          <label class="layui-form-label"></label>
	          <div class="layui-input-block" style="margin: 0">
	          		   <blockquote class="layui-elem-quote" style="margin-top: 10px;">
             		 <div style="text-align:left" id="test-util-countdown-ret">	<span style='color:red;margin-left: -90px;'>未获得开发权限，请输入密码重新验证</span>
		   	           </div>
            	</blockquote>
	          </div>
	        </div>
	        
	        
	        <div class="layui-form-item">
	          <label class="layui-form-label">用户名</label>
	          <div class="layui-input-block">
	            <input type="text" name="loginName" required="" lay-verify="required" readonly="readonly" value="${sessionScope.SESSION_USERDTO_KEY.loginName}" lay-vertype="tips" placeholder="请输入用户名" autocomplete="off" class="layui-input">
	          </div>
	        </div>
	        <div class="layui-form-item">
	          <label class="layui-form-label">密码</label>
	          <div class="layui-input-block">
	            <input type="password" name="password" required="" lay-verify="required" lay-vertype="tips" placeholder="请输入密码" autocomplete="off" class="layui-input">
	          </div>
	        </div>
	       <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit="" lay-filter="component-form-element">提交</button>
                  <button type="reset" class="layui-btn layui-btn-primary" onclick="closePopWin();" >关闭</button>
                </div>
              </div>
      </form>
		</div>
		<br />
		<br />
		<br />
		
	</div>

	<script type="text/javascript">
	var mcIframeName = "<c:out value='${mcIframeName}' />";
	var type = "<c:out value='${type}' />";
	var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
	var isSubmit = false;
    layui.use('form', function(){
    	  var form = layui.form;
    	  form.on('submit(component-form-element)', function(data){
			  if(isSubmit){
				  util.alert("<dict:lang value="正在提交,请稍候" />",null,"");
				  return false;
			  }
			  isSubmit = true;
    		    var loginName = data.field.loginName;
    		    var loginRandomKey = "<c:out value='${login_random_key}' />";
    		    var pwd =encrypt("<c:out value='${login_random_key}' />",data.field.password);
    		    var source = "1";
    		    var param = {isFramesetMethod:true,frameName:"leftFrame",methodName:'reloadPage'};
    		    $.ajax({
    	   			url:"${path}fp/FpAction_getDataAuthByUserInfo.ms?loadMark=10",
    	   			type:"post",
    	   			data:{loginName:loginName,password:pwd,loginRandomKey:loginRandomKey,source:source},
    	   	 		success:function(data) {
						isSubmit = false;
    	   	 			   if(data.ajaxMap.state=="1"){
    	   	 				 closePopWin();
    	   	 				 if(type=="1"){
    	   	 					mcWindow.location.reload(); 
    	   	 				 }else if(type=="2"){
    	   	 					mcWindow.frames['leftFrame'].location.reload(); 
    	   	 				 }else{
    	   	 					mcWindow.frames['mainFrame'].location.reload(); 
    	   	 				 }
    	   	 			  }else{
    	   	 				layer.msg('用户名密码错误！', {icon: 5});
    	   	 			  }
    	   	 		},
    	   	 		error:function(data) {
    	   	 			isSubmit = false;
    	   	 			util.alert(data);
    	   	 		}
    	   	 	});
    			return false;
    		});
    	  
    });
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>