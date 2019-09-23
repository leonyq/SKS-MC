<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%
	request.setAttribute("pagination", "1");
%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<div id="pageSelect" style="display: none;"><dict:selectDict dictCode="PAGE_SHOW" dictValue="%{page.pageRecord}" 
cssClass="dept_select" style="width:110px;" onchange="deptChangeAx(this)" name="dept"/></div>
<script type="text/javascript" src="${path}plf/page/fp/js/poppage.js?_mc_res_version=<%=PlfStaticRes.POPPAGE_JS %>"></script>
<c:set var="pageImagePath" value="${path}plf/images/common/page/" />
<style>
<!--
.pageImg1 {
	padding-top: 3px;
}
li .chosen-container-single .chosen-single{
	height:25px;
}
li .chosen-container .chosen-drop {border-top:1px solid #75c4ff;border-bottom: 0; background-color: #f8fcff;}
-->
</style>
<script language="javascript">
    var pageImagePath="<c:out value='${pageImagePath}' />";
		_GLO_FORM_PAGE_MAP["<c:out value='${param.formId}'/>"] = new Object();
		_GLO_FORM_PAGE_MAP["<c:out value='${param.formId}'/>"].isPage = true;
		
		
		var enterClickAx=false;
    function fn_turnPageAx_<c:out value='${param.formId}'/>(vflag){
			<c:if test="${param.resetSearchVal !=null && param.resetSearchVal != ''}">
				if(typeof <c:out value='${param.resetSearchVal}'/> != "undefined" && <c:out value='${param.resetSearchVal}'/> instanceof Function){
				    <c:out value='${param.resetSearchVal}'/>();
				}
			</c:if>
    		var currentPage=_GLO_FORM_PAGE_MAP['<c:out value='${param.formId}'/>'].currentPage;
    		currentPage=currentPage-1+1;
    		if(vflag=='previous'){vflag=currentPage-1;}
    		if(vflag=='next'){vflag=currentPage+1;}
    		
    		/*if(GLO_PAGE != undefined){
    			GLO_PAGE[currentContent] = vflag;
    		}*/
    		
    		_GLO_FORM_PAGE_MAP['<c:out value='${param.formId}'/>'].currentPage=vflag;
    		
				<c:if test="${param.showLoading != '0'}">
	    		util.showLoading();
				</c:if>
	
				<c:out value='${param.listDataFn}'/>('<c:out value='${param.formId}'/>');
				closeErrorPageMsgAx('<c:out value="${param.formId}" />');
    	}
    	
    	//var icountAx=1;
    	function fn_goPageAx_<c:out value='${param.formId}'/>(iPage){
		 		var type="^[0-9]*[1-9][0-9]*$";
		    var re = new RegExp(type);
				if(iPage.match(re)==null){
					dispErrorPageMsgAx($("#turnPageText_<c:out value='${param.formId}'/>")[0],_GLO_FP_PAGE_AX_LAB_6+"!",'<c:out value='${param.formId}'/>');
		      enterClickAx=false;
		      setTimeout(function() {
		        $("#turnPageText_<c:out value='${param.formId}'/>").focus();
			     }, 0);
		        return false;
		     }
		 		if(iPage == _GLO_FORM_PAGE_MAP['<c:out value='${param.formId}'/>'].currentPage){
					closeErrorPageMsgAx('<c:out value='${param.formId}'/>');
		 			return false;
		 		}
	
		    if(iPage > _GLO_FORM_PAGE_MAP['<c:out value='${param.formId}'/>'].totalPage){
					dispErrorPageMsgAx($("#turnPageText_<c:out value='${param.formId}'/>")[0],_GLO_FP_PAGE_AX_LAB_7+"<= "+_GLO_FORM_PAGE_MAP['<c:out value='${param.formId}'/>'].totalPage,'<c:out value='${param.formId}'/>');
		        	enterClickAx=false;
		        	setTimeout(function() {
		        		$("#turnPageText_<c:out value='${param.formId}'/>").focus();
			        }, 0);
		        	return false;
		    }
				
				closeErrorPageMsgAx('<c:out value='${param.formId}'/>');
	   		fn_turnPageAx_<c:out value='${param.formId}'/>(iPage);
    	}
	
    	function fn_reloadByChangePerPageAx(icount){
	 		if(icount == _GLO_FORM_PAGE_MAP['<c:out value='${param.formId}'/>'].pageRecord){
	 			closeErrorPageMsgAx('<c:out value='${param.formId}'/>');
	 			return false;
	 		}

	 		_GLO_FORM_PAGE_MAP['<c:out value="${param.formId}"/>'].pageRecord = icount;
	 		closeErrorPageMsgAx('<c:out value="${param.formId}"/>');
			fn_turnPageAx_<c:out value='${param.formId}'/>(1);
    	} 
    </script>

<!-- <table id="_page_bar_table_<c:out value='${param.formId}'/>" border="0" width="100%" style="font-size: 12px"></table>-->
<div id="_page_bar_table_<c:out value='${param.formId}'/>"></div>
<%-- 提示信息DIV --%>
<div id="_page_div_pop_ax_<c:out value='${param.formId}'/>"
	style="position: absolute; display: none; border-style: solid; border-width: 0px; left =100; top =50; line-height: 100%; background: #FEDCAA; color: #BB0000; font-size: 12px;" />