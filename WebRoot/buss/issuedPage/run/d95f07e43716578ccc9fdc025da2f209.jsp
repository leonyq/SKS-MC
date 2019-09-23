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
		<dict:lang value="车间可视化" />
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
		<bu:header formId ="f8f38593803b49eda68064fc7a5b0169"/>

    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
  
    <script type="text/javascript" src="${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
   	<script type="text/javascript" src="${path}plf/js/common/util.js?_mc_res_version=<%=PlfStaticRes.UTIL_JS %>"></script>
	<script type="text/javascript" src="${path}plf/page/fp/js/utilsFp.js?_mc_res_version=<%=PlfStaticRes.UTILSFP %>"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script src="${path}plf/js/msg/jquery.msg.js?_mc_res_version=<%=PlfStaticRes.JQUERYMSG%>"></script>
    <script type="text/javascript" src="${path}buss/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/three.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/TrackballControls.js"></script>
<script type="text/javascript" src="${path}buss/js/three/OrbitControls.js"></script>
<script type="text/javascript" src="${path}buss/js/three/CSS3DRenderer.js"></script>
<script type="text/javascript" src="${path}buss/js/three/tween.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/stats.min.js"></script>
<script type="text/javascript" src="${path}buss/js/line/lineShow.js" ></script>
<script type="text/javascript" src="${path}buss/js/slide.js"></script>
<link href="${path}buss/css/css.css" type="text/css" rel="stylesheet" />
<script src="${path}buss/js/echarts.min.js"></script>
<script type="text/javascript" src="${path}buss/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${path}plf/page/fp/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${path}plf/page/fp/js/utilsFp.js?_mc_res_version=<%=PlfStaticRes.UTILSFP %>"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script src="${path}plf/js/msg/jquery.msg.js?_mc_res_version=<%=PlfStaticRes.JQUERYMSG%>"></script>
  <style>
	 .pop {
        color: #ffffff;
        width: 100%;
        height: calc(200% / 3 - 20px);
        position: relative;
    }
    
    .pop-left {
        width: 23%;
        float: left;
        height: 100%;
    }
    
    .pop-contain {
        width: 75%;
        height: calc(100% - 52px);
        float: left;
        margin: 10px;
        margin-top:42px;
    }
    
    .body-head-title {
    
        margin-bottom: 0px;
      
    }
    
    .bgRight {
        font-size: 10px;
        position: absolute;
        top: 35%;
        left: calc(16% + 10px);
        width:calc(80% - 20px);
        height:32px;
        text-align:right;
    }
    
    .btn {
        border-radius: 3px;
        border: 1px solid #43565f;
        cursor: pointer;
        font-weight: bold;
        font-size: 12px;
        color: #ffffff;
        margin-right: 5px;
        display: inline-block;
        width: 70px;
        text-align: center;
        height: 30px;
        vertical-align: top;
    }
    
    .btn3 {
        cursor: pointer;
        font-weight: bold;
        color: #ffffff;
        margin-right: 5px;
        display: inline-block;
        width: 32px;
        height: 32px;
        margin-left: 9px;
        background-size: cover;
    }

    .btn4 {
        cursor: pointer;
        font-weight: bold;
        color: #ffffff;
        margin-right: 5px;
        display: inline-block;
        width: 32px;
        height: 32px;
        margin-left: 9px;
    }
    
	.con1 {
        margin: 10px;
        width: 23%;
        border: 1px solid #fff;
        opacity: 0.8;
        float: left;
        height: calc(100% - 20px);
        border-radius: 5px;
        position: relative;
        padding: 10px;
        color: #ffffff;
        box-sizing: border-box;
    }
	
    .con2 {
        margin: 10px;
        width: 23%;
        border: 1px solid #fff;
        opacity: 0.8;
        float: left;
        height: calc(100% - 20px);
        border-radius: 5px;
        position: relative;
        padding: 10px;
        color: #ffffff;
        box-sizing: border-box;
    }
    
    #areaPlace{
        vertical-align: top;
        height: 24px;
        margin-top: 4px;
        margin-right: 10px;
    }
    
    .btn5{
        float:right;
    }
    
    .btn6{
        float:right;
    }
    td {
    height: 30px;
    width: auto;
    border: 1px solid #363b42;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.dialog-bd div{
	color: #333
}

