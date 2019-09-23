<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!DOCTYPE html>
<html>
<%
  Map processdeMap=(Map)request.getAttribute("processdeMap");
 %>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
  <title><dict:lang value="语音识别" /></title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <jsp:include page="/plf/common/pub_head.jsp">
      <jsp:param name="popDivWin" value="1" />
	  <jsp:param name="layui" value="1" />
  </jsp:include>
    <link href="/mc/plf/style/fonts/iconfont.css" rel="stylesheet" type="text/css">
    <link href="${path}/plf/page/wf/tool_management/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="recognition">
   <div class="recognition-title">
     <dict:lang value='语音转文字' />
  </div>
  <div class="recognition-main">
     <div class="recognition-content-title clear-float">
         <span>即刻体验语音转文字功能，请上传一个音频文件。</span>
         <button class="layui-btn use-btn">
                                   使用说明
         </button>
     </div>
     <div class="recognition-content">
         <div class="recognition-content-left">
             <div class="recognition-img">
               <img src="images/speech.png" class="recognition-pic">
             </div>
            <button  class="layui-btn file-btn">
                <input type="file" id="fileBtn">
                                               本地上传
            </button>
            <div class="prompt-font">
               <span>当前仅支持.pcm，.wav，.mp3格式</span><br>
               <span>文件不能超过10m，音频不能超过60秒</span>
            </div>
         </div>
         <div class="recognition-content-right">
             <p class="recognition-result-title"><dict:lang value='分析结果' /></p>
             <div class="recognition-result">
                 <p style="width:467px;">
                                                              我这是一个测试的语音，用来做AI智能语音识别的测试，看看哪个平台更好用。目前是用百度的API来做测试，下面是一段测试文本：根据工信部《综合整治骚扰电话专项行动方案》、《关于推进综合整治骚扰电话专项行动的工作方案》，相关能力不得用于商业营销类、恶意骚扰类和违法犯罪类骚扰电话类场景，也不支持在贷款、理财、信用卡、股票、基金、债券、保险、售房租房、医疗机构、保健食品、人力资源服务、旅游等场景的骚扰电话营销行为。
                 </p>
             </div>
         </div>
     
     </div>
  </div>
</div>
 
  <script>

  </script>
  
  <jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>
</body>
</html>

