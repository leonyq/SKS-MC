 <%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="GC时间图表" />
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
				action="${path }performance/performanceMonitorAction_gcView.ms"
				method="post" id="searchForm">
				<table class="search_table">
					<tr>
						<td width="100%" style="text-align: center;">
							<input type="hidden" name="tempNode" value="<c:out value='${tempNode}' />">
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
						 <input type="button" id="searchButtonId"
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
		var _gcColor = "#9370db";
	
		
		var _gcTitle = "<dict:lang value="GC时间" />";
	
		
		var _recodeTime = [];
		var _duringTime = [];
	
		<c:forEach items="${dataMap.recodeTime}" var="recodeTime">
			_recodeTime.push("<c:out value='${recodeTime}' />");
		</c:forEach>
		<c:forEach items="${dataMap.duringTimeList}" var="duringTime">
			_duringTime.push("<c:out value='${duringTime}' />");
		</c:forEach>

		var _interVal = parseInt(_recodeTime.length/5);
		
		var optionSession = {
			title:{
				text: "<dict:lang value="节点" />[ '<c:out value="${tempNode}" />' ]<dict:lang value="GC时间" />",
				left:"center"
			},
			color : [ _gcColor ], //绿色 蓝色
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
				data : [ _gcTitle],
				inactiveColor:"#999",
				left : "right",
				orient:"vertical",
				width:200,
			},
			grid : {
				left : "10%",
				right : "200",
				top : "20%",
				bottom : "10%",
				containLabel : true,

			},

			xAxis : [ {
				type : "category",
				boundaryGap : false,
				name : "<dict:lang value="日期" />" ,
				data : _recodeTime,
				axisLabel : {
					interval : _interVal, //x坐标间隔
					formatter : function(value, index) {
						return value.split(" ").join("\n");;
						
					}
				}
			} ],
			yAxis : [ {
				type : "value",
				name:"ms",
				splitNumber : 5, //y轴分割

			} ],
			series : [ {
				name : _gcTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _gcColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _gcColor
						}
					}
				},
				data : _duringTime
			}]
		};
		
		echarts.init(document.getElementById("show")).setOption(optionSession);
	</script>
</body><%@ include file="/plf/common/pub_end.jsp"%>