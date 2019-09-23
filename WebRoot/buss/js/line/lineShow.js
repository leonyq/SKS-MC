/**
 * Created by hzp on 2017/3/16 
 */
var container;//画布元素
var renderer;//渲染器
var scene;//场景
var camera;//相机
var light;//设置光源
var width;//获取画布「canvas3d」的宽
var height;//获取画布「canvas3d」的高
var controls;//作为鼠标控制相机移动 
var objects = [];//装置所以模型对象
var texture;//材质纹理
var clickMethod;//单击事件
var dbClickMethod;//双击事件
var material//货架为空的材料
var materialsBack;//货架为空的材料
var plane;//地板平面
var mouse = new THREE.Vector2();
var offset = new THREE.Vector3();
var intersected;//相交物体
var selected;//鼠标选择物体 
var needTemp=0;//是否添加货架标志
var rsIdChange;//改变物体的rsId属性
var rankChange;//改变物体的横竖向属性
var group, text;
var selectObj; //右键被选择物体
var altTemp=0;//键盘alt键标志，按下时候为1
var ctrlTemp=0;
var shawArray=new Array();//装载阴影部分模型
var shawDetailArray=new Array();//装载需要对齐模型
/**
 * 加载初始化设置
 * @param id
 * @param setting
 */
function initThree(id) {
	container = document.getElementById(id);
	width = document.getElementById(id).clientWidth;
	height = document.getElementById(id).clientHeight; 
    //初始化渲染器
	renderer = new THREE.WebGLRenderer({
		antialias : true,
		precision : "lowp",
		alpha : true,
		premultipliedAlpha : false,   
		stencil : false,
		preserveDrawingBuffer : true                                                          
	});
	renderer.setSize( width, height);//设置渲染器宽度与高度
	renderer.setClearColorHex(0xFFFFFF, 0);//渲染器清除背景颜色
	//加入鼠标拖动对象的一系列监听事件
    renderer.domElement.addEventListener( 'mousemove', onDocumentMouseMove, false);
    renderer.domElement.addEventListener( 'mousedown', onDocumentMouseDown, false);
    renderer.domElement.addEventListener( 'mouseup', onDocumentMouseUp, false);
    projector = new THREE.Projector();
	container.appendChild(renderer.domElement);//画布添加渲染器
	scene = new THREE.Scene();//初始化场景
	camera = new THREE.PerspectiveCamera(60,  width/height, 1, 100000);//设置相机属性
	camera.up.x=0; 
	camera.up.y=1;
	camera.up.z=0;
	camera.position.set(0, 1000, 7700);
	light = new THREE.AmbientLight(0xffffff);//设置光源属性
	light.position.set(0, 0, 100000);
	scene.add(light);
	/*var texture = "buss/images/model/floor/floor.png";//地板纹理
	var map = THREE.ImageUtils.loadTexture(texture);
	map.wrapS = map.wrapT = THREE.RepeatWrapping;//地板平铺状态
	map.repeat.set(28, 17);  
	var material = new THREE.MeshPhongMaterial({map:map});
	var geometry = new THREE.CubeGeometry(16000,1,1800);
	plane = new THREE.Mesh(geometry,material);
	plane.position.set(0, 0, 0);
    //把网格对象加到场景中
    scene.add(plane);*/
	
}

/**
 * 初始化鼠标控制
 */
function initControls() {
	controls = new THREE.TrackballControls(camera, renderer.domElement);
	controls.rotateSpeed = 0.0;
	controls.enabled=false;
	controls.addEventListener('change', render); 
}
/**
 * 二次渲染
 */
function render() {
	renderer.render(scene, camera);
}

function animate(){
	requestAnimationFrame(animate);
	render();
	controls.update();
}

//当鼠标移动时触发的事件
function onDocumentMouseMove(event) {
	event.preventDefault();
	var otherHeight=$(".body-head").outerHeight(true)+$(".con1").outerHeight(true);
	var otherWidth= $(".con2").outerWidth(true);
	var x = event.clientX-otherWidth+5;
	var y = event.clientY - otherHeight-40;
	var vector = new THREE.Vector3((x / width) * 2 - 1, -(y / height) * 2 + 1,0.5);
	projector.unprojectVector(vector, camera);
	var raycaster = new THREE.Raycaster(camera.position, vector.sub(camera.position).normalize());
	var intersects = raycaster.intersectObjects(objects);
		  if (intersects.length > 0) {//左键点击事件
			  container.style.cursor = 'pointer';
		  }else{
			  container.style.cursor = 'auto';
		  }
}
//当鼠标按下时触发的事件
function onDocumentMouseDown(event) {
	if(event.button==0){
		leftClickMehtod(event);
	}else if(event.button==2){
		rightClickMethod(event);
	} 
}
/**
 * 左边鼠标点击事件
 */
