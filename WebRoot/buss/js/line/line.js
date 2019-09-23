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
var deleteCallBack;
var addObjectCallBack;
/**
 * 加载初始化设置
 * @param id
 * @param setting//设置，包含回调函数
 */
function initThree(id,setting) {
	container = document.getElementById(id);
	width = document.getElementById(id).clientWidth;
	height = document.getElementById(id).clientHeight; 
	deleteCallBack=setting.callback.deleteCallBack;
	addObjectCallBack=setting.callback.addObjectCallBack;
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
	camera.position.set(0, 0, 7700);
	light = new THREE.AmbientLight(0xffffff);//设置光源属性
	light.position.set(0, 0, 100000);
	scene.add(light);
	var texture = "buss/images/model/floor/floor.png";//地板纹理
	var map = THREE.ImageUtils.loadTexture(texture);
	map.wrapS = map.wrapT = THREE.RepeatWrapping;//地板平铺状态
	map.repeat.set(112, 68);  
	var material = new THREE.MeshPhongMaterial({map:map});
	var geometry = new THREE.CubeGeometry(64000,32000,1);
	plane = new THREE.Mesh(geometry,material);
	plane.position.set(0, 0, 0);
    //把网格对象加到场景中
    scene.add(plane);
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
    //阻止本来的默认事件，比如浏览器的默认右键事件是弹出浏览器的选项
    event.preventDefault();
    if(imgSrc!=null){
    	mouse.x = ( (event.clientX-190-0) / width) * 2 - 1;
	    mouse.y = - ((event.clientY-30) / height ) * 2 + 1;

	    //新建一个三维变换半单位向量 假设z方向就是0.5,这样我左右移的时候，还会有前后移的效果
	    var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5 );
	        
	    //屏幕和场景转换工具根据照相机，把这个向量从屏幕转化为场景中的向量
	    projector.unprojectVector( vector, camera);
	    
	    //vector.sub( camera.position ).normalize()变换过后的向量vector减去相机的位置向量后标准化
	    //新建一条从相机的位置到vector向量的一道光线
	    var raycaster = new THREE.Raycaster(camera.position, vector.sub( camera.position ).normalize());
	    var intersects = raycaster.intersectObject(plane);
        //这个鼠标点中的点的位置减去偏移向量，新位置赋值给选中物体
	    if(intersects.length > 0&&typeof addObjectCallBack === 'function'){
	    	var x1=intersects[ 0 ].point.x;
        	var y1=intersects[ 0 ].point.y;
	    	addObjectCallBack(x1,y1);
        } 
       
        imgSrc=null;
        return null;
    }
    //mouse.x是指 鼠标的x到屏幕y轴的距离与屏幕宽的一半的比值 绝对值不超过1
    //mouse.y是指 鼠标的y到屏幕x轴的距离与屏幕宽的一半的比值 绝对值不超过1
    //
    //下面的矩形是显示器屏幕，三维空间坐标系的布局以及屏幕的二维坐标系
    //
    // 鼠标是从  二维坐标系
    // 这个点 .-----------------------------------------  |-->鼠标x正半轴
    //  开始算    |                   个 y   /               |
    //   x,y  |                    |   /                |
    //        |                    |  /                 |
    //        |            三维坐标系 | /                  |
    //        |------------------- /------------------->x|
    //        |                   /|                    |
    //        |                  / |                    |
    //        |                /   |                    |
    //        |__________Z_______  |____________________|
    //        |
    // 鼠标y  \/
    // 正半轴
    
    mouse.x = ((event.clientX-190-0) / width ) * 2 - 1;
    mouse.y = - ( (event.clientY-30) / height ) * 2 + 1;

    //新建一个三维变换半单位向量 假设z方向就是0.5,这样我左右移的时候，还会有前后移的效果
    var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5);
        
    //屏幕和场景转换工具根据照相机，把这个向量从屏幕转化为场景中的向量
    projector.unprojectVector( vector, camera );
    
    //vector.sub( camera.position ).normalize()变换过后的向量vector减去相机的位置向量后标准化
    //新建一条从相机的位置到vector向量的一道光线
    var raycaster = new THREE.Raycaster( camera.position, vector.sub( camera.position ).normalize());
   //是否有东西被选中
    if ( (selected) ) {
    	//有的话取到这条光线射到的物体所在水平面上所有相交元素的集合,所以这样就可以限制每次拖动距离不能超出水平面panel
        var intersects = raycaster.intersectObject(plane);
        //这个鼠标点中的点的位置减去偏移向量，新位置赋值给选中物体
        if((intersects.length > 0)&&(altTemp==0)){
        	var x1=intersects[ 0 ].point.x;
        	var y1=intersects[ 0 ].point.y;
        	var sX=selected.position.x;
        	var sY=selected.position.y;
        	var addX=x1-sX;//拖拽改变X路径距离
        	var addY=y1-sY;//托在改变Y路径距离
        	var temp=selected.aggregate;
        	var tempRank=selected.rank;
        	adsorbent(selected);
        	//未添加组别自动吸附功能
        	var validate=validatePosiotion(addX,addY,temp,tempRank);
        	var addY2;
        	if(validate){
        		for(var i=0;i<objects.length;i++){
            		if((objects[i].aggregate==temp)&&(objects[i].rank=="transverse")){
            			var yy=objects[i].position.y-selected.position.y;
            			objects[i].position.x+=addX;
            			objects[i].position.y=y1+objects[i].addY;
            		}
            		if((objects[i].aggregate==temp)&&(objects[i].rank=="vertical")){
            			objects[i].position.x=x1;
                		objects[i].position.y+=addY;
                	}
            	} 
        	}
        	return;
        }
    }

    //否则的话，光线和所有物体相交，返回相交的物体
    var intersects = raycaster.intersectObjects(objects);
    //如果有物体相交了
    if ( intersects.length > 0 ) {
    	
    	 var singleObject = intersects[ 0 ].object;
    	  
        //并且相交物体不是上一个相交物体
        if ( intersected != intersects[ 0 ].object ) {
            //将这个对象放到intersected中
            intersected = intersects[ 0 ].object;
        }
        //改变鼠标的样式
        container.style.cursor = 'pointer';
    } else {
        //改变鼠标的样式
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
	if(needTemp==1){
		needTemp=2;
		event.preventDefault();
        // 正半轴
	    mouse.x = ( (event.clientX-190-0) / width) * 2 - 1;
	    mouse.y = - ( (event.clientY-30) / height ) * 2 + 1;
	    //新建一个三维变换半单位向量 假设z方向就是0.5,这样我左右移的时候，还会有前后移的效果
	    var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5 );
	    //屏幕和场景转换工具根据照相机，把这个向量从屏幕转化为场景中的向量
	    projector.unprojectVector( vector, camera);
	    //vector.sub( camera.position ).normalize()变换过后的向量vector减去相机的位置向量后标准化
	    //新建一条从相机的位置到vector向量的一道光线
	    var raycaster = new THREE.Raycaster(camera.position, vector.sub( camera.position ).normalize());
	    var intersects = raycaster.intersectObject(plane);
        //这个鼠标点中的点的位置减去偏移向量，新位置赋值给选中物体
        if(intersects.length > 0){
        	var x1=intersects[ 0 ].point.x;
        	var y1=intersects[ 0 ].point.y;
        	addObejct(x1,y1);//添加模型
        }
	 }
    //阻止本来的默认事件，比如浏览器的默认右键事件是弹出浏览器的选项
    event.preventDefault();

    var vector = new THREE.Vector3(mouse.x, mouse.y, 0.5);
    //屏幕和场景转换工具根据照相机，把这个向量从屏幕转化为场景中的向量
    projector.unprojectVector( vector, camera);

    var raycaster = new THREE.Raycaster(camera.position, vector.sub( camera.position ).normalize());

    var intersects = raycaster.intersectObjects(objects);

    if ( intersects.length > 0 ) {
        //不能改变视角了
        controls.enabled = false;
        
        //把选中的对象放到全局变量selected中
        selected = intersects[ 0 ].object;
        //再和水平面相交
        var intersects = raycaster.intersectObject(plane);
        //选中位置和水平面位置（物体中心）的偏移量
        offset.copy( intersects[ 0 ].point).sub(plane.position);
        //改变鼠标的样式
        container.style.cursor = 'move';
        //shift键被按下，添加背景颜色
        
        	addShadow(selected);
        
    }else{
    	removeShaw();
    }
}
/**
 *右边鼠标点击事件
 */
