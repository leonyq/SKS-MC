<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><c:out value='${title}' /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="layui" value="1" />
	</jsp:include>
	<link href="${path}plf/page/common/msui/css/css_tab.css?_mc_res_version=<%=PlfStaticRes.CSS_TAB_CSS %>" rel="stylesheet" type="text/css" />
</head>
<body scroll="no" style="overflow:hidden;">
	<DIV id="container">
		<DIV id=title class="mc-tab" style="margin-top: 10px;">
			<UL class="layui-tab-title">
				<s:iterator value="#request.urlLs" status="index">
					<LI id="tag<s:property value="#index.count" />">
						<A <s:if test="#index.count == 1">class="selectli1"</s:if>
							onclick="switchTag('tag<s:property value="#index.count" />','content<s:property value="#index.count" />','${path}<s:property value="url" />');this.blur();"
							href="javascript:void(0);"> <SPAN <s:if test="#index.count == 1">class=selectspan1</s:if>><s:property
									value="title" /> </SPAN> </A>
					</LI>
				</s:iterator>
			</UL>
		</DIV>
		<DIV class=content1 id=content>
			<s:iterator value="#request.urlLs" status="index">
				<DIV id="content<s:property value="#index.count" />" <s:if test="#index.count != 1">class=hidecontent</s:if>>
					<table width="100%">
						<tr>
							<td>
								<iframe id="iframe<s:property value="#index.count" />" name="iframe<s:property value="#index.count" />"
									src="<s:if test="#index.count == 1">${path}<s:property value="url" /></s:if>" frameBorder="0" width="100%"
									scrolling="auto" height="400" onload="dynIframesize('iframe<s:property value="#index.count" />');">
								</iframe>
							</td>
						</tr>
					</table>
				</DIV>
			</s:iterator>
		</DIV>
	</DIV>
</body>

<script language="javascript">
	//运行layui layer模块
	(function(){
		layui.use('layer',function(){
			var layer = layui.layer;
		})
	})()

	var loaded = 1;
	var tab_len = <s:property value='#request.urlLs.size()'/>;
    var currentTag ;
		function switchTag(tag, content,url) {
			if(currentTag == tag){
				return false;
			}
			for (i = 1; i < (tab_len+1); i++) {<%-- 下标从1开始 --%>
				if ("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
				}
				if ("content" + i == content) {
					currentTag = tag;
					document.getElementById(content).className = "";
					if("" == document.getElementById("iframe" + i).src || "" != url){
						currentIframe = document.getElementById("iframe" + i).contentWindow;
						if (typeof(currentIframe.loadedState) == "undefined" && currentIframe.loadedState != false) {//第一次点击才加载
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
						if (dyniframe.contentDocument && dyniframe.contentDocument.body.offsetHeight) {
							//dyniframe.height = dyniframe.contentDocument.body.offsetHeight+10;//全显示
							dyniframe.height = getViewportHeight()-38;
						} else {
							if (dyniframe.Document && dyniframe.Document.body.scrollHeight) {
								//dyniframe.height = dyniframe.Document.body.scrollHeight;//全显示
								dyniframe.height = getViewportHeight()-38;
							}
						}
					}
				}
				if ((document.all || document.getElementById) && iframehide == "no") {
					var tempobj = document.all ? document.all[iframeids[i]] : document.getElementById(iframeids[i]);
					tempobj.style.display = "block";
				}
		}
		
		function _dynIframesize() {
			var tabIndex = 1;
			if(null != currentTag && "" != currentTag){
				tabIndex = currentTag.substr(3,currentTag.length);
			}
			dynIframesize("iframe"+tabIndex);
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
		
		 layui.use('layer',function(){
				layer = layui.layer;
			})

		
	</script>
<%@ include file="/plf/common/pub_end.jsp"%>