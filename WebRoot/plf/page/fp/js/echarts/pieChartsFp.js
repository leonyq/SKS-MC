/**异步生成饼图
 * <div id="pie_background_${chartsConfig.id}" style="position:absolute;width:10px;height:10px;"></div>
 * <div id="pie_${chartsConfig.id}" style="position:absolute;width:500px;height:500px;"></div>
 * @param firstDivId :pie_background_${chartsConfig.id}
 * @param SecondDivId: pie_${chartsConfig.id}
 * @param pieId
 * @param ajaxData data:"paraMap.pieId="+arr[i].pieId,
 * @param ajaxType type: "post",
 * @param ajaxUrl "${path}sys/UsKeyDataAction_ajaxPie.ms",
 * @param isAsync async:false,
 */			
function ajaxPie(firstDivId,SecondDivId,pieId,ajaxData,ajaxType,ajaxUrl,isAsync,myChart){
						$.ajax({
									type: ajaxType,
									url: ajaxUrl,
									data:ajaxData,
									async:isAsync,
									success: function(data){
										if (data!=""){
											var result=eval(data.toString().replace(/\n|\r|\t/g,""));
											var canvasHeight = result.canvasHeight;
											var canvasWidth = result.canvasWidth;
											var backgroundUrl = result.backgroundUrl;
											var backgroundAlpha = result.backgroundAlpha;
											var backgroundOpacity = result.backgroundOpacity;
											var eventClick = result.eventClick;
											
											$("#"+firstDivId).css("height", canvasHeight+"px");
											$("#"+firstDivId).css("width", canvasWidth+"px");
											$("#"+firstDivId).css("background-image", "url('"+backgroundUrl+"')");
											$("#"+firstDivId).css("opacity", backgroundOpacity);

											$("#"+SecondDivId).css("height", canvasHeight+"px");
											$("#"+SecondDivId).css("width", canvasWidth+"px");

											var myChart = echarts.init(document.getElementById(SecondDivId)); 
											myChart.setOption(result);
											if (eventClick!=null && typeof(eventClick)!="undefined" && eventClick!=""){
												myChart.on('click',function(params){
													return chartClick(params,eventClick);
												});
											}								
										}
									}
								});
}

function chartClick(params,eventClick){
	return eventClick(params);
}