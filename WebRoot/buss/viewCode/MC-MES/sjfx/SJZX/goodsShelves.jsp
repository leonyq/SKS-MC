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
    
</style>
<script src="${path}buss/js/echarts.min.js"></script>
<script src="${path}buss/js/SimpleTree.js"></script>
<script src="${path}buss/js/slide.js"></script>
<script src="<%=request.getContextPath()%>/js/slide.js"></script>
<script type="text/javascript" src="${path}buss/js/three/wms/platFormThree.js?version=<%=PLAT_FORM_THREE %>" charset="utf-8"></script>
<script type="text/javascript" src="${path}buss/js/slide.js" charset="utf-8"></script>
<script type="text/javascript">
var allData;
var invoData;
var addX;
var addY;
var addZ;
var dataJson;
var compInfo;
var rotationX;
var rotationY;
var rowNum=localStorage.rsId;
var shelvesData;
var layerTypeValue;
var verticalType;
$(function() {
    var t = setTimeout(function() {
        $("#loading").hide(); 
    },
    1000);
    initThree("container");//初始化画布
    initControls();//初始化控制器
    animate();//动画效果
   	queryShelfOccupancy();//货架空间占用查询
    queryShelfStock();//查询货架库存情况
   	queryPositionData();//后台位置数据
});

/**
 * 获取URL参数
 * param:name参数名称
 */
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}
/**
 * 返回
 */
function goBack() {
    $(".pop3-box").show();
   		 history.go(-1);

}
/**
 * 货架使用率
 */
function showUseRate(rate) {
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
            radius: '62%',
            center: ['50%', '40%'],	
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
            data: [{
                value: rate,
                name: ''
            }]
        }]
    };
    myChart.setOption(option);
}
/**
*页面加载模型
*/
function addObejct(data) {
	var loader = new THREE.JSONLoader();
	var property;
	var rank;
	for(var i=0;i<data.length;i++){
		if((data[i].type==1)&&(rowNum==data[i].rsId)){
			property=data[i];
			rotationX=data[i].rotationX;
			rotationY=data[i].rotationY;
			layerTypeValue= data[i].layerType;
			rank=data[i].rank;
		}
	}
	var shelevType=localStorage.starogeType+""+localStorage.layer;
	var resultData=sortInfo(localStorage.rsId,shelvesData);
	addStorageInfo(resultData,localStorage.starogeType,rank,0,0,-200,localStorage.rsId);
	switch(shelevType)
	{
	case "21":
		loader.load("${path}buss/js/model/shelvesBlueOne/shelvesBlueOne.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			
		});
	 break;
	case "22":
		loader.load("${path}buss/js/model/shelvesBlueTwo/shelvesBlueTwo.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			
		});
	 break;
	case "23":
		loader.load("${path}buss/js/model/shelvesBlueThree/shelvesBlueThree.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			
		});
	 break;
	case "24":
		loader.load("${path}buss/js/model/shelvesBlueFour/shelvesBlueFour.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			

		});
	 break;
	 
	 case "25":
		loader.load("${path}buss/js/model/shelvesBlueFiver/shelvesBlueFiver.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			

		});
	 break;
	 
	 
	 case "26":
		loader.load("${path}buss/js/model/shelvesBlueSix/shelvesBlueSix.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			

		});
	 break;
	 
	 case "27":
		loader.load("${path}buss/js/model/shelvesBlueSeven/shelvesBlueSeven.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			

		});
	 break;
	case "12":
		loader.load("${path}buss/js/model/shelvesBlueTwoLong/shelvesBlueTwoLong.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			
		});
	 break;
	case "13":
		loader.load("${path}buss/js/model/shelvesBlueThreeLong/shelvesBlueThreeLong.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			
		});
	 break;
	case "14":
		loader.load("${path}buss/js/model/shelvesBlueFourLong/shelvesBlueFourLong.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			

		});
	 break;
	 
	 case "15":
		loader.load("${path}buss/js/model/shelvesBlueFiverLong/shelvesBlueFiverLong.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			

		});
	 break;
	 
	 
	 case "16":
		loader.load("${path}buss/js/model/shelvesBlueSixLong/shelvesBlueSixLong.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			

		});
	 break;
	 
	 case "17":
		loader.load("${path}buss/js/model/shelvesBlueSevenLong/shelvesBlueSevenLong.js",function(geometry, materials) {
			var faceMaterial = new THREE.MeshFaceMaterial(materials);
		    var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
	        obj.position.set(0,0,-200);
	        addShelvesProperty(obj,property,0.5);
			

		});
	 break;
	 
	 
	default:
	 break; 
	
	}
	
	
	    
}

