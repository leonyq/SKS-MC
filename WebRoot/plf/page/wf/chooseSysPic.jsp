<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="图片配置页面" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
<link href="${path}buss/taskCenter/css/taskCenter.css" rel="stylesheet"
	type="text/css" />
	<link href="/mc/plf/style/fonts/iconfont.css" rel="stylesheet" type="text/css">
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
 .card-icon{
	   display: inline-block;
	    width: 50px;
	    height: 50px;
	    background:#999;
	    vertical-align: middle;
        margin: 0px 15px 15px 0px;
        line-height: 50px;
        text-align: center;
        border-radius: 4px;
        padding:10px 0;
        box-sizing: border-box;
  }
  .card-icon img{
	    width:28px;
	    user-select: none;
	    
	  }
  .card-icon-font{
	    font-size:36px !important;
	    color:#fff;
  }
  .pic-lists{
    padding: 20px;
    font-size:0;
  }
  .card-icon-bg-color{
    background:#159688 !important;
  }
      
</style>

</head>

<body>
	<div class="edit" style="height:100%;">
		<%-- <div class="hd" style="margin-top:0;">
			<div class="optn">
				
				<input type='button' value='<dict:lang value="提交" />'  class="layui-btn" onclick="commit(this)">
				<input type='button' value='<dict:lang value="取消" />'  class="layui-btn" onclick="closePopWin()">
				
			</div>
		</div> --%>
		
		
		<!-- 
		<div class="user-drop" id="picList" style="height:calc(100% - 41px);">

			<div style="height:calc(100% - 10px);overflow:auto;" class="scroll">
			<s:iterator value="dataList" id="picdto" status="index">

				<div class="item">
					<div>
						<img alt=""
							src="${path}plf/page/wf/syspic/${picdto.picName};"
							width="100px" height="100px">
					</div>


					<input type="radio" name="picNameRadio" value="${picdto.picName}"
						id="picName_%{#index.index}" class="radio" style="width:15px;"
						onclick="setPicId(this)">${picdto.picName}</input>
					

				</div>

			</s:iterator>
			</div>
		</div>
		 -->
		
		<div class="pic-lists">
		 <s:iterator value="dataList" id="picdto" status="index">
		  <span class="card-icon" >
		       <img  src="${path}plf/page/wf/syspic/${picdto.picName}">
		  </span>
		 </s:iterator>
		<!-- 
		   <span class="card-icon">
		       <i class="mc-font icon-mcwf-people-unpass card-icon-font"></i>
		    </span>
		    <span class="card-icon">
		       <i class="mc-font icon-mcwf-people-unpass card-icon-font"></i>
		    </span>
		    -->
		</div>
		
		
		 <div class="ptop_10 txac">
		    <input type='button' value='<dict:lang value="提交" />'  class="layui-btn" onclick="commit(this)">
			<input type="button" value="关闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				
		 </div>

	</div>
	<div class="dialog-mask" id="backPicDivshadow" style="z-index:1029"></div>
	<script src="${path}plf/js/jquery/jquery-1.7.2.js"></script>
	<script src="${path}plf/js/highcharts/fileUpload.js"></script>
	<script src="${path}plf/js/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
	
	 $(".card-icon").click(function(){
		 $(this).siblings().removeClass("card-icon-bg-color");
		 $(this).toggleClass("card-icon-bg-color");
		 picUrlSelected = $(this).find("img").attr("src");
		 picIdSelected=picUrlSelected.substring(picUrlSelected.lastIndexOf("/")+1,picUrlSelected.length);
		 
	 })
	  
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
			var piframeId = '<c:out value='${piframeId}' />';
			if(picIdSelected=='')
			{
			   util.alert("请选择图标");
			   return false;
			}
			var parentWindows = $(window.parent.document).contents().find(
					"#" + piframeId)[0].contentWindow;
			var parentPicIdId = parentWindows.document.getElementById('iconPath');//通过父iframe找到图片ID这个输入框
			parentPicIdId.value = picIdSelected;	
			parentWindows.$("#selectType").val('syspic');	
			var parentPicUrlId = parentWindows.document.getElementById('preview');
			parentPicUrlId.src='';		
			parentPicUrlId.src = picUrlSelected;			
			closePopWin();
			//closeCurrentWindow();
		}

		function closeCurrentWindow() {
			closeTopPopWinFp(window.frameElement.id + "pop");
		}
		
		(function($){
			$(window).on('load',function(){
				setPopScroll('.scroll');
			})
		})(jQuery)
	</script>
</body>
</html>
