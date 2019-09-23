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
	
<script language="javascript">
	var loaded = 1;
	//var tab_len = <s:property value='#request.urlLs.size()'/>;
	var tab_len = 3;

	var currentTag;
	function switchTag(tag, content, url) {
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
				document.getElementById(content).className = "";
				if ("" == document.getElementById("iframe" + i).src
						|| "" != url) {
					currentIframe = document.getElementById("iframe" + i).contentWindow;
					if (typeof (currentIframe.loadedState) == "undefined"
							&& currentIframe.loadedState != false) {//第一次点击才加载
						document.getElementById("iframe" + i).src = url;
					}
				}
				dynIframesize("iframe" + i);
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}

	var iframehide = "yes";
	function dynIframesize(frameId) {
		if (document.getElementById) {
			dyniframe = document.getElementById(frameId);
			if (dyniframe && !window.opera) {
				dyniframe.style.display = "block";
				if (dyniframe.contentDocument
						&& dyniframe.contentDocument.body.offsetHeight) {
					//dyniframe.height = dyniframe.contentDocument.body.offsetHeight+10;//全显示
					dyniframe.height = getViewportHeight() - 38;
				} else {
					if (dyniframe.Document
							&& dyniframe.Document.body.scrollHeight) {
						//dyniframe.height = dyniframe.Document.body.scrollHeight;//全显示
						dyniframe.height = getViewportHeight() - 38;
					}
				}
			}
		}
		if ((document.all || document.getElementById) && iframehide == "no") {
			var tempobj = document.all ? document.all[iframeids[i]] : document
					.getElementById(iframeids[i]);
			tempobj.style.display = "block";
		}
	}

	function _dynIframesize() {
		var tabIndex = 1;
		if (null != currentTag && "" != currentTag) {
			tabIndex = currentTag.substr(3, currentTag.length);
		}
		dynIframesize("iframe" + tabIndex);
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
</script>
	
</head>
<body scroll="no">
	<bu:func viewId="dad2c737228f4eb59590fc96df9db708" />
	<form id="searchForm" name="searchForm"
		action="${path}buss/bussModel.ms" method="post">
		<input type="hidden" name="exeid" value="${exeid}" />
		<s:hidden
			name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="dad2c737228f4eb59590fc96df9db708" />
	</form>
	<DIV id=container>
		<DIV id=title>
			<UL>
				<LI id="tag1"><A class="selectli1"
					onclick="switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=62fa1ee3f6d34d28aa371f7e6550574d');this.blur();"
					href="javascript:void(0);"> <SPAN class=selectspan1>省市</SPAN> </A>
				</LI>
				<LI id="tag2"><A class=""
					onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=270e1271821e4df1be93e01c3e6046a0');this.blur();"
					href="javascript:void(0);"> <SPAN>请购</SPAN> </A></LI>
				<LI id="tag3"><A class=""
					onclick="switchTag('tag3','content3','${path}buss/bussModel.ms?exeid=4073d5cbfb1b452aa919db11dda6d091');this.blur();"
					href="javascript:void(0);"> <SPAN>测试1</SPAN> </A></LI>

			</UL>
		</DIV>
		<DIV class=content1 id=content>
			<DIV id="content1">
			<iframe id="iframe1" name="iframe1"
									src="" frameBorder="0" width="100%"
									scrolling="auto" height="400" onload="dynIframesize('iframe1');">
								</iframe>

			</DIV>
			<DIV id="content2">
			<iframe id="iframe2" name="iframe2"
									src="" frameBorder="0" width="100%"
									scrolling="auto" height="400" onload="dynIframesize('iframe2');">
								</iframe>

			</DIV>
			<DIV id="content3">
				<iframe id="iframe3" name="iframe3"
									src="" frameBorder="0" width="100%"
									scrolling="auto" height="400" onload="dynIframesize('iframe3');">
								</iframe>

			</DIV>

		</DIV>
	</DIV>

</body>


<%@ include file="/plf/common/pub_end.jsp"%>
