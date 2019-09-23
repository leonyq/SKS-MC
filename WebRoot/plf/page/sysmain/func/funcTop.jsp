<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title>功能菜单框架</title>
		<jsp:include page="/plf/common/pub_head.jsp" />
        
        <script type="text/javascript">
	    function reSetDicH(){
	    	var height = $(window).height();
	    	$("#myIframe").height(height-4);
	    }
	    $(document).ready(function(){reSetDicH();});	 
    	window.onresize=function(){reSetDicH();}   
  		//window.top.document.all("myIframe").style.height=document.body.scrollHeight;
    	
        </script>
	</head>
<body>
	<iframe id="myIframe" src="${path}/plf/page/sysmain/func/funcFrame.jsp" width="100%" "height=100%" marginwidth=0 />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>