#scroll-2{
        width:102%;
        height:93%;
        overflow:auto;
	margin-bottom: 20px;
}
#scroll-2 div{
	width:400px;
	height:400px;
}
#scroll-2::-webkit-scrollbar{
	width:4px;
	height:4px;
}
#scroll-2::-webkit-scrollbar-track{
	background: #f6f6f6;
	border-radius:2px;
}
#scroll-2::-webkit-scrollbar-thumb{
	background: #aaa;
	border-radius:2px;
}
#scroll-2::-webkit-scrollbar-thumb:hover{
	background: #747474;
}
#scroll-2::-webkit-scrollbar-corner{
	background: #f6f6f6;
}


</style>
<script type="text/javascript">
var imgSrc;
var allAreaData;
$(function() {
	initThree("container");//初始化画布	
	initControls();//初始化控制器
	animate();//动画效果
	
	workstation();//车间选择
	
	
});

function lineProductionInfo(){
	var workstation= $("#workstation").val();
	 var m={areaSn:workstation};
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=line&method=getLineProductionInfo",
        data: m,
        dataType: "json",
        success: function(data) {
        	
        },
        error: function(data) {
            alert("系统错误！");
        
        }
    });
}



function errorCodeInfo(){
	var workstation= $("#workstation").val();
	 var m={areaSn:workstation};
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=line&method=getErrorCode",
        data: m,
        dataType: "json",
        success: function(data) {
        	
        	var xArray=new Array();
        	var yArray=new Array();
        	for(var i=0;i<data.length;i++){
        		xArray.push(data[i].CEC_NAME);
        		var temp={value:data[i].NUM, name:data[i].CEC_NAME};
        		yArray.push(temp);
        	}
        	if(xArray.length==0){
        		xArray.push(0);
        		xArray.push(0);
        	}
        	errorCodeCharts(xArray,yArray);
        },
        error: function(data) {
            alert("系统错误！");
            console.log(data);
        }
    });
}
//线体直通率
function lineRateInfo(){
	
	$.ajax({
       type: "post",
       url: "${path}http/interface.ms?model=line&method=getLineRateInfo",
       data: {areaSn:$("#workstation").val()
    	},
       dataType: "json",
       success: function(data) {
    	   if((data.length>0)&&(data[0].PERCNT!=null)){
    		   rateInfoCharts(data[0].PERCNT);
    	   }else{
    		   rateInfoCharts(0);
    	   }
       	
       },
       error: function(data) {
           alert("系统错误！");
           console.log(data);
       }
   });
	
	
	
}

function ppmInfo(){
	var workstation= $("#workstation").val();
	 var m={areaSn:workstation};
	$.ajax({
      type: "post",
      url: "${path}http/interface.ms?model=line&method=getPpmList",
      data: m,
      dataType: "json",
      success: function(data) {
    	  
    		  ppmCharts(data);
    	  
    	  
      },
      error: function(data) {
    	  alert("系统错误！");
         
      }
  });
	
}

function dppmInfo(){
	var workstation= $("#workstation").val();
	 var m={areaSn:workstation};
	$.ajax({
     type: "post",
     url: "${path}http/interface.ms?model=line&method=getDppmList",
     data: m,
     dataType: "json", 
     success: function(data) {
    	 
    		 dppmCharts(data);
    	 
    	
     },
     error: function(data) {
   	  
         alert("系统错误！");
        
     }
 });
}

function workstation(){
    var dataAuth = $("#dataAuth").val();
	 $.ajax({
          type: "post",
          url: "${path}http/interface.ms?model=line&method=getWorkstationList",
          data: {'dataAuth':dataAuth
          },
          dataType: "json",
          success: function(data) {
          		var html="";
          		allAreaData=data;
          		for(var i=0;i<data.length;i++){
          			if(localStorage.workstation!=undefined&&localStorage.workstation==data[i].CA_ID){
          				html+="<option value='"+data[i].CA_ID+"' selected='selected'>"+data[i].CA_NAME+"</option>";
          			}else{
          				html+="<option value='"+data[i].CA_ID+"'>"+data[i].CA_NAME+"</option>";
          			}
          			
          		}
          		$("#workstation").html(html);
          		addCanvasContenxt();
          		lineProductionInfo();
          		errorCodeInfo();
          		lineRateInfo();
          		ppmInfo();
          		dppmInfo();
          		queryTimeInterval();
          		queryPeriodThroughRate();
          		
          		
          },
          error: function(data) {
              alert("系统错误！");
          }
      });
}

