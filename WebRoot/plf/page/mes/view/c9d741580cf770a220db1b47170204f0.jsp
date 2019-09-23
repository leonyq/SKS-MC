<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title>${title}</title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
</jsp:include>
<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
				if ("" == document.getElementById("iframe" + i).src
						|| "" != url) {
					currentIframe = document.getElementById("iframe" + i).contentWindow;
					if (typeof (currentIframe.loadedState) == "undefined"
							&& currentIframe.loadedState != false
							&& tabs.indexOf(tag) == -1) {//第一次点击才加载
						//document.getElementById("iframe" + i).src = url;
						tabs += tag + ";";
						if (document.getElementById("iframe" + i).contentWindow.query) {
							document.getElementById("iframe" + i).contentWindow
									.query(this);
						} else {
							document.getElementById("iframe" + i).src = url;
						}
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

	function query() {
		if (iframe1.window.query != undefined) {
			iframe1.window.query(this);
		}
		if (iframe2.window.query != undefined) {
			iframe2.window.query(this);
		}

	}

	//初始化iframe
	function intIframe() {
		switchTag('tag2', 'content2',
				'/mes/buss/bussModel.ms?exeid=033779dc2ae54e1ca99610ca820b3f01');
		switchTag('tag1', 'content1',
				'/mes/buss/bussModel.ms?exeid=b1fcd04b87764d33870c7153ce3402c5');

	}

	$(function() {
		intIframe();
		$('.search-box .more').click(function() {
			$('.search-box').toggleClass('show');
		});
		    		//判断是否隐藏搜索框
    		if($("#searchParaNull").val()=="0"){
    			$(".search-box").hide();
    		}else if($("#searchParaNull").val() <= "3"){
    			$(".search-box .more").hide();
    		}
	});
</script>

</head>
<body scroll="no">
	<DIV class="multilist comwrap content-in">
	  <div class="dlist">
		<div class="hd">
			<bu:func viewId="c8fbe028717942e0b3323b3314c9ad83" />

		</div>
		
		<div class="bd">
			 <div class="search-box">
			<form id="searchForm" name="searchForm"
				action="${path}buss/bussModel.ms" method="post">
				<input type="hidden" name="exeid" value="${exeid}" />
				<s:hidden
					name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
				<bu:search viewId="c8fbe028717942e0b3323b3314c9ad83" />
			</form>
			<a href="javascript:;" class="more"></a>
			</div>
			<div class="js-tab">
				<DIV id="container">
					<DIV class="hd">
						<UL class="tab-list tab">
							<LI id="tag1"><A class="selectli1"
								onclick="switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=b1fcd04b87764d33870c7153ce3402c5');this.blur();"
								href="javascript:void(0);"> <SPAN class="selectspan1">省市列表</SPAN>
							</A>
							</LI>
							<LI id="tag2"><A class=""
								onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=033779dc2ae54e1ca99610ca820b3f01');this.blur();"
								href="javascript:void(0);"> <SPAN>请购列表</SPAN> </A>
							</LI>

						</UL>
					</DIV>
					<DIV class="content1" id="content">
						<DIV id="content1">
							<table width="100%">
								<tr>
									<td><iframe id="iframe1" name="iframe1" frameBorder="0"
											src='${path}buss/bussModel.ms?exeid=b1fcd04b87764d33870c7153ce3402c5'
											width="100%" scrolling="auto" height="400"
											onload="dynIframesize('iframe1');"></iframe>
										<form id="listForm" name="listForm"
											action="${path}buss/bussModel.ms" method="post">
											<input type="hidden" name="exeid"
												value="b1fcd04b87764d33870c7153ce3402c5" />
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
											onload="dynIframesize('iframe2');"></iframe>
										<form id="listForm" name="listForm"
											action="${path}buss/bussModel.ms" method="post">
											<input type="hidden" name="exeid"
												value="033779dc2ae54e1ca99610ca820b3f01" />
											<s:hidden
												name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
										</form>
									</td>
								</tr>
							</table>
						</DIV>

					</DIV>
				</DIV>
				<bu:submit viewId="c8fbe028717942e0b3323b3314c9ad83" />
				<bu:script viewId="c8fbe028717942e0b3323b3314c9ad83" />
			</div>
		</div>
		</div>
	</DIV>
</body>


<%@ include file="/plf/common/pub_end.jsp"%>