function leftClickMehtod(event){
	event.preventDefault();
	var otherHeight=$(".body-head").outerHeight(true)+$(".con1").outerHeight(true);
	var otherWidth= $(".con2").outerWidth(true);
	var x = event.clientX-otherWidth+5;
	var y = event.clientY - otherHeight-40;
	var vector = new THREE.Vector3((x / width) * 2 - 1, -(y / height) * 2 + 1,0.5);
	projector.unprojectVector(vector, camera);
	var raycaster = new THREE.Raycaster(camera.position, vector.sub(camera.position).normalize());
	var intersects = raycaster.intersectObjects(objects);
		  if (intersects.length > 0) {//左键点击事件
				var selected = intersects[0].object;
				var rsId = selected.rsId;
				showManageInfo(rsId,selected);
			}
}
/**
 *右边鼠标点击事件
 */
function rightClickMethod(event){
	//计算点击位置
	event.preventDefault();
	var x = (event.clientX-270);
	var y = (event.clientY-238);
	var vector = new THREE.Vector3((x / width) * 2 - 1, -(y / height) * 2 + 1,0.5);
	 //屏幕和场景转换工具根据照相机，把这个向量从屏幕转化为场景中的向量
	projector.unprojectVector(vector, camera);
	var raycaster = new THREE.Raycaster(camera.position, vector.sub(camera.position).normalize());
	var intersects = raycaster.intersectObjects(objects);
	var transverseArray=new Array();
		//点击事件与物体有交叉上
		  if (intersects.length > 0) {//左键点击事件
				selectObj = intersects[0].object;
				rsIdChange = selectObj.rsId;
				rankChange=selectObj.rank;
				billingDevice(selectObj);
		}
		  selected=null;
}

/**
 * 释放鼠标事件
 */

function onDocumentMouseUp(event) {
	event.preventDefault();
    //又能改变视角了
    controls.enabled = true;
    //如果有相交物体
    if ( intersected ) {
        selected = null;
    }
    //改变鼠标的样式
    container.style.cursor = 'auto';
}
/**
 * 正视图
 */
function faceView(){
	camera.up.x=0;
	camera.up.y=0;
	camera.up.z=1;
	camera.position.set(0, -10000, 4000);
}

/**
 * 俯视图
 */
function overView(){
	camera.position.set(0,0,7801);
	camera.up.x = 0;//相机以哪个方向为上方
	camera.up.y = 0;
	camera.up.z = 0;
}
/**
 * 左视图
 */
function LeftView(){
	camera.up.x=0;
	camera.up.y=0;
	camera.up.z=1;
	camera.position.set(13000, -0, 6000);
}
/**
 * 右视图
 */
function rightView(){
	camera.up.x=0;
	camera.up.y=0;
	camera.up.z=1;
	camera.position.set(-13000, -0, 6000);
}
/**
 * 初始化
 */
function initView(){
	camera.position.set(0,0,7801);
	camera.up.x = 0;//相机以哪个方向为上方
	camera.up.y = 0;
	camera.up.z = 0;
}

/**
 * 拉近相机角度
 */
function addCamera(){
	camera.position.z=camera.position.z-200;
	
}
/**
 * 拉近相机角度
 */
function reduceCamera(){
	camera.position.z=camera.position.z+200;
	
}

/**
 * 居左对齐
 */
function alignLeft(){
	for(var i=0;i<objects.length;i++){
		if(objects[i].positionId==1){
			var postionX=objects[i].position.x;
			var addX=postionX+17000;
			var rsId=objects[i].rsId;
			alignLeftDetail(rsId,addX);
		}
	}
}

/**
 * 右居中
 */
function alignRight(){
	for(var i=0;i<objects.length;i++){
		if(objects[i].positionId==2){
			var postionX=objects[i].position.x;
			var addX=postionX-17000;
			var rsId=objects[i].rsId;
			alignLeftDetail(rsId,addX);
		}
	}
}
/**
 * 左居中具体操作
 * @param rsId
 * @param addX
 */
