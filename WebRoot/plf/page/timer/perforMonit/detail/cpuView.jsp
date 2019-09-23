<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="CPU图表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="datePicker" value="1" />
</jsp:include>
<script src="${path}plf/page/timer/perforMonit/js/echarts.min.js?_mc_res_version=<%=PlfStaticRes.ECHARTS_MIN_JS %>"></script>
<style type="text/css">
.WdateNomorl {
	border-color: #ccc;
	font-size: 12px;
	width: 180px;
	box-sizing: border-box;
	border: 1px solid #dbdbdb;
	height: 20px;
	line-height: 25px;
	padding-left: 5px;
}
html,body,.box_height{
	height:99%;
}

.body_data td {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>
	<div class="all box_height">
		<div class="box_height">
			<form
				action="${path }performance/performanceMonitorAction_cpuView.ms"
				method="post" id="searchForm">
				<table class="search_table">
					<tr>
						<td width="100%" style="text-align: center;">
							<input type="hidden" name="tempNode" value="<c:out value='${tempNode}'/>">
							<dict:lang value="时间范围" /><input id="begin_time"
							name="beginTime"
							value='<fmt:formatDate value="${beginTime }" pattern="yyyy-MM-dd HH:mm:ss"/>'
							class="input WdateNomorl"
							onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d %H:%m:%s'})"
							readonly="readOnly"> ~<input id="end_time" name="endTime"
							value='<fmt:formatDate value="${endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>'
							class="input WdateNomorl"
							onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d %H:%m:%s'})"
							readonly="readOnly">
						<div style="display: inline-block;width: 40px;"></div>
								<dict:lang value="视图模式"/> <select name="viewMode"><option value="3" <c:if test="${viewMode eq '3' }">selected</c:if>><dict:lang value="天"/></option>
									<option  value="2" <c:if test="${viewMode eq '2' }">selected</c:if>><dict:lang value="小时"/></option>
									<option value="1" <c:if test="${viewMode eq '1' }">selected</c:if>><dict:lang value="分钟"/></option>
								</select> <input type="button" id="searchButtonId"
									value="<dict:lang value="查询" />" onclick="query(this)"
									class="botton_img_add" />
						</td>
					</tr>
				</table>
			</form>

			<table id="listTable" class="table_list" style="height:95%">
				<tr>
					<td style="height:95%;" id="show">
						
					</td>
				</tr>
			</table>
		</div>
		

		<%-- <div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
		</div> --%>
	</div>

	<script type="text/javascript">
		function query() {
			document.forms.searchForm.submit();
		}
		
		
	</script>
	<script type="text/javascript">
		var _sysMaxColor = "#9370db";
		var _sysAvgColor = "#ee7942"; //黄
		var _jvmMaxColor = "#008b8b"; //绿
		var _jvmAvgColor = "#00f5ff"; //蓝
		
		var _sysMaxTitle = "<dict:lang value="系统消耗CPU的最大值" />";
		var _sysAvgTitle = "<dict:lang value="系统消耗CPU的平均值" />";
		var _jvmMaxTitle = "<dict:lang value="JVM消耗CPU的最大值" />";
		var _jvmAvgTitle = "<dict:lang value="JVM消耗CPU的平均值" />";
		
		var _recodeTime = [];
		var _sysMax = [];
		var _sysAvg = [];
		var _jvmMax = [];
		var _jvmAvg = [];
		
		<c:forEach items="${dataMap.recodeTime}" var="recodeTime">
			_recodeTime.push("<c:out value='${recodeTime}'/>");
		</c:forEach>
		<c:forEach items="${dataMap.sysMax}" var="sysMax">
			_sysMax.push("<c:out value='${sysMax}'/>");
		</c:forEach>
		<c:forEach items="${dataMap.sysAvg}" var="sysAvg">
			_sysAvg.push("<c:out value='${sysAvg}'/>");
		</c:forEach>
		<c:forEach items="${dataMap.jvmMax}" var="jvmMax">
			_jvmMax.push("<c:out value='${jvmMax}'/>");
		</c:forEach>
		<c:forEach items="${dataMap.jvmAvg}" var="jvmAvg">
			_jvmAvg.push("<c:out value='${jvmAvg}'/>");
		</c:forEach>
		
		var _interVal = parseInt(_recodeTime.length/5);
		
		var optionCpu = {
			title:{
				text: "<dict:lang value="节点" />[ ${tempNode} ]<dict:lang value="CPU监控图表" />",
				left:"center"
			},
			color : [ _sysMaxColor, _sysAvgColor,_jvmMaxColor,_jvmAvgColor ], //绿色 蓝色
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				},
				/* formatter : "</br>{b}</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#7FFFD4;'></span>{a0}：{c0}%</br><span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#00F5FF;'></span>{a1}：{c1}%</br>" */
			},
			legend : {
				x:"right",
				data : [ _sysMaxTitle,  _sysAvgTitle,_jvmMaxTitle,_jvmAvgTitle ],
				inactiveColor:"#999",
				left : "right",
				orient:"vertical",
				width:200,
				/* borderWidth:2,
				borderColor:'blue', */
				/* textStyle : {
					color : "#D1EEEE" //上方线块 颜色
				}, */
			},
			grid : {
				left : "10%",
				right : "200",
				top : "10%",
				bottom : "10%",
				containLabel : true,

			},

			xAxis : [ {
				type : "category",
				boundaryGap : false,
				name : "<c:if test="${viewMode == '1'}">min</c:if><c:if test="${viewMode == '2'}">hour</c:if><c:if test="${viewMode == '3'}"><dict:lang value="日期" /></c:if>" ,
				data : _recodeTime,
				axisLabel : {
					interval : _interVal, //x坐标间隔
					formatter : function(value, index) {
						var flag = "<c:if test="${viewMode == '1'}">1</c:if><c:if test="${viewMode == '2'}">2</c:if><c:if test="${viewMode == '3'}">3</c:if>";
						if("1"==flag || "2"==flag) {
							return index + "";
						}else {
							return value.substr(0,10);
						}
						
					}
				}
			} ],
			yAxis : [ {
				type : "value",
				splitNumber : 5, //y轴分割
				min : 0, // 最小值y
				max : 100,// 最大值y
				axisLabel : {
					formatter : "{value}%"
				}

			} ],
			series : [ {
				name : _sysMaxTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _sysMaxColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _sysMaxColor
						}
					}
				},
				data : _sysMax
			}, {
				name : _sysAvgTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _sysAvgColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _sysAvgColor
						}
					}
				},
				data : _sysAvg
			},{
				name : _jvmMaxTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _jvmMaxColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _jvmMaxColor
						}
					}
				},
				data : _jvmMax
			},{
				name : _jvmAvgTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _jvmAvgColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _jvmAvgColor
						}
					}
				},
				data : _jvmAvg
			} ]
		};
		
		echarts.init(document.getElementById("show")).setOption(optionCpu);
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>