function areaChange(){
	lineProductionInfo();
	errorCodeInfo();
	lineRateInfo();
	ppmInfo();
	dppmInfo();
	queryTimeInterval();
	queryPeriodThroughRate();
	removeSceneAllObject();
	localStorage.workstation=$("#workstation").val();
	addCanvasContenxt();
}
//查询位置数据
function queryPositionData(){
	
	var workstation= $("#workstation").val();
	 var m={areaSn:workstation};
	$.ajax({
		type : "post",
		url : "${path}http/interface.ms?model=line&method=getWorkShopInfo",
		data :m,
		dataType : "json",
		success : function(data) {
				showDevice(data);
		},
		error : function(data) {
			alert("系统错误！");
		}
	});
}

//获取时段产量
function queryTimeInterval(){
	var workstation= $("#workstation").val();
	 var m={areaSn:workstation};
	$.ajax({
		type : "post",
		url : "${path}http/interface.ms?model=line&method=getTimeInterval",
		data :m,
		dataType : "json",
		success : function(data) {
				var inputArray=new Array();
	        	var outArray=new Array();
	        	for(var i=0;i<data.length;i++){
	        		inputArray.push(data[i].name);
	        		outArray.push(data[i].value);
	        		
	        	}
	        	productionInfoCharts(inputArray,outArray);
		},
		error : function(data) {
			alert("系统错误！");
		}
	});
	
}

//获取时段直通率
function queryPeriodThroughRate(){
	var workstation= $("#workstation").val();
	 var m={areaSn:workstation};
	$.ajax({
		type : "post",
		url : "${path}http/interface.ms?model=line&method=periodThroughRate",
		data :m,
		dataType : "json",
		success : function(data) {
			var inputArray=new Array();
        	var outArray=new Array();
        	var pcbArray=new Array();
        	for(var i=0;i<data.length;i++){
        		inputArray.push(data[i][0]);
        		outArray.push((data[i][1]*100).toFixed(2));
        		pcbArray.push(data[i][2]);
        	}
        periodThroughRateCharts(inputArray,outArray,pcbArray);
        	
		},
		error : function(data) {bj
			alert("系统错误！");
		}
	});
	
}
//设备数据展示
function showDevice(data){
	for(var i=0;i<data.length;i++){
			if(data[i].OBJECT_TYPE==1){
				var room_texture = data[i].OBJECT_IMG_SRC;
				var room_map = THREE.ImageUtils.loadTexture(room_texture);
				var material = new THREE.MeshPhongMaterial( { map:room_map,opacity: 1, transparent: true});
		    	var geometry = new THREE.CubeGeometry(data[i].OBJECT_WIDTH,data[i].OBJECT_HEIGHT,1);
		    	var mesh=new THREE.Mesh(geometry,material);
		    	mesh.lineId=data[i].LINE_ID;
		    	mesh.areaId=data[i].AREA_ID;
		    	mesh.groupId=data[i].OBJECT_GROUPID;
		        mesh.rsId = data[i].OBJECT_RSID;
		        mesh.aggregate=data[i].OBJECT_AGGREGATE;
		        mesh.aggStatus=1;
		        mesh.rank = data[i].OBJECT_RANK;
		        mesh.id = data[i].ID;
		        mesh.addY=data[i].OBJECT_ADDY;
		        mesh.type = data[i].OBJECT_TYPE;
		        mesh.last = data[i].OBJECT_LAST;
		        mesh.first = data[i].OBJECT_FIRST
		        mesh.imgWidth=data[i].OBJECT_WIDTH;
		        mesh.imgSrc=data[i].OBJECT_IMG_SRC;
		        mesh.parentId=data[i].OBJECT_PARENT_ID;
		        mesh.name=data[i].OBJECT_DEVICE_NAME;
		        mesh.position.set(data[i].OBJECT_POSITIONX,data[i].OBJECT_POSITIONY,data[i].OBJECT_POSITIONZ);
		        objects.push(mesh);
		        scene.add(mesh);
		        
		        

			}
		 	
	}
	showFontCanvas(data);
}

