/**
 * 工艺流程组态封装
 * Created by 黄志鹏 on 2017/11/09
 * version 1.0
 */
var scene;//场景
var stage;//舞台
var canvas;//画布
var settMethod;//设置方法
var clickMethod;//点击方法
var rightClickMethod;//右键点击方法
var mouseOver;//鼠标移入
var mouseOut;//鼠标移出
var mousedrag;
var nodeArray=new Array();//装载节点数组
var linkArray=new Array();//装载连线数组
var validateBeforeTemp=false;
var mousedownTempX;
var mousedownTempY;
var nodeAbaseLineX;
var nodeAbaseLineY;
var nodeZbaseLineX;
var nodeZbaseLineY;
var lineDrag=false;
var currentLine=null;
/**
 *功能:获取场景scene
 *  param:canvas（画布）
 */
function initCanvas(canvas,select,wheelZoom,alpha)
{
	stage = new JTopo.Stage(canvas);
	scene = new JTopo.Scene(stage);
    stage.mode=select;//场景模式
	
	scene.alpha=alpha;//场景透明度
	scene.backgroundColor="255,255,255";
	//鼠标滚动添加的事件
	stage.addEventListener("mousewheel", function(event){
	
	});
    //隐藏节点
    this.hideNode=function(node){
        node.visible=false;
    }
    //展示节点
    this.showNode=function(node){
        node.visible=true;
    }
    //获取场景
    this.getScene=function(){
        return scene;
    }
    //获取舞台
    this.getStage=function(){
    	 return stage;
    }
    
    //移除线体
    this.removeLine=function(line){
    	removeLineN(line);
    }
    
    //移除节点
    this.removeNode=function(node){
    	removeNodeRelationLine(node);
    	nodeArray.removeValue(node);//节点数据移除对象
        scene.remove(node);
    }
    /**
     *功能:初始化场景
     *  param:set（设置属性）
     */
    this.init=function(set,json){
        settMethod=set;
        clickMethod=settMethod.callback.onClick;
        rightClickMethod=settMethod.callback.rightClick;
        dbClickMethod=settMethod.callback.dbClick;
        mouseOver=settMethod.callback.mouseOver;
        mouseOut=settMethod.callback.mouseOut;
        return scene;
    }
    //打开鹰眼
    this.eyeOpen=function(){
    	stage.eagleEye.visible = true;
    }
    //清除画布
    this.cleanScene=function(){
    	
    	for(var i=0;i<nodeArray.length;i++){
    		scene.remove(nodeArray[i]);
    	}
    	for(var i=0;i<linkArray.length;i++){
    		scene.remove(linkArray[i]);
    	}
    	linkArray.length=0;
		nodeArray.length=0;
    }
    //删除选中
    this.deleteObject=function(){
    	copyNodeArray = nodeArray.concat();
    	for(var i=0;i<copyNodeArray.length;i++){
    		if(copyNodeArray[i].selected==true){
    			scene.remove(copyNodeArray[i]);
        		nodeArray.removeValue(copyNodeArray[i]);
        		if(copyNodeArray[i].nodeType=="middle"){
        			var brotherNode=copyNodeArray[i].brotherId;
        			brotherNode=selectNodeByUuidFisrt(brotherNode);
        			if((brotherNode!=undefined)&&(brotherNode!="")){
        				var lineTemp=brotherNode.lineUUid;
        				lineTemp=selectLineByUuidN(lineTemp);
        				removeLineN(lineTemp);
        				scene.remove(brotherNode);
                		nodeArray.removeValue(brotherNode);
        			}
        			
        		}
    		}
    	}
    	copylineArray = linkArray.concat();
    	for(var i=0;i<copylineArray.length;i++){
    		if(copylineArray[i].selected){
    			var nodeA=copylineArray[i].nodeA;
    			var nodeZ=copylineArray[i].nodeZ;
    			linkArray.removeValue(copylineArray[i]);
    			scene.remove(copylineArray[i]);
    			scene.remove(nodeA);
        		nodeArray.removeValue(nodeA);
        		scene.remove(nodeZ);
        		nodeArray.removeValue(nodeZ);
    		}
    	}
    }
    //放大画布
    this.enlargeScene=function(){
    	var scaleValue=parseFloat($("#zoomIn").val());
    	scene.scaleX=scaleValue+0.25;
    	scene.scaleY=scaleValue+0.25;
    	if(scene.scaleX>2){
    		scene.scaleX=2;
        	scene.scaleY=2;
    	}
    	var select = document.getElementById("zoomIn"); //更新文字大小
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==scene.scaleX){  
		         select.options[i].selected = true;  
		         break;  
		     }  
		} 
		addCanvasSize(scene.scaleX,scene.scaleY);
    }
    //缩小画布
    this.narrowScene=function(){
    	var scaleValue=parseFloat($("#zoomIn").val()).toFixed(2);
    	scene.scaleX=scaleValue-0.25;
    	scene.scaleY=scaleValue-0.25;
    	if(scene.scaleX<0.25){
    		scene.scaleX=0.25;
        	scene.scaleY=0.25;
    	}
    	var select = document.getElementById("zoomIn"); //更新文字大小
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==scene.scaleX){  
		         select.options[i].selected = true;  
		         break;  
		     }  
		}
		addCanvasSize(scene.scaleX,scene.scaleY); 
    }
    this.zoomIn=function(value){
    	scene.scaleX=value;
    	scene.scaleY=value;
    }
    //折线翻折
    this.foldingLine=function(line){
    	if((line instanceof JTopo.Node)||(line.lineType=="Uline")){//当前对象是U型线与节点
			return false;
		}
		if(line.direction=="horizontal"){//线体横竖模式转换
			line.direction="vertical";
		 }else{
			 line.direction="horizontal";
		 }
    }
    //更新线条属性
    this.updateLineProperty=function(line,lineData){
    	updateLinePropertyH(line,lineData);
    }
    //更新节点属性
    this.updateNodeProperty=function(node,nodeData){
    	updateNodePropertyH(node,nodeData);
    }
    //验证连线问题return 200:验证连线成功，201同种物体，301重复连线
    this.validateLine=function(nodeA,nodeZ){
    	return validateLineN(nodeA,nodeZ);
    }
    
    /**
     * 添加线体
     * param:lineJson（线体属性json数据）
     * param:lineType线体类型
     */
    this.addLineByJson=function(nodeA,nodeZ,lineJson){
    	addLineF(nodeA,nodeZ,lineJson.lineWidth,lineJson.strokeColor,lineJson.uuid,lineJson.directionType,lineJson.lineType,lineJson.dashedPattern);
    }
    this.addLine=function(nodeA,nodeZ,text,font,fontColor,lineWidth,arrowsRadius,strokeColor,lineType,direction, lineType,uuid){
    	addLineF(nodeA,nodeZ,text,font,fontColor,lineWidth,arrowsRadius,strokeColor,direction,lineType,uuid);
    }
    this.addNodeByJson=function(nodeJson){
    	return addNode(nodeJson);
    }
    /**
     * 添加中间节点
     */
    this.addMiddleNodeByJson=function(nodeJson){
    	return addMiddleNode(nodeJson.uuid,nodeJson.x,nodeJson.y,nodeJson.nodeType,nodeJson.brotherId,nodeJson.directionType);
    }
    /**
     * 通过uuid查询线体
     */
    this.selectLineByUuid=function(uuid){
    	return selectLineByUuidN(uuid);
    }
    
    this.clearScene=function(){
    	scene.clear();
		linkArray.length=0;
		nodeArray.length=0;
    }
    /**
     * 切换成指针模式
     */
    this.pointType=function(){
    	for(var i=0;i<nodeArray.length;i++){
			nodeArray[i].dragable=true;
		}
    }
    this.validateBeforeNode=function(nodeA,nodeZ,result){
    	validateBeforeTemp=false;
    	validateBeforeNodeN(nodeA,nodeZ,result);
    	return validateBeforeTemp;
    }
    
}
/**
 * 初始化场景
 * param:background(场景背景图片路径)
 * param:backgroundColor(场景背景颜色)
 * param:visible(场景是否可见)
 * param:mode(场景舞台模式 normal[默认]：可以点击选中单个节点（按住Ctrl可以选中多个），点中空白处可以拖拽整个画面
	       drag: 该模式下不可以选择节点，只能拖拽整个画面
	       select: 可以框选多个节点、可以点击单个节点
	       edit: 在默认基础上增加了：选中节点时可以通过6个控制点来调整节点的宽、高) 
 *param：alpha(场景的透明度，默认为0)
 *param：wheelZoom(鼠标缩放比例)
 *param：translateX(场景偏移量（水平方向），随鼠标拖拽变化)
 *param：translateY(场景偏移量（垂直方向），随鼠标拖拽变化)
 */
