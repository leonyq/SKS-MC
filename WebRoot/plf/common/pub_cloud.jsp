<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.ServerMaskUtil"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%
	if(!"0".equals(ConstantsMc.CLOUD_MOD))
	{
		String serverMask = URLEncoder.encode("https://" + ServerMaskUtil.getServerMask());
		request.setAttribute("serverMask", serverMask);
		String userCenterAddress = ConstantsMc.getUserCenterAddress();
		request.setAttribute("userCenterAddress", userCenterAddress);
	}
	request.setAttribute("cloud_mod", ConstantsMc.CLOUD_MOD);

%>

<script src="${path }/plf/js/common/package.js?_mc_res_version=<%=PlfStaticRes.PACKAGEJS %>"></script>
<script src="${path }/plf/js/common/mc_base64_js_to_java.js?_mc_res_version=<%=PlfStaticRes.PACKAGEJS %>"></script>