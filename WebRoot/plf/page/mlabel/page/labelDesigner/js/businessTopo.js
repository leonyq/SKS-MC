/**
 * 工艺流程组态业务相关
 * Created by 黄志鹏 on 2017/11/09
 * version 1.0
 */
	var canvas;//画布元素	
	var imgSrc;//图片路径
	var scene;
	var stage;
	var currentNode;//当前节点
	var link;
	var startNode;//开始节点
	var endNode;//结束节点
	var lineMode = false;//默认划线为false
	var addLineType;//选择线的类型
	var currentObj = null;//当前对象
	var canvasObj;//当前画布对象
	var pointType=true;//指针模式
	var imgNodeType;
	var firstSelected;
	var container;
	var copyTemp=false;//复制标志
	var copyObject;//复制模型
	var ctrlVtemp=false;
	var alignObject;
	var divs;
	var modeType=1;//场景类型
	var textNodeArray=new Array();
	var LODOP; //声明为全局变量   
	var baseCanvasWidth;//画布初始宽度
	var baseCanvasHeight;//画布初始高度
	var containerWidth;
	var containerHeight;
	var paperWidth;//纸张宽带
	var paperHeight//纸张高度
	var spaceNum;
	var	lableWidth;
	var	lableHeight;
	var	spaceVal;
	var LODOP;
	localStorage.printStatus=1;
	var topValueNext;
	var columnNumValueNext;
	var spaceValNextNext;
	var leftValueNext;
	var modelType;
	/**
	 *初始化内容
	 */
	function initContext(){
		containerCanvas = document.getElementById("content"); 
		//document.getElementById("canvas").width =divs.scrollWidth;
		canvas = document.getElementById("canvas");
		canvasObj=new initCanvas(canvas,"select",1,1);
		scene=canvasObj.getScene();
		scene.backgroundColor="185,185,185";
		scene.alpha=1;
		stage=canvasObj.getStage();
		startNode = new JTopo.CircleNode();
		startNode.radius = 3; 
		endNode = new JTopo.CircleNode(); 
		endNode.radius = 3;
		link = new JTopo.Link(startNode, endNode);
		link.visible = false;
		
		container = new JTopo.Container('');
        container.textPosition = 'Middle_Center';
        container.fontColor = '100,255,0';
        container.font = '18pt 微软雅黑';
        container.borderColor = '255,0,0';
        container.fillColor = '255,255,255';
        container.alpha=1;
        container.setSize(400,250);
        container.edit=false;
        container.x=0;
        container.y=0;
        container.dragable=false;
        scene.add(container);
        scene.scaleX=1;
        scene.scaleY=1;
        
        stage.mode="select";
		
        
		
		
		
		
		
	// 松开鼠标左键
		/*scene.mouseup(function(e) {
			
			removeTextNode();
			if (2 == e.button) return;
			var node = e.target;
			currentNode = node;
			// 端口连线
			if(node && node.getSelectedPort && node.getSelectedPort()){
				var port = node.getSelectedPort();
				if((port)&&(node.nodeType=="imgNode")){
					linkHandler(node, port);
				}else{
					// 隐藏掉连线
					hideLink();
				}
			}else{
				if(node instanceof JTopo.Container){
					removeTextNode();
				}
				//选中了node
				if( node instanceof JTopo.Node){
					if(node.nodeType=="middle"){
						node.editAble=false;
					}
					
					validateFistSelected();
					showObjectParams(node);
					validateFirstSelect();
					removeLineNode();
				}else if(node instanceof JTopo.Link){
					currentObj=node;
					addLineNode();
					updateTopBar();
					$(".lableSize").hide();
					$(".lineAttribute").show();
					var x=currentObj.nodeA.x-currentObj.nodeZ.x;
					var y=currentObj.nodeA.y-currentObj.nodeZ.y;
					var linelength=Math.sqrt(x*x+y*y);
					$("#linelength").val(linelength/5);
				}else{
					_switch('#paper');
					$(".lableSize").show();
					$(".lineAttribute").hide();
					hideLink();
					firstSelected=null;
					removeLineNode();
				}
			}
		});
		scene.mousemove(function(e) { 
			
			link.nodeZ.setLocation(e.x, e.y);
		}); 
		
		scene.mouseup(function(e) {
			currentNode = e.target;
			if(2 == e.button){
				popMenu(e);
				hideLink();
			}
			
		});*/
		
	}
	/**
	 *绑定按钮事件
	 */
	function billingButton(){
		$("#contextmenu a").click(function() {
			var billing = $(this).text();
			 if("删除" == billing){
				 if(currentObj instanceof JTopo.Node){
					 canvasObj.removeNode(currentObj);
				 }else if(currentObj instanceof JTopo.Link){
					 canvasObj.removeLine(currentObj);
				 }
			}else if("直线" == billing){
				//beginLine(currentNode);
				lineMode = true;
				linkHandler(currentNode);
				addLineType="straight";
			}else if("折线" ==billing){
				lineMode = true;
				linkHandler(currentNode);
				addLineType="broken";
			}else if("U型线"==billing){
				lineMode = true;
				linkHandler(currentNode);
				addLineType="Uline";
			}
			$("#contextmenu").hide();
		});
	}
	// 增加连线连接两个端点
	function linkHandler(node, port){
		if (!lineMode) return;
		if(port){
			if ((link.visible == false)&&(link.startNode!=null)){ // 开始绘制线
				link.startNode = node;
				link.startPort = port;
				var cp = node.getCenterLocation();
				link.nodeA.x = cp.x + port.x, 
				link.nodeA.y = cp.y + port.y, 
				link.nodeZ.x = cp.x + port.x, 
				link.nodeZ.y = cp.y + port.y; 
				showLink();
			}else if (link.startNode !== node) { // 结束绘制
				hideLink();
				link.startPort.clicked = false;
				port.clicked = false;
				var l = new JTopo.PCLink(link.startNode, node, link.startPort.name, port.name);
				l.shadow = false;
				l.arrowsRadius = 10;
				l.arrowsOffset = 0;
				scene.add(l);
			}

		}else{
			if (link.visible == false){ // 开始绘制线
				link.startNode = node;
				if(node==null){
					return;
				}
				link.nodeA.x = node.getCenterLocation().x, 
				link.nodeA.y = node.getCenterLocation().y, 
				link.nodeZ.y = node.getCenterLocation().y; 
				link.nodeZ.x = node.getCenterLocation().x, 
				showLink();
			}else if (link.startNode !== node) { // 结束绘制
				hideLink();
				addCanvasLine(node);
			}
		}
	}
	
	/**
	 * 更新节点属性
	 * @param node 节点
	 */
	function updateObject(){
		if(currentObj instanceof JTopo.Node){
			if($('#barShow').is(':checked')) {
				currentObj.text=$("#fontTextContant").val();
			}
			currentObj.fontText=$("#fontTextContant").val();
			if((currentObj.code!=undefined)&&(currentObj.code=="two")){
				currentObj.text="";
			}
		}
	}
	
	/**
	 * 显示线体
	 */
	function showLink(){
		link.visible = true;
		scene.add(link);
	}
	/**
	 * 隐藏线体
	 */
	function hideLink(){
		link.visible = false;
		scene.remove(link);
		for(var i=0;i<linkArray.length;i++){
			linkArray[i].selected=false;
		}
	}
	
	/**
	 * 展示线体
	 */
	function showObjectParams(node){
		currentObj = node;
		addNodeText(node.fontText);
		if((currentObj.code!=undefined)&&(currentObj.code!="")){
			updateBarcodeLable(); 
		}else{
			updateTextLable();
			addNodeText(node.fontText);
		}
		
	}
	
	
	
	
	/**
	 * 业务功能添加线体
	 * @param nodeA 
	 * @param nodeZ 
	 */
	function addCanvasLine(node){
		var nlink;
		var lineJson={
				text:"Y",
				font:12,
				fontColor:"0,0,0",
				lineWidth:2,
				arrowsRadius:10,
				strokeColor:"0,0,0",
				direction:"vertical",
				lineType:"straight"
		};
		if(addLineType=="Uline"){
			lineJson.lineType="Uline";
		}
		if(addLineType=="straight"){
			lineJson.lineType="straight";
		}else if(addLineType=="broken"){
			lineJson.lineType="broken";
		}
		if(canvasObj.validateLine(link.startNode, node)==200){
			canvasObj.addLineByJson(link.startNode, node, lineJson);
			currentNode=null;
		}else{
			alert(canvasObj.validateLine(link.startNode, node));
		}
		
		
	}
	/**
	 * 画布添加节点
	 * @param imgSrc：图片背景 
	 * @param event：点击事件 
	 */
	function addCanvasObject(imgSrc,event){
		var uuid = Date.parse(new Date());
		var nodeJson={
				text:"",
				imgUrl:imgSrc,
				x:event.x,
				y:event.y,
				uuid:Date.parse(new Date()),
				font:"12",
				fontColor:"0,0,0",
				nodeType:"imgNode",
				width:60,
				height:60,
				fontText:"",
				dataSource:"",
				bold:"",
				italic:"",
				fontType:"微软雅黑",
				fontSize:"12",
				textPosition:"Bottom_Center",
				textOffsetX:0,
				barcode:"",
				code:"",
				textPistionX:0,
				textPistionY:0
		};
		if((imgSrc.indexOf("ico-QRcode")>0)){
			nodeJson.nodeType="imgNode";
			nodeJson.width=60;
			nodeJson.height=60;
			nodeJson.barcode="QRCode";
			nodeJson.code="two";
		}else if(imgSrc.indexOf("ico-Dcode")>0){
			nodeJson.nodeType="imgNode";
			nodeJson.width=120;
			nodeJson.height=60;
			nodeJson.barcode="128Auto";
			nodeJson.code="one";
			if($("#codeTextType").val()==1){
				nodeJson.dataSource=$("#fontTextSource").val();
				var fontText=$("#fontTextSource").find("option:selected").attr("name");
				nodeJson.fontText=fontText;
				if($('#barShow').is(':checked')) {
					nodeJson.text=fontText;
				}
			}
			
			
		}
		else if((imgSrc.indexOf("rect")>=0)){
			nodeJson.nodeType="rect";
		}else if((imgSrc.indexOf("ico-datatext")>=0)){
			nodeJson.nodeType="datatext";
			nodeJson.width=70;
			nodeJson.height=30;
			nodeJson.text="";
			nodeJson.textPosition="Middle_Center";
		}else if((imgSrc.indexOf("text")>=0)){
			nodeJson.nodeType="text";
			nodeJson.width=70;
			nodeJson.height=30;
			nodeJson.text="";
			nodeJson.textPosition="Middle_Center";
		}else if((imgNodeType.indexOf("imgType")>=0)){
			nodeJson.nodeType="imgType";
		}else if((imgSrc.indexOf("time-next")>=0)){
			nodeJson.nodeType="time";
			var timeType=$("#timeType").val();
			var time = new Date().format(timeType);
			nodeJson.text=time;
			nodeJson.fontText=time;
			nodeJson.textPosition="Middle_Center";
			nodeJson.width=120;
			nodeJson.height=30;
			nodeJson.timeType=timeType;
			nodeJson.imgUrl="";
		}else if((imgSrc.indexOf("circular")>=0)){
			nodeJson.nodeType="circular";
			nodeJson.width=100;
			nodeJson.height=100;
			nodeJson.imgUrl!="";
		}
		if(pointType==false){
			nodeJson.dragable=false;
		}
		if((imgSrc.indexOf("line")>0)){
			addLineToCanvas(imgSrc,event);
		}else{
			canvasObj.addNodeByJson(nodeJson);
		}
		
	}
	/**
	 * 添加线别
	 * @param src
	 * @param event
	 */
	function addLineToCanvas(src,event){
		lineMode = false;
		var nodeAJson={
				uuid:generateUUid(),
				x:event.x,
				y:event.y,
				nodeType:"middle",
				directionType:"vertical",
				brotherId:""
				
		};
		var nodeZJson={
				uuid:generateUUid(),
				x:event.x,
				y:event.y,
				nodeType:"middle",
				directionType:"vertical",
				brotherId:""
		};
		nodeAJson.brotherId=nodeZJson.uuid;
		nodeZJson.brotherId=nodeAJson.uuid;
		
		var lineJson={
				lineWidth:$("#lineWidth").val(),
				strokeColor:'0,0,0',
				uuid:generateUUid(),
				directionType:"vertical",
				lineType:$("#lineType").val()
		};
		
		if((src.indexOf("ico-horizontal-line")>0)){
			nodeAJson.x=event.x;
			nodeZJson.x=event.x+80;
			lineJson.directionType="horizontal";
			nodeAJson.directionType="horizontal";
			nodeZJson.directionType="horizontal";
		}else if((src.indexOf("ico-vertical-line")>0)){
			nodeAJson.y=event.y;
			nodeZJson.y=event.y+80;
			nodeAJson.directionType="vertical";
			nodeZJson.directionType="vertical";
		}else if((src.indexOf("ico-slash-line")>0)){
			nodeZJson.x=event.x+50;
			nodeZJson.y=event.y-50;
			nodeAJson.directionType="slash";
			nodeZJson.directionType="slash";
		}
		var nodeA=canvasObj.addMiddleNodeByJson(nodeAJson);
		var nodeZ = canvasObj.addMiddleNodeByJson(nodeZJson);
		nodeA.lineUUid=lineJson.uuid;
		nodeZ.lineUUid=lineJson.uuid;
		var linkL = canvasObj.addLineByJson(nodeA,nodeZ,lineJson);
	}
	
	
	/**
	 * 展示节点属性
	 * @param node 节点
	 */
	function updateNodeLableProperty(node){
		$("#pLabel").val(node.text);
		parseFont(node.font);
	}
	

	/**
	 * 展示线体属性
	 * @param link 节点
	 */
	function updateLinkLableProperty(node){
	
		
	}
	
	
	/**
	 * 线体翻转功能
	 * @param node 节点
	 */
	function foldingLine(){
			if((currentObj instanceof JTopo.Node)||(currentObj.lineType=="Uline")){//当前对象是U型线与节点
				return false;
			}
			if(currentObj.direction=="horizontal"){//线体横竖模式转换
				 currentObj.direction="vertical";
			 }else{
				 currentObj.direction="horizontal";
			 } 
			
		}
	
	/**
	 * 修改文字属性
	 * @param fontstr 字体串
	 */
	function parseFont(fontstr){
		
	}
	
	/**
	 *弹出右键菜单
	 */
	 
	function popMenu(e) {
		if((currentNode instanceof JTopo.Link)||(currentNode instanceof JTopo.Node)){
			currentObj=currentNode;
			if(currentNode instanceof JTopo.Node){
				$(".node-class").show();
			}else{
				$(".node-class").hide();
			}
			$("#contextmenu").css({
				top:e.pageY,
				left:e.pageX
			}).show();
		}else{
			popHide(e);
		}
		
	}		
	/**
	 *隐藏菜单
	 */
	function popHide(e){
		$("#contextmenu").hide();
	}
	
	function allowDrop(e) {
		e.preventDefault();
	}
	/**
	 * 拖动方法
	 * @param e:拖动事件
	 */
	function drag(e) {
		imgSrc = e.target.name;
		
		imgNodeType=e.target.title;
	}
	function drop(e) { 
		e.preventDefault();
	}
	/**
	 * 保存数据
	 */
	function saveNodeInfo(){
		removeTextNode();
		textAlignDetail();
		var nodeData=new Array();
		var lineData=new Array();
		//保存节点数据
		for(var i=0;i<nodeArray.length;i++){
			var temp=nodeArray[i].getBound();
			var json={
					uuid:nodeArray[i].uuid,
					x:nodeArray[i].x,
					y:nodeArray[i].y,
					imgUrl:nodeArray[i].imgUrl,
					width:temp.width,
					height:temp.height,
					text:nodeArray[i].text,
					fontText:nodeArray[i].fontText,
					dataSource:nodeArray[i].dataSource,
					font:nodeArray[i].font,
					fontColor:nodeArray[i].fontColor,
					nodeType:nodeArray[i].nodeType,
					bold:nodeArray[i].bold,
					italic:nodeArray[i].italic,
					fontType:nodeArray[i].fontType,
					fontSize:nodeArray[i].fontSize,
					textPosition:nodeArray[i].textPosition,
					textOffsetX:nodeArray[i].textOffsetX,
					barcode:nodeArray[i].barcode,
					code:nodeArray[i].code,
					codeTextType:nodeArray[i].codeTextType,
					textPistionX:nodeArray[i].textPistionX,
					textPistionY:nodeArray[i].textPistionY,
					directionType:nodeArray[i].directionType,
					brotherId:nodeArray[i].brotherId,
					isWrap:nodeArray[i].isWrap
			};
			nodeData.push(json);
		}
		//保存线体
		for(var i=0;i<linkArray.length;i++){
			var nodeA=linkArray[i].nodeA;
			var nodeZ=linkArray[i].nodeZ;
			var lineJson={
					uuid:linkArray[i].uuid,
					nodeAUuid:linkArray[i].nodeA.uuid,
					nodeZUuid:linkArray[i].nodeZ.uuid,
					lineWidth:linkArray[i].lineWidth,
					strokeColor:linkArray[i].strokeColor,
					dashedPattern:linkArray[i].dashedPattern,
					lineType:linkArray[i].lineType,
					nodeAX:linkArray[i].nodeA.x,
					nodeAY:linkArray[i].nodeA.y,
					nodeZX:linkArray[i].nodeZ.x,
					nodeZY:linkArray[i].nodeZ.y,
					directionType:linkArray[i].directionType
			};
			lineData.push(lineJson);
		}
		//保存标签以及纸张数据
		var pageInfo={
					paperWidth:paperWidth,
					paperHeight:paperHeight,
					lableWidth:lableWidth,
					lableHeight:lableHeight,
					spaceVal:spaceVal
		};
		var x=container.x;
		var y=container.y;
		var objectData={node:nodeData,line:lineData,page:pageInfo,noSourceArray:"",sourceArray:"",containerX:x,containerY:y};
		return objectData;
		
	}
	/**
	 * 增加节点
	 */
	function addNodeNum(num,orderArray){
		for(var i=0;i<orderArray.length;i++){
			orderArray[i].num=num+i;
		}
	
	}
	
	/**
	 * 切换成指针模式
	 */
	function gainPointType(object){
		$(".tool-con").each(function(){
		   $(this).removeClass("tool-con-active");
		  });
		$(object).addClass("tool-con-active");
		canvasObj.pointType();
		lineMode = false;
		pointType=true;
		
	}
	/**
	 * 文本处理
	 */
	function textAlignContextDetail(type){
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].selected){
				currentObj=nodeArray[i];
				textAlignContext(type);
			}
		}
		
	}
	
	/**
	 * 文本位置
	 */
	function textAlignContext(type){
		
		if((currentObj.nodeType=="datatext")||(currentObj.nodeType=="text")||(currentObj.nodeType=="time")){
			 var textWidth = currentObj.textWidth;
			 var textHeight = currentObj.textHeight;
			 var temp=currentObj.getBound();
			 var width=temp.width;
			 var height=temp.height;
			 if(type==1){
				 currentObj.textPosition = "Middle_Left";
				 currentObj.textOffsetX=textWidth;
				 currentObj.textPistionX=currentObj.x;
				 currentObj.textPistionY=currentObj.y+(height-textHeight)/2;
			 }else if(type==2){
				 currentObj.textPosition = "Middle_Right";
				 currentObj.textOffsetX=-textWidth;
				 currentObj.textPistionX=currentObj.x+width-textWidth;
				 currentObj.textPistionY=currentObj.y+(height-textHeight)/2;
			 }else if(type==3){
				 currentObj.textPosition = "Middle_Center";
				 currentObj.textOffsetX=0;
				 currentObj.textPistionX=currentObj.x+(width-textWidth)/2;
				 currentObj.textPistionY=currentObj.y+(height-textHeight)/2;
			}
		}
		 
		
	}
	/**
	 * 清除画布
	 */
	function upClear(){
		canvasObj.cleanScene();
	}
	
	function upDelete(){
		var tempDelete=true;
		var  eles = document.getElementsByTagName("input");
		for(var i=0;i<eles.length;i++){
			if(eles[i]==document.activeElement){
				tempDelete=false;
			}
		}
		if(tempDelete){
			canvasObj.deleteObject();
		}
		
	}
	
	/**
	 * 放大场景
	 */
	function enlargeScene(){
		canvasObj.enlargeScene();
	}
	/**
	 * 缩小场景
	 */
	function narrowScene(){
		canvasObj.narrowScene();
	}
	/**
	 * 缩小比例
	 */
	function zoomIn(){
		var value=$("#zoomIn").val();
		canvasObj.zoomIn(value);
	}
	/**
	 * 字体发生改变
	 */
	function fontTypeChange(){
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].selected){
				currentNode=nodeArray[i];
				currentNode.fontType=$("#fontType").val();
				changeFont();
			}
		}
		
		
	}
	/**
	 * 字体大小发生改变
	 */
	function fontSizeChange(){
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].selected){
				currentNode=nodeArray[i];
				currentNode.fontSize=$("#fontSize").val();
				changeFont();
			}
		}
		
	}
	/**
	 *改变粗细
	 */
	function changeBold(){ 
		var parts = currentNode.font.split(" ");
		var bold="";
		for (i=0; i<parts.length; i++){
			if (parts[i].indexOf("bold")>=0){
				bold="bold";
			}
		}
		if(bold==""){
			currentNode.bold="bold";
			bold="bold";
		}else{
			currentNode.bold="";
			bold="";
		}
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].selected){
				currentNode=nodeArray[i];
				currentNode.bold=bold;
				changeFont();
			}
		}
		
		
	}
	
	function changeUnderline(){
		
	}
	/**
	 * 改变字体斜体
	 */
	function changeItalic(){
		var parts = currentNode.font.split(" ");
		var italic ="";
		for (i=0; i<parts.length; i++){
			if (parts[i].indexOf("italic")>=0){
				italic ="italic";
			}
		}
		if(italic==""){
			currentNode.italic="italic";
			italic="italic";
		}else{
			currentNode.italic="";
			italic="";
		}
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].selected){
				currentNode=nodeArray[i];
				currentNode.italic=italic;
				changeFont();
			}
		}
	}
	/**
	 * 更改字体
	 */
	function changeFont(){
		currentNode.font=currentNode.italic+" "+currentNode.bold+" "+currentNode.fontSize+"px "+currentNode.fontType;
	}
	/**
	 * 更改样式颜色
	 * @param pickColor
	 * @param type
	 */
	function setColor(pickColor){
		if((currentObj instanceof JTopo.Node)){
			for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].selected){
				currentObj=nodeArray[i];
				currentObj.fontColor=(""+pickColor.toString()).colorRgb();
			}
		}
		}else if(currentObj instanceof JTopo.Link){
			
			for(var i=0;i<linkArray.length;i++){
				if(linkArray[i].selected){
					currentObj=linkArray[i];
					currentObj.strokeColor=(""+pickColor.toString()).colorRgb();
				}
			}
			
			
			
		}
	}
	
	
	/**
	 * 改变字体颜色
	 */
	function changeFontColor(){
		currentNode.fontColor="";
	}
	/**
	 * 改变线体粗细
	 */
	function changeLineWidth(){
		for(var i=0;i<linkArray.length;i++){
			if(linkArray[i].selected){
				linkArray[i].lineWidth=$("#lineWidth").val();
			}
		}
		
	}
	/**
	 * 改变线体类型
	 */
	function changeLineType(){
		var temp=$("#lineType").val();
		for(var i=0;i<linkArray.length;i++){
			if(linkArray[i].selected){
				currentObj=linkArray[i];
				currentObj.lineType=temp;
				if(temp==1){
					currentObj.dashedPattern = null; // 虚线
				}else{
					currentObj.dashedPattern = 5; // 虚线
				}
			}
		}
		
		
	}
	/**
	 * 改变线体颜色
	 */
	function changeLineColor(){
		currentNode.strokeColor=$("#strokeColor").val();
	}
	/**
	 * 改变一维码码制
	 */
	function changeOneCode(){
		if((currentObj.code!=undefined)&&(currentObj.code=="one")){
			currentObj.barcode=$("#oneCode").val();
		}
	}
	/**
	 *改变二维码码值 
	 */
	function changeTwoCode(){
		if((currentObj.code!=undefined)&&(currentObj.code=="two")){
			currentObj.barcode=$("#twoCode").val();
			if($("#twoCode").val()=="QRCode"){
			currentObj.setImage("plf/page/mlabel/page/labelDesigner/img/ico-QRcode-big.png", false);
			currentObj.imgUrl="plf/page/mlabel/page/labelDesigner/img/ico-QRcode-big.png";
			}else{
			currentObj.setImage("plf/page/mlabel/page/labelDesigner/img/pdf_47.png", false);
			currentObj.imgUrl="plf/page/mlabel/page/labelDesigner/img/pdf_47.png";
			}
			
		}
	}
	/**
	 * 显示条形码
	 */
	function barShow(){
		if($('#barShow').is(':checked')) {
			currentObj.text=currentObj.fontText;
		}else{
			currentObj.text="";
		}
	}
	
	
	/**
	 * 更新条形码属性
	 */
	function updateBarcodeLable(){
		_switch('#a');
		var select = document.getElementById("fontTextSource"); //更新文字大小
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==currentObj.dataSource){  
		         select.options[i].selected = true;  
		         break;  
		     }  
		} 
		
		var select = document.getElementById("codeTextType"); //更新文字大小
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==currentObj.codeTextType){  
		         select.options[i].selected = true;  
		         break;  
		     }  
		} 
		
		if(currentObj.codeTextType==undefined||currentObj.codeTextType==""){
			select.options[0].selected = true;  
		}
		
		if(currentObj.codeTextType==1){
			$("#textSource").hide();
			$("#textSourceInfo").show();
		}else{
			$("#textSourceInfo").hide();
			$("#textSource").show();
		}
		
		if(currentObj.code=="one"){
			$("#oneCode").show();
			$("#twoCode").hide();
			$("#barTextShow").show();
			var select = document.getElementById("oneCode"); //选中工序类型
			for(var i=0; i<select.options.length;i++){
					 if(select.options[i].value ==currentObj.barcode){  
				         select.options[i].selected = true;  
				         break;  
				     }  
			}
			if(currentObj.text!=""){
				currentObj.barShow=1;
				$("#barShow").attr("checked",true);
			}else{
				currentObj.barShow=0;
				$("#barShow").attr("checked",false);
			}
			
		}else{
			$("#oneCode").hide();
			$("#twoCode").show();
			$("#barTextShow").hide();
			var select = document.getElementById("twoCode"); //选中工序类型
			for(var i=0; i<select.options.length;i++){
					 if(select.options[i].value ==currentObj.barcode){  
				         select.options[i].selected = true;  
				         break;  
				     }  
			} 
		}
		//设置条形码属性
		 var temp=currentObj.getBound();
		 $("#barWidth").val((temp.width/5).toFixed(2));
		 $("#barHeight").val((temp.height/5).toFixed(2));
		 $("#fontTextContant").val(currentObj.fontText);
		 $("#barType").val(currentObj.fontType);
		 $("#barFontSize").val(currentObj.fontSize);
		 $("#barXPosition").val(((currentObj.x-container.x)/5).toFixed(2));
		 $("#barYPosition").val(((currentObj.y-container.y)/5).toFixed(2));
		 
		 updateTopBar();
	}
	
	
	
	/**
	 * 更新文本模块
	 */
	function updateTextLable(){
		_switch('#b');
		
		if(currentObj.nodeType=="time"){
			$("#sourceBlock").hide();
			$("#timeInfo").show();
			updateTopBar();
			return false;
		}else{
			$("#sourceBlock").show();
			$("#timeInfo").hide();
		}
		
		if((currentObj.nodeType=="imgType")||(currentObj.nodeType=="rect")){
			$("#sourceBlock").hide();
			$("#timeInfo").hide();
			
		}
		
		 var temp=currentObj.getBound();
		 $("#textWidth").val((temp.width/5).toFixed(2));
		 $("#textHeight").val((temp.height/5).toFixed(2));
		 $("#textType").val(currentObj.fontType);
		 $("#textFontSize").val(currentObj.fontSize);
		 $("#textContant").val(currentObj.fontText);
		 $("#textXPosition").val(((currentObj.x-container.x)/5).toFixed(2));
		 $("#textYPosition").val(((currentObj.y-container.y)/5).toFixed(2));
		 if(currentObj.nodeType=="text"){
			 $("#textTextType").html("<option value='0'>普通文本</option>");
			 $("#textContantInfoNext").show();
			 $("#textContantInfo").hide();
		 }else if(currentObj.nodeType=="datatext"){
			 $("#textTextType").html("<option value='1'>数据文本</option>");
			 $("#textContantInfoNext").hide();
			 $("#textContantInfo").show();
				var select = document.getElementById("textContantInfoSource"); //更新文字大小
				for(var i=0; i<select.options.length;i++){
					 if(select.options[i].value ==currentObj.dataSource){  
				         select.options[i].selected = true;  
				         break;  
				     }  
				}
				currentObj.dataSource=$("#textContantInfoSource").val();
				var fontText=$("#textContantInfoSource").find("option:selected").attr("name");
				currentObj.fontText=fontText;
				//currentObj.text=fontText;
				// changeWrap();
				
		 }else if(currentObj.nodeType=="datatext"){
			 $("#textContantInfoNext").hide();
			 $("#textContantInfo").hide();
			 
			 
		 }
		 updateTopBar();
		
		 
		
		 
	}
	
	
	function changeTimeType(){
		timeType=$("#timeType").val();
		var time = new Date().format(timeType);
		currentObj.text=time;
		currentObj.fontText=time;
		currentObj.timeType=timeType;
	}
	
	/**
	 * 更新文本框域内容
	 */
	
	function updateTextObject(){
		if(textNodeArray.length==0){
			return false;
		}
		
		currentObj.text=$("#textContant").val();
		currentObj.fontText=$("#textContant").val();
		if(currentObj.textPosition=="Middle_Left"){
			textAlignContext(1);
		}else if(currentObj.textPosition=="Middle_Right"){
			textAlignContext(2);
		}else if(currentObj.textPosition=="Middle_Center"){
			textAlignContext(3);
		}
		changeWrap();
	}
	
	/**
	 * 更新换行功能
	 */
	
	function changeWrap(){
		if(currentObj.code!=undefined&&currentObj.code!=""){
			return false;
		}
		var nodeWidth=currentObj.getBound().width;
		var nodeHeight=currentObj.getBound().height;
		var textWidth=0;
		for(var i=0;i<textNodeArray.length;i++){
			textWidth=textWidth+textNodeArray[i].textWidth;
		}
		var textHeight=currentObj.textHeight;
		var value="";
		var nodeColumnWidth=0;
		var columnNumber=-1;
		var nodeTextHeight=textHeight;
		var textHeightTemp=true;
		var baseTextY=(nodeHeight-textHeight-8)/2;
		var valueFont="";
		currentObj.isWrap=false;
		currentObj.text=currentObj.fontText;
		if((textWidth>nodeWidth)&&(nodeHeight>2*textHeight)){
			currentObj.isWrap=true;
			for(var i=0;i<textNodeArray.length;i++){
				if(textNodeArray[i].text=="}"){
						if(columnNumber==-1){
						value+=valueFont+"&-"+nodeWidth/2+"&-"+baseTextY+"@";
						columnNumber=1;
						nodeColumnWidth=0;
						valueFont="";
					}else{
						nodeTextHeight=nodeTextHeight+textHeight+5;
						if(nodeTextHeight>nodeHeight){
							textHeightTemp=false;
							break;
						}
						value+=valueFont+"&-"+nodeWidth/2+"&"+(-baseTextY+columnNumber*(textHeight+5))+"@";
						columnNumber++;
						nodeColumnWidth=0;
						valueFont="";
					}
						continue;
				}
			
				valueFont+=textNodeArray[i].text;
				nodeColumnWidth+=textNodeArray[i].textWidth;
				if((nodeColumnWidth+textNodeArray[i].textWidth/1.2)>=nodeWidth){
					nodeColumnWidth=0;
					if(columnNumber==-1){
						value+=valueFont+"&-"+nodeWidth/2+"&-"+baseTextY+"@";
						columnNumber=1;
						nodeColumnWidth=0;
						valueFont="";
					}else{
						nodeTextHeight=nodeTextHeight+textHeight+5;
						if(nodeTextHeight>nodeHeight){
							textHeightTemp=false;
							break;
						}
						value+=valueFont+"&-"+nodeWidth/2+"&"+(-baseTextY+columnNumber*(textHeight+5))+"@";
						columnNumber++;
						nodeColumnWidth=0;
						valueFont="";
					}
					
				}
				
			}
			if((nodeColumnWidth<nodeWidth)&&textHeightTemp){
				nodeTextHeight=nodeTextHeight+textHeight+5;
				if(nodeTextHeight<=nodeHeight){
					value+=valueFont+"&-"+nodeWidth/2+"&"+(-baseTextY+columnNumber*(textHeight+5))+"@";
				}
			}
			currentObj.text=value;
		}
		
		
	}
	
	
	
	/**
	 * 更新头部bar信息栏目
	 */
	function updateTopBar(){
		$("#fontSize").val(currentObj.fontSize);
		
		
		var select = document.getElementById("fontType"); //更新文字类型
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==currentObj.fontType){  
		         select.options[i].selected = true;  
		         break;  
		     }  
		} 
		
		var select = document.getElementById("lineWidth"); //更新线体框度
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==currentObj.lineWidth){  
		         select.options[i].selected = true;  
		         break;  
		     }  
		} 
		
		var select = document.getElementById("lineType"); //更新线体类型
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==currentObj.lineType){  
		         select.options[i].selected = true;  
		         break;  
		     }  
		}
		
		
		
		
	}
	/**
	 * 修改场景的颜色
	 * @param hex
	 */
	function changeSceneColor(hex){
		 container.fillColor=(""+hex.toString()).colorRgb();
	}
	/**
	 * 更改数据源选项
	 */
	function changeBarSourceType(){
		currentObj.codeTextType=$("#codeTextType").val();
		if($("#codeTextType").val()=="0"){
			$("#textSource").show();
			$("#textSourceInfo").hide();
		}else{
			$("#textSource").hide();
			$("#textSourceInfo").show();
			currentObj.dataSource=$("#fontTextSource").val();
		}
		var select = document.getElementById("fontTextSource"); //更新文字大小
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==currentObj.dataSource){  
		         select.options[i].selected = true;  
		         break;  
		     }  
		}
		currentObj.dataSource=$("#fontTextSource").val();
		var fontText=$("#fontTextSource").find("option:selected").attr("name");
		currentObj.fontText=fontText;
	
		if((currentObj.codeTextType!=0)&&(currentObj.code=="one")&&($('#barShow').is(':checked'))){
			currentObj.text=fontText;
		}
		
		
	}
	/**
	 * 更改条形码数据源
	 */
	function changeBarSource(){
		currentObj.dataSource=$("#fontTextSource").val();
		var fontText=$("#fontTextSource").find("option:selected").attr("name");
		currentObj.fontText=fontText;
		if((currentObj.code=="one")&&($('#barShow').is(':checked'))){
			currentObj.text=fontText;
		}
		
	}
	/**
	 * 更改数据文本项
	 */
	function changeTextSource(){
		currentObj.dataSource=$("#textContantInfoSource").val();
		var fontText=$("#textContantInfoSource").find("option:selected").attr("name");
		currentObj.fontText=fontText;
		currentObj.text=fontText;
		var select = document.getElementById("textContantInfoSource"); //更新文字大小
		for(var i=0; i<select.options.length;i++){
			 if(select.options[i].value ==currentObj.dataSource){  
		         select.options[i].selected = true;  
		         break;  		     
		     }  
		} 
		currentObj.dataSource=$("#textContantInfoSource").val();
		var fontText=$("#textContantInfoSource").find("option:selected").attr("name");
		currentObj.fontText=fontText;
		currentObj.text=fontText;
		addNodeText(fontText);
		
	}
	/**
	 * 居左
	 */
	function alignSide(type){
		var alignArray=new Array();
		var alignTemp;
		//选中节点
		for(var i=0;i<nodeArray.length;i++){
			if(	nodeArray[i].selected==true){
				alignArray.push(nodeArray[i]);
				
			}
		}
		//没有选中直接返回
		if(alignArray.length==0){
			return false;
		}
		
		alignTemp=alignArray[0];
		
			/*var rightOne=alignTemp.x+alignTemp.getBound().width;
			var rightTwo=alignArray[i].x+alignArray[i].getBound().width;
			if(rightOne<rightTwo){
				alignTemp=alignArray[i];
			}*/
		
		//左对齐情况
		if(type==1){
			for(var i=0;i<alignArray.length;i++){
					alignArray[i].x=alignObject.x;
			}
		}else if(type==2){
			for(var i=0;i<alignArray.length;i++){
				alignArray[i].x=alignObject.x+alignObject.getBound().width-alignArray[i].getBound().width;
			}
			//上对齐情况
		}else if(type==3){
			for(var i=0;i<alignArray.length;i++ ){
				alignArray[i].y=alignObject.y;
			}
			
			//下对齐
		}else if(type==4){
			for(var i=0;i<alignArray.length;i++ ){
				alignArray[i].y=alignObject.y+alignObject.getBound().height-alignArray[i].getBound().height;
			}
		}
		
		
	}
	
	/**
	 * 验证是否第一个被选中
	 */
	function validateFirstSelect(){
		var count=0;
		var tempNode;
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].selected){
				tempNode=nodeArray[i];
				count++;
			}
		}
		if(count==1){
			alignObject=tempNode;
		}
	}
	
	/**
	 * 设置模型的尺寸
	 */
	function changeObjectSize(objWidth,objHeight){
		for(var i=0;i<nodeArray.length;i++){
			if((nodeArray[i].selected)){
				nodeArray[i].setSize(objWidth,objHeight);
			}
		}
		
		//changeWrap();
	}
	
	/**
	 * 设置线体的长度
	 */
	function changeLineLength(lineLength){
		/*var nodeA=currentObj.nodeA;
		var nodeZ=currentObj.nodeZ;
		nodeZ.x=nodeA.x+100;*/
		if(currentObj.directionType=="vertical"){
			var nodeA=currentObj.nodeA;
			var nodeZ=currentObj.nodeZ;
			if(nodeA.y>nodeZ.y){
				nodeA.y=nodeZ.y+lineLength*5;
			}else{
				nodeZ.y=nodeA.y+lineLength*5;
			}
			
		}else if(currentObj.directionType=="horizontal"){
			var nodeA=currentObj.nodeA;
			var nodeZ=currentObj.nodeZ;
			if(nodeA.x>nodeZ.x){
				nodeA.x=nodeZ.x+lineLength*5;
			}else{
				nodeZ.x=nodeA.x+lineLength*5;
			}
			
		}else {
			
		}
	}
	
	/**
	 * 验证第一被选中
	 */
	function validateFistSelected(){
		var selectArray=new Array();
		for(var i=0;i<nodeArray.length;i++){
			if(	nodeArray[i].selected==true){
				selectArray.push(nodeArray[i]);
				
			}
		}
		if(selectArray.length==1){
			firstSelected=selectArray[0];
		}
	}
	/**
	 * 居中
	 */
	function centerSide(){
		
	}
	/**
	 * 居右
	 */
	function rightSide(){
		
	}
	/**
	 * 添加复制数据
	 */
	function addCopyData(){
		if(currentObj==null){
			return false;
		}
		if(currentObj instanceof JTopo.Node){
			copyObject={
					type:"node",
					text:currentObj.text,
					imgUrl:currentObj.imgUrl,
					uuid:generateUUid(),
					font:currentObj.font,
					fontColor:currentObj.fontColor,
					nodeType:currentObj.nodeType,
					width:currentObj.width,
					height:currentObj.height,
					fontText:currentObj.fontText,
					dataSource:currentObj.dataSource,
					bold:currentObj.bold,
					italic:currentObj.italic,
					fontType:currentObj.fontType,
					fontSize:currentObj.fontSize,
					textPosition:currentObj.textPosition,
					textOffsetX:currentObj.textOffsetX,
					barcode:currentObj.barcode,
					code:currentObj.code,
					textPistionX:currentObj.textPistionX,
					textPistionY:currentObj.textPistionY,
					codeTextType:currentObj.codeTextType
			}
		}else if(currentObj instanceof JTopo.Link){
			var nodeAJson={
					uuid:"",
					x:currentObj.nodeA.x,
					y:currentObj.nodeA.y,
					nodeType:"middle",
					directionType:currentObj.nodeA.directionType,
					brotherId:""
					
			};
			var nodeZJson={
					uuid:"",
					x:currentObj.nodeZ.x,
					y:currentObj.nodeZ.y,
					nodeType:"middle",
					directionType:currentObj.nodeA.directionType,
					brotherId:""
			};
			var lineJson={
					lineWidth:currentObj.lineWidth,
					strokeColor:currentObj.strokeColor,
					uuid:"",
					directionType:currentObj.directionType,
					lineType:currentObj.lineType,
			};
			copyObject={
					type:"line",
					nodeAJson:nodeAJson,
					nodeZJson:nodeZJson,
					lineJson:lineJson
			}
		}
	}
	
	
	/**
	 * 复制内容
	 */
	function copyObjectNext(){
		if(copyObject==null){
			return false;
		}
		if(copyObject.type=="node"){
			var nodeJson={
					text:copyObject.text,
					imgUrl:copyObject.imgUrl,
					x:mousedownTempX,
					y:mousedownTempY,
					uuid:generateUUid(),
					font:copyObject.font,
					fontColor:copyObject.fontColor,
					nodeType:copyObject.nodeType,
					width:copyObject.width,
					height:copyObject.height,
					fontText:copyObject.fontText,
					dataSource:copyObject.dataSource,
					bold:copyObject.bold,
					italic:copyObject.italic,
					fontType:copyObject.fontType,
					fontSize:copyObject.fontSize,
					textPosition:copyObject.textPosition,
					textOffsetX:copyObject.textOffsetX,
					barcode:copyObject.barcode,
					code:copyObject.code,
					textPistionX:copyObject.textPistionX,
					textPistionY:copyObject.textPistionY,
					codeTextType:copyObject.codeTextType
					
			};
			canvasObj.addNodeByJson(nodeJson);
			ctrlVtemp=false;
		}else if(copyObject.type=="line"){
			var addX=copyObject.nodeAJson.x-copyObject.nodeZJson.x;
			var addY=copyObject.nodeAJson.y-copyObject.nodeZJson.y;
			var beginX;
			var beginY;
			var endX;
			var endY;
			if(copyObject.nodeAJson.x<copyObject.nodeZJson.x){
				beginX=copyObject.nodeAJson.x;
				endX=copyObject.nodeZJson.x;
			}else{
				beginX=copyObject.nodeZJson.x;
				endX=copyObject.nodeAJson.x;
			}
			
			if(copyObject.nodeAJson.y<copyObject.nodeZJson.y){
				beginY=copyObject.nodeAJson.y;
				endY=copyObject.nodeZJson.y;
			}else{
				beginY=copyObject.nodeZJson.y;
				endY=copyObject.nodeAJson.y;
			}
			
			var nodeAJson={
					uuid:generateUUid(),
					x:mousedownTempX,
					y:mousedownTempY,
					nodeType:"middle",
					directionType:copyObject.nodeAJson.directionType,
					brotherId:""
					
			};
			var nodeZJson={
					uuid:generateUUid(),
					x:mousedownTempX+addX,
					y:mousedownTempY+addY,
					nodeType:"middle",
					directionType:copyObject.nodeAJson.directionType,
					brotherId:""
			};
			nodeAJson.brotherId=nodeZJson.uuid;
			nodeZJson.brotherId=nodeAJson.uuid;
			
			if((nodeAJson.directionType=="vertical")&&(beginY<mousedownTempY)&&(mousedownTempY<endY)){
				nodeAJson.y=beginY;
				nodeZJson.y=endY;
			}
			
			if((nodeAJson.directionType=="horizontal")&&(beginX<mousedownTempX)&&(mousedownTempX<endX)){
				nodeAJson.x=beginX;
				nodeZJson.x=endX;
			}
			
			var lineJson={
					lineWidth:copyObject.lineJson.lineWidth,
					strokeColor:copyObject.lineJson.strokeColor,
					uuid:generateUUid(),
					directionType:copyObject.lineJson.directionType,
					lineType:copyObject.lineJson.lineType,
			};
			var nodeA=canvasObj.addMiddleNodeByJson(nodeAJson);
			var nodeZ = canvasObj.addMiddleNodeByJson(nodeZJson);
			nodeA.lineUUid=lineJson.uuid;
			nodeZ.lineUUid=lineJson.uuid;
			var linkL = canvasObj.addLineByJson(nodeA,nodeZ,lineJson);
		}
		
		
	}
	
	/**
	 * 操作键盘上按键
	 */
	function keyControl(keyCode){
		var countNum=0;
		for(var i=0;i<nodeArray.length;i++){
			if((nodeArray[i].selected)&&(nodeArray[i].nodeType!="middle")){
				currentObj=nodeArray[i];
				if(keyCode==37){
					currentObj.x=currentObj.x-1;
				}else if(keyCode==38){
					currentObj.y=currentObj.y-1;
				}else if(keyCode==39){
					currentObj.x=currentObj.x+1;
				}else if(keyCode==40){
					currentObj.y=currentObj.y+1;
				}
				countNum++;
			}else if((nodeArray[i].selected)&&(nodeArray[i].nodeType=="middle")){
				var brotherNode=nodeArray[i].brotherId;
    			brotherNode=selectNodeByUuidFisrt(brotherNode);
    			if(brotherNode.selected){
    				var lineTemp=canvasObj.selectLineByUuid(brotherNode.lineUUid);
    				lineTemp.selected=true;
    			}
    			nodeArray[i].selected=false;
    			brotherNode.selected=false;
			}
		}
			
				showObjectParams(currentObj);
			
		
			for(var i=0;i<linkArray.length;i++){
				if(linkArray[i].selected){
					currentObj=linkArray[i];
					if(keyCode==37){
						currentObj.nodeA.x=currentObj.nodeA.x-1;
						currentObj.nodeZ.x=currentObj.nodeZ.x-1;
					}else if(keyCode==38){
						currentObj.nodeA.y=currentObj.nodeA.y-1;
						currentObj.nodeZ.y=currentObj.nodeZ.y-1;
					}else if(keyCode==39){
						currentObj.nodeA.x=currentObj.nodeA.x+1;
						currentObj.nodeZ.x=currentObj.nodeZ.x+1;
					}else if(keyCode==40){
						currentObj.nodeA.y=currentObj.nodeA.y+1;
						currentObj.nodeZ.y=currentObj.nodeZ.y+1;
					}
				}
			}
			
		
	}
	
	/**
	 * 添加全选线体
	 */
	function addMiddleLineSelect(){
		
	}
	
	/**
	 * 添加线体节点
	 */
	function addLineNode(){
		var nodeA=currentObj.nodeA;
		var nodeZ=currentObj.nodeZ;
		var temp=nodeA.getBound();
		var width=temp.width;
		if(width==1){
			nodeA.setSize(7,7);
			nodeZ.setSize(7,7);
			nodeA.x=nodeA.x-3;
			nodeZ.x=nodeZ.x-3;
			nodeA.y=nodeA.y-3;
			nodeZ.y=nodeZ.y-3;
		}
		
	}
	/**
	 * 移除线条头尾节点
	 */
	function removeLineNode(){
		for(var i=0;i<linkArray.length;i++){
			var nodeA=linkArray[i].nodeA;
			var nodeZ=linkArray[i].nodeZ;
			var temp=nodeA.getBound();
			var width=temp.width;
			linkArray[i].selected=false;
			if(width==7){
				nodeA.setSize(1,1);
				nodeZ.setSize(1,1);
				nodeA.x=nodeA.x+3;
				nodeZ.x=nodeZ.x+3;
				nodeA.y=nodeA.y+3;
				nodeZ.y=nodeZ.y+3;
			}
		}
	}
	
	/**
	 * 查询后台数据
	 */
	function queryDataLable(){
		/*util.showTopLoading();*/
		
		$.ajax({
		            url : "buss/bussModel_exeFunc.ms?funcMId=d1d55cc336e745ef983d55214fa289a2",
		            data : {
		              'type' : 'queryDataItem',
		              'templateId' : $("#dataId").val()
		            },
		            type : "post",
		            dataType : "json",
		            success : function(data) { 
		            	
		            	var html="";
		            	var sourceHtml="<option value=''>请选择</option>";
		            	for(var i=0;i<data.length;i++){
		            		if(data[i].TYPE=="PICTURE_FLAG"){
		            			var picArray=data[i].PICTURE_NAME_S.split(".");
		            			if(picArray.length>0){
		            				picArray=picArray[0];
		            			}else{
		            				picArray="";
		            			}
		            			html+=" <li class='_Dcode'>"+
		            				"<img src='"+data[i].TEST_DATA+"' name='"+data[i].TEST_DATA+"'  draggable='true' ondragstart='drag(event)' title='imgType' class='ico '>"+
		            				"<span class='text content-img'>"+picArray+"</span>"+
		            				"</li>";
		            		}else{
		            			sourceHtml+="<option value='"+data[i].DATA_ITEMS_NAME+"' name='"+data[i].TEST_DATA+"'>"+data[i].DATA_ITEMS_NAME+"</option>";
		            		}
		            		
		            	}
		            	$("#ulContent").append(html);
		            	$("#textContantInfoSource").html(sourceHtml);
		            	$("#fontTextSource").html(sourceHtml);
		             /* util.closeLoading();*/
		              
		            },
		            error : function(msg) {
		              util.closeLoading();
		              utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
		                  0, "300", "");
		            }
		          });
	}
	/**
	 * 保存数据到后台
	 */
	function saveObjectInfo(){
		var objectData=saveNodeInfo();
		var labelJson=addLableNodeInfo();
		objectData.noSourceArray=labelJson.noSourceArray;
		objectData.sourceArray=labelJson.sourceArray;
		var objectDataString=JSON.stringify(objectData);
		
		$.ajax({
            url : "buss/bussModel_exeFunc.ms?funcMId=d1d55cc336e745ef983d55214fa289a2",
            data : {
              'type' : 'saveLabelDesigner',
              'templateId' : $("#dataId").val(),
              'labelCss':objectDataString,
              "labelLength":objectData.page.lableWidth,
              "labelWidth":objectData.page.lableHeight,
              "sizeUnit":"mm"
            },
            type : "post",
            dataType : "json",
            success : function(data) { 
            	if (data.ajaxMap != null) {
					msgPop(data.ajaxMap.alertMsg, '',
							data.ajaxMap.title, data.ajaxMap.width,
							data.ajaxMap.height, data.ajaxMap.time);
				}
            	//alert("保存成功");
              
            },
            error : function(msg) {
              util.closeLoading();
              utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
                  0, "300", "");
            }
          });
	}
	
	
	
	/**
	 * 改变纸张大小
	 */
	function changePageSize(){
		var lableWidth=$("#lableWidth").val()*5;
		var lableHeight=$("#lableHeight").val()*5;
		var viewCanvas = document.getElementById("canvas");
		var canvasHeight ; //高度
		var canvasWidth; //宽度
		canvasWidth=800;
		canvasHeight=450;
	
		var x=(canvasWidth-lableWidth)/2;
		var y=(canvasHeight-lableHeight)/2;
		container.setSize(lableWidth,lableHeight);
		container.x=x;
		container.y=y;
	}
	
	/**
	 * 加载后台的数据
	 */
	function showObjectInfo(temp){
		upClear();
		if(temp==""||temp==undefined){
			return false;
		}
		var reg = new RegExp( 'amp;' , "g" );
		temp = temp.replace( reg , '' );
		var labelData= JSON.parse(temp);
		var nodeObject=labelData.node;
		var lineObject=labelData.line;
		var pageInfo=labelData.page;
		
		var containerX=labelData.containerX;
		var containerY=labelData.containerY;
		paperWidth=pageInfo.paperWidth;
		paperHeight=pageInfo.paperHeight;
		var paddingLeft=0;
		var paddingTop=0;
		if(paperWidth*5>400){
			var scaleX=400/(parseInt(paperWidth)*5);
			scene.scaleX=scaleX;
    		scene.scaleY=scaleX;
			
		}else{
			paddingLeft=(400-paperWidth*5)/2;
			paddingTop=(250-paperHeight*5)/2;
			scene.scaleX=1;
    		scene.scaleY=1;
		}
		
		containerX=containerX-paddingLeft;
		containerY=containerY-paddingTop;
		spaceNum=pageInfo.spaceNum;
		lableWidth=pageInfo.lableWidth;
		lableHeight=pageInfo.lableHeight;
		spaceVal=pageInfo.spaceVal;
		if(pageInfo.topValue!=undefined){
			topValueNext=parseInt(pageInfo.topValue);
		}
		if(pageInfo.columnNumValue!=undefined){
			columnNumValueNext=parseInt(pageInfo.columnNumValue);
		}
		if(pageInfo.spaceValNext!=undefined){
			spaceValNextNext=parseInt(pageInfo.spaceValNext);
		}
		if(pageInfo.leftValue!=undefined){
			leftValueNext=parseInt(pageInfo.leftValue);
		}
		if(labelData.modelType!=undefined){
			modelType=labelData.modelType;
		}
		
		
		var nodeTemp;
		var baseX=containerX;
		var baseY=containerY;
		var divWidth=paperHeight*5;
		document.getElementById("canvas").height =250;
		document.getElementById("canvas").width =400;
		var canvasDiv=document.getElementById("canvasDiv");
		container.setSize(lableWidth*5,lableHeight*5);
		canvasDiv.style.height=300+"px";
		container.x=paddingLeft;
		container.y=paddingTop;
    	//加载节点
		for(var i=0;i<nodeObject.length;i++){
			nodeTemp=nodeObject[i];
			var nodeJson={
					text:nodeTemp.text,
					imgUrl:nodeTemp.imgUrl,
					x:parseInt(nodeTemp.x)-baseX,
					y:parseInt(nodeTemp.y)-baseY,
					uuid:nodeTemp.uuid,
					font:nodeTemp.font,
					fontColor:nodeTemp.fontColor,
					nodeType:nodeTemp.nodeType,
					width:nodeTemp.width,
					height:nodeTemp.height,
					fontText:nodeTemp.fontText,
					dataSource:nodeTemp.dataSource,
					bold:nodeTemp.bold,
					italic:nodeTemp.italic,
					fontType:nodeTemp.fontType,
					fontSize:nodeTemp.fontSize,
					textPosition:nodeTemp.textPosition,
					textOffsetX:nodeTemp.textOffsetX,
					barcode:nodeTemp.barcode,
					code:nodeTemp.code,
					textPistionX:nodeTemp.textPistionX,
					textPistionY:nodeTemp.textPistionY,
					codeTextType:nodeObject[i].codeTextType,
					directionType:nodeObject[i].directionType,
					brotherId:nodeObject[i].brotherId,
					isWrap:nodeObject[i].isWrap
			};
			canvasObj.addNodeByJson(nodeJson);
		}
		//加载线体
		for(var i=0;i<lineObject.length;i++){
			var temp=selectNodeByUUid(lineObject[i].nodeAUuid,lineObject[i].nodeZUuid);
			var lineJson={
					lineWidth:lineObject[i].lineWidth,
					strokeColor:lineObject[i].strokeColor,
					uuid:lineObject[i].uuid,
					directionType:lineObject[i].directionType,
					lineType:lineObject[i].lineType
			};
			if(lineJson.uuid==undefined){
				lineJson.uuid=generateUUid();
			}
			if(temp.nodeA!=undefined&&temp.nodeZ!=undefined){
				temp.nodeA.lineUUid=lineJson.uuid;
				temp.nodeZ.lineUUid=lineJson.uuid;
				var linkL = canvasObj.addLineByJson(temp.nodeA,temp.nodeZ,lineJson);
			}
			
			
		}
		
	}
	
	/**
	 * 打印预览
	 */
	function printPreview(){
		ieBrowser=isIeBrowser();
		if(ieBrowser.result==false){
			utilsFp.confirmIcon(3,"","","", ieBrowser.msg,0,"260","");
			return false;
		}
		var resultTemp=CheckIsInstall();
		if(resultTemp.result==false){
			window.open(resultTemp.url,"_self");
		}
		if(resultTemp.result==false){
			return false;
		}
		
		
		
		var pageInfo=saveNodeInfo();
		
		
		var x=container.x;
		var y=container.y;
		var baseXValue=(spaceVal/2)*5;//纸张左边距
		var baseYValueNext=0;
		var page=pageInfo.page;
		var spaceVal=page.spaceVal;
		var columnNumValue=1;
		var spaceValNext=0;
		
		if(topValueNext!=undefined){
			baseYValueNext=parseInt(topValueNext);
		}
		if(columnNumValueNext!=undefined){
			columnNumValue=parseInt(columnNumValueNext);
		}
		if(spaceValNextNext!=undefined){
			spaceValNext=parseInt(spaceValNextNext);
		}
		if(columnNumValue==1){
			baseXValue=0;
		}
		if(leftValueNext!=undefined){
			baseXValue+=leftValueNext*5;
		}
		LODOP=getLodop(document.getElementById('LODOP1'),document.getElementById('LODOP_EM1'));
		LODOP.SET_PRINT_PAGESIZE(1,paperWidth+"mm",paperHeight+"mm");
		if(modelType!=undefined&&modelType==1){
			for(var k=0;k<columnNumValue;k++){
				baseYValue=baseYValueNext+k*(spaceValNext+parseInt(page.lableHeight));
				for(var i=0;i<spaceNum;i++){
					CreatePrintPageTwoVesion(baseXValue,parseFloat(lableWidth)+parseFloat(spaceVal),lableHeight,i,pageInfo,x,y,baseYValue);
					printLineTwoVesion(baseXValue,parseFloat(lableWidth)+parseFloat(spaceVal),lableHeight,i,pageInfo,x,y,baseYValue);
				}
			}
			
		}else{
			for(var k=0;k<columnNumValue;k++){
				baseYValue=baseYValueNext+k*(spaceValNext+parseInt(page.lableHeight));
				for(var i=0;i<spaceNum;i++){
				CreatePrintPage(baseXValue,parseFloat(lableWidth)+parseFloat(spaceVal),lableHeight,i,pageInfo,x,y,baseYValue);
				printLine(baseXValue,parseFloat(lableWidth)+parseFloat(spaceVal),lableHeight,i,pageInfo,x,y,baseYValue);
				}
			}
			
		}
		LODOP.PRINT();
		
		
		
		/*removeTextNode();
		textAlignDetail();
		LODOP=getLodop(document.getElementById('LODOP1'),document.getElementById('LODOP_EM1'));
		LODOP.SET_PRINT_PAGESIZE(1,paperWidth+"mm",paperHeight+"mm");
		var pageInfo=saveNodeInfo();
		var x=container.x;
		var y=container.y;
		var baseXValue=(spaceVal/2)*5;//纸张左边距
		for(var i=0;i<spaceNum;i++){
			CreatePrintPage(baseXValue,parseFloat(lableWidth)+parseFloat(spaceVal),lableHeight,i,pageInfo,x,y);
			printLine(baseXValue,parseFloat(lableWidth)+parseFloat(spaceVal),lableHeight,i,pageInfo,x,y);
		}
		LODOP.PRINT();*/
		
	}
	
	function CreatePrintPage(baseXValue,lableWidth,lableHeight,num,pageInfo,x,y,baseYValue) {
		ieBrowser=isIeBrowser();
		if(ieBrowser.result==false){
			alert(ieBrowser.msg);
			return false;
		}
		if(baseYValue==undefined){
			baseYValue=0;
		}
		var nodeTempArray=pageInfo.node;
		for(var i=0;i<nodeTempArray.length;i++){
			var nodeX=(baseXValue+nodeTempArray[i].x-x+(lableWidth*num*5))/5+"mm";
			var nodeY=(nodeTempArray[i].y-y)/5+baseYValue+"mm";
			var nodeWidth=nodeTempArray[i].width/5+"mm";
			var nodeHeight=nodeTempArray[i].height/5+"mm";
			var fontColor=colorRGB2Hex("("+nodeTempArray[i].fontColor+")");
			LODOP.SET_PRINT_STYLE("FontColor",fontColor);
			if(nodeTempArray[i].nodeType=="rect"){
				LODOP.ADD_PRINT_RECT(nodeY,nodeX,nodeWidth,nodeHeight,0,1);
				if(nodeTempArray[i].bold!=""){
					LODOP.SET_PRINT_STYLEA(0,"Bold",1);
				}
				if(nodeTempArray[i].italic!=""){
					LODOP.SET_PRINT_STYLEA(0,"Italic",1);
				}
			}
			
			if((nodeTempArray[i].nodeType=="text")){
				nodeWidth=(nodeTempArray[i].width/5)*1.3+"mm";
				nodeHeight=(nodeTempArray[i].height/5)*1.3+"mm";
				nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5)/5+"mm";
				nodeY=(-y+nodeTempArray[i].textPistionY+5)/5+baseYValue+"mm";
				var nodeHeightN=(nodeTempArray[i].height/5)*1.3;
				if((nodeTempArray[i].isWrap!=undefined)&&(nodeTempArray[i].isWrap==true)){
					nodeHeightN=nodeTempArray[i].height/4;
					nodeY=(-y+nodeTempArray[i].y-0)/5+baseYValue+"mm";
					nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
				}
				if(nodeTempArray[i].textPosition=="Middle_Right"){
					var releaseX=nodeTempArray[i].width-nodeTempArray[i].width*1.3;
					nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5+releaseX)/5+"mm";
				}
				LODOP.ADD_PRINT_TEXT(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].fontText);
				//LODOP.SET_PRINT_STYLEA(2,"FontName",nodeTempArray[i].fontType*0.57); 
				
				if(nodeTempArray[i].bold!=""){
					LODOP.SET_PRINT_STYLEA(0,"Bold",1);
				}
				if(nodeTempArray[i].italic!=""){
					LODOP.SET_PRINT_STYLEA(0,"Italic",1);
				}
				if(nodeTempArray[i].textPosition=="Middle_Left"){
					LODOP.SET_PRINT_STYLEA(0,"Alignment",1);
				}else if(nodeTempArray[i].textPosition=="Middle_Center"){
					LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
				}else if(nodeTempArray[i].textPosition=="Middle_Right"){
					LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
				}
				if((nodeTempArray[i].isWrap!=undefined)&&(nodeTempArray[i].isWrap==true)){
					LODOP.SET_PRINT_STYLEA(0,"Alignment",1);
				}
				LODOP.SET_PRINT_STYLEA(0,"FontName",nodeTempArray[i].fontType);
				/*nodeX=(-x+nodeTempArray[i].textPistionX+lableWidth*num*5)/5+"mm";
				nodeY=(-y+nodeTempArray[i].textPistionY)/5+baseYValue+"mm";
				LODOP.ADD_PRINT_TEXT(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].fontText);
				LODOP.SET_PRINT_STYLEA(2,"FontName",nodeTempArray[i].fontType); 
				LODOP.SET_PRINT_STYLEA(2,"FontSize",nodeTempArray[i].fontSize*0.65); 
				
				
				if(nodeTempArray[i].bold!=""){
					LODOP.SET_PRINT_STYLEA(0,"Bold",1);
				}
				if(nodeTempArray[i].italic!=""){
					LODOP.SET_PRINT_STYLEA(0,"Italic",1);
				}*/
			}else if((nodeTempArray[i].nodeType=="time")){
				nodeWidth=(nodeTempArray[i].width/5)*1.3+"mm";
				nodeHeight=(nodeTempArray[i].height/5)+"mm";
				nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5)/5+"mm";
				nodeY=(-y+nodeTempArray[i].textPistionY+5)/5+baseYValue+"mm";
				var nodeHeightN=(nodeTempArray[i].height/5)*1.3;
				if((nodeTempArray[i].isWrap!=undefined)&&(nodeTempArray[i].isWrap==true)){
					nodeHeightN=nodeTempArray[i].height/4;
					nodeY=(-y+nodeTempArray[i].y-0)/5+baseYValue+"mm";
					nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
				}
				LODOP.ADD_PRINT_TEXT(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].fontText);
				//LODOP.SET_PRINT_STYLEA(2,"FontName",nodeTempArray[i].fontType); 
				
				if(nodeTempArray[i].bold!=""){
					LODOP.SET_PRINT_STYLEA(0,"Bold",1);
				}
				if(nodeTempArray[i].italic!=""){
					LODOP.SET_PRINT_STYLEA(0,"Italic",1);
				}
				
				LODOP.SET_PRINT_STYLEA(0,"FontName",nodeTempArray[i].fontType);
			}
			if(nodeTempArray[i].nodeType=="datatext"){
				nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5)/5+"mm";
				nodeY=(-y+nodeTempArray[i].textPistionY+5)/5+baseYValue+"mm";
				nodeWidth=(nodeTempArray[i].width/5)*1.3+"mm";
				if(nodeTempArray[i].textPosition=="Middle_Right"){
					var releaseX=nodeTempArray[i].width-nodeTempArray[i].width*1.3;
					nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5+releaseX)/5+"mm";
				}
				var nodeHeightN=(nodeTempArray[i].height/5)*1.3;
				if((nodeTempArray[i].isWrap!=undefined)&&(nodeTempArray[i].isWrap==true)){
					nodeHeightN=nodeTempArray[i].height/4;
					nodeY=(-y+nodeTempArray[i].y-0)/5+baseYValue+"mm";
					nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
				}
				LODOP.ADD_PRINT_TEXT(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].fontText);
				
				if(nodeTempArray[i].textPosition=="Middle_Left"){
					LODOP.SET_PRINT_STYLEA(0,"Alignment",1);
				}else if(nodeTempArray[i].textPosition=="Middle_Center"){
					LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
				}else if(nodeTempArray[i].textPosition=="Middle_Right"){
					LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
				}
				if((nodeTempArray[i].isWrap!=undefined)&&(nodeTempArray[i].isWrap==true)){
					LODOP.SET_PRINT_STYLEA(0,"Alignment",1);
				}
				LODOP.SET_PRINT_STYLEA(0,"FontName",nodeTempArray[i].fontType);
			}
			if(nodeTempArray[i].nodeType=="imgType"){
				nodeWidth=(nodeTempArray[i].width)*0.78;
				nodeHeight=(nodeTempArray[i].height)*0.8;
				var imgUrl=_GLO_PATH+nodeTempArray[i].imgUrl;
				LODOP.ADD_PRINT_IMAGE(nodeY,nodeX,nodeWidth,nodeHeight,"<img border='0' src='"+imgUrl+"' width='"+nodeWidth*0.95+"' height='"+nodeHeight*0.88+"'/>");
			}
			if(nodeTempArray[i].code=="one"){
				var nodeWidth=nodeTempArray[i].width*0.9+"px";
				var nodeHeight=nodeTempArray[i].height*0.9+"px";
				LODOP.ADD_PRINT_BARCODE(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].barcode,nodeTempArray[i].fontText);
				LODOP.SET_PRINT_STYLEA(0,"QRCodeVersion",5);
				if(nodeTempArray[i].text==""){
					LODOP.SET_PRINT_STYLEA(0,"ShowBarText",0);
				}
			}
			if(nodeTempArray[i].code=="two"){
				var nodeWidth=nodeTempArray[i].width;
				var nodeHeight=nodeTempArray[i].height;
				LODOP.ADD_PRINT_BARCODE(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].barcode,nodeTempArray[i].fontText);
				
			}
			if(nodeTempArray[i].nodeType!="middle"){
				LODOP.SET_PRINT_STYLEA(0,"FontSize",nodeTempArray[i].fontSize*0.55); 
				LODOP.SET_PRINT_STYLEA(0,"DataCharset","UTF-8");
			}
			LODOP.SET_PRINT_STYLEA(0,"TextNeatRow",true);
		}
		
	};
	
	function printLine(baseXValue,lableWidth,lableHeight,num,pageInfo,x,y,baseYValue){
		var linkTempArray=pageInfo.line;
		if(baseYValue==undefined){
			baseYValue=0;
		}
		for(var i=0;i<linkTempArray.length;i++){
			var strokeColor=colorRGB2Hex("("+linkTempArray[i].strokeColor+")");
			LODOP.SET_PRINT_STYLE("FontColor",strokeColor);
			var nodeAX=(baseXValue+linkTempArray[i].nodeAX-x+lableWidth*num*5)/5+"mm";
			var nodeZX=(baseXValue+linkTempArray[i].nodeZX-x+lableWidth*num*5)/5+"mm";
			var nodeAY=(linkTempArray[i].nodeAY-y)/5+baseYValue+"mm";
			var nodeZY=(linkTempArray[i].nodeZY-y)/5+baseYValue+"mm";
			if(linkTempArray[i].lineType==1){
				LODOP.ADD_PRINT_LINE(nodeAY,nodeAX,nodeZY,nodeZX,0,linkTempArray[i].lineWidth)
			}else{
				LODOP.ADD_PRINT_LINE(nodeAY,nodeAX,nodeZY,nodeZX,2,0);
			}
			
			//LODOP.ADD_PRINT_LINE(,1,linkTempArray[i].lineWidth);
			//LODOP.SET_PRINT_STYLEA(0,"FontSize",1); 
		}
		
	}
	
	 
    /**
     * 打印标签第二版本修改
     * 修改了打印位置，增对2018.8.14号以后新模板
     * Created by 黄志鹏 on 2018/08/13
     * version 1.0
     */

    	/**
    	 *打印模板
    	 */
    	function CreatePrintPageTwoVesion(baseXValue,lableWidth,lableHeight,num,pageInfo,x,y,baseYValue) {
    		ieBrowser=isIeBrowser();
    		if(ieBrowser.result==false){
    			alert(ieBrowser.msg);
    			return false;
    		}
    		if(baseYValue==undefined){
    			baseYValue=0;
    		}
    		var nodeTempArray=pageInfo.node;
    		for(var i=0;i<nodeTempArray.length;i++){
    			var nodeX=(baseXValue+nodeTempArray[i].x-x+(lableWidth*num*5))/5+"mm";
    			var nodeY=(nodeTempArray[i].y-y)/5+baseYValue+"mm";
    			var nodeWidth=nodeTempArray[i].width/5+"mm";
    			var nodeHeight=nodeTempArray[i].height/5+"mm";
    			var fontColor=colorRGB2Hex("("+nodeTempArray[i].fontColor+")");
    			LODOP.SET_PRINT_STYLE("FontColor",fontColor);
    			if(nodeTempArray[i].nodeType=="rect"){
    				LODOP.ADD_PRINT_RECT(nodeY,nodeX,nodeWidth,nodeHeight,0,1);
    				if(nodeTempArray[i].bold!=""){
    					LODOP.SET_PRINT_STYLEA(0,"Bold",1);
    				}
    				if(nodeTempArray[i].italic!=""){
    					LODOP.SET_PRINT_STYLEA(0,"Italic",1);
    				}
    			}
    			
    			if((nodeTempArray[i].nodeType=="text")){
    				nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
    				nodeHeight=(nodeTempArray[i].height/5)*1.1+"mm";
    				nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5)/5+"mm";
    				nodeY=(-y+nodeTempArray[i].textPistionY+5)/5+baseYValue+"mm";
    				var nodeHeightN=(nodeTempArray[i].height/5)*1.1;
    				if((nodeTempArray[i].isWrap!=undefined)&&(nodeTempArray[i].isWrap==true)){
    					nodeHeightN=nodeTempArray[i].height/4;
    					nodeY=(-y+nodeTempArray[i].y-0)/5+baseYValue+"mm";
    					nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
    				}
    				if(nodeTempArray[i].textPosition=="Middle_Right"){
    					var releaseX=nodeTempArray[i].width-nodeTempArray[i].width*1.1;
    					nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5+releaseX)/5+"mm";
    				}
    				LODOP.ADD_PRINT_TEXT(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].fontText);
    				//LODOP.SET_PRINT_STYLEA(2,"FontName",nodeTempArray[i].fontType*0.57); 
    				
    				if(nodeTempArray[i].bold!=""){
    					LODOP.SET_PRINT_STYLEA(0,"Bold",1);
    				}
    				if(nodeTempArray[i].italic!=""){
    					LODOP.SET_PRINT_STYLEA(0,"Italic",1);
    				}
    				if(nodeTempArray[i].textPosition=="Middle_Left"){
    					LODOP.SET_PRINT_STYLEA(0,"Alignment",1);
    				}else if(nodeTempArray[i].textPosition=="Middle_Center"){
    					LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
    				}else if(nodeTempArray[i].textPosition=="Middle_Right"){
    					LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
    				}
    				LODOP.SET_PRINT_STYLEA(0,"FontName",nodeTempArray[i].fontType);
    				/*nodeX=(-x+nodeTempArray[i].textPistionX+lableWidth*num*5)/5+"mm";
    				nodeY=(-y+nodeTempArray[i].textPistionY)/5+baseYValue+"mm";
    				LODOP.ADD_PRINT_TEXT(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].fontText);
    				LODOP.SET_PRINT_STYLEA(2,"FontName",nodeTempArray[i].fontType); 
    				LODOP.SET_PRINT_STYLEA(2,"FontSize",nodeTempArray[i].fontSize*0.65); 
    				
    				
    				if(nodeTempArray[i].bold!=""){
    					LODOP.SET_PRINT_STYLEA(0,"Bold",1);
    				}
    				if(nodeTempArray[i].italic!=""){
    					LODOP.SET_PRINT_STYLEA(0,"Italic",1);
    				}*/
    			}else if((nodeTempArray[i].nodeType=="time")){
    				nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
    				nodeHeight=(nodeTempArray[i].height/5)+"mm";
    				nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5)/5+"mm";
    				nodeY=(-y+nodeTempArray[i].textPistionY+5)/5+baseYValue+"mm";
    				var nodeHeightN=(nodeTempArray[i].height/5)*1.1;
    				if((nodeTempArray[i].isWrap!=undefined)&&(nodeTempArray[i].isWrap==true)){
    					nodeHeightN=nodeTempArray[i].height/4;
    					nodeY=(-y+nodeTempArray[i].y-0)/5+baseYValue+"mm";
    					nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
    				}
    				LODOP.ADD_PRINT_TEXT(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].fontText);
    				//LODOP.SET_PRINT_STYLEA(2,"FontName",nodeTempArray[i].fontType); 
    				
    				if(nodeTempArray[i].bold!=""){
    					LODOP.SET_PRINT_STYLEA(0,"Bold",1);
    				}
    				if(nodeTempArray[i].italic!=""){
    					LODOP.SET_PRINT_STYLEA(0,"Italic",1);
    				}
    				
    				LODOP.SET_PRINT_STYLEA(0,"FontName",nodeTempArray[i].fontType);
    			}
    			if(nodeTempArray[i].nodeType=="datatext"){
    				nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5)/5+"mm";
    				nodeY=(-y+nodeTempArray[i].textPistionY+5)/5+baseYValue+"mm";
    				nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
    				if(nodeTempArray[i].textPosition=="Middle_Right"){
    					var releaseX=nodeTempArray[i].width-nodeTempArray[i].width*1.05;
    					nodeX=(baseXValue-x+nodeTempArray[i].x+lableWidth*num*5+releaseX)/5+"mm";
    				}
    				var nodeHeightN=(nodeTempArray[i].height/5)*1.1;
    				if((nodeTempArray[i].isWrap!=undefined)&&(nodeTempArray[i].isWrap==true)){
    					nodeHeightN=nodeTempArray[i].height/4;
    					nodeY=(-y+nodeTempArray[i].y-0)/5+baseYValue+"mm";
    					nodeWidth=(nodeTempArray[i].width/5)*1.1+"mm";
    				}
    				LODOP.ADD_PRINT_TEXT(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].fontText);
    				
    				if(nodeTempArray[i].textPosition=="Middle_Left"){
    					LODOP.SET_PRINT_STYLEA(0,"Alignment",1);
    				}else if(nodeTempArray[i].textPosition=="Middle_Center"){
    					LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
    				}else if(nodeTempArray[i].textPosition=="Middle_Right"){
    					LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
    				}
    				
    				LODOP.SET_PRINT_STYLEA(0,"FontName",nodeTempArray[i].fontType);
    			}
    			if(nodeTempArray[i].nodeType=="imgType"){
    				nodeWidth=(nodeTempArray[i].width)*0.78;
    				nodeHeight=(nodeTempArray[i].height)*0.8;
    				var imgUrl=_GLO_PATH+nodeTempArray[i].imgUrl;
    				LODOP.ADD_PRINT_IMAGE(nodeY,nodeX,nodeWidth,nodeHeight,"<img border='0' src='"+imgUrl+"' width='"+nodeWidth*0.95+"' height='"+nodeHeight*0.88+"'/>");
    			}
    			if(nodeTempArray[i].code=="one"){
    				var nodeWidth=nodeTempArray[i].width*0.9+"px";
    				var nodeHeight=nodeTempArray[i].height*0.9+"px";
    				LODOP.ADD_PRINT_BARCODE(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].barcode,nodeTempArray[i].fontText);
    				LODOP.SET_PRINT_STYLEA(0,"QRCodeVersion",5);
    				if(nodeTempArray[i].text==""){
    					LODOP.SET_PRINT_STYLEA(0,"ShowBarText",0);
    				}
    			}
    			if(nodeTempArray[i].code=="two"){
    				var nodeWidth=nodeTempArray[i].width;
    				var nodeHeight=nodeTempArray[i].height;
    				LODOP.ADD_PRINT_BARCODE(nodeY,nodeX,nodeWidth,nodeHeight,nodeTempArray[i].barcode,nodeTempArray[i].fontText);
    				
    			}
    			if(nodeTempArray[i].nodeType!="middle"){
    				LODOP.SET_PRINT_STYLEA(0,"FontSize",nodeTempArray[i].fontSize*0.55); 
    				LODOP.SET_PRINT_STYLEA(0,"DataCharset","UTF-8");
    			}
    			LODOP.SET_PRINT_STYLEA(0,"TextNeatRow",true);
    		}
    		
    	};
    	/**
    	 * 打印线条
    	 * @param baseXValue
    	 * @param lableWidth
    	 * @param lableHeight
    	 * @param num
    	 * @param pageInfo
    	 * @param x
    	 * @param y
    	 * @param baseYValue
    	 */
    	function printLineTwoVesion(baseXValue,lableWidth,lableHeight,num,pageInfo,x,y,baseYValue){
    		var linkTempArray=pageInfo.line;
    		if(baseYValue==undefined){
    			baseYValue=0;
    		}
    		for(var i=0;i<linkTempArray.length;i++){
    			var strokeColor=colorRGB2Hex("("+linkTempArray[i].strokeColor+")");
    			LODOP.SET_PRINT_STYLE("FontColor",strokeColor);
    			var nodeAX=(baseXValue+linkTempArray[i].nodeAX-x+lableWidth*num*5)/5+"mm";
    			var nodeZX=(baseXValue+linkTempArray[i].nodeZX-x+lableWidth*num*5)/5+"mm";
    			var nodeAY=(linkTempArray[i].nodeAY-y)/5+baseYValue+"mm";
    			var nodeZY=(linkTempArray[i].nodeZY-y)/5+baseYValue+"mm";
    			if(linkTempArray[i].lineType==1){
    				LODOP.ADD_PRINT_LINE(nodeAY,nodeAX,nodeZY,nodeZX,0,linkTempArray[i].lineWidth)
    			}else{
    				LODOP.ADD_PRINT_LINE(nodeAY,nodeAX,nodeZY,nodeZX,2,0);
    			}
    			
    			//LODOP.ADD_PRINT_LINE(,1,linkTempArray[i].lineWidth);
    			//LODOP.SET_PRINT_STYLEA(0,"FontSize",1); 
    		}
    		
    	}
	
	/**
	 * 文字位置管理
	 */
	function textAlignDetail(lableWidth,lableHeight,num){
		for(var i=0;i<nodeArray.length;i++){
			if((nodeArray[i].nodeType=="datatext")||(nodeArray[i].nodeType=="text")||(nodeArray[i].nodeType=="time")){
				var textWidth = nodeArray[i].textWidth;
				var textHeight = nodeArray[i].textHeight;
				var temp=nodeArray[i].getBound();
				var width=temp.width;
				var height=temp.height;
				if(nodeArray[i].textPosition=="Middle_Left"){
					nodeArray[i].textOffsetX=textWidth;
					nodeArray[i].textPistionX=nodeArray[i].x;
					nodeArray[i].textPistionY=nodeArray[i].y+(height-textHeight)/2;
				}else if(nodeArray[i].textPosition=="Middle_Center"){
					nodeArray[i].textOffsetX=0;
					nodeArray[i].textPistionX=nodeArray[i].x+(width-textWidth)/2;
					nodeArray[i].textPistionY=nodeArray[i].y+(height-textHeight)/2;
					
				}else if(nodeArray[i].textPosition=="Middle_Right"){
					nodeArray[i].textOffsetX=-textWidth;
					nodeArray[i].textPistionX=nodeArray[i].x+width-textWidth;
					nodeArray[i].textPistionY=nodeArray[i].y+(height-textHeight)/2;
				}
			}
		}
	}
	
	/**
	 * 添加节点数据
	 */
	function addLableNodeInfo(){
		var x=container.x;
		var y=container.y;
		var nodeX;
		var nodeY;
		var nodeWidth;
		var nodeHeight;
		var fontColor;
		var bold="";
		var italic="";
		var dataSource;
		var alignment;
		var fontName;
		var sourceArray=new Array();
		var noSourceArray=new Array();
		for(var i=0;i<nodeArray.length;i++){
			nodeX=nodeArray[i].x-x;
			nodeY=nodeArray[i].y-y;
			nodeWidth=nodeArray[i].width;
			nodeHeight=nodeArray[i].height;
			fontName=nodeArray[i].fontType;
			fontColor=colorRGB2Hex("("+nodeArray[i].fontColor+")");
			dataSource=1;
			if((nodeArray[i].bold!="")&&(nodeArray[i].bold!=undefined)){
				bold="Bold";
			}
			if((nodeArray[i].italic!="")&&(nodeArray[i].italic!=undefined)){
				italic="Italic";
			}

			if(nodeArray[i].textPosition=="Middle_Left"){
				alignment=1;
			}else if(nodeArray[i].textPosition=="Middle_Center"){
				alignment=2;
			}else if(nodeArray[i].textPosition=="Middle_Right"){
				alignment=3;
			}
			var text=nodeArray[i].fontText;
			if((nodeArray[i].nodeType=="text")||(nodeArray[i].nodeType=="imgType")||(nodeArray[i].nodeType=="rect")||(nodeArray[i].nodeType=="time")){
				if(nodeArray[i].nodeType=="text"){
					nodeHeight=(-y+nodeArray[i].textPistionY);
				}
				
			}else if(nodeArray[i].nodeType=="datatext"){
				dataSource=2;
				
			}else if((nodeArray[i].code=="one")||(nodeArray[i].code=="two")){
				if(nodeArray[i].dataSource!=""){
					dataSource=2;
				}
			}
			if(dataSource==1){
				var dataJson={
						nodeX:nodeX,
						nodeY:nodeY,
						nodeWidth:nodeWidth,
						nodeHeight:nodeHeight,
						fontColor:fontColor,
						bold:bold,
						italic:italic,
						nodeType:nodeArray[i].nodeType,
						imgUrl:$("#pathId").val()+nodeArray[i].imgUrl,
						alignment:alignment,
						fontName:fontName,
						fontText:nodeArray[i].fontText,
						fontSize:nodeArray[i].fontSize,
						textPistionY:nodeArray[i].textPistionY-y,
						code:nodeArray[i].code,
						barcode:nodeArray[i].barcode,
						timeType:nodeArray[i].timeType,
						isWrap:nodeArray[i].isWrap
				};
				if((nodeArray[i].isWrap!=undefined)&&(nodeArray[i].isWrap==true)){
					dataJson.textPistionY=nodeArray[i].y-y;
				}
				noSourceArray.push(dataJson);
			}else{
				var dataJson={
						nodeX:nodeX,
						nodeY:nodeY,
						nodeWidth:nodeWidth,
						nodeHeight:nodeHeight,
						fontColor:fontColor,
						bold:bold,
						italic:italic,
						nodeType:nodeArray[i].nodeType,
						alignment:alignment,
						fontName:fontName,
						fontText:nodeArray[i].fontText,
						fontSize:nodeArray[i].fontSize,
						code:nodeArray[i].code,
						barcode:nodeArray[i].barcode,
						textPistionY:nodeArray[i].textPistionY-y,
						dataSource:nodeArray[i].dataSource,
						isWrap:nodeArray[i].isWrap
						
				};
				if((nodeArray[i].isWrap!=undefined)&&(nodeArray[i].isWrap==true)){
					dataJson.textPistionY=nodeArray[i].y-y;
				}
				sourceArray.push(dataJson);
			}
			 
			
			
		}
		jsonData={noSourceArray:noSourceArray,sourceArray:sourceArray};
		return jsonData;
	}
	
	
	
	//生成时间格式
	Date.prototype.format = function(fmt) {
		var fmtType=1;
		 var o = { 
	        "M+" : this.getMonth()+1,                 //月份 
	        "d+" : this.getDate(),                    //日 
	        "h+" : this.getHours(),                   //小时 
	        "m+" : this.getMinutes(),                 //分 
	        "s+" : this.getSeconds(),                 //秒 
	        "q+" : Math.floor((this.getMonth()+3)/3), //季度 
	        "S"  : this.getMilliseconds()             //毫秒 
	    }; 
	    if(/(y+)/.test(fmt)) {
	            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	    }
	     for(var k in o) {
	        if(new RegExp("("+ k +")").test(fmt)){
	             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	         }
	     }
	    return fmt; 
	}
	
	//验证版本
	function CheckIsInstall() {	 
		 var LODOP=getLodop(); 
		 var result={result:true,url:""};
		 if(LODOP==undefined){
		 	 result.result=false;
			 var agent = navigator.userAgent.toLowerCase();
			    if (agent.indexOf("win64") >= 0 || agent.indexOf("wow64") >= 0) {
			    	result.url="plf/page/mlabel/page/download/CLodop_Setup_for_Win64NT_3.028Extend.exe";
			    }
			    else {
			    	result.url="plf/page/mlabel/page/download/CLodop_Setup_for_Win32NT_https_3.028Extend.exe";
			    }
		 }
		 return result;
		 
	}; 
	//添加字体数组
	function addNodeFocus(){
		textNodeArray.length=0;
	}
	//添加字体数组
	function addNodeText(textValueDetail){
		removeTextNode();
		textNodeArray.length=0;
		var textValue=$("#textContant").val(); 
		textValue=textValue.replaceAll("\n", "}"); 
		
		if(textValueDetail!=undefined){
			textValue=textValueDetail;
		}else{
			textValue=$("#textContant").val();
		}
		if(textValue==undefined||textValue==""){
			return false;
		}
		textValue=textValue.replaceAll("\n", "}"); 
		for(var i=0;i<textValue.length;i++){
			var nodeJson={
					text:textValue[i],
					x:0,
					y:0,
					uuid:generateUUid(),
					font:1,
					nodeType:"textNode",
					width:20,
					height:20,
					fontText:currentObj.fontText,
					dataSource:currentObj.dataSource,
					bold:currentObj.bold,
					italic:currentObj.italic,
					fontType:currentObj.fontType,
					fontSize:currentObj.fontSize,
					textPosition:currentObj.textPosition,
					textOffsetX:currentObj.textOffsetX,
					barcode:currentObj.barcode,
					code:currentObj.code,
					textPistionX:currentObj.textPistionX,
					textPistionY:currentObj.textPistionY,
					codeTextType:currentObj.codeTextType,
					directionType:currentObj.directionType,
					brotherId:currentObj.brotherId
			};
			var nodeN=canvasObj.addNodeByJson(nodeJson);
			textNodeArray.push(nodeN);
		}
	}
	
	function removeTextNode(){
		copyNodeArray = nodeArray.concat();
		for(var i=0;i<copyNodeArray.length;i++){
			if(copyNodeArray[i].nodeType=="textNode"){
				 canvasObj.removeNode(copyNodeArray[i]);
			}
			
		}
		
	}
	//是否是ie浏览器
	function isIeBrowser(){
		if ((navigator.userAgent.indexOf('MSIE') >= 0) ||(!!window.ActiveXObject || "ActiveXObject" in window)){
			   return {result:false,"msg":_GLO_ISBROWSER};
		}else{
			 return {result:true,"msg":""};
		}
	}
	
	String.prototype.replaceAll = function(s1,s2){ 
		return this.replace(new RegExp(s1,"gm"),s2); 
	} 
	//增加canvas宽度跟高度
	function addCanvasSize(scaleX,scaleY){
		
	}
	//修改数据源内容
	function changeDataSourceInfo(jsonValue){
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].dataSource!=""&&nodeArray[i].dataSource!=undefined){
				var textValue=jsonValue[nodeArray[i].dataSource];
				if(textValue!=null&&textValue!=undefined){
					nodeArray[i].fontText=textValue;
					if(nodeArray[i].code==undefined){
						nodeArray[i].text=textValue;
					}
					
				}else{
					nodeArray[i].fontText="";
				}
				
				
			}
		}
		return true;
	}
	//打印状态捕捉
	function getStatusValue(ValueType,ValueIndex,oResultOB){
       	LODOP=getLodop(); 
		if (LODOP.CVERSION){
				LODOP.On_Return=function(TaskID,Value){
					oResultOB.value=Value;
					localStorage.printStatus=Value;
					console.log(localStorage.printStatus);
					
				};
			}
		var strResult=LODOP.GET_VALUE(ValueType,ValueIndex);
		if (!LODOP.CVERSION) return strResult; else return "";
	};
	//生成定时器
	function printStatusRead(){
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){document.getElementById('printOne').value=Value;};
			
			printSetTimeout();
			return; 
		} else{
			document.getElementById('printOne').value=LODOP.PRINT();
			printSetTimeout();
		} 
	}
	
	function printSetTimeout()
	{
		printSetInterval(function(){
			valueInfo();
	    },1000);
	}
	function printSetInterval(){
		setInterval(function(){
		 	   document.getElementById('printTwo').value=getStatusValue('PRINT_STATUS_OK',document.getElementById('printOne').value,document.getElementById('printTwo'));
		    },1000);
	}
	

	