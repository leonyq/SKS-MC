<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
   <meta name="renderer" content="webkit">
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <%@ include file="/buss/inc_files/inc_dev.jsp"%>				 
<title><dict:lang value="建模编辑" />
</title>
	
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
     <script type="text/javascript" src="${path}buss/js/jquery-1.8.0.min.js"></script>
  
   
    <script type="text/javascript" src="${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
   	<script type="text/javascript" src="${path}plf/js/common/util.js?_mc_res_version=<%=PlfStaticRes.UTIL_JS %>"></script>
	<script type="text/javascript" src="${path}plf/page/fp/js/utilsFp.js?_mc_res_version=<%=PlfStaticRes.UTILSFP %>"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script src="${path}plf/js/msg/jquery.msg.js?_mc_res_version=<%=PlfStaticRes.JQUERYMSG%>"></script>
<script type="text/javascript" src="${path}buss/js/three/three.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/TrackballControls.js"></script>
<script type="text/javascript" src="${path}buss/js/three/OrbitControls.js"></script>
<script type="text/javascript" src="${path}buss/js/three/CSS3DRenderer.js"></script>
<script type="text/javascript" src="${path}buss/js/three/tween.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/stats.min.js"></script>
<link href="${path}buss/css/css.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css">
<script type="text/javascript" src="${path}buss/js/three/fonts/helvetiker_regular.typeface.js"></script>
<script src="${path}buss/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${path}buss/js/three/edit/shelvesEdit.js?version=<%=SHELVES_EDIT %>"></script>
<style>

    html,body{
        height:100%;
        color:#333;
        background-color:#f6f5f7;
    }
    
    body{
        height:calc(100% - 10px);
        background-color:#fff;
    }
    
    #toolBar{
        height:40px;
        background-color:#f6f5f7;
    }
    
    .btn{
        border: 1px solid #dbdbdb;
        border-radius: 2px;
        background-color: #fff;
        color: #666;
        height: 28px;
        line-height: 26px;
        padding: 0 10px;
        margin-right: 2px;
        cursor: pointer;
        font-weight: normal;
        width: auto;
        display:inline-block;
        box-sizing: border-box;
    }
    
    .btn .ico{
        width:15px;
        height:15px;
        margin-right: 5px;
        margin-bottom: 1px;
        vertical-align: middle;
        display:inline-block;
    }
    
     .btn .init-view {
            background-image: url(${path}/buss/images/icon/init-view.png);
     }

     .btn .init-view:hover{
             background-image: url(${path}/buss/images/icon/init-view-h.png);
      }
      
      .btn .face-view {
            background-image: url(${path}/buss/images/icon/face-view.png);
     }

     .btn .face-view:hover{
             background-image: url(${path}/buss/images/icon/face-view-h.png);
      }
      
      .btn .over-view {
            background-image: url(${path}/buss/images/icon/over-view.png);
     }

     .btn .over-view:hover{
             background-image: url(${path}/buss/images/icon/over-view-h.png);
      }
      
      .btn .left-view {
            background-image: url(${path}/buss/images/icon/left-view.png);
     }

     .btn .left-view:hover{
             background-image: url(${path}/buss/images/icon/left-view-h.png);
      }
      
       .btn .right-view {
            background-image: url(${path}/buss/images/icon/right-view.png);
     }

     .btn .right-view:hover{
             background-image: url(${path}/buss/images/icon/right-view-h.png);
      }
      
     .btn .to-left-align {
            background-image: url(${path}/buss/images/icon/to-left-align.png);
     }

     .btn .to-left-align:hover{
             background-image: url(${path}/buss/images/icon/to-left-align-h.png);
      }
      
      .btn .to-right-align {
            background-image: url(${path}/buss/images/icon/to-right-align.png);
     }

     .btn .to-right-align:hover{
             background-image: url(${path}/buss/images/icon/to-right-align-h.png);
      }
       .btn .to-top-align {
            background-image: url(${path}/buss/images/icon/to-top-align.png);
     }

     .btn .to-top-align:hover{
             background-image: url(${path}/buss/images/icon/to-top-align-h.png);
      }
      
       .btn .to-buttom-align {
            background-image: url(${path}/buss/images/icon/to-buttom-align.png);
     }

     .btn .to-buttom-align:hover{
             background-image: url(${path}/buss/images/icon/to-buttom-align-h.png);
      }
      
      .btn .save {
            background-image: url(${path}/buss/images/icon/save.png);
     }

     .btn .save:hover{
             background-image: url(${path}/buss/images/icon/save-h.png);
      }
      
      
    
    
    .btn:hover{
        background-color:#aace36;
        color:#fff;
    }
    
    .main{
        height:calc(100% - 40px);
        padding-top:15px;
        box-sizing:border-box;
    }
    
    .main .left{
        width:190px;
        height:calc(100% - 20px);
        margin-left:20px;
        border:1px solid #eaeaea;
        float:left;
        box-sizing:border-box;
        overflow: auto;
    }
    
    .main .center{
        width:calc(100% - 450px);
        height:calc(100% - 20px);
        padding:20px;
        margin-left:10px;
        border:1px solid #eaeaea;
        float:left;
        box-sizing:border-box;
    }
    
    .main .right{
        width:200px;
        height:calc(100% - 20px);
        margin-left:10px;
        border:1px solid #eaeaea;
        float:left;
        box-sizing:border-box;
        padding:15px;
        overflow: auto;
    }
    
    td{
        border:1px solid #dbdbdb;
    }
    
    .right table thead{
        background-color:#f1f1f1;
    }
    .show-text {
    width: 210px;
    height: 100px;
    position: absolute;
    top: 458px;
    left: 930px;
    border: 1px solid #d8d0d0;
    color: #e45353;
}
</style>
</HEAD>
<body style="background:#fff;">
	<div id="toolBar">
		<div style="float: left;">
			<span>仓库</span>
			<select id='areaPlace' onchange="queryData()" style="width:182px"></select>
		</div>
		<div style="text-align:right;">
    		<a class="btn" onclick="initView()"><i class="ico init-view"></i>初始化</a>
    		<a class="btn" onclick="faceView()"><i class="ico face-view"></i>正视图</a>
    		<a class="btn" onclick="overView()"><i class="ico over-view"></i>俯视图</a>
    		<a class="btn" onclick="LeftView()"><i class="ico left-view" ></i>左视图</a>
    		<a class="btn" onclick="rightView()"><i class="ico right-view"></i>右视图</a>
    		<a class="btn" onclick="toleftAlign()"><i class="ico to-left-align"></i>居左对齐</a>
    		<a class="btn" onclick="toRightAlign()"><i class="ico to-right-align"></i>居右对齐</a>
    		<a class="btn" onclick="toTopAlign()"><i class="ico to-top-align"></i>向上对齐</a>
    		<a class="btn" onclick="toButtomAlign()"><i class="ico to-buttom-align"></i>向下对齐</a>
    		<a class="btn" onclick="gainReverData()"><i class="ico save"></i>保存</a>
		</div>
	</div>
	<div class="main">
    	<div class="left" id="con1Tree">
    		<ul id="zTree" class="ztree" style="">
    		</ul>
    	</div>
    	<div class="center">
        	<div id="container" style="height:100%;width: 100%;margin-top: auto;"></div>
        </div>
    	<div class="right">
    		<div style="width: 100%;text-align: center">
    			<span id="shelvesId"></span>货架信息
    		</div>
    		<table style="width: 100%;font-size: x-small;">
    			<thead>
    				<tr>
    					<td>货位编码</td>
    					<td>所属层数</td>
    				</tr>
    			</thead>
    			<tbody id="shelvesInfo">
    			</tbody>
    		</table>
    	</div>
    
    	<div class="pop5-box" id="stockText">
    		<div style="width:100%;">
    			<a class="btn-close" onclick="hideInfo()" style="float:right"></a>
    		</div>
    		<table class="table" border="0" bgcolor="" style="font-size: 13px;color:#ffffff;margin:10px ">
    			<tbody id="stockInfo">
    				<tr>
    					<td>排列方式</td>
    					<td>
    					<select id="rank" onchange="toRankChange()">
    					</select>
    					</td>
    				</tr>
    				<tr>
    					<td>拆解货架</td>
    					<td><a class="btn" style="margin-top: 5px;margin-left: 10px;" onclick="toDismantlReservo()">确认</a></td>
    				</tr>
    				<tr>
    					<td>移除货架</td>
    					<td><a class="btn" style="margin-top: 5px;margin-left: 10px;" onclick="toRemoveReservo()">确认</a></td>
    				</tr>
    			</tbody>
    		</table>
    	</div>
	</div>
	
	<div class="show-text" style="left: 1251.01px; top: 667.011px;">
							<div style="font-size: 15px;text-align:center">操作说明</div>
							<div style="font-size: 5px;">1.按住ctrl键，拖动货架可以两排合并</div>
							<div style="font-size: 5px;">2.按住atl键，可以操作对齐功能</div>
							
	</div>
	<script type="text/javascript">
	var scrollLeft=0;
	var allData;//查询业务相关数据
	var locationArray = new Array();//货位数据保存
	var zTreeNode;//点击树当前节点
	var asSnTemp;//当前的asn码
	var objectArray = new Array();//已经加载的货架
	var saveArray = new Array();//保存模型数据数组
	var allAreaData;
	var setting = {
		view : {
			fontCss : getFont,
			nameIsHTML : true
		},
		callback : {
			onClick : onClick,
			onDrag: zTreeOnDrag
		},
		data : {
			key : {
				checked : "isChecked",
				children : "nodes",
				name : "WA_AREA_NAME",
				title : "WA_AREA_NAME",
			},
			simpleData : {
				enable : true,
				idKey : "WA_AREA_SN",
				pIdKey : "WA_SUPERIOR_SN",
				rootPId : "null"
			}
		},
	};
	//键盘按下添加监听事件
	document.onkeydown = function (e){
		e = e || window.event;
        var keycode = e.keyCode;
        if (keycode == 17){
        	ctrlTemp=1;
        }
        if (keycode ==18){
        	altTemp=1;
        }
    }
	//键盘松开添加监听事件
    document.onkeyup = function (e){
    	  e = e || window.event;
        var keycode = e.keyCode;
        if (keycode == 17){
        	ctrlTemp=0;
        }
        if (keycode == 18){
        	altTemp=0;
        	removeShaw();
        }
    }
	$(document).ready(function() {
		scrollLeft=$(document).scrollLeft();
		
		initThree("container");
		initControls();
		animate();
		document.querySelector('body').onscroll = function() {
			scrollLeft=$(document).scrollLeft();
		}
		window.onresize = function(){
			scrollLeft=$(document).scrollLeft();
		}
		queryAllArea(1);
		var widthValue=$("#container").width()+50;
		var heightValue=$("#container").height();
	    $(".show-text").css("left",widthValue);
	    $(".show-text").css("top",heightValue);
	});
		
		//树获取字体颜色
		function getFont(treeId, node) {
			return node.font ? node.font : {
				color : "#333"
			};
		}
		//点击树的节点函数
		function onClick(e, treeId, treeNode) {
			var arSn = treeNode.WA_AREA_SN;
			zTreeNode = treeNode;
			if (zTreeNode.temp == 1) {
				utilsFp.confirmIcon(3,"","","", "该货区已经添加",0,"260","");
				return false;
			}
			var parentNode =treeNode.getParentNode();
			if(parentNode==null||parentNode==undefined){
				return false;
			}
			var treeNodes=0;
			var  areaSn=treeNode.WA_AREA_SN;
			for (var i = 0; i < allData.length; i++) {
				if (areaSn == allData[i].WA_SUPERIOR_SN) {
					treeNodes=1;
					break;
				}
			}
			if (treeNodes== 1) {
				drawCanvas(arSn);
			}else{
				locationArray.length=0;
				asSnTemp=null;
			} 
		}
		/**
		 *改变树的图标
		 */
		function changeIcon() {
			var treeObj = $.fn.zTree.getZTreeObj("zTree");
			var nodes = treeObj.transformToArray(treeObj.getNodes());
			
			for (var i = 0; i < nodes.length; i++) {
				var temp = nodes[i].WA_AREA_SN;
				if (temp.length < 8) {
					nodes[i].iconOpen = "${path}plf/js/zTree/css/zTreeStyle/img/diy/ico-right-open.png";
					nodes[i]. iconClose = "${path}plf/js/zTree/css/zTreeStyle/img/diy/ico-right-close.png";
				} 
					nodes[i].icon = "${path}plf/js/zTree/css/zTreeStyle/img/diy/ico-right-last.png";
				
				treeObj.updateNode(nodes[i]);
			}

		}
		/**
		 *树型数据
		 */
		function queryData() {
		    //数据交互--N2接口--仓库可视化--获取仓库信息
			removeObejectFromScene();
			objectArray.length=0;
			$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=GetArea&method=GetAreaFunc",
				data : {
					areaSn:$("#areaPlace").val()
				},
				dataType : "json",
				success : function(data) {
				    console.log(data);
					allData = data;
					resdata = data;
					$.fn.zTree.init($("#zTree"), setting, resdata);
					changeIcon();
					queryPositionData();
					localStorage.areaPlaceNext=$("#areaPlace").val();
				},
				error : function(data) {
					alert("系统错误！");
				}
			});

		}
		
		
		//货架拆解功能
		function toDismantlReservo(){
			dismantlReservo();
			$("#stockText").hide();
		}
		//居左对齐
		function toleftAlign(){
			leftAlign();
		}
		//居右对齐
		function toRightAlign(){
			rightAlign();
		}
		//向上对齐
		function toTopAlign(){
			topAlign();
		}
		//向下对齐
		function toButtomAlign(){
			buttomAlign();
		}
		
		function zTreeOnDrag(e, treeId, treeNode){
			 alert();
		}
		
	//点击树后添加模型方法
		function drawCanvas(arSn) {
			var array = new Array();
			var newArray = new Array();
			for (var i = 0; i < allData.length; i++) {
				if (arSn == allData[i].WA_SUPERIOR_SN) {
					var arlength=allData[i].WA_AREA_SN.length;
					array.push(allData[i].AR_SN);
					var layer = parseInt(allData[i].WA_AREA_SN.substring(arlength-4, arlength-3));
					var column = parseInt(allData[i].WA_AREA_SN.substring(arlength-3,arlength));
					var data = {
						"layer" : layer,
						"column" : column,
						"arsn" : allData[i].WA_AREA_SN
					};
					newArray.push(data);
					needTemp = 1;
				}
			}
			locationArray = newArray;
			asSnTemp = arSn;
		}
		//添加模型方法
		function addObejct(x, y) {
			var shelvesArray = getShelvesByAsn(asSnTemp);
			shelvesArray = arraySort(shelvesArray);
			var layer=shelvesArray[shelvesArray.length-1].layer;
			var loader = new THREE.JSONLoader();
			if(shelvesArray.length>0&&shelvesArray[0].starogeType==1){
				addLongObject(x,y);
				return false;
			}
			switch(layer)
			{
			//加载一层模型
			case 1:loader.load("${path}buss/js/model/shelvesBlueOne/shelvesBlueOne.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 1.27;
				obj.scale.y = 1.27;
				obj.scale.z = 1.27;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=2;
				addObjectProperty(obj,x,y,layer,1,1.56);
			});break;
			//加载二层模型
			case 2:loader.load("${path}buss/js/model/shelvesBlueTwo/shelvesBlueTwo.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=2;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			//加载三层模型
			case 3:loader.load("${path}buss/js/model/shelvesBlueThree/shelvesBlueThree.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=2;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			//加载四层模型
			case 4:loader.load("${path}buss/js/model/shelvesBlueFour/shelvesBlueFour.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=2;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			//加载五层模型
			case 5:loader.load("${path}buss/js/model/shelvesBlueFiver/shelvesBlueFiver.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=2;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			//加载六层模型
			case 6:loader.load("${path}buss/js/model/shelvesBlueSix/shelvesBlueSix.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=2;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			
			//加载七层模型
			case 7:loader.load("${path}buss/js/model/shelvesBlueSeven/shelvesBlueSeven.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=2;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
		
			
			default:
			  break;  
			}
			zTreeNode.font = {
					'color' : 'red'
				};
				zTree = $.fn.zTree.getZTreeObj("zTree");
				zTreeNode.temp = 1;
				zTree.updateNode(zTreeNode);
		}
		
		//添加长模型
		function addLongObject(x,y){
			var shelvesArray = getShelvesByAsn(asSnTemp);
			shelvesArray = arraySort(shelvesArray);
			var layer=shelvesArray[shelvesArray.length-1].layer;
			var loader = new THREE.JSONLoader();
			switch(layer)
			{
			//加载一层模型
			case 1:loader.load("${path}buss/js/model/shelvesBlueOne/shelvesBlueOne.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 1.27;
				obj.scale.y = 1.27;
				obj.scale.z = 1.27;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=1;
				addObjectProperty(obj,x,y,layer,1,1.56);
			});break;
			//加载二层模型
			case 2:loader.load("${path}buss/js/model/shelvesBlueTwoLong/shelvesBlueTwoLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=1;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			//加载三层模型
			case 3:loader.load("${path}buss/js/model/shelvesBlueThreeLong/shelvesBlueThreeLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=1;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			//加载四层模型
			case 4:loader.load("${path}buss/js/model/shelvesBlueFourLong/shelvesBlueFourLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=1;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			//加载五层模型
			case 5:loader.load("${path}buss/js/model/shelvesBlueFiverLong/shelvesBlueFiverLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=1;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			//加载六层模型
			case 6:loader.load("${path}buss/js/model/shelvesBlueSixLong/shelvesBlueSixLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=1;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
			
			//加载七层模型
			case 7:loader.load("${path}buss/js/model/shelvesBlueSevenLong/shelvesBlueSevenLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				var obj = new THREE.MorphAnimMesh(geometry, faceMaterial);
				obj.scale.x = 0.5;
				obj.scale.y = 0.5;
				obj.scale.z = 0.5;
				objects.push(obj);
				scene.add(obj);
				obj.starogeType=1;
				addObjectProperty(obj,x,y,layer,2,0.5);
			});break;
		
			
			default:
			  break;  
			}
			zTreeNode.font = {
					'color' : 'red'
				};
				zTree = $.fn.zTree.getZTreeObj("zTree");
				zTreeNode.temp = 1;
				zTree.updateNode(zTreeNode);
		}
		
		//添加模型属性
		function addObjectProperty(obj,x,y,layer,modelDiff,scaleMax){
			obj.position.set(x, y, 0);
			obj.rotation.x = 3.14 / 2;
			obj.rsId = asSnTemp;
			obj.groupId = asSnTemp;
			obj.aggregate=asSnTemp;
			obj.aggStatus=0;
			obj.add = 0;
			obj.rank = "transverse";
			obj.id = asSnTemp;
			obj.type = 1;
			obj.last = 1;
			obj.first = 1;
			obj.addY=0;
			obj.addX=0;
			obj.layerType=layer;
			obj.modelDiff=modelDiff;
			obj.scaleMax=scaleMax;
		}
		//保存数据
		function saveData() {
			for (var i = 0; i < objects.length; i++) {
				var model = {
					"positionX" : objects[i].position.x,
					"positionY" : objects[i].position.y,
					"positionZ" : objects[i].position.z,
					"rank" : objects[i].rank,
					"add" : objects[i].add,
					"rsId" : objects[i].rsId,
					"id" : objects[i].id,
					"type" : objects[i].type,
					"groupId" : objects[i].groupId,
					"adsorbent" : objects[i].adsorbent,
					"last" : objects[i].last,
					"first" : objects[i].first,
					"top":objects[i].top,
					"bottom":objects[i].bottom,
					"rotationX" : objects[i].rotation.x,
					"rotationY" : objects[i].rotation.y,
					"addX":objects[i].addX,
					"addY":objects[i].addY,
					"aggregate":objects[i].aggregate,
					"aggStatus":objects[i].aggStatus,
					"layerType":objects[i].layerType,
					"modelDiff":objects[i].modelDiff,
					"scaleMax":objects[i].scaleMax,
					"starogeType":objects[i].starogeType
				};
				saveArray.push(model);
			}
			var setInfo=JSON.stringify(saveArray);
			var areaSn=$("#areaPlace").val();
			
			saveAreaInfo(areaSn,setInfo);
			
		}
		//读取后台位置数据
		function queryPositionData() {
			var wmsSn=$("#areaPlace").val();
			for(var i=0;i<allAreaData.length;i++){
				if(wmsSn==allAreaData[i].WA_AREA_SN){
					var  jsonTemp=isJSON(allAreaData[i].WA_SET_INFO);
					if(jsonTemp){
						  var jsObject = JSON.parse(allAreaData[i].WA_SET_INFO); 
						  detailPisitionData(jsObject);
					}
				}
			}
			
			/* $.ajax({
				type : "post",
				url : "positionData.do",
				data : {},
				dataType : "json",
				success : function(data) {
					if ((data.result != '') && (data.result != undefined)) {
						var dataJson = JSON.parse(data.result);
						detailPisitionData(dataJson);
					}
				},
				error : function(data) {
					alert("系统错误！");
				}
			}); */
		}
		//处理后台业务数据
		function detailPisitionData(data) {
			var loader = new THREE.JSONLoader();
			loader.load("${path}buss/js/model/shelvesBlueOne/shelvesBlueOne.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type == 1)&&(data[i].layerType==1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],1.28);
						obj.starogeType=2;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
			});
			loader.load("${path}buss/js/model/shelvesBlueTwo/shelvesBlueTwo.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type == 1)&&(data[i].layerType==2)&&(data[i].starogeType!=1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=2;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
			});
			loader.load("${path}buss/js/model/shelvesBlueThree/shelvesBlueThree.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type == 1)&&(data[i].layerType==3)&&(data[i].starogeType!=1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=2;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
			});
			loader.load("${path}buss/js/model/shelvesBlueFour/shelvesBlueFour.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type ==1)&&(data[i].layerType==4)&&(data[i].starogeType!=1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=2;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
				
			});
			
			loader.load("${path}buss/js/model/shelvesBlueFiver/shelvesBlueFiver.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type ==1)&&(data[i].layerType==5)&&(data[i].starogeType!=1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=2;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
				
			});
			
			loader.load("${path}buss/js/model/shelvesBlueSix/shelvesBlueSix.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type ==1)&&(data[i].layerType==6)&&(data[i].starogeType!=1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=2;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
				
			});
			
			loader.load("${path}buss/js/model/shelvesBlueSeven/shelvesBlueSeven.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type ==1)&&(data[i].layerType==7)&&(data[i].starogeType!=1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=2;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
				
			});
			
			
			
			
		//加载电子货架
		
			loader.load("${path}buss/js/model/shelvesBlueTwoLong/shelvesBlueTwoLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type == 1)&&(data[i].layerType==2)&&(data[i].starogeType==1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=1;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
			});
			loader.load("${path}buss/js/model/shelvesBlueThreeLong/shelvesBlueThreeLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type == 1)&&(data[i].layerType==3)&&(data[i].starogeType==1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=1;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
			});
			loader.load("${path}buss/js/model/shelvesBlueFourLong/shelvesBlueFourLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type ==1)&&(data[i].layerType==4)&&(data[i].starogeType==1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=1;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
				
			});
			
			loader.load("${path}buss/js/model/shelvesBlueFiverLong/shelvesBlueFiverLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type ==1)&&(data[i].layerType==5)&&(data[i].starogeType==1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=1;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
				
			});
			
			loader.load("${path}buss/js/model/shelvesBlueSixLong/shelvesBlueSixLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type ==1)&&(data[i].layerType==6)&&(data[i].starogeType==1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=1;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
				
			});
			
			loader.load("${path}buss/js/model/shelvesBlueSevenLong/shelvesBlueSevenLong.js", function(geometry, materials) {
				var faceMaterial = new THREE.MeshFaceMaterial(materials);
				for (var i = 0; i < data.length; i++) {
					if ((data[i].type ==1)&&(data[i].layerType==7)&&(data[i].starogeType==1)) {
						var obj = new THREE.MorphAnimMesh(geometry,faceMaterial);
						addShelvesProperty(obj,data[i],0.5);
						obj.starogeType=1;
						objectArray.push(data[i].id);
					}
				}
				callBackTree(objectArray);
				
			});
				
	
			
		}
		function addShelvesProperty(obj,property,scale){
			obj.position.set(property.positionX, property.positionY,property.positionZ);
			obj.add = 0;
			obj.rsId = property.rsId;
			obj.groupId = property.groupId;
			obj.adsorbent = property.adsorbent;
			obj.last = property.last;
			obj.first = property.first;
			obj.bottom=property.bottom;
			obj.top=property.top;
			obj.rotation.x = property.rotationX;
			obj.rotation.y = property.rotationY;
			obj.rank = property.rank;
			obj.id = property.id;
			obj.type = 1;
			obj.addX=property.addX;
			obj.addY=property.addY;
			obj.aggregate=property.aggregate;
			obj.aggStatus=property.aggStatus;
			obj.layerType=property.layerType;
			obj.modelDiff=property.modelDiff;
			obj.scale.x = scale;
			obj.scale.y = scale;
			obj.scale.z = scale;
			objects.push(obj);
			scene.add(obj);
		}
		//回填树进行操作
		function callBackTree(data) {
			var treeObj = $.fn.zTree.getZTreeObj("zTree");
			for (var i = 0; i < data.length; i++) {
				var node = treeObj.getNodeByParam("WA_AREA_SN", data[i], null);
				node.font = {
					'color' : 'red'
				};
				node.temp = 1;
				treeObj.updateNode(node);
			}
		}
		//展示信息
		function showShelvesInfo(rsId) {
			$("#shelvesId").html(rsId);
			var html = "";
			var shelvesArray = getShelvesByAsn(rsId);
			shelvesArray = arraySort(shelvesArray);
			for (var i = 0; i < shelvesArray.length; i++) {
				html += "<tr>" + "<td>" + shelvesArray[i].arsn + "</td>" + "<td>"
						+ shelvesArray[i].layer + "</td>" + "</tr>";
			}
			$("#shelvesInfo").html(html);
		}
		/**
		 *根据asn 获取货架层数与货位
		 */
		function getShelvesByAsn(asn){
			var shelvesArray = new Array();
			for (var i = 0; i < allData.length; i++) {
				if (asn == allData[i].WA_SUPERIOR_SN) {
					var arlength=allData[i].WA_AREA_SN.length;
					var layer = parseInt(allData[i].WA_STOREY_NO);
					var column = parseInt(allData[i].WA_FLOW_NO);
					var data = {
						"layer" : layer,
						"column" : column,
						"arsn" : allData[i].WA_AREA_SN,
						"starogeType":allData[i].WA_STAROGE_TYPE,
						"waFace":allData[i].WA_FACE
					};
					shelvesArray.push(data);
				}
			}
			return shelvesArray;
		}
		/**
		 *冒泡排序货架层数信息
		 */
		function arraySort(array) {
			var i = 0, len = array.length;
			var temp;
			for (var i = 0; i < len; i++) {
				for (j = 0; j < len; j++) {
					if (array[i].layer < array[j].layer) {
						temp = array[j];
						array[j] = array[i];
						array[i] = temp;
					}
				}
			}
			return array;
		}
		//展示横竖屏切换界面
		function showStock(rsIdChange, rankChange) {
			var html = "";
			if (rankChange == "transverse") {
				html += "<option value='transverse' selected='selected'>横向</option>"
						+"<option value='vertical'>纵向</option>";
			} else {
				html += "<option value='transverse'>横向</option>"
						+"<option value='vertical' selected='selected'>纵向</option>";
			}
			$("#rank").html(html);
			$("#stockText").show();
		}
		//隐藏横竖屏切换界面
		function hideInfo() {
			$("#stockText").hide();
		}
		//改变横竖排序
		function toRankChange() {
			changeRank($("#rank").val());
		}
		//加载货位数据
		function gainReverData() {
			saveArray.length = 0;
			var objctLenth = objects.length;
			for (var i = 0; i < objctLenth; i++) {
				var reservorData = new Array();
				var shelvesArray = getShelvesByAsn(objects[i].rsId);
				shelvesArray = arraySort(shelvesArray);
				if(shelvesArray.length>0&&shelvesArray[0].starogeType!=1){
					//addRever(objects[i].position.x, objects[i].position.y,objects[i],shelvesArray);
				}else if(shelvesArray.length>0&&shelvesArray[0].starogeType==1){
					//addReverLong(objects[i].position.x, objects[i].position.y,objects[i],shelvesArray);
				}
				
			}
			saveData();

		}
	
	//添加货架
		function addRever(objectX, ObjectY, object,shelvesArray) {
			var layerHeight=shelvesArray[shelvesArray.length-1].layer;
			if(layerHeight==1){
				oneLayerData(objectX, ObjectY, object,shelvesArray);
				return false;
			}
			var buttomHeight=115;
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
			var layer;
			var column;
			var layerBase;
			if(object.rank == "transverse"){
				for(var i=0;i<shelvesArray.length;i++){
					var nextPisition=0;
					if((shelvesArray[i].waFace!=undefined)&&(shelvesArray[i].waFace=="S"||shelvesArray[i].waFace=="A")){
						nextPisition=160;
					}else{
						nextPisition=-160
					}
					layer = shelvesArray[i].layer;
					column =shelvesArray[i].column;
					var model = {
							"positionX" : object.position.x + column * 90 - 500,
							"positionY" : object.position.y - nextPisition,
							"positionZ" : buttomHeight + (layer - 1) * layerHeight,
							"rank" : object.rank,
							"rsId" : object.rsId,
							"id" : shelvesArray[i].arsn,
							"type" : 2,
							"groupId" :object.groupId,
							"adsorbent" : object.adsorbent,
							"rotationX" : object.rotation.x,
							"rotationY" : object.rotation.y,
							"scaleX" : 0.1,
							"scaleY" : 0.3,
							"scaleZ" : 0.1
						};
						saveArray.push(model);
				}
			}else{
				for(var i=0;i<shelvesArray.length;i++){
					var nextPisition=0;
					if((shelvesArray[i].waFace!=undefined)&&(shelvesArray[i].waFace=="S"||shelvesArray[i].waFace=="A")){
						nextPisition=70;
					}else{
						nextPisition=-70
					}
					layer = shelvesArray[i].layer;
					column =shelvesArray[i].column;
					var model = {
							"positionX" : object.position.x - nextPisition,
							"positionY" : object.position.y + column * 90 - 500,
							"positionZ" : 95 + (layer - 1) * layerHeight,
							"rank" : object.rank,
							"rsId" : object.rsId,
							"id" : shelvesArray[i].arsn,
							"type" : 2,
							"groupId" :object.groupId,
							"adsorbent" : object.adsorbent,
							"rotationX" : object.rotation.x,
							"rotationY" : object.rotation.y,
							"scaleX" : 0.2,
							"scaleY" : 0.2,
							"scaleZ" : 0.1
						};
						saveArray.push(model);
				}
				
			}
	}
	
	/**
	* 添加长货架货位
 	*/  
	function addReverLong(objectX, ObjectY, object,shelvesArray){
		var layerHeight=shelvesArray[shelvesArray.length-1].layer;
			if(layerHeight==1){
				oneLayerData(objectX, ObjectY, object,shelvesArray);
				return false;
			}
			var buttomHeight=115;
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
			var layer;
			var column;
			var layerBase;
			if(object.rank == "transverse"){
				for(var i=0;i<shelvesArray.length;i++){
					var nextPisition=0;
					if((shelvesArray[i].waFace!=undefined)&&(shelvesArray[i].waFace=="S"||shelvesArray[i].waFace=="A")){
						nextPisition=160;
					}else{
						nextPisition=-160
					}
					layer = shelvesArray[i].layer;
					column =shelvesArray[i].column;
					var model = {
							"positionX" : object.position.x + column * 90 - 500,
							"positionY" : object.position.y - nextPisition,
							"positionZ" : buttomHeight + (layer - 1) * layerHeight,
							"rank" : object.rank,
							"rsId" : object.rsId,
							"id" : shelvesArray[i].arsn,
							"type" : 2,
							"groupId" :object.groupId,
							"adsorbent" : object.adsorbent,
							"rotationX" : object.rotation.x,
							"rotationY" : object.rotation.y,
							"scaleX" : 0.1,
							"scaleY" : 0.3,
							"scaleZ" : 0.1
						};
						saveArray.push(model);
				}
			}else{
				for(var i=0;i<shelvesArray.length;i++){
					var nextPisition=0;
					if((shelvesArray[i].waFace!=undefined)&&(shelvesArray[i].waFace=="S"||shelvesArray[i].waFace=="A")){
						nextPisition=70;
					}else{
						nextPisition=-70
					}
					layer = shelvesArray[i].layer;
					column =shelvesArray[i].column;
					var model = {
							"positionX" : object.position.x - nextPisition,
							"positionY" : object.position.y + column * 90 - 500,
							"positionZ" : 95 + (layer - 1) * layerHeight,
							"rank" : object.rank,
							"rsId" : object.rsId,
							"id" : shelvesArray[i].arsn,
							"type" : 2,
							"groupId" :object.groupId,
							"adsorbent" : object.adsorbent,
							"rotationX" : object.rotation.x,
							"rotationY" : object.rotation.y,
							"scaleX" : 0.2,
							"scaleY" : 0.2,
							"scaleZ" : 0.1
						};
						saveArray.push(model);
				}
				
			}
	}
	
	/**
	* 一层数据保存
 	*/    
  function oneLayerData(objectX, ObjectY, object,shelvesArray){
	  var layerHeight=shelvesArray[shelvesArray.length-1].layer;
	  var buttomHeight=95;
	  layerHeight=450;
	  buttomHeight=400;
	  var columnX;
	  var columnY;
	  var shelvesPosition;
	  var  shelvesLever;
	  var layerBase;
		for(var i=0;i<shelvesArray.length;i++){
				shelvesPosition =parseInt(i%4);
				 shelvesLever=parseInt(i/4);
				  switch(shelvesPosition)
					{
					case 0:columnX=-1;columnY=1;
					 break;
					 case 1:columnX=1;columnY=1;
					 break;
					 case 2:columnX=-1;columnY=-1;
					 break;
					 case 3:columnX=1;columnY=-1;
					 break;
					 default:
					}
				var model = {
						"positionX" : object.position.x +columnX*200,
						"positionY" : object.position.y +columnY*200-200,
						"positionZ" : 300+shelvesLever*250,
						"rank" : object.rank,
						"rsId" : object.rsId,
						"id" : shelvesArray[i].arsn,
						"type" : 2,
						"groupId" :object.groupId,
						"adsorbent" : object.adsorbent,
						"rotationX" : object.rotation.x,
						"rotationY" : object.rotation.y,
						"scaleX" : 0.65,
						"scaleY" : 0.65,
						"scaleZ" : 0.65
					};
				if(object.rank=="vertical"){
					model.positionX= object.position.x +columnX*200-200;
					model.positionY= object.position.y +columnY*200;
				}
					saveArray.push(model);
			}
		
  }