function initScene(background,backgroundColor,visible,mode,alpha,wheelZoom,translateX,translateY){

    if(background!=null&&background!=""){
        scene.background=background;
    }else if(backgroundColor!=null&&backgroundColor!=""){
        scene.backgroundColor=backgroundColor;
    }else{
    }
    if(visible!=null&&visible!=""){
        scene.visible=visible;
    }else{
        scene.visible=true;
    }
    if(mode!=null&&mode!=""){
        stage.mode=mode;
    }else{
        stage.mode="select";
    }

    if(alpha!=null&&alpha!=""){
        scene.alpha=alpha;
    }else{
        scene.alpha=0;
    }
    if(translateX!=null&&translateX!=""&&translateY!=null&&translateY!=""){
        scene.translateX=translateX;
        scene.translateY=translateY;
    }else{
        scene.translateX=0;
        scene.translateY=0;
    }
    if(wheelZoom!=null&&wheelZoom!=""){
        stage.wheelZoom = wheelZoom;
    }else{
        stage.wheelZoom = null;
    }
}
/**
 * 添加节点方法
 * @param text:文本内容
 * @param imgUrl：照片路径
 * @param x：x坐标
 * @param y：y坐标
 * @param uuid:uuid唯一id
 * @param font：字体
 * @param fontColor:字体颜色
 * @param startProcedure：开始工序1表示是，2表示不是
 * @param endProcedure:结束工序1表示是，2表示不是
 * @param processType：工序类型1表示正常工序，2表示非管控工序，3表示可选工序
 * @param borderColor：节点边框颜色
 * @param nodeType：节点类型"imgNode",表示图片节点
 */
