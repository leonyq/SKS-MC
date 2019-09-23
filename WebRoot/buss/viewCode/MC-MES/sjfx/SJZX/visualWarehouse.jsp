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
	 <%@ include file="/plf/common/pub_meta.jsp"%>
    <%@ include file="/buss/inc_files/inc_dev.jsp"%>	
    <title>
		<dict:lang value="MES仓库可视化" />
    </title>
<script type="text/javascript" src="${path}buss/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/three.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/TrackballControls.js"></script>
<script type="text/javascript" src="${path}buss/js/three/OrbitControls.js"></script>
<script type="text/javascript" src="${path}buss/js/three/CSS3DRenderer.js"></script>
<script type="text/javascript" src="${path}buss/js/three/tween.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/stats.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/calculation.js?version=<%=CALCULATION %>"></script>
<link href="${path}buss/css/css.css" type="text/css" rel="stylesheet" />
<style>
    html,body{
        height:100%;
    }

    .wrap{
        height: calc(100% / 3 - 10px);
    }
    
    .pop {
        color: #ffffff;
        width: 100%;
        height: calc(200% / 3 - 20px);
        position: relative;
    }
    
    .pop-left {
        width: 20%;
        float: left;
        height: 100%;
    }
    
    .pop-contain {
        width: calc(80% - 20px);
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
        top: 10px;
        left: calc(20% + 10px);
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
        width: calc(20% - 20px);
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
        width: calc(100% - 20px);
        border: 1px solid #fff;
        opacity: 0.8;
        float: left;
        height: calc(50% - 20px);
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
</style>
<script src="${path}buss/js/echarts.min.js"></script>
<script src="${path}buss/js/SimpleTree.js"></script>
<script src="${path}buss/js/slide.js"></script>
<script type="text/javascript" src="${path}buss/js/three/wms/wmsThree.js?version=<%=WMS_THREE %>"></script>
 <script type="text/javascript" src="${path}buss/js/three/fonts/helvetiker_regular.typeface.js"></script>
<script type="text/javascript">
var dataJson;
$(function() {

    var a = $("#dataAuth").val();
    console.log(a);
	var setting = {
		callback: {
			onClick: onclickMethod
		}
	};
	initThree("container", setting);//初始化画布
	initControls();//初始化控制器
	initObject();//加载模型货架
	animate();//
	queryAllArea();
	var allAreaData;
	var areaPosition;
	var shelvesData;
	
	//queryPositionData();//后台位置数据
	var t = setTimeout(function() {
		$(".pop3-box").hide();
	},
	1000);
	
});
/**
 * 告警类型
 */
 
function showAlarmType(data) {
	var dataArray=new Array();
	var over={"value":data[0].OVERDUE,"name":"品质超期"};
	var dull={"value":data[0].REINSPECTION,"name":"复检超期"};
	var overStock={"value":data[0].INACTIVE,"name":"呆滞物料"};
	var untest={"value":data[0].BADNESS,"name":"不良物料"};
	dataArray.push(over);
	dataArray.push(dull);
	dataArray.push(overStock);
	dataArray.push(untest);
    var myChart = echarts.init(document.getElementById('alarmType'));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        color: ['red', '#ffffff', 'yellow', '#01a25e'],
        legend: {
        	orient:'horizontal',
            x: 'left',
            textStyle: {
                color: '#ffffff',
                fontSize: 10,
            },
            data: ['品质超期', '复检超期', '呆滞物料', '不良物料']
        },
        grid: {
            x: 0,
            y: 0
        },
        series: [{
            name: '警报级别',
            type: 'pie',
            radius: ['40%', '50%'],
            center: ['50%', '55%'],
            avoidLabelOverlap: false,
            itemStyle : {
                normal : {
                    label : {
                        show : true,
                        formatter: ' {c}({d}%)' 
                    },
                    labelLine : {
                        show : true,
                        length:-10
                    }
                }
            },
            data:dataArray
        }]
    };
    myChart.setOption(option);
}
/**
 * 货架空闲数
 */
function showIdleBit(data) {
	var xsiaData =new Array();
	var ysiaData =new Array();
	for(var i=0;i<data.length;i++){
		xsiaData.push(data[i].WSI_ITEM_CODE);
		ysiaData.push(data[i].ITEM_NUM);
	}
	var myChart = echarts.init(document.getElementById('idleBit'));
    option = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['']
        },
        grid: {
            x: 60,
            y: 18,
            x2: 0,
            
		},
        calculable: true,
        xAxis: [{
            axisLabel: { //坐标轴文本标签，详见axis.axisLabel
                show: true,
                interval: 0,
                rotate: 16,
                textStyle: {
                    color: '#ffffff'
                }
            },
            type: 'category',
            data: xsiaData,
            textStyle: {
                color: '#fff'
            }
        }],
        yAxis: [{
            axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
                show: true,
                textStyle: {
                    color: '#ffffff'
                }
            },
            type: 'value'
        }],
        series: [{
            name: '前五大呆滞',
            type: 'bar',
            itemStyle: {
                normal: {
                    color: "#C1232B",
                    label : {show: true, position: 'top',
                   	 textStyle: {
                            color: '#ffffff',
                        }	
                   },
                }
            },
            data: ysiaData,
        },
        ]
    };
	
    myChart.setOption(option);

}

