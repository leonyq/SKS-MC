<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%request.setAttribute("pagination","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<c:set var="pageImagePath" value="${path}plf/images/common/page/" />
<style>
<!--
.pageImg1{
	padding-top: 3px;
}
-->
</style>

    <script language="javascript">
		<c:set var="turnPageTextSize" value="${fn:escapeXml(page.totalPage)}a" />
		<c:set var="pageRecordTextSize" value="${fn:escapeXml(page.pageRecord)}a" />
		
		var totalPage = 0;
		<c:if test ="${page != null }">
			totalPage = <c:out value='${page.totalPage}' />;
		</c:if>
		
		var enterClick=false;
		var turnPageTextSize = "<c:out value='${page.totalPage}' />".length;
		var subForm;

    	function fn_turnPage(vflag){
    		//try{parent.parent.MessageShow();}
    		//catch(e){}

    		subForm.submit();
			<c:if test="${param.showLoading != '0'}">
    		util.showLoading();
			</c:if>
    	}
    	
    	function fn_goPage(iPage){
	 		if(iPage =="<c:out value='${page.currentPage}' />"){
				closeErrorPageMsg();
	 			return false;
	 		}
	 		var type="^[0-9]*[1-9][0-9]*$";
	        var re = new RegExp(type);
			if(iPage.match(re)==null){
				dispErrorPageMsg($("#turnPageText")[0],"<dict:lang value="请输入大于零的整数!" />");
	        	enterClick=false;
	        	setTimeout(function() {
	        		$("#turnPageText").focus();
		        }, 0);
	        	return false;
	        }

	        if(iPage > totalPage){
				dispErrorPageMsg($("#turnPageText")[0],"<dict:lang value="最大页数不能大于总页数" />"+totalPage);
	        	enterClick=false;
	        	setTimeout(function() {
	        		$("#turnPageText").focus();
		        }, 0);
	        	return false;
	        }
			
			closeErrorPageMsg();
   			fn_turnPage(iPage);
    	}
    	
    	function fn_reloadByChangePerPage(icount){
	 		if(icount =="<c:out value='${page.pageRecord}' />"){
				closeErrorPageMsg();
	 			return false;
	 		}
	 		var type="^[0-9]*[1-9][0-9]*$";
	        var re = new RegExp(type);
			if(icount.match(re)==null){
				dispErrorPageMsg($("#countPerPage")[0],"<dict:lang value="请输入大于零的整数!" />");
	        	enterClick=false;
	        	setTimeout(function() {
	        		$("#countPerPage").focus();
		        }, 0);
	        	return false;
	        }
	        if(subForm.page_pageRecord != undefined){
    			subForm.page_pageRecord.value = icount;
	        }else{
	        	subForm[0].page_pageRecord.value = icount;
	        }
			closeErrorPageMsg();
   			fn_turnPage(1);
    	}
        	
		function dispErrorPageMsg(thisObj,info){
			var positionTop=thisObj.offsetTop;
		    var positionLeft=thisObj.offsetLeft;
		    var w=thisObj.offsetWidth;
		    var h=thisObj.offsetHeight;
		    while(thisObj=thisObj.offsetParent){
			    positionTop+=thisObj.offsetTop;
			    positionLeft+=thisObj.offsetLeft;
		    }
		    var divPop = document.getElementById("div_pop");
			divPop.style.display="block";
			divPop.style.left=positionLeft+"px";
			divPop.style.top=(positionTop+h)+"px";
			divPop.innerHTML = info;
		}
			
		function closeErrorPageMsg(thisObj){
			document.getElementById("div_pop").style.display="none";
		}
			
    </script>

    <table border="0" width="100%" style="font-size: 12px" >
	    <tr>
			<c:if test="${param.export=='true'}">
		    <td align="left">
				<dict:lang value="导出" />: 
				<a href="/export.do?type=xls" target="_blank" title="导出Excel"><img src="/themes/newthemes/images/ico_file_excel.png?_mc_res_version=<%=PlfStaticRes.ICO_FILE_EXCEL_PNG %>"/>Excel</a>
				<%--| <a href="/export.do?type=xml" target="export" title="导出Xml"><img src="/themes/newthemes/images/ico_file_xml.png"/>XML </a>| 
				<a href="/export.do?type=pdf" target="export" title="导出Pdf电子文档"><img src="/themes/newthemes/images/ico_file_pdf.png"/>PDF </a--%>    
		    </td>
			</c:if>
		    <td align="right" valign="middle"  class="pageImg1">
				<c:choose>
					<c:when test="${page == null || page.totalRecord==0}">

						
					   
					    <label><img src="${pageImagePath}icon_next_n.gif?_mc_res_version=<%=PlfStaticRes.ICON_NEXT_N_GIF %>" /></label>&nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						<dict:lang value="已查了" /><font color="blue"><c:out value='${page.totalRecord}' /></font><dict:lang value="条记录" />
  						
  						<c:choose>
	  						<c:when test="${page.totalRecord<10000 }">
	  						   <label><img src="${pageImagePath}icon_next_n.gif?_mc_res_version=<%=PlfStaticRes.ICON_NEXT_N_GIF %>" /></label>&nbsp;&nbsp;
	  						</c:when>
	  						<c:otherwise>
						    <a href="javascript:fn_turnPage('N');" title="<dict:lang value="下一页" />" ><img src="${pageImagePath}icon_next.gif?_mc_res_version=<%=PlfStaticRes.ICON_NEXT_GIF %>" /></a>&nbsp;&nbsp;
						    </c:otherwise>
					    </c:choose>
					</c:otherwise>
				</c:choose>
		    </td>
	    </tr>
    </table>
    
	<%-- 提示信息DIV --%>
	<div id="div_pop" style="position:absolute;display:none; border-style:solid;border-width:0px;left=100;top=50; background:#F0F9FE;color:#BB0000;font-size: 12px; " />
	
	
	<c:if test="${param.formId == null}">
	<form id="page_Form" name="pageForm" method="post"  action="<c:out value='${page.actionName}' />">
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />" />
	</form>
	</c:if>

	
    <script language="javascript">
			var _pageCurrentPageObj;
			var _pageRecordObj;
    	function initPageParam(){
			subForm=$("#<c:out value='${param.formId}' />");
			if(null != "<c:out value='${page.formId}' />" && "" !="<c:out value='${page.formId}' />"){
				if(subForm[0]!=null){
					var inputEle1 = $('<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />');
					subForm.append(inputEle1);
					var inputEle2 = $('<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />');
					subForm.append(inputEle2);
				}
			}
			_pageCurrentPageObj= document.getElementById("page_currentPage");
			_pageRecordObj= document.getElementById("page_pageRecord");
		}
		
		function getSubFormObj(){
			<c:if test="${param.formId == null}">
			subForm=$("#page_Form")[0];
			</c:if>
			if(null != <c:out value='${page.formId}' /> && "" != <c:out value='${page.formId}' />){
				subForm=$("#<c:out value='${param.formId}' />");
				subForm=subForm[0];
			<c:if test="${param.resetSearchVal !=null && param.resetSearchVal != ''}">
				if(typeof <c:out value='${param.resetSearchVal}' /> != "undefined" && <c:out value='${param.resetSearchVal}' /> instanceof Function){
				    <c:out value='${param.resetSearchVal}' />();
				}
			</c:if>
			}			
		}
		$(function(){initPageParam();getSubFormObj();});
		
    </script>