function addNode(nodeJson){
	var node = new JTopo.Node('');
	if(nodeJson.nodeType=="rect"){
		node.fillColor="255,255,255";
        node.borderWidth = 1; // 边框的宽度
        node.borderColor = '0,0,0'; //边框颜色  
    }else if((nodeJson.nodeType=="datatext")||(nodeJson.nodeType=="text")){
		node = new JTopo.Node('123456');
		node.fillColor="255,255,255";
        node.borderWidth = 1; // 边框的宽度
        node.borderColor = '232,227,227'; //边框颜色
    }else if(nodeJson.nodeType=="time"){
    	node = new JTopo.Node(nodeJson.fontText);
    	node.fillColor="255,255,255";
        node.borderWidth = 1; // 边框的宽度
        node.borderColor = '232,227,227'; //边框颜色
        node.timeType=nodeJson.timeType;
    }else if(nodeJson.nodeType=="circular"){
    	var node = new JTopo.CircleNode();
        node.radius = 10;
        node.shadow = false;
    }
	if((nodeJson.imgUrl!="")&&(nodeJson.imgUrl!=undefined)){
		node.setImage(nodeJson.imgUrl, false);
		node.imgUrl=nodeJson.imgUrl;
	}
	node.text=nodeJson.text;
	if((nodeJson.code!=undefined)&&(nodeJson.code=="two")){
		node.text="";
	}
	if((nodeJson.codeTextType!=undefined)&&(nodeJson.codeTextType!="")){
		node.codeTextType=nodeJson.codeTextType;
	}
	
	if((nodeJson.directionType!=undefined)&&(nodeJson.directionType!="")){
		node.directionType=nodeJson.directionType;
	}
	if((nodeJson.brotherId!=undefined)&&(nodeJson.brotherId!="")){
		node.brotherId=nodeJson.brotherId;
	}
	if((nodeJson.isWrap!=undefined)&&(nodeJson.isWrap!="")){
		node.isWrap=nodeJson.isWrap;
	}
	
	node.setLocation(nodeJson.x,nodeJson.y);
	node.italic=nodeJson.italic;
	node.bold=nodeJson.bold;
	node.fontType=nodeJson.fontType;
	node.font=nodeJson.italic+" "+nodeJson.bold+" "+nodeJson.fontSize+"px "+nodeJson.fontType;
	node.fontSize=nodeJson.fontSize;
	node.fontColor= nodeJson.fontColor;
	node.textPosition = nodeJson.textPosition;
	node.fontText=nodeJson.fontText;
	node.shadow = false;
	node.nodeType=nodeJson.nodeType;
	node.uuid=nodeJson.uuid;
	node.dataSource=nodeJson.dataSource;
	node.width=nodeJson.width;
	node.height=nodeJson.height;
	node.textOffsetX=nodeJson.textOffsetX;
	node.barcode=nodeJson.barcode;
	node.code=nodeJson.code;
	node.textPistionX=nodeJson.textPistionX;
	node.textPistionY=nodeJson.textPistionY;
	if(nodeJson.nodeType=="middle"){
		node.setSize(1,1);
		addMiddleDrag(node);
	}
	if(nodeJson.nodeType=="textNode"){
		node.fillColor="185,185,185";
	}
	node.dragable=false;
	scene.add(node);
    nodeArray.push(node);
    return node;
	
	
}
/**
 * 添加U型线的中心节点
 * @param uuid:节点uuid
 * @param x：节点X坐标
 * @param y：节点Y坐标
 * @param beginNodeUuid：开始节点uuid
 * @param endNodeUuid：结束节点uuid
 * @param directionType：U型方向
 */