function alignLeftDetail(rsId,addX){
	for(var i=0;i<objects.length;i++){
		if(objects[i].rsId==rsId){
			objects[i].position.x=objects[i].position.x-addX;
		}
	}
}
/**
 * 验证是否到达位左右靠顶
 */
function validatePosiotion(addX,addY,rsId,tempRank){
	if(tempRank=="transverse"){
		return validateTransverse(addX,rsId);
	}else{
		return validateVertical(addY,rsId);
	}
}
/**
 * 横向不能超出画布范围计算
 */
function validateTransverse(addX,rsId){
	var temp=true;
	var obejctLength=objects.length;
	if(addX<0){
		for(var i=0;i<obejctLength;i++){ 
			if((objects[i].positionId==1)&&(objects[i].rsId==rsId)){
				var postionX=objects[i].position.x;
				if(postionX<=-18000){
					temp=false;
					break;
				}
			}
		}
		                                                                                                                                               
	}else{
		for(var i=0;i<obejctLength;i++){
			if((objects[i].positionId==2)&&(objects[i].rsId==rsId)){
				var postionX=objects[i].position.x;
				if(postionX>=18000){
					temp=false;
					break;
				}
			}
		}
	}
	return temp;
}
/**
 * 纵向不能超出画布范围计算
 */
function validateVertical(addY,rsId){
	var temp=true;
	var obejctLength=objects.length;
	if(addY<0){
		for(var i=0;i<obejctLength;i++){
			if((objects[i].positionId==1)&&(objects[i].rsId==rsId)){
				var postionY=objects[i].position.y;
				if(postionY<=-9000){
					temp=false;
					break;
				}
			}
		}
		                                                                                                                                               
	}else{
		for(var i=0;i<obejctLength;i++){
			if((objects[i].positionId==2)&&(objects[i].rsId==rsId)){
				var postionY=objects[i].position.y;
				if(postionY>=9000){
					temp=false;
					break;
				}
			}
		}
	}
	return temp;
}
/**
 * 改变排列顺序
 * param rank ：横向
 */
function changeRank(rank){
	if(rank==selectObj.rank){
		return false;
	}
	//装载需要横竖切换的模型
	var transverseArray=new Array();
	//双排货架另外一排数据
	var groupArray=new Array();
	var objectLenth=objects.length;
	for(var i=0;i<objectLenth;i++){
		if((objects[i].groupId==selectObj.groupId)&&(objects[i].type==1)){
			transverseArray.push(objects[i]);//装载点击当前货架
		}
		if((objects[i].aggregate==selectObj.aggregate)&&((objects[i].groupId!=selectObj.groupId))){
			groupArray.push(objects[i]);//装载重合的货架
		}
	}
	selectX=selectObj.position.x;
	selectY=selectObj.position.y;
	//改变为竖排操作
	if(rank=="vertical"){
		if((groupArray.length>0)&&(groupArray[0].position.y>transverseArray[0].position.y)){
			var temp=groupArray;
			groupArray=transverseArray;
			transverseArray=temp;
		}
		//当前整排货架旋转成竖排
		 transverseArray=sortVerticalObject(transverseArray);
		 var tranLenth=transverseArray.length;
		 var lengthNum=parseInt(tranLenth/2);
		 for(var i=0;i<tranLenth;i++){
			 transverseArray[i].rotation.y = 3.14/2;
			 transverseArray[i].rank="vertical";
			 transverseArray[i].position.x=selectX;
			 transverseArray[i].position.y=selectY-1000*(lengthNum-i);
			 transverseArray[i].addX=0;
		 }
		 if(groupArray.length==0){
			 return false;
		 }
		//合并的货架旋转为竖排
		 groupArray=sortVerticalObject(groupArray);
		 var groupLenth=groupArray.length;
		 var groupNum=parseInt(groupLenth/2);
		 for(var i=0;i<groupLenth;i++){
			 groupArray[i].rotation.y = 3.14/2;
			 groupArray[i].rank="vertical";
			 groupArray[i].position.y=transverseArray[tranLenth-1].position.y-1000*i;
			 groupArray[i].position.x=selectX-300;
			 groupArray[i].addX=-300;
		 }
	}else{
		//改变为横排操作
		if((groupArray.length>0)&&(groupArray[0].position.x>transverseArray[0].position.x)){
			var temp=groupArray;
			groupArray=transverseArray;
			transverseArray=temp;
		}
		//当前整排货架旋转成横排
		 transverseArray=sortTransverseObject(transverseArray);
		 var tranLenth=transverseArray.length;
		 var lengthNum=parseInt(tranLenth/2);
		 for(var i=0;i<tranLenth;i++){
			 transverseArray[i].rotation.y=0;
			 transverseArray[i].rank="transverse";
			 transverseArray[i].position.y=selectY;
			 transverseArray[i].position.x=selectX-1000*(lengthNum-i);
			 transverseArray[i].addY=0;
		  }
		 if(groupArray.length==0){
			 return false;
		 }
		//合并的货架旋转为横排
		 groupArray=sortTransverseObject(groupArray);
		 var groupLenth=groupArray.length;
		 var groupNum=parseInt(groupLenth/2);
		 for(var i=0;i<groupLenth;i++){ 
			 groupArray[i].rotation.y=0;
			 groupArray[i].rank="transverse";
			 groupArray[i].position.y=selectY-300;
			 groupArray[i].position.x=transverseArray[0].position.x+1000*i;
			 groupArray[i].addY=-300;
		 }
		 
	}
	 
	  selected=null;
	
}

