<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="testSplineTable" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<!--spline add-->
	<script src="${path}plf/js/highcharts/highstock.js"></script>  
	<script src="${path}plf/js/highcharts/modules/exporting.js"></script>
<!--spline add end-->
</head>
<body>

	<div class="all">
		<bu:func viewId="edbe3a2ffd38495c8bd66049d51ed5a0" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="edbe3a2ffd38495c8bd66049d51ed5a0" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="edbe3a2ffd38495c8bd66049d51ed5a0" formId="3b1b0a53bf9144978bc1c4df1888712e" list="dataList" formidFirstId="3b1b0a53bf9144978bc1c4df1888712e" relColIds="" subFormIds="" subRelColIds="" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


		</form>
		</div>
	</div>
		<bu:submit viewId="edbe3a2ffd38495c8bd66049d51ed5a0" />
		<bu:script viewId="edbe3a2ffd38495c8bd66049d51ed5a0" />

<!--spline add-->
   <form id="platoform" action="exportword.do" method="post">  
      <div>  
         <input type="hidden" name="svg" id="svg" />   
         <input id="btn_word" type="button" value="导出word" onclick="exportHighcharts('word');"/>   
         <input id="btn_pdf" type="button" value="导出pdf" onclick="exportHighcharts('pdf');"/>  
      </div>  
   </form>  
  
   <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<!--spline add end-->			
	
	<script type="text/javascript">
 
	 console.log("test" + "%{getText("新增")}");
	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
			
<!--spline add-->
	function exportHighcharts(type){
	  var chart_spline = $("#container").highcharts();
	  var svg_spline = chart_spline.getSVG();    
		  $("#svg").val(svg_spline);  
			  $("#platoform").prop("action", "exportword.do?type="+type+"").submit();
			}    
		
      	$(function() {  
			  Highcharts.wrap(Highcharts.Chart.prototype, 'getSVG', function (proceed) {  
				 return proceed.call(this)  
					.replace(/(fill|stroke)="rgba([0？9]+,[0？9]+,[0？9]+),([0？9\.]+)"/g,   
					   '$1="rgb($2)" $1-opacity="$3"'  
					);  
			  });  
			  //曲线图
			  var charts = {  
				  title : {  
					text : '产量报表(曲线图)',  
					//x : -20  
					 //center  
					},  
				  subtitle : {  
					text : '来源: 摩尔软件',  
					//x : -20  
					},  
				  xAxis : {  
						categories : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],  
						max:12,
					 },  
					 scrollbar:
					 {
						 enabled:true,
					 },
					yAxis : {  
						min : 0,
						title : {  
						text : '累计产量'  
						},
						tickPixelInterval:60,
						plotLines : [ {  
						   value : 0,  
						   width : 1,  
						   color : '#808080'  
						} ]  
					},
					tooltip : {  
						valueSuffix : '件'  
					 }, 
					 legend : {  
						layout : 'vertical',  
						align : 'right',  
						verticalAlign : 'middle',  
						borderWidth : 0  
					 }, 
					 series : [ {  
						name : 'Tokyo',  
						data : [ 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6 ]  
					 }],
					 //去除自带的导出按钮
					 exporting:
					 {
						enabled:false
					 },  
					 //去除右下角highchart公司标签
					 credits:
					 {
						enabled:false
					 }, 
				};
			var param =
			{
				viewId:"${exeid}"
			}
			 $.ajax({
			type: "POST",
			dataType: "json",
			url: "buss/bussModel_exeFunc.ms?exeid=${exeid}&funcMId=8d6996dc305a44e88b4ae6cc5871a562",
			//"${path}chart/chart_demo_splineCharts.ms",
			data:param,
			success: function(data)
			{
				charts.series[0].data = data.ajaxMap.data;
				charts.series[0].name = "累计产量";
				//对曲线图图控件x坐标赋值
				charts.xAxis.categories = data.ajaxMap.ename;
				$('#container').highcharts(charts);
			}
		   });
				
		});
<!--spline add end-->

<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>

	}
</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
