<%@page import="com.more.fw.core.common.method.ProductType"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="用户设置" /></title>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
	</head>
<body>
<%
	  ProductType CURR_PRO = com.more.fw.core.sysfa.fil.filter.LoginFilter.getCURR_PRO();//标签
%>
<div class="customer comwrap">
 
  <div >
    <div class="container" style="height:575px;border-top:0;">
        <div class="side" style="width:160px;">
            <ul class="neir-list" id="tabList">
				<li>
					<a href="javascript:void(0);" onclick="showMainFrame('${path}sys/UserAction_showUpMyPW.ms',this);" class="item-con"><dict:lang value="修改密码" /></a>
				</li>
				 <% if(ProductType.MC.equals(CURR_PRO)){ %>
				<li>
					<a href="javascript:void(0);" onclick="showMainFrame('${path}sys/FootPlatformAction_footPlatform.ms',this);" class="item-con"><dict:lang value="工作台" /></a>
				</li>
				<%} %>
				<li>
					<a href="javascript:void(0);" onclick="showMainFrame('${path}sys/UserTargetDataAction_queryUserData.ms',this);" class="item-con"><dict:lang value="首页数据" /></a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="showMainFrame('${path}sys/UserAction_showUpMyUser.ms',this);" class="item-con"><dict:lang value="用户信息" /></a>
				</li>					
            </ul>
        </div>
        <div class="main" style="padding: 2px 10px 0;">
        	<iframe  scrolling="auto" frameborder="0" allowtransparency="true" id="userSettingMainFrame" width="100%" height="590px" src="${path}plf/page/fp/loading.jsp" style="overflow:hidden;"></iframe>
        </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	//显示页面
	function showMainFrame(url,obj){
		
		$(obj).parent().addClass("item current").siblings().removeClass("item current");
		$("#userSettingMainFrame").prop("src",url);
	}
	//刷新首页功能设置
	function reloadIframe(){
		$("#userSettingMainFrame").attr("src",$("#userSettingMainFrame").attr("src"));
	}

	$(function(){
		showMainFrame("${path}sys/UserAction_showUpMyPW.ms",$("#tabList li:first").find("a"));
    	$('.dialog-bd',parent.document).css('padding-top','0')
    });

</script>

</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>