function addMiddleNode(uuid,x,y,nodeType,brotherId,directionType){
	var middleNode = new JTopo.Node('');//创建U型线中间节点
	middleNode.setSize(7,7);//中间节点尺寸
	middleNode.setLocation(x,y);//设置中间节点坐标
	middleNode.nodeType=nodeType;
	middleNode.uuid=uuid;
	middleNode.brotherId=brotherId;
	middleNode.directionType=directionType;
	scene.add(middleNode);
	nodeArray.push(middleNode);
	addMiddleDrag(middleNode);
	return middleNode;
}

/**
 * 添加线别的方法
 * @param nodeA:文本内容
 * @param nodeZ：照片路径
 * @param lineWidth：字体
 * @param strokeColor：线体颜色
 * @param uuid:线体的UUID
 * @param directionType：线体类型（vertical竖线，horizontal横线）
 * @param lineType：线体类型（1表示直线，2表示虚线）
 * 
 */
function addLineF(nodeA,nodeZ,lineWidth,strokeColor,uuid,directionType,lineType,dashedPattern){
	var link = new JTopo.Link(nodeA,nodeZ);
	link.shadow = false;
	link.strokeColor = strokeColor;
	link.directionType=directionType;
	link.lineType=lineType;
	if(lineType==1){
		link.dashedPattern = null; // 虚线
		
	}else{
		link.dashedPattern = 5; // 虚线
	}
	link.uuid=uuid;
	link.lineWidth=lineWidth;
	scene.add(link);
	linkArray.push(link);
	/*link.addEventListener('mousedown', function(event){
		mousedown=event;
		currentLine=link;
		lineDrag=true;
	});*/
	
	link.addEventListener('mouseup', function(event){
		lineDrag=false;
		//dragGroup(link,event);
	});
}

/**
 * 添加U型线,U型线由两条折线组成的
 * @param nodeA 起始节点
 * @param nodeZ 结束节点
 */
