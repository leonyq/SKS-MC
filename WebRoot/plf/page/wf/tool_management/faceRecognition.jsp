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
             <p class="recognition-result-title"><dict:lang value='分析结果' /></p>
             <div class="face-imgs  clear-float">
                <span class="btn-left" id="btnLeft" >
                   <i class="layui-icon layui-icon-left" style="color:#999;font-size:25px;"></i>
                </span>
                <span class="btn-left btn-right" id="btnRight">
                   <i class="layui-icon layui-icon-right" style="color:#999;font-size:25px;"></i>
                </span>
                <div class="img-group">
                  <div class="img-item-list">
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                     <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                     <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                    <div class="img-item">
                       <img src="">
                    </div>
                   
                  </div>
                </div>
             </div>
             <div class="recognition-result">
                 <p>
                   <span class="result-item">年龄</span>
                   <span class="result-item-message">64</span>
                 </p>
                  <p>
                   <span class="result-item">性别</span>
                   <span class="result-item-message">女性</span>
                 </p>
                  <p>
                   <span class="result-item">微笑程度值</span>
                   <span class="result-item-message">值：0.104；阈值：50</span>
                 </p>
                  <p>
                   <span class="result-item">头部姿态</span>
                   <span class="result-item-message">正对角</span>
                 </p>
                   <p>
                   <span class="result-item">情绪</span>
                   <span class="result-item-message">平静微笑</span>
                 </p>
                   <p>
                   <span class="result-item">人种</span>
                   <span class="result-item-message">WHITE</span>
                 </p>
                   <p>
                   <span class="result-item">左眼状态</span>
                   <span class="result-item-message">睁眼，未戴眼镜</span>
                 </p>
                  <p>
                   <span class="result-item">右眼状态</span>
                   <span class="result-item-message">睁眼，未戴眼镜</span>
                 </p>
             </div>
         </div>
     
     </div>
  </div>
</div>
 
  <script>
 $(function(){
	 $(".btn-left").hover(function(){
			 $(this).children("i").css("color","#159588");
		 
	 },function(){
		 $(this).children("i").css("color","#999");
	 })
	 $(".img-item").click(function(){
		 if( $(this).css('border')=="1px solid rgb(231, 231, 231)"){
			 $(this).css('border','1px solid rgb(21, 149, 136)').siblings().css('border','1px solid rgb(231, 231, 231)');
		 }
		 else{
			 $(this).css('border','1px solid rgb(231, 231, 231)').siblings().css('border','1px solid rgb(21, 149, 136)');
		 }
		
	 });
	 $("#fileBtn").change(()=>{
	     var file=$("#fileBtn")[0].files[0];
	     var reader  = new FileReader();
	     reader.readAsDataURL(file);
	     reader.onload=function(){
	     	$(".recognition-img .upload-img").attr('src',reader.result);
	     }
	  })
	  var imgPage;
	  var imgCurrentPage=0;
	  if($(".img-item").length%6===0){
		 imgPage=$(".img-item").length/6;
	  }else{
		 imgPage=parseInt($(".img-item").length/6)+1;
	  }
	  
	  
		  $("#btnRight").click(function(){
			  if($(".img-item").length>6){
				  var move;
				  if(imgCurrentPage>=imgPage-1){
					  return;
				  }
				  imgCurrentPage++;
					 var move='-'+imgCurrentPage*500+'px';
					 $(".img-item-list").animate({left:move}, 1000);
				 
			  }else{
				  return;
			  }
	  
		  })
		  $("#btnLeft").click(function(){
			  if($(".img-item").length>6){
				  imgCurrentPage--;
				  var move;
				  if(imgCurrentPage<0){
					  imgCurrentPage=0;
					  return;
				  }
				  
					 var move='-'+imgCurrentPage*500+'px';
					 $(".img-item-list").animate({left:move}, 1000);
				 
			  }else{
				  return;
			  }
	  
		  })
	  

 })
  </script>
  
  <jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>
</body>
</html>

