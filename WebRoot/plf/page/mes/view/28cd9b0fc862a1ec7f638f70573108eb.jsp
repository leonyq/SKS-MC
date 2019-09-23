<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="代码评审" />
	</title>
	
	<style>
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
	<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>
<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
<script type="text/javascript">
	var addTableTrMap;
	var loaded = 1;
	var tab_len = 3;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content,url) {
			if(currentTag == tag){
				return false;
			}
			document.getElementById("content2").style.display="";
			document.getElementById("content3").style.display="";
			for (i = 1; i < (tab_len+1); i++) {
				if ("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
				}
			$("#" + tag).addClass("current").siblings().removeClass("current");
				if ("content" + i == content) {
					currentTag = tag;
					document.getElementById(content).className = "";
				} else {
					document.getElementById("content" + i).className = "hidecontent";
				}
				document.getElementById("content").className = content;
			}
					//$('.chosen-container').css("width","230px");
		}

	</script>
	<link href="${path}buss/taskCenter/css/taskCenter.css" rel="stylesheet" type="text/css" />

</head>
<body scroll="auto" id="bodyId" style="overflow: auto;" >
<div id="ccontainer">
	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
                    <bu:func viewId="c979a4a6d8aa4b908cea61e02678ed42" />
                    </div>
                  
                  <div class="bd" id="bd" style="overflow-y:auto;">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" id="loginUserId" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}" />" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
						<bu:search viewId="c979a4a6d8aa4b908cea61e02678ed42" />
						</form>
                        <a href="javascript:;" class="more"></a>
                      </div>
