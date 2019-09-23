<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><s:property value="%{getText('listView.title')}"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="tab" value="1" />
		</jsp:include>
    </head>
    <body scroll="no">
	    <DIV id=container>
	    	<DIV id=title>
			    <UL>
				    <LI id=tag1 class="tag">
					    <A class=selectli onclick="switchTag('tag1','content1','${path}sys/BussModelAction_viewOrmRel.ms?paraMap.ID=<s:property value="paraMap.ID"/>');this.blur();" href="javascript:void(0);">
					    <SPAN class=selectspan>视图-持久模型关联</SPAN>
					    </A> 
				    </LI>
					  <LI id=tag2 class="tag">
					    <A onclick="switchTag('tag2','content2','${path}sys/BussModelAction_viewActRel.ms?paraMap.ID=<s:property value="paraMap.ID"/>');this.blur();" href="javascript:void(0);">
					    <SPAN>视图-功能模型关联</SPAN>
					    </A> 
				    </LI>
					  <LI id=tag3 class="tag">
					    <A onclick="switchTag('tag3','content3','${path}sys/BussModelAction_viewCode.ms?paraMap.ID=<s:property value="paraMap.ID"/>');this.blur();" href="javascript:void(0);">
					    <SPAN class="tag_span">视图源码</SPAN>
					    </A> 
				    </LI>
			    </UL>
		    </DIV>
		    <DIV class=content1 id=content>
			    <DIV id="content1">
				    <table width="100%">
				    	<tr>
				    		<td>
					    <iframe id="iframe1" name="iframe1" src="${path}sys/BussModelAction_viewOrmRel.ms?paraMap.ID=<s:property value="paraMap.ID"/>" frameBorder="0" 
					    	width="100%" scrolling="auto" height="100%" onload="dynIframesize('iframe1');">
					    </iframe>
				    		</td>
				    	</tr>
				    </table>
			    </DIV>
			    <DIV class=hidecontent id=content2 >
				    <table width="100%">
				    	<tr>
				    		<td>
						    <iframe id="iframe2" name="iframe2" frameBorder="0" 
						    	width="100%" scrolling="auto" height="100%" onload="dynIframesize('iframe2');" >
						    </iframe>
				    		</td>
				    	</tr>
				    </table>
			    </DIV>
			    <DIV class=hidecontent id=content3 >
				    <table width="100%">
				    	<tr>
				    		<td>
						    <iframe id="iframe3" name="iframe3" frameBorder="0" 
						    	width="100%" scrolling="auto" height="100%" onload="dynIframesize('iframe3');" >
						    </iframe>
				    		</td>
				    	</tr>
				    </table>
			    </DIV>
		    </DIV>
		</DIV>
		    
<script type="text/javascript">
    var loaded = 1;
    var tab_len = 3;
    var currentTag ;
	function switchTag(tag, content,url) {
		if(currentTag == tag){
			return false;
		}
		for (i = 1; i < (tab_len+1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli" ;
				document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan" ;
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
			}
			if ("content" + i == content) {
				currentTag = tag;
				$("#"+content).show();
				if("" == document.getElementById("iframe" + i).src){
					currentIframe = document.getElementById("iframe" + i).contentWindow;
					if (typeof(currentIframe.loadedState) == "undefined" && currentIframe.loadedState != false) {//第一次点击才加载
						document.getElementById("iframe" + i).src = url;
					}
				}
				dynIframesize("iframe" + i);
			} else {
				$("#content"+i).hide();
			}
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
	</script>
	
    </body>
		    
<%@ include file="/plf/common/pub_end.jsp" %>