<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><dict:lang value="节点详情" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>

<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
</jsp:include>
<link rel="stylesheet" type="text/css"
	href="plf/page/timer/perforMonit/css/nodeDetail.css?_mc_res_version=<%=PlfStaticRes.NODEDETAIL_CSS %>">
<link rel="stylesheet" type="text/css"
	href="plf/page/timer/perforMonit/js/jquery.mCustomScrollbar.min.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_MIN_CSS %>">
<script
	src="plf/page/timer/perforMonit/js/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
<script src="${path}plf/page/timer/perforMonit/js/echarts.min.js?_mc_res_version=<%=PlfStaticRes.ECHARTS_MIN_JS %>"></script>
<script src="${path}/plf/js/subModal/submodalsource.js?_mc_res_version=<%=PlfStaticRes.SUBMODALSOURCE_JS %>"></script>
<style>
</style>
</head>

<body>
	<div class="main_content">
		<div class="title" >
			<select id="node" onchange="switchNode(this)" style="border:none;height:21px;margin-top: 10px;background-color: transparent;outline: none;color:#fff;font-size: 18px;">
			</select>
		
		</div>
		<div class="block">
			<div class="small_title">
				<div class="title_main"><dict:lang value="应用性能" /></div>
				<div class="title_right"></div>
			</div>
			<div class="block_content">
				<div class="item">
					<div class="item_top" style="cursor: pointer;" title="<dict:lang value="点击查看CPU详情"/>" onclick="showDetail('${path}performance/performanceMonitorAction_cpuView.ms','<dict:lang value="CPU详情"/>')">
						<div class="item_top_left"></div>
						<div class="item_top_center" >CPU</div>
						<div class="item_top_right"></div>
					</div>
					<div class="item_bottom">
						<div id="cpu_show"></div>
					</div>
				</div>
				<div class="item">
					<div class="item_top" style="cursor: pointer;" title="<dict:lang value="点击查看内存详情"/>" onclick="showDetail('${path}performance/performanceMonitorAction_memoryView.ms','<dict:lang value="内存详情"/>')">
						<div class="item_top_left"></div>
						<div class="item_top_center" ><dict:lang value="内存" /></div>
						<div class="item_top_right"></div>
					</div>
					<div class="item_bottom">
						<div id="memory_show"></div>
					</div>
				</div>
				<div class="item">
					<div class="item_top" style="cursor: pointer;"  title="<dict:lang value="点击查看硬盘详情"/>" onclick="showDetail('${path}performance/performanceMonitorAction_diskView.ms','<dict:lang value="硬盘详情"/>',1000)">
						<div class="item_top_left"></div>
						<div class="item_top_center"><dict:lang value="硬盘" /></div>
						<div class="item_top_right"></div>
					</div>
					<div class="item_bottom">
						<div id="disk_show"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="block">
			<div class="small_title">
				<div class="title_main"><dict:lang value="系统性能" /></div>
				<div class="title_right"></div>
			</div>
			<div class="block_content">
				<div class="item">
					<div class="item_top" style="cursor: pointer">
						<div class="item_top_left"></div>
						<div class="item_top_center" title="<dict:lang value="点击查看Session详情"/>" onclick="showDetail('${path}performance/performanceMonitorAction_sessionView.ms','<dict:lang value="Session详情"/>')">Session</div>
						<div class="item_top_right"></div>
					</div>
					<div class="item_bottom">
						<div id="session_show"></div>
					</div>
				</div>
				<div class="item">
					<div class="item_top" style="cursor: pointer">
						<div class="item_top_left"></div>
						<div class="item_top_center" title="<dict:lang value="点击查看线程详情"/>" onclick="showDetail('${path}performance/performanceMonitorAction_threadView.ms','<dict:lang value="线程详情"/>')"><dict:lang value="线程" /></div>
						<div class="item_top_right"></div>
					</div>
					<div class="item_bottom">
						<div id="thread_show"></div>
					</div>
				</div>
				<div class="item">
					<div class="item_top" style="cursor: pointer">
						<div class="item_top_left"></div>
						<div class="item_top_center" title="<dict:lang value="点击查看GC详情"/>" onclick="showDetail('${path}performance/performanceMonitorAction_gcView.ms','<dict:lang value="GC详情"/>')">GC<dict:lang value="时间" /></div>
						<div class="item_top_right"></div>
					</div>
					<div class="item_bottom">
						<div id="gc_show"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="block">
			<div class="small_title">
				<div class="title_main" style="cursor: pointer;"  title="<dict:lang value="点击查看HTTP请求耗时详情"/>" onclick="showDetail('${path}performance/performanceMonitorAction_httpRequestView.ms','<dict:lang value="HTTP请求耗时详情"/>')" >HTTP<dict:lang value="请求耗时" /></div>
				<div class="title_right"></div>
			</div>
			<div class="block_content">
				<div class="tableHead">
					<table>
						<thead>
							<tr>
								<td style="width:320px;">URL</td>
								<td style="width:160px;"><dict:lang value="记录时间" /></td>
								<td style="width:130px"><dict:lang value="请求耗时" />(ms)</td>
								<td style="width:130px"><dict:lang value="请求CPU耗时" />(ms)</td>
							</tr>
						</thead>
					</table>
				</div>
				<div class="tableBody">
					<table>
						<tbody id="http_request_cost">
							
						</tbody>

					</table>
				</div>
			</div>
		</div>
		<div class="block">
			<div class="small_title">
				<div class="title_main"><dict:lang value="超链接" /></div>
				<div class="title_right"></div>
			</div>
			<ul class="hyperlink">
				<li><a href="javascript:void(0)"
					onclick="toUrl('${path}performance/performanceMonitorAction_memoryObjList.ms','<dict:lang value="内存对象列表" />')"><dict:lang value="内存对象列表" /></a>
				</li>
				<li><a href="javascript:void(0)"
					onclick="toUrl('${path}performance/performanceMonitorAction_threadList.ms','<dict:lang value="线程列表" />')"><dict:lang value="线程列表" /></a>
				</li>
			</ul>
		</div>
	</div>

	<script>
		
		(function($) {
			$(window).on('load', function() {
				$(".main_content").mCustomScrollbar({
					axis : "yx",
					snapAmount : 40,
					theme : "minimal-dark",
					keyboard : {
						scrollAmount : 40
					},
					scrollInertia : 80,
				});

				$(".tableBody").mCustomScrollbar({
					axis : "yx",
					snapAmount : 40,
					theme : "minimal-dark",
					keyboard : {
						scrollAmount : 40
					},
					scrollInertia : 80,
				});

			})
		})(jQuery)
	</script>
	<script type="text/javascript">
		var format = function(time, format) {
			var t = new Date(time);
			var tf = function(i) {
				return i < 10 ? '0' + i : i;
			}

			return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a) {
				switch (a) {
				case 'yyyy':
					return tf(t.getFullYear());
					break;
				case 'MM':
					return tf(t.getMonth() + 1);
					break;
				case 'dd':
					return tf(t.getDate());
					break;
				case 'HH':
					return tf(t.getHours());
					break;
				case 'mm':
					return tf(t.getMinutes());
					break;
				case 'ss':
					return tf(t.getSeconds());
					break;
				}
			});
		};

		//弹出 modal 框
		function toUrl(url, title) {
			showPopWin(url, 800, 400, null, title);
		}
	</script>

	<script type="text/javascript">
		var sysName = "";
		var optionCpu = {
			color : [ "#7FFFD4", "#00F5FF" ], //绿色 蓝色
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				},
				formatter : "</br>{b}</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#7FFFD4;'></span>{a0}：{c0}%</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#00F5FF;'></span>{a1}：{c1}%</br>"
			},
			legend : {
				data : [ "<dict:lang value="系统" />", "JVM" ],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				},
			},
			grid : {
				left : "5%",
				right : "12%",
				top : "10%",
				bottom : "8%",
				containLabel : true,

			},

			xAxis : [ {
				type : "category",
				boundaryGap : false,
				name : "min",
				data : [],
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				axisLabel : {
					interval : 9, //x坐标间隔
					formatter : function(value, index) {
						/* if(index != optionCpu.series[0].data.length -1) {
							return index +	"";
						}else {
							return (index) + "/min";
						} */
						
						return index + "";
					}
				}
			} ],
			yAxis : [ {
				type : "value",
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				splitNumber : 5, //y轴分割
				splitLine : {
					show : false
				},
				min : 0, // 最小值y
				max : 100,// 最大值y
				axisLabel : {
					formatter : "{value}%"
				}

			} ],
			series : [ {
				name : "<dict:lang value="系统" />",
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : "#7FFFD4",
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : "#7FFFD4"
						}
					}
				},
				data : []
			}, {
				name : "JVM",
				type : "line",
				stack : "JVMCPU",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : "#00F5FF",
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : "#00F5FF"
						}
					}
				},
				data : []
			} ]
		};

		var optionMemory = {
			color : [ "#FFF143", "#9370DB" ], //黄色 紫色
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				},
				formatter : "</br>{b}</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#FFF143;'></span>{a0}：{c0}%</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#9370DB;'></span>{a1}：{c1}%</br>"
			},
			legend : {
				data : [ "<dict:lang value="系统" />", "JVM" ],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				},
			},
			grid : {
				left : "5%",
				right : "12%",
				top : "10%",
				bottom : "8%",
				containLabel : true,

			},

			xAxis : [ {
				name : "min",
				type : "category",
				boundaryGap : false,
				data : [],
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				axisLabel : {
					interval : 9, //x坐标间隔
					formatter : function(value, index) {
						/* if(index != optionCpu.series[0].data.length -1) {
							return index +	"";
						}else {
							return (index) + "/min";
						} */
						return index + "";
					}
				}
			} ],
			yAxis : [ {
				type : "value",
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				splitNumber : 5, //y轴分割
				splitLine : {
					show : false
				},
				min : 0, // 最小值y
				max : 100,// 最大值y
				axisLabel : {
					formatter : "{value}%"
				}

			} ],
			series : [ {
				name : "<dict:lang value="系统" />",
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {	
						color : "#FFF143",
						opacity : 0.5
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : "#FFF143"
						}
					}
				},
				data : []
			}, {
				name : "JVM",
				type : "line",
				stack : "JVMCPU",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : "#9370DB",
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : "#9370DB"
						}
					}
				},
				data : []
			} ]
		};

		optionDisk = {
			
			color : [ "#3398DB" ],
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "shadow"
				},
				formatter : "{b}：{c}%"
			},
			legend : {
				data : [ "<dict:lang value="硬盘" />" ],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				},
			},
			grid : {
				left : "5%",
				right : "4%",
				bottom : "8%",
				top : "10%",
				containLabel : true
			},

			xAxis : [ {
				type : "category",
				data : [],
				axisTick : {
					alignWithLabel : true
				},
				axisLabel : {
					interval : 0,
				//rotate:40 //倾斜
				},
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
			} ],
			yAxis : [ {
				type : "value",
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				splitLine : {
					show : false
				//y轴分割线
				},
				min : 0, // 最小值y
				max : 100,// 最大值y
				axisLabel : {
					formatter : "{value}%"
				}
				
			} ],
			series : [ {
				name : "<dict:lang value="硬盘" />",
				type : "bar",
				barWidth : "60%",
				data : [],
				label : {
					normal : {
					/* show:true,
					position:"top",
					formatter:"{c}%", */
					}
				},
				itemStyle : {
					normal : {
						color : function(params) {
							if (optionDisk.series[0].data[params.dataIndex] > 90) {
								return "#FFEC8B";
							} else if (optionDisk.series[0].data[params.dataIndex] > 80) {
								return "#FF4040";
							} else {
								return optionDisk.color[0];
							}
						}
					}
				}
			} ]
		};
		
		
		var optionSession = {
			color : [ "#1E90FF"], //蓝色
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				},
				formatter : "</br>{b}</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#3398DB;'></span>{a0}：{c0}</br>"
			},
			legend : {
				data : [ "session"],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 字 颜色
				},
			},
			grid : {
				left : "5%",
				right : "12%",
				top : "10%",
				bottom : "8%",
				containLabel : true,

			},

			xAxis : [ {
				name : "min",
				type : "category",
				boundaryGap : false,
				data : [],
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				axisLabel : {
					interval : 9, //x坐标间隔
					formatter : function(value, index) {
						/* if(index != optionCpu.series[0].data.length -1) {
							return index +	"";
						}else {
							return (index) + "/min";
						} */
						return index + "";
					}
				}
			} ],
			yAxis : [ {
				name:"<dict:lang value="个" />",
				type : "value",
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				splitNumber : 5, //y轴分割
				splitLine : {
					show : false
				},
				/* min : 0, // 最小值y
				max : 100,// 最大值y */
				axisLabel : {
					formatter : "{value}"
				}

			} ],
			series : [ {
				name : "session",
				type : "line",
				stack : "session1",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : "#1E90FF",
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : "#1E90FF"
						}
					}
				},
				data : []
			} ]
		};
		
		
		var optionThread = {
			color : [ "#FFF143"], //黄色
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				},
				formatter : "</br>{b}</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#FFF143;'></span>{a0}：{c0}</br>"
			},
			legend : {
				data : [ "<dict:lang value="线程" />"],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				},
			},
			grid : {
				left : "5%",
				right : "12%",
				top : "10%",
				bottom : "8%",
				containLabel : true,

			},

			xAxis : [ {
				name : "min",
				type : "category",
				boundaryGap : false,
				data : [],
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				axisLabel : {
					interval : 9, //x坐标间隔
					formatter : function(value, index) {
						/* if(index != optionCpu.series[0].data.length -1) {
							return index +	"";
						}else {
							return (index) + "/min";
						} */
						return index + "";
					}
				}
			} ],
			yAxis : [ {
				name:"<dict:lang value="个" />",
				type : "value",
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				splitNumber : 5, //y轴分割
				splitLine : {
					show : false
				},
				/* min : 0, // 最小值y
				max : 100,// 最大值y */
				axisLabel : {
					formatter : "{value}"
				}

			} ],
			series : [ {
				name : "<dict:lang value="线程" />",
				type : "line",
				stack : "session1",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : "#FFF143",
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : "#FFF143"
						}
					}
				},
				data : []
			} ]
		};
		
		var optionGC = {
			color : [ "#68228B"], //紫色
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				},
				formatter : "</br>{b}</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#68228B;'></span>{a0}：{c0}个</br>"
			},
			legend : {
				data : [ "GC<dict:lang value="时间" />"],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				},
			},
			grid : {
				left : "5%",
				right : "12%",
				top : "10%",
				bottom : "8%",
				containLabel : true,

			},

			xAxis : [ {
				name : "min",
				type : "category",
				boundaryGap : false,
				data : [],
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				axisLabel : {
					interval : 9, //x坐标间隔
					formatter : function(value, index) {
						/* if(index != optionCpu.series[0].data.length -1) {
							return index +	"";
						}else {
							return (index) + "/min";
						} */
						return index + "";
					}
				}
			} ],
			yAxis : [ {
				name:"ms",
				type : "value",
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				splitNumber : 5, //y轴分割
				splitLine : {
					show : false
				},
				/* min : 0, // 最小值y
				max : 100,// 最大值y */
				axisLabel : {
					formatter : "{value}"
				}

			} ],
			series : [ {
				name : "GC<dict:lang value="时间" />",
				type : "line",
				stack : "session1",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : "#68228B",
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : "#68228B"
						}
					}
				},
				data : []
			} ]
		};
	</script>

	<script type="text/javascript">
		var _tempNode = '<%=CommMethodMc.escapeJs(request.getParameter("tempNode")) %>';
		$(function() {
			util.showTopLoading();
			switchNode();
		});
	</script>
	
	<script type="text/javascript">
		function switchNode(opt) {
			var tempNode = (_tempNode && _tempNode != "null" ) ? _tempNode : $("#node").val();
			
			
			$
					.ajax({
						url : "${path}performance/performanceMonitorAction_curNodeDetail.ms",
						type : "post",
						dataType : "json",
						data:"tempNode=" + tempNode,
						success : function(data) {
							util.closeTopLoading();
							 util.closeLoading();
							_tempNode = null;
							//node
							if(data && data.ajaxMap && data.ajaxMap.nodeIdList) {
								var selectHtml = [];
								var nodeIdList = data.ajaxMap.nodeIdList;
								var tempNode = data.ajaxMap.tempNode;
								for(var i=0;i<nodeIdList.length; i++) {
									if(tempNode == nodeIdList[i]) {
										selectHtml.push("<option style='color:#000000' selected='selected'  value='"+nodeIdList[i]+"'>"+nodeIdList[i]+"</option>");
									}else {
										selectHtml.push("<option style='color:#000000'  value='"+nodeIdList[i]+"'>"+nodeIdList[i]+"</option>");
									}
								}
								$("#node").html(selectHtml.join(""))
							}
						
							//http请求耗时
							if (data && data.ajaxMap
									&& data.ajaxMap.httpRequestCostList) {
								var httpRequestCostList = data.ajaxMap.httpRequestCostList;
								var httpRequestCostHtml = [];
								for ( var i = 0; i < httpRequestCostList.length; i++) {
									httpRequestCostHtml.push("<tr>");
									httpRequestCostHtml
											.push("<td style='width:320px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;text-align:left;'><span title='"+httpRequestCostList[i].URL+"'>"
													+ httpRequestCostList[i].URL
													+ "</span></td>");
									httpRequestCostHtml
											.push("<td style='width:160px'>"
													+ format(
															httpRequestCostList[i].RECODETIME,
															'yyyy-MM-dd HH:mm:ss')
													+ "</td>");
									httpRequestCostHtml
											.push("<td style='width:130px'>"
													+ httpRequestCostList[i].REQUEST_DURATION
													+ "</td>");
									httpRequestCostHtml
											.push("<td style='width:130px'>"
													+ httpRequestCostList[i].CPU_DURATION
													+ "</td>");
									httpRequestCostHtml.push("</tr>");
								}
								$("#http_request_cost").html(
										httpRequestCostHtml.join(""));
							}

							//cpu
							if (data && data.ajaxMap && data.ajaxMap.xCpu) {
								optionCpu.xAxis[0].data = data.ajaxMap.xCpu;
								optionCpu.series[0].data = data.ajaxMap.y2Cpu;
								optionCpu.series[1].data = data.ajaxMap.y1Cpu;

								echarts.init(
										document.getElementById("cpu_show"))
										.setOption(optionCpu);
							}

							//内存
							if (data && data.ajaxMap && data.ajaxMap.xMemory) {
								optionMemory.xAxis[0].data = data.ajaxMap.xMemory;
								optionMemory.series[0].data = data.ajaxMap.sysMemory;
								optionMemory.series[1].data = data.ajaxMap.jvmMemory;
								echarts.init(
										document.getElementById("memory_show"))
										.setOption(optionMemory);
							}

							//硬盘
							if (data && data.ajaxMap && data.ajaxMap.drive) {
								optionDisk.xAxis[0].data = data.ajaxMap.drive;
								optionDisk.series[0].data = data.ajaxMap.diskUse;
								echarts.init(
										document.getElementById("disk_show"))
										.setOption(optionDisk);
							}
							
							//session
							if(data && data.ajaxMap && data.ajaxMap.xSession) {
								optionSession.xAxis[0].data = data.ajaxMap.xSession;
								optionSession.series[0].data = data.ajaxMap.ySession;
								
								echarts.init(
										document.getElementById("session_show"))
										.setOption(optionSession);
							}
							
							//thread
							if(data && data.ajaxMap && data.ajaxMap.xThread) {
								optionThread.xAxis[0].data = data.ajaxMap.xThread;
								optionThread.series[0].data = data.ajaxMap.yThread;
								
								echarts.init(
										document.getElementById("thread_show"))
										.setOption(optionThread);
							}
							
							//gc时间
							if(data && data.ajaxMap && data.ajaxMap.xGc) {
								optionGC.xAxis[0].data = data.ajaxMap.xGc;
								optionGC.series[0].data = data.ajaxMap.yGc;
								
								echarts.init(
										document.getElementById("gc_show"))
										.setOption(optionGC);
							}
						},
						error : function(data) {
							util.closeTopLoading();
							util.closeLoading();
							console.log("error");
						}
					});
			
		}
	</script>
	
	<script type="text/javascript">
	
	function showDetail(url,title,width,height) {
		width = width? width:800;
		height = height? height:400;
		var tempNode = document.getElementById("node").value;
		showPopWin(url+"?tempNode="+tempNode, width, height, null, title);
	}
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>