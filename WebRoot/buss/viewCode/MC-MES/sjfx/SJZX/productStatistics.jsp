<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
     <title>
		<dict:lang value="VM-生产统计" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="494b12bd7c12457bb071d60657cf7860"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <script type = "text/javascript" src = "${path}plf/page/timer/perforMonit/js/echarts.min.js"></script>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
<style type="text/css">

</style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
				<div class="optn">
                  <table class="func_table">
                  <tr>
					<td width="100%" align="right">
				    <button type="button" onclick="queryv('formId1');" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
		  			</td>
	    		</tr>
				</table>
		</div>
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post"	 >
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="bbf5f86bacda4450aaf415f04f894914" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form style="height:calc(100% - 39px);width:100%;" id="listForm" name="listForm" class="formhe" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage494b12bd7c12457bb071d60657cf7860" id="formPage494b12bd7c12457bb071d60657cf7860" value="${formPage494b12bd7c12457bb071d60657cf7860}"/>
		<input type="hidden" name="formId" id="formId1" value='494b12bd7c12457bb071d60657cf7860'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1 divhe"  id="494b12bd7c12457bb071d60657cf7860">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax494b12bd7c12457bb071d60657cf7860" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner494b12bd7c12457bb071d60657cf7860" >
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable494b12bd7c12457bb071d60657cf7860">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="494b12bd7c12457bb071d60657cf7860" i18n="1"/></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><dict:lang value="组织机构"/></td>
			<td class="datagrid-cell" style="width:160px; text-align:center;"><dict:lang value="制令单号"/></td>
			<td class="datagrid-cell" style="width:160px; text-align:center;"><dict:lang value="工单号"/></td>
			<td class="datagrid-cell" style="width:80px; text-align:center;"><dict:lang value="加工面别"/></td>
			<td class="datagrid-cell" style="width:160px; text-align:center;"><dict:lang value="线别"/></td>
			<td class="datagrid-cell" style="width:160px; text-align:center;"><dict:lang value="机种"/></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><dict:lang value="工作日期"/></td>
			<td class="datagrid-cell" style="width:80px; text-align:center;"><dict:lang value="班别"/></td>
			<td class="datagrid-cell" style="width:160px; text-align:center;"><dict:lang value="时段"/></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><dict:lang value="开始时间"/></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><dict:lang value="结束时间"/></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="一次良品数"/></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="不良点数"/></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="二次良品数"/></td>
		
			<td class="datagrid-cell" style="width:120px; text-align:center;"><dict:lang value="制令单投产数量"/></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><dict:lang value="制令单完工数量"/></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="工单投产数量"/></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="工单完工数量"/></td>
			<td class="datagrid-cell" style="width:100px;text-align:center;"><dict:lang value="报废数量"/></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv494b12bd7c12457bb071d60657cf7860" onscroll="ajaxTableScroll(this,'494b12bd7c12457bb071d60657cf7860')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax494b12bd7c12457bb071d60657cf7860" >
		<tbody id="tbody_494b12bd7c12457bb071d60657cf7860" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage494b12bd7c12457bb071d60657cf7860==1}">			
		    <div class="center">
			    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=queryechar&formId=formId1&showLoading=0" />
			</div>
		</c:if>
				    
            
        <div id="divpro1" style="float:left;height:calc(50% - 5px);width:50%;padding:5px;box-sizing:border-box;margin-top: 10px;"></div>
        <div id="divpro2" style="float:left;height:calc(50% - 5px);width:50%;padding:5px;box-sizing:border-box;margin-top: 10px;"></div>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="bbf5f86bacda4450aaf415f04f894914" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="bbf5f86bacda4450aaf415f04f894914" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
