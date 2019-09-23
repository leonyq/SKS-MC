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
var objects = [];
var texture;
//开启Three.js渲染器
function initThree(id) {
	container = document.getElementById(id);
	width = document.getElementById(id).clientWidth;
	height = document.getElementById(id).clientHeight;
	renderer = new THREE.WebGLRenderer({//初始化渲染器
		antialias : true,
		precision : "lowp",
		alpha : true,
		premultipliedAlpha : false,
		stencil : false,
		preserveDrawingBuffer : true
	});

	renderer.setSize(width, height);
	

	renderer.domElement.addEventListener('mousedown', onDocumentMouseDown,false);//添加鼠标点击事件
	projector = new THREE.Projector();

	container.appendChild(renderer.domElement);//div元素加载“渲染器”

	scene = new THREE.Scene();//新建场景

	camera = new THREE.PerspectiveCamera(60, width / height, 1, 100000);//新建相机
	camera.position.set(-0, -1462, 1182);
	light = new THREE.AmbientLight(0xffffff);//设置光源
	light.position.set(0, 0, 100000);
	scene.add(light);
}


/**
 * 初始控制器
 */
function initControls() {
	controls = new THREE.TrackballControls(camera, renderer.domElement);
	controls.rotateSpeed = 0;
	controls.enabled=true;
	controls.addEventListener('change', render);
}

/**
 * 渲染方法
 */
function render() {
	renderer.render(scene, camera);
	var x=camera.position.x;
	var y=camera.position.y;
	var z=camera.position.z;
	
}
/**
 * 初始化动画
 */
function animate() {
	requestAnimationFrame(animate);
	render();
	controls.update();
}
/**
 * 鼠标点击下去事件
 * @param event 鼠标事件
 */
function onDocumentMouseDown(event) {
	event.preventDefault();
	var otherHeight=$(".body-head").outerHeight(true)+$(".con1").outerHeight(true);
	var x = event.clientX-10;
	var y = event.clientY -otherHeight-40;
	var vector = new THREE.Vector3((x / width) * 2 - 1, -(y / height) * 2 + 1,0.5);
	projector.unprojectVector(vector, camera);
	var raycaster = new THREE.Raycaster(camera.position, vector.sub(camera.position).normalize());
	var intersects = raycaster.intersectObjects(objects);
	if (intersects.length > 0) {
		var select_obj = intersects[0].object;
		var rsId = select_obj.rsId;
		showInfo(rsId);
	}else{
		hideInfo();
	}
}

/**
 * 拉近相机角度
 */
function addCamera(){
	var x=camera.position.x;
	var y=camera.position.y;
	var z=camera.position.z;
	camera.position.set(x, y, z-100);
}
 
 
 
/**
 * 拉远相机角度
 */
function reduceCamera(){
	var x=camera.position.x;
	var y=camera.position.y;
	var z=camera.position.z;
	camera.position.set(x, y, z+100);
}
/**
 * 反面查看
 */
var tempView=1;
function faceView(){
	if(tempView==1){
		camera.position.set(-30, 1781, 998);
		tempView=2;
		camera.up.x=0;
		camera.up.y=0;
		camera.up.z=1;
		if(verticalType=="vertical"){
			camera.position.set(1781, -30, 998);
		}
	}else{
		camera.position.set(-0, -1462, 1182);
		tempView=1;
		if(verticalType=="vertical"){
			camera.position.set(-1462, -0, 1182);
		}
	}
		
}