//显示文本画布
function showFontCanvas(data){
	for(var i=0;i<data.length;i++){
		if(data[i].OBJECT_TYPE==3){
			var geometry = new THREE.CubeGeometry(500, 200, 10);
			texture = new THREE.Texture(gainCanvasTexture(data[i].OBJECT_DEVICE_NAME));
	        var material = new THREE.MeshBasicMaterial({map:texture});
			texture.needsUpdate = true;
	        mesh = new THREE.Mesh( geometry,material);
	        mesh.aggregate=data[i].OBJECT_AGGREGATE;
	        mesh.parentId=data[i].OBJECT_PARENT_ID;
	        mesh.groupId=data[i].OBJECT_GROUPID;
	        mesh.rank = data[i].OBJECT_RANK;
	        mesh.type = data[i].OBJECT_TYPE;
	        mesh.last = data[i].OBJECT_LAST;
	        mesh.first = data[i].OBJECT_FIRST;
	        mesh.name=data[i].OBJECT_DEVICE_NAME;
	        mesh.rsId=data[i].OBJECT_RSID;
	        mesh.lineId=data[i].LINE_ID;
	        mesh.areaId=data[i].AREA_ID;
	        mesh.position.set(data[i].OBJECT_POSITIONX,data[i].OBJECT_POSITIONY,data[i].OBJECT_POSITIONZ);
	        mesh.addY=data[i].OBJECT_ADDY;
	        scene.add(mesh);
	        objects.push(mesh);
		}
	}
}
//展示时段产量数据

function productionInfoCharts(inputArray,outArray){
	var myChart = echarts.init(document.getElementById('productionInfo'));
	option = {
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	textStyle: {
	                color: '#ffffff',
	                fontSize: 10,
	            },
		    },
		     color: ['#8776e9', '#5ba7f8'],
		    grid: {
	            x: 45,
	            y: 20,
	            x2: 0,
	            y2: 30,
			},
		    calculable : true,
		    xAxis : [
		        {
		        	axisLabel: { //坐标轴文本标签，详见axis.axisLabel
		                show: true,
		                interval: 0,
		                textStyle: {
		                    color: '#ffffff',
		                    fontSize: 10
		                }
		            },
		            axisLine:{
                        lineStyle:{
                            color:'#ffffff',
                            width:1,//这里是为了突出显示加上的
                        }
                    }, 
		            type : 'category',
		            data : inputArray,
		            
		        }
		    ],
		    yAxis : [
		        {
		        	 axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
		                 show: true,
		                 textStyle: {
		                     color: '#ffffff'
		                 },
		                 formatter: '{value}',
		             },
		            type : 'value',
		            min: 0,
		          
		           
		        }
		    ],
		    series : [
		        {
		            name:'时段产量',
		            type:'bar',
		            label: {
					      normal: {
					          show: true,
					          position: 'top',
					          textStyle: {
					            color: 'white'
					          }
					      }
					 },
		            data:outArray,
		          
		           
		        }
		    ]
		};

    myChart.setOption(option);
}


//展示时段直通率

function periodThroughRateCharts(inputArray,outArray,pcbArray){
	var myChart = echarts.init(document.getElementById('periodThroughRate'));
	option = {
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	textStyle: {
	                color: '#ffffff',
	                fontSize: 12,
	            },
		    },
		     color: ['#8776e9', '#5ba7f8'],
		    grid: {
	            x: 45,
	            y: 20,
	            x2: 40,
	            y2: 30,
			},
		    calculable : true,
		    xAxis : [
		        {
		        	axisLabel: { //坐标轴文本标签，详见axis.axisLabel
		                show: true,
		                interval: 0,
		                textStyle: {
		                    color: '#ffffff',
		                    fontSize: 10
		                }
		            },
		            axisLine:{
                        lineStyle:{
                            color:'#ffffff',
                            width:1,//这里是为了突出显示加上的
                        }
                    }, 
		            type : 'category',
		            data : inputArray,
		            splitLine: {
		                show: false,
		            },
		            
		        }
		    ],
		    yAxis : [
		        {
		        	 axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
		                 show: true,
		                 textStyle: {
		                     color: '#ffffff'
		                 },
		                 formatter: '{value} %',
		             },
		            type : 'value',
		            min: 0,
		            max: 100,
		            splitLine: {
		                show: false,
		            },
		        },
		        {
		        	 axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
		                 show: true,
		                 textStyle: {
		                     color: '#ffffff'
		                 },
		                 formatter: '{value}',
		             },
		            type : 'value',
		            min: -20,
		            max: 50
		        }
		    ],
		    series : [
		        {
		            name:'时段直通率',
		            type:'bar',
		            label: {
					      normal: {
					          show: true,
					          position: 'top',
					          textStyle: {
					            color: 'white'
					          }
					      }
					 },
		            data:outArray,
		            detail: {
		                formatter: '{value}%',
		                textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: '#ffffff',
		                    fontSize: 13
		                }
		            },
		           
		           
		        },
		        {
		            name:'不良PCS',
		            type:'line',
		            label: {
					      normal: {
					          show: true,
					          position: 'top',
					          textStyle: {
					            color: 'white'
					          }
					      }
					 },
					 yAxisIndex:1,
		            data:pcbArray,
		            detail: {
		                formatter: '{value}%',
		                textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: '#ffffff',
		                    fontSize: 13
		                }
		            },
		           
		        }
		    ]
		};

    myChart.setOption(option);
}

