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
		<dict:lang value="线体建模" />
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
    <script type="text/javascript" src="${path}buss/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
   	<script type="text/javascript" src="${path}plf/js/common/util.js?_mc_res_version=<%=PlfStaticRes.UTIL_JS %>"></script>
	<script type="text/javascript" src="${path}plf/page/fp/js/utilsFp.js?_mc_res_version=<%=PlfStaticRes.UTILSFP %>"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script src="${path}plf/js/msg/jquery.msg.js?_mc_res_version=<%=PlfStaticRes.JQUERYMSG%>"></script>
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
<script type="text/javascript" src="${path}buss/js/line/line.js" ></script>
<script type="text/javascript" src="${path}buss/js/slide.js"></script>


    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <style>
        
        
        .bd .main{
            box-sizing:border-box;
            height:100%;
        }
        
        .bd .main .left{
            width:200px;
            float:left;
            height:100%;
            border:1px solid #e4e4e4;
            box-sizing:border-box;
            overflow:auto;
        }
        
        .bd .main .right{
            width:calc(100% - 240px);
            margin-left:15px;
            float:left;
            height:100%;
            border:1px solid #e4e4e4;
            box-sizing:border-box;
            position: relative;
        }
        
        .bd .main .left .item[switch="on"] .head .switch{
           
        }
        
        .bd .main .left .item[switch="off"] .head .switch{
            background-color:yellow;
        }
        
        .bd .main .left .item[switch="on"] .body{
            display:block;
        }
        
        .bd .main .left .item[switch="off"] .body{
            display:none;
        }
        
        .bd .main .left .head{
            margin-top:10px;
            height:30px;
            line-height:30px;
            border-bottom:1px solid #ececec;
        }
        
        .bd .main .left .head .ico{
            width:4px;
            height:15px;
            float:left;
            background-color:#004098;
            margin-left:10px;
            margin-right:10px;
            margin-top:8px;
        }
        
        .bd .main .left .head .switch{
            width:15px;
            height:15px;
            float:right;
            margin-right:10px;
            margin-top:8px;
            cursor:pointer;
            
        }
        
        .bd .main .left .body .h{
            height:40px;
            line-height:40px;
            padding-left:30px;
            cursor:pointer;
        }
        
        .bd .main .left .body .b{
            display:none;
        }
        
        .bd .main .left .body .h .ico{
            width:10px;
            height:20px;
            float:right;
            margin-top:10px;
            margin-right:10px;
        }
        
        .bd .main .left .body .li[switch="on"] .h{
            background-color:#d9e3ef;
        }
        
        .bd .main .left .body .li[switch="off"] .h .ico{
            background-image:url(plf/page/fp/img/ico-select-more.png);
        }
        
        .bd .main .left .body .li[switch="on"] .h .ico{
            background-image:url(plf/page/fp/img/ico-select-more-h.png);
        }
        
        .bd .main .left .body .b .l{
            height:70px;
            border-bottom:1px solid #ececec;
            text-align:center;
        }
        
        .bd .main .left .body .b .l img{
            height:24px;
            margin-top:12px;
           
        }
        
        .bd .main .left .body .b .l p{
            font-size:12px;
            margin-top:5px;
        }
    </style>
</head>

<body>
	<div class="content-in">
        <div class="dlist">
            <div class="hd">
            	 <span style="color: #000000;font-size: 14px;">车间</span><select class='dept_select' id="workstation" onchange="lineInfo()"></select>
                <div class="optn"> 
		            <button type="button" onclick="zoomOut()"><i class="ico ico-search-new" ></i>放大</button>
				    <button type="button" onclick="zoomIn()" ><i class="ico ico-toSmall" ></i>缩小</button>
				    <button type="button" onclick="dismantlReservo()"><i class="ico ico-cfdy" ></i>拆分</button>
				    <button type="button" onclick="cleanScene()"><i class="ico ico-remove" ></i>清空</button>
				    <button type="button" onclick="removeObject()"><i class="ico ico-scbl" ></i>删除</button>
                    <button type="button" onclick="saveDeviceProperty()"><i class="ico ico-save" ></i>保存</button>					
                </div>
            </div>
            <div class="bd" style="padding:0px;">
                <div class="main">
               	    <div class="left">
               	        <div class="item" switch="on">
                   	        <div class="head">
                   	            <span class="ico"></span>设备区	
                                <span class="switch"></span>						
                            </div>
                            <div class="body" id="leftBody">
                                
                            </div>
           	            </div>
               	    </div>
               	    <div class="right">
               	        <div id="container" style="width: 100%;height: 100%;background-color: #ffffff" ondrop="drop(event)" ></div>
               	    </div>
               	</div>
            </div>
        </div>
    </div>
	<bu:submit viewId="7302495b1a9e48d0a591c5cea0d4fce1" />
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="beforeJsLoad" />
    </jsp:include>
	<bu:script viewId="7302495b1a9e48d0a591c5cea0d4fce1" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
    </jsp:include>
    