function addUline(nodeA,nodeZ){
	var relesaseX=Math.abs(nodeA.x-nodeZ.x);//计算两个节点X轴差距
	var releaseY=Math.abs(nodeA.y-nodeZ.y);//计算两个节点Y轴差距
	var middleNode = new JTopo.Node('');//创建U型线中间节点
	var nlink;//折线一
	var nlinkS;//折线二
	if(releaseY>relesaseX){//如果Y轴差距大于X轴，则选择竖型直线
		var tempX;//中间节点X轴坐标
		tempX=nodeA.x<nodeZ.x?nodeA.x-50:tempX=nodeZ.x-50;//判断起始点X轴坐标大小
		tempX=tempX<0?10:tempX;//中间点小于0则赋值为10
		if(nodeA.y<nodeZ.y){
			middleNode.beginNodeUUid=nodeA.uuid;//设置中间点开始地方
			middleNode.endNodeUUid=nodeZ.uuid;//设置中间点结束地方
			nodeA.directionType="vertical";
			nodeA.nodeRefer="begin";//线起始
			nodeZ.directionType="vertical";//竖形节点类型
			nodeZ.nodeRefer="end";//线结束
		}else{
			middleNode.beginNodeUUid=nodeZ.uuid;//设置中间点开始地方
			middleNode.endNodeUUid=nodeA.uuid;//设置中间点结束地方
			nodeA.directionType="vertical";
			nodeA.nodeRefer="end";
			nodeZ.directionType="vertical";//竖形节点类型
			nodeZ.nodeRefer="begin";
		}
		 middleNode.x=tempX;
		 middleNode.y=(nodeA.y+nodeZ.y)/2;//设置中间节点Y轴坐标
		 middleNode.nodeType="middleNode";//添加节点类型
		 middleNode.directionType="vertical";//竖形节点类型
		 scene.add(middleNode);
		 nodeArray.push(middleNode);
	     nlink=new JTopo.FoldLink(nodeA, middleNode);
	     nlinkS=new JTopo.FoldLink(middleNode, nodeZ);
	     nlink.Uline="begin";
	     nlink.text="Y";
	     nlink.fontColor= '0,0,0';
	     nlinkS.Uline="end";
		 nlinkS.direction="vertical";//U形线竖形方向
		 nlink.arrowsRadius = 0; //箭头大小
		 nlinkS.arrowsRadius = 10; //箭头大小
		 nlinkS.lineWidth = 2; // 线宽
	}else if(releaseY<=relesaseX){//如果Y轴差距大于X轴，则选择横向直线
		var tempY;//中间节点Y轴坐标
		tempY=nodeA.y<nodeZ.y?nodeA.y-50:nodeZ.y-50;//判断起始点Y轴大小
		tempY=tempY<0?10:tempY;
		if(nodeA.x<nodeZ.x){
			middleNode.beginNodeUUid=nodeA.uuid;
			middleNode.endNodeUUid=nodeZ.uuid;
			nodeA.directionType="transverse";
			nodeA.nodeRefer="begin";
			nodeZ.directionType="transverse";//竖形节点类型
			nodeZ.nodeRefer="end";
		}else{
			middleNode.beginNodeUUid=nodeZ.uuid;
			middleNode.endNodeUUid=nodeA.uuid;
			nodeA.directionType="transverse";
			nodeA.nodeRefer="end";
			nodeZ.directionType="transverse";//竖形节点类型
			nodeZ.nodeRefer="begin";
		}
		 middleNode.x=(nodeA.x+nodeZ.x)/2;
		 middleNode.y=tempY;
		 middleNode.nodeType="middleNode";//添加节点类型
		 middleNode.directionType="transverse";//U形线横向
		 scene.add(middleNode);
		 nodeArray.push(middleNode);
	     nodeArray.push(middleNode);
		 nlink=new JTopo.FoldLink(nodeA, middleNode);
		 nlink.direction="vertical";
		 nlink.text="Y";
		 nlink.fontColor= '0,0,0';
		 nlinkS=new JTopo.FoldLink(middleNode, nodeZ);
		 nlink.Uline="begin";
	     nlinkS.Uline="end";
		 nlinkS.direction="horizontal";
		 nlink.arrowsRadius = 0; //箭头大小 
		 nlinkS.arrowsRadius = 10; //箭头大小
		 nlinkS.lineWidth = 2; // 线宽
		 
	}
	 middleNode.setSize(5,5);//中间节点尺寸
	 nlink.strokeColor="0,0,0";//默认线体颜色
	 nlinkS.strokeColor="0,0,0";
	
	 nlink.lineType="Uline";//设置线体为U型线
	 nlinkS.lineType="Uline";
	
	 nlink.textOffsetX = 5; //文字偏移地方
	 nlinkS.textOffsetX = 5; //文字偏移地方
	 linkArray.push(nlink);//线体数组添加
	 linkArray.push(nlinkS);
	 middleNode.uuid=generateUUid();
	 nlink.uuid =generateUUid();//文字偏移地方
	 nlinkS.uuid=generateUUid(); //文字偏移地方
	 nlink.groupLinkUUid=nlinkS.uuid;//添加线体组别关系
	 nlinkS.groupLinkUUid=nlink.uuid;
	 nodeA.treeNodeUUid=middleNode.uuid;//附属子节点
	 nodeZ.treeNodeUUid=middleNode.uuid;//附属子节点
	 nlink.middleNodeUUid=middleNode.uuid;//中间点节点
	 nlinkS.middleNodeUUid=middleNode.uuid;
	 scene.add(nlink);
	 scene.add(nlinkS);
	 middleNode.addEventListener('mousedrag', function(event){
		dragGroup(middleNode);
    });
}
/**
 * 更新线条属性
 * @param line:线体对象
 * @param lineData:更新数据
 * @returns
 */