function rightClickMethod(event){
	//计算点击位置
	event.preventDefault();
	var x = (event.clientX-190-0);
	var y = (event.clientY-30);
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
	return true;
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
	}else if(transverseArray.length>1){
		 transverseArray[0].first=1;//横排第一个
		 transverseArray[0].last=0;
		 transverseArray[len-1].first=0;
		 transverseArray[len-1].last=1;//横排最后一个
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
	var alarm=null;
	//本排货架重新装载
	for(var i=0;i<objectLenth;i++){
		if(selectObj.id==objects[i].parentId){
			alarm=objects[i];
		}else if((objects[i].groupId==selectObj.groupId)&&(selectObj!=objects[i])){
			transverseArray.push(objects[i]);
		}
	} 
	transverseArray=sortTransverseObject(transverseArray);
	 selectObj.last = 1;
	 selectObj.first = 1;
	 selectObj.top=0;
	 selectObj.bottom=0;
	var timestamp = Date.parse(new Date());
	
	selectObj.groupId=timestamp;
	selectObj.aggregate=timestamp;
	selectObj.adsorbent=0;
	selectObj.group=0;
}

/**
 * 移除选中模型阴影面积
 */
function removeShaw(){
	for(var i=0;i<shawArray.length;i++){
		
		shawArray[i].material.opacity=1;
		
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
	objects.removeNext(selectObj);
	
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
	if(type==2){
		for(var i=0;i<objects.length;i++){
			if(objects[i].rsId!=undefined&&typeof deleteCallBack === 'function'){
				deleteCallBack(objects[i]);
			}
			scene.remove(objects[i]);
		}
		objects.length=0;
		return false;
	}
	if((shawArray.length==0)||(shawArray.length>1)){
		return false;
	}
	selectObj=shawArray[0];
	var objectLenth=objects.length;
	var transverseArray=new Array();
	deleteCallBack(selectObj);
	objects.removeNext(selectObj);
	shawArray.removeNext(selectObj);
	scene.remove(selectObj);
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
Array.prototype.removeNext = function(val) {
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