/**
 * 单个货架自动吸附功能
 */
function adsorbent(object){
	if(object.adsorbent==1){//吸附属性为1说明已经完成吸附
		return false;
	}
	var temp=true;
	if(object.rank=="transverse"){
		transverseAdsorbent(object);
	}else{
		verticalAdsorbent(object);
	}
	return temp;
}
/**
 * 横向吸附功能
 */
function transverseAdsorbent(object){
	for(var i=0;i<objects.length;i++){
		if((object!=objects[i])&&(objects[i].rank=="transverse")&&(objects[i].last==1||objects[i].first==1)){
			var x=object.position.x-objects[i].position.x-parseInt(object.imgWidth)/2-parseInt(objects[i].imgWidth)/2;
			var y=Math.abs(object.position.y-objects[i].position.y);
			var changeX;
			//右边吸附功能
			if((x<0)&&(x>-900)&&(y<100)&&(objects[i].last==1)){
				object.groupId=objects[i].groupId;//更改吸附后归属组别
				object.aggregate=objects[i].aggregate;//更改吸附后归属集合
				object.adsorbent=1;//标志为已经吸附
				object.group=1;//标志已有归属组
				object.last=1;//标志加在最后一位
				object.first=0;//标志不为最后一位
				changeX=object.position.x;
				object.position.x=objects[i].position.x+objects[i].imgWidth/2+object.imgWidth/2;
				changeX=object.position.x-changeX;
				object.position.y=objects[i].position.y;
				objects[i].group=1;
				objects[i].adsorbent=1;
				objects[i].last=0;
				object.groupId=objects[i].groupId;
				if((objects[i].addY!=undefined)){
					object.addY=objects[i].addY;
				}
				selected = null; 
				temp=false;
			}
			
			
		}
	}
}
/**
 * 纵向吸附
 */
function verticalAdsorbent(object){
	for(var i=0;i<objects.length;i++){
		if((object!=objects[i])&&(object.modelDiff==objects[i].modelDiff)&&(objects[i].rank=="vertical")&&(objects[i].type==1)&&(objects[i].top==1||objects[i].bottom==1)){
			var x=Math.abs(object.position.x-objects[i].position.x);
			var y=object.position.y-objects[i].position.y;
			var changeX;
			//上面吸附
			if((y>0)&&(y<900)&&(x<10)){
				object.groupId=objects[i].groupId;
				object.aggregate=objects[i].aggregate;
				
				object.adsorbent=1;
				object.top=1;//标识头部为第一位
				object.bottom=0;//标识不为底部
				object.position.x=objects[i].position.x;
				object.position.y=objects[i].position.y+1000;
				object.adsorbent=1;
				objects[i].group=1;
				objects[i].adsorbent=1;
				objects[i].top=0;
				objects[i].adsorbent=1;
				selected = null; 
				temp=false;
			}
			//底部吸附功能
			if((y<0)&&(y>-900)&&(x<10)){
				object.groupId=objects[i].groupId;
				object.aggregate=objects[i].aggregate;
				
				object.adsorbent=1;
				object.bottom=1;
				object.position.x=objects[i].position.x;
				object.position.y=objects[i].position.y-1000;
				object.adsorbent=1;
				objects[i].group=1;
				objects[i].adsorbent=1;
				objects[i].bottom=0;
				objects[i].adsorbent=1;
				selected = null; 
				temp=false;
			}
		}
	}
}
/**
 *横向数组排序
 */
