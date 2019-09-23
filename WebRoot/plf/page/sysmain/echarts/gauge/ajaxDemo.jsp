<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="部门信息列表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
    <script src="${path}/plf/page/fp/js/echarts/echarts.js?_mc_res_version=<%=PlfStaticRes.ECHARTS_JS %>"></script>
    <script>
	  var id = "<c:out value='${chartsConfig.id}' />";
	  $().ready(function() {
		  $("#ajaxGauge").click(function(event){  
			  if (id!=null && typeof(id)!="undefined" && id!=""){
					$.ajax({
						type: "post",
						url: "${path}charts/gaugeAction_ajaxGauge.ms",
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
								
								$("#gauge_background_<c:out value='${chartsConfig.id}' />").css("height", canvasHeight+"px");
								$("#gauge_background_<c:out value='${chartsConfig.id}' />").css("width", canvasWidth+"px");
								$("#gauge_background_<c:out value='${chartsConfig.id}' />").css("background-image", "url('"+backgroundUrl+"')");
								$("#gauge_background_<c:out value='${chartsConfig.id}' />").css("opacity", backgroundOpacity);

								$("#gauge_<c:out value='${chartsConfig.id}' />").css("height", canvasHeight+"px");
								$("#gauge_<c:out value='${chartsConfig.id}' />").css("width", canvasWidth+"px");

								var myChart = echarts.init(document.getElementById('gauge_<c:out value="${chartsConfig.id}" />')); 
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
			  var myChart = echarts.init(document.getElementById('gauge_<c:out value="${chartsConfig.id}" />')); 
			  var data = "imageBuffer=" + encodeURIComponent(myChart.getDataURL("png"));
			  $.ajax({
					type: "post",
					url: "${path}charts/gaugeAction_ajaxImportImg",
					data: data,
					success: function(data){
						if (data!=""){
							var result=eval(data.toString().toLowerCase().replace(/\n|\r|\t/g,""));
							var myChart = echarts.init(document.getElementById('gauge_<c:out value="${chartsConfig.id}" />')); 
							myChart.setOption(result); 							
						}
					}
			  });							
		 }); 
	  }); 
	</script>
  </head>
<body>
	<input type="button" id="ajaxGauge" value="ajaxGauge" />
	&nbsp;&nbsp;
	<input type="button" id="importImg" value="importImg" />	
	<input type="button" id="goBack" value="返回" onclick="window.history.go(-1)"  />	
	<div style='position:relative;'><div id="gauge_background_<c:out value='${chartsConfig.id}' />" style="position:absolute;width:10px;height:10px;"></div><div id="gauge_<c:out value='${chartsConfig.id}' />" style="position:absolute;width:500px;height:500px;"></div></div>
	
	
</body>
</HTML>
