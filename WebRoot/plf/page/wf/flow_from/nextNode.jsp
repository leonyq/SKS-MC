<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="下一节点办理人" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
   <link href="${path}plf/page/wf/flow_from/css/style.css" rel="stylesheet" type="text/css" />

	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />

   	<link href="${path}plf/page/wf/process/css/style.css" rel="stylesheet" type="text/css" />
   	 <script src="${path}plf/js/jquery/jquery.min.js"></script>
	</head>
<style>
p{
  margin:0px;
}
.data{
    padding-top: 7px;
}

</style>
<body style="overflow: hidden;">
<div style="height:100%;overflow-y:auto">
  <div class="flow-data">
   <div class="data">
	     <span class="node-name">部门副主管审批节点</span>
	     <div class="node-content">
	     <p>
	        <span> 姓名</span>
	         <span>职位</span>
	       </p>
	      
	      <p>
	        <span> 姓名</span>
	         <span>职位</span>
	       </p>
	      
	      <p>
     </div>
   </div>
    <div class="data">
	     <span class="node-name">部门副主管审批节点</span>
	     <div class="node-content">
	     <p>
	        <span> 姓名</span>
	         <span>职位</span>
	       </p>
	      
	      <p>
	        <span> 姓名</span>
	         <span>职位</span>
	       </p>
	      
	      <p>
     </div>
   </div>
  </div>

	
 <script>

 $(".data:odd").css("background", "rgb(237,237,237)");
 $(".data-imp").hover(function(){
	 $(".pointer-show").text("");
	 $(this).children(".pointer-show").show();
	 $(".pointer-show").text($(this).text());
	 
 },function(){
	 $(this).children(".pointer-show").hide();
 })

   
</script>	
	
	
	
	
	
	
  

   
   
  


<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>