<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="模块导入" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
</jsp:include>
<script src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
<script src="${path}plf/js/highcharts/fileUpload.js?_mc_res_version=<%=PlfStaticRes.FILEUPLOAD_JS %>"></script>
<style>
	#listTable tr td:nth-of-last-type(1){
		text-align:left;
	}
</style>
</head>
<body>
	<div class="all" style="position:relative;">
		<!-- 无信息 -->
		<div class="importModuleImg searchResultWrap">
			<div class="searchResult"></div>
			<div align="center">
				<form id="search_form" name="searchForm" action="" method="post">
					<label style=""> <span id="filename" style="font-size: 14px; color: #999;"><dict:lang value="没有相关内容，立即" /></span>
						<%--<span class="button"><dict:lang
								value="上传" /> </span> --%>
						<input type="button" id="upbtn" value="<dict:lang value="导入" />" class="botton_img_search"> <input type="file"
						style="display:none;" id="upfile" name="upfile" >
						<input type="button" id="impbtn" style="display: none;" onclick="importModule()" value="<dict:lang value="导入" />" class="botton_img_search"/>
					</label>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

	<script>
		$("#upfile").change(function() {
			if ($(this).val()) {
				var fileName = $(this)[0].files[0].name;
				$(this).prev().prev().html(fileName);
				$(this).prev().prev().attr("title", fileName);
				//getUpFile(); //上传文件
				upFile();
				//$(this).val("");
				
			} else {
				$(this).prev().prev().html("<dict:lang value="请选择文件" />"+"...");
			}
		});
		$("#upbtn").click(function() {
			$("#upfile").click();
		});
		
		//隐藏table
		function hideTable() {
			$("#listTable").hide();
		}
		
		//显示table
		function showTable() {
			$("#listTable").show();
		}
		
		var dataList = null;
		function upFile() {
			$.ajaxFileUpload({
				url : "${path}sys/moduleMagAction_importMod.ms",
				secureuri:false,
				fileElementId:"upfile",
				dataType:'text',
				data:{},
				success:function(data,status)
				
				{
					var reg = /<pre.+?>(.+)<\/pre>/g;  
					var result = data.match(reg);  
			        var result1 = RegExp.$1;
					var map1= jQuery.parseJSON(result1);
					if(map1.ajaxMap.status=='false'){
						util.alert(map1.ajaxMap.msg);
					}else{
						 window.location.href = "${path}sys/moduleMagAction_listUninstallList.ms";
					}
					
				},
				complete: function(xmlHttpRequest) {  
                    $("#upfile").replaceWith('<input type="file" id="upfile" name="upfile" style="display:none;"/>');  
                    $("#upfile").on("change", function(){  
                    	var fileName = $(this)[0].files[0].name;
                        $("#upfile").prev().prev().html(fileName);
        				$("#upfile").prev().prev().attr("title", fileName);
        				upFile();
                    });  
                }
			});

		}
		
		
	</script>
<a></a>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>