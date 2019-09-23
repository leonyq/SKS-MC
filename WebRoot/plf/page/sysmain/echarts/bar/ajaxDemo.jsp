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
		  $("#ajaxBar").click(function(event){  
			  if (id!=null && typeof(id)!="undefined" && id!=""){
					$.ajax({
						type: "post",
						url: "${path}charts/barAction_ajaxBar.ms",
						data:"chartsConfig.id="+"<c:out value='${chartsConfig.id}' />",//f412a4d7-e5f2-42c7-aab5-760dbcf31e04
						success: function(data){
							if (data!=""){
								var dataResult=data.toString().replace(/\n|\r|\t/g,"");

								var result1=eval(dataResult.split("(@@@)")[0]);								
								var canvasHeight = result1.canvasHeight;
								var canvasWidth = result1.canvasWidth;
								var backgroundUrl = result1.backgroundUrl;
								var backgroundAlpha = result1.backgroundAlpha;
								var backgroundOpacity = result1.backgroundOpacity;
								var eventClick = result1.eventClick;
								
								$("#bar_background_<c:out value='${chartsConfig.id}' />").css("height", canvasHeight+"px");
								$("#bar_background_<c:out value='${chartsConfig.id}' />").css("width", canvasWidth+"px");
								$("#bar_background_<c:out value='${chartsConfig.id}' />").css("background-image", "url('"+backgroundUrl+"')");
								$("#bar_background_<c:out value='${chartsConfig.id}' />").css("opacity", backgroundOpacity);

								$("#bar_<c:out value='${chartsConfig.id}' />").css("height", canvasHeight+"px");
								$("#bar_<c:out value='${chartsConfig.id}' />").css("width", canvasWidth+"px");

								var myChart = echarts.init(document.getElementById('bar_<c:out value="${chartsConfig.id}" />')); 
								myChart.setOption(result1); 
								if (eventClick!=null && typeof(eventClick)!="undefined" && eventClick!=""){
									myChart.on('click',function(params){
										alert (params.value+"|"+params.name);
										return eventClick;
									});
								}								


								var result2=eval(dataResult.split("(@@@)")[1]);
								var canvasHeight2 = result2.canvasHeight2;
								var canvasWidth2 = result2.canvasWidth2;

								$("#bar_<c:out value='${chartsConfig.id}' />_2").css("height", canvasHeight2+"px");
								$("#bar_<c:out value='${chartsConfig.id}' />_2").css("width", canvasWidth2+"px");
	
								var myChart2 = echarts.init(document.getElementById('bar_<c:out value="${chartsConfig.id}" />_2')); 
								
								myChart2.setOption(result2); 							
							}
						}
					});
				} 
			}); 

		  $("#importImg").click(function(event){  
			  var myChart = echarts.init(document.getElementById('bar_<c:out value="${chartsConfig.id}" />_2')); 
			  var data = "imageBuffer=" + encodeURIComponent(myChart.getDataURL("png"));
			  $.ajax({
					type: "post",
					url: "${path}charts/barAction_ajaxImportImg",
					data: data,
					success: function(data){
						if (data!=""){
							var result=eval(data.toString().toLowerCase().replace(/\n|\r|\t/g,""));
							var myChart = echarts.init(document.getElementById('bar_<c:out value="${chartsConfig.id}" />_2')); 
							myChart.setOption(result); 							
						}
					}
			  });							
		 }); 
	  }); 
	</script>
  </head>
<body>
	<input type="button" id="ajaxBar" value="ajaxBar" />
	&nbsp;&nbsp;
	<input type="button" id="importImg" value="importImg" />	
	<input type="button" id="goBack" value="返回" onclick="window.history.go(-1)"  />	
	<div style='position:relative;'>
		<div id="bar_background_<c:out value='${chartsConfig.id}' />" style="position:absolute;width:10px;height:10px;"></div>
		<div id="bar_<c:out value='${chartsConfig.id}' />" style="position:absolute;width:500px;height:500px;"></div>
		<div id="bar_<c:out value='${chartsConfig.id}' />_2" style="position:absolute;width:500px;height:500px;display:none;"></div>
	</div>
	
	
</body>
</HTML>
