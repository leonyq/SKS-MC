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
  <title><dict:lang value="人脸检测" /></title>
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
     <dict:lang value='人脸检测' />
  </div>
  <div class="recognition-main">
     <div class="recognition-content-title clear-float">
         <span>即刻体验人脸检测功能，请上传一张本地图片或提供图片URL</span>
         <button class="layui-btn use-btn">
                                   使用说明
         </button>
     </div>
     <div class="recognition-content">
         <div class="recognition-content-left">
             <div class="recognition-img">
                 <img src="images/face.png" class="recognition-pic">
                 <img src="" class="upload-img">
             </div>
             <button  class="layui-btn file-btn">
                <input type="file" id="fileBtn">
                                               本地上传
            </button>
            <div class="img-url">
               <input type="text"  class="input_sh search-input" placeholder="<dict:lang value='图片URL' />">
                <input type="button"  id="" value="<dict:lang value='检测' />" onclick="" class="layui-btn">
            </div>
         </div>
         <div class="recognition-content-right">
             <p class="recognition-no-result"><dict:lang value='暂无分析结果，请先上传图片' /></p>
             <div class="recognition-step">
                <img src="images/step.png">
                <p class="step-font">
                   <span>上传图片</span>
                   <span>识别图片</span>
                   <span>分析结果</span>
                </p>
             </div>
         </div>
     
     </div>
  </div>
</div>
 
  <script>
  $(function(){

		 $("#fileBtn").change(()=>{
		     var file=$("#fileBtn")[0].files[0];
		     var reader  = new FileReader();
		     reader.readAsDataURL(file);
		     reader.onload=function(){
		     	$(".recognition-img .upload-img").attr('src',reader.result);
		     	
		     }
		     $(".recognition-pic").css("display","none");
		  })
		
	 })
  </script>
  
  <jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>
</body>
</html>

