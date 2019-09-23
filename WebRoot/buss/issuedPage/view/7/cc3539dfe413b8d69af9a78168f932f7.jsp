<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="物料列表" />
	</title>
	<style type="text/css">
	 .datagrid-header,.datagrid-div3{
	       width:100% !important;
	      }
	</style>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	
		<bu:header formId ="4e26051dfc65446098d440a56f1c41f8"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">                  
                  
                  <div class="bd" style="padding: 0px;box-sizing: border-box;">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="buss/bussModel_exeFunc.ms?FUNC_CODE=F2059&funcMId=175d3e78bb04496aa4227f08d31b09f7&formId=&type=0&groupSn=2" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		                    <bu:search viewId="34d8cbacf63a4578993f1e78185be0b5" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div> 

		<form id="listForm1" name="listForm1" action="buss/bussModel_exeFunc.ms?FUNC_CODE=F2059&funcMId=175d3e78bb04496aa4227f08d31b09f7&type=0" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
<input type="hidden" name="groupSn" value="${ajaxString}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='4e26051dfc65446098d440a56f1c41f8'/>
 <div class="panel1 datagrid datagrid-div1"  id="4e26051dfc65446098d440a56f1c41f8">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner" style="width:100%">
		<bu:table  cssClass="datagrid-htable fixedTable datagrid-div6">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz" >
		
			<td class="datagrid-cell" style="box-sizing:border-box;" ><dict:lang value="物料料号" /></td>
			<td class="datagrid-cell" style="box-sizing:border-box;"><dict:lang value="物料名称" /></td>
			<td class="datagrid-cell" style="box-sizing:border-box;"><dict:lang value="物料规格" /></td>
			<td class="datagrid-cell"><dict:lang value="物料类型" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()" style="overflow-x:hidden;">
		<bu:table cssClass="datagrid-btable fixedTable dlist-table query-list" id="datagrid-btable-kz">
		<tbody id="addItem">
			<c:forEach items="${page.dataList}" var="cdlList" varStatus="status">
			   <tr class="datagrid-row">
									<td style="box-sizing:border-box;">
										${cdlList.ci_item_code}
									</td>
									<td style="white-space: nowrap;overflow: hidden;text-overflow:ellipsis;box-sizing:border-box;">
										${cdlList.ci_item_name}
									</td>
									<td style="white-space: nowrap;overflow: hidden;text-overflow:ellipsis;box-sizing:border-box;">
										${cdlList.ci_item_spec}
									</td>
									<td>
									<c:if test="${cdlList.ci_item_type==1}"><dict:lang value="原料" /></c:if>
									<c:if test="${cdlList.ci_item_type==2}"><dict:lang value="半成品" /></c:if>
									<c:if test="${cdlList.ci_item_type==3}"><dict:lang value="成品" /></c:if>
									</td>
								</tr>
					</c:forEach>
			</tbody>
		</bu:table>
  </div>
  </div>
  </div>
  <c:choose>
				<c:when test="${isFullScreen==1}">
					<s:include value="/plf/page/fp/paginationAx.jsp?formId=listForm1&showLoading=0" />
				</c:when>
				<c:otherwise>
					 <s:include value="/plf/page/fp/pagination.jsp?formId=listForm1" />  
				
				<%-- <s:include value="/plf/page/fp/paginationPopAx.jsp?formId=listForm1&showLoading=0" />  --%>
				</c:otherwise>
  </c:choose>
  
</form>

		</div>
	</div>
  </div>

	
<script type="text/javascript">
	function initHeight(){
		$('.bd').height($(window).height());
		$('.panel1').height($('.bd').height() - 48);
		$('#datagrid-body-kz').height($('.panel1').height() - 32);
		$('.query-list').width($('.datagrid-body').width())
	}
	$(function(){
		initHeight()
	})
	$(window).resize(function(){
		initHeight()
	}); 

var tableTrJs =$("#listForm1").find("tr");
_tongLineColor(tableTrJs);
//initPageParam();getSubFormObj();
$(".dept_select").chosen();
	
	function query(thisObj){
		document.forms.listForm1.submit();
		util.showTopLoading();
	}
	

</script>
</body>