//添加货架信息
function addShelvesProperty(obj,property,scale){
	addX=property.positionX;
   	addY=property.positionY;
   	addZ=property.positionZ+200;
    obj.scale.x = scale; 
    obj.scale.y = scale;
    obj.scale.z = scale;
    obj.rotation.x = 3.14/2;
    obj.add=0;
    obj.rsId=property.rsId;
    obj.rotation.x = property.rotationX;
    obj.rotation.y = property.rotationY;
    	if(property.rank=="vertical"){
    	camera.up.x=0;
		camera.up.y=0;
		camera.up.z=1;
		camera.position.set(-1500, -0, 1000); 	
		addY=property.positionY+100;
	}
     obj.rank="transverse";
     obj.id=property.id;
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
 * 货架库存信息展示
 */
 
function ShelfStock(data){
	var html="";
	for(var i=0;i<data.length;i++){
		html+="<tr>"+
			"<td style='width:20%;word-break: break-all;'>"+data[i].SK_AREA_SN+"</td>"+
			"<td style='width:20%;word-break: break-all;'>"+data[i].SK_ITEM_SN+"</td>"+
			"<td style='width:20%;word-break: break-all;'>"+data[i].SK_CO_ITEM_CODE+"</td>"+
			"<td style='width:10%;word-break: break-all;'>"+data[i].SK_AMOUNT+"</td>"+
			"<td style='width:15%;word-break: break-all;'>"+data[i].SK_HAVE_CHECK+"</td>"+
			"<td style='width:15%;word-break: break-all;'>"+data[i].DULL+"</td>"+
			"</tr>";
	}
	$("#ShelfStock").html(html);
	if(data.length<3){
		$("#ShelfStock").css("width","100%");
	}
}
/**
 * 信息展示
 */
function showInfo(barcode) {
	if((barcode!=undefined)&&(barcode!='undefined')){
		 queryWarehouseInventory(barcode);//查询货位信息
	}
	
}
//隐藏内容
function hideInfo() {
    $(".pop4-box").hide();
    $(".pop6-box").hide();
}

function queryShelfOccupancy(){
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=ShelfOccupancy&method=ShelfOccupancyFunc",
        data: {
        	areaSn:localStorage.rsId
        },
        dataType: "json",
        success: function(data) {
        	$("#totalNum").html(data[0].TOTAL_NUM);
        	$("#ocupy").html(data[0].USE_NUM);
        	$("#free").html(data[0].USELESS_NUM);
        	if(data[0].USE_NUM==0){
        		showUseRate(0);
        	}else{
        		showUseRate((data[0].USE_NUM*100/data[0].TOTAL_NUM).toFixed(2));
        	}
        	
        },
        error: function(data) {
            alert("系统错误！");
        }
    });
}
/**
 * 查询货架库存情况
 */
function queryShelfStock(){
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=ShelfStock&method=ShelfStockFunc",
        data: {
        	areaSn:localStorage.rsId
        },
        dataType: "json",
        success: function(data) { 
        	ShelfStock(data);	
        },
        error: function(data) {
            alert("系统错误！");
        }
    });
}
/**
 *查询货位信息
 */
function queryWarehouseInventory(barcodeNext){
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=WarehouseInventory&method=WarehouseInventoryFunc",
        data: {
        	areaSn:barcodeNext
        },
        dataType: "json",
        success: function(data) {
        	
        	invoData=data;
        	var freeInfo;
        	if((data.length!=0)&&(data.length==1)){
        		var html="";
        		html += "<tr><td>" + "货位" + "</td><td>" + validateText(invoData[0].WSI_STORAGE_CODE) + "</td></tr>";
        	    html += "<tr><td>" + "物料条码" + "</td><td>" + validateText(invoData[0].WSI_ITEM_SN) + "</td></tr>";
        	    html += "<tr><td>" + "物料编码" + "</td><td>" + validateText(invoData[0].WSI_ITEM_CODE) + "</td></tr>";
        	    html += "<tr><td>" + "物料品名" + "</td><td>" + validateText(invoData[0].CI_ITEM_NAME) + "</td></tr>";
        	    html += "<tr><td>" + "物料规格" + "</td><td>" + validateText(invoData[0].CI_ITEM_SPEC) + "</td></tr>";
        	    html += "<tr><td>" + "生产批次" + "</td><td>" + validateText(invoData[0].WSI_LOT_NO) + "</td></tr>";
        	    
        	    html += "<tr><td>" + "供应商名称" + "</td><td>" + validateText(invoData[0].SUPPLIER_NAME) + "</td></tr>";
        	    var itemFlagClass="";
        	    if(invoData[0].WSI_ITEM_FLAG=="不良品"){
        	    	itemFlagClass="color: #ff0000";
        	    }else{
        	    }
        	    html += "<tr><td>" + "品质状态" + "</td><td style='"+itemFlagClass+"'>" +validateText( invoData[0].WSI_ITEM_FLAG) + "</td></tr>";
        	    
        	    html += "<tr><td>" + "数量" + "</td><td>" + validateText(invoData[0].WSI_ITEM_NUM) + "</td></tr>";
        	   	html += "<tr><td>" + "状态" + "</td><td >" + validateText(invoData[0].WSI_STOCK_FLAG) + "</td></tr>";
        	    if(invoData[0].DULL=="呆滞"){
        	    	html += "<tr><td>" + "是否呆滞品" + "</td><td style='color: #bfc547;'>" +validateText(invoData[0].DULL)+ "</td></tr>";
        	    }else{
        	    	html += "<tr><td>" + "是否呆滞品" + "</td><td>" +validateText(invoData[0].DULL)+ "</td></tr>";
        	    }
        	    
        	    $("#stockInfo").html(html);
        	    $("#stockText").show();
        	}else if(data.length!=0){
        		showStockTextMore(data);
        	}
        	
        	
        },
        error: function(data) {
            alert("系统错误！");
        }
    });
}
/**
 *展示多条数据
 */
function showStockTextMore(data){
	$("#stockTextMore").show();
	var freeInfo="";
	var html="";
	for(var i=0;i<data.length;i++){
		var itemFlagClass="";
		if(invoData[i].WSI_ITEM_FLAG=="不良品"){
        	    	itemFlagClass="color: #ff0000";
       }else{
       
       }
       	html += "<tr><td>" + validateText(invoData[i].WSI_STORAGE_CODE) + "</td>";
	    html += "<td>" + validateText(invoData[i].WSI_ITEM_SN) + "</td>";
	    html += "<td>" + validateText(invoData[i].WSI_ITEM_CODE) + "</td>";
	    html += "<td>" + validateText(invoData[i].CI_ITEM_NAME) + "</td>";
	    html += "<td>" + validateText(invoData[i].CI_ITEM_SPEC) + "</td>";
	    html += "<td>" +validateText(invoData[i].SUPPLIER_NAME)+ "</td>";
	    html += "<td>" + validateText(invoData[i].WSI_LOT_NO) + "</td>";
	    html += "<td>" + validateText(invoData[i].WSI_ITEM_NUM)+ "</td>";
	    html +=  "<td>" + validateText(invoData[i].WSI_STOCK_FLAG)+ "</td>";
	    html +=  "<td style='"+itemFlagClass+"'>" + validateText(invoData[i].WSI_ITEM_FLAG)+ "</td>";
	    if(invoData[0].DULL=="呆滞"){
	    	html +=  "<td style='color: #bfc547;'>" +validateText(invoData[i].DULL)+ "</td>";
	    }else{
	    	html +=  "<td >" +validateText(invoData[0].DULL)+ "</td>";
	    }
	}
	
    $("#stockInfoMore").html(html);
}


/**
 *读取后台位置数据
 */
function queryPositionData(){
	
     		dataJson= JSON.parse(localStorage.areaPosition); 
     		comparyInfo();
     		
      
}
/**
 * 查询后台状态数据
 */