function updateLinePropertyH(line,lineData){
	line.font =lineData.font; //字体大小
	line.lineWidth = lineData.lineWidth;//线体宽带
	line.arrowsRadius =lineData.arrowsRadius ;//箭头大小
	line.strokeColor =lineData.strokeColor;//填充颜色
	if(line.groupLinkUUid!=undefined){
		var groupLink=selectLineByUuidN(line.groupLinkUUid);
		if(line.Uline=="begin"){
			line.arrowsRadius=0;
			groupLink.arrowsRadius=lineData.arrowsRadius;
		}else{
			line.arrowsRadius=lineData.arrowsRadius;
			groupLink.arrowsRadius=0;
		}
		groupLink.font =lineData.font;//字体大小
		groupLink.lineWidth =lineData.lineWidth ;//线体宽带
		groupLink.strokeColor =lineData.strokeColor;//填充颜色
		
	}
	return false;
}
/**
 * 更新线条属性
 * @param node:线体对象
 * @param nodeData:更新数据
 * @returns
 */
function updateNodePropertyH(node,nodeData){
	node.font=nodeData.font ;//字体大小
	node.processType=nodeData.processType;//工序类型
	node.textPosition=nodeData.textPosition;//字体位置
	node.startProcedure=nodeData.startProcedure;//是否开始工序
	node.endProcedure=nodeData.endProcedure;//是否结束工序
	node.borderColor=nodeData.borderColor;
	if((nodeData.startProcedure==1)||(nodeData.endProcedure==1)) {//检测是否开始工序
		node.alarm = nodeData.alarm;
		node.alarmColor = nodeData.alarmColor;
		node.alarmAlpha = 0.1;
		
	}else{
		node.alarm=null;
	}
	
 }


/**
 * 拖拽图标对象，验证是否U性线,减少中心点移动
 * @param node:拖拽的节点
 *
 */
function dragImgNode(node){
	if(node.treeNodeUUid==undefined){
		return false;
	}else{
		var middleNode=selectNodeByUuidFisrt(node.treeNodeUUid);
		if((node.nodeRefer=="end")&&(node.directionType=="vertical")){
			if(node.y<=middleNode.y){
				middleNode.y=node.y;
			}
		}else if((node.nodeRefer=="begin")&&(node.directionType=="vertical")){
			if(node.y>=middleNode.y){
				middleNode.y=node.y+18;
			}
		}else if((node.nodeRefer=="end")&&(node.directionType=="transverse")){
			if(node.x<=middleNode.x){
				middleNode.x=node.x;
			}
		}else if((node.nodeRefer=="begin")&&(node.directionType=="transverse")){
			if(node.x>=middleNode.x){
				middleNode.x=node.x+20;
			}
		}
		
	}
}

/**
 * 拖拽图标对象，中间节点
 * @param node:拖拽的节点
 * 
 */
function dragGroup(line,addX,addY){
	var nodeA=line.nodeA;
	var nodeZ=line.nodeZ;
	nodeA.x=nodeAbaseLineX+addX;
	nodeZ.x=nodeZbaseLineX+addX;
	nodeA.y=nodeAbaseLineY+addY;
	nodeZ.y=nodeZbaseLineY+addY;
	
	/*var beginNode=node.beginNode;
	var endNode=node.endNode;
	if(node.directionType=="vertical"){
		beginNode.x=node.x;
		endNode.x=node.x;
		node.y=(beginNode.y+endNode.y)/2;
	}else if(node.directionType=="horizontal"){
		beginNode.y=node.y;
		endNode.y=node.y;
		node.x=(beginNode.x+endNode.x)/2;
	}*/
	
}

/**
 *功能:鼠标点击节点函数
 */

