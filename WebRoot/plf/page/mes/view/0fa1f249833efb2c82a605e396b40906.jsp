<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>${title}</title>
	<jsp:include page="/plf/common/pub_head.jsp" />
	<link href="${path}plf/page/common/msui/css/css_tab.css" rel="stylesheet" type="text/css" />
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script language="javascript">
	var paginationImpl = {};
	var loaded = 1;
var tab_len = 3;

	var currentTag;
	var currentContent;
	var currentFormId;
	var currentSeq = 1;
	function switchTag(tag, content, url, formId) {
		if (currentTag == tag) {
			return false;
		}
		for (i = 1; i < (tab_len + 1); i++) {
	<%-- 下标从1开始 --%>
	if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
			}
			if ("content" + i == content) {
				currentTag = tag;
				currentContent = content;
				currentFormId = formId;
				document.getElementById(content).className = "";

				dynIframesize("iframe" + i, content, formId);
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}

	var iframehide = "yes";
	function dynIframesize(frameId, content, formId) {

		$("#" + content).show().siblings().hide();
		
		if (formId != undefined) {
			getDataList(content, formId,'formId1');
		}
	}

	function _dynIframesize() {
		var tabIndex = 1;
		if (null != currentTag && "" != currentTag) {
			tabIndex = currentTag.substr(3, currentTag.length);
		}
		dynIframesize("iframe" + tabIndex, "content" + tabIndex);
	}

	if (window.addEventListener) {
		window.addEventListener("resize", _dynIframesize, false);
	} else {
		if (window.attachEvent) {
			window.attachEvent("onresize", _dynIframesize);
		} else {
			window.onresize = _dynIframesize;
		}
	}
	
	function search(){
		listAx("formId1");
	}
	
	function listAx(paginationImpl){
		getDataList(currentContent,currentFormId,paginationImpl);
	}

	var GLO_PAGE = new Object();
	//获取列表数据
	function getDataList(content, formId,paginationImpl) {
		var url = "${path}buss/bussModel_getTabListDataAx.ms";
		var currentPage = GLO_PAGE[content] == undefined ? 1 : GLO_PAGE[content];
		var pageRecord = 10;
		util.showLoading("处理中...");
		$.ajax({
					type : "POST",
					dataType : "json",
					url : url,
					data : $("#searchForm").serialize()+"&paraMap.formId=" + formId+"&page.currentPage="+currentPage+"&page.pageRecord="+pageRecord,
					success : function(data) {
						util.closeLoading();
						if (null == data) {
							return;
						}
						
						if (null != data.ajaxList) {

							var aList = eval(data.ajaxList);
							var tableTitle = " <table id=\""+formId+"\" class=\"table_list\" ><thead><tr class=\"tdcolor\"><th width=\"50px;\">序号</th>";
							for ( var i = 0; i < aList.length; i++) {
								tableTitle += "<th>" + aList[i].COL_NAME
										+ "</th>";
							}
							tableTitle += "</tr></thead>";

							var tBody = tableTitle + "<tbody>";
							if (data.ajaxPage != null
									&& data.ajaxPage.dataList != null) {
								var bList = eval(data.ajaxPage).dataList;
								for ( var j = 0; j < bList.length; j++) {
									tBody += "<tr><td>"+(j+1)+"</td>";
									for ( var h = 0; h < aList.length; h++) {
										var COL_NO = aList[h].COL_NO;
										tBody += "<td>" + strNull(bList[j][COL_NO])
												+ "</td>";
									}
									tBody += "</tr>";
								}

							}else{
								
								data.ajaxPage = new Object();
								data.ajaxPage.currentPage = 1;
								data.ajaxPage.totalPage = 1;
								data.ajaxPage.totalRecord = 0;
								data.ajaxPage.totalPage = 1;
								data.ajaxPage.first = true;
								data.ajaxPage.last = true;
								data.ajaxPage.page = true;
							}
							GLO_PAGE[content] = _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
							tBody += "</tbody></table>";
							$("#" + content).html(tBody);
							$(".table_list").each(
									function(seq) {
										var tableTrJs = $(this).find("tbody tr");
										_toClickColorMap(tableTrJs, $(this).attr("id"));
										_tongLineColor(tableTrJs);
									});
							showPageBar(data.ajaxPage,"formId1");
						}

					},
					error : function(msg) {
						util.closeLoading();
						util.alert("error:" + msg);
					}
				});
	}

	$(function() {
switchTag('tag1', 'content1', '', 'a02312147fb04b9e9711290ad2fa4f3a')

	});
	function strNull(str){
		if(str == null){
			return "";
		}else{
			return str;
		}
	}
	</script>
		
</head>
<body scroll="no">
		<bu:func viewId="8985abbf7010478e8cbdee6b022d11cf" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="8985abbf7010478e8cbdee6b022d11cf" />
		</form>
	<DIV id="container">
		<DIV id="title">
			<UL>
<LI id="tag1">
 <A class="selectli1" onclick="switchTag('tag1','content1','','a02312147fb04b9e9711290ad2fa4f3a');this.blur();" href="javascript:void(0);"> <SPAN class="selectspan1">虚拟测试TAB</SPAN> </A>
</LI>
<LI id="tag2">
 <A class="" onclick="switchTag('tag2','content2','','1f15fa81063949a29a9b0e87bd19c479');this.blur();" href="javascript:void(0);"> <SPAN >请购单TAB</SPAN> </A>
</LI>
<LI id="tag3">
 <A class="" onclick="switchTag('tag3','content3','','0c0e6e03e3204524983b03f875effc80');this.blur();" href="javascript:void(0);"> <SPAN >测试模块1</SPAN> </A>
</LI>

			</UL>
		</DIV>
		<DIV class="content1" id="content">
<DIV id="content1" style="margin-top:4px;">
 <table width="100%">
 <tr>
 <td>
 <iframe id="iframe1" name="iframe1" frameBorder="0" src='' width="100%" scrolling="auto" height="400" onload="dynIframesize('iframe1','a02312147fb04b9e9711290ad2fa4f3a');"></iframe>
<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
<input type="hidden" name="exeid" value="${exeid}" />
<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
</form>
 </td>
 </tr>
 </table>
</DIV>
<DIV id="content2" >
 <table width="100%">
 <tr>
 <td>
 <iframe id="iframe2" name="iframe2" frameBorder="0" src='' width="100%" scrolling="auto" height="400" onload="dynIframesize('iframe2','1f15fa81063949a29a9b0e87bd19c479');"></iframe>
<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
<input type="hidden" name="exeid" value="${exeid}" />
<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
</form>
 </td>
 </tr>
 </table>
</DIV>
<DIV id="content3" >
 <table width="100%">
 <tr>
 <td>
 <iframe id="iframe3" name="iframe3" frameBorder="0" src='' width="100%" scrolling="auto" height="400" onload="dynIframesize('iframe3','0c0e6e03e3204524983b03f875effc80');"></iframe>
<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
<input type="hidden" name="exeid" value="${exeid}" />
<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
</form>
 </td>
 </tr>
 </table>
</DIV>

		</DIV>
		<div class="center">
			<s:include value="/plf/common/paginationAx.jsp?listDataFn=listAx&formId=formId1&showLoading=0" />
		</div>			
	</DIV>
		<bu:submit viewId="8985abbf7010478e8cbdee6b022d11cf" />
		<bu:script viewId="8985abbf7010478e8cbdee6b022d11cf" />
</body>


<%@ include file="/plf/common/pub_end.jsp"%>
