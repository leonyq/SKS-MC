<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>top</title>
	<jsp:include page="/plf/common/pub_head.jsp" >
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="newTabCss" value="1" />
	</jsp:include>
</head>
<body>
	<div class="top" style="text-align: left;">

		<img alt="" src="${path}plf/page/fp/img/logo_white.png?_mc_res_version=<%=PlfStaticRes.LOGO_WHITE_PNG%>" style="width:110px;height:20px;position: absolute;z-index: 1000;top: 14px;left: 20px;">

		<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
			<tr>
				<td class="img_top" valign="middle" align="center" style="position: relative;">
					<img src="${path}plf/page/fp/img/MC.png" title="<%=com.more.fw.core.common.method.ConstantsMc.VERSION_NO%>">
					<span title="<%=com.more.fw.core.common.method.ConstantsMc.VERSION_NO%>"><%=CommMethodMc.getText(ConstantsMc.MC_SHOW_TITLE) %></span>
						<!-- <%=com.more.fw.core.common.method.ConstantsMc.VERSION_NO%> -->
            <div class="user">
              <div class="info" id="infoDiv" >
                <img src="${path}plf/page/fp/img/tx.jpg?_mc_res_version=<%=PlfStaticRes.TX_JPG%>" id="photoId" width="25" height="25" alt="" />
                	<span class="name">
                		<s:property value="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}" />
                	</span>
              </div>
            </div>
            <div class="state">
              <!--<a href="#" target="_blank" class="s1"></a>-->
              <div class="s2">
                  <!--<div class="s2-drop">         
                    <a href="#" onclick="exit();return false;"><i class="ico ico-tc"></i><dict:lang value="退出系统" /></a>
                </div>-->
              </div>
              <a href="javascript:void(0);" onclick="exit();return false;" title="<dict:lang value="退出系统" />" class="s3"></a>
            </div>	          			
					
					<!-- <div id="_div_top_user_inf" class="div_top">
						<a href="javascript:upMyUser();" title="<dict:lang value="个人信息修改" />">
							<s:property value="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}" />
						</a>
						<a href="javascript:exit();" title="<dict:lang value="退出系统" />">&nbsp;<dict:lang value="退出" />&nbsp;</a>
					</div>-->
				</td>
			</tr>
		</table>
		
		<script type="text/javascript">
			function exit(){
				if(confirm("<dict:lang value="确认退出系统吗？" />")){
					var url = "${path}sys/LoginAction_logout.ms?__random__timeSeq="+new Date();
					window.parent.parent._canClose();
					window.top.location.href = url;
				}
			}
			
			function upMyUser(){
				//var url = "${path}sys/UserAction_showUpMyUser.ms";
				//showPopWin(url, "100%", "100%",null,"<dict:lang value="修改密码"/>");
				//parent.mainFrame.location.href= url;
				$(window.parent.document).contents().find("#mainFrame")[0].contentWindow.window.upMyUser();
				//parent.upMyUser();
			}
			
			//相对于body的鼠标坐标
			function positionBody(event){
				event = event||window.event;
				//获取相对于body定位的横标值
				var x = event.clientX;
				var y = event.clientY;
				parent.showMenu({"x":x,"y":y});
			}
			
			function mousePos(e){
			var x,y;
			var e = e||window.event;
			return {
					x:e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,
					y:e.clientY+document.body.scrollTop+document.documentElement.scrollTop
				};
			}
			
			$(function(){
				
			   var photoName = "<s:property value="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].photoName}" />";
		       if(photoName != null && photoName != ""){
					$("#photoId").attr("src","${path}plf/userPhoto/"+photoName);
		       }else{
		       		$("#photoId").attr("src","${path}plf/images/user.png");
		       }			
			});
		</script>
		
</body>
<%@ include file="/plf/common/pub_end.jsp"%>