function sortTransverseObject(transverseArray){
	var len=transverseArray.length;
	for(var i=0;i<len;i++){
		transverseArray[i].first=0;
		transverseArray[i].last=0;
		transverseArray[i].top=0;
		transverseArray[i].bottom=0;
		for(var j=0;j<len;j++){
			if(transverseArray[i].position.x <transverseArray[j].position.x){
				temp=transverseArray[j];
				transverseArray[j] = transverseArray[i];
				transverseArray[i] = temp;
			}
		}
	}
	//如果数组长度为1
	if(transverseArray.length==1){
		 transverseArray[0].first=1; //横排为第一个
		 transverseArray[0].last=1;//横排最后一个
		 transverseArray[0].group=0;
		 transverseArray[0].adsorbent=0;
	}else{
		 transverseArray[0].first=1;//横排第一个
		 transverseArray[0].last=0;
		 transverseArray[len-1].first=0;
		 transverseArray[len-1].last=1;//横排最后一个
	 }
	return transverseArray;
}

/**
 * 纵向数组排序
 */
function sortVerticalObject(transverseArray){
	var len=transverseArray.length;
	for(var i=0;i<len;i++){
		transverseArray[i].first=0;
		transverseArray[i].last=0;
		transverseArray[i].top=0;
		transverseArray[i].bottom=0;
		for(var j=0;j<len;j++){
			if(transverseArray[i].position.y < transverseArray[j].position.y){
				temp=transverseArray[j];
				transverseArray[j] = transverseArray[i];
				transverseArray[i] = temp;
			}
		}
	}
	//如果数组长度为1
	if(transverseArray.length==1){
		 transverseArray[0].top=1;//数据为竖排第一个
		 transverseArray[0].bottom=1;//数据为竖排最后一个
		 transverseArray[0].group=0;
		 transverseArray[0].adsorbent=0;
	 }else{
		 transverseArray[0].top=0;
		 transverseArray[0].bottom=1;
		 transverseArray[len-1].top=1;
		 transverseArray[len-1].bottom=0;
	 }
	return transverseArray;
}

/**
 * 货架拆解功能
 */
function dismantlReservo(){
	//是否是只有一个，只有一个不拆解
	if((shawArray.length==0)||(shawArray.length>1)){
		return false;
	}
	selectObj=shawArray[0];
	if(!((selectObj.last==1)||(selectObj.first==1))){
		return false;
	}
	
	var objectLenth=objects.length;
	var transverseArray=new Array();
	//本排货架重新装载
	for(var i=0;i<objectLenth;i++){
		if((objects[i].groupId==selectObj.groupId)&&(selectObj!=objects[i])){
			transverseArray.push(objects[i]);
		}
	} 
	transverseArray=sortTransverseObject(transverseArray);
	 selectObj.last = 1;
	 selectObj.first = 1;
	 selectObj.top=0;
	 selectObj.bottom=0;
	var timestamp = Date.parse(new Date());
	timestamp = timestamp / 1000;
	selectObj.groupId=selectObj.rsId+timestamp;
	selectObj.aggregate=selectObj.rsId+timestamp;
	selectObj.adsorbent=0;
	selectObj.group=0;
}


/**
 * 居左对齐
 */
function leftAlign(){
	//选中行数大于一行，且货架是横排排列
	if((shawDetailArray.length>0)&&(shawDetailArray[0][0].rank=="transverse")){
		var object=shawDetailArray[0][0];//第一排第一个模型为基准
		for(var i=1;i<shawDetailArray.length;i++){
			var objects=shawDetailArray[i];
			var addX=objects[0].position.x-object.position.x;
			for(var j=0;j<objects.length;j++){
				objects[j].position.x=objects[j].position.x-addX;
			}
		}
		removeShaw();
	}
	
}
/**
 * 居右对齐
 */
