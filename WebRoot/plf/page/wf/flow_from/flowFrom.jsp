<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="流程表单" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>



    

	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
   <link href="${path}plf/page/wf/flow_from/css/style.css" rel="stylesheet" type="text/css" />
   	<link href="${path}plf/page/wf/process/css/style.css" rel="stylesheet" type="text/css" />
   	
   	  <link href="${path}plf/js/bootstrap-fileinput-master/css/bootstrap.min.css?_mc_res_version=<%=PlfStaticRes.BOOTSTRAP_MIN_CSS %>" rel="stylesheet">
    <link href="${path}plf/js/bootstrap-fileinput-master/css/fileinput.css?_mc_res_version=<%=PlfStaticRes.FILEINPUT_CSS %>" media="all" rel="stylesheet" type="text/css"/>
    <link href="${path}plf/js/bootstrap-fileinput-master/css/font-awesome.min.css?_mc_res_version=<%=PlfStaticRes.FONT_AWESOME_MIN_CSS %>" media="all" rel="stylesheet" type="text/css"/>
    <link href="${path}plf/js/bootstrap-fileinput-master/themes/explorer-fa/theme.css?_mc_res_version=<%=PlfStaticRes.THEME_CSS %>" media="all" rel="stylesheet" type="text/css"/>
    <script src="${path}plf/js/jquery/jquery-1.9.1.js?_mc_res_version=<%=PlfStaticRes.JQUERY_1_9_1_JS %>"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/plugins/sortable.js?_mc_res_version=<%=PlfStaticRes.SORTABLE_JS %>" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/fileinput.js?_mc_res_version=<%=PlfStaticRes.FILEINPUT_JS %>" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/locales/fr.js?_mc_res_version=<%=PlfStaticRes.FR_JS %>" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/locales/zh.js?_mc_res_version=<%=PlfStaticRes.ES_JS %>" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/themes/explorer-fa/theme.js?_mc_res_version=<%=PlfStaticRes.EXPLORER_FA_THEME_JS %>" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/themes/fa/theme.js?_mc_res_version=<%=PlfStaticRes.THEME_JS %>" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/popper.min.js?_mc_res_version=<%=PlfStaticRes.POPPER_MIN_JS %>" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/bootstrap.min.js?_mc_res_version=<%=PlfStaticRes.BOOTSTRAP_MIN_JS %>" type="text/javascript"></script>
	<script src="${path}plf/page/fp/js/modalWinFp.js?_mc_res_version=<%=PlfStaticRes.MODALWINFP_JS %>" type="text/javascript"></script>
	<script src="${path}plf/js/common/util.js" type="text/javascript"></script>
   	
   	
   	
   	
	</head>
<style>

</style>
<body style="overflow: hidden;">
<div style="height:100%;overflow-y:auto">
  <div class="flowFrom-content">
    <div class="input-content">
         <span  class="input-name"><dict:lang value="姓名" /></span>
	     <input type="text" name=""  class="input input-box" style="width: 248px;">
    </div>
    <div class="input-content">
         <span  class="input-name"><dict:lang value="天数" /></span>
	     <input type="text" name="" class="input input-box" style="width: 248px;">
    </div>
    <div class="input-content">
         <span  class="input-name"><dict:lang value="原因" /></span>
	     <input type="text" name=""  class="input input-box" style="width: 248px;">
    </div>
    <div class="input-content">
	     <textarea rows="3" cols="20" placeholder="签字意见"></textarea>
    </div>
   
 </div>
  
  <div class="" style="margin-left: 50px;">
	   <form enctype="multipart/form-data" style="background: #fff;width:800px">
	        <div class="file-loading">
	            <input id="kv-explorer" type="file" multiple>
	        </div>
	       
	    </form>
	    
	    
    </div>
    
  <div class="flow-data">
   <div class="data">
	     <span class="data-name">姓名</span>
	     <div class="data-content">
	      <span class="data-imp">
	                              提交申请提交申请
	            <span class="pointer-show"></span>
	       </span>
	      <span>2019-10-10 12:12:32</span>
	      <span>发起节点</span>
	      <p>附件名称</p>
     </div>
   </div>
    <div class="data">
	     <span class="data-name">姓名</span>
	     <div class="data-content">
	      <span class="data-imp">
	                              提交申请提交申请
	            <span class="pointer-show"></span>
	       </span>
	      <span>2019-10-10 12:12:32</span>
	      <span>发起节点</span>
	      <p>附件名称</p>
	     </div>
   </div>
  </div>
