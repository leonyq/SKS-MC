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
var  plane;

/**
 * 加载初始化设置
 * @param id
 * @param setting
 */
function initThree(id,setting) {

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
	renderer.setClearColorHex(0xFFFFFF, 0);//渲染器清除背景颜色

	renderer.domElement.addEventListener('mousedown', onDocumentMouseDown,false);//渲染器添加点击事件
	projector = new THREE.Projector();

	container.appendChild(renderer.domElement);//画布添加渲染器

	scene = new THREE.Scene();//初始化场景

	camera = new THREE.PerspectiveCamera(60, width / height, 1, 100000);//设置相机属性
	camera.position.set(1086, 18146, 2710);
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
	/*controls.rotateSpeed = 0.0;
	controls.minDistance = 18146;
	controls.maxDistance = 20000;*/
	controls.addEventListener('change', render);
}

function render() {
	renderer.render(scene, camera);
}

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
	var x = event.clientX;
	var y = event.clientY
	var vector = new THREE.Vector3((x / width) * 2 - 1, -(y / height) * 2 + 1,0.5);
	projector.unprojectVector(vector, camera);
	var raycaster = new THREE.Raycaster(camera.position, vector.sub(camera.position).normalize());
	var intersects = raycaster.intersectObjects(objects);
	if (intersects.length > 0) {
		
	}else{
		
		editReservoir(2,rsId);
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
function removeRown(rowNum){
	for(var i=0;i<objects.length;i++){
		if(objects[i].rsId==rowNum){
			var x=objects[i].position.x;
			var y=objects[i].position.y;
			var z=objects[i].position.z+500;
			var geometry = new THREE.CubeGeometry(1000, 500, 500);//货架基本模型
			model = new THREE.Mesh(geometry, material);
			model.position.set(x,y,z);
			model.rsId =1;
			scene.add(model);
		}
		
	}
	
}