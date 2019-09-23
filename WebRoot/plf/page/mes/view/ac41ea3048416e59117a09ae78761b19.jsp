<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="产品项目" />
	</title>
	  
	<style>
		body{overflow-y:auto;}
		td{
			box-sizing:border-box;
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
	<script src="${path}/plf/js/ui/processbar/js/jquery.progress.js"></script>
	<link rel="stylesheet" href="${path}/plf/js/ui/processbar/css/progress.css"/>
	<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>
	
</head>
<body >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
                    
                    <div>
		<bu:func viewId="269b2e63c4bf42338b52ead442e3aa27" />
                    </div>
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="269b2e63c4bf42338b52ead442e3aa27" />
						</form>
                        <script type="text/javascript">
                          $('.search-box .more').click(function(){
                            $('.search-box').toggleClass('show');
                          })
                        </script>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="2afde634fbc5470d96dd81dbc7d251ac" class="datagrid">
  <input type="hidden" name="formId" value="2afde634fbc5470d96dd81dbc7d251ac" />
		<div class="panel datagrid datagrid-div1"  id="2afde634fbc5470d96dd81dbc7d251ac">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" style="min-width:1170px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="2afde634fbc5470d96dd81dbc7d251ac" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:thSBox listType="2" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="width:90px;text-align:center; "><bu:uitn colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="width:110px; text-align:center;"><bu:uitn colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="width:110px; text-align:center;"><bu:uitn colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center;"><bu:uitn colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="width:90px; text-align:center;"><bu:uitn colNo="CREATE_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><bu:uitn colNo="CREATE_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell" style="text-align:center;"><bu:uitn colNo="EDIT_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz" style="min-width:1150px;">
		<tbody id="tbody_2afde634fbc5470d96dd81dbc7d251ac">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" style="width:150px; text-align:left;">
				<bu:ui colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PROJECT_NO}" seq="%{#seq}"/>
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" style="width:150px; text-align:left;">
				<bu:ui colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PROJECT_NAME}" seq="%{#seq}"/>
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" style="width:90px; text-align:left;">
				<bu:ui colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PERSON_LIABLE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" style="width:110px; text-align:center;">
				<bu:ui colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{BEG_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" style="width:110px; text-align:center;">
				<bu:ui colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{END_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" style="width:70px; text-align:right;">
				<bu:ui colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{SPEED_PROGRESS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="CREATE_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" style="width:90px; text-align:left;">
				<bu:ui colNo="CREATE_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{CREATE_USER}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="CREATE_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" style="width:140px; text-align:center;">
				<bu:ui colNo="CREATE_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{CREATE_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="EDIT_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" style=" text-align:center;">
				<bu:ui colNo="EDIT_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{EDIT_TIME}" seq="%{#seq}" />
			</bu:td>
			
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
  </div>
  </div>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="269b2e63c4bf42338b52ead442e3aa27" />
		<bu:script viewId="269b2e63c4bf42338b52ead442e3aa27" />
	<script type="text/javascript">
	$(function(){
          //$('.dept_select').chosen();
      });
	var isQuery = false;
	function query(thisObj){
    		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    		}
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg,title,width,height,time){
		//utilsFp.alert(msg,reloadPgExe);
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_tongLineColor(tableTrJs);
		});
		//判断是否隐藏搜索框
		if($("#searchParaNull").val()=="0"){
			$(".search-box").hide();
		}else if($("#searchParaNull").val()<="3"){
			$(".search-box .more").hide();
			}



		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
