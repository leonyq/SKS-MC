<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@page import="com.more.fw.core.report.util.FineReportToken"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>

<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%> 
 <%
 String ReportPathPram=CommMethodMc.escapeJs(request.getParameter("ReportPathPram").trim());
 String url=ReadProperties.getPorpertie("cluster.properties","WEB_REPORT_SERVICE").trim()+"/WebReport/ReportServer?"+ReportPathPram;  
 String title=CommMethodMc.escapeJs(request.getParameter("title"));
 title= CommMethodMc .getText(title );
 if(title==null)title="web报表";
 title=title.trim();
 if("".equals(title))title="web报表";
 String tokenVal=FineReportToken.getWebSessionLoginIdToken();
  %>
  <!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><%=CommMethodMc.escapeJs(title) %>
	</title>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" 
	src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	 
	</head>
  <iframe id="reportFrame" name="reportFrame" width="100%" height="100%" ></iframe>
 <form  id="reportForm" name="reportForm" action="<%=url%>" method="post"  target="reportFrame">
    
   <input type="hidden" name="FUNC_CODE" value='<%=CommMethodMc.escapeJs(request.getParameter("FUNC_CODE")) %>'/>
    <input type="hidden" name="tokenVal"  value='<%=CommMethodMc.escapeJs(tokenVal) %>'/>
    <input type="hidden" name="deptId" value='<%=CommMethodMc.escapeJs(CommMethodMc.getSessionUser().getDeptId()) %>'/>
    <input type="hidden" name="deptName" value='<%=CommMethodMc.escapeJs(CommMethodMc.getSessionUser().getDeptName())%>'/>
    <input type="hidden" name="loginId" value='<%=CommMethodMc.escapeJs(CommMethodMc.getSessionUser().getLoginLogId())%>'/>
    <input type="hidden" name="loginName" value='<%=CommMethodMc.escapeJs(CommMethodMc.getSessionUser().getLoginName())%>'/>
    <!-- 
    <input type="hidden" name="person_id"  value='C119'/>
   -->
     <% 
    String ReportPram=CommMethodMc.escapeJs(request.getParameter("ReportPram"));
    if(ReportPram==null)ReportPram="";
    ReportPram=ReportPram.trim();  
    if(!"".equals(ReportPram))
      {
        String[] arrReportPram=ReportPram.split(","); 
        if(arrReportPram!=null)
         for(String aStr:arrReportPram){
            String[] arrEq=aStr.split("[=]");
            if(arrEq!=null)
              out.println("<input type='hidden' name='"+arrEq[0].trim()+"' value='"+arrEq[1].trim()+"''/>");
         }//for(String aStr:arrReportPram){
      }// if(!"".equals(ReportPram))
   %>
  
  <script> 
    $("#reportForm").submit();  
    //检查 chkSessionObj(){
    function chkSessionObj(){
       var url = util.getContextPath()+"/sys/report/FrepAction_ChkSessionHeartBeat.ms";  
       $.post(url, {},
                function(data){                   
                    if(data!="0") 
                      top.location.href=util.getContextPath(); 
                  }, "json");
       setTimeout(function(){ chkSessionObj(); }, 30000);//帆软心态默认值30秒
    }//function chkSessionObj(){
    chkSessionObj(); 
  </script>
</form>