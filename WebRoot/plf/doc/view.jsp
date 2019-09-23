<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String swfFilePath = "/mes/doc/javapkphp.swf";// session.getAttribute("swfpath").toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="/mes/doc/js/jquery.min.js"></script>
		<script type="text/javascript" src="/mes/doc/js/flexpaper.js"></script>
		<script type="text/javascript" src="/mes/doc/js/flexpaper_handlers.js"></script>
		<script type="text/javascript" src="/mes/doc/js/flexpaper_handlers_debug.js"></script>
		<style type="text/css" media="screen">
html,body {
	height: 100%;
}

body {
	margin: 0;
	padding: 0;
	overflow: auto;
}

#flashContent {
	display: none;
}
</style>
		<title>文档在线预览系统</title>
	</head>
	<body>
		<div style="position: absolute; left: 5px; top: 1px;">
			<div><input type="button" value="转到" onclick="onGotoPg(2);" /></div>
			<div id="viewerPlaceHolder" style="width: 1000px; height: 600px; display: block"></div>
			<script type="text/javascript"> 
			
			//$("viewerPlaceHolder").FlexPaperViewer(); 
			 
			 /*
				$("viewerPlaceHolder").FlexPaperViewer(  { config : {
						 SwfFile : escape('<%=swfFilePath%>'),//编码设置
						 Scale : 0.6, 
						 ZoomTransition : 'easeOut',//变焦过渡
						 ZoomTime : 0.5,
						 ZoomInterval : 0.2,//缩放滑块-移动的缩放基础[工具栏]
						 FitPageOnLoad : true,//自适应页面
						 FitWidthOnLoad : true,//自适应宽度
						 FullScreenAsMaxWindow : false,//全屏按钮-新页面全屏[工具栏]
						 ProgressiveLoading : false,//分割加载
						 MinZoomSize : 0.2,//最小缩放
						 MaxZoomSize : 3,//最大缩放
						 SearchMatchAll : true,
						 InitViewMode : 'Portrait',//初始显示模式(SinglePage,TwoPage,Portrait)
						 
						 ViewModeToolsVisible : true,//显示模式工具栏是否显示
						 ZoomToolsVisible : true,//缩放工具栏是否显示
						 NavToolsVisible : true,//跳页工具栏
						 CursorToolsVisible : false,
					 		WMode : 'window',
						 SearchToolsVisible : true,
  							PrintPaperAsBitmap:false,
  						 localeChain: 'en_US'
						 }});
						 */
						 
						 
				$('#viewerPlaceHolder').FlexPaperViewer({
				 config : {
					 SwfFile : escape('<%=swfFilePath%>'),//编码设置
					 Scale : 0.6, 
					 ZoomTransition : 'easeOut',
					 ZoomTime : 0.5, 
					 ZoomInterval : 0.1,
					 FitPageOnLoad : true,
					 FitWidthOnLoad : true, 
					 FullScreenAsMaxWindow : false,
					 ProgressiveLoading : false,
					 MinZoomSize : 0.2,
					 MaxZoomSize : 3,
					 SearchMatchAll : false,
					 RenderingOrder : '/mes/doc/Paper.swf',

					 ViewModeToolsVisible : false,
					 ZoomToolsVisible : false,
					 NavToolsVisible : false,
					 CursorToolsVisible : false,
					 SearchToolsVisible : true,

					 DocSizeQueryService : "swfsize.jsp?doc=" ,
					 jsDirectory : '/mes/doc/js/',
					 localeDirectory : '/mes/doc/locale/',

					 JSONDataType : 'jsonp',

					 WMode : 'window',
					 localeChain: 'zh_CN',
					 StartAtPage: 2
					 }
			});
						 
			function onGotoPg(page){
				$FlexPaper("viewerPlaceHolder").gotoPage(page);
			}
						  
	        </script>
		</div>
	</body>
</html>
