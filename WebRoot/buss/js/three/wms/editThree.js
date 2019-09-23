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
var plane;
var mouse = new THREE.Vector2();
var offset = new THREE.Vector3();
var INTERSECTED;
var SELECTED;
/**
 * 加载初始化设置
 * @param id
 * @param setting
 */
function initThree(id) {
	container = document.getElementById(id);
	width = document.getElementById(id).clientWidth;
	height = document.getElementById(id).clientHeight;
     //把上面的层放到body里
     /*document.body.appendChild( container );*/
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
	
	camera.position.set(-0,0,13401);
	camera.up.x = 0;//相机以哪个方向为上方
	camera.up.y = 0;
	camera.up.z = 0;
	light = new THREE.AmbientLight(0xffffff);//设置光源属性
	
	light.position.set(0, 0, 100000);
	
	scene.add(light);
	  //创建一个长2000宽2000，8*8的网格对象并加上一种基本材质
    plane = new THREE.Mesh( new THREE.PlaneGeometry( 43000, 15000,43,15 ), new THREE.MeshBasicMaterial( { color: 0xffffff, opacity: 0.25, transparent: true, wireframe: true } ) );
    //网格对象是否可见
    plane.position.set(0, 0, 0);
    
    plane.visible = true;
    
    
    //把网格对象加到场景中
    scene.add( plane );
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
	controls.rotateSpeed = 1;
	controls.noRoll=true;
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

//当鼠标移动时触发的事件
function onDocumentMouseMove( event ) {
    //阻止本来的默认事件，比如浏览器的默认右键事件是弹出浏览器的选项
    event.preventDefault();
    mouse.x = ( event.clientX / width ) * 2 - 1;
    mouse.y = - ( event.clientY / height ) * 2 + 1;

    //新建一个三维变换半单位向量 假设z方向就是0.5,这样我左右移的时候，还会有前后移的效果
    var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5 );
        
    //屏幕和场景转换工具根据照相机，把这个向量从屏幕转化为场景中的向量
    projector.unprojectVector( vector, camera );
    
    //vector.sub( camera.position ).normalize()变换过后的向量vector减去相机的位置向量后标准化
    //新建一条从相机的位置到vector向量的一道光线
    var raycaster = new THREE.Raycaster( camera.position, vector.sub( camera.position ).normalize() );

    //是否有东西被选中
    if ( SELECTED ) {
        //有的话取到这条光线射到的物体所在水平面上所有相交元素的集合,所以这样就可以限制每次拖动距离不能超出水平面panel
        var intersects = raycaster.intersectObject( plane);
        //这个鼠标点中的点的位置减去偏移向量，新位置赋值给选中物体
        if(intersects.length > 0){
        	var x1=intersects[ 0 ].point.x;
        	var y1=intersects[ 0 ].point.y;
        	var sX=SELECTED.position.x;
        	var sY=SELECTED.position.y;
        	var addX=x1-sX;
        	var addY=y1-sY;
        	var temp=SELECTED.rsId;
        	for(var i=0;i<objects.length;i++){
        		if(objects[i].rsId==temp){
        			objects[i].position.x+=addX;
            		objects[i].position.y=y1;
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
function onDocumentMouseDown( event ) {
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

function onDocumentMouseUp( event ) {

    event.preventDefault();
    //又能改变视角了
    controls.enabled = true; 
    //如果有相交物体
    if ( INTERSECTED ) {
       
        SELECTED = null;

    }
    //改变鼠标的样式
    container.style.cursor = 'auto';

}

