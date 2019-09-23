<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>

<style>
.bd {
	padding: 0;
}

.pic {
	width: 248px;
	height: 188px;
	/* background-image: url(img/default.png); */
	border: 1px solid #ddd;
	margin-left: calc((           100% -             248px)/2 );
	margin-top: 30px;
	background-size: 100% 100%;
	/*background-image: url(${dataMap['imgUrl']}); */
}



.upLoadingPic {
	margin-top: 30px;
	height: 25px;
}

.upLoadingPic>* {
	float: left;
}

.title {
	width: calc((           100% -             248px)/2 );
	text-align: right;
	padding-right: 15px;
	box-sizing: border-box;
}

.upLoadingFile {
	margin-top: 20px;
	height: 25px;
}

.upLoadingFile>* {
	float: left;
}

.upLoading .upbutton {
	width: 112px;
	height: 25px;
	border: 1px solid #75c4ff;
	color: #75c4ff;
	text-align:center;
	background-color: #fff;
	padding: 0;
	border-radius: 2px;
	margin-right: 5px;
	outline: none;
	cursor: pointer;
	vertical-align: top;
}

.upLoading span {
	display: inline-block;
	width: 200px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="文件上传" /></title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
	<jsp:param name="location" value="inHead" />
</jsp:include>
<!-- head里面 -->

</head>
<body style="background-color:#fff;">
	<div>
		<div class="hd"
			style="margin-bottom:0;padding-top:5px;padding-bottom:10px;background-color:#f6f5f7"></div>
		<div class="optn" style="top:5px;    right: 5px;">
			<button type="button" onclick="saveUpload();">
				<i class="ico ico-save"></i>
				<dict:lang value='保存' />
			</button>
			<button type="button" onclick="closeWindow();">
				<i class="ico ico-cancel"></i>
				<dict:lang value='取消' />
			</button>
		</div>
	</div>

	<div class="bd">
		<form action="" id="upload_form" enctype="multipart/form-data"
			target="submitFrame">
			<input type="hidden" id="iframeId" name="iframeId"> <input
				type="hidden" id="dataId" name="dataId"> <input
				type="hidden" id="formId" name="formId">
			<div class="pic"></div>
			<div class="upLoadingPic">
				<div class="title">
					<dict:lang value='标签样例图' />
				</div>
				<div class="upLoading">
				<label id="realBtn" >
					<span class="upbutton">
						<dict:lang value='图片上传' />
					</span>
					<input type="file" id="label_img_inp" name="upFiles" style="left:-9999px;position:absolute;"
						accept="image/*">
					</label>	
						<span id="label_img_name_span"> </span> <input
						type="hidden" id="label_img_flag" name="paraMap2.labelImgFlag">
				</div>
			</div>

		</form>
	</div>

	<!-- <div style="height: 100%;margin-top: -30px;"></div> -->
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
		$(function() {
			//获取当前iframe名称
			/* var ptfs = window.parent.frames;
			for ( var i = 0; i < ptfs.length; i++) {
				if (ptfs[i] == window) {
					$("#iframeId").val(window.name);
				}
			} */

			$("#dataId").val("${dataMap['dataId']}");
			$("#formId").val("${dataMap['formId']}");
			$("#iframeId").val("${dataMap['iframeId']}");
			if ("${dataMap['imgName']}" == "") {
				$("#label_img_name_span").text("<dict:lang value='未选择任何图片' />");
			} else {
				$("#label_img_name_span").text("${dataMap['imgName']}");
			}

			if ("${dataMap['imgUrl']}" == "") {
				$(".pic").css("background-image",
						"url(${path}plf/page/mlabel/img/default.png)");
			} else {
				$(".pic").css("background-image", "url(${dataMap['imgUrl']})");
			}
		});

		//改变文件更改图片
		$(".upLoadingPic input[type='file']").change(function() {
			var file = this.files[0];

			var url = URL.createObjectURL(file);
			$('.pic').css('background-image', 'url(' + url + ')');

		})
		//改变文件更改名称
		$(".upLoading input[type='file']").change(function() {
			var fileName = $(this)[0].files[0].name;
			$(this).parent().next().html(fileName);
			$(this).parent().next().attr("title", fileName);
		})
		
	</script>

	<script type="text/javascript">
		function saveUpload() {
			if ($("#label_img_name_span").text() == "<dict:lang value='未选择任何图片' />") {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value='请选择标签样例图' />", 0, "300", "");
				return false;
			}

			if ($("#label_img_inp").val() == "") {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value='未重新选择图片' />", 0, "300", "");
				return false;
			}
			var fileSize = 0;
			var isIE = /msie/i.test(navigator.userAgent) && !window.opera;

			if (isIE && !$("#label_img_inp")[0].files) {
				var filePath = $(this)[0].value;
				var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
				var file = fileSystem.GetFile(filePath);
				fileSize = file.Size;
			} else {
				fileSize = $("#label_img_inp")[0].files[0].size;
			}
			var size = fileSize / 1024;
			if (size > 500) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value='标签样例图不能大于' />500K", 0, "300", "");
				//$(this)[0].value = "";
				return false;
			}

			document.forms.upload_form.method = "post";
			document.forms.upload_form.action = "buss/bussModel_exeFunc.ms?funcMId=915021b1059649e0a50016cf41bf3cc1";
			document.forms.upload_form.submit();
		}
	</script>
	<bu:submit viewId="6757deb266654245a83ba9a22527ff11" />
	<bu:script viewId="6757deb266654245a83ba9a22527ff11" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>