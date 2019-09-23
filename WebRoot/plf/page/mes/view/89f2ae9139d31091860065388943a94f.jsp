<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="testPlatoModel" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<!--plato add-->
	<!--<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>-->
	<script src="${path}plf/js/jquery/jquery-1.7.2.js"></script> 
	<script src="${path}plf/js/highcharts/highstock.js"></script>  
	<script src="${path}plf/js/highcharts/modules/exporting.js"></script>
<!--plato add end-->
</head>
<body>

	<div class="all">
		<bu:func viewId="c7eff80ba7b341448bd628648044937f" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="c7eff80ba7b341448bd628648044937f" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="c7eff80ba7b341448bd628648044937f" formId="22e069ee83fc4906aa878ab72da8c908" list="dataList" formidFirstId="22e069ee83fc4906aa878ab72da8c908" relColIds="" subFormIds="" subRelColIds="" />
<!--  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>-->


		</form>
		</div>
	</div>
		<bu:submit viewId="c7eff80ba7b341448bd628648044937f" />
		<bu:script viewId="c7eff80ba7b341448bd628648044937f" />
<!--plato add-->
   <form id="platoform" method="post">  
      <div>  
         <input type="hidden" name="svg" id="svg" />   
<!--<input id="btn_word" type="button" value="导出word" onclick="exportHighcharts('word');"/>   -->
<!--<input id="btn_pdf" type="button" value="导出pdf" onclick="exportHighcharts('pdf');"/>  -->
      </div>  
   </form>  
  
   <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
   <div id="container_pie" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<!--plato add end-->	
	<script type="text/javascript">

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
<!--plato add-->
	//图表导出功能
	//function exportHighcharts(type){
	//  var chart_plato = $("#container").highcharts();
	//  var svg_plato = chart_plato.getSVG();    
	//  $("#svg").val(svg_plato);  
      	//  $("#platoform").prop("action", "exportword.do?type="+type+"").submit();
      	//}    
		
      	$(function() {  
      Highcharts.wrap(Highcharts.Chart.prototype, 'getSVG', function (proceed) {  
         return proceed.call(this)  
            .replace(/(fill|stroke)="rgba([0？9]+,[0？9]+,[0？9]+),([0？9\.]+)"/g,   
               '$1="rgb($2)" $1-opacity="$3"'  
            );  
      });  
	  
      //柏拉图控件内容
      var charts = {  
         title : {  
            text : '销售人员年销量报表(柏拉图)',  
            //x : -20  
         //center  
         },  
         subtitle : {  
            text : '来源: 摩尔软件',  
            //x : -20  
         },  
         xAxis : {  
            categories : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']  
         },  
         yAxis : [{  
            title : {  
               text : '销售额(W$)'  
            },
			tickPixelInterval:60,
		//alignTicks:false,
		//max:1000,
		//tickPositions:[0,200,400,600,800,1000],
            plotLines : [ {  
               value : 0,  
               width : 1,  
               color : '#808080'  
            } ]  
         },
		 {
			 max:100,
			 tickPixelInterval:60,
			 //单格容量
			 //tickPositions:[0,17,40,60,80,100],
			 title:{
				 text: '累计百分比(%)'
			 },
			 style:
			 {
				 color: Highcharts.getOptions().colors[0]
			 },
			 opposite:true
		 }
		 ],  
         tooltip : {  
            shared:true
			//valueSuffix : 'W$'  
         },  
         legend : {  
            layout : 'vertical',  
            align : 'right',  
            verticalAlign : 'middle',  
            borderWidth : 0  
         },  
         series : [{  
			type: 'column',
			//yAxis: 1,
            name : 'Tokyo',  
            data : [ 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6 ],
			dataLabels:
			{
				enabled:true,
				style:
				{
					'fontSize' : '8px'
				}
			},
			tooltip:
			{
				valueSuffix:' W$',
			}
         },
		 {
			//不定义type则为折线图，定义了spline则为曲线图
			type: 'spline',
			yAxis: 1,
            name : 'Tokyo',  
            data : [ 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 100.0 ] ,
			tooltip:
			{
				valueSuffix:'%',
			}			
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
	  //饼图控件内容，数据与柏拉图控件共享所以不需要再去请求
		var charts_pie = 
		{
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : true
			},
			title : {  
				text : '销售人员年销量报表(饼图)',  
            },
			tooltip : {
				pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions : {  
				pie : {  
				   allowPointSelect : true,  
				   cursor : 'pointer',  
				   dataLabels : {  
					  enabled : true,  
					  color : '#000000',  
					  connectorColor : '#000000',  
					  format : '<b>{point.name}</b>: {point.percentage:.1f} %'  
				   }  
				}  
			 },  
			 series : [ {  
				type : 'pie',  
				name : '销售占比',  
				data : [ [ 'Firefox', 45.0 ], [ 'IE', 26.8 ], {  
				   name : 'Chrome',  
				   y : 12.8,  
				   sliced : true,  
				   selected : true  
				}, [ 'Safari', 8.5 ], [ 'Opera', 6.2 ], [ 'Others', 0.7 ] ]  
			 } ], 
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
			url: "buss/bussModel_exeFunc.ms?exeid=${exeid}&funcMId=7bf6f4beab4d4e10bea908ae8515b2f3",
			//"${path}chart/chart_demo_platoCharts.ms",
			data:param,
			success: function(data)
			{
				//var len = data.ajaxMap.data.length;
				//for(var i = 0; i<len ;i++)
				//{
					//series赋值
					//series数值组
				//	charts.series[i].data = data.ajaxMap.data[i].SALES_VOLUME;
				//	charts.series[i].name = data.ajaxMap.data[i].ENAME;				
				//}
				charts.series[0].data = data.ajaxMap.data;
				charts.series[0].name = "销售额"
				var len = data.ajaxMap.data.length;
				
				var total = 0;
				//计算总销售额
				for(var i = 0; i<len ;i++)
				{
					total += data.ajaxMap.data[i];
				}
				var tempVal = 0;
				var pieDate = [];
				var ename = [];
				var platoDate = [];
				for(var i = 0; i<len ;i++)
				{
					//饼图数据为当前数据占总量的百分比
					pieDate[i] = (data.ajaxMap.data[i])/total *100;
					pieDate[i] = Math.floor(pieDate[i]*10)/10;
					//柏拉图数据为累计数据占总量的百分比
					platoDate[i]= (data.ajaxMap.data[i] + tempVal)/total *100;
					platoDate[i] = Math.floor(platoDate[i]*100)/100;
					tempVal += data.ajaxMap.data[i];
				}
				//柏拉图控件数据赋值
				charts.series[1].data = platoDate;
				charts.series[1].name = "销售占比"
				//对柏拉图控件x坐标赋值
				charts.xAxis.categories = data.ajaxMap.ename;
				//对饼图控件数据赋值
				ename = data.ajaxMap.ename;//为饼图数据赋值,纯柏拉图代码中不需要
				var json = '';
				json += '[';
				for(var i = 0; i<len ; i++)
				{
					json += '[\"';
					json += data.ajaxMap.ename[i];
					json += '\",';
					json += pieDate[i];
					json += ']'
					if( i != len-1)
					{
						json += ','
					}
				}
				json += ']';
				//alert(json);
				json = $.parseJSON(json);
				charts_pie.series[0].data = json;
				$('#container').highcharts(charts);
				$('#container_pie').highcharts(charts_pie);
			}
		   });
      });
<!--plato add end-->
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}

</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