<script>
    	
    	
</script>

<script>
	var scrollLeft=0;//滚动条距离
	var saveArray = new Array();//保存模型数据数组
	var imgSrc;
	var deviceObject;
	var imgWidth;
	var imgHeight;
	var targetId;
	var parentId;
	var objectTitle;
	var deviceArray=new Array();
	var allAreaData;
	document.onkeydown = function (e){
        e = e || window.event;
        var keycode = e.keyCode;
        if (keycode == 17){
        	ctrlTemp=1;
        }
    }
	
	document.onkeyup = function (e){
        e = e || window.event;
        var keycode = e.keyCode;                        
        if (keycode == 17){
        	ctrlTemp=0;
        	removeShadow();
        }
    }
	
	$(function(){
		$('#contextBody').on('scroll',function(){
		    // div 滚动了
			scrollLeft=document.getElementById('contextBody').scrollLeft;
		   	
		});
		//初始化进行设置
		var setting = {
	            callback: {
	            	deleteCallBack:deleteCallBack,
	            	addObjectCallBack:addObjectCallBack
	            }
	    };
		initThree("container",setting);//初始化画布	
		initControls();//初始化控制器
		animate();//动画效果
		workstation();
		
		document.querySelector('body').onscroll = function() {
			scrollLeft=document.getElementById('contextBody').scrollLeft;
		}
		window.onresize = function(){
			scrollLeft=document.getElementById('contextBody').scrollLeft;
		}
		
	})
	
	function drag(e) {
        e.dataTransfer.setData("imgSrc", e.target.src);
        imgSrc=e.target.name;
        parentId=e.target.title;
        var imgId=e.target.id;
        targetId=imgId;
        var imgObject = document.getElementById(imgId);
        imgWidth=imgObject.naturalWidth*5;
        imgHeight=imgObject.naturalHeight*5;
        objectTitle=$("#"+targetId).next().html();
		if(imgWidth==0){
			imgWidth=40*5;
		}
        
    }
	
	function drop(e) {
		e.preventDefault();
	    imgSrc = e.dataTransfer.getData("imgSrc");
	}
	//删除选中模型
	function removeObject(){
		removeSceneObject(1);
	}
	//清除画布
	function cleanScene(){
		removeSceneObject(2);
	}
	//放大功能
	function zoomOut(){ 
		addCamera();
	}
	//缩小
	function zoomIn(){
		reduceCamera();
	}
	//拆除设备
	function dismantlObject(){
		dismantlReservo();
	}
	//保存设备数据
	function saveDeviceProperty(){
		saveArray.length=0;
		for (var i = 0; i < objects.length; i++) {
				var model = {
						"AREA_ID":objects[i].areaId,
						"LINE_ID":objects[i].lineId,
						"OBJECT_POSITIONX" : objects[i].position.x,
						"OBJECT_POSITIONY" : objects[i].position.y,
						"OBJECT_POSITIONZ" : objects[i].position.z,
						"OBJECT_RANK" : objects[i].rank,
						"OBJECT_RSID" : objects[i].rsId,
						"OBJECT_GROUPID" : objects[i].groupId,
						"OBJECT_LAST" : objects[i].last,
						"OBJECT_FIRST" : objects[i].first,
						"OBJECT_ADDY":objects[i].addY,
						"OBJECT_TYPE":objects[i].type,
						"OBJECT_AGGREGATE":objects[i].aggregate,
						"OBJECT_WIDTH":objects[i].geometry.parameters.width,
						"OBJECT_HEIGHT":objects[i].geometry.parameters.height,
			            "OBJECT_IMG_SRC":objects[i].imgSrc,
			            "OBJECT_PARENT_ID":objects[i].parentId,
			            "OBJECT_DEVICE_NAME":objects[i].name,
			            "OBJECT_TITLE":objects[i].objectTitle,
					};
					saveArray.push(model);
			
			
		}
		
			$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=line&method=addAreaInfo",
				data : {
					"object" : JSON.stringify(saveArray),
					"areaSn":$("#workstation").val()
				},
				dataType : "json",
				success : function(data) {
					msgPop("保存成功","","摩尔提示",200,150,3000);	
				},
				error : function(data) {
					alert("系统错误！");
				}
			});
		
		
		
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
			        mesh.objectTitle=data[i].OBJECT_TITLE;
			        mesh.position.set(data[i].OBJECT_POSITIONX,data[i].OBJECT_POSITIONY,data[i].OBJECT_POSITIONZ);
			        objects.push(mesh);
			        scene.add(mesh);
				}
			 	
		}
		//showFontCanvas(data);
	}
	//绑定设备
	function billingDevice(object){	
		$(".pop4-box").show();
		deviceObject=object;
		var html="";
		for(var i=0;i<deviceArray.length;i++){
			html+="<option value='"+deviceArray[i].ID+"'>"+deviceArray[i].CD_DEVICE_NAME+"</option>";
		}
		$("#deviceName").html(html);
	}
	
	//隐藏内容
	function hideInfo() {
	    $(".pop4-box").hide();
	}
	
	//绑定告警
	function billingAlarm(){
		var room_texture = "images/alarm/alarmO.png";
		var room_map = THREE.ImageUtils.loadTexture(room_texture);
		var material = new THREE.MeshPhongMaterial( { map:room_map,opacity: 1, transparent: true} );
    	var geometry = new THREE.CubeGeometry(100,300,1);
    	var mesh=new THREE.Mesh(geometry,material);
    	var timestamp = Date.parse(new Date());
        var randId=parseInt(Math.random()*1000000)+timestamp;
    	 mesh.position.set(deviceObject.position.x,deviceObject.position.y+350,0);
    	 mesh.addY=350;
         mesh.rsId = randId;
         mesh.groupId = randId;
         mesh.aggregate=deviceObject.aggregate;
         mesh.add = 0;
         mesh.rank = "transverse";
         mesh.id = randId;
         mesh.type = 2;
         mesh.last = 1;
         mesh.first = 1;
         mesh.parentId=deviceObject.id;
         mesh.imgWidth=100;
         mesh.imgHeight=300;
	     mesh.imgSrc=room_texture;
         objects.push(mesh);
         scene.add(mesh);
        
    }
	
	function workstation(){
		 $.ajax({
 	          type: "post",
 	          url: "${path}http/interface.ms?model=line&method=getWorkstationList",
 	          data: {
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
 	          	 	lineInfo();
 	          		
 	          },
 	          error: function(data) {
 	              alert("系统错误！");
 	              
 	          }
 	      });
	}
	
	function lineInfo(){
		 $.ajax({
	    	    type: "post",
	            url: "${path}http/interface.ms?model=line&method=getAreaInfo",
	           	data: {areaSn:$("#workstation").val()},
	           	dataType: "json",
	            success: function(data) {
	            	var html="";
	            	for(var i=0;i<data.length;i++){
	            		
	            		html+="<div class='li' switch='off' id='"+data[i].CA_ID+"'>"+
                            "<div class='h'>"+data[i].CA_NAME+"<span class='ico titleIcon'></span></div>"+
                            "<div class='b' id='"+data[i].CA_ID+"next'>"+
                            "</div>"+
							"</div>";
	            	}
	            	$("#leftBody").html(html);
	            	addBaseLineInfo();
	            	localStorage.workstation=$("#workstation").val();
	            },
	            error: function(data) {
	                alert("系统错误！");
	                
	            }
	        });
	}
	/**
	 *添加基础线信息
	 */
	function addBaseLineInfo(){
		var html="<div class='li' switch='off' id='baseEquip'>"+
	            "<div class='h'>车间轨道<span class='ico titleIcon'></span></div>"+
	            "<div class='b'>"+
	            "  <div class='l'><img src='${path}buss/images/lineIcon/track.png' name='${path}buss/images/lineIcon/track.png' ondragstart='drag(event)' id='patchMachineAll' style='width:32px;cursor:pointer'><p>包装完成轨道</p></div>"+
	            "  <div class='l'><img src='${path}buss/images/lineIcon/track-long.png' name='${path}buss/images/lineIcon/track-long.png' ondragstart='drag(event)' id='patchMachineLong' style='width:32px;cursor:pointer'><p>长轨道</p></div>"+
	            "  <div class='l'><img src='${path}buss/images/lineIcon/track-short.png' name='${path}buss/images/lineIcon/track-short.png' ondragstart='drag(event)' id='patchMachineShort' style='width:32px;cursor:pointer'><p>短轨道</p></div>"+
	            "  <div class='l'><img src='${path}buss/images/lineIcon/general-process.png' name='${path}buss/images/lineIcon/general-process.png' ondragstart='drag(event)' id='patchMachineCurrency' style='width:32px;cursor:pointer'><p>通用轨道</p></div>"+

	            " </div>"+
	        	" </div>";
	        	
		$("#leftBody").append(html);
		addBaseAreaDevice();
		
	}
	
	
	function equiptInfo(equipId){
		$.ajax({
	    	    type: "post",
	            url: "${path}http/interface.ms?model=line&method=getAreaDeviceInfo",
	            //data:{"name":"grayworm","areaSn":"1"},
	           data: {areaSn:equipId,
	        	   	  areaType:1
	        	   	},
	           dataType: "json",
	            success: function(data) {
	            	var html="";
	            	for(var i=0;i<data.length;i++){
	            		var imgUrl="up_load/comm/"+data[i].PICTURE_PATH;
	            		/* if(!isHasImg(imgUrl)){
	            			imgUrl="${path}buss/images/icon/noImg.png";
	            		} */
	            		html+="<div class='l'><img src='"+imgUrl+"' name='"+imgUrl+"' ondragstart='drag(event)' id='"+data[i].CD_DEVICE_SN+"' title='"+equipId+"' style='cursor:pointer' onerror='imgError(this)'><p>"+data[i].CD_DEVICE_NAME+"</p></div>";
	            	}
	            	html+="<div class='l'><img src='${path}buss/images/lineIcon/begin.png'  name='${path}buss/images/lineIcon/begin.png' ondragstart='drag(event)' id='lineBegin"+equipId+"' title='"+equipId+"' style='width:32px;cursor:pointer'><p>轨道</p></div>";
	            	equipId="#"+equipId+"next";
	            	$(equipId).html(html);
	            	removeAllSceneRs();
	            },
	            error: function(data) {
	                alert("系统错误！");
	                
	            }
	        });
	}
	/**
	 *添加基础线信息
	 */
	function addBaseAreaDevice(){
		 $.ajax({
	    	    type: "post",
	            url: "${path}http/interface.ms?model=line&method=getAreaDeviceInfo",
	            //data:{"name":"grayworm","areaSn":"1"},
	           data: {areaSn:$("#workstation").val(),
	        	   areaType:2
	        	   	},
	           dataType: "json",
	            success: function(data) {
	            	var html="";
	            	for(var i=0;i<data.length;i++){
	            		html+="<div class='l'><img src='${path}"+data[i].PICTURE_PATH+"' name='${path}"+data[i].PICTURE_PATH+"' ondragstart='drag(event)' ><p>"+data[i].CD_DEVICE_NAME+"</p></div>";
	            	}
	            	$("#areaEquip").html(html);
	            	
	            	$(".item .switch").click(function(){
	            	    if($(this).parents(".item").attr('switch') == "on"){
	                        $(this).parents(".item").attr('switch','off');
	                    }else{
	                        $(this).parents(".item").attr('switch','on');
	                        
	                    }
	            	})
	            	
	            	$(".titleIcon").click(function(){
	            	    if($(this).parent().parent().attr('switch') == "on"){
	                        $(this).parent().parent().attr('switch','off')	
	                    }else{
	                        $(this).parent().parent().attr('switch','on');
	                        $(this).parent().parent().siblings(".li").attr('switch','off');
	                        var equipId=$(this).parent().parent().attr("id");
	                        if(equipId!="baseEquip"){
	                        	equiptInfo(equipId);
	                        }
	                    }
	                    
	                    $(this).parent().parent().find(".b").slideToggle()
	                    $(this).parent().parent().siblings(".li").find(".b").slideUp()
	            	   
	                    
	            	})
	            	addCanvasContenxt();
	            },
	            error: function(data) {
	                alert("系统错误！");
	                
	            }
	        });
		
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
	
	//添加设备信息
	function addDevice(data){
		deviceArray.length=0;
		var html="<div class='equip-span'>线体下设备:</div>";
		$("#deviceInfo").html(html);
		for(var i=0;i<data.length;i++){
			if(validateBar(data[i].ID)){
				addBarInfo(data[i].ID,data[i].CD_DEVICE_NAME);
				var temp={"ID":data[i].ID,"CD_DEVICE_NAME":data[i].CD_DEVICE_NAME};
				deviceArray.push(temp);
			}
		}
	}
	//移除设备条信息
	function removeBarInfo(id){
		$("#"+id).remove();
	}
	//添加头部信息
	function addBarInfo(id,deviceName){
		var html="<div class='equip-span' id='"+id+"'>"+deviceName+"</div>";
		$("#deviceInfo").append(html);
	}
	//删除画布上内容回调函数
	function deleteCallBack(object){
		var rsId=object.rsId;
		var parentIdNext=object.parentId;
		var html="<div class='l'><img src='"+object.imgSrc+"' name='"+object.imgSrc+"' ondragstart='drag(event)' id='"+rsId+"' title='"+parentIdNext+"' style='cursor:pointer'><p>"+object.objectTitle+"</p></div>";
		parentIdNext="#"+parentIdNext+"next";
		$(parentIdNext).append(html);
		
	}
	//添加设备名称
	function addDeviceName(deviceInfo,status){
		if(status==1){
			for(var i=0;i<objects.length;i++){
				if(objects[i].type=3&&objects[i].parentId==deviceObject.id){
					objects.remove(objects[i]);
					scene.remove(objects[i]);
				}
			}	
		}
		var geometry = new THREE.CubeGeometry(500, 200, 10);
		texture = new THREE.Texture(gainCanvasTexture(deviceInfo.CD_DEVICE_NAME));
        var material = new THREE.MeshBasicMaterial({map:texture});
		texture.needsUpdate = true;
        mesh = new THREE.Mesh( geometry,material);
        mesh.aggregate=deviceObject.aggregate;
        mesh.parentId=deviceObject.id;
        mesh.rank = "transverse";
        mesh.type = 3;
        mesh.last = 1;
        mesh.first = 1;
        mesh.name=deviceInfo.CD_DEVICE_NAME;
        var timestamp = Date.parse(new Date());
        var randId=parseInt(Math.random()*1000000)+timestamp;
        mesh.rsId=randId;
        mesh.groupId=deviceObject.groupId;
        mesh.lineId=$("#lineInfo").val();
        mesh.areaId=$("#workstation").val();
        mesh.position.set(deviceObject.position.x,deviceObject.position.y+300,deviceObject.position.z);
        mesh.addY=350;
        scene.add(mesh);
        objects.push(mesh);
	}
	
	function validateBar(rsId){
		var temp=true;
		for(var i=0;i<objects.length;i++){
			if(rsId==objects[i].rsId){
				temp=false;
			}
		}
		return temp;
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
	//添加模型回调函数
	function addObjectCallBack(x,y){
		var room_texture = imgSrc;
		var room_map = THREE.ImageUtils.loadTexture(room_texture);
		var material = new THREE.MeshPhongMaterial( { map:room_map,opacity: 1, transparent: true});
    	var geometry = new THREE.CubeGeometry(imgWidth,imgHeight,1);
    	var mesh=new THREE.Mesh(geometry,material);
        mesh.position = new THREE.Vector3(0,0,0);
        var timestamp = Date.parse(new Date());
        var randId=parseInt(Math.random()*1000000)+timestamp;
        mesh.groupId = randId;
        mesh.aggregate=randId;
        mesh.add = 0;
        mesh.rank = "transverse";
        mesh.type = 1;
        mesh.last = 1;
        mesh.first = 1;
        mesh.addY=0;
        mesh.rsId=targetId;
        mesh.name=targetId;
        mesh.imgWidth=imgWidth;
        mesh.imgHeight=imgHeight;
        mesh.imgSrc=imgSrc;
        mesh.parentId=parentId;
        mesh.objectTitle=objectTitle;
    	mesh.position.set(x,y,0);
    	objects.push(mesh);
        scene.add(mesh);
        if(targetId.indexOf("atchMachine")>0||"lineBegin"==targetId){
        	
        }else{
        	var rsId="#"+targetId;
    		$(rsId).parent().remove();
        }
        
		
	}
	
	function isHasImg(pathImg){
	    var ImgObj=new Image();
	    ImgObj.src= pathImg;
	     if(ImgObj.fileSize > 0 || (ImgObj.width > 0 && ImgObj.height > 0))
	     {
	       return true;
	     } else {
	       return false;
	    }
	}
	
	
	/**
	 *移除画布上相关图片
	 */
	function removeAllSceneRs(){
		for(var i=0;i<objects.length;i++){
				var rsId=objects[i].rsId;
			if(rsId.indexOf("patchMachine")>=0){
				
				
			}else{
				rsId="#"+objects[i].rsId;
				$(rsId).parent().remove();
			}
			
		}
	}
	/**
	 *图片错误情况
	 */
	function imgError(object){
		object.src="${path}buss/images/icon/noImg.png";
		object.name="${path}buss/images/icon/noImg.png";
	}
	
	
</script>

<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