<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
	<input type="hidden" name="exeid" value="${exeid}" />
	<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="48144a83dd8d48bfb2efd478b3e61934">
  	<input type="hidden" name="formId" value="48144a83dd8d48bfb2efd478b3e61934" />
		<div class="panel datagrid datagrid-div1"  id="48144a83dd8d48bfb2efd478b3e61934">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" style="min-width:1050px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="48144a83dd8d48bfb2efd478b3e61934" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PROJECT" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="MODNAME" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="datagrid-cell" style="width:90px; text-align:center"><bu:uitn colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="datagrid-cell" style="width:90px; text-align:center"><bu:uitn colNo="PRIORITY" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="datagrid-cell" style="width:90px; text-align:center"><bu:uitn colNo="RESPOMSOBLE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="datagrid-cell" style="width:110px; text-align:center"><bu:uitn colNo="REVIEW_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>			
			<td class="datagrid-cell" style="width:110px; text-align:center"><bu:uitn colNo="IMPROVE_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz" style="min-width:1030px;">
		<tbody id="tbody_48144a83dd8d48bfb2efd478b3e61934">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row" onclick="showDetail('${ID}')">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="PROJECT" formId="48144a83dd8d48bfb2efd478b3e61934" style="width:150px; text-align:left;">
				<bu:ui colNo="PROJECT" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{PROJECT}" seq="%{#seq}" />
				<input type="hidden" id="_${ID}" value="${CREATE_USER}">
				<input type="hidden" id="state_${ID}" value="${STATE}">
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="MODNAME" formId="48144a83dd8d48bfb2efd478b3e61934" style="width:150px; text-align:left;">
				<bu:ui colNo="MODNAME" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{MODNAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" style="width:90px; text-align:left;">
				<bu:ui colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{STATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="PRIORITY" formId="48144a83dd8d48bfb2efd478b3e61934" style="width:90px; text-align:left;">
				<bu:ui colNo="PRIORITY" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{PRIORITY}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="RESPOMSOBLE" formId="48144a83dd8d48bfb2efd478b3e61934" style="width:90px; text-align:left;">
				<bu:ui colNo="RESPOMSOBLE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{RESPOMSOBLE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="REVIEW_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" style="width:110px; text-align:center">
				<bu:ui colNo="REVIEW_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{REVIEW_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="IMPROVE_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" style="width:110px; text-align:center">
				<bu:ui colNo="IMPROVE_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{IMPROVE_DATE}" seq="%{#seq}" />
			</bu:td>			
			
			<bu:td cssClass="datagrid-cell datagrid-cell-16" colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" style="text-align:center;">
				<bu:ui colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{CHECK_DATE}" seq="%{#seq}" />
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
		<div class="js-tab">
	<DIV  id="subTab" style="display: none;">
		<DIV class="hd">
			<UL class="tab-list tab">
				<LI id="tag1" class="current"><A class="selectli1"
					onclick="switchTag('tag1','content1','','');this.blur();"
					href="javascript:void(0);"> <SPAN class="selectspan1">代码评审</SPAN>
				</A></LI>
				<LI id="tag2"><A class=""
					onclick="switchTag('tag2','content2','','');this.blur();"
					href="javascript:void(0);"> <SPAN>评审跟踪</SPAN> </A></LI>
				<LI id="tag3"><A class=""
					onclick="switchTag('tag3','content3','','');this.blur();"
					href="javascript:void(0);"> <SPAN>特殊处理</SPAN> </A></LI>
			</UL>
		</DIV>
		<DIV class="content1" id="content" style="margin-top: 15px;">
			
			<DIV id="content1" style="margin:20px 0;">
				<table>
						<tbody><tr>
							<td style="width:35%;vertical-align: top;">
								<table class="dlist-table table-line " id="showUserTable" width="100%" style="margin-left: 20px;width: calc(100% - 20px);"><thead><tr><th style="width:50%;display:block;">序号</th><th style="width:50%;display:block;">姓名</th></tr></thead></table>
							</td>
							<td style="width:55%;vertical-align: top;">
								
						<table width="100%" class="basic-table" style="margin-left: 20px;">
							<tbody><tr>
								<td class="name">评审描述</td>
								<td class="dec"><textarea rows="4" cols="47" id="codeDetail" style="width:94.5%;">sfs</textarea></td>
								</tr>
						</tbody></table>
							</td>
						</tr>
						</tbody></table>
			</DIV>
			<DIV id="content2" style="margin:20px 0; display:none;" >
				<table width="56%" class="basic-table">
						<tr>
							<td class="name">改善人</td>
							<td class="dec"><input type="text" readonly="readonly" id="improveUser" class=" input isSubmit  _VAL_OjbsData" ></input></td>
							<td class="name">改善日期</td>
							<td class="dec" ><input type="text" readonly="readonly" id="improveDate" class=" input isSubmit  _VAL_OjbsData"></input></td>
						</tr>
						<tr>
							<td class="name">改善描述</td>
							<td  class="dec" colspan="3" ><textarea id="improveRemark" readonly="readonly" cols="47" rows="4" style="width:94.5%;"></textarea></td>
						</tr>
						<tr>
							<td class="name">审核人</td>
							<td class="dec" ><input type="text" readonly="readonly" id="checkUser" class=" input isSubmit  _VAL_OjbsData"></input></td>
							<td class="name">审核日期</td>
							<td class="dec" ><input type="text" readonly="readonly" id="checkDate" class=" input isSubmit  _VAL_OjbsData"></input></td>
						</tr>
						<tr>
							<td class="name">审核描述</td>
							<td class="dec" colspan="3" ><textarea id="checkRemark" readonly="readonly" cols="47" rows="4" style="width:94.5%;"></textarea></td>
						</tr>
					</table>
			</DIV>
			<DIV id="content3" style="margin-top:4px;display:none;">
				<table width="56%"  class="basic-table">
						<tr>
							<td class="name">处理人</td>
							<td class="dec" ><input type="text" readonly="readonly" id="handleUser" class=" input isSubmit  _VAL_OjbsData"></input></td>
							<td class="name">状态</td>
							<td class="dec" ><input type="text" readonly="readonly" id="handleState" class=" input isSubmit  _VAL_OjbsData"></input></td>
						</tr>
						<tr>
						<td class="name">处理日期</td>
							<td class="dec" colspan="3"><input type="text" readonly="readonly" id="handleDate" class=" input isSubmit  _VAL_OjbsData"></input></td>
						</tr>
						<tr>
							<td class="name">原因说明</td>
							<td class="dec" colspan="3" ><textarea id="handleRemark" readonly="readonly" cols="47" rows="4" style="width:94.5%;"></textarea></td>
						</tr>
					</table>
			</DIV>
			</DIV>
		</DIV>
		</DIV>
		</DIV>
	</div>
</div>
		<bu:submit viewId="c979a4a6d8aa4b908cea61e02678ed42" />
		<bu:script viewId="c979a4a6d8aa4b908cea61e02678ed42" />
	<script type="text/javascript">
		$(function(){
          $('.dept_select').chosen();
      });
    function showDetail(id){
    	$("#subTab").show();
    //	alert(urlDetail);
    	 jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: urlDetail+"&dataId="+id,
 			success: function(data){
 				var pList=data.ajaxMap.pList;
 				var subList=data.ajaxMap.sList;
 				//alert(utilsFp.jsonToString(pList));
 				if(pList.length>0){
 					$("#codeDetail").text("");
 					if(pList[0].CODE_DETAIL!=null){
 						$("#codeDetail").text(pList[0].CODE_DETAIL);
 					}
 					$("#improveUser").val("");
 					$("#improveUser").val(pList[0].IMPROVE_USER);
 					$("#improveDate").val("");
 					if(pList[0].IMPROVE_DATE!=null){
 					$("#improveDate").val(pList[0].IMPROVE_DATE.substring(0,10));
 					}
 					$("#improveRemark").text("");
 					if(pList[0].IMPROVE_REMARK!=null){
 						$("#improveRemark").text(pList[0].IMPROVE_REMARK);
 					}
 					$("#checkUser").val("");
 					$("#checkUser").val(pList[0].CHECK_USER);
 					$("#checkDate").val("");
 					if(pList[0].CHECK_DATE!=null){
 					$("#checkDate").val(pList[0].CHECK_DATE.substring(0,10));
 					}
 					$("#checkRemark").text("");
 					if(pList[0].CHECK_REMARK!=null){
 						$("#checkRemark").text(pList[0].CHECK_REMARK);
 					}
 					
 					$("#handleUser").val("");
 					$("#handleUser").val(pList[0].HANDLE_USER);
 					$("#handleState").val("");
 					$("#handleState").val(pList[0].STATE);
 					$("#handleDate").val("");
 					if(pList[0].TRACKING_DATE!=null){
 					$("#handleDate").val(pList[0].TRACKING_DATE.substring(0,10));
 					}
 					$("#handleRemark").text("");
 					if(pList[0].HANDLE_REMARK!=null){
 						$("#handleRemark").text(pList[0].HANDLE_REMARK);
 					}
 					
 				}
 				var tmpStr='<thead><tr><th align="left" >序号</th><th align="left">姓名</th></tr></thead>';
 				//var tmpStr="<thead><tr><th align='center'>序号</th><th align='center'>姓名</th></tr></thead>";
 				if(subList.length>0){
 					$("#showUserTable").html("");
	 				for(var i=0;i<subList.length;i++){
	 					var j=i+1;
	 					tmpStr+="<tr><td align='left'>"+j+"</td><td align='left'>"+subList[i].NAME+"</td></tr>"
	 				}
 				}
 				$("#showUserTable").html(tmpStr);
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				utilsFp.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					//utilsFp.alert("error:"+errorThrown);
 					utilsFp.confirmIcon(3,"","","","error:"+errorThrown,0,"","");
 				}
 		   }
 		});
    }
	
	var isQuery = false;
	function query(thisObj){
		if(isQuery){//utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    		}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg,title,width,height,time){
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
			//_tongLineColor(tableTrJs);
		});

		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}

</script>
</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
