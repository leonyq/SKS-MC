<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>

<head>
<title><dict:lang value="硬盘图表" />
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

.body_data  td {
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
				action="${path }performance/performanceMonitorAction_diskView.ms"
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
								<dict:lang value="视图模式" /><select name="viewMode"><option value="3" <c:if test="${viewMode eq '3' }">selected</c:if>><dict:lang value="天" /></option>
									<option  value="2" <c:if test="${viewMode eq '2' }">selected</c:if>><dict:lang value="小时" /></option>
									<option value="1" <c:if test="${viewMode eq '1' }">selected</c:if>><dict:lang value="分钟" /></option>
								</select> <input type="button" id="searchButtonId"
									value="<dict:lang value="查询" />" onclick="query(this)"
									class="botton_img_add" />
						</td>
					</tr>
				</table>
			</form>

			<table id="listTable" class="table_list" style="height:95%;width: 150%">
				<tr id="show">
					<c:forEach items="${dataMap.driveList}" var="drive" varStatus="status">
						<td class="drive_box" style="height:95%;" id="show_<c:out value='${status.count}'/>" >
						&nbsp;
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
		

	</div>

	<script type="text/javascript">
		function query() {
			document.forms.searchForm.submit();
		}
	</script>
	<script type="text/javascript">
	
		var _diskMaxColor = "#9370db"; //紫
		var _diskAvgColor = "#ee7942"; //黄

		
		var _diskMaxTitle = "<dict:lang value="消耗硬盘最大值" />";
		var _diskAvgTitle = "<dict:lang value="消耗硬盘平均值" />";

		
		var _recodeTime = [];
		var _diskMax = null;
		var _diskAvg = null;
		var _title = "";
		var _driveSize = 0;
		var _diskTotal = [];
		
		var _interVal = parseInt(_recodeTime.length/20);
		var option = {
			title:{
				text: "节点[ <c:out value='${tempNode}'/> ]硬盘监控",
				left:"left"
			},
			color : [ _diskMaxColor, _diskAvgColor], //绿色 蓝色
			tooltip : {
				trigger : "axis",
				axisPointer : {
					type : "cross",
					label : {
						backgroundColor : "#6a7985"
					}
				},
			},
			legend : {
				data : [ _diskMaxTitle,  _diskAvgTitle],
				inactiveColor:"#999",
				left : "right",
				orient:"vertical",
			},
			grid : {
				left : "5%",
				right : "10%",
				top : "20%",
				bottom : "5%",
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
				name:"/kb",
				splitNumber : 5, //y轴分割

			} ],
			series : [ {
				name : _diskMaxTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _diskMaxColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _diskMaxColor
						}
					}
				},
				data : []
			}, {
				name : _diskAvgTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _diskAvgColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _diskAvgColor
						}
					}
				},
				data : []
			}]
		};
		
		<c:forEach items="${dataMap.diskViewMap}" var="diskViewEntery" varStatus="status"> 
			_driveSize++;
		</c:forEach>
		

		$(function() {
			$(".drive_box").css({width: 100/_driveSize +"%"});
			
			<c:forEach items="${dataMap.recodeTimeList}" var="recodeTime">
				_recodeTime.push("<c:out value='${recodeTime}'/>");
			</c:forEach>
			
			<c:forEach items="${dataMap.diskTotalList}" var="diskTotal">
				_diskTotal.push("<c:out value='${diskTotal.disk}'/>");
			</c:forEach>
			
			
			var index = 0;
			<c:forEach items="${dataMap.diskViewMap}" var="diskViewEntery" varStatus="status"> 
				_title = "<c:out value='${diskViewEntery.key}'/><dict:lang value="使用情况" />";
				_driveSize++;
				<c:forEach items="${diskViewEntery.value}" var="diskViewEnteryValueEntry">
					<c:if test="${diskViewEnteryValueEntry.key == 'max'}">
						_diskMax = [];
						<c:forEach items="${diskViewEnteryValueEntry.value}" var="maxVal">
							_diskMax.push("<c:out value='${maxVal}'/>");
						</c:forEach>
					</c:if>
					<c:if test="${diskViewEnteryValueEntry.key == 'avg'}">
						_diskAvg = [];
						<c:forEach items="${diskViewEnteryValueEntry.value}" var="avgVal">
							_diskAvg.push("<c:out value='${avgVal}'/>");
						</c:forEach>
					</c:if>
				</c:forEach>
				var optionCopy = $.extend(true,{},option); 
				optionCopy.title.text = _title;
				optionCopy.xAxis[0].axisLabel.interval = parseInt(_recodeTime.length/5);
				optionCopy.xAxis[0].data = _recodeTime;
				optionCopy.series[0].data = _diskMax;
				optionCopy.series[1].data = _diskAvg; 
				optionCopy.yAxis[0].max = _diskTotal[index];
				echarts.init(document.getElementById("show_<c:out value='${status.count}'/>")).setOption(optionCopy);
				index++;
			</c:forEach>
			
		});
		
		
		
		
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>