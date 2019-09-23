<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>

<script>
(function(){
	var url = "${path}sys/JClzAction_listCommClass.ms";
	var p = "FUNC_CODE=F30&paraMap.UP_ID=0&paraMap.tri=1";
	var wls = window.location.search;
	if(wls) url = url + wls + "&" + p; else url = url + "?" + p;
	window.location.href= url;
	})()
</script>