<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="线程图表" />
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
				action="${path }performance/performanceMonitorAction_threadView.ms"
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
		var _threadMaxColor = "#9370db";
		var _threadAvgColor = "#ee7942"; //黄
	
		
		var _threadMaxTitle = "<dict:lang value="线程数最大值" />";
		var _threadAvgTitle = "<dict:lang value="线程数平均值" />";
	
		
		var _recodeTime = [];
		var _threadMax = [];
		var _threadAvg = [];
	
		<c:forEach items="${dataMap.recodeTime}" var="recodeTime">
			_recodeTime.push("<c:out value='${recodeTime}' />");
		</c:forEach>
		<c:forEach items="${dataMap.threadMaxList}" var="threadMax">
			_threadMax.push("<c:out value='${threadMax}' />");
		</c:forEach>
		<c:forEach items="${dataMap.threadAvgList}" var="threadAvg">
			_threadAvg.push("<c:out value='${threadAvg}' />");
		</c:forEach>
		
		var _interVal = parseInt(_recodeTime.length/5);
		
		var optionSession = {
			title:{
				text: "<dict:lang value="节点" />[ <c:out value='${tempNode}' /> ]<dict:lang value="线程数监控" />",
				left:"center"
			},
			color : [ _threadMaxColor, _threadAvgColor ], //绿色 蓝色
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
				x:"right",
				data : [ _threadMaxTitle,  _threadAvgTitle],
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
				name : "<c:if test="${viewMode == '1'}">min</c:if><c:if test="${viewMode == '2'}">hour</c:if><c:if test="${viewMode == '3'}"><dict:lang value="日期"/></c:if>" ,
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
				name:"<dict:lang value="个"/>",
				splitNumber : 5, //y轴分割

			} ],
			series : [ {
				name : _threadMaxTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _threadMaxColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _threadMaxColor
						}
					}
				},
				data : _threadMax
			}, {
				name : _threadAvgTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _threadAvgColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _threadAvgColor
						}
					}
				},
				data : _threadAvg
			}]
		};
		
		echarts.init(document.getElementById("show")).setOption(optionSession);
	</script>
</body><%@ include file="/plf/common/pub_end.jsp"%>