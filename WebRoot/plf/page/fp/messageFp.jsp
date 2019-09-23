<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.sysfa.fil.filter.LoginFilter"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%
	String msgUid = StringUtilsMc.getUUID();
	session.setAttribute(ConstantsMc.SESSION_USER_PULL_MSG_CLIENT_ID, msgUid);
	
	
%>
 

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
		<script type="text/javascript">
			if(util.isChrome()){<%-- 如果是谷哥浏览器则增加关闭浏览器时提示功能 --%>
				$(window).bind('beforeunload',function(){
					    return "";
					});
			}
			
		</script>
<script type="text/javascript" 

src="${JS_PATH }/common/msg/jquery.messager.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MESSAGER_JS %>"></script>
	<script type="text/javascript">
	var prevSysMark='<%=LoginFilter.getCURR_PRO() %>';
	var _CLOSE_WIN_INF1= "<dict:lang value="关闭窗口" />";
	var timeS= <s:property value="@com.more.fw.core.common.method.ConstantsMc@PULL_MSG_TIMES"/>;
	var time1 = window.setInterval(getHMsg, timeS);
	var getHMsgURL = "${path}comm/MsgAction_getHMsg.ms?msgUid=<%=msgUid%>&_urlType="+_$url_type;
	var isSubmit = false;
	function getHMsg(){
		var topdoc ;
	   
		if(false == _isMothMakrControl){ 
			window.clearInterval(time1);
			$(topdoc).find("#_div_top_user_inf").find("a").css("color","#000000");
			$(topdoc).find("#_div_top_user_inf").find("a").attr("title","<dict:lang value='由于未操作时间太长，已超时。' />");
			
			
			var url = "${path}sys/LoginAction_logout.ms?_mc_logOutType=timeOutFp&__random_timeOutSeq="+new Date();
			if(!_isMotParkBackMark)
			   url = "${path}<%=CommMethodMc.getCurrFpLogOutUrl()%>?_mc_logOutType=timeOutFp"+new Date();  
			   
			$.post(url );
			utilsFp.alert("<dict:lang value='由于未操作时间太长，已超时。' />",function(_url){
			   _canClose();
			   window.top.location.href = _url;
			},url);
			
			
			 
			return;
		}
		if(isSubmit){return;}
		isSubmit = true; 
	    $.ajax({
			type: "POST",
		    dataType: "json",
		    url: getHMsgURL,
			success: function(data){
				isSubmit = false;
				if(null == data){return;}
				if(null == data.ajaxMap){return;}
				if(null == data.ajaxMap.msgDto){return;}
				if(data.ajaxMap.msgDto == "-1"){
					window.clearInterval(time1);
				
					if(document.getElementById("_topIframe") == null || document.getElementById("_topIframe") == undefined){
						topdoc = window.document;
					}else{
						var idoc = document.getElementById("_topIframe").contentWindow.document;
						topdoc = idoc.getElementById("topFrame").contentWindow.document;
					}
					//<%-- 因为目前消息只推送到一个用户页面 --%>
					$(topdoc).find("#_div_top_user_inf").find("a").css("color","#000000");
					$(topdoc).find("#_div_top_user_inf").find("a").attr("title","<dict:lang value='该主页面已经不提供消息推送' />");
					_isMothMakrControl=false;
					utilsFp.confirmIcon(1,"","closeSelf","", "<dict:lang value='已在其它窗口中打开主界面，是否关闭本窗口' />?","1","260","");
					return;
				}else if("4"==data.ajaxMap.msgDto.type){<%-- 认证过期消息 --%>
					window.clearInterval(time1);
					_isMothMakrControl=false;
					showMsg(data.ajaxMap.msgDto.title,encodeHtml(data.ajaxMap.msgDto.text).replace(/(\r\n)/g,"<br/>").replace(/\n/g,"<br/>"),data.ajaxMap.msgDto.id);
					alert(data.ajaxMap.msgDto.text);
				}else{
					showMsg(data.ajaxMap.msgDto.title,encodeHtml(data.ajaxMap.msgDto.text).replace(/(\r\n)/g,"<br/>").replace(/\n/g,"<br/>"),data.ajaxMap.msgDto.id);
				}
			},
			error: function(msg){
				isSubmit = false;
			}
		});
	}
	
	function closeSelf(){
		window.setTimeout("_openCloseWin()", 500);
		window.opener = null;
		var opp = window.open('','_self','');
		window.close();
		opp.close();
		/*
		window.open('','_top','');
		window.top.close();
		*/
	}
	
	function _openCloseWin(){
		window.open('${path}plf/close.jsp','_self');
	}
	
	function showMsg(title,text,msgId){
		var res = $.messager.lays(300, 200);
		if(res){
			$.messager.setMsgid(msgId);
			$.messager.show(title,text,0,showOldMsg);
		}else{
			var msgObj = new Object();
			msgObj.title = title;
			msgObj.text = text;
			msgObj.id = msgId;
			msgList.unshift(msgObj);
		}
		try {
			showMsgCount();
			} catch (e) {
		}
		
	}

	
	var msgList = new Array();
	function showOldMsg(){
		var len = msgList.length;
		for(var i=len-1,j=-1;i>j;i--){
			res = $.messager.lays(300, 200);
			if(res){
				msgObj = msgList[i];
				msgList.remove(i);
				$.messager.setMsgid(msgObj.id);
				$.messager.show(msgObj.title,msgObj.text,0,showOldMsg);
			}
		}
	}

	</script>
</html>