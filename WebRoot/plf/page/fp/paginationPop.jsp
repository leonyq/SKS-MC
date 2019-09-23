<%@page language="java" import="java.util.*" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%request.setAttribute("pagination","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<c:set var="pageImagePath" value="${path}plf/images/common/page/" />
<style>
<!--
.pageImg1{
	padding-top: 3px;
}

li .chosen-container .chosen-drop {border-top:1px solid #75c4ff;border-bottom: 0; background-color: #f8fcff;}
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
    		if(subForm.page_currentPage != undefined ){
	    		var currentPage=parseInt(subForm.page_currentPage.value);
	    		//currentPage=currentPage-1+1;
	    		if(vflag=='P'){//previous
	    			subForm.page_currentPage.value=currentPage-1;
	    		}else if(vflag=='N'){//next
	    			subForm.page_currentPage.value=currentPage+1;
	    		}else{
	    			subForm.page_currentPage.value=vflag;
	    		}
    		}else{
    			
	    		var currentPage=parseInt(subForm[0].page_currentPage.value);
	    		//currentPage=currentPage-1+1;
	    		if(vflag=='P'){//previous
	    			subForm[0].page_currentPage.value=currentPage-1;
	    		}else if(vflag=='N'){//next
	    			subForm[0].page_currentPage.value=currentPage+1;
	    		}else{
	    			subForm[0].page_currentPage.value=vflag;
	    		}   			
    			
    		}
    		if(query != undefined && subForm[0].action != undefined && subForm[0].action.indexOf("bussModel") != -1){
    			query(this);
    		}else{
    	   		//如果有时间段的存在，则复制到搜索表单中
        		if($("#timeBucketId")){
        			$(subForm).append($("#timeBucketId").clone());
        		}
    			subForm.submit();
    		}
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
		function deptChange(thisObj)
		{
			
			var value = thisObj.options[thisObj.selectedIndex].value;	
			fn_reloadByChangePerPage(value);
		}
			
    </script>
	<c:if test="${param.export=='true'}">
    <table border="0" width="100%" style="font-size: 12px" >
	    <tr>
		    <td align="left">
				<dict:lang value="导出" />: 
				<a href="/export.do?type=xls" target="_blank" title="导出Excel"><img src="/themes/newthemes/images/ico_file_excel.png?_mc_res_version=<%=PlfStaticRes.ICO_FILE_EXCEL_PNG%>"/>Excel</a>
		    </td>
			
	    </tr>
    </table>
    </c:if>
    <ul class="pagingPop">
	<c:set var="pageContainer" value="3" scope="page"/>
		<c:choose>
			<c:when test="${page == null || page.totalRecord==0}">
				<li class="home-page">
					
				</li>
				<li class="pre">
					
				</li>
				<li class="center">
					<input type="text" value="0" id="pageNum" class="text" ></input>
				</li>
				<li class="next">
				
				</li>
				<li class="last-page">
					<a class="it" ></a>
				</li>
				<li class="select">
				<!-- <select name="dept" data-placeholder="<dict:lang value="每页"/><c:out value='${page.pageRecord}'/><dict:lang value="条"/>" class="dept_select" >
					<option value="-1"></option>
					<option value="20"><dict:lang value="每页"/>20<dict:lang value="条"/></option>
					<option value="15"><dict:lang value="每页"/>15<dict:lang value="条"/></option>
					<option value="10"><dict:lang value="每页"/>10<dict:lang value="条"/></option>
				</select>-->
				<dict:selectDict dictCode="PAGE_SHOW" dictValue="%{page.pageRecord}" cssClass="dept_select" style="width:110px;" onchange="deptChange(this)" name="dept"/>
				<span><dict:lang value="共计" />
				<span class="count"></span> 0 <dict:lang value="条" /></span>
				</li>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${page.first}">
						<li class="home-page">
							<a class="it" ></a>
						</li>
						<li class="pre">
							<a class="it" ></a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="home-page">
							<a class="it" href="javascript:fn_turnPage('1');"></a>
						</li>
						<li class="pre">
							<a class="it" href="javascript:fn_turnPage('P');"></a>
						</li>
					</c:otherwise>
				</c:choose>
				<li class="center">
					<input type="text" value="<c:out value='${page.currentPage}'/>" id="pageNum" class="text" ></input>
				</li>
				
				<c:choose>
					<c:when test="${page.last}">
						<li class="next">
							<a class="it"></a>
						</li>
						<li class="last-page">
							<a class="it" ></a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="next">
							<a class="it" href="javascript:fn_turnPage('N');"></a>
						</li>
						<li class="last-page">
							<a class="it" href="javascript:fn_turnPage('<c:out value="${page.totalPage}"/>');"></a>
						</li>
					</c:otherwise>
				</c:choose>
				<li class="select">
				
				<dict:selectDict dictCode="PAGE_SHOW" dictValue="%{page.pageRecord}" cssClass="dept_select" style="width:110px;" onchange="deptChange(this)" name="dept"/>
				<span><dict:lang value="共计" /><span class="count"></span> <c:out value='${page.totalRecord}'/> <dict:lang value="条" /></span>
				</li>
			</c:otherwise>
		</c:choose>
    </ul>
    
	<%-- 提示信息DIV --%>
	<div id="div_pop" style="position:absolute;display:none; border-style:solid;border-width:0px;left=100;top=50; background:#F0F9FE;color:#BB0000;font-size: 12px; " />
	
	
	<c:if test="${param.formId == null}">
	<form id="page_Form" name="pageForm" method="post"  action="<c:out value='${param.actionName}'/>">
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}'/>"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}'/>"  />
	</form>
	</c:if>

	
    <script language="javascript">
			var _pageCurrentPageObj;
			var _pageRecordObj;
			
			var pageNum = document.getElementById("pageNum");
			//var width = document.getElementById("width");
			//var height = document.getElementById("height");
			if(pageNum.attachEvent)
			{
				pageNum.attachEvent("input",function()
				{
					$("#pageNum").attr("value",$("#pageNum").attr("value").replace(/\D+/g,""));
				});
			}
			else
			{
				pageNum.addEventListener("input",function()
				{
					$("#pageNum").attr("value",$("#pageNum").attr("value").replace(/\D+/g,""));
				});
			}

			$("#pageNum").bind('keypress',function(event)
			{
				if(event.keyCode == 13)
				{
					if(false)
					{
						
					}
					else
					{
						var str = "javascript:fn_goPage('" + this.value + "')"; 
						location.href = str;					
					}
				}
			});
    	function initPageParam(){
			subForm=$("#<c:out value='${page.formId}' />");
			if(null != "<c:out value='${page.formId}' />" && "" !="<c:out value='${page.formId}' />"){
				if(subForm[0]!=null){
					var inputEle1 = $('<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />');
					subForm.append(inputEle1);
					var inputEle2 = $('<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />');
					subForm.append(inputEle2);
				}
			}
			_pageCurrentPageObj= document.getElementById("page_currentPage");
			_pageRecordObj = document.getElementById("page_pageRecord");
		}
		
		function getSubFormObj(){
			<c:if test="${param.formId == null}">
			subForm=$("#page_Form")[0];
			</c:if>
			if(null != <c:out value='${param.formId}' /> && "" != <c:out value='${param.formId}' />){
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