<%--生成异步表格--%>
$(function(){
    var today = newnow();
    var areasn = localStorage.getItem("AREANAME");
    
    $("#MPS_WORK_DATE").val(today);
    $("#MPS_AREA_SN option").each(function(){
        if($(this).val() == areasn){
            $(this).attr("selected","selected");
        }
    });
    initprodata();
    //loadErrorEchart();
    //loadErrorEchart2();
    //loadErrorEchart3();
})

	function loadErrorEchart2(){
	    // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('divpro1'));

        // 指定图表的配置项和数据
        myChart.setOption({
            title: {
                text: '时段产量'
            },
            tooltip: {
                trigger: 'axis',
                formatter: '{a} <br/>{b}: {c}'
            },
            legend: {
               data:['产品']
            },
            xAxis: {
                data: [],
                axisLabel:{  
                         interval:0,//横轴信息全部显示  
                         rotate:-30,//-30度角倾斜显示  
                    }  
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: [],
                itemStyle: {
                        //柱形图圆角，鼠标移上去效果，如果只是一个数字则说明四个参数全部设置为那么多
                        emphasis: {
                            barBorderRadius: 30
                        },

                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[0, 0, 0, 0],
                            label: {
                                show: true,//是否展示
                                textStyle: {
                                    fontWeight:'bolder',
                                    fontSize : '12',
                                    fontFamily : '微软雅黑',
                                }
                            },
                        color: function (params){
                                var colorList = ['#00a0e9','#00a0e9'];
                                return colorList[params.dataIndex];
                            }
                        }
                }
            }]
            
        });
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        var names=[];    //类别数组（实际用来盛放X轴坐标值）
        var nums=[];    //销量数组（实际用来盛放Y坐标值）
        var showUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=d269cbd99e4f4569ab5c4015ddcbb9e1";
        var wkTime = $("#MPS_WORK_DATE").val();
    	var areaSn = $("#MPS_AREA_SN").val();
    	var dataAuth = $("#DATA_AUTH").val();
        $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: showUrl,
			    data: {
			        "type" : "modelEchart",
			        "wkTime" : wkTime,
			        "areaSn" : areaSn,
			        "dataAuth" : dataAuth
			    },
				success: function(data){	
                        
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = data.ajaxList;
							
							for(var i = 0;i < rccList.length; i++){
								  names.push(rccList[i].TIME_BUCKET);
								  nums.push(rccList[i].MPS_PO_OUTPUT);  
							
								
							}
							myChart.hideLoading();    //隐藏加载动画
                            myChart.setOption({        //加载数据图表
                                xAxis: {
                                    data: names
                                },
                                yAxis: {},
                                series: [{
                                    // 根据名字对应到相应的系列
                                    name: '产量',
                                    type: 'bar',
                                    data: nums,
                                    itemStyle:{ 
                                    normal:{
                                    label : {show: true,position:'top',color: '#00a0e9'}
                                    }}
                                }]
                            });
						}
					myChart.hideLoading();	
					},
				error: function(msg){
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
						myChart.hideLoading();
				  }
				});
        }
	function loadErrorEchart3(){
	    // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('divpro2'));

        // 指定图表的配置项和数据
        myChart.setOption({
            title: {
                text: '质量直通率'
            },
            tooltip: {
                trigger: 'axis',
                formatter: '{a} <br/>{b}: {c}%'
            },
            legend: {
               data:['产品']
            },
            xAxis: {
                data: [],
                axisLabel:{  
                         interval:0,//横轴信息全部显示  
                         rotate:-30,//-30度角倾斜显示  
                    }  
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'line',
                data: [],
                itemStyle: {
                        //柱形图圆角，鼠标移上去效果，如果只是一个数字则说明四个参数全部设置为那么多
                    //    emphasis: {
                    //        barBorderRadius: 30
                    //    },

                        normal: {
                            //柱形图圆角，初始化效果
                         //   barBorderRadius:[0, 0, 0, 0],
                            label: {
                                show: true,//是否展示
                                textStyle: {
                                    fontWeight:'bolder',
                                    fontSize : '12',
                                    fontFamily : '微软雅黑',
                                    fontColor:'#00a0e9'
                                }
                            },
                            color: function (params){
                                var colorList = ['#00a0e9','#00a0e9'];
                                return colorList[params.dataIndex];
                            }
                        }
                }
            }]
            
        });
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        var names=[];    //类别数组（实际用来盛放X轴坐标值）
        var nums=[];    //销量数组（实际用来盛放Y坐标值）
        var showUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=16e0ded055bb4f37b36398abb34bab30";
        var wkTime = $("#MPS_WORK_DATE").val();
    	var areaSn = $("#MPS_AREA_SN").val();
    	var dataAuth = $("#DATA_AUTH").val();
        $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: showUrl,
			    data: {
			        "type" : "modelEchart",
			        "wkTime" : wkTime,
			        "areaSn" : areaSn,
			        "dataAuth" : dataAuth
			    },
				success: function(data){	
                        
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = data.ajaxList;
							
							for(var i = 0;i < rccList.length; i++){
								names.push(rccList[i].TIME_BUCKET); 
								nums.push(rccList[i].DIRECRT);
							}
							myChart.hideLoading();    //隐藏加载动画
                            myChart.setOption({        //加载数据图表
                                xAxis: {
                                    data: names
                                },
                                yAxis: {
                                                type : 'value',
                                                axisLabel:{formatter:'{value} %'}
                                },
                                series: [{
                                    // 根据名字对应到相应的系列
                                    name: '直通率',
                                    type: 'line',
                                    smooth: true,
                                    //symbol:'none',
                                    data: nums,
                                    itemStyle:{ 
                                    normal:{
                                    lineStyle :{
                                       color: '#00a0e9'
                                    },
                                    label : {show: true,color: '#00a0e9',formatter:'{c}%'}}}
                                    
                                    

                                    
                                }]
                            });
						}
					myChart.hideLoading();	
					},
				error: function(msg){
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
						myChart.hideLoading();
				  }
				});
        }