function rateInfoCharts(valueData){
	var myChart = echarts.init(document.getElementById('lineRate'));
	option = {
		    tooltip : {
		        formatter: "{a} <br/>{b} : {c}%"
		    },
		   
		    series : [
		        {
		            name:'总直通率',
		            type:'gauge',
		            min: 0,
		            max: 100,
		            splitNumber: 4,
		            radius: '64%',
		            center: ['55%', '50%'],
		            axisLine: {
		                lineStyle: {
		                    width: 3
		                }
		            },
		            splitLine: {
		                show: true,
		                length: 16,
		                lineStyle: {
		                    color: '#eee',
		                    width: 2,
		                    type: 'solid'
		                }
		            },
		            detail: {
		                formatter: '{value}%',
		                textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: '#ffffff',
		                    fontSize: 13
		                }
		            },
		            data:[{value: valueData, name: ''}]
		        }
		    ]
		};
	  myChart.setOption(option);                    
	
	
}

function ppmCharts(data){
	var xSize=new Array();
	var ySize=new Array();
	for(var i=0;i<data.length;i++){
		xSize.push(data[i].CA_ID);
		ySize.push((data[i].DIRECRT*100).toFixed(2));
	}
	if(xSize.length==0){
		xSize.push(0);
		ySize.push(0);
	}
	var myChart = echarts.init(document.getElementById('ppm'));
	option = {
		    calculable : true,
		    grid: {
		    	x: 45,
	            y: 30,
	            x2: 40,
	            y2: 30,
			},
			
			
		    xAxis : [
		        {
		        	axisLabel: { //坐标轴文本标签，详见axis.axisLabel
		                show: true,
		                interval: 0,
		                textStyle: {
		                    color: '#ffffff',
		                    fontSize: 10
		                }
		            },
		            axisLine:{
                        lineStyle:{
                            color:'#ffffff',
                            width:1,//这里是为了突出显示加上的
                        }
                    }, 
		            type : 'category',
		            data : xSize
		        }
		    ],
		    yAxis : [
		        {
		        	axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
		                 show: true,
		                 textStyle: {
		                     color: '#ffffff'
		                 },
		                 formatter: '{value}%' 
		             },
		            type : 'value',
		            min: 0,
		            max: 100,
		        }
		    ],
		    series : [
				        {
				            name:'时段产量',
				            type:'bar',
				            label: {
							      normal: {
							          show: true,
							          position: 'top',
							          textStyle: {
							            color: 'white'
							          }
							      }
							 },
				            data:ySize,
				            barWidth : 30
				          
				           
				        }
				    ]
				};
		                    
	  myChart.setOption(option);                    
	
	
}

function errorCodeCharts(xArray,yArray){
	var myChart = echarts.init(document.getElementById('errorCode'));
	option = {
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    grid: {
	            x: 30,
	            y: 20,
	            x2: 0,
	            y2: 40,
			},
		    legend: {
	        	orient:'horizontal',
	            x: 'left',
	            textStyle: {
	                color: '#ffffff',
	                fontSize: 10,
	            },
	            orient:'vertical',
	            data:xArray
	        },
	        color: ['#aace37', '#5ba7f8', '#ffc44f', '#e85a48','#27c156'],
		    calculable : true,
		    series : [
		        {
		            name:'访问来源',
		            type:'pie',
		            radius : '50%',
		            center: ['70%', '40%'],
		            itemStyle: {
		                normal: {
		                	label: {
		                        show: true,
		                        formatter: ' ({d}%)',
		                        textStyle: {
		                            color: '#ffffff',
		                            fontSize:10
		                        }
		                    },
		                    labelLine: {
		                        show: true,
		                        length:-10,
		                        color:'#ffffff'
		                    }
		                },
		                emphasis: {
		                    label: {
		                        show: true
		                    },
		                    labelLine: {
		                        show: true
		                    }
		                }
		            },
		            data:yArray,
		        }
		    ]
		};
		                    
		                    
	  myChart.setOption(option);                    
	
	
}

