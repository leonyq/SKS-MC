<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>

<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
    <meta charset="UTF-8"/>
    <title>文件上传</title>
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
  
  <body>
  <input type="hidden"  name="savePath" id="savePath" value="<c:out value='${paraMap.savePath}' />" />
  <input type="hidden"  name="saveNfsPath" id="saveNfsPath" value="<c:out value='${paraMap.saveNfsPath}' />" />
  <input type="hidden" name="primaryVal" id="primaryVal" value="<c:out value='${paraMap.primaryVal}' />" />
   <input type="hidden" name="componentId" id="componentId" value="<c:out value='${paraMap.componentId}' />" />
  <input type="hidden" name="popId" id="popId" value="<c:out value='${paraMap.popId}' />" />
  <input type="hidden" name="fileIds" id="fileIds" value="<c:out value='${paraMap.fileIds}' />" />
  <input type="hidden" name="fileNames" id="fileNames" value="<c:out value='${paraMap.fileNames}' />" />
  <input type="hidden" name="fileSizes" id="fileSizes" value="<c:out value='${paraMap.fileSizes}' />" />
    <form enctype="multipart/form-data">
        <div class="file-loading">
            <input id="kv-explorer" name="file" type="file" multiple>
        </div>
    </form>
    <hr>
    <br>
  </body>
  <script type="text/javascript">
    $(document).ready(function () {
    	
          
    	var reg=/,$/gi; 
    	var uuid = guid();
    	var fileIds =$("#fileIds").val();
    	var popId = $("#popId").val();
    	var primaryVal = $("#primaryVal").val();
    	var componentId = $("#componentId").val();
    	var curIframeName = "<c:out value='${paraMap.iframeId}' />";
    	//var parentFrame = top.document.getElementById(popId);//获取到父iframe对象
    	var parentFrame =window.parent.parent.document.getElementById(popId);
    	var mcWindow = getSrcByIframeName({mcIframeName:curIframeName,type:'window'});
        var savePath = $("#savePath").val();
        var fileNames = $("#fileNames").val();
        var fileSizes = $("#fileSizes").val();
        var saveNfsPath = $("#saveNfsPath").val();
        var initialPreviewConfigArr = [];
        var fileNamePathArr = [];
        var fileNameArr = [];
        var fileSizeArr = [];
        var fileIdArr = [];
		if(fileNames!=""){
		   fileNameArr = fileNames.split(",");
		   fileSizeArr = fileSizes.split(",");
		   fileIdArr = fileIds.split(",");
		   var count  = 0;
		   //for(var item in fileNameArr) {
		   for(var item=0;item<fileNameArr.length;item++) {
			   var obj = new Object();
			   var file = fileNameArr[item];
			   //var toLowerCaseFile = fileNames;
			   var toLowerCaseFile = file.toLowerCase();
			   if(toLowerCaseFile.indexOf(".bmp")!=-1 || toLowerCaseFile.indexOf(".jpg")!=-1||toLowerCaseFile.indexOf(".png")!=-1||toLowerCaseFile.indexOf(".gif")!=-1){
				   if(saveNfsPath!=""){ //共享服务器开启
					   fileNamePathArr.push("<img src='/"+saveNfsPath+"/"+fileNameArr[item]+"' fileSize="+fileSizeArr[item]+" fileName="+fileNameArr[item]+" class='file-preview-image file-multi' style='width:auto;height:60px;max-width:100%;max-height:100%;' alt='Desert' title='Desert'>");
				   }else{
					   fileNamePathArr.push("<img src='${path}plf/"+savePath+"/"+fileNameArr[item]+"?_mc_res_version=<%=PlfStaticRes.FILE_NAME_ARR_ITEM%>' fileSize="+fileSizeArr[item]+" fileName="+fileNameArr[item]+" class='file-preview-image file-multi' style='width:auto;height:60px;max-width:100%;max-height:100%;' alt='Desert' title='Desert'>");
				   }
			   }else{
				   fileNamePathArr.push("<div class=\"kv-preview-data file-preview-other-frame\" style=\"width:100%;height:60px;cursor: pointer;\"><div class=\"file-preview-other\"><span class=\"file-other-icon\"><i class=\"fa fa-file\"></i></span></div></div>");
			   }
			   obj.key = savePath+";"+primaryVal+";"+fileIdArr[item];
			   obj.caption = fileNameArr[item];
			   obj.size = fileSizeArr[item];
			   obj.url = "${path}buss/bussModel_deleteMultiFile.ms";
			  
			   initialPreviewConfigArr.push(obj);
			   count++;
		   }
        }
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
            uploadExtraData:{savePath:savePath,uuId:uuid,primaryVal:primaryVal},
            initialPreview: fileNamePathArr,
            initialPreviewConfig:initialPreviewConfigArr
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
        		
        		$("#"+componentId,mcWindow.frames['mainFrame'].document).val(fileNames.replace(reg,""));
        		
        		//$("#"+componentId,parentFrame.contentWindow.document).val(fileNames.replace(reg,""));
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
    
    function guid() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });
    }
</script>
</html>

