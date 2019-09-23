<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>

<%
	request.setAttribute("pagination", "1");
%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<script type="text/javascript" 
src="${path}plf/js/common/page/page.js?_mc_res_version=<%=PlfStaticRes.PAGE_JS %>"></script>
<c:set var="pageImagePath" value="${path}plf/images/common/page/" />
<style>
<!--
.pageImg1 {
	padding-top: 3px;
}
-->
</style>
<script language="javascript">
    var pageImagePath="<c:out value='${pageImagePath}' />";
		//var pagAx = new Object();
		//pagAx.isPage = true;
		//_GLO_FORM_PAGE_MAP['<c:out value='${param.formId}' />'] = pagAx;
		_GLO_FORM_PAGE_MAP["<c:out value='${param.formId}' />"] = new Object();
		_GLO_FORM_PAGE_MAP["<c:out value='${param.formId}' />"].isPage = true;
		
		
		var enterClickAx=false;
    function fn_turnPageAx_<c:out value='${param.formId}' />(vflag){
			<c:if test="${param.resetSearchVal !=null && param.resetSearchVal != ''}">
				if(typeof <c:out value='${param.resetSearchVal}' /> != "undefined" && <c:out value='${param.resetSearchVal}' /> instanceof Function){
				   <c:out value='${param.resetSearchVal}' />();
				}
			</c:if>
    		var currentPage=_GLO_FORM_PAGE_MAP["<c:out value='${param.formId}' />"].currentPage;
    		currentPage=currentPage-1+1;
    		if(vflag=='previous'){vflag=currentPage-1;}
    		if(vflag=='next'){vflag=currentPage+1;}
    		
    		/*if(GLO_PAGE != undefined){
    			GLO_PAGE[currentContent] = vflag;
    		}*/
    		
    		_GLO_FORM_PAGE_MAP["<c:out value='${param.formId}' />"].currentPage=vflag;
    		
				<c:if test="${param.showLoading != '0'}">
	    		util.showLoading();
				</c:if>
	
				<c:out value='${param.listDataFn}' />("<c:out value='${param.formId}' />");
				closeErrorPageMsgAx("<c:out value='${param.formId}' />");
    	}
    	
    	//var icountAx=1;
    	function fn_goPageAx_<c:out value='${param.formId}' />(iPage){
		 		var type="^[0-9]*[1-9][0-9]*$";
		    var re = new RegExp(type);
				if(iPage.match(re)==null){
					dispErrorPageMsgAx($("#turnPageText_<c:out value='${param.formId}' />")[0],"请输入大于零的整数!","<c:out value='${param.formId}' />");
		      enterClickAx=false;
		      setTimeout(function() {
		        $("#turnPageText_<c:out value='${param.formId}' />").focus();
			     }, 0);
		        return false;
		     }
		 		if(iPage == _GLO_FORM_PAGE_MAP['<c:out value="${param.formId}" />'].currentPage){
					closeErrorPageMsgAx("<c:out value='${param.formId}' />");
		 			return false;
		 		}
	
		    if(iPage > _GLO_FORM_PAGE_MAP["<c:out value='${param.formId}' />"].totalPage){
					dispErrorPageMsgAx($("#turnPageText_<c:out value='${param.formId}' />")[0],"最大页数应<= "+_GLO_FORM_PAGE_MAP["<c:out value='${param.formId}' />"].totalPage,"<c:out value='${param.formId}' />");
		        	enterClickAx=false;
		        	setTimeout(function() {
		        		$("#turnPageText_<c:out value='${param.formId}' />").focus();
			        }, 0);
		        	return false;
		    }
				
				closeErrorPageMsgAx("<c:out value='${param.formId}' />");
	   		fn_turnPageAx_<c:out value='${param.formId}' />(iPage);
    	}
	
    </script>

<table id="_page_bar_table_<c:out value='${param.formId}' />" border="0" width="100%" style="font-size: 12px"></table>

<%-- 提示信息DIV --%>
<div id="_page_div_pop_ax_<c:out value='${param.formId}' />"
	style="position: absolute; display: none; border-style: solid; border-width: 0px; left =100; top =50; line-height: 100%; background: #FEDCAA; color: #BB0000; font-size: 12px;" />