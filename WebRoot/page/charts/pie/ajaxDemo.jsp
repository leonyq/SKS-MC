<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
  <jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param value="HotKey" name="1"/>
	</jsp:include>
    <script src="<%=basePath%>js/echarts/echarts.js"></script>
    <script>
	  var id = "${chartsConfig.id}";
	  $().ready(function() {
		  $("#ajaxPie").click(function(event){  
			  if (id!=null && typeof(id)!="undefined" && id!=""){
					$.ajax({
						type: "post",
						url: "<%=basePath%>/charts/pieAction_ajaxPie.ms",
						data:"chartsConfig.id="+id,
						success: function(data){
							if (data!=""){
								var result=eval(data.toString().replace(/\n|\r|\t/g,""));
								
								var canvasHeight = result.canvasHeight;
								var canvasWidth = result.canvasWidth;
								var backgroundUrl = result.backgroundUrl;
								var backgroundAlpha = result.backgroundAlpha;
								var backgroundOpacity = result.backgroundOpacity;
								var eventClick = result.eventClick;
								
								$("#pie_background_${chartsConfig.id}").css("height", canvasHeight+"px");
								$("#pie_background_${chartsConfig.id}").css("width", canvasWidth+"px");
								$("#pie_background_${chartsConfig.id}").css("background-image", "url('"+backgroundUrl+"')");
								$("#pie_background_${chartsConfig.id}").css("opacity", backgroundOpacity);

								$("#pie_${chartsConfig.id}").css("height", canvasHeight+"px");
								$("#pie_${chartsConfig.id}").css("width", canvasWidth+"px");

								var myChart = echarts.init(document.getElementById('pie_${chartsConfig.id}')); 
								myChart.setOption(result); 
								if (eventClick!=null && typeof(eventClick)!="undefined" && eventClick!=""){
									myChart.on('click',function(params){
										alert (params.value+"|"+params.name);
										return eventClick;
									});
								}								
							}
						}
					});
				} 
			}); 

		  $("#importImg").click(function(event){  
			  var myChart = echarts.init(document.getElementById('pie_${chartsConfig.id}')); 
			  var data = "imageBuffer=" + encodeURIComponent(myChart.getDataURL("png"));
			  $.ajax({
					type: "post",
					url: "<%=basePath%>/charts/pieAction_ajaxImportImg.ms",
					data: data,
					success: function(data){
						if (data!=""){
							var result=eval(data.toString().toLowerCase().replace(/\n|\r|\t/g,""));
							var myChart = echarts.init(document.getElementById('pie_${chartsConfig.id}')); 
							myChart.setOption(result); 							
						}
					}
			  });							
		 }); 
	  }); 
	</script>
  </head>
<body>
	<input type="button" id="ajaxPie" value="ajaxPie" />
	&nbsp;&nbsp;
	<input type="button" id="importImg" value="importImg" />	
	<div style='position:relative;'><div id="pie_background_${chartsConfig.id}" style="position:absolute;width:10px;height:10px;"></div><div id="pie_${chartsConfig.id}" style="position:absolute;width:500px;height:500px;"></div></div>
	
	
</body>
</HTML>