function dppmCharts(data){
	var xSize=new Array();
	var ySize=new Array();
	for(var i=0;i<data.length;i++){
		xSize.push(data[i].CA_ID);
		ySize.push((data[i].EFF*100).toFixed(2));
	}
	if(xSize.length==0){
		xSize.push(0);
		ySize.push(0);
	}
	var myChart = echarts.init(document.getElementById('dppm'));
	option = {
		    calculable : true,
		    grid: {
	            x: 45,
	            y: 30,
	            x2: 40,
	            y2: 30,
			},
			  color: ['#ffc44f', '#5ba7f8'],
		    xAxis : [
		        {
		        	axisLabel: { //坐标轴文本标签，详见axis.axisLabel
		                show: true,
		                interval: 0,
		                textStyle: {
		                    color: '#ffffff',
		                    fontSize: 10
		                }
		            },
		            axisLine:{
                        lineStyle:{
                            color:'#ffffff',
                            width:1,//这里是为了突出显示加上的
                        }
                    }, 
		            type : 'category',
		            data : xSize
		        }
		    ],
		    yAxis : [
		        {
		        	axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
		                 show: true,
		                 textStyle: {
		                     color: '#ffffff'
		                 },
		                 formatter: '{value} %',
		             },
		             
		            type : 'value',
		            min: 0,
		            max: 100,
		        }
		    ],
		    series : [
		        {
		            name:'线体效率',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                  
		                    label : {show: true, position: 'top',
		                   	 textStyle: {
		                            color: '#ffffff',
		                        },
		                     formatter: '{c}%'
		                   },
		                }
		            },
		            data:ySize,
		            barWidth : 30
		            
		        }
		       
		    ]
		};
		                    
	  myChart.setOption(option);                    
	
	
}
//添加画布内容
function addCanvasContenxt(){
	var setInfo;
	var caId=$("#workstation").val();
	for(var i=0;i<allAreaData.length;i++){
		if(caId==allAreaData[i].CA_ID){
			setInfo=allAreaData[i].WA_SET_INFO;
		}
	}
	if(setInfo!=undefined&&setInfo!=""&&setInfo!=null){
		var  jsonTemp=JSON.parse(setInfo);
		showDevice(jsonTemp);
	}
}
//展示内容
function showManageInfo(rsId,selected){
	if(rsId.indexOf("lineBegin")!=-1){
		var parentId=selected.parentId;
		getCkcAreaSn(rsId);
	}else if(rsId.indexOf("atchMachine")>0){
		return false;
	}else{
		$.ajax({
	        type: "post",
	        url: "${path}http/interface.ms?model=line&method=deviceDataSeting",
	        data: {
	        	deviceSn:rsId
	        },
	        dataType: "json",
	        success: function(data) {
	        	if(data[0].result=="snNotFindData"){
	        		utilsFp.confirmIcon(1,"","","", "sn找不到数据项配置",0,"260","");
	        		
	        	}else if(data[0].result=="resouceNull"){
	        		utilsFp.confirmIcon(1,"","","", "暂无数据",0,"260","");
	        		
	        	}else if(data[0].result=="snNull"){
	        		
	        		utilsFp.confirmIcon(1,"","","", "sn找不到",0,"260","");
	        	}
	        	else{
	        		addValueInfo(data[0].resultList);
	        	}
	        	// $(".pop4-box").show();
	        },
	        error: function(data) {
	            alert("系统错误！");
	        
	        }
	    });	
	}
	
}
//添加内容值
function addValueInfo(resultList){
	var resultListValue=resultList[0];
	var html="<tr>";
	
	var keyName=new Array();
	 for (var key in resultListValue){
		 keyName.push(key);
	 }
	 
	 if(resultList.length==1){
		 html="";
		 for(var i=0;i<keyName.length;i++){
			 html+="<tr>"+
			 		"<td>"+validateText(keyName[i])+"</td>"+
			 		"<td>"+validateText(resultList[0][keyName[i]])+"</td>"+
			 		"</tr>";
		 }
		 $("#stockInfo").html(html);
	     $(".pop4-box").show();
	     return false;
		 
	 }
	 
	 
	 for(var i=0;i<keyName.length;i++){
			html+="<td style='width:200px'>"+validateText(keyName[i])+"</td>";
		}
		$("#stockInfo").html(html);
		$(".pop4-box").show();
	for(var i=0;i<resultList.length;i++){
		html="<tr>";
		var result=resultList[i];
		for(var j=0;j<keyName.length;j++){
			html+="<td>"+validateText(resultList[i][keyName[j]])+"</td>";
		}
		html+="</tr>";
		$("#stockInfo").append(html);
	}
	
}