function rightAlign(){
	//选中行数大于一行，且货架是横排排列
	if((shawDetailArray.length>0)&&(shawDetailArray[0][0].rank=="transverse")){
		var object=shawDetailArray[0][shawDetailArray[0].length-1];//第一排最后一个模型为基准
		for(var i=1;i<shawDetailArray.length;i++){
			var objects=shawDetailArray[i];//第二排开始于第一排为第一个模型基准调整位置
			var addX=objects[objects.length-1].position.x-object.position.x;
			for(var j=0;j<objects.length;j++){
				objects[j].position.x=objects[j].position.x-addX;
			}
		}
		removeShaw();//移除阴影面积
		
	}
	
}
/**
 * 顶部对齐
 */
function topAlign(){
	//选中行数大于一行，且货架是竖排排列
	if((shawDetailArray.length>0)&&(shawDetailArray[0][0].rank=="vertical")){
		var object=shawDetailArray[0][shawDetailArray[0].length-1];//第一排第一个模型为基准
		for(var i=1;i<shawDetailArray.length;i++){
			var objects=shawDetailArray[i];//第二排开始于第一排为第一个模型基准调整位置
			var addY=objects[objects.length-1].position.y-object.position.y;
			for(var j=0;j<objects.length;j++){
				objects[j].position.y=objects[j].position.y-addY;
			}
		}
		removeShaw();//移除阴影面积
		
	}
	
}
/**
 * 底部对齐
 */
function buttomAlign(){
	//选中行数大于一行，且货架是竖排排列
	if((shawDetailArray.length>0)&&(shawDetailArray[0][0].rank=="vertical")){
		var object=shawDetailArray[0][0];//第一排第一个模型为基准
		for(var i=1;i<shawDetailArray.length;i++){
			var objects=shawDetailArray[i];//第二排开始于第一排为第一个模型基准调整位置
			var addY=objects[0].position.y-object.position.y;
			for(var j=0;j<objects.length;j++){
				objects[j].position.y=objects[j].position.y-addY;
			}
		}
		  removeShaw();//移除阴影面积
		
	}
	
}
/**
 * 移除选中模型阴影面积
 */
function removeShaw(){
	for(var i=0;i<shawArray.length;i++){
		if(shawArray[i].type==3){
			scene.remove(shawArray[i]);
		}
	}
	shawArray.length=0; //清除阴影部分数组
	shawDetailArray.length=0; //清除装载需要对齐数组
}
/**
 * 移除货架功能
 */
function RemoveReservo(){
	if(!((selectObj.last==1)||(selectObj.first==1)||(selectObj.top==1)||(selectObj.bottom==1))){
		return false;
	}
	var objectLenth=objects.length;
	var transverseArray=new Array();
	//本排货架重新装载
	for(var i=0;i<objectLenth;i++){
		if((objects[i].groupId==selectObj.groupId)&&(objects[i].type==1)&&(selectObj!=objects[i])){
			transverseArray.push(objects[i]);
		}
	}
	//横向排列的时候操作动作
	if(selectObj.rank=="transverse"){
		 transverseArray=sortTransverseObject(transverseArray);
	}else{
		 transverseArray=sortVerticalObject(transverseArray);
	}
	removeTree(selectObj.rsId);
	scene.remove(selectObj);
	objects.remove(selectObj);
	
}

/**
 * 点击模型添加阴影部分
 */
function addShadow(object){
	object.material.opacity=0.5;
	shawArray.push(object);
}
/**
 * 移除模型阴影部分
 */
function removeShadow(){
	for(var i=0;i<shawArray.length;i++){
		shawArray[i].material.opacity=1;
	}
	shawArray.length=0;
}

/**
 * 移除场景中模型
 */
function removeSceneObject(type){
	if(type==1){
		for(var i=0;i<shawArray.length;i++){
			scene.remove(shawArray[i]);
			objects.remove(shawArray[i]);
		}
		
	}else{
		for(var i=0;i<objects.length;i++){
			scene.remove(objects[i]);
		}
		objects.length=0;
	}
	
}
/**
 * 移除场景内所有模型
 */
function removeSceneAllObject(){
	for(var i=0;i<objects.length;i++){
		scene.remove(objects[i]);
	}
}
/**
 * 移除数组中元素
 */
Array.prototype.remove = function(val) {
	var index = this.indexOf(val);
	if (index > -1) {
	this.splice(index, 1);
	}
};
	
Array.prototype.indexOf = function(val) {
	for (var i = 0; i < this.length; i++) {
	if (this[i] == val) return i;
	}
	return -1;
}