function createTableModel(ms,formId){
}
function initprodata(){
  var workTime = $("#MPS_WORK_DATE").val();
    var areaSn = $("#MPS_AREA_SN").val();
    var dataAuth = $("#DATA_AUTH").val();
   
  //if(areaSn==""){
     // utilsFp.confirmIcon(1,"","","", "<dict:lang value='请选择线别'/>",0,"300","");
//  }else{
  $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=3fd7243af5c24b63ab67fa2f5d7147ba",
        data: {
            "workTime" : workTime,
            "areaSn" : areaSn,
            "dataAuth" : dataAuth
        },
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              $("#tbody_494b12bd7c12457bb071d60657cf7860").empty();
               if(null != data.ajaxPage.dataList){
               console.log(reslist);
                for(var i=0;i<reslist.length;i++){
                    $("#tbody_494b12bd7c12457bb071d60657cf7860").append("<tr ondblclick='detailcon(this.id)' id='"+(reslist[i].ID==null?"":reslist[i].ID)+"' ></tr>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+reslist[i].ROWNUM_+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: left;'>"+(reslist[i].DATA_AUTH_NAME==null?"":reslist[i].DATA_AUTH_NAME)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: left;'><span onclick='itemJump1(\""+reslist[i].MPS_MO_NUMBER+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].MPS_MO_NUMBER==null?"":reslist[i].MPS_MO_NUMBER)+"</span></td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: left;'><span onclick='itemJump2(\""+reslist[i].MPS_PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].MPS_PROJECT_ID==null?"":reslist[i].MPS_PROJECT_ID)+"</span></td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].FACE==null?"":reslist[i].FACE)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: left;'>"+(reslist[i].CA_NAME==null?"":reslist[i].CA_NAME)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: left;'>"+(reslist[i].MPS_MODEL_CODE==null?"":reslist[i].MPS_MODEL_CODE)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:140px;text-align: center;'>"+(reslist[i].MPS_WORK_DATE==null?"":reslist[i].MPS_WORK_DATE)+"</td>"); 
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].MPS_WORK_GROUP==null?"":reslist[i].MPS_WORK_GROUP)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].MPS_PERIOD==null?"":reslist[i].MPS_PERIOD)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:140px;text-align: center;'>"+(reslist[i].MPS_BEGIN_TIME==null?"":reslist[i].MPS_BEGIN_TIME)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:140px;text-align: center;'>"+(reslist[i].MPS_END_TIME==null?"":reslist[i].MPS_END_TIME)+"</td>"); 
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_OK_PCS==null?"":reslist[i].MPS_OK_PCS)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_NG_POINTS==null?"":reslist[i].MPS_NG_POINTS)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_T_OK_PCS==null?"":reslist[i].MPS_T_OK_PCS)+"</td>");

                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:120px;text-align: right;'>"+(reslist[i].MPS_MO_INPUT==null?"":reslist[i].MPS_MO_INPUT)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:120px;text-align: right;'>"+(reslist[i].MPS_MO_OUTPUT==null?"":reslist[i].MPS_MO_OUTPUT)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_PO_INPUT==null?"":reslist[i].MPS_PO_INPUT)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_PO_OUTPUT==null?"":reslist[i].MPS_PO_OUTPUT)+"</td>"); 
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_SCRAP_QTY==null?"":reslist[i].MPS_SCRAP_QTY)+"</td>");		    
		  }


               } 
               loadErrorEchart2();
               loadErrorEchart3();               
               pageFun(data.ajaxPage,"formId1");
              var tableTrJs = $("#tbody_494b12bd7c12457bb071d60657cf7860 tr");_tongLineColor(tableTrJs);
              defTableWidthRewrite("494b12bd7c12457bb071d60657cf7860");
               setScroll();

        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });
  //  }
}
var paginationImpl = {};
function queryv(a){
      var areaSn = $("#MPS_AREA_SN").val();
      var wkTime = $("#MPS_WORK_DATE").val(); 
      var dataAuth = $("#DATA_AUTH").val(); 
    if(areaSn==""){
      utilsFp.confirmIcon(1,"","","", "<dict:lang value='请选择线别'/>",0,"300","");
  }else if(wkTime==""){
      utilsFp.confirmIcon(1,"","","", "<dict:lang value='请选择工作日期'/>",0,"300","");
  }else if(dataAuth==""){
      utilsFp.confirmIcon(1,"","","", "<dict:lang value='请选择组织机构'/>",0,"300","");
  }else{
      queryechar(a);
  }
}

