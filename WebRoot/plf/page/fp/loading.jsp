<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
		<%@ include file="/plf/common/pub_meta.jsp"%>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp" />
	    <title><%=CommMethodMc.getText(ConstantsMc.N2_SHOW_TITLE) %></title>
	
	
	<script type="text/javascript">
	 //cjd 页面数据正在加装中 禁用esc、空格、回车等  在iframe加装完，iframe中正常使用  begin 2017-12-15
 
	
	 //cjd 页面数据正在加装中 禁用esc、空格、回车等  在iframe加装完，iframe中正常使用 end2017-12-15
	
	</script>
	</head>
	<body >
          <div class="content-in">
 			    <div class="dialog dialog-s2" style="display:block;top:30%;left:45%">
			        <b class="top"></b>
			        <b class="bottom"></b>
			        <div class="dialog-in">
			          <div class="text text-gray"><img src="${path}plf/page/fp/img/loading.gif?_mc_res_version=<%=PlfStaticRes.LOADING_GIF %>" alt="" /><dict:lang value="数据加载中" />,<dict:lang value="请稍等" />...</div>
			        </div>
    			</div>
          </div>

    <!-- <div id="cls"></div>-->
	</body>	
</html>