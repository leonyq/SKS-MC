<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="ESOP_在线预览" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="62e5f8f76eab45ddbcf24c091ee691ce"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>


<body>
	<video  controls="controls" id="vidioShow" style="width:98%" autoplay="autoplay">
your browser does not support the video tag
</video>
<img  id="imgShow">
</body>
<script type="text/javascript" src="${path}buss/js/pdf.js"></script>

<script>

$("#vidioShow").hide();
var reviewOnline =localStorage.reviewOnline;
var reviewUrlId=GetRequest(reviewOnline);
var result=IsExistsFile(reviewUrlId);
if(!result){
	utilsFp.confirmIcon(3,"","","", "该文件不存在",0,"260","");
	
	
}else{
	if(validateVidio(reviewOnline)>0){
		$("#vidioShow").attr("src",reviewOnline);
		$("#vidioShow").show();
	}else if(reviewOnline.indexOf(".pdf")>0){
		var reviewUrlId=GetRequest(reviewOnline);
		reviewUrlId="${path}up_load/comm/esop/"+reviewUrlId;
		window.open(reviewUrlId,"_self");
	}else if(validateImg(reviewOnline)){
		
		$("#imgShow").attr("src",reviewOnline);
	}else{
		utilsFp.confirmIcon(3,"","","", "该文件暂时不支持预览",0,"260","");
	}
	
}

/**
 * 验证图片格式
 */
function validateImg(_file){
		var resultTemp=false;
	    var i = _file.lastIndexOf('.');
	    var len = _file.length;
	    var extEndName = _file.substring(i + 1, len);
	    var extName = "GIF,BMP,PNG,JPG,JPEG";
	    if (extName.indexOf(extEndName.toUpperCase()) >0) {
	    	resultTemp=true;
	    } 
	return resultTemp;
}
/**
 * 验证视频格式
 */
function validateVidio(_file){
	var resultTemp=false;
    var i = _file.lastIndexOf('.');
    var len = _file.length;
    var extEndName = _file.substring(i + 1, len);
    var extName = "AVI、WMV、MPEG、MP4、MOV、MKV、FLV、F4V、M4V、RMVB、RM、3GP、DAT、TS、MTS、VOB";
    if (extName.indexOf(extEndName.toUpperCase()) >0) {
    	resultTemp=true;
    } 
return resultTemp;
}


function GetRequest(url) {  
	   var theRequest = new Object();  
	   if (url.indexOf("?") != -1) {  
	      var str = url.substr(1);  
	      strs = str.split("&"); 
	      strs = strs[0].split("="); 
	      return strs[1];
	      
	   }  
	   return false;  
	}
/**
 * 验证文件是否存在
 */	
function IsExistsFile(filepath)
{
	var result=false;
	$.ajax({
        url : "buss/bussModel_exeFunc.ms?funcMId=8cfb83c3dbd242c389f6c2e9b0f4b312",
        data : {
        	fileUrl:filepath
        },
        async:false, 
        type : "post",
        dataType : "json",
        success : function(data) {
        	if(data.ajaxMap.result=="exists"){
        		result=true;
        	}
        	console.log(data.ajaxMap);
        },
        error : function(msg) {
          util.closeLoading();
          utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
              0, "300", "");
        }
      });
	return result;
}

</script>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