function queryechar(paginationImpl){
  var workTime = $("#MPS_WORK_DATE").val();
  var areaSn = $("#MPS_AREA_SN").val();
  var dataAuth = $("#DATA_AUTH").val();
  $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=3fd7243af5c24b63ab67fa2f5d7147ba",//16e0ded055bb4f37b36398abb34bab30 692d13534a274c4b9b3c54323f8a39fa
        data: {
            "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
            "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
            "workTime" : workTime,
            "areaSn" : areaSn,
            "dataAuth" : dataAuth
        },
        //data: "&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord+"&workTime="+workTime+"&areaSn="+areaSn,
        success: function(data){
             var reslist = data.ajaxPage.dataList;
              $("#tbody_494b12bd7c12457bb071d60657cf7860").empty();
               if(null != data.ajaxPage.dataList){
               console.log(reslist);
                for(var i=0;i<reslist.length;i++){
                    $("#tbody_494b12bd7c12457bb071d60657cf7860").append("<tr ondblclick='detailcon(this.id)' id='"+(reslist[i].ID==null?"":reslist[i].ID)+"' ></tr>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+reslist[i].ROWNUM_+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: left;'>"+(reslist[i].DATA_AUTH_NAME==null?"":reslist[i].DATA_AUTH_NAME)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: left;'><span onclick='itemJump1(\""+reslist[i].MPS_MO_NUMBER+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].MPS_MO_NUMBER==null?"":reslist[i].MPS_MO_NUMBER)+"</span></td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: left;'><span onclick='itemJump2(\""+reslist[i].MPS_PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].MPS_PROJECT_ID==null?"":reslist[i].MPS_PROJECT_ID)+"</span></td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].FACE==null?"":reslist[i].FACE)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: left;'>"+(reslist[i].CA_NAME==null?"":reslist[i].CA_NAME)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: left;'>"+(reslist[i].MPS_MODEL_CODE==null?"":reslist[i].MPS_MODEL_CODE)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:140px;text-align: center;'>"+(reslist[i].MPS_WORK_DATE==null?"":reslist[i].MPS_WORK_DATE)+"</td>"); 
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].MPS_WORK_GROUP==null?"":reslist[i].MPS_WORK_GROUP)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].MPS_PERIOD==null?"":reslist[i].MPS_PERIOD)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:140px;text-align: center;'>"+(reslist[i].MPS_BEGIN_TIME==null?"":reslist[i].MPS_BEGIN_TIME)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:140px;text-align: center;'>"+(reslist[i].MPS_END_TIME==null?"":reslist[i].MPS_END_TIME)+"</td>"); 
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_OK_PCS==null?"":reslist[i].MPS_OK_PCS)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_NG_POINTS==null?"":reslist[i].MPS_NG_POINTS)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_T_OK_PCS==null?"":reslist[i].MPS_T_OK_PCS)+"</td>");
                   
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:120px;text-align: right;'>"+(reslist[i].MPS_MO_INPUT==null?"":reslist[i].MPS_MO_INPUT)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:120px;text-align: right;'>"+(reslist[i].MPS_MO_OUTPUT==null?"":reslist[i].MPS_MO_OUTPUT)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_PO_INPUT==null?"":reslist[i].MPS_PO_INPUT)+"</td>");
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_PO_OUTPUT==null?"":reslist[i].MPS_PO_OUTPUT)+"</td>"); 
                    $("#tbody_494b12bd7c12457bb071d60657cf7860 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: right;'>"+(reslist[i].MPS_SCRAP_QTY==null?"":reslist[i].MPS_SCRAP_QTY)+"</td>");		    
		  }

               }
		           loadErrorEchart2();
                   loadErrorEchart3();
                pageFun(data.ajaxPage,"formId1");
               var tableTrJs = $("#tbody_494b12bd7c12457bb071d60657cf7860 tr");_tongLineColor(tableTrJs);
               defTableWidthRewrite("494b12bd7c12457bb071d60657cf7860");
               setScroll();                       
        },
        error: function(msg){
                util.closeLoading();
                console.log(msg);
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });

    
}
 function newtoday(){
   var mydate = new Date();
   var str = "" + mydate.getFullYear() + "-";
   str += (mydate.getMonth()+1) + "-";
   str += mydate.getDate();
   return str;
  }
function newnow(){
    var day = new Date(); 
var Year = 0; 
var Month = 0; 
var Day = 0; 
var CurrentDate = ""; 
//初始化时间 
//Year= day.getYear();//有火狐下2008年显示108的bug 
Year= day.getFullYear();//ie火狐下都可以 
Month= day.getMonth()+1; 
Day = day.getDate(); 
//Hour = day.getHours(); 
// Minute = day.getMinutes(); 
// Second = day.getSeconds(); 
CurrentDate += Year + "-"; 
if (Month >= 10 ) 
{ 
CurrentDate += Month + "-"; 
} 
else 
{ 
CurrentDate += "0" + Month + "-"; 
} 
if (Day >= 10 ) 
{ 
CurrentDate += Day ; 
} 
else 
{ 
CurrentDate += "0" + Day ; 
} 
return CurrentDate; 
}
$("#MPS_AREA_SN").change(function(){
        localStorage.removeItem("AREANAME");
        $("#MPS_AREA_SN option").each(function(){
          if($(this).attr("selected")){
               var areavalue = $(this).val(); 
               
               localStorage.setItem("AREANAME",areavalue);
          }
    });
})

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 



</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
