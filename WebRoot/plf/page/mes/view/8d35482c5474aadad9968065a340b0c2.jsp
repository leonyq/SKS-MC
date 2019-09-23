<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title>${title}</title>
<jsp:include page="/plf/common/pub_head.jsp" />
<link href="${path}plf/page/common/msui/css/css_tab.css" rel="stylesheet"
	type="text/css" />
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script language="javascript">
var paginationImpl = {};
	var loaded = 1;
	//var tab_len = <s:property value='#request.urlLs.size()'/>;
	var tab_len = 4;

	var currentTag;
	var currentContent;
	var currentFormId;
	var currentSeq = 1;
	var serachParam = "";
	function switchTag(tag, content, url, formId) {
		if (currentTag == tag) {
			return false;
		}
		for (i = 1; i < (tab_len + 1); i++) {
		<%-- 下标从1开始 --%>
	if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			if ("content" + i == content) {
				currentTag = tag;
				currentContent = content;
				currentFormId = formId;
				document.getElementById(content).className = "";
				currentSeq = 1;
				/*if ("" == document.getElementById("iframe" + i).src
						|| "" != url) {
					currentIframe = document.getElementById("iframe" + i).contentWindow;
					if (typeof (currentIframe.loadedState) == "undefined"
							&& currentIframe.loadedState != false) {//第一次点击才加载
						document.getElementById("iframe" + i).src = url;
					}
				}*/
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

		/*if (document.getElementById) {
			dyniframe = document.getElementById(frameId);
			if (dyniframe && !window.opera) {
				dyniframe.style.display = "block";
				if (dyniframe.contentDocument
						&& dyniframe.contentDocument.body.offsetHeight) {
					dyniframe.height = getViewportHeight() - 38;
				} else {
					if (dyniframe.Document
							&& dyniframe.Document.body.scrollHeight) {
						dyniframe.height = getViewportHeight() - 38;
					}
				}
			}
		}
		if ((document.all || document.getElementById) && iframehide == "no") {
			var tempobj = document.all ? document.all[iframeids[i]] : document
					.getElementById(iframeids[i]);
			tempobj.style.display = "block";
		}*/
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
		util.showLoading("处理中...");
		var currentPage = GLO_PAGE[content] == undefined ? 1 : GLO_PAGE[content];
		var pageRecord = 10;//_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord == undefined ? 5 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		console.log(_GLO_FORM_PAGE_MAP[paginationImpl]);
			$.ajax({
					type : "get",
					dataType : "json",
					url : url,
					data : $("#searchForm").serialize()+"&paraMap.formId=" + formId+"&page.currentPage="+currentPage+"&page.pageRecord="+pageRecord,
					success : function(data) {
						//alert(JSON.stringify(data));
						//util.alert(data.ajaxMap.nextselectId);
						util.closeLoading();
						if (null == data) {
							return;
						}
						//if(null == data.ajaxMap){return ;}
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
										var tableTrJs = $(this)
												.find("tbody tr");
										_toClickColorMap(tableTrJs, $(this)
												.attr("id"));
										_tongLineColor(tableTrJs);
									});
									console.log(data.ajaxPage);
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
		switchTag('tag1', 'content1', '', '0c0e6e03e3204524983b03f875effc80');
	});
	function strNull(str){
		if(str == null){
			return "";
		}else{
			return str.replace("T"," ");
		}
	}
</script>

</head>
<body scroll="no">
	<bu:func viewId="9ab69495da564296bbf24425e418e154" />
	<form id="searchForm" name="searchForm"
		action="${path}buss/bussModel.ms" method="post">
		<input type="hidden" name="exeid" value="${exeid}" />
		<s:hidden
			name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="9ab69495da564296bbf24425e418e154" />
	</form>
	<DIV id=container>
		<DIV id=title>
			<UL>
				<LI id="tag1"><A class="selectli1"
					onclick="switchTag('tag1','content1','','0c0e6e03e3204524983b03f875effc80');this.blur();"
					href="javascript:void(0);"> <SPAN class=selectspan1>测试模块1</SPAN>
				</A>
				</LI>
				<LI id="tag2"><A class=""
					onclick="switchTag('tag2','content2','','9d4bd00641164bd7b58823f663e1a0eb');this.blur();"
					href="javascript:void(0);"> <SPAN>测试模块2</SPAN> </A>
				</LI>
				<LI id="tag3"><A class=""
					onclick="switchTag('tag3','content3','','1f15fa81063949a29a9b0e87bd19c479');this.blur();"
					href="javascript:void(0);"> <SPAN>请购单</SPAN> </A>
				</LI>
				<LI id="tag4"><A class=""
					onclick="switchTag('tag4','content4','','db443a5daffd43559462ddc5bdcd26f5');this.blur();"
					href="javascript:void(0);"> <SPAN>省市列表</SPAN> </A>
				</LI>

			</UL>
		</DIV>
		<DIV class="content1" id="content">
			<DIV id="content1">
				<table width="100%">
					<tr>
						<td><iframe id="iframe1" name="iframe1" frameBorder="0"
								src='' width="100%" scrolling="auto" height="400"
								onload="dynIframesize('iframe1','0c0e6e03e3204524983b03f875effc80');"></iframe>
							<form id="listForm" name="listForm"
								action="${path}buss/bussModel.ms" method="post">
								<input type="hidden" name="exeid" value="${exeid}" />
								<s:hidden
									name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
							</form>
						</td>
					</tr>
				</table>
			
			</DIV>
					
			<DIV id="content2">
				<table width="100%">
					<tr>
						<td><iframe id="iframe2" name="iframe2" frameBorder="0"
								src='' width="100%" scrolling="auto" height="400"
								onload="dynIframesize('iframe2','9d4bd00641164bd7b58823f663e1a0eb');"></iframe>
							<form id="listForm" name="listForm"
								action="${path}buss/bussModel.ms" method="post">
								<input type="hidden" name="exeid" value="${exeid}" />
								<s:hidden
									name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
							</form>
						</td>
					</tr>
				</table>
			</DIV>

					
			<DIV id="content3">
				<table width="100%">
					<tr>
						<td><iframe id="iframe3" name="iframe3" frameBorder="0"
								src='' width="100%" scrolling="auto" height="400"
								onload="dynIframesize('iframe3','1f15fa81063949a29a9b0e87bd19c479');"></iframe>
							<form id="listForm" name="listForm"
								action="${path}buss/bussModel.ms" method="post">
								<input type="hidden" name="exeid" value="${exeid}" />
								<s:hidden
									name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
							</form>
						</td>
					</tr>
				</table>
			</DIV>

			<DIV id="content4">
				<table width="100%">
					<tr>
						<td><iframe id="iframe4" name="iframe4" frameBorder="0"
								src='' width="100%" scrolling="auto" height="400"
								onload="dynIframesize('iframe4','db443a5daffd43559462ddc5bdcd26f5');"></iframe>
							<form id="listForm" name="listForm"
								action="${path}buss/bussModel.ms" method="post">
								<input type="hidden" name="exeid" value="${exeid}" />
								<s:hidden
									name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
							</form>
						</td>
					</tr>
				</table>
			</DIV>		

		</DIV>

				<div class="center">
					<s:include
						value="/plf/common/paginationAx.jsp?listDataFn=listAx&formId=formId1&showLoading=0" />
				</div>	
	</DIV>
	<bu:submit viewId="9ab69495da564296bbf24425e418e154" />
	<bu:script viewId="9ab69495da564296bbf24425e418e154" />
</body>


<%@ include file="/plf/common/pub_end.jsp"%>