function handlerClickEvent(event,id,node){
    if(event.button == 0){
            if( typeof clickMethod === 'function' ){
                
                clickMethod(id,event,node);
            }else{

            }
    }
    if(event.button == 2){
        if( typeof rightClickMethod === 'function' ){
            node.alarm = '';
            rightClickMethod(id,event,node);
        }else{

        }
    }

}

function handleRightEvent(event,id,node,clickMethod){

    if(event.button == 2){
        if( typeof clickMethod === 'function' ){
            node.alarm = '';
            clickMethod(id,event,node);
        }else{

        }
    }
}

/**
 *功能:鼠标双击节点函数
 */
function handlerDbClickEvent(event,id,node,dbClickMethod){
    
}
/**
 *功能:鼠标覆盖节点函数
 */
function handlerMouseoverEvent(event,id,node,mouseOver){
   
}
/**
 *功能:鼠标离开节点函数
 */
function handlerMouseOutEvent(event,id,node,mouseOut){
   
}


/**
 * 根据节点uuid 获取节点
 * @param nodeAUuid 起始节点uuid
 * @param nodeZUuid 结束节点uuid
 */
function selectNodeByUUid(nodeAUuid,nodeZUuid){
	var nodeA;
	var nodeZ;
	for(var i=0;i<nodeArray.length;i++){
		if(nodeAUuid==nodeArray[i].uuid){
			nodeA=nodeArray[i];
		}
		if(nodeZUuid==nodeArray[i].uuid){
			nodeZ=nodeArray[i];
		}
	}
	var temp={nodeA:nodeA,nodeZ:nodeZ};
	return temp;
}

/**
 * 验证两个节点是否重复连线
 * @param node 起始节点
 * @param nodeZ 结束节点
 * return 200:验证连线成功，201同种物体，301重复连线
 */

function validateLineN(nodeA,nodeZ){
	var result=200;
	if(nodeA.text==nodeZ.text){
		result=false;
		return "同种工序不能连";
	}
	for(var i=0;i<linkArray.length;i++){
		if((linkArray[i].nodeA==nodeA)&&(linkArray[i].nodeZ==nodeZ)){
			result="连线重复";break;
		}
	}
	if(nodeA.treeNodeUUid!=undefined){
		var treeNode=selectNodeByUuidFisrt(nodeA.treeNodeUUid);
		for(var i=0;i<linkArray.length;i++){
			if((linkArray[i].nodeA==treeNode)&&(linkArray[i].nodeZ==nodeZ)){
				result="连线重复";break;
			}
		}
	}
	return result;
}
/**
 * 移除节点相关线体
 * @param node
 */
function removeNodeRelationLine(node){
	for(var i=0;i<linkArray.length;i++){
		if(linkArray[i].nodeA==node||linkArray[i].nodeZ==node){
			removeLineN(linkArray[i]);
		}
	}
}
/**
 * 移除线体
 * @param line
 */
function removeLineN(line){
	if(line.groupLinkUUid!=undefined){//判断是否是U型线体
		var groupLink=selectLineByUuidN(line.groupLinkUUid);
		var middleNode=selectNodeByUuidFisrt(line.middleNodeUUid);
		nodeArray.removeValue(middleNode);
		scene.remove(middleNode);
		scene.remove(groupLink);
		linkArray.removeValue(groupLink);
		nodeArray.removeValue(groupLink);
	}
	scene.remove(line);//场景移除对象
	linkArray.removeValue(line);//线条数组移除对象
	scene.remove(line);//场景移除
}
/**
 * 验证工序
 * return
 * 100表示验证通过，101表示没有开始工序，
 * 102表示多个开始工序，103表示没有结束工序
 * 104表示多个开始工序，105表示多条工序
 * 106没有连线的节点
 */
