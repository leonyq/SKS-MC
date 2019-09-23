<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_8" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><c:out value='${title}'/></title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<link href="${path}plf/page/common/msui/css/css_tab.css?_mc_res_version=<%=PlfStaticRes.CSS_TAB_CSS %>"
	rel="stylesheet" type="text/css" />
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		<!-- head里面 -->
	   <script type="text/javascript">
			var loaded = 1;
			#{#tab_len}#
			var currentTag;
			var tabs = "";
				function switchTag(tag, content,url) {
					if(currentTag == tag){
						return false;
					}
					for (i = 1; i < (tab_len+1); i++) {
						if ("tag" + i == tag) {
							document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
							document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
						} else {
							document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
							document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
						}
						$("#"+tag).addClass("current").siblings().removeClass("current");
						if ("content" + i == content) {
							currentTag = tag;
							document.getElementById(content).className = "";
							if("" == document.getElementById("iframe" + i).src || "" != url){
								currentIframe = document.getElementById("iframe" + i).contentWindow;
								if (typeof(currentIframe.loadedState) == "undefined" && currentIframe.loadedState != false && tabs.indexOf(tag) == -1) {//第一次点击才加载
									//document.getElementById("iframe" + i).src = url;
									tabs += tag +";";
									if(document.getElementById("iframe"+i).contentWindow.query){
										document.getElementById("iframe"+i).contentWindow.query(this);
									}else{
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
				
			function query(){
				#{iframe.search}#
			}
			
			//初始化iframe
			function intIframe(){
				#{iframe.int}#
			}
			
			$(function(){
				intIframe();
		   	});
			</script>	
		
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_8" />
    <jsp:param name="location" value="inHead" />
</jsp:include>
<!-- 产品静态资源 -->
	#{view.dist.static.resources}#
</head>
<body scroll="no">
	<DIV class="multilist comwrap content-in">
		<div class="dlist">
			<div class="hd">
				#{view.function}#
			</div>
			<div class="bd">
				<div class="search-box">
						<form id="searchForm" name="searchForm"
							action="${path}buss/bussModel.ms" method="post">
							<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    							<jsp:param name="modelName" value="VIEW_TYPE_8" />
    							<jsp:param name="location" value="searchForm" />
							</jsp:include>
								#{view.search}#
						</form>
						<a href="javascript:void(0);" class="more"></a>
				</div>
				<div class="js-tab">
					<DIV id="container">
						<DIV class="hd">
							<UL class="tab-list tab">
								#{#tabli}#
							</UL>
						</DIV>
						<DIV class="content1" id="content">
							#{#tabcontent}#
						</DIV>
					</DIV>
					#{view.submit}#
					#{view.script}#
				</div>
		    </div>
		</div>
	</DIV>
</body>


<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_8" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>