/**
 * 前五大空置率
 */
function getControlRate(data) {
	var xsiaData =new Array();
	var ysiaData =new Array();
	for(var i=0;i<data.length;i++){
		xsiaData.push(data[i].WA_AREA_SN);
		ysiaData.push(data[i].EMPTY);
	}
	var myChart = echarts.init(document.getElementById('controlRateNext'));
    option = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['']
        },
        grid: {
            x: 30,
            y: 15,
            x2: 0,
            y2:30
		},
        calculable: true,
        xAxis: [{
            axisLabel: { //坐标轴文本标签，详见axis.axisLabel
                show: true,
                interval: 0,
                rotate: 16,
                textStyle: {
                    color: '#ffffff'
                }
            },
            type: 'category',
            data: xsiaData,
            textStyle: {
                color: '#fff'
            }
        }],
        yAxis: [{
            axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
                show: true,
                textStyle: {
                    color: '#ffffff'
                }
            },
            type: 'value'
        }],
        series: [{
            name: '前五大空置率',
            type: 'bar',
            itemStyle: {
                normal: {
                    color: "#2a51f7",
                    label : {show: true, position: 'top',
                   	 textStyle: {
                            color: '#ffffff',
                        }	
                   },
                }
            },
            data: ysiaData,
        },
        ]
    };
	
    myChart.setOption(option);

}

/**
 * 货架使用率
 */
function showUseRate(data) {
	var dataArray=new Array();
	var empty=data[0].PERCENT;
	if(empty==null||empty=="null"){
		var object={"value":0};
		dataArray.push(object);
	}else{
		var object={"value":empty};
		dataArray.push(object);
	}
	
    var myChart = echarts.init(document.getElementById('useRate'));
    option = {
        tooltip: {
            formatter: "{a} <br/>{b} : {c}%"
        },

        grid: {
            x: 0,
            y: 0
        },
        series: [{
            name: '货架使用率',
            type: 'gauge',
            min: 0,
            max: 100,
            splitNumber: 4,
            radius: '60%',
            center: ['50%', '50%'],
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
            data: dataArray
        }]
    };
    myChart.setOption(option);
}
/**
 * 库存周转率
 */
function showInventoryTurnover(data) {
	var xsiaData =new Array();
	var ysiaData =new Array();
	for(var i=0;i<data.length;i++){
		xsiaData.push(data[i].TOI_MONTH);
		ysiaData.push(data[i].PERCENT);
	}
    
    var myChart = echarts.init(document.getElementById('dullDay'));
    option = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['']
        },
        grid: {
            x: 30,
            y: 10,
            x2: 10,
            y2: 20
        },
        calculable: true,
        xAxis: [{
            axisLabel: { //坐标轴文本标签，详见axis.axisLabel
                show: true,
                interval: 0,
                textStyle: {
                    color: '#ffffff'
                }
            },
            type: 'category',
            data: xsiaData,
            textStyle: {
                color: '#fff'
            }
        }],
        yAxis: [{
            axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
                show: true,
                textStyle: {
                    color: '#ffffff'
                }
            },
            type: 'value'
        }],
        series: [{
            name: '库存周转率',
            type: 'bar',
            itemStyle: {
                normal: {
                    color: '#3E98C5',
                    label : {show: true, position: 'top',
                    	 textStyle: {
                             color: '#ffffff'
                         }	
                    },
                   
                }
            },
            data: ysiaData,
        },
        ]
    };

    myChart.setOption(option);

}
/**
 * 收料任务
 */