function validateProcedure(){
	var begin=0;
	var end=0;
	var beginNode;
	var endNode;
	var firstBegin=0;
	var lastBegin=0;
	for(var i=0;i<nodeArray.length;i++){
		if(nodeArray[i].startProcedure==1){
			begin++;
			beginNode=nodeArray[i];
		}
		if(nodeArray[i].endProcedure==1){
			end++;
			endNode=nodeArray[i];
		}
		var result=validateOneProcedure(nodeArray[i]);
		if(result.first==1){
			firstBegin++;
		}
		if(result.last==1){
			lastBegin++;
		}
		if(result.first==0){
			return 106;
		}
	}
	
	if(begin==0){
		return 101;
	}
	if(begin>1){
		return 102;
	}
	if(end==0){
		return 103;
	}
	if(end>1){
		return 104;
	}
	if((firstBegin>1)&&(lastBegin>1)){
		return 105;
	}
	return 100;
	
}
/**
 * 验证只有一条工序
 */
function validateOneProcedure(node){
	var first=0;
	var last=0;
	for(var i=0;i<linkArray.length;i++){
		if(linkArray[i].nodeA==node){
			first++;
		}
		if(linkArray[i].nodeZ==node){
			last++;
		}
	}
	var result={first:first,last:last};
	return result;
}

function addMiddleDrag(middleNode){
	
	middleNode.addEventListener("mousedrag", function(event){
		var centerNode=selectNodeByUuidFisrt(middleNode.brotherId);
		if(middleNode.directionType=="horizontal"){
			middleNode.y=centerNode.y;
		}else if(middleNode.directionType=="vertical"){
			middleNode.x=centerNode.x;
		}
		
	});
}


/**
 * 验证前面是否是后面起始点
 * @param nodeA
 * @param nodeZ
 */

function validateBeforeNodeN(nodeA,nodeZ,result){
	if(result==null){
		selectNextNode(nodeA,nodeZ);
	}else if(result.result){
		validateBeforeTemp= true;
	}else if(result.array.length>0){
		addNonRepetitionNode(result.array);
		selectNextNode(result.array[0],nodeZ);
		
	}else if(nonRepetitionNode.length>0){
		for(var i=0;i<nonRepetitionNode.length;i++){
			if(nonRepetitionNode[i].ergodic=false){
				selectNextNode(nonRepetitionNode[i],nodeZ);
			}
		}
	}else{
		return false;
	}
	return validateBeforeTemp;
}

function selectNextNode(nodeA,nodeZ){
	nodeA.ergodic=true;
	var result={"result":false,array:[]};
	
	for(var i=0;i<linkArray.length;i++){
		if(linkArray[i].nodeA==nodeA){
			if(linkArray[i].nodeZ==nodeZ){
				result.result=true;
			}else{
				result.array.push(linkArray[i].nodeZ);
			}
		}
	}
	validateBeforeNodeN(nodeA,nodeZ,result);
	
}
var nonRepetitionNode=new Array();
/**
 *添加不重复节点
 */
function addNonRepetitionNode(array){
	for(var i=1;i<array.length;i++){
		if($.inArray(array[i],nonRepetitionNode)<0){
			nonRepetitionNode.push(array[i]);
		}
	}
}
/**
 * 
 */
function addNonErgodic(){
	for(var i=0;i<nodeArray.length;i++){
		nodeArray[i].ergodic=false;
	}
}
/**
 * 通过uuid 查询到节点node
 * @param uuid
 * @returns
 */
function selectNodeByUuidFisrt(uuid){
	var node;
	for(var i=0;i<nodeArray.length;i++){
		if(nodeArray[i].uuid==uuid){
			node=nodeArray[i];break;
		}
	}
	return node;
}
/**
 * 通过uuid查询线体
 * @param uuid
 * @returns
 */
function selectLineByUuidN(uuid){
	var line;
	for(var i=0;i<linkArray.length;i++){
		if(linkArray[i].uuid==uuid){
			line=linkArray[i];break;
		}
	}
	return line;
}
/**
 * 生成uuid
 * @returns {String}
 */
function generateUUid(){
	 var rnd = "";
	 var end="";
	 for (var i = 0; i<5; i++) {
		 rnd += Math.floor(Math.random() * 10);
		 end+=Math.floor(Math.random() * 10);
	 }
	 var timestamp = rnd+Date.parse(new Date())+end;
	return timestamp;
}

/**
 * 移除数组中的内容
 */
Array.prototype.removeValue = function(val) {
	var index = this.indexOf(val);
	if (index > -1) {
	this.splice(index, 1);
	}
};
	
Array.prototype.indexOf = function(val) {
	for (var i = 0; i < this.length; i++) {
	if (this[i] == val) return i;
	}
}



