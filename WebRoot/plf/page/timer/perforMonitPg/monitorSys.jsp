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

.table1_1{
    height: 100%;
    border: 1px solid #192863;
    float: left;
    padding: 15px;
    box-sizing: border-box;
    background-color: #05194c;
}
</style>
</head>
<body>
	<div class="main_content">
		<div class="cpu">
		</div>
		<div class="table1">
			<div class="table1_1 container">
				<div class="tag">
					<ul >
						<li class="selected" style="margin-left:0;cursor: pointer;font-size: 12px;padding-left: 3px;" >top10<dict:lang value="单次调用耗时"/></li>
						<li style="cursor: pointer;font-size: 12px;">top10<dict:lang value="总调用最耗时" /></li>
						<li style="cursor: pointer;font-size: 12px;">top10<dict:lang value="单次最耗IO" /></li>
						<li style="cursor: pointer;font-size: 12px;">top10<dict:lang value="总调用最耗IO" /></li>
						<li style="cursor: pointer;font-size: 12px;">top10<dict:lang value="临时空间消耗" /></li>
						<li style="cursor: pointer;font-size: 12px;">top10<dict:lang value="共享内存消耗" /></li>
						<li style="cursor: pointer;font-size: 12px;">top10<dict:lang value="响应时间抖动" /></li>
					</ul>
				</div>
				<div class="content">
					<div class="content1" style="display:block;">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td><dict:lang value="用户名" /></td>
										<td><dict:lang value="数据库名" /></td>
										<td><dict:lang value="SQL语句" /></td>
										<td><dict:lang value="平均运行时间" /></td>
										<td><dict:lang value="运行次数" /></td>
										<td><dict:lang value="总运行时间" /></td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="time_one_sql">
								</tbody>
							</table>
						</div>
					</div>
					<div class="content2">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td><dict:lang value="用户名" /></td>
										<td><dict:lang value="数据库名" /></td>
										<td><dict:lang value="SQL语句" /></td>
										<td><dict:lang value="总运行时间" /></td>
										<td><dict:lang value="运行次数" /></td>
										<td><dict:lang value="平均运行时间" /></td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="time_all_sql">
								</tbody>
							</table>
						</div>
					</div>
					<div class="content3">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td><dict:lang value="用户名" /></td>
										<td><dict:lang value="数据库名" /></td>
										<td><dict:lang value="SQL语句" /></td>
										<td><dict:lang value="单次IO时间" /></td>
										<td><dict:lang value="单次运行时间" /></td>
										<td><dict:lang value="运行次数" /></td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="io_one_sql">
								</tbody>
							</table>
						</div>
					</div>
					<div class="content4">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td><dict:lang value="用户名" /></td>
										<td><dict:lang value="数据库名" /></td>
										<td><dict:lang value="SQL语句" /></td>
										<td><dict:lang value="总IO时间" /></td>
										<td><dict:lang value="总运行时间" /></td>
										<td><dict:lang value="运行次数" /></td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="io_all_sql">
								</tbody>
							</table>
						</div>
					</div>
					<div class="content5">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td><dict:lang value="用户名" /></td>
										<td><dict:lang value="数据库名" /></td>
										<td><dict:lang value="SQL语句" /></td>
										<td><dict:lang value="临时空间使用量(块)" /></td>
										<td><dict:lang value="请求次数" /></td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="temp_blks_sql">
								</tbody>
							</table>
						</div>
					</div>
					<div class="content6">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td><dict:lang value="用户名" /></td>
										<td><dict:lang value="数据库名" /></td>
										<td><dict:lang value="SQL语句" /></td>
										<td><dict:lang value="内存使用量(块)" /></td>
										<td><dict:lang value="请求次数" /></td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="memo_blks_sql">
								</tbody>
							</table>
						</div>
					</div>
					<div class="content7">
						<div class="tableHead">
							<table>
								<thead>
									<tr>
										<td><dict:lang value="用户名" /></td>
										<td><dict:lang value="数据库名" /></td>
										<td><dict:lang value="SQL语句" /></td>
										<td><dict:lang value="标准偏差" /></td>
										<td><dict:lang value="最小运行时间" /></td>
										<td><dict:lang value="最大运行时间" /></td>
										<td><dict:lang value="请求次数" /></td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="stddev_time_sql">
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
						<li class="selected" style="margin-left:0;cursor: pointer;"><dict:lang value="会话数" /></li>
						<li style="cursor: pointer;"><dict:lang value="数据库大小" /></li>
						<li style="cursor: pointer;"><dict:lang value="表大小" /></li>
						<li style="cursor: pointer;"><dict:lang value="索引大小" /></li>
						<li style="cursor: pointer;"><dict:lang value="阻塞会话" /></li>
						<li style="cursor: pointer;"><dict:lang value="参数配置" /></li>
					</ul>
				</div>
				<div class="content">
					<div class="content1" style="display:block;">
						<div class="tableHead">
							<table>
								<tr>
									<td style='width:600px;'><dict:lang value="状态" /></td>
									<td><dict:lang value="数量" /></td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="stat_activity_show"></tbody>
							</table>
						</div>
					</div>
					<div class="content2">
						<div class="tableHead">
							<table>
								<tr>
									<td style='width:600px;'><dict:lang value="名称" /></td>
									<td><dict:lang value="大小" /></td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="database_size_show"></tbody>
							</table>
						</div>
					</div>
					<div class="content3">
						<div class="tableHead">
							<table>
								<tr>
									<td style='width:600px;'><dict:lang value="名称" /></td>
									<td><dict:lang value="大小" /></td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="tablespace_size_show"></tbody>
							</table>
						</div>
					</div>
					<div class="content4">
						<div class="tableHead">
							<table>
								<tr>
									<td><dict:lang value="表名" /></td>
									<td><dict:lang value="表大小" /></td>
									<td><dict:lang value="索引大小" /></td>
									<td><dict:lang value="总大小" /></td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="schema_tables_show"></tbody>
							</table>
						</div>
					</div>
					<div class="content5">
						<div class="tableHead">
							<table>
								<tr>
									<td><dict:lang value="库名" /></td>
									<td><dict:lang value="用户名" /></td>
									<td><dict:lang value="阻塞者ID" /></td>
									<td><dict:lang value="阻塞者程序" /></td>
									<td><dict:lang value="阻塞者当前SQL" /></td>
									<td><dict:lang value="阻塞者会话状态" /></td>
									<td><dict:lang value="被阻塞者ID" /></td>
									<td><dict:lang value="被阻塞者程序" /></td>
									<td><dict:lang value="被阻塞者当前SQL" /></td>
									<td><dict:lang value="被阻塞开始时间" /></td>
									<td><dict:lang value="被阻塞者会话状态" /></td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="now_locks_show"></tbody>
							</table>
						</div>
					</div>
					<div class="content6">
						<div class="tableHead">
							<table>
								<tr>
									<td><dict:lang value="参数名" /></td>
									<td><dict:lang value="参数值" /></td>
									<td><dict:lang value="单位" /></td>
									<td><dict:lang value="类别" /></td>
									<td><dict:lang value="描述" /></td>
									<td><dict:lang value="最小值" /></td>
									<td><dict:lang value="最大值" /></td>
								</tr>
							</table>
						</div>
						<div class="tableBody">
							<table>
								<tbody id="all_settings_show"></tbody>
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
							onclick="toUrl('${path}plf/page/timer/perforMonit/url/tablesapceUse.jsp','<dict:lang value="表空间使用量监控" />')"><dict:lang value="表空间使用量监控" /></a>
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
							
							// 单次调用耗时SQL TOP 10
							if (data && data.ajaxMap
									&& data.ajaxMap.top10TimeOneList) {
								var timeOneSQLHtmlArr = [];
								var timeOneSQLList = data.ajaxMap.top10TimeOneList;
								for ( var i = 0; i < timeOneSQLList.length; i++) {
									timeOneSQLHtmlArr.push("<tr>");
									timeOneSQLHtmlArr.push("<td>"+ timeOneSQLList[i].USERNAME.value+ "</td>");
									timeOneSQLHtmlArr.push("<td>"+ timeOneSQLList[i].DATNAME + "</td>");
									timeOneSQLHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
											+ "<span style='display:none;'>"+timeOneSQLList[i].QUERYID+"</span>"
											+ timeOneSQLList[i].QUERY
											+ "</td>");
									timeOneSQLHtmlArr.push("<td>"+ timeOneSQLList[i].MEAN_TIME+ "</td>");
									timeOneSQLHtmlArr.push("<td>"+ timeOneSQLList[i].CALLS+ "</td>");
									timeOneSQLHtmlArr.push("<td>"+ timeOneSQLList[i].TOTAL_TIME+ "</td>");
									timeOneSQLHtmlArr.push("</tr>");
								}

								$("#time_one_sql").html(timeOneSQLHtmlArr.join());
							}
							
							// 总调用最耗时SQL TOP 10
							if (data && data.ajaxMap
									&& data.ajaxMap.top10TimeAllList) {
								var timeAllSQLHtmlArr = [];
								var timeAllSQLList = data.ajaxMap.top10TimeAllList;
								for ( var i = 0; i < timeAllSQLList.length; i++) {
									timeAllSQLHtmlArr.push("<tr>");
									timeAllSQLHtmlArr.push("<td>"+ timeAllSQLList[i].USERNAME.value+ "</td>");
									timeAllSQLHtmlArr.push("<td>"+ timeAllSQLList[i].DATNAME + "</td>");
									timeAllSQLHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
											+ "<span style='display:none;'>"+timeAllSQLList[i].QUERYID+"</span>"
											+ timeAllSQLList[i].QUERY
											+ "</td>");
									timeAllSQLHtmlArr.push("<td>"+ timeAllSQLList[i].TOTAL_TIME+ "</td>");
									timeAllSQLHtmlArr.push("<td>"+ timeAllSQLList[i].CALLS+ "</td>");
									timeAllSQLHtmlArr.push("<td>"+ timeAllSQLList[i].MEAN_TIME+ "</td>");
									timeAllSQLHtmlArr.push("</tr>");
								}

								$("#time_all_sql").html(timeAllSQLHtmlArr.join());
							}
							
							// 单次调用最耗IO SQL TOP 10
							if (data && data.ajaxMap
									&& data.ajaxMap.top10IoOneList) {
								var ioOneSQLHtmlArr = [];
								var ioOneSQLList = data.ajaxMap.top10IoOneList;
								for ( var i = 0; i < ioOneSQLList.length; i++) {
									ioOneSQLHtmlArr.push("<tr>");
									ioOneSQLHtmlArr.push("<td>"+ ioOneSQLList[i].USERNAME.value+ "</td>");
									ioOneSQLHtmlArr.push("<td>"+ ioOneSQLList[i].DATNAME + "</td>");
									ioOneSQLHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
											+ "<span style='display:none;'>"+ioOneSQLList[i].QUERYID+"</span>"
											+ ioOneSQLList[i].QUERY
											+ "</td>");
									ioOneSQLHtmlArr.push("<td>"+ ioOneSQLList[i].IOTIME_PER_CALL+ "</td>");
									ioOneSQLHtmlArr.push("<td>"+ ioOneSQLList[i].TOTAL_ELAPSED_TIME+ "</td>");
									ioOneSQLHtmlArr.push("<td>"+ ioOneSQLList[i].CALLS+ "</td>");
									ioOneSQLHtmlArr.push("</tr>");
								}

								$("#io_one_sql").html(ioOneSQLHtmlArr.join());
							}
							
							// 总调用最耗IO SQL TOP 10
							if (data && data.ajaxMap
									&& data.ajaxMap.top10IoAllList) {
								var ioAllSQLHtmlArr = [];
								var ioAllSQLList = data.ajaxMap.top10IoAllList;
								for ( var i = 0; i < ioAllSQLList.length; i++) {
									ioAllSQLHtmlArr.push("<tr>");
									ioAllSQLHtmlArr.push("<td>"+ ioAllSQLList[i].USERNAME.value+ "</td>");
									ioAllSQLHtmlArr.push("<td>"+ ioAllSQLList[i].DATNAME + "</td>");
									ioAllSQLHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
											+ "<span style='display:none;'>"+ioAllSQLList[i].QUERYID+"</span>"
											+ ioAllSQLList[i].QUERY
											+ "</td>");
									ioAllSQLHtmlArr.push("<td>"+ ioAllSQLList[i].TOTAL_IOTIME+ "</td>");
									ioAllSQLHtmlArr.push("<td>"+ ioAllSQLList[i].TOTAL_ELAPSED_TIME+ "</td>");
									ioAllSQLHtmlArr.push("<td>"+ ioAllSQLList[i].CALLS+ "</td>");
									ioAllSQLHtmlArr.push("</tr>");
								}

								$("#io_all_sql").html(ioAllSQLHtmlArr.join());
							}
							
							// 列表显示临时空间消耗最严重 前10大SQL（显示10行）
							if (data && data.ajaxMap
									&& data.ajaxMap.top10TempBlksList) {
								var tempBlksSQLHtmlArr = [];
								var tempBlksSQLList = data.ajaxMap.top10TempBlksList;
								for ( var i = 0; i < tempBlksSQLList.length; i++) {
									tempBlksSQLHtmlArr.push("<tr>");
									tempBlksSQLHtmlArr.push("<td>"+ tempBlksSQLList[i].USERNAME.value+ "</td>");
									tempBlksSQLHtmlArr.push("<td>"+ tempBlksSQLList[i].DATNAME + "</td>");
									tempBlksSQLHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
											+ "<span style='display:none;'>"+tempBlksSQLList[i].QUERYID+"</span>"
											+ tempBlksSQLList[i].QUERY
											+ "</td>");
									tempBlksSQLHtmlArr.push("<td>"+ tempBlksSQLList[i].TEMP_BLKS_WRITTEN+ "</td>");
									tempBlksSQLHtmlArr.push("<td>"+ tempBlksSQLList[i].CALLS+ "</td>");
									tempBlksSQLHtmlArr.push("</tr>");
								}

								$("#temp_blks_sql").html(tempBlksSQLHtmlArr.join());
							}
							
							// 列表显示共享内存消耗最严重 前10大SQL（显示10行）
							if (data && data.ajaxMap
									&& data.ajaxMap.top10MemoBlksList) {
								var memoBlksSQLHtmlArr = [];
								var memoBlksSQLList = data.ajaxMap.top10MemoBlksList;
								for ( var i = 0; i < memoBlksSQLList.length; i++) {
									memoBlksSQLHtmlArr.push("<tr>");
									memoBlksSQLHtmlArr.push("<td>"+ memoBlksSQLList[i].USERNAME.value+ "</td>");
									memoBlksSQLHtmlArr.push("<td>"+ memoBlksSQLList[i].DATNAME + "</td>");
									memoBlksSQLHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
											+ "<span style='display:none;'>"+memoBlksSQLList[i].QUERYID+"</span>"
											+ memoBlksSQLList[i].QUERY
											+ "</td>");
									memoBlksSQLHtmlArr.push("<td>"+ memoBlksSQLList[i].SHARE_MEMO_BLKS+ "</td>");
									memoBlksSQLHtmlArr.push("<td>"+ memoBlksSQLList[i].CALLS+ "</td>");
									memoBlksSQLHtmlArr.push("</tr>");
								}

								$("#memo_blks_sql").html(memoBlksSQLHtmlArr.join());
							}
							
							// 列表显示响应时间抖动最严重 前10大SQL（显示10行）
							if (data && data.ajaxMap
									&& data.ajaxMap.top10StddevTimeList) {
								var stddevTimeSQLHtmlArr = [];
								var stddevTimeSQLList = data.ajaxMap.top10StddevTimeList;
								for ( var i = 0; i < stddevTimeSQLList.length; i++) {
									stddevTimeSQLHtmlArr.push("<tr>");
									stddevTimeSQLHtmlArr.push("<td>"+ stddevTimeSQLList[i].USERNAME.value+ "</td>");
									stddevTimeSQLHtmlArr.push("<td>"+ stddevTimeSQLList[i].DATNAME + "</td>");
									stddevTimeSQLHtmlArr.push("<td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;cursor: pointer;' onclick='sqlShow(1,this)'>"
											+ "<span style='display:none;'>"+stddevTimeSQLList[i].QUERYID+"</span>"
											+ stddevTimeSQLList[i].QUERY
											+ "</td>");
									stddevTimeSQLHtmlArr.push("<td>"+ stddevTimeSQLList[i].STDDEV_TIME+ "</td>");
									stddevTimeSQLHtmlArr.push("<td>"+ stddevTimeSQLList[i].MIN_TIME+ "</td>");
									stddevTimeSQLHtmlArr.push("<td>"+ stddevTimeSQLList[i].MAX_TIME+ "</td>");
									stddevTimeSQLHtmlArr.push("<td>"+ stddevTimeSQLList[i].CALLS+ "</td>");
									stddevTimeSQLHtmlArr.push("</tr>");
								}

								$("#stddev_time_sql").html(stddevTimeSQLHtmlArr.join());
							}
							
							// 查看会话数
							if (data && data.ajaxMap
									&& data.ajaxMap.statActivityList) {
								var statActivitySQLHtmlArr = [];
								var statActivitySQLList = data.ajaxMap.statActivityList;
								for ( var i = 0; i < statActivitySQLList.length; i++) {
									statActivitySQLHtmlArr.push("<tr>");
									statActivitySQLHtmlArr.push("<td>"+ statActivitySQLList[i].STATE+ "</td>");
									statActivitySQLHtmlArr.push("<td>"+ statActivitySQLList[i].NUM + "</td>");
									statActivitySQLHtmlArr.push("</tr>");
								}

								$("#stat_activity_show").html(statActivitySQLHtmlArr.join());
							}
							
							// 查看数据库大小
							if (data && data.ajaxMap
									&& data.ajaxMap.dataBaseSizeList) {
								var dataBaseSizeSQLHtmlArr = [];
								var dataBaseSizeSQLList = data.ajaxMap.dataBaseSizeList;
								for ( var i = 0; i < dataBaseSizeSQLList.length; i++) {
									dataBaseSizeSQLHtmlArr.push("<tr>");
									dataBaseSizeSQLHtmlArr.push("<td>"+ dataBaseSizeSQLList[i].DATNAME+ "</td>");
									dataBaseSizeSQLHtmlArr.push("<td>"+ dataBaseSizeSQLList[i].SIZE + "</td>");
									dataBaseSizeSQLHtmlArr.push("</tr>");
								}

								$("#database_size_show").html(dataBaseSizeSQLHtmlArr.join());
							}
							
							// 查看表空间的大小
							if (data && data.ajaxMap
									&& data.ajaxMap.tablespaceList) {
								var tablespaceSQLHtmlArr = [];
								var tablespaceSQLList = data.ajaxMap.tablespaceList;
								for ( var i = 0; i < tablespaceSQLList.length; i++) {
									tablespaceSQLHtmlArr.push("<tr>");
									tablespaceSQLHtmlArr.push("<td>"+ tablespaceSQLList[i].SPCNAME+ "</td>");
									tablespaceSQLHtmlArr.push("<td>"+ tablespaceSQLList[i].SIZE + "</td>");
									tablespaceSQLHtmlArr.push("</tr>");
								}

								$("#tablespace_size_show").html(tablespaceSQLHtmlArr.join());
							}
							
							// 查看表和索引的大小
							if (data && data.ajaxMap
									&& data.ajaxMap.tableSizeList) {
								var tableSizeSQLHtmlArr = [];
								var tableSizeSQLList = data.ajaxMap.tableSizeList;
								for ( var i = 0; i < tableSizeSQLList.length; i++) {
									tableSizeSQLHtmlArr.push("<tr>");
									tableSizeSQLHtmlArr.push("<td>"+ tableSizeSQLList[i].TABLE_NAME + "</td>");
									tableSizeSQLHtmlArr.push("<td>"+ tableSizeSQLList[i].TABLE_SIZE+ "</td>");
									tableSizeSQLHtmlArr.push("<td>"+ tableSizeSQLList[i].INDEXES_SIZE+ "</td>");
									tableSizeSQLHtmlArr.push("<td>"+ tableSizeSQLList[i].TOTAL_SIZE + "</td>");
									tableSizeSQLHtmlArr.push("</tr>");
								}
								$("#schema_tables_show").html(tableSizeSQLHtmlArr.join());
							}
							
							// 查看当前阻塞会话的SQL
							if (data && data.ajaxMap
									&& data.ajaxMap.locksList) {
								var locksSQLHtmlArr = [];
								var locksSQLList = data.ajaxMap.locksList;
								for ( var i = 0; i < locksSQLList.length; i++) {
									locksSQLHtmlArr.push("<tr>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].DATNAME + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].USERNAME + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].BLOCKING_PID + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].BLOCKING_APP + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].BLOCKING_SESS_CURRENT_SQL + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].BLOCKING_STATE + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].WAITING_PID + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].WAITING_APP + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].WAITING_SQL + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].QUERY_START + "</td>");
									locksSQLHtmlArr.push("<td>"+ locksSQLList[i].STATE + "</td>");
									locksSQLHtmlArr.push("</tr>");
								}

								$("#now_locks_show").html(locksSQLHtmlArr.join());
							}
							
							// 参数配置显示
							if (data && data.ajaxMap
									&& data.ajaxMap.pgSettingsList) {
								var pgSettingsShowHtmlArr = [];
								var pgSettingsShowList = data.ajaxMap.pgSettingsList;
								for ( var i = 0; i < pgSettingsShowList.length; i++) {
									pgSettingsShowHtmlArr.push("<tr>");
									pgSettingsShowHtmlArr.push("<td>"+ pgSettingsShowList[i].NAME+ "</td>");
									pgSettingsShowHtmlArr.push("<td>"+ pgSettingsShowList[i].SETTING + "</td>");
									pgSettingsShowHtmlArr.push("<td>"+ pgSettingsShowList[i].UNIT + "</td>");
									pgSettingsShowHtmlArr.push("<td>"+ pgSettingsShowList[i].CATEGORY + "</td>");
									pgSettingsShowHtmlArr.push("<td>"+ pgSettingsShowList[i].SHORT_DESC + "</td>");
									pgSettingsShowHtmlArr.push("<td>"+ pgSettingsShowList[i].MIN_VAL + "</td>");
									pgSettingsShowHtmlArr.push("<td>"+ pgSettingsShowList[i].MAX_VAL + "</td>");
									pgSettingsShowHtmlArr.push("</tr>");
								}

								$("#all_settings_show").html(pgSettingsShowHtmlArr.join());
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