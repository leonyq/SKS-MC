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
var plane;//平面
var mouse = new THREE.Vector2();
var offset = new THREE.Vector3();
var INTERSECTED;
var SELECTED;//被选中物
var needTemp=0;//是否可在画布添加事件
var rsIdChange;//选择物rsId
var rankChange;//选择物横向还是纵向
/**
 * 加载初始化设置
 * @param id 画布的id
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
    renderer.domElement.addEventListener( 'mousemove', onDocumentMouseMove, false );
    renderer.domElement.addEventListener( 'mousedown', onDocumentMouseDown, false );
    renderer.domElement.addEventListener( 'mouseup', onDocumentMouseUp, false );
    projector = new THREE.Projector();
	container.appendChild(renderer.domElement);//画布添加渲染器
	scene = new THREE.Scene();//初始化场景
	camera = new THREE.PerspectiveCamera(60,  width/height, 1, 100000);//设置相机属性
	camera.position.set(0,0,18401);
	camera.up.x = 0;//相机以哪个方向为上方
	camera.up.y = 0;
	camera.up.z = 0;
	light = new THREE.AmbientLight(0xffffff);//设置光源属性
	light.position.set(0, 0, 100000);
	scene.add(light);
	var texture = "../images/model/floor/floor.png";
	var map = THREE.ImageUtils.loadTexture(texture);
	map.wrapS = map.wrapT = THREE.RepeatWrapping;
	map.repeat.set(28, 17);//地板进行平铺
	var material = new THREE.MeshPhongMaterial({ map:map});
	var geometry = new THREE.CubeGeometry(37000,19000,1);
	plane = new THREE.Mesh(geometry,material);
	plane.position.set(0, 0, 0);
    scene.add(plane);
}
/**
 * 初始化控制
 */
function initControls() {
	controls = new THREE.TrackballControls(camera, renderer.domElement);
	controls.rotateSpeed = 0.0;
	controls.enabled=false;
	controls.addEventListener('change', render); 
}
/**
 * 进行渲染作用
 */
function render() {
	renderer.render(scene, camera);
}
/**
 * 添加动画
 */
function animate() {
	requestAnimationFrame(animate);
	render();
	controls.update();
}
/**
 *当鼠标移动时触发的事件 
 * @param event 鼠标事件
 */
function onDocumentMouseMove(event) {
    event.preventDefault();//阻止本来的默认事件，比如浏览器的默认右键事件是弹出浏览器的选项
    mouse.x = ( (event.clientX-250) / width ) * 2 - 1;//mouse.x是指 鼠标的x到屏幕y轴的距离与屏幕宽的一半的比值 绝对值不超过1
    mouse.y = - ( (event.clientY-38) / height ) * 2 + 1;//mouse.y是指 鼠标的y到屏幕x轴的距离与屏幕宽的一半的比值 绝对值不超过1
    var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5 );//mouse.y是指 鼠标的y到屏幕x轴的距离与屏幕宽的一半的比值 绝对值不超过1
    projector.unprojectVector( vector, camera );//屏幕和场景转换工具根据照相机，把这个向量从屏幕转化为场景中的向量
    var raycaster = new THREE.Raycaster( camera.position, vector.sub( camera.position ).normalize());//新建一条从相机的位置到vector向量的一道光线
    if ( SELECTED ) {//是否有东西被选中有的话取到这条光线射到的物体所在水平面上所有相交元素的集合,所以这样就可以限制每次拖动距离不能超出水平面panel
        var intersects = raycaster.intersectObject(plane);
        //这个鼠标点中的点的位置减去偏移向量，新位置赋值给选中物体
        if(intersects.length > 0){//被选中物品
        	var x1=intersects[ 0 ].point.x;
        	var y1=intersects[ 0 ].point.y;
        	var sX=SELECTED.position.x;
        	var sY=SELECTED.position.y;
        	var addX=x1-sX;
        	var addY=y1-sY;
        	var temp=SELECTED.rsId;
        	var tempRank=SELECTED.rank;
        	var validate=validatePosiotion(addX,addY,temp,tempRank);//验证是否超出画布范围true 表示没有超出，false表示超出范围
        	if(validate){
        		for(var i=0;i<objects.length;i++){
            		if((objects[i].rsId==temp)&&(objects[i].rank=='transverse')){
            			objects[i].position.x+=addX;
                		objects[i].position.y=y1;
            		}
            		if((objects[i].rsId==temp)&&(objects[i].rank=='vertical')){
            			objects[i].position.x=x1;
                		objects[i].position.y+=addY;
            		}
            		
            	} 
        	}
        }
        return;

    }

    //否则的话，光线和所有物体相交，返回相交的物体
    var intersects = raycaster.intersectObjects(objects);
    //如果有物体相交了
    if ( intersects.length > 0 ) {
        //并且相交物体不是上一个相交物体
        if ( INTERSECTED != intersects[ 0 ].object ) {
            //将这个对象放到INTERSECTED中
            INTERSECTED = intersects[ 0 ].object;
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
	    mouse.x = ( (event.clientX-250) / width ) * 2 - 1;
	    mouse.y = - ( (event.clientY-30) / height ) * 2 + 1;

	    //新建一个三维变换半单位向量 假设z方向就是0.5,这样我左右移的时候，还会有前后移的效果
	    var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5 );
	        
	    //屏幕和场景转换工具根据照相机，把这个向量从屏幕转化为场景中的向量
	    projector.unprojectVector( vector, camera );
	    
	    //vector.sub( camera.position ).normalize()变换过后的向量vector减去相机的位置向量后标准化
	    //新建一条从相机的位置到vector向量的一道光线
	    var raycaster = new THREE.Raycaster( camera.position, vector.sub( camera.position ).normalize());
	    var intersects = raycaster.intersectObject(plane);
        //这个鼠标点中的点的位置减去偏移向量，新位置赋值给选中物体
        if(intersects.length > 0){
        	var x1=intersects[ 0 ].point.x;
        	var y1=intersects[ 0 ].point.y;
        	addObejct(x1,y1);
        }
	}
    //阻止本来的默认事件，比如浏览器的默认右键事件是弹出浏览器的选项
    event.preventDefault();

    var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5 );
    
    projector.unprojectVector( vector, camera );

    var raycaster = new THREE.Raycaster( camera.position, vector.sub( camera.position ).normalize() );

    var intersects = raycaster.intersectObjects( objects );

    if ( intersects.length > 0 ) {
        //不能改变视角了
        controls.enabled = false;
        //把选中的对象放到全局变量SELECTED中
        SELECTED = intersects[ 0 ].object;
        //再和水平面相交
        var intersects = raycaster.intersectObject( plane );
            
        //选中位置和水平面位置（物体中心）的偏移量
        offset.copy( intersects[ 0 ].point ).sub( plane.position );
        //改变鼠标的样式
        container.style.cursor = 'move';

    }
}
/**
 *右边鼠标点击事件
 */