</div>
	
 <script>
 $(".data:even").css("background", "rgb(237,237,237)");
 $(".data-imp").hover(function(){
	 $(".pointer-show").text("");
	 $(this).children(".pointer-show").show();
	 $(".pointer-show").text($(this).text());
	 
 },function(){
	 $(this).children(".pointer-show").hide();
 })
 
 $(document).ready(function () {
	 $("#kv-explorer").fileinput({
     	language: 'zh', 
         'theme': 'explorer-fa',
         allowedPreviewTypes: ['image'],
         showDownload:true,
         showUpload:true,
         showCaption:true,
         maxFileSize: 512000,
         uploadAsync:false,
         otherActionButtons:'<button type="button" style="cursor: pointer;width: 30px;height: 30px;" class="kv-file-down btn btn-xs btn-default" {dataKey} title="下载附件"><i class="fa fa-cloud-download"></i></button>',
         'uploadUrl': '${path}buss/bussModel_multiFileUpload.ms',
         overwriteInitial: false,
         showRemove:false,
         layoutTemplates:{
         	actionUpload:'',
         	actionZoom:'',
         },
     }).on('filebatchuploadsuccess', function(event, data) {
     	var fileInfo = data.response.fileInfo.fileData;
     	var fileName = "";
     	$.each(fileInfo,function(i,v){
     		fileName += v.fileName+",";
     	});
     	/**
     	if(fileIds!="" && fileIds.charAt(fileIds.length - 1)!=","){
 		fileIds = fileIds+",";
 		}
 			if(fileNames!="" && fileNames.charAt(fileNames.length - 1)!=","){
 		fileNames = fileNames+",";
 		}
 			fileIds+=data.response.fileId;
 			fileNames+=data.response.fileName;
     	**/
     	
     	$("#"+componentId,mcWindow.frames['mainFrame'].document).val(fileName.replace(reg,""));
     	//parent.closePopWinFp(componentId+'_filepop');
     	//parent.closePopWin(componentId+'_filepop');
     	
     	closePage();
     	
     }).on("filebatchselected", function(event, files) {
     	
     }).on("fileuploaded", function(e, data) {
     	//$("#"+componentId+"_fileId",parentFrame.contentWindow.document).val(fileIds.replace(reg,""));
     	//;
     }).on('filedeleted', function(event, key, jqXHR, data) {
     	var res = jqXHR.responseText;
     	var obj = JSON.parse(res);
     	if(obj.status=="success"){
     		var fileNames = "";
     		var fileIds = "";
     		var fileInfo = obj.fileInfo;
     		if(fileInfo.length>0){
     			$.each(fileInfo,function(i,v){
     				fileNames += v.fileName+",";
     				fileIds += v.fileIds+",";
     			});
     		}
     		$("#"+componentId,parentFrame.contentWindow.document).val(fileNames.replace(reg,""));
     		$("#"+componentId+"_fileId",parentFrame.contentWindow.document).val(fileIds.replace(reg,""));
     	};
     }).on('filebatchuploadcomplete', function(event, id) {
     	
      }).on('fileselect', function(event, numFiles, label) {
     	    $(".kv-file-down").each(function(index,item){
     	    	 var $btn = $(this), key = $btn.data('key');
     	    	 if(!key){
     	    		 $btn.hide();
     	    	 }
     	    });
      }).on('filebatchuploaderror', function(event, data, msg) {
     	    var form = data.form, files = data.files, extra = data.extra,
             response = data.response, reader = data.reader;
     	    $(".fileinput-upload").attr("disabled","disabled");
     })
     
     // 文件下载
     $('.file-preview-thumbnails').on('click','.kv-file-down',function() {
         var $btn = $(this), key = $btn.data('key');
         if(key){
         	var combination = key.split(";");
         	window.location.href="${path}buss/bussModel_downMultiFile.ms?primaryVal="+combination[1]+"&savePath="+combination[0]+"&fileId="+combination[2];
         }else{
         	alert("请先上传文件！");
         }
     }); 
 });
    
   
</script>	
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>