<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><dict:lang value="监控系统" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>

<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
</jsp:include>
<link rel="stylesheet" type="text/css"
	href="${path}plf/page/timer/perforMonit/css/minitorSys.css?_mc_res_version=<%=PlfStaticRes.MINITORSYS_CSS %>">
<link rel="stylesheet" type="text/css" 
	href="${path}plf/page/timer/perforMonit/js/jquery.mCustomScrollbar.min.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_MIN_CSS %>">
<script
	src="${path}plf/page/timer/perforMonit/js/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
<script src="${path}plf/page/timer/perforMonit/js/echarts.min.js?_mc_res_version=<%=PlfStaticRes.ECHARTS_MIN_JS %>"></script>
<%-- <script src="${path}plf/js/subModal/submodalsource.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script> --%>
<%-- <script src="${path}plf/js/common/util.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script> --%>
<style type="text/css">
/* 	td {
		overflow: hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	} */
.sql_hidden {
	display: none;
}

.chartx>div{
	cursor: pointer !important;
}
</style>
</head>
<body>
	<div class="main_content">
		<div class="cpu">

		</div>
		<div class="news">
			<!-- <div class="news_left"></div> -->
			<div class="news_main">
				<dict:lang value="DB Time负载" /><span id="db_info"></span>
			</div>
			<div class="news_right"></div>
		</div>
		<div class="chart">
			<div class="chart_item">
				<div class="chart_top">
					<div class="chart_top_left"></div>
					<div class="chart_top_center"><dict:lang value="日志切换频率" /></div>
					<div class="chart_top_right"></div>
				</div>
				<div class="chart_bottom">
					<div id="log_switch_rate_show"></div>
				</div>
			</div>
			<div class="chart_item">
				<div class="chart_top">
					<div class="chart_top_left"></div>
					<div class="chart_top_center">Session</div>
					<div class="chart_top_right"></div>
				</div>
				<div class="chart_bottom">
					<div id="session_count_show"></div>
				</div>
			</div>
			<div class="chart_item">
				<div class="chart_top">
					<div class="chart_top_left"></div>
					<div class="chart_top_center"><dict:lang value="表空间使用率" /></div>
					<div class="chart_top_right"></div>
				</div>
				<div class="chart_bottom">
					<div id="tablespace_use_rate_show"></div>
				</div>
			</div>
		</div>
		<div class="table1">
			<div class="table1_left">
				<div class="annotation">
					<p>
						<span class="color" style="background-color: #edf22f;"></span> <span
							style="margin-right:10px;">CPU</span> <span class="color"
							style="background-color: #e1543c;"></span> <span><dict:lang value="内存" /></span>
					</p>
				</div>
				<div class="content1" ><div id="db_cpu" style="height:100%"></div></div>
				<div class="content1" ><div id="db_memory"  style="height:100%"></div></div>
			</div>
			<div class="table1_right container">
				<div class="tag">
					<ul >
						<li class="selected" style="margin-left:0;cursor: pointer;font-size: 12px;padding-left: 3px;" >top10<dict:lang value="执行缓慢" />sql(<dict:lang value="时间" />)</li>
						<li style="cursor: pointer;font-size: 12px;">top10<dict:lang value="执行缓慢" />sql(IO)</li>
						<li style="cursor: pointer;"><dict:lang value="锁阻塞" />sql</li>
					</ul>
				</div>
				<div class="content">
					<div class="content1" style="display:block;">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td>SQLID</td>
										<td style='width:65px'>SQL<dict:lang value="内容" /></td>
										<td><dict:lang value="最近有效时间" /></td>
										<td><dict:lang value="执行需要时间" />(s)</td>
										<td style="width:65px"><dict:lang value="执行次数" /></td>
										<td style='width:65px'><dict:lang value="执行成本" /></td>
										<td><dict:lang value="程序模块" /></td>
										<td><dict:lang value="物理读" /></td>
										<td style="width:65px"><dict:lang value="返回行数" /></td>
										<td><dict:lang value="磁盘读" /></td>
										<td><dict:lang value="直接路径写" /></td>
										<td><dict:lang value="解析名称" /></td>
									</tr>
								</thead>

							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="top10_slow_time">

								</tbody>
							</table>
						</div>
					</div>
					<div class="content2">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td>SQLID</td>
										<td style='width:65px'>SQL<dict:lang value="内容" /></td>
										<td><dict:lang value="最近有效时间" /></td>
										<td><dict:lang value="执行需要时间" />(s)</td>
										<td style="width:65px"><dict:lang value="执行次数" /></td>
										<td style='width:65px'><dict:lang value="执行成本" /></td>
										<td><dict:lang value="程序模块" /></td>
										<td><dict:lang value="物理读" /></td>
										<td style="width:65px"><dict:lang value="返回行数" /></td>
										<td><dict:lang value="磁盘读" /></td>
										<td><dict:lang value="直接路径写" /></td>
										<td><dict:lang value="解析名称" /></td>
									</tr>
								</thead>

							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="top10_slow_io"></tbody>
							</table>
						</div>
					</div>
					<div class="content3">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td><dict:lang value="用户名" /></td>
										<td><dict:lang value="持有锁" />ID</td>
										<td><dict:lang value="持有锁" />Serial#</td>
										<td><dict:lang value="持有锁机器名" /></td>
										<td><dict:lang value="持有锁程序名" /></td>
										<td><dict:lang value="等待锁" />SID</td>
										<td><dict:lang value="等待锁" />Serial#</td>
										<td><dict:lang value="等待锁机器名" /></td>
										<td><dict:lang value="等待锁程序名" /></td>
									</tr>
								</thead>

							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="lock_stop_sql">

								</tbody>
							</table>
						</div>
					
						
					</div>
				</div>
			</div>
		</div>
		<div class="table2">
			<div class="table2_left container">
				<div class="tag">
					<ul>
						<li class="selected" style="margin-left:0;cursor: pointer;"><dict:lang value="IO比率" /></li>
						<li style="cursor: pointer;"><dict:lang value="前10大等待事件" /></li>
						<li style="cursor: pointer;"><dict:lang value="前10大长时间操作" /></li>
					</ul>
				</div>
				<div class="content">
					<div class="content1" style="display:block;">
						<div class="tableHead">
							<table>
								<tr>
									<td style='width:150px;'><dict:lang value="表空间名" /></td>
									<td style='width:200px;'><dict:lang value="数据文件名" /></td>
									<td><dict:lang value="物理读" /></td>
									<td><dict:lang value="物理写" /></td>
									<td><dict:lang value="物理读" />BLOCK</td>
									<td><dict:lang value="物理写" />BLOCK</td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="io_rate_show"></tbody>
							</table>
						</div>
					</div>
					<div class="content2">
						<div class="tableHead">
							<table>
								<tr>
									<td style='width:600px;'><dict:lang value="等待事件" /></td>
									<td><dict:lang value="等待次数" /></td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="top10_wait_show"></tbody>
							</table>
						</div>
					</div>
					<div class="content3">
						<div class="tableHead">
							<table>
								<tr>
									<td style="width:80px">SID</td>
									<td style="width:100px"><dict:lang value="运行时间" /></td>
									<td style="width:200px"><dict:lang value="操作类型" /></td>
									<td>SQL<dict:lang value="内容" /></td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="top10_long_show"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="table2_right">
				<div class="table2_top">
					<ul>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}performance/performanceMonitorAction_sysExceptionLog.ms','<dict:lang value="系统异常日志" />')"><dict:lang value="系统异常日志" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}performance/performanceMonitorAction_appExceptionLog.ms','<dict:lang value="应用异常日志" />')"><dict:lang value="应用异常日志" /></a>
						</li>
					</ul>
				</div>
				<div class="table2_line">
					<div class="line_left"></div>
					<div class="line_text"><dict:lang value="超链接" /></div>
					<div class="line_right"></div>
				</div>
				<div class="table2_bottom">
					<ul>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}performance/performanceMonitorAction_dbTime.ms','<dict:lang value="DB Time负载" />')"><dict:lang value="DB Time负载" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/lockStopMonitor.jsp','<dict:lang value="锁阻塞侦测（带解锁功能）" />')"><dict:lang value="锁阻塞侦测（带解锁功能）" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/lockStopObj.jsp','<dict:lang value="锁阻塞对象" />')"><dict:lang value="锁阻塞对象" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/onlineUser.jsp','<dict:lang value="在线并发用户" />')"><dict:lang value="在线并发用户" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/exeSlowSql.jsp','<dict:lang value="当日执行缓慢的sql" />')"><dict:lang value="当日执行缓慢的sql" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/showAllTable.jsp','<dict:lang value="显示全表扫描大表的sql" />')"><dict:lang value="显示全表扫描大表的sql" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/viewExeSql.jsp','<dict:lang value="查看长时间运行sql" />')"><dict:lang value="查看长时间运行sql" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/tablespaceUse.jsp','<dict:lang value="表空间使用量监控" />')"><dict:lang value="表空间使用量监控" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/tableDataUse.jsp','<dict:lang value="表数据量情况(TOP10)" />')"><dict:lang value="表数据量情况(TOP10)" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/sysWait.jsp','<dict:lang value="系统等待事件" />')"><dict:lang value="系统等待事件" /></a>
						</li>
						<li><a href="javascript:void(0)"
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/disabledObj.jsp','<dict:lang value="失效对象监控" />')"><dict:lang value="失效对象监控" /></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		//仪表盘
		var option = {
			series : [ {
				name : '系统CPU',
				radius : '95%',
				splitNumber : 10, //每段的多少个
				title : {
					color : '#333',
				},
				type : 'gauge',
				detail : {
					formatter : '{value}%',
					fontSize : 12,
				},
				axisLine : { //刻度区域样式
					lineStyle : {
						width : 10
					}
				},
				splitLine : { //小刻度线样式
					show : false,
					length : 10,
				},
				axisTick : { //大刻度线样式
					length : 10,
					splitNumber : 1,
					lineStyle : {
						color : '#041644',
					}
				},
				axisLabel : {//刻度值
					show : true,
					distance : 2,
					fontSize : 8,
				},
				pointer : {
					width : 2,
				},
				title : {
					offsetCenter : [ 0, '90%' ],
					color : '#fff',
					fontSize : 14,
				},
				data : [ {
					value : 50,
					name : '<dict:lang value="系统" />cpu',
				} ]
			} ]
		};

		var option2 = {
			series : [ {
				name : 'jvmCPU',
				radius : '95%',
				splitNumber : 10, //每段的多少个
				title : {
					color : '#333',
				},
				type : 'gauge',
				detail : {
					formatter : '{value}%',
					fontSize : 12,
				},
				axisLine : { //刻度区域样式
					lineStyle : {
						width : 10
					}
				},
				splitLine : { //小刻度线样式
					show : false,
					length : 10,

				},
				axisTick : { //大刻度线样式
					length : 10,
					splitNumber : 1,
					lineStyle : {
						color : '#041644',
					}
				},
				axisLabel : {//刻度值
					show : true,
					distance : 2,
					fontSize : 8,
				},
				pointer : {
					width : 2,
				},
				title : {
					offsetCenter : [ 0, '90%' ],
					color : '#fff',
					fontSize : 14,
				},
				data : [ {
					value : 50,
					name : 'JVMcpu'
				} ]
			} ]
		};

		//日志切换频率
		var optionLogSwitch = {
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				}
			},
			legend : {
				data : [ "<dict:lang value="切换频率" />" ],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				}
			},
			grid : {
				left : "1%",
				right : "1%",
				top : "10%",
				bottom : "1%",
				containLabel : true,

			},

			xAxis : [ {
				type : "category",
				boundaryGap : false,
				data : [],
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				axisLabel : {
					interval : 50,
					formatter : function(value) {
						return value.split(" ").join("\n");
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
				splitLine : {
					show : false
				}

			} ],
			series : [ {
				name : "<dict:lang value="切换频率" />",
				type : "line",
				stack : "<dict:lang value="间隔时间" />",
				label : {
					normal : {
						show : false,
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						//color: "",
						opacity : 0.3
					//区域透明度
					}
				},
				data : []
			} ]
		};

		//Session
		var optionDbSession = {
			color:["#FFF143","#90EE90"],
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				}
			},
			legend : {
				data : [ "<dict:lang value="总会话" />", "<dict:lang value="当前会话" />" ],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				},
			},
			grid : {
				left : "3%",
				right : "5%",
				top : "10%",
				bottom : "1%",
				containLabel : true,

			},

			xAxis : [ {
				type : "category",
				boundaryGap : false,
				data : [],
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				axisLabel : {
					interval : 40,
					formatter : function(value) {
						return value.split(" ").join("\n");
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
				splitLine : {
					show : false
				}

			} ],
			series : [ {
				name : "<dict:lang value="总会话" />",
				type : "line",
				stack : "<dict:lang value="总会话数" />",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color: "#FFF143",
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle:{
					normal: {
						lineStyle:{
							color:"#FFF143"
						}
					}
				},
				data : []
			}, {
				name : "<dict:lang value="当前会话" />",
				type : "line",
				stack : "<dict:lang value="当前会话数" />",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color: "#90EE90",
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle:{
					normal: {
						lineStyle:{
							color:"#90EE90"
						}
					}
				},
				data : []
			} ]
		};
		
		//表空间使用率
		optionTablespace = {
			color:["#3398DB"],
			tooltip: {
				trigger:"axis",
				axisPointer: {
					type:"shadow"
				},
				formatter:"{b}：{c}%"
			},
			legend : {
				data : [ "<dict:lang value="表空间" />"],
				left : "right",
				textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				},
			},
			grid: {
				left:"3%",
				right:"4%",
				bottom:"3%",
				top:"10%",
				containLabel:true
			},
			xAxis:[{
				type:"category",
				data:[],
				axisTick:{
					alignWithLabel:true
				},
				axisLabel:{
					interval:0,
					rotate:40 //倾斜
				},
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
			}],
			yAxis:[{
				type:"value",
				axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				},
				splitLine : {
					show : false //y轴分割线
				},
				axisLabel:{
					formatter:"{value}%"
				}
			}],
			series:[{
				name:"<dict:lang value="表空间" />",
				type:"bar",
				barWidth:"60%",
				data:[],
				label:{
					normal:{
						/* show:true,
						position:"top",
						formatter:"{c}%", */
					}
				},
				itemStyle:{
					normal: {
						color:function(params) {
							if(optionTablespace.series[0].data[params.dataIndex] > 90 ) {
								return "#FFEC8B";
							}else if(optionTablespace.series[0].data[params.dataIndex] > 80){
								return "#FF4040";
							}else {
								return optionTablespace.color[0];
							}
						}
					}
				}
			}]
		};
		
		//db:JVM SYS CPU
		
			//渐变色
		var mycolor = new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
			offset : 0,
			color : "#00BFFF"
		}, {
			offset : 1,
			color : "#7FFFAA"
		} ], false);
		optionDbCpuAndMemory = {
			series:[{
				type:"gauge",
				name:"",
				radius:"100%", //仪表盘半径
				startAngle: 225, //弧长
				clockwise:true, //是否顺时针增长
				min:0, //最小刻度
				max:100, //最大刻度
				splitNumber:10, //分割线
				axisLine: {
					show:true,
					lineStyle:{
						color:[
							[1,mycolor] //仪表盘渐变色
						],
						width:8,
					}
				},
				splitLine:{
					show:true,
					length:9, //大刻度线长
					lineStyle:{
						color:"#192863",
						width:1
					}
				},
				axisTick:{
					show:false, //隐藏小刻度线
				},
				axisLabel:{ //大刻度标签
					show:true,
					color:"#D1EEEE",
					fontSize:10
				},
				pointer: {
					show:true,
					length:"75%",
					width:3
				},
				itemStyle:{
					normal:{
						color:"" //默认是auto ，需要渐变 所以取消
					}
				},
				title:{
					show:true,
					offsetCenter:[0,"85%"], //标题位置
					fontSize:16,
					color:"#00BFFF"
				},
				detail:{
					show:false //不显示 实时值
				},
				data:[{
					value:0,
					name:"数据库",
					itemStyle:{
						normal:{
							color:["#FFFF00"] //黄
						}					
					}
				},{
					value:30,
					name:"MEMPRY",
					itemStyle:{
						normal:{
							color:["#FF6347"]
						}
					}
				}]
				
				
			}]
		};
		
		//db memory
		optionDbMemory = {
			series:[{
				type:"gauge",
				name:"",
				radius:"100%", //仪表盘半径
				startAngle: 225, //弧长
				clockwise:true, //是否顺时针增长
				min:0, //最小刻度
				max:100, //最大刻度
				splitNumber:10, //分割线
				axisLine: {
					show:true,
					lineStyle:{
						color:[
							[1,mycolor] //仪表盘渐变色
						],
						width:8,
					}
				},
				splitLine:{
					show:true,
					length:8, //大刻度线长
				},
				axisTick:{
					show:false, //隐藏小刻度线
				},
				axisLabel:{ //大刻度标签
					show:true,
					color:"#D1EEEE",
					fontSize:10
				},
				pointer: {
					show:true,
					length:"75%",
					width:3
				},
				itemStyle:{
					normal:{
						color:"" //默认是auto ，需要渐变 所以取消
					}
				},
				title:{
					show:true,
					offsetCenter:[0,"85%"], //标题位置
					fontSize:16,
					color:"#00BFFF"
				},
				detail:{
					show:false //不显示 实时值
				},
				data:[{
					value:0,
					name:"<dict:lang value="内存" />",
					itemStyle:{
						normal:{
							color:["#FFFF00"] //黄
						}					
					}
				},{
					value:30,
					name:"sys",
					itemStyle:{
						normal:{
							color:["#FF6347"]
						}
					}
				}]
				
				
			}]
		};
	</script>
	<script>
		$(function() {
			$('.cpu_block4_bottom').each(function(index, item) {
				switch ($(item).find('div').length) {
				case 1: {
					$(item).find('div').eq(0).css('margin-top', '36px');
					break;
				}
				case 2: {
					$(item).find('div').eq(0).css('margin-top', '27px');
					break;
				}
				case 3: {
					$(item).find('div').eq(0).css('margin-top', '18px');
					break;
				}
				case 4: {
					$(item).find('div').eq(0).css('margin-top', '9px');
					break;
				}
				default:
					break;
				}
			});
		});

		//tab页切换
		$('.tag li').click(
				function() {
					var index = $(this).index() + 1;
					$(this).addClass('selected').siblings().removeClass(
							'selected');
					$(this).parents('.container').find('.content' + index).css(
							'display', 'block').siblings().css('display', '');
				})
	</script>
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
			});
		})(jQuery);
	</script>
	<script type="text/javascript">
		$(function() {
			/* //日志切换频率折线图
			mchart.lineMchart("4003eab8-b659-497a-ba06-c844d572e889", "log_switch_rate_show", {});
			//表空间使用率
			mchart.barMchart("4e85309e-08b1-4318-aa0a-5b3265b61467", "tablespace_use_rate_show", {}); */

		});
	</script>
	<script type="text/javascript">
		var format = function(time, format) {
			var t = new Date(time);
			var tf = function(i) {
				return i < 10 ? '0' + i : i;
			};

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
	</script>

	<script type="text/javascript">
		var optionsForbidFlag = false;
		var options = [];
		var dom = [];
		function loadView() {
			$.ajax({
						url : "${path}performance/performanceMonitorAction_listPerformanceMonitor.ms",
						type : "post",
						dataType : "json",
						success : function(data) {
							util.closeTopLoading();
							 util.closeLoading();
							//节点信息
							if (data && data.ajaxMap
									&& data.ajaxMap.nodeDetailList) {
								var nodeHtmlArr = [];
								var nodeDetailList = data.ajaxMap.nodeDetailList;
								for ( var i = 0; i < nodeDetailList.length; i++) {
									nodeHtmlArr.push("<div class='cpu_item'>");
									nodeHtmlArr.push("  <div class='cpu_top'>");
									nodeHtmlArr.push("    <div class='cpu_top_left'></div>");
									nodeHtmlArr.push("    <div class='cpu_top_center'>");
									nodeHtmlArr.push("    	<a href='javascript:void(0)' onclick='toNodeView(this)'>"+ (nodeDetailList[i].NODEID?nodeDetailList[i].NODEID:"")+ "</a>");
									nodeHtmlArr.push("    </div>");
									nodeHtmlArr.push("    <div class='cpu_top_right'></div>");
									nodeHtmlArr.push("  </div>");
									nodeHtmlArr.push("  <div class='cpu_bottom'>");
									nodeHtmlArr.push("    <div class='cpu_block1' id='cpu_"+nodeDetailList[i].NODEID+"' style='cursor: pointer;' title='<dict:lang value="点击查看CPU详情"/>' onclick=showDetail(this,'${path}performance/performanceMonitorAction_cpuView.ms','<dict:lang value="CPU详情"/>')> ");
									if(!optionsForbidFlag) {
										nodeHtmlArr.push("<div  id='box_"+nodeDetailList[i].NODEID+"' style='width:100%;cursor: pointer;'>");
										nodeHtmlArr.push("    	<div class='chartx' style='width:150px;height:150px;float:left;cursor: pointer;' id='jvmcpu_"+nodeDetailList[i].NODEID+"' ></div>");
										nodeHtmlArr.push("    	<div class='chartx' style='width:150px;height:150px;float:left;cursor: pointer;' id='syscpu_"+nodeDetailList[i].NODEID+"' ></div></div>");
										var jvmOption = $.extend(true, {}, option2);
										jvmOption.series[0].data[0].value = (nodeDetailList[i].JVM_CPU?nodeDetailList[i].JVM_CPU:0);
										var sysOption = $.extend(true, {}, option);
										sysOption.series[0].data[0].value = (nodeDetailList[i].INUSE_CPU?nodeDetailList[i].INUSE_CPU:0); 
										var obj = {};
										obj.id = nodeDetailList[i].NODEID;
										obj.jvmOption = jvmOption;
										obj.sysOption = sysOption;
										options.push(obj); 
									}else {
										options[i].jvmOption.series[0].data[0].value = (nodeDetailList[i].JVM_CPU?nodeDetailList[i].JVM_CPU:0);
										options[i].sysOption.series[0].data[0].value = (nodeDetailList[i].INUSE_CPU?nodeDetailList[i].INUSE_CPU:0); 
									}
									nodeHtmlArr.push("    </div>");
									nodeHtmlArr.push("    <div class='cpu_block2' id='memory_"+nodeDetailList[i].NODEID+"' style='cursor: pointer;' title='<dict:lang value="点击查看内存详情"/>' onclick=showDetail(this,'${path}performance/performanceMonitorAction_memoryView.ms','<dict:lang value="内存详情"/>') >");
									nodeHtmlArr.push("    	<div class='container'>");
									nodeHtmlArr.push("    	  <div class='cpu_block2_left'>");
									nodeHtmlArr.push("    	    <p ><dict:lang value="系统内存" /></p>");
									nodeHtmlArr.push("    	  </div>");
									nodeHtmlArr.push("    	  <div class='cpu_block2_right'>");
									nodeHtmlArr.push("    	    <span></span> <span></span> <span></span> <span></span>");
									nodeHtmlArr.push("    	    <div>");
									nodeHtmlArr.push("    	      <p >");
									nodeHtmlArr.push("    	        "+ (nodeDetailList[i].INUSE_MEMORY?nodeDetailList[i].INUSE_MEMORY :"0")+ "<span>G</span>");
									nodeHtmlArr.push("    	      </p>");
									nodeHtmlArr.push("    	    </div>");
									nodeHtmlArr.push("    	    <div>");
									nodeHtmlArr.push("    	      <p ><dict:lang value="已使用/总数" /></p>");
									nodeHtmlArr.push("    	      <p >/&nbsp;"+ (nodeDetailList[i].SYS_MEMORY_TOTAL?nodeDetailList[i].SYS_MEMORY_TOTAL:"0")+ "G</p>");
									nodeHtmlArr.push("    	    </div>");
									nodeHtmlArr.push("    	  </div>");
									nodeHtmlArr.push("    	</div>");
									nodeHtmlArr.push("    	<div class='container'>");
									nodeHtmlArr.push("    	  <div class='cpu_block2_left'>");
									nodeHtmlArr.push("    	    <p>JVM<dict:lang value="内存" /></p>");
									nodeHtmlArr.push("    	  </div>");
									nodeHtmlArr.push("    	  <div class='cpu_block2_right'>");
									nodeHtmlArr.push("    	    <span></span> <span></span> <span></span> <span></span>");
									nodeHtmlArr.push("    	    <div>");
									nodeHtmlArr.push("    	      <p>");
									nodeHtmlArr.push("    	        "+ (nodeDetailList[i].JVM_MEMORY?nodeDetailList[i].JVM_MEMORY:"0")+ "<span>M</span>");
									nodeHtmlArr.push("    	      </p>");
									nodeHtmlArr.push("    	    </div>");
									nodeHtmlArr.push("    	    <div>");
									nodeHtmlArr.push("    	      <p><dict:lang value="已使用/总数" /></p>");
									nodeHtmlArr.push("    	      <p>/&nbsp;"+ (nodeDetailList[i].JVM_MEMORY_TOTAL?nodeDetailList[i].JVM_MEMORY_TOTAL:"0")+ "M</p>");
									nodeHtmlArr.push("    	    </div>");
									nodeHtmlArr.push("    	  </div>");
									nodeHtmlArr.push("    	</div>");
									nodeHtmlArr.push("   </div>");
									nodeHtmlArr.push("   <div class='cpu_block3' >");
									nodeHtmlArr.push("     <div id='session_"+nodeDetailList[i].NODEID+"' style='cursor: pointer;' title='<dict:lang value="点击查看Session详情"/>' onclick=showDetail(this,'${path}performance/performanceMonitorAction_sessionView.ms','<dict:lang value="Session详情"/>')>");
									nodeHtmlArr.push("       <div class='cpu_block3_top'>Session（<dict:lang value="个" />）</div>");
									nodeHtmlArr.push("       <div class='cpu_block3_bottom'>"+ (nodeDetailList[i].SESSION_COUNT ?nodeDetailList[i].SESSION_COUNT:0 )+ "</div>");
									nodeHtmlArr.push("     </div>");
									nodeHtmlArr.push("     <div id='thread_"+nodeDetailList[i].NODEID+"' style='cursor: pointer;' title='<dict:lang value="点击查看线程详情"/>' onclick=showDetail(this,'${path}performance/performanceMonitorAction_threadView.ms','<dict:lang value="线程详情"/>')>");
									nodeHtmlArr.push("       <div class='cpu_block3_top'><dict:lang value="线程" />（<dict:lang value="个" />）</div>");
									nodeHtmlArr.push("       <div class='cpu_block3_bottom'>"+ (nodeDetailList[i].THREAD_COUNT?nodeDetailList[i].THREAD_COUNT :0 )+ "</div>");
									nodeHtmlArr.push("     </div>");
									nodeHtmlArr.push("     <div style='margin-right:0px;cursor: pointer;' id='thread_"+nodeDetailList[i].NODEID+"'  title='<dict:lang value="点击查看GC详情"/>' onclick=showDetail(this,'${path}performance/performanceMonitorAction_gcView.ms','<dict:lang value="GC详情"/>')>" );
									nodeHtmlArr.push("       <div class='cpu_block3_top'>GC<dict:lang value="时间" />（ms）</div>");
									nodeHtmlArr.push("       <div class='cpu_block3_bottom'>"+ (nodeDetailList[i].DURING_TIME?nodeDetailList[i].DURING_TIME:"0")+ "</div>");
									nodeHtmlArr.push("     </div>");
									nodeHtmlArr.push("   </div>");
									nodeHtmlArr.push("   <div class='cpu_block4' id='disk_"+nodeDetailList[i].NODEID+"' style='cursor: pointer;' title='<dict:lang value="点击查看硬盘详情"/>' onclick=showDetail(this,'${path}performance/performanceMonitorAction_diskView.ms','<dict:lang value="硬盘详情"/>',1000)>");
									nodeHtmlArr.push("     <div class='cpu_block4_top'><dict:lang value="硬盘" /></div>");
									nodeHtmlArr.push("     <div class='cpu_block4_bottom'>");
									for ( var j = 0; j < nodeDetailList[i].diskDetailList.length; j++) {
										nodeHtmlArr.push("     <div>");
										nodeHtmlArr.push("       <span>"+ nodeDetailList[i].diskDetailList[j].DRIVE+ "</span> <span><span class='current' style='display: block;float: left;height: 10px;background-color: #f7c92f;width:"
														+ parseInt(nodeDetailList[i].diskDetailList[j].INUSE_DISK/ nodeDetailList[i].diskDetailList[j].DISK* 100)
														+ "px;'></span> </span> <span><span");
										nodeHtmlArr.push("       class='current'>"
														+ nodeDetailList[i].diskDetailList[j].INUSE_DISK
														+ "G</span>/"
														+ nodeDetailList[i].diskDetailList[j].DISK
														+ "G</span>");
										nodeHtmlArr.push("     </div>");
									}
									nodeHtmlArr.push("     </div>");
									nodeHtmlArr.push("   </div>");
									nodeHtmlArr.push(" </div>");
									nodeHtmlArr.push("</div>");
								}
								$(".cpu").html(nodeHtmlArr.join(""));
								
								//仪表盘
								if(!optionsForbidFlag) {
									for ( var i = 0; i < options.length; i++) {
										echarts.init(document.getElementById("syscpu_"+ options[i].id)).setOption(options[i].sysOption);
										echarts.init(document.getElementById("jvmcpu_"+ options[i].id)).setOption(options[i].jvmOption);
										dom.push(document.getElementById("box_"+options[i].id));
									}
								}else {
									for(var i=0 ; i<options.length; i++) {
										$(document.getElementById("cpu_"+options[i].id)).append(dom[i]);
										echarts.init(document.getElementById("syscpu_"+ options[i].id)).setOption(options[i].sysOption);
										echarts.init(document.getElementById("jvmcpu_"+ options[i].id)).setOption(options[i].jvmOption);
									}
								}
								optionsForbidFlag = true;
							}

							//锁阻塞sql
							if (data && data.ajaxMap
									&& data.ajaxMap.lockStopSQLList) {
								var lockStopSQLHtmlArr = [];
								var lockStopSQLList = data.ajaxMap.lockStopSQLList;
								for ( var i = 0; i < lockStopSQLList.length; i++) {
									lockStopSQLHtmlArr.push("<tr>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].DB_USER+ "</td>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].SID + "</td>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].SERIAL+ "</td>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].BLOCKING_MACHINE+ "</td>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].BLOCKING_APP+ "</td>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].WSID+ "</td>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].WSERIAL+ "</td>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].WAITING_MACHINE+ "</td>");
									lockStopSQLHtmlArr.push("<td>"+ lockStopSQLList[i].WAITING_APP+ "</td>");
									lockStopSQLHtmlArr.push("</tr>");
								}

								$("#lock_stop_sql").html(
										lockStopSQLHtmlArr.join());
							}

							//top10缓慢sql time
							if (data && data.ajaxMap
									&& data.ajaxMap.top10SQLTimeList) {
								var top10SQLTimeHtmlArr = [];
								var top10SQLTimeList = data.ajaxMap.top10SQLTimeList;
								for ( var i = 0; i < top10SQLTimeList.length; i++) {
									top10SQLTimeHtmlArr.push("<tr>");
									top10SQLTimeHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;' ><span title='"+top10SQLTimeList[i].SQL_ID+"'>"+top10SQLTimeList[i].SQL_ID+ "</span></td>");
									top10SQLTimeHtmlArr.push("<td style='width:65px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
													+ "<span style='display:none;'>"+top10SQLTimeList[i].SQL_ID+"</span>"
													+ top10SQLTimeList[i].SQL_FULLTEXT
													+ "</td>");
									top10SQLTimeHtmlArr.push("<td >"+ format(top10SQLTimeList[i].LAST_ACTIVE_TIME,'yyyy-MM-dd HH:mm:ss')+ "</td>");
									top10SQLTimeHtmlArr.push("<td>"+ top10SQLTimeList[i].EXE_TIME+ "</td>");
									top10SQLTimeHtmlArr.push("<td style='width:65px'>"+ top10SQLTimeList[i].EXE_COUNT+ "</td>");
									top10SQLTimeHtmlArr.push("<td style='width:65px'>"+ top10SQLTimeList[i].EXE_COST+ "</td>");
									top10SQLTimeHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;' ><span title='"+top10SQLTimeList[i].MODULE+"'>"
													+ (!top10SQLTimeList[i].MODULE? "":top10SQLTimeList[i].MODULE)
													+ "</span></td>");
									top10SQLTimeHtmlArr.push("<td>"+ top10SQLTimeList[i].PHYSICAL_READ+ "</td>");
									top10SQLTimeHtmlArr.push("<td style='width:65px'>"+ top10SQLTimeList[i].BACK_ROW+ "</td>");
									top10SQLTimeHtmlArr.push("<td>"+ top10SQLTimeList[i].DISK_READ+ "</td>");
									top10SQLTimeHtmlArr.push("<td>"+ top10SQLTimeList[i].DIRECT_WRITE+ "</td>");
									top10SQLTimeHtmlArr.push("<td>"+ top10SQLTimeList[i].PARSING_SCHEMA_NAME+ "</td>");
									top10SQLTimeHtmlArr.push("</tr>");
								}
								$("#top10_slow_time").html(
										top10SQLTimeHtmlArr.join(""));
							}

							//top10缓慢sql IO
							if (data && data.ajaxMap
									&& data.ajaxMap.top10SQLIOList) {
								var top10SQLIOHtmlArr = [];
								var top10SQLIOList = data.ajaxMap.top10SQLIOList;
								for ( var i = 0; i < top10SQLIOList.length; i++) {
									top10SQLIOHtmlArr.push("<tr>");
									top10SQLIOHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'><span title='"+top10SQLIOList[i].SQL_ID+"'>"+top10SQLIOList[i].SQL_ID + "<span></td>");
									top10SQLIOHtmlArr.push("<td style='width:65px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
													+ "<span style='display:none;'>"+top10SQLIOList[i].SQL_ID+"</span>"
													+ top10SQLIOList[i].SQL_FULLTEXT
													+ "</td>");
									top10SQLIOHtmlArr.push("<td >"+ format(top10SQLIOList[i].LAST_ACTIVE_TIME,'yyyy-MM-dd HH:mm:ss')
													+ "</td>");
									top10SQLIOHtmlArr.push("<td>"+ top10SQLIOList[i].EXE_TIME+ "</td>");
									top10SQLIOHtmlArr.push("<td style='width:65px'>"+ top10SQLIOList[i].EXE_COUNT+ "</td>");
									top10SQLIOHtmlArr.push("<td style='width:65px'>"+ top10SQLIOList[i].EXE_COST+ "</td>");
									top10SQLIOHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;' ><span title='"+top10SQLIOList[i].MODULE+"'>"
													+ (!top10SQLIOList[i].MODULE? "":top10SQLIOList[i].MODULE)
													+ "</span></td>");
									top10SQLIOHtmlArr.push("<td>"+ top10SQLIOList[i].PHYSICAL_READ+ "</td>");
									top10SQLIOHtmlArr.push("<td style='width:65px'>"+ top10SQLIOList[i].BACK_ROW+ "</td>");
									top10SQLIOHtmlArr.push("<td>"+ top10SQLIOList[i].DISK_READ+ "</td>");
									top10SQLIOHtmlArr.push("<td>"+ top10SQLIOList[i].DIRECT_WRITE+ "</td>");
									top10SQLIOHtmlArr.push("<td>"+ top10SQLIOList[i].PARSING_SCHEMA_NAME+ "</td>");
									top10SQLIOHtmlArr.push("</tr>");
								}
								$("#top10_slow_io").html(
										top10SQLIOHtmlArr.join(""));
							}

							//io比率
							if (data && data.ajaxMap && data.ajaxMap.ioRateList) {
								var ioRateHtmlArr = [];
								var ioRateList = data.ajaxMap.ioRateList;
								for ( var i = 0; i < ioRateList.length; i++) {
									ioRateHtmlArr.push("<tr>");
									ioRateHtmlArr
											.push("<td style='width:150px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'><span title='"+ioRateList[i].NAME+"'>"
													+ ioRateList[i].NAME
													+ "</span></td>");
									ioRateHtmlArr
											.push("<td style='width:200px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'><span title='"+ioRateList[i].FILE_NAME+"'>"
													+ ioRateList[i].FILE_NAME
													+ "</span></td>");
									ioRateHtmlArr.push("<td>"
											+ ioRateList[i].PYR + "</td>");
									ioRateHtmlArr.push("<td>"
											+ ioRateList[i].PYW + "</td>");
									ioRateHtmlArr.push("<td>"
											+ ioRateList[i].PBR + "</td>");
									ioRateHtmlArr.push("<td>"
											+ ioRateList[i].PBW + "</td>");
									ioRateHtmlArr.push("</tr>");
								}
								$("#io_rate_show").html(ioRateHtmlArr.join(""));
							}

							//前10大等待事件
							if (data && data.ajaxMap
									&& data.ajaxMap.top10WaitEventList) {
								var top10WaitEventHtmlArr = [];
								var top10WaitEventList = data.ajaxMap.top10WaitEventList;
								for ( var i = 0; i < top10WaitEventList.length; i++) {
									top10WaitEventHtmlArr.push("<tr>");
									top10WaitEventHtmlArr
											.push("<td style='width:600px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'><span title='"+top10WaitEventList[i].EVENT+"'>"
													+ top10WaitEventList[i].EVENT
													+ "</span></td>");
									top10WaitEventHtmlArr.push("<td>"
											+ top10WaitEventList[i].COUNT
											+ "</td>");
									top10WaitEventHtmlArr.push("</tr>");
								}

								$("#top10_wait_show").html(
										top10WaitEventHtmlArr.join(""));
							}

							//前10大长时间操作
							if (data && data.ajaxMap
									&& data.ajaxMap.top10LongTimeOperaList) {
								var top10LongTimeOperaHtmlArr = [];
								var top10LongTimeOperaList = data.ajaxMap.top10LongTimeOperaList;
								for ( var i = 0; i < top10LongTimeOperaList.length; i++) {
									top10LongTimeOperaHtmlArr.push("<tr>");
									top10LongTimeOperaHtmlArr
											.push("<td style='width:80px;'>"
													+ top10LongTimeOperaList[i].SID
													+ "</td>");
									top10LongTimeOperaHtmlArr
											.push("<td style='width:100px;'>"
													+ top10LongTimeOperaList[i].EXE_TIME
													+ "</td>");
									top10LongTimeOperaHtmlArr
											.push("<td style='width:200px;'>"
													+ top10LongTimeOperaList[i].OPNAME
													+ "</td>");
									top10LongTimeOperaHtmlArr
											.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(2,this)'>"
													+ "<span style='display:none;'>"+top10LongTimeOperaList[i].SID+"</span>"
													+ top10LongTimeOperaList[i].SQL_TEXT
													+ "</td>");
									top10LongTimeOperaHtmlArr.push("</tr>");
								}
								$("#top10_long_show").html(
										top10LongTimeOperaHtmlArr.join(""));
							}

							//日志切换频率
							if (data && data.ajaxMap && data.ajaxMap.logSwitchRateX) {
								//x数据项
								optionLogSwitch.xAxis[0].data = data.ajaxMap.logSwitchRateX;
							}

							if (data && data.ajaxMap && data.ajaxMap.logSwitchRateY) {
								//y 数据值
								optionLogSwitch.series[0].data = data.ajaxMap.logSwitchRateY;
							}
							echarts.init(document.getElementById("log_switch_rate_show")).setOption(optionLogSwitch);
							
							//dbSession
							if(data && data.ajaxMap && data.ajaxMap.xDbSessionData) {
								//x数据项
								optionDbSession.xAxis[0].data = data.ajaxMap.xDbSessionData;
							}
								//y1 数据值
							if (data && data.ajaxMap && data.ajaxMap.y1DbSessionData) {
								optionDbSession.series[0].data = data.ajaxMap.y1DbSessionData;
							}
							if (data && data.ajaxMap && data.ajaxMap.y2DbSessionData) {
								optionDbSession.series[1].data = data.ajaxMap.y2DbSessionData;
							}
							echarts.init(document.getElementById("session_count_show")).setOption(optionDbSession);
							
							
							//表空间使用率
							if(data && data.ajaxMap && data.ajaxMap.xTablespaceUse) {
								//x数据项
								optionTablespace.xAxis[0].data = data.ajaxMap.xTablespaceUse;
							}
							
							if(data && data.ajaxMap && data.ajaxMap.yTablespaceUse) {
								//y数据值
								optionTablespace.series[0].data = data.ajaxMap.yTablespaceUse;
							}
							echarts.init(document.getElementById("tablespace_use_rate_show")).setOption(optionTablespace);
							
							//数据库基本信息
							if(data && data.ajaxMap && data.ajaxMap.dbInfo) {
								var dbInfo = data.ajaxMap.dbInfo;
								var dbInfoHtml = [];
								for(var i=0; i<dbInfo.length; i++) {
									dbInfoHtml.push((i+1)+"："+dbInfo[i]+"&nbsp;&nbsp;");
								}
								
								var dbBaseInfo = data.ajaxMap.dbBaseInfo;
								var dbBaseInfoHtml = [];
								dbBaseInfoHtml.push("<dict:lang value="数据库ID" />:"+dbBaseInfo.dbId);
								dbBaseInfoHtml.push("&nbsp;<dict:lang value="实例名" />:"+dbBaseInfo.instanceName);
								dbBaseInfoHtml.push("&nbsp;<dict:lang value="主机名" />:"+dbBaseInfo.hostName);
								dbBaseInfoHtml.push("&nbsp;<dict:lang value="启动时间" />:"+dbBaseInfo.startupTime);
								$("#db_info").html("(&nbsp;&nbsp;" +dbBaseInfoHtml.join("")+"&nbsp;&nbsp;"+dbInfoHtml.join("") +")");
							} 
							
							// db cpu memory
							if(data && data.ajaxMap && data.ajaxMap.dbCpuMemoryList)  {
								var dbCpuMemoryList = data.ajaxMap.dbCpuMemoryList;
								optionDbCpuAndMemory.series[0].data[0].value = (!dbCpuMemoryList[0].DB_CPU ? 0 :dbCpuMemoryList[0].DB_CPU);
							optionDbCpuAndMemory.series[0].data[1].value = dbCpuMemoryList[0].DB_MEMORY;
							echarts.init(document.getElementById("db_cpu")).setOption(optionDbCpuAndMemory);
							}
						},
						error : function(data) {
							console.log("erro");
							util.closeTopLoading();
							util.closeLoading();
						}
					});
		}
	
		$(function() {
			/* 
			 *	首页初始加载
			 */
			 util.showTopLoading();
			 loadView();
			 // setInterval(loadView,15000);  
			
		});
		
		//弹出sql内容
		function sqlShow(type,td) {
			var id = $(td).find("span").text();
			showPopWin("${path}performance/performanceMonitorAction_sqlShow.ms?type="+type+"&id=" + id, 800, 400, null, "SQL内容");
		}

		//弹出 modal 框
		function toUrl(url, title) {
			showPopWin(url, 800, 400, null, title);
		}
		
		//跳转节点视图
		function toNodeView(obj) {
			top.window.open("${path}plf/page/timer/perforMonit/nodeDetail.jsp?tempNode="+ $(obj).text(),"_blank");
		}
		
		//点击查看详情
		function showDetail(obj,url,title,width,height) {
			width = width? width:800;
			height = height? height:400;
			var tempNode = obj.id.split("_")[1];
			showPopWin(url+"?tempNode="+tempNode, width, height, null, title);
		}
		
		function alertInfo(msg){
			isSubmit = false;
			util.alert(msg);
		}
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>