function getCkcAreaSn(areaSn){
	var areaSn = areaSn.replace("lineBegin", "");
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=line&method=GetCkcAreaSn",
        data: {
        	areaSn:areaSn
        },
        dataType: "json",
        success: function(data) {
        	var urlParam=""
        	if(data.length>0){
        		urlParam=data[0].CKC_SN;
        		window.open("${path}sys/report/FrepAction_showLReport.ms?ReportPathPram=formlet=line.frm&ReportPram=ID="+urlParam+"&title=线体看板&FUNC_CODE=F10671");
        	}else{
        		urlParam="";
        		utilsFp.confirmIcon(1,"","","", "该线别看板未配置",0,"260","");
        	}
        	
        },
        error: function(data) {
            alert("系统错误！");
        
        }
    });
	
}
//隐藏内容
function hideInfo() {
    $(".pop4-box").hide();
    $(".pop6-box").hide();
}

function validateText(textValue){
	if((textValue==undefined)||(textValue=="")||(textValue=="null")||(textValue==null)){
		return "";
	}else{
		return textValue;
	}
}
</script>

</head>
 <body style="min-width: 1300px;height: 100%"> 
 <input type="hidden" id="dataAuth" name="dataAuth" value='${sessionScope.mcDataAuth}'/>
  <div class="body-head" > 
    <img src="${path}buss/images/logo_blue.png" style="height: 30px;float: left" /> 
   <div class="body-head-title" style="">
   MES车间监控系统
   </div> 
  </div> 
  <div class="wrap"> 
   <div class="con1" > 
   		 <div class="con1-title"> 五大不良</div>
   		  <div id="errorCode" class="con1-charts" style="width: 95%;height: calc(100% - 17px)"></div> 
   	
   </div> 
  	<div class="con1" > 
    <div class="con1-title">
    	线体效率
    </div> 
    <div class="con1-charts" id="dppm" style="width: 100%;height: calc(100% - 17px)"></div> 
   
   </div> 
   <div class="con1" > 
   <div class="con1-title" >
    	总直通率
    </div> 
    <div id="lineRate" class="con1-charts" style="width: 100%;height: calc(100% - 17px)"></div> 
   </div> 
    <div class="con2"  > 
    <div class="con1-title">
    	线体直通率
    </div> 
    <div id="ppm" class="con1-charts" style="width: 100%;height: calc(100% - 17px)"></div> 
   
   </div> 
   
  </div> 
  <div class="pop"> 
   <div class="pop-left">
    <div class="con1" style="width: 100%;height:45% "> 
   <div class="con1-title">
    	时段产量
    </div>
     
    <div id="productionInfo" class="con1-charts" style="width: 100%;height: 90%"></div> 
   </div> 
 	<div class="con1" style="width: 100%;height:45%"> 
   <div class="con1-title">
    	时段直通率
    </div> 
    <div id="periodThroughRate" class="con1-charts" style="width: 100%;height: 90%"></div> 
   </div> 
    
   </div> 
   <div class="pop-contain" id="container"></div> 
   <div class="bgRight"> 
    
   </div> 
  </div> 
 
 	<div class="bgRight">
 	<label style="margin-left: 400px;font-size: initial;">车间选择</label>
   <select class="styled-select"  id="workstation" onchange="areaChange()">
   		
   </select>
 	</div>
 	<div class="pop4-box" id="stockText" style="height: 450px;top:38%;width: 30%;margin-left: -16%;"> 
    <div style="width:100%;"> 
     <a class="btn-close" onclick="hideInfo()" style="float:right"></a> 
    </div>
    <div  id='scroll-2'>
    <table class="table" border="0" "="" bgcolor="" style="font-size: 13px;color:#ffffff;margin:10px ">  
     <tbody id="stockInfo">  
     </tbody>
    </table> 
    </div>
   </div> 
 </body>
</html>
  