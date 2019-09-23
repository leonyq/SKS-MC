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
var ulineTempLike=1;//展示线体时候
/**
 *功能:获取场景scene
 *  param:canvas（画布）
 */
function initCanvas(canvas,select,wheelZoom,alpha)
{
	stage = new JTopo.Stage(canvas);
	scene = new JTopo.Scene(stage);
    stage.mode=select;//场景模式
	stage.wheelZoom = wheelZoom;//鼠标滚动比例
	scene.alpha=alpha;//场景透明度
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
    	nodeArray.removeTopo(node);//节点数据移除对象
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
    	scene.clear();
		linkArray.length=0;
		nodeArray.length=0;
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
    	addLineF(nodeA,nodeZ,lineJson.text,lineJson.font,lineJson.fontColor,lineJson.lineWidth,lineJson.arrowsRadius,lineJson.strokeColor,lineJson.direction,lineJson.lineType,lineJson.uuid,lineJson.Uline,lineJson.groupLinkUUid,lineJson.middleNodeUUid);
    }
    this.addLine=function(nodeA,nodeZ,text,font,fontColor,lineWidth,arrowsRadius,strokeColor,lineType,direction, lineType,uuid){
    	addLineF(nodeA,nodeZ,text,font,fontColor,lineWidth,arrowsRadius,strokeColor,direction,lineType,uuid);
    }
    this.addNodeByJson=function(nodeJson){
    	addNode(nodeJson.text,nodeJson.imgUrl,nodeJson.x,nodeJson.y,nodeJson.uuid,nodeJson.font,nodeJson.fontColor,nodeJson.startProcedure,nodeJson.endProcedure,nodeJson.processType,nodeJson.borderColor,nodeJson.nodeType,nodeJson.alarm,nodeJson.alarmColor,nodeJson.dragable,nodeJson.uuid,nodeJson.nodeRefer,nodeJson.treeNodeUUid,nodeJson.directionType,nodeJson.groupCode,nodeJson.sequence);
    }
    /**
     * 添加中间节点
     */
    this.addMiddleNodeByJson=function(nodeJson){
    	addMiddleNode(nodeJson.uuid,nodeJson.x,nodeJson.y,nodeJson.beginNodeUuid,nodeJson.endNodeUuid,nodeJson.directionType)
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
    this.validateBeforeNode=function(nodeAUuid,nodeZUuid,result){
    	validateBeforeTemp=false;
    	var nodeA=selectNodeByUuidFisrt(nodeAUuid);
    	var nodeZ=selectNodeByUuidFisrt(nodeZUuid);
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
function addNode(text,imgUrl, x, y,uuid,font,fontColor,startProcedure,endProcedure,processType,borderColor,nodeType,alarm,alarmColor,dragable,uuid,nodeRefer,treeNodeUUid,directionType,groupCode,sequence){
	var node = new JTopo.Node();
	node.setImage(imgUrl, false);
	node.setLocation(x,y);
	node.setSize(30, 30);
	node.text=text;
	node.font=font;
	node.fontColor= fontColor;
	if((processType==null)||(processType=="")){
		node.processType=1;
	}else{
		node.processType=processType;
	}
	
	node.startProcedure=startProcedure;
	node.endProcedure=endProcedure;
	node.groupCode=groupCode;
	node.imgUrl=imgUrl;
	node.borderColor =borderColor ; //边框颜色     
	node.nodeType=nodeType;      
	node.uuid=uuid;
	node.dragable=dragable;
	node.textOffsetY=8; 
	node.borderWidth = 3; // 边框的宽度
	node.borderColor =borderColor; // 边框的宽度
	if((startProcedure==1)||(endProcedure==1)) {//检测是否开始工序
		node.alarm = alarm;
		node.alarmColor = alarmColor;
		node.alarmAlpha = 0.1;
	}else{
		node.alarm=null;
	}
	if((uuid!=undefined)&&(uuid!=null)&&(uuid!="")){
		node.uuid=uuid;
	}else{
		node.uuid=util.getUUID();
	}
	
	if((nodeRefer!=undefined)&&(nodeRefer!="")){
		node.nodeRefer=nodeRefer;
	}
	
	if((treeNodeUUid!=undefined)&&(treeNodeUUid!="")){
		node.treeNodeUUid=treeNodeUUid;
	}

	if((directionType!=undefined)&&(directionType!="")){
		node.directionType=directionType;
	}
	if((sequence!=undefined)&&(sequence!="")){
		node.sequence=sequence;
	}
	if(((sequence==undefined)||(sequence==""))&&(sequenceTemp==2)){
		node.sequence=addSequenceNext();
	}
	
	
    scene.add(node);
    nodeArray.push(node);
	node.shadow = false;
	node.addEventListener('mousedrag', function(event){
		dragImgNode(node);

	});
	//添加点击事情
	if(clickMethod!=null){
        node.addEventListener('mouseup', function(event){
         handlerClickEvent(event,id,node,clickMethod);
        });
    }
	
	
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
function addMiddleNode(uuid,x,y,beginNodeUuid,endNodeUuid,directionType){
	var middleNode = new JTopo.Node('');//创建U型线中间节点
	middleNode.setSize(5,5);//中间节点尺寸
	middleNode.setLocation(x,y);//设置中间节点坐标
	middleNode.beginNodeUUid=beginNodeUuid;//设置开始节点
	middleNode.endNodeUUid=endNodeUuid;//设置结束节点
	middleNode.nodeType="middleNode";
	scene.add(middleNode);
	middleNode.uuid=uuid;
	nodeArray.push(middleNode);
}

/**
 * 添加线别的方法
 * @param nodeA:文本内容
 * @param nodeZ：照片路径
 * @param text：x坐标
 * @param font：y坐标
 * @param fontColor:uuid唯一id
 * @param lineWidth：字体
 * @param arrowsRadius:字体颜色
 * @param strokeColor：开始工序1表示是，2表示不是
 * @param lineType：线体类型:straight直线，broken折线，Uline型线
 * @param direction：开始工序1表示是，2表示不是
 * @param ：开始工序1表示是，2表示不是
 * 
 */
function addLineF(nodeA,nodeZ,text,font,fontColor,lineWidth,arrowsRadius,strokeColor,direction,lineType,uuid,Uline,groupLinkUUid,middleNodeUUid){
	var link;
	if(lineType=="straight"){
		link = new JTopo.Link(nodeA,nodeZ);
	}else if(lineType=="broken"){
		link = new JTopo.FoldLink(nodeA,nodeZ);
		link.direction=direction;
	}else if(lineType=="Uline"){
		
		if(ulineTempLike==1&&sequenceTemp==2){
			link = new JTopo.FoldLink(nodeA,nodeZ);
			link.direction=direction;
		}else{
			addUline(nodeA,nodeZ);
			return false;
		}
	}
	link.shadow = false;
	link.text=text;
	link.font=font;
	link.fontColor=fontColor;
	link.arrowsRadius=arrowsRadius;
	link.lineWidth=lineWidth;
	link.strokeColor = strokeColor;
	scene.add(link);
	link.textOffsetX = 13;
	link.lineType=lineType;
	link.arrowsOffset = 0;
	link.bundleGap = 0; // 线条之间的间隔
	
	if((Uline!=undefined)&&(Uline!="")){
		link.Uline=Uline;
	}
	if((groupLinkUUid!=undefined)&&(groupLinkUUid!="")){
		link.groupLinkUUid=groupLinkUUid;
	}
	if((middleNodeUUid!=undefined)&&(middleNodeUUid!="")){
		link.middleNodeUUid=middleNodeUUid;
	}
	
	if((uuid!=undefined)&&(uuid!=null)&&(uuid!="")){
		link.uuid=uuid;
	}else{
		link.uuid=util.getUUID();
	}
	linkArray.push(link);
	if(clickMethod!=null){
		link.addEventListener('mouseup', function(event){
         handlerClickEvent(event,id,link,clickMethod);
        });
    }
	
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
		 nlinkS.arrowsRadius = 7; //箭头大小
		 nlinkS.lineWidth = 1; // 线宽
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
		 nlinkS.arrowsRadius = 7; //箭头大小
		 nlink.lineWidth = 1; // 线宽
		 nlinkS.lineWidth = 1; // 线宽
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
	 middleNode.uuid=util.getUUID();
	 nlink.uuid =util.getUUID();//文字偏移地方
	 nlinkS.uuid=util.getUUID(); //文字偏移地方
	 nlink.groupLinkUUid=nlinkS.uuid;//添加线体组别关系
	 nlinkS.groupLinkUUid=nlink.uuid;
	 nodeA.treeNodeUUid=middleNode.uuid;//附属子节点
	 nodeZ.treeNodeUUid=middleNode.uuid;//附属子节点
	 nlink.middleNodeUUid=middleNode.uuid;//中间点节点
	 nlinkS.middleNodeUUid=middleNode.uuid;
	 nlink.lineWidth = 1; // 线宽
	nlinkS.lineWidth = 1; // 线宽
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
function dragGroup(node){
	var beginNode=selectNodeByUuidFisrt(node.beginNodeUUid);
	var endNode=selectNodeByUuidFisrt(node.endNodeUUid);
	if(node.directionType=="vertical"){
		if(node.y-10<=beginNode.y){
			node.y=beginNode.y+10;
		}else if(node.y+10>=endNode.y){
			node.y=endNode.y+10;
		}
	}else{
		if(node.x-10<=beginNode.x){
			node.x=beginNode.x+10;
		}else if(node.x+10>=endNode.x){
			node.x=endNode.x+10;
		}
	}
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
	copylineArray = linkArray.concat();
	for(var i=0;i<copylineArray.length;i++){
		if(copylineArray[i].nodeA==node||copylineArray[i].nodeZ==node){
			removeLineN(copylineArray[i]);
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
		nodeArray.removeTopo(middleNode);
		scene.remove(middleNode);
		scene.remove(groupLink);
		linkArray.removeTopo(groupLink);
		nodeArray.removeTopo(groupLink);
	}
	scene.remove(line);//场景移除对象
	linkArray.removeTopo(line);//线条数组移除对象
	scene.remove(line);//场景移除
}
/**
 * 验证工序
 * return
 * 100表示验证通过，101表示没有开始工序，
 * 102表示多个开始工序，103表示没有结束工序
 * 104表示多个结束工序，105表示多条工序
 * 106开始工序不为正常工序 107结束工序不为正常工序
 
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
		if(result.first==1&&result.last==0){
			firstBegin++;
		}
		if(result.last==1&&result.first==0){
			lastBegin++;
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
	if(beginNode.processType!=1){
		return 106;
	}
	
	if(endNode.processType!=1){
		return 107;
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
/**
 * 验证前面是否是后面起始点
 * @param nodeA
 * @param nodeZ
 */

function validateBeforeNodeN(nodeA,nodeZ,result){
	if(nodeA==nodeZ){
		validateBeforeTemp=true;
		return validateBeforeTemp;
	}
	if(result==null||(result==undefined)){
		selectNextNode(nodeA,nodeZ);
	}else if(result.result){
		validateBeforeTemp= true;
	}else if(result.array.length>0){
		addNonRepetitionNode(result.array);
		for(var k=0;k<result.array.length;k++){
		selectNextNode(result.array[k],nodeZ);
		}
		
		
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
				if((linkArray[i].nodeZ==nodeZ)||(linkArray[i].nodeZ==nodeA)){
					result.result=true;
				}else if(linkArray[i].nodeZ.ergodic==false){
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
 * 设置工序未被排列
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
 * 添加序列
 */
function addSequenceNext(){
	var sequenceN=0;
	for(var i=0;i<nodeArray.length;i++){
		if(nodeArray[i].nodeType=="imgNode"){
			if(nodeArray[i].sequence>sequenceN){
				sequenceN=nodeArray[i].sequence;
			}
		}
	}
	sequenceN++;
	return sequenceN;
}
/**
 * 清除画布
 */

function cleanScene(){
	scene.clear();
	linkArray.length=0;
	nodeArray.length=0;
}

/**
 * 移除数组中的内容
 */
Array.prototype.removeTopo = function(val) {
	var index = this.topoIndexOf(val);
	if (index > -1) {
	this.splice(index, 1);
	}
};
	
Array.prototype.topoIndexOf = function(val) {
	for (var i = 0; i < this.length; i++) {
	if (this[i] == val) return i;
	}
}



