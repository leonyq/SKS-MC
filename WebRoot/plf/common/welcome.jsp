<%@page language="java" errorPage="/plf/error.jsp" isErrorPage="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<html>
	<head>
		<title><dict:lang value="欢迎页面" />
		</title>
		<style>
			#divId p{
				width:100%;
				position:absolute;
				text-align:center;
			}
			
			.p1{
				font-size:26px;
				top:160px;
			}
			
			.p1 span{
				font-weight:bold;
			}
			
			.p2{
				font-size:20px;
				top:205px;
			}
			
			.pic{
				position:absolute;
				width:160px;
				height:45px;
				top:285px;
				left:calc(50% - 80px);
			}
		</style>
		<jsp:include page="/plf/common/pub_head.jsp" />
		<script type="text/javascript">
  		$(window).resize(function(){
  			cover();
		});
		
		function cover(){
			var winWidth = $(window).width()-1;
			var winHeight = $(window).height()-1;
			$("#imgId").attr({width:winWidth,height:winHeight});
		}

		$(function(){
			cover();
		});
		
		</script>
	</head>
	<body>
		<div id="divId" style="position:absolute;">
			<img id="imgId" alt="" src="${path}plf/page/fp/img/welcome-bg.png?_mc_res_version=<%=PlfStaticRes.WELCOME_BG_PNG %>">
			<p class="p1"><span>开源、微服务、BI、可视化</span>快速开发的PAAS平台</p>
			<p class="p2">简化系统应用的开发、运行和维护</p>
			<img class="pic" src="${path}plf/page/fp/img/welcome.png?_mc_res_version=<%=PlfStaticRes.WELCOME_PNG %>">
		</div>
	</body>
</html>