function showMaterialReceiving(data) {
	var dataArray=new Array();
	var labelName=new Array();
	for(var i=0;i<data.length;i++){
		var dataArrayTemp={"value":data[i].COUNT,"name":data[i].STATUS};
		var labelTemp=data[i].STATUS;
		dataArray.push(dataArrayTemp);
		labelName.push(labelTemp);
	}
	var myChart = echarts.init(document.getElementById('receiving'));
    option = {
        tooltip: {
        	show:true,
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        color: ['#00c66b','#f8d72b', '#2a51f7', ''],
        legend: {
        	orient:'horizontal',
            x: 'left',
            textStyle: {
                color: '#ffffff',
                fontSize: 10,
            },
            data: ['开立', '操作中', '关结']
        },
        calculable: true,
        series: [{
            name: '收料任务',
            type: 'pie',
            radius: '60%',
            center: ['50%', '50%'],
            itemStyle: {
                normal: {
                	
                	label: {
                        show: true,
                        formatter: ' {d}%',
                        textStyle: {
                            color: '#ffffff'
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
            data: dataArray
        }]
    };

    myChart.setOption(option);
}
/**
 * 发料任务
 */
function showMaterialIssue(data) {
	var dataArray=new Array();
	var labelName=new Array();
	for(var i=0;i<data.length;i++){
		var dataArrayTemp={"value":data[i].COUNT,"name":data[i].STATUS};
		var labelTemp=data[i].STATUS;
		dataArray.push(dataArrayTemp);
		labelName.push(labelTemp);
	}
    var myChart = echarts.init(document.getElementById('issue'));
    option = {

        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        color: ['#00c66b','#f8d72b', '#2a51f7', ''],
        legend: {
        	orient:'horizontal',
            x: 'left',
            textStyle: {
                color: '#ffffff',
                fontSize: 10,
            },
            data:['开立', '操作中', '关结']
        },
        calculable: true,
        series: [{
            name: '发料任务',
            type: 'pie',
            radius: '60%',
            center: ['50%', '50%'],
            itemStyle: {
                normal: {
                	label: {
                        show: true,
                        formatter: ' {d}%',
                        textStyle: {
                            color: '#ffffff'
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
            data: dataArray
        }]
    };

    myChart.setOption(option);
}
/**
 * 库存图表
 */
function showStock(data) {
	var xsiaData =new Array();
	var ysiaData =new Array();
	for(var i=0;i<data.length;i++){
		xsiaData.push(data[i].WSI_ITEM_CODE);
		ysiaData.push(data[i].COUNT);
	}
    var myChart = echarts.init(document.getElementById('stock'));
    option = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['']
        },
       grid: {
            x: 55,
            y: 18,
            x2: 0,
            y2:35
		},
        calculable: true,
        xAxis: [{
            axisLabel: { //坐标轴文本标签，详见axis.axisLabel
                show: true,
                rotate: 16,
                interval: 0,
                textStyle: {
                    color: '#ffffff',
                    fontSize: 10
                }
            },
            type: 'category',
            data: xsiaData,
            textStyle: {
                color: '#fff'
            }
        }],
        yAxis: [{
            axisLabel: { // 坐标轴文本标签，详见axis.axisLabel
                show: true,
                textStyle: {
                    color: '#ffffff'
                }
            },
            type: 'value'
        }],
        series: [{
        	
            name: '前五大库存',
            type: 'bar',
            itemStyle: {
                normal: {
                    color: '#f8d72b',
                    label : {show: true, position: 'top',
                      	 textStyle: {
                               color: '#ffffff',
                               fontSize: 12
                           }	
                      },
                }
            },
            data: ysiaData,
        },
        ]
    };

    myChart.setOption(option);

}
/**
*单击模型的时候触发事件 
*/

function onclickMethod(objectValue,event) {
	if(event.button==2){
		return false;
	}else{
		localStorage.rsId=objectValue.rsId;
		localStorage.layer=objectValue.layer;
		localStorage.starogeType=objectValue.starogeType;
    	window.open("${path}buss/bussModel.ms?exeid=40b2851df3024e78a826b966ea724ae9", "_self")
	}
	
}
/**
*页面加载模型
*/

var shelvesPisitionData=new Array();
var moreArray=new Array();//更多选项

function addObejct(data) {
	shelvesPisitionData.length=0;
	moreArray.length=0;
	for(var i=0;i<data.length;i++){
		if (data[i].type == 1) {
			var resultData=sortInfo(data[i].id,shelvesData);
			addStorageInfo(data[i].layerType,resultData,2,data[i].rank,data[i].positionX,data[i].positionY,data[i].positionZ,data[i].rsId);
		}
	}
	loadObject(shelvesPisitionData);
	console.log(moreArray);
	addMoreInfoGeo();
	var loader = new THREE.JSONLoader();
	loader.load("${path}buss/js/model/shelvesBlueOne/shelvesBlueOne.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type == 1)&&(data[i].layerType==1)&&(data[i].starogeType!=1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],1.28);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	loader.load("${path}buss/js/model/shelvesBlueTwo/shelvesBlueTwo.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type == 1)&&(data[i].layerType==2)&&(data[i].starogeType!=1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
	});
	loader.load("${path}buss/js/model/shelvesBlueThree/shelvesBlueThree.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type == 1)&&(data[i].layerType==3)&&(data[i].starogeType!=1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
			}
		}
	});
	loader.load("${path}buss/js/model/shelvesBlueFour/shelvesBlueFour.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type ==1)&&(data[i].layerType==4)&&(data[i].starogeType!=1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	
	loader.load("${path}buss/js/model/shelvesBlueFiver/shelvesBlueFiver.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type ==1)&&(data[i].layerType==5)&&(data[i].starogeType!=1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	
	
	loader.load("${path}buss/js/model/shelvesBlueSix/shelvesBlueSix.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type ==1)&&(data[i].layerType==6)&&(data[i].starogeType!=1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	
	loader.load("${path}buss/js/model/shelvesBlueSeven/shelvesBlueSeven.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type ==1)&&(data[i].layerType==7)&&(data[i].starogeType!=1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	
	
	//添加电子货架
	loader.load("${path}buss/js/model/shelvesBlueTwoLong/shelvesBlueTwoLong.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type == 1)&&(data[i].layerType==2)&&(data[i].starogeType==1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
	});
	loader.load("${path}buss/js/model/shelvesBlueThreeLong/shelvesBlueThreeLong.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type == 1)&&(data[i].layerType==3)&&(data[i].starogeType==1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
	});
	loader.load("${path}buss/js/model/shelvesBlueFourLong/shelvesBlueFourLong.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type ==1)&&(data[i].layerType==4)&&(data[i].starogeType==1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	
	loader.load("${path}buss/js/model/shelvesBlueFiverLong/shelvesBlueFiverLong.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type ==1)&&(data[i].layerType==5)&&(data[i].starogeType==1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	
	
	loader.load("${path}buss/js/model/shelvesBlueSixLong/shelvesBlueSixLong.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type ==1)&&(data[i].layerType==6)&&(data[i].starogeType==1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	
	loader.load("${path}buss/js/model/shelvesBlueSevenLong/shelvesBlueSevenLong.js", function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
		for (var i = 0; i < data.length; i++) {
			if ((data[i].type ==1)&&(data[i].layerType==7)&&(data[i].starogeType==1)) {
				var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
				addShelvesProperty(obj,data[i],0.5);
				obj.rsId = data[i].rsId;
    	        obj.layer=data[i].layerType;
    	        obj.starogeType=data[i].starogeType;
				
				
			}
		}
		
	});
	
	
	
	
	
	
	
	//loadObject(dataJson);
}
//添加货架信息
function addShelvesProperty(obj,property,scale){
	  obj.position.set(property.positionX,property.positionY,property.positionZ);
      obj.scale.x = scale; 
      obj.scale.y = scale;
      obj.scale.z = scale;
      obj.rotation.x = property.rotationX;
      obj.rotation.y = property.rotationY;
      obj.add=0;
      obj.rsId=property.rsId;
      obj.rank="transverse";
      obj.id=property.id;
      obj.layerType=property.layerType;
      obj.type=1;
      objects.push(obj);
      scene.add(obj);
	 
}


/**
*加载模型方法
*/

function loadObject(data) {
	var loader = new THREE.JSONLoader();
    loader.load("${path}buss/js/model/locationGray/locationGray.js",function(geometry, materials) {
		var faceMaterial = new THREE.MeshFaceMaterial(materials);
        for (var i = 0; i < data.length; i++) {
            if ((data[i].type == 2)&&(data[i].DULL==null||data[i].DULL=='正常')) {
                var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
                obj.position.set(data[i].positionX,data[i].positionY+100,data[i].positionZ+30);
                obj.scale.x =data[i].scaleX;
                obj.scale.y =data[i].scaleY;
                obj.scale.z =data[i].scaleZ;
                obj.rsId = data[i].rsId;
                obj.layer=data[i].layer;
                obj.starogeType=data[i].starogeType;
                obj.rotation.x = 3.14 / 2;
                objects.push(obj);
                scene.add(obj);
            }
        }

    });
    
    loader.load("${path}buss/js/model/locationRed/locationRed.js",function(geometry, materials) {
    			var faceMaterial = new THREE.MeshFaceMaterial(materials);
    	        for (var i = 0; i < data.length; i++) {
    	            if ((data[i].type == 2)&&(data[i].DULL=='不良品')) {
    	                var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
    	                obj.position.set(data[i].positionX,data[i].positionY+100,data[i].positionZ+30);
    	                obj.scale.x =data[i].scaleX;
    	                obj.scale.y =data[i].scaleY;
    	                obj.scale.z =data[i].scaleZ;
    	                obj.rsId = data[i].rsId;
    	                obj.layer=data[i].layer;
    	                 obj.starogeType=data[i].starogeType;
    	                obj.rotation.x = 3.14 / 2;
    	                objects.push(obj);
    	                scene.add(obj);
    	            }
    	        }

    	    });
    
    loader.load("${path}buss/js/model/locationYellow/locationYellow.js",function(geometry, materials) {
    			var faceMaterial = new THREE.MeshFaceMaterial(materials);
    	        for (var i = 0; i < data.length; i++) {
    	            if ((data[i].type == 2)&&(data[i].DULL=='呆滞')) {
    	                var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
    	                obj.position.set(data[i].positionX,data[i].positionY+100,data[i].positionZ+30);
    	                obj.scale.x =data[i].scaleX;
    	                obj.scale.y =data[i].scaleY;
    	                obj.scale.z =data[i].scaleZ;
    	                obj.rsId = data[i].rsId;
    	                obj.layer=data[i].layer;
    	                obj.starogeType=data[i].starogeType;
    	                obj.rotation.x = 3.14 / 2;
    	                objects.push(obj);
    	                scene.add(obj);
    	            }
    	        }

    	    });
    loader.load("${path}buss/js/model/locationBlue/locationBlue.js",function(geometry, materials) {
    			var faceMaterial = new THREE.MeshFaceMaterial(materials);
    	        for (var i = 0; i < data.length; i++) {
    	            if ((data[i].type == 2)&&(data[i].free=="呆料三个月")) {
    	                var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
    	                obj.position.set(data[i].positionX,data[i].positionY+100,data[i].positionZ+30);
    	                obj.scale.x =data[i].scaleX;
    	                obj.scale.y =data[i].scaleY;
    	                obj.scale.z =data[i].scaleZ;
    	                obj.rsId = data[i].rsId;
    	                obj.layer=data[i].layer;
    	                obj.starogeType=data[i].starogeType;
    	                obj.rotation.x = 3.14 / 2;
    	                objects.push(obj);
    	                scene.add(obj);
    	            }
    	        }

    	    });
}

/**
 * 后台查询库区空位数目
 */
function queryFreeDull(){
	  $.ajax({
	        type: "post",
	        url: "${path}http/interface.ms?model=GetDullStock&method=GetDullStockFunc",
	        data: {areaSn:$("#areaPlace").val()},
	        dataType: "json",
	        success: function(data) {
	        	showIdleBit(data);//空位柱状图
	        	
	        },
	        error: function(data) {
	        	alert("系统错误！");
	        }
	    });
}

/**
 * 后台查询库存
 */
function queryStockRank(){
	 $.ajax({
	        type: "post",
	        url: "${path}http/interface.ms?model=GetStockRank&method=GetStockRankFunc",
	        data: {areaSn:$("#areaPlace").val()},
	        dataType: "json",
	        success: function(data) {
	        	
	        	showStock(data);//空位柱状图
	            
	        },
	        error: function(data) {
	        console.log("GetStockRank"+data);
	            alert("系统错误！");
	        }
	    });
}
/**
 * 呆滞天数查询
 */
function queryInventoryTurnover(){
	 $.ajax({
	        type: "post",
	        url: "${path}http/interface.ms?/InventoryTurnover.ashx",
	        data:{areaSn:$("#areaPlace").val()},
	        dataType: "json",
	        success: function(data) {
	        	showInventoryTurnover(data);
	        },
	        error: function(data) {
	        	 console.log("InventoryTurnover"+data);
	            alert("系统错误！");
	        }
	    });
}
/**
 * 查询收料完成
 */
function queryMaterialReceiving(){
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=PoInCount&method=PoInCountFunc",
        data: {areaSn:$("#areaPlace").val()},
        dataType: "json",
        success: function(data) {
        	showMaterialReceiving(data);
        },
        error: function(data) {
        	console.log("PoInCount"+data);
            alert("系统错误！");
        
        }
    });
	/*  $.ajax({
	        type: "post",
	        url: "${path}http/interface.ms?model=PoInCount&method=PoInCountFunc",
	        data: {areaSn:$("#areaPlace").val()},
	        dataType: "json",
	        success: function(data) {
	        	
	        	showMaterialReceiving(data);//收料图表(data);
	        },
	        error: function(data) {
	            alert("系统错误！");
	            console.log("PoInCount"+data);
	        }
	    }); */
}

function queryMaterialIssue(){
	 $.ajax({
	        type: "post",
	        url:"${path}http/interface.ms?model=ProjectOutCount&method=ProjectOutCountFunc",
	         data: {areaSn:$("#areaPlace").val()},
	        dataType: "json",
	        success: function(data) {
	        	showMaterialIssue(data);//发料图表(data)
	        },
	        error: function(data) {
	            alert("系统错误！");
	            console.log("PoInCount"+data);
	        }
	    });
}
/**
 * 货架使用率查询
 */
function queryUseRate(){
	 $.ajax({
	        type: "post",
	        url:"${path}http/interface.ms?model=UseRate&method=UseRateFunc",
	         data: {areaSn:$("#areaPlace").val()},
	        dataType: "json",
	        success: function(data) {
	        	showUseRate(data);//货架使用率图表
	        },
	        error: function(data) {
	            alert("系统错误！");
	        }
	    });
}
function queryAlarmType(){
	 $.ajax({
	        type: "post",
	        url:"${path}http/interface.ms?model=Alarm&method=AlarmFunc",
	         data: {areaSn:$("#areaPlace").val()},
	        dataType: "json",
	        success: function(data) {
	        	showAlarmType(data);//告警饼图
	        },
	        error: function(data) {
	            alert("系统错误！");
	        }
	    });
}
/**
 *读取后台位置数据
 */
function queryPositionData(){
	if(dataJson!=undefined){
		dataJson.length=0;
	}
	localStorage.areaPlace=$("areaPlace").val();
	removeObejectFromScene();
	var wmsSn=$("#areaPlace").val();
	for(var i=0;i<allAreaData.length;i++){
		 localStorage.wmsSn=wmsSn;
		if(wmsSn==allAreaData[i].WA_AREA_SN){
			var  jsonTemp=isJSON(allAreaData[i].WA_SET_INFO);
			if(jsonTemp){
				  var jsObject = JSON.parse(allAreaData[i].WA_SET_INFO); 
				  dataJson=jsObject;
				  localStorage.areaPosition=allAreaData[i].WA_SET_INFO;
				  
			}
		}
	}
	comparyInfo();
	showReportInfo();
}

function queryAreamInfo(){
	 $.ajax({
	       type: "post",
	       url: "${path}http/interface.ms?/WmsArea.ashx",
	       data: {},
	       dataType: "json",
	       success: function(data) {
	    	   comparyInfo(data);
	       },
	       error: function(data) {
	           alert("系统错误！");
	       }
	   });
}

function comparyInfo(data){
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=WarehouseInventory&method=WarehouseInventoryFunc",
        data: {areaSn:$("#areaPlace").val(),
        	areaType:2
        },
        dataType: "json",
        success: function(data) {
        	shelvesData=data;
        	var newDataArray=new Array();
        	for(var i=0;i<dataJson.length;i++){
				positionTemp=dataJson[i].id.trim();
				for(var j=0;j<data.length;j++){
					dataTemp=data[j].WSI_STORAGE_CODE.trim();
					if((positionTemp==dataTemp)){
						if(data[j].WSI_ITEM_FLAG=='不良品'){
							dataJson[i].DULL='不良品';
						}else if(data[j].DULL=='呆滞'){
							dataJson[i].DULL=data[j].DULL;
						}else{
							dataJson[i].DULL='良品';
						}
						
						newDataArray.push(dataJson[i]);	
					}
				}
				if(dataJson[i].type==1){
				newDataArray.push(dataJson[i]);	
				}
			}	
			dataJson=newDataArray;
        	if(dataJson==undefined){
				return false;
			}
			addObejct(dataJson);
        	localStorage.areaPlace=$("#areaPlace").val();
        },
        error: function(data) {
            alert("系统错误！");
        }
    });


	
}
/**
* 查询所有仓库
*/  
function queryAllArea(){

var dataAuth = $("#dataAuth").val();
	$.ajax({
		type : "post",
		url : "${path}http/interface.ms?model=GetWhcode&method=GetWhcodeFunc",
		data : {'dataAuth':dataAuth},
		dataType : "json",
		success : function(data) {
			allAreaData=data;
			var html="";
			if(localStorage.wmsSn==undefined){
				localStorage.wmsSn="";
			}
			
			for(var i=0;i<data.length;i++){
				if(data[i].WA_AREA_SN==localStorage.wmsSn){
					html+="<option value='"+data[i].WA_AREA_SN+"' selected='selected'>"+data[i].WA_AREA_NAME+"</option>";
				}else{
					html+="<option value='"+data[i].WA_AREA_SN+"'>"+data[i].WA_AREA_NAME+"</option>";
				}
				
			}
			$("#areaPlace").html(html);
			allAreaData=data;
			queryPositionData();
			
		},
		error : function(data) {
			alert("系统错误！");
		}
	});
}


function isJSON(str) {
    if (typeof str == 'string') {
        try {
            JSON.parse(str);
            return true;
        } catch(e) {
            
            return false;
        }
    }
}

/**
 * 查询空置率
 */
function queryGetControlRate(){
	 $.ajax({
	        type: "post",
	        url:"${path}http/interface.ms?model=GetControlRate&method=GetControlRateFunc",
	         data: {areaSn:$("#areaPlace").val()},
	        dataType: "json",
	        success: function(data) {
	        	getControlRate(data);
	        },
	        error: function(data) {
	            alert("系统错误！");
	        }
	    });

}

function showReportInfo(){
	queryFreeDull();//查询前五大呆滞
	queryStockRank();//查询库存
	queryMaterialReceiving();//收料任务
	queryMaterialIssue();//发料任务
	queryUseRate();//货架使用率
	queryAlarmType();//警报分类查询
	queryGetControlRate();
	queryWarehouseInventory();

}

/**
 * 查询货架情况
 */
 
 function queryWarehouseInventory(){
 	
 }
 /**
 * 信息展示
 */
 function infoDetail(){
 	var classValue=$("#infoDetail").attr("class");
 	if(classValue=="btn6"){
 		$("#infoDetail").attr("class","btn5");
 		$(".btn").hide();
 		$("#areaPlace").hide();
 		$("#infoValue").hide();
 	}else{
 		$("#infoDetail").attr("class","btn6");
 		$(".btn").show();
 		$("#areaPlace").show();
 		$("#infoValue").show();
 	}
 }
 
/**
 * 添加货位位置
 */

				
function addStorageInfo(layerTypeValue,resultData,stoType,rank,positionX,positionY,positionZ,rsId){
	if(resultData.faceA!=undefined&&resultData.faceA=="A"){
		addStorageInfoPistion(layerTypeValue,resultData.layer,rank,positionX,positionY,positionZ,stoType,"A",resultData.positiveSize,rsId);
	}
	if(resultData.faceB!=undefined&&resultData.faceB=="B"){
		addStorageInfoPistion(layerTypeValue,resultData.layer,rank,positionX,positionY,positionZ,stoType,"B",resultData.otherSide,rsId);
	}
	if(resultData.faceC!=undefined&&resultData.faceS=="S"){
			addStorageInfoPistion(layerTypeValue,resultData.layer,rank,positionX,positionY,positionZ,stoType,"S",resultData.singleSide,rsId);
	}
}
/**
 * 添加货位位置
 */
function addStorageInfoPistion(layerTypeValue,layerHeight,rank,objectX,ObjectY,positionZ,stoType,faceA,TempValue,rsId){
	var ObjectArrayNext=new Array();
	layerHeight=layerTypeValue;
	var layer=layerHeight;
	var buttomHeight=115;
	var nextPisition=160;
	if((faceA!=undefined)&&(faceA=="S"||faceA=="A")){
		if(rank=="transverse"){
			nextPisition=160;
		}else{
			nextPisition=70;
		}
		
	}else{
		if(rank=="transverse"){
			nextPisition=-160;
		}else{
			nextPisition=-70;
		}
	}
	
	switch(layerHeight)
			{
			 case 1:layerHeight=450;buttomHeight=400;
			 break;
			 case 2:layerHeight=860;
			 break;
			 case 3:layerHeight=430;
				 break;
			 case 4:layerHeight=290;
				 break;
			case 5:layerHeight=215;
				 break;
			case 6:layerHeight=176;
				 break;
			case 7:layerHeight=146;
				 break;
			 default: break;  
			}
	for(var i=1;i<=layer;i++){
		var tempFace=faceA+i;
		if(TempValue[tempFace].length>0){
			var tempObjectArray=TempValue[tempFace];
			var tempLength=tempObjectArray.length;
			var starogeType=tempObjectArray[0].starogeType;
			var baseX=500;
			if(tempLength>10){
				tempLength=10;
			}
			if(starogeType==1){
				baseX=1500;
				tempLength=tempObjectArray.length;
				if(tempLength>30){
					tempLength=20;
					if(rank=="transverse"){
						positionObject={
						scaleX:0.1,
						scaleY:0.3,
						scaleZ: 0.1,
						id:tempObjectArray[31].arsn,
						rsId:tempLength,
						type:2,
						positionX:objectX+31*90-baseX,
						positionY:ObjectY-nextPisition,
						positionZ:buttomHeight + (i - 1) * layerHeight,
						DULL:tempObjectArray[31].dull,
						rsId:rsId,
						layer:layer,
						starogeType:starogeType
						};
						moreArray.push(positionObject);
					}else{
						positionObject={
						scaleX:0.1,
						scaleY:0.3,
						scaleZ: 0.1,
						id:tempObjectArray[31].arsn,
						rsId:tempLength,
						type:2,
						positionX:objectX-nextPisition,
						positionY:ObjectY+ +31*90-baseX,
						positionZ:buttomHeight + (i - 1) * layerHeight,
						DULL:tempObjectArray[31].dull,
						rsId:rsId,
						layer:layer,
						starogeType:starogeType
					};
						moreArray.push(positionObject);
					}
					
				}
				
			}
			for(var j=0;j<tempLength;j++){
				if(stoType==2){
					stoType=1;
				}else{
					stoType=0.3;
				}
				var positionObject;
				if(rank=="transverse"){
					positionObject={
					scaleX:0.1,
					scaleY:0.3,
					scaleZ: 0.1,
					id:tempObjectArray[j].arsn,
					rsId:tempLength,
					type:2,
					positionX:objectX+j*90-baseX,
					positionY:ObjectY-nextPisition,
					positionZ:buttomHeight + (i - 1) * layerHeight,
					DULL:tempObjectArray[j].dull,
					rsId:rsId,
					layer:layer,
					starogeType:starogeType
					};
				}else{
					positionObject={
					scaleX:0.1,
					scaleY:0.3,
					scaleZ: 0.1,
					id:tempObjectArray[j].arsn,
					rsId:tempLength,
					type:2,
					positionX:objectX-nextPisition,
					positionY:ObjectY+ +j*90-baseX,
					positionZ:buttomHeight + (i - 1) * layerHeight,
					DULL:tempObjectArray[j].dull,
					rsId:rsId,
					layer:layer,
					starogeType:starogeType
					};
				}
				
				
				ObjectArrayNext.push(positionObject);
				shelvesPisitionData.push(positionObject);
			}
		}
	}
	
	
}
/**
 * 添加更多货位信息
 */
function addMoreInfoGeo(){
	var geometry = new THREE.BoxGeometry(30,30,30,1,1,1);
	 var planeMaterial = new THREE.MeshLambertMaterial({ color: 0xff0000 });
	 	for(var i=0;i<moreArray.length;i++){
	 		var mesh = new THREE.Mesh( geometry,planeMaterial );
        	mesh.position.set(moreArray[i].positionX,moreArray[i].positionY-50,moreArray[i].positionZ);
        	 objects.push(mesh);
       	 	scene.add(mesh);
	 	}
}

</script>
</head>
 <body style="min-width: 1300px"> 
 <input type="hidden" id="dataAuth" name="dataAuth" value='${sessionScope.mcDataAuth}'/>
  <div class="pop3-box" style="display: block"> 
   <div class="loading"> 
    <h4>IS LOADING</h4> 
    <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
   </div> 
  </div> 
  
  <div class="body-head"> 
  
    <img src="${path}buss/images/logo_blue.png" style="height: 30px;float: left" /> 
   
   <div class="body-head-title" style="">
   	<div style="width: 50%;float: left;"> MES仓库可视化系统</div>
    <div style="font-size: 15px;">
    	
   		</div>
   </div> 
  </div> 
  <div class="wrap"> 
    <div class="con1"> 
   		 <div class="con1-title">前五大呆滞</div>
   		 <div id="idleBit" class="con1-charts" style="width: 95%;height: calc(100% - 17px);"></div> 
   	</div> 
  
    <div class="con1" > 
        <div class="con1-title">
        	收料任务
        </div> 
        <div class="con1-charts" id="receiving" style="width: 100%;height: calc(100% - 17px)"></div> 
    </div> 
    <div class="con1" > 
        <div class="con1-title">
        	发料任务
        </div> 
        <div class="con1-charts" id="issue" style="width: 100%;height: calc(100% - 17px)"></div> 
    </div> 
    <div class="con1"> 
        <div class="con1-title">
        	货架使用率
        </div> 
        <div id="useRate" class="con1-charts" style="width: 90%;height: calc(100% - 17px)"></div> 
    </div> 
    <div class="con1" > 
        <div class="con1-title">
        	警报分类
        </div> 
        <div id="alarmType" class="con1-charts" style="width: 100%;height: calc(100% - 17px)"></div> 
    </div> 
   
  </div> 
  <div class="pop"> 
   <div class="pop-left">
    <div class="con2"> 
        <div class="con1-title">
        	前五大库存
        </div>
        <div id="stock" class="con1-charts" style="width: 100%;height: calc(100% - 17px)"></div> 
    </div> 
 	<div class="con2"> 
    <div class="con1-title">
    	前五大空置率
    </div> 
    <div id="controlRateNext" class="con1-charts" style="width: 100%;height: calc(100% - 22px)"></div> 
   </div> 
   </div> 
   <div class="pop-contain" id="container"></div> 
    <div class="bgRight"> 
    	<span style=" line-height: 32px;vertical-align: top; font-size: 14px;margin-right: 5px;" id="infoValue">仓库</span>
        <select id='areaPlace' onchange="queryPositionData()" s></select>
        <a class="btn" onclick="initView()">初始化</a> 
        <a class="btn" onclick="faceView()">正视图</a> 
        <a class="btn" onclick="overView()">俯视图</a> 
        <a class="btn" onclick="LeftView()">左视图</a> 
        <a class="btn6" onclick="infoDetail()" id="infoDetail"></a> 	
       
        
       
    
    </div> 
  </div> 
 
 </body>
</html>
