<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="session图表" />
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
				action="${path }performance/performanceMonitorAction_dbTime.ms"
				method="post" id="searchForm" target="submitFrame">
				<table class="search_table">
					<tr>
						<td width="100%" style="text-align: center;">
							<dict:lang value="时间范围" /><input id="begin_time"
							name="beginTime"
							value='<fmt:formatDate value="${beginTime }" pattern="yyyy-MM-dd"/>'
							class="input WdateNomorl"
							onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})"
							readonly="readOnly"> ~<input id="end_time" name="endTime"
							value='<fmt:formatDate value="${endTime }" pattern="yyyy-MM-dd"/>'
							class="input WdateNomorl"
							onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})"
							readonly="readOnly">
						<div style="display: inline-block;width: 40px;"></div>
								<dict:lang value="视图模式" /> <select name="viewMode">
									<option  value="1" <c:if test="${viewMode eq '1' }">selected</c:if>><dict:lang value="天" /></option>
									<option value="2" <c:if test="${viewMode eq '2' }">selected</c:if>><dict:lang value="月" /></option>
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
		
		<div style="display: none;">
			<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
		</div>

		<%-- <div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
		</div> --%>
	</div>

	<script type="text/javascript">
		function query() {
			document.forms.searchForm.submit();
		}
		
		function alertInfo(msg){
			isSubmit = false;
			util.alert(msg);
		}
	</script>
	<script type="text/javascript">
		var _dbTimeColor = "#9370db";
	
		
		var _dbTimeTitle = "DB Time";
		var _recodeTime = [];
		var _dbTime = [];
	
		<c:forEach items="${dataMap.recodetimeList}" var="recodeTime">
			_recodeTime.push("<c:out value = '${recodeTime}'/>");
		</c:forEach>
		<c:forEach items="${dataMap.dbTimeList}" var="dbTime">
			_dbTime.push("<c:out value = '${dbTime}'/>");
		</c:forEach>
		
		var _interVal = parseInt(_recodeTime.length/5);
		
		var optionSession = {
			title:{
				text: "<dict:lang value="DB Time负载" />",
				left:"center"
			},
			color : [ _dbTimeColor], //绿色 蓝色
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
				data : [ _dbTimeTitle],
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
				top : "20%",
				bottom : "10%",
				containLabel : true,

			},

			xAxis : [ {
				type : "category",
				boundaryGap : false,
				name : "<c:if test="${viewMode == '1'}"><dict:lang value="天"/></c:if><c:if test="${viewMode == '2'}"><dict:lang value="月"/></c:if>" ,
				data : _recodeTime,
				/* axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				}, */
				axisLabel : {
					interval : _interVal, //x坐标间隔
					
				}
			} ],
			yAxis : [ {
				type : "value",
				/* axisLine : {
					lineStyle : {
						color : "#D1EEEE"
					}
				}, */
				splitNumber : 5, //y轴分割
				/* splitLine : {
					show : false
				}, */
				/* min : 0, // 最小值y
				max : _sysTotal,// 最大值y */
				/* axisLabel : {
					formatter : "{value}%"
				} */

			} ],
			series : [ {
				name : _dbTimeTitle,
				type : "line",
				label : {
					normal : {
						show : false, //不显示
						position : "top"
					}
				},
				areaStyle : {
					normal : {
						color : _dbTimeColor,
						opacity : 0.3
					//区域透明度
					}
				},
				itemStyle : {
					normal : {
						lineStyle : {
							color : _dbTimeColor
						}
					}
				},
				data : _dbTime
			}]
		};
		
		echarts.init(document.getElementById("show")).setOption(optionSession);
	</script>
</body><%@ include file="/plf/common/pub_end.jsp"%>