function rightClickMethod(event){
	event.preventDefault();
	var x = event.clientX-250;
	var y = event.clientY - 38;
	var vector = new THREE.Vector3((x / width) * 2 - 1, -(y / height) * 2 + 1,0.5);
	projector.unprojectVector(vector, camera);
	var raycaster = new THREE.Raycaster(camera.position, vector.sub(camera.position).normalize());
	var intersects = raycaster.intersectObjects(objects);
		  if (intersects.length > 0) {//左键点击事件
				var select_obj = intersects[0].object;
				rsIdChange = select_obj.rsId;
				rankChange=select_obj.rank;
				showStock();
		  }
}

/**
 * 释放鼠标事件
 */

function onDocumentMouseUp( event ) {
	event.preventDefault();
    //又能改变视角了
    controls.enabled = true;
    SELECTED = null;
    //如果有相交物体
    if ( INTERSECTED ) {
       
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
	camera.position.set(0, -24000, 10000);
}

/**
 * 俯视图
 */
function overView(){
	camera.position.set(0,0,17401);
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
	camera.position.set(27000, -0, 10000);
}
/**
 * 右视图
 */
function rightView(){
	camera.up.x=0;
	camera.up.y=0;
	camera.up.z=1;
	camera.position.set(-30000, -0, 10000);
}
/**
 * 初始化
 */
function initView(){
	camera.position.set(0,0,17401);
	camera.up.x = 0;//相机以哪个方向为上方
	camera.up.y = 0;
	camera.up.z = 0;
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
	if(addX<0){
		for(var i=0;i<objects.length;i++){ 
			if((objects[i].positionId==1)&&(objects[i].rsId==rsId)){
				var postionX=objects[i].position.x;
				if(postionX<=-18000){
					temp=false;
					break;
				}
			}
		}
		                                                                                                                                               
	}else{
		for(var i=0;i<objects.length;i++){
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
	if(addY<0){
		for(var i=0;i<objects.length;i++){
			if((objects[i].positionId==1)&&(objects[i].rsId==rsId)){
				var postionY=objects[i].position.y;
				if(postionY<=-9000){
					temp=false;
					break;
				}
			}
		}
		                                                                                                                                               
	}else{
		for(var i=0;i<objects.length;i++){
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
 */
function changeRank(rank){
	var array=new Array();
	for(var i=0;i<objects.length;i++){
		if(objects[i].rsId==rsIdChange){
			array.push(objects[i]);
		}
	}
	
	var lengthNum=parseInt(array.length/2);
	var object=array[lengthNum];
	var x=object.position.x;
	var y=object.position.y;
	if(rank=='transverse'){
		for(var i=0;i<array.length;i++){
			array[i].rank="transverse";
			array[i].rotation.y = 3.14;
			if(i<lengthNum){
				array[i].position.x=x-1000*(lengthNum-i);
				array[i].position.y=y;
			}else{
				array[i].position.x=x+1000*(i-lengthNum);
				array[i].position.y=y;
			}
		}
	}else{
		for(var i=0;i<array.length;i++){
			array[i].rank="vertical";
			array[i].rotation.y = 3.14/2;
			if(i<lengthNum){
				array[i].position.x=x;
				array[i].position.y=y-1000*(lengthNum-i);
			}else{
				array[i].position.x=x;
				array[i].position.y=y+1000*(i-lengthNum);
			}
		}
	}
}
