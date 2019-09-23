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
var material;//货架为空的材料
var materialsBack;//货架为空的材料
/**
 * 加载初始化设置
 * @param id
 * @param setting
 */
function initThree(id,setting) {
	settMethod=setting;
	clickMethod=setting.callback.onClick;
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
		
	renderer.setSize(width, height);//设置渲染器宽度与高度
	renderer.domElement.addEventListener('mousedown', onDocumentMouseDown,false);//渲染器添加点击事件
	
	projector = new THREE.Projector();

	container.appendChild(renderer.domElement);//画布添加渲染器

	scene = new THREE.Scene();//初始化场景

	camera = new THREE.PerspectiveCamera(60, width / height, 1, 100000);//设置相机属性
	
	camera.position.set(0, -5600, 2752);
	
	light = new THREE.AmbientLight(0xffffff);//设置光源属性
	
	light.position.set(0, 0, 100000);
	
	scene.add(light);
}

/**
 * 初始模型方法
 */

function initObject() {
	var mapPath = '../image/shlf.png';//货架正面图片 
	var map1_3 = THREE.ImageUtils.loadTexture(mapPath);//加载图片纹理
	var mapPathN = '../image/shlfLeft.png';//货架侧面图片
	var map1_2 = THREE.ImageUtils.loadTexture(mapPathN);//加载图片纹理
	var materials = [];//满的货架
	materials.push(new THREE.MeshBasicMaterial({
		map : map1_2
	}));
	materials.push(new THREE.MeshBasicMaterial({
		map : map1_2
	}));
	materials.push(new THREE.MeshBasicMaterial({
		map : map1_3
	}));
	materials.push(new THREE.MeshBasicMaterial({
		map : map1_3
	}));
	materials.push(new THREE.MeshBasicMaterial({
		map : map1_3
	}));
	materials.push(new THREE.MeshBasicMaterial({
		map : map1_3
	}));
	
	var materialsBacks = [];//空闲货架
	materialsBacks.push(new THREE.MeshBasicMaterial({
		color: 0x9c2e2f,
		map : map1_2
	}));
	materialsBacks.push(new THREE.MeshBasicMaterial({
		color: 0x9c2e2f,
		map : map1_2
	}));
	materialsBacks.push(new THREE.MeshBasicMaterial({
		color: 0x9c2e2f,
		map : map1_3
	}));
	materialsBacks.push(new THREE.MeshBasicMaterial({
		color: 0x9c2e2f,
		map : map1_3
	}));
	materialsBacks.push(new THREE.MeshBasicMaterial({
		color: 0x9c2e2f,
		map : map1_3
	}));
	materialsBacks.push(new THREE.MeshBasicMaterial({
		color: 0x9c2e2f,
		map : map1_3
	}));
	
	material = new THREE.MeshFaceMaterial(materials);
	materialsBack = new THREE.MeshFaceMaterial(materialsBacks);
}
/**
 * 初始化控制
 */
function initControls() {
	controls = new THREE.TrackballControls(camera, renderer.domElement);
	controls.rotateSpeed = 0.0;
	controls.enabled=true;
	controls.addEventListener('change', render);
}
function updateControls() {
    controls.update();
  }
/**
 * 渲染过程
 */
function render() {
	renderer.render(scene, camera);
}
/**
 * 
 */
function animate() {
	requestAnimationFrame(animate);
	render();
	controls.update();
}
/**
 * 鼠标点击模型后事件
 * @param event
 */
function onDocumentMouseDown(event) {
	event.preventDefault();
	var otherHeight=$(".body-head").outerHeight(true)+$(".con1").outerHeight(true);
	var otherWidth= $(".con2").outerWidth(true);
	var x = event.clientX-otherWidth+10;
	var y = event.clientY - otherHeight-40;
	var vector = new THREE.Vector3((x / width) * 2 - 1, -(y / height) * 2 + 1,0.5);
	projector.unprojectVector(vector, camera);
	var raycaster = new THREE.Raycaster(camera.position, vector.sub(camera.position).normalize());
	var intersects = raycaster.intersectObjects(objects);
		  if (intersects.length > 0) {//左键点击事件
				var selected = intersects[0].object;
				var rsId = selected.rsId;
				if( typeof clickMethod === 'function' ){
					clickMethod(selected,event);
			    }
			}
}


/**
 * 画布上移除场景
 */
function removeObejectFromScene(){
	var copyNodeArray = objects.concat();
	for(var i=0;i<copyNodeArray.length;i++){
		scene.remove(copyNodeArray[i]);
		objects.remove(copyNodeArray[i]);
	}
	
}

/**
 * 拉近相机角度
 */
function addCamera(){
	initControls();
	var x=camera.position.x;
	var y=camera.position.y;
	var z=camera.position.z;
	camera.position.set(x, y, z-100);
}

/**
 * 拉远相机角度
 */

function reduceCamera(){
	initControls();
	var x=camera.position.x;
	var y=camera.position.y;
	var z=camera.position.z;
	camera.position.set(x, y, z+100);
}
/**
 * 正视图
 */
function faceView(){
	initControls();
	camera.up.x=0;
	camera.up.y=1;
	camera.up.z=0;
	camera.position.set(0, -2000, 1000);
}
/**
 * 俯视图
 */
function overView(){
	initControls();
	camera.position.set(0,790,10401);
	camera.up.x = 0;//相机以哪个方向为上方
	camera.up.y = 0;
	camera.up.z = 0;
	
}
/**
 * 左视图
 */
function LeftView(){
	initControls();
	camera.up.x=0;
	camera.up.y=0;
	camera.up.z=1;
	camera.position.set(7000, -0, 5000);
	
}
/**
 * 右视图
 */
function rightView(){
	initControls();
	camera.up.x=0;
	camera.up.y=0;
	camera.up.z=1;
	camera.position.set(-10000, -0, 5000);
}
/**
 * 初始化
 */
function initView(){
	initControls();
	camera.up.x=0;
	camera.up.y=1;
	camera.up.z=0;
		camera.position.set(0, -2000, 500);
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
};