function toRemoveReservo(){
	RemoveReservo();
	$("#stockText").hide();
}
function removeTree(rsId){
	var treeObj = $.fn.zTree.getZTreeObj("zTree");
	var nodes = treeObj.transformToArray(treeObj.getNodes());
	for (var i = 0; i < nodes.length; i++) {
		if(rsId==nodes[i].WA_AREA_SN){
			nodes[i].font = {
					'color' : '#000000'
				};
			 	nodes[i].temp = 0;
			 	treeObj.updateNode(nodes[i]);
		}
	}
}
/**
* 查询所有仓库
*/  
function queryAllArea(areaType){
    //数据交互--N2接口--仓库可视化--获取仓库
    var dataAuth = "${sessionScope.mcDataAuth}";
	$.ajax({
		type : "post",
		url : "${path}http/interface.ms?model=GetWhcode&method=GetWhcodeFunc",
		data : {
		    dataAuth: dataAuth
		},
		dataType : "json",
		success : function(data) {
			allAreaData=data;
			var html="";
			for(var i=0;i<data.length;i++){
				if(localStorage.areaPlaceNext!=undefined&&data[i].WA_AREA_SN==localStorage.areaPlaceNext){
					html+="<option value='"+data[i].WA_AREA_SN+"' selected='selected'>"+data[i].WA_AREA_NAME+"</option>";
				}else{
					html+="<option value='"+data[i].WA_AREA_SN+"'>"+data[i].WA_AREA_NAME+"</option>";
				}
				
			}
			$("#areaPlace").html(html);
			localStorage.areaPlaceNext=$("#areaPlace").val();
			saveArray.length=0;
			locationArray.length=0;
			if(areaType==1){
				queryData();
			}
			
			
		},
		error : function(data) {
			alert("系统错误！");
		}
	});
}

function saveAreaInfo(areaSn, setInfo){
    //数据交互--N2接口--仓库可视化--保存单据配置信息
	$.ajax({
		type : "post",
		url :"${path}http/interface.ms?model=SaveAreaSetInfo&method=saveAreaSetInfoFunc",		
		data : {
			areaSn:areaSn,
			setInfo:setInfo
		},
		dataType : "json",
		success : function(data) {
			msgPop("保存成功","","摩尔提示",200,150,3000);
			queryAllArea(2);
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
function msgPop(context,reloadPgExe,title,width,height,time,isCloseWin){
    $.msgPop.laysPop(width, height); //窗口大小
    $.msgPop.animPop('slide', 2000); 
    $.msgPop.showPop(title, context,time); //标题，内容，时间,如果配置为-1则不自动关闭
    if(typeof reloadPgExe=="function" ){
		reloadPgExe(isCloseWin);
	} 
 }
</script>
</body>
</HTML>