function queryAreamInfo(){
	 $.ajax({
	       type: "post",
	       url: server_address+"/WmsArea.ashx",
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

/**
 * 比对位置数据与状态数据
 */
function comparyInfo(data){
	$.ajax({
        type: "post",
        url: "${path}http/interface.ms?model=WarehouseInventory&method=WarehouseInventoryFunc",
        data: {areaSn:localStorage.areaPlace,
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
        
        },
        error: function(data) {
            alert("系统错误！");
        }
    });
	
	
}



 
/**
 * 添加货位位置
 */

				
function addStorageInfo(resultData,stoType,rank,positionX,positionY,positionZ,rsId){
	if(resultData.faceA!=undefined&&resultData.faceA=="A"){
		addStorageInfoPistion(resultData.layer,rank,positionX,positionY,positionZ,stoType,"A",resultData.positiveSize,rsId);
	}
	if(resultData.faceB!=undefined&&resultData.faceB=="B"){
		addStorageInfoPistion(resultData.layer,rank,positionX,positionY,positionZ,stoType,"B",resultData.otherSide,rsId);
	}
	if(resultData.faceC!=undefined&&resultData.faceS=="S"){
			addStorageInfoPistion(resultData.layer,rank,positionX,positionY,positionZ,stoType,"S",resultData.singleSide,rsId);
	}
}
/**
 * 添加货位位置
 */
function addStorageInfoPistion(layerHeight,rank,objectX,ObjectY,positionZ,stoType,faceA,TempValue,rsId){
		verticalType=rank;
	layerHeight=layerTypeValue;
	var ObjectArrayNext=new Array();
	var layer=layerHeight;
	var buttomHeight=-85;
	var nextPisition=160;
	if((faceA!=undefined)&&(faceA=="S"||faceA=="A")){
		if(rank=="transverse"){
			nextPisition=70;
		}else{
			nextPisition=70;
		}
		
	}else{
		if(rank=="transverse"){
			nextPisition=-20;
		}else{
			nextPisition=-20;
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
			var baseX=450;
			var scaleValue=1;
			if(tempLength>10){
				tempLength=10;
			}
			if(starogeType==1){
				tempLength=tempObjectArray.length;
				baseX=1400;
				scaleValue=0.25;
				buttomHeight=-100;
				
			}
			for(var j=0;j<tempLength;j++){
				if(stoType==2){
					stoType=1;
				}else{
					stoType=0.3;
				}
				var positionObject;
					if(rank=="vertical"){
					
					positionObject={
					scaleX:0.1*scaleValue,
					scaleY:0.3*scaleValue,
					scaleZ: 0.1*scaleValue,
					id:tempObjectArray[j].arsn,
					rsId:tempLength,
					type:2,
					positionX:objectX-nextPisition,
					positionY:ObjectY-j*90*scaleValue+baseX-100,
					positionZ:buttomHeight + (i - 1) * layerHeight,
					DULL:tempObjectArray[j].dull,
					rsId:tempObjectArray[j].arsn,
					layer:layer,
					starogeType:starogeType,
					rotationX:rotationX,
  					rotationY:rotationY
					};
					}else{
						positionObject={
					scaleX:0.1*scaleValue,
					scaleY:0.3*scaleValue,
					scaleZ: 0.1*scaleValue,
					id:tempObjectArray[j].arsn,
					rsId:tempLength,
					type:2,
					positionX:objectX+j*90*scaleValue-baseX,
					positionY:ObjectY-nextPisition,
					positionZ:buttomHeight + (i - 1) * layerHeight,
					DULL:tempObjectArray[j].dull,
					rsId:tempObjectArray[j].arsn,
					layer:layer,
					starogeType:starogeType,
					rotationX:rotationX,
  					rotationY:rotationY
					};
					}
					
				ObjectArrayNext.push(positionObject);
			}
		}
	}
	loadObject(ObjectArrayNext);
	
}

function faceViewValue(){
	faceView(verticalType);
	if($("#faceUp").html()=="反面"){
		$("#faceUp").html("正面");
	}else{
		$("#faceUp").html("反面");
	}
}

function validateText(textValue){
	if((textValue==undefined)||(textValue=="")||(textValue=="null")||(textValue==null)){
		return "";
	}else{
		return textValue;
	}
}
</script>
<style>
	  .pop-contain {
        width: calc(80% - 20px);
        height: calc(100% - 52px);
        float: left;
        margin: 10px;
        margin-top:42px;
    }
    td {
    height: 30px;
    width: auto;
    border: 1px solid #363b42;
    text-align: center;
    text-overflow: ellipsis;
    -moz-text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    /* border: 1px solid; */
    text-align: lef;
}
</style>
</head>
<body style="min-width: 1300px"> 
  <div class="pop3-box" style="display: block" id="loading"> 
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
   <div class="body-head-title">
     MES仓库可视化系统 
   </div> 
  </div> 
  <div class="wrap"> 
   <div class="con1" style="width: calc(60% - 20px);"> 
    <div style="width:100%;text-align:center;font-size:16px">
      货架库存情况 
    </div>
    <table style="font-size: 13px;color:#ffffff;width:100%"> 
    	 <tr> 
       <th style="width:20%">货位</th> 
       <th style="width:20%">物料条码</th> 
       <th style="width:20%">物料编码 </th>
       <th style="width:10%">数量 </th>
       <th style="width:15%">检验状态 </th>
       <th style="width:15%">呆滞天数 </th>
      </tr> 
    </table>
    <div style="width: 100%;height:calc(100% - 50px); overflow:auto; overflow-x:hidden;"> 
    <table style="font-size: 13px;color:#ffffff;width: calc(100% - -18px);" id="ShelfStock"> 
    </table> 
    </div>
   </div> 
   <div class="con1"> 
    <div class="con1-title">
      货架空间占用 
    </div> 
    <table class="table" border="0" "="" bgcolor="" style="font-size: 13px;color:#ffffff"> 
     <tbody id="tableInfo"> 
      <tr> 
       <td>货位</td> 
       <td><span id="totalNum">48</span>个</td> 
      </tr> 
      <tr> 
       <td>占用</td> 
       <td><span id="ocupy"></span>个</td> 
      </tr> 
      <tr> 
       <td>空闲</td> 
       <td><span id="free"></span>个</td> 
      </tr>  
     </tbody>
    </table> 
   </div> 
   <div class="con1"> 
    <div class="con1-title">
      货架使用率 
    </div> 
    <div class="con1-charts" id="useRate" style="width: 90%;height: calc(100% - 17px)"></div> 
   </div> 
   </div>
   <div id="container" class="pop-contain" style="width:90%;float:left;height: calc(60% - 52px);"> 
   	
   </div>
   	 <div class="bgRight" style="top: calc(50% - 92px);left:10px;width: 200px;"> 
    	<a class="btn7" onclick="goBack()" id="infoDetail"></a> 
    </div>  
     <div  style="top: calc(50% -32px);left:10px;z-index: 9999;    left: 10px;z-index: 9999; width: 70px;float: right;position: absolute; margin-left: 93%;"> 
    		
       <a class="btn" onclick="faceViewValue()"  id="faceUp">反面</a> 
    </div>  
   </div>
   <div class="pop4-box" id="stockText" style="height: 450px;top:38%"> 
    <div style="width:100%;"> 
     <a class="btn-close" onclick="hideInfo()" style="float:right"></a> 
    </div>
    <table class="table" border="0" "="" bgcolor="" style="font-size: 13px;color:#ffffff;margin:10px ">  
     <tbody id="stockInfo">  
     </tbody>
    </table> 
   </div> 
    <div class="pop6-box" id="stockTextMore" style=" width:1200px;left: calc(50% - 600px);top:calc(50% - 172.5px)"> 
    <div style="width:100%;"> 
     <a class="btn-close" onclick="hideInfo()" style="float:right"></a> 
    </div>
    <div style="width:100%;height:300px; overflow:auto; overflow-x:hidden;" >
    <table class="table" border="0" "="" bgcolor="" style="font-size: 13px;color:#ffffff;margin:10px;word-break: break-all;width: 99%; ">
    	<thead>
    	<tr>
    		<td style="width: 90px;">货位</td>
    		<td style="width: 200px;">物料条码</td>
    		<td style="width: 100px;">物料编码</td>
    		<td>物料品名</td>
    		<td >物料规格</td>
    		<td style="width: 150px;">供应商</td>
    		<td style="width: 80px;">生产批次</td>
    		<td style="width: 60px;">数量</td>
    		<td style="width: 60px;">状态</td>
    		<td style="width: 60px;">品质状态</td>
    		<td style="width: 60px;">是否呆滞</td>
    	</tr> 
    	</thead> 
     <tbody id="stockInfoMore">  
     </tbody>
    </table> 
   </div> 
   </div>
  </div>
 </body>
</html>