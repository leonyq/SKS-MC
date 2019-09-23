<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="图片配置页面" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
</jsp:include>
<link href="${path}buss/taskCenter/css/taskCenter.css" rel="stylesheet"
	type="text/css" />
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<style type="text/css">
.user-drop {
	position: absolute;
	width: auto;
	background-color: #fff;
}

.user-drop .item {
	float: left;
	margin:5px;
	width:100px;
	height:115px;
}

.bod {
	padding: 10px 20px 10px 20px
}
</style>
</head>

<body>
	<div class="edit" style="height:100%;">
		<div class="hd" style="margin-top:0;">
			<div class="optn">
				<button type="button" onclick="commit(this);">
					<i class="ico ico-save"></i>提交
				</button>
				<button type="button" onclick="closeCurrentWindow('');">
					<i class="ico ico-cancel"></i>取消
				</button>
			</div>
		</div>
		<div class="user-drop" id="picList" style="height:calc(100% - 41px);">

			<div style="height:calc(100% - 10px);overflow:auto;" class="scroll">
			<s:iterator value="dataList" id="picdto" status="index">

				<div class="item">
					<div>
						<img alt=""
							src="${path}buss/images/count/${picdto.picName};"
							width="100px" height="100px">
					</div>

                    
					<input type="radio" name="picNameRadio" value="${picdto.picName}"
						id="picName_%{#index.index}" class="radio" style="width:15px;"
						onclick="setPicId(this)"/>
						<p style="float:right;font-size:12px;width:80px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" title="${picdto.picName}">${picdto.picName}</p>
					<%-- <s:hidden id="picId_%{#index.index}" name="${picdto.picName}">
					</s:hidden> --%>

				</div>

			</s:iterator>
			</div>
		</div>

	</div>
	<div class="dialog-mask" id="backPicDivshadow" style="z-index:1029"></div>
	<script src="${path}plf/js/jquery/jquery-1.7.2.js"></script>
	<script src="${path}plf/js/highcharts/fileUpload.js"></script>
	<script src="${path}plf/js/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
		var picIdSelected = "";
		var picUrlSelected = "";
		var isClick = false;
		function popWorkDiv(showId, backId) {
			$("#" + showId + ",#" + backId).show();
			$('.chosen-container').css("width", "230px");//如果DIV中有下拉框，则需要这行代码
		}

		function setPicId(thisObj) {
			isClick = true;
			picIdSelected = $(thisObj).attr("value");
			picUrlSelected = $(thisObj).siblings("div").find("img").attr("src");
			//console.log($(thisObj).attr("value"));
		}
		function query(thisObj) {
			document.forms.search_form.submit();
		}
		function commit(thisObj) {
			var piframeId = '${param.piframeId}';
             var  type = '${param.type}';
			var parentWindows = $(window.parent.document).contents().find(
					"#" + piframeId)[0].contentWindow;			
            var parentPicIdId;		
            var parentPicUrlId;
			if(type=="1"){
			    parentPicIdId = parentWindows.document.getElementById('serverfileName');//通过父iframe找到图片ID这个输入框
			    parentPicUrlId = parentWindows.document.getElementById('img0');//通过父iframe找到图片URL
			}else if(type=="2"){
			    parentPicIdId = parentWindows.document.getElementById('serverfileName1');//通过父iframe找到图片ID这个输入框
			    parentPicUrlId = parentWindows.document.getElementById('img1');//通过父iframe找到图片URL
			}
		
			if (isClick) {
			
				parentPicIdId.value = picIdSelected;
				parentPicUrlId.src = picUrlSelected;
			}
			closeCurrentWindow();
		}

		function closeCurrentWindow() {
			closeTopPopWinFp(window.frameElement.id + "pop");
		}
		
		(function($){
			$(window).on('load',function(){
				setPopScroll('.scroll')
			})
		})(jQuery)
	</script>
</body>
</html>
