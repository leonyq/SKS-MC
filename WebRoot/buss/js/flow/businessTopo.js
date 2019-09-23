/**
 * 工艺流程组态业务相关
 * Created by 黄志鹏 on 2017/11/09
 * version 1.0
 */
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
	var groupCode;
	var sequenceTemp=1;
	var alignObject;//对齐的控件
	var naturalWidth;
	var naturalHeight;
	var nodeText;
	var funcId;
	var rightDrag=false;//右键拖动标志
	var mousedownTempX;//鼠标点击X坐标
	var mousedownTempY;//鼠标点击Y坐标
	var dragNodeArray=new Array();//拖拉之前数组
	var lineTemp=false;//加线标志
	var lineTempType;//线体类型
	var lineDrag=false;//拖拽线体标志
	var currentLine;//当前线体
	
	/**
	 *初始化内容
	 */
	function initContext(){
		var divs = document.getElementById("content"); 
		/*document.getElementById("canvas").width =divs.scrollWidth;*/
		canvas = document.getElementById("canvas");
		canvasObj=new initCanvas(canvas,"select",0.85,0.25);
		scene=canvasObj.getScene();
		stage=canvasObj.getStage();
		startNode = new JTopo.CircleNode();
		startNode.radius = 3;
		endNode = new JTopo.CircleNode(); 
		endNode.radius = 3;
		link = new JTopo.Link(startNode, endNode);
		link.visible = false;
		scene.mouseover(function(event) {
			if (null != imgSrc) {
				addCanvasNode(imgSrc,event,groupCode);
				imgSrc = null;
			}else{
				return false;
			}
			
			
		});
		// 点击右键增加事件
		scene.mousedown(function(event) { 
			var node = event.target;
			if(node instanceof JTopo.Link){
				lineDrag=true;
				mousedownTempX=event.x;
				mousedownTempY=event.y;
				currentLine=node;
				nodeAbaseLineX=node.nodeA.x;
				nodeAbaseLineY=node.nodeA.y;
				nodeZbaseLineX=node.nodeZ.x;
				nodeZbaseLineY=node.nodeZ.y;
				
				
			}else if(node instanceof JTopo.Node){
				lineDrag=false;
				currentLine=null;
			}else if(!rightDrag){
				removeLineNode();
				
			}
			if((event.button==2)||(event.buttons==1)){
				mousedownTempX=event.x;
				mousedownTempY=event.y;
				dragNodeArray.length=0;
				for(var i=0;i<nodeArray.length;i++){
					var dragNodeTemp={x:nodeArray[i].x,y:nodeArray[i].y};
					dragNodeArray.push(dragNodeTemp);
				}
				
			}
			
		})
		// 拖动场景
		  scene.mousedrag(function(event) {
			if(event.buttons==2){
				var addX=event.x-mousedownTempX;
				var addY=event.y-mousedownTempY;
				for(var i=0;i<nodeArray.length;i++){
					nodeArray[i].x=dragNodeArray[i].x+addX;
					nodeArray[i].y=dragNodeArray[i].y+addY;
				}	
			}
			var node = event.target;
			if(event.buttons==1&&!(node && node instanceof JTopo.Node && !node.startNode&&node.nodeType=="imgNode")){
				var addX=event.x-mousedownTempX;
				var addY=event.y-mousedownTempY;
				for(var i=0;i<nodeArray.length;i++){
					nodeArray[i].x=dragNodeArray[i].x+addX;
					nodeArray[i].y=dragNodeArray[i].y+addY;
				}	
			}
			if(!rightDrag&&lineDrag&&currentLine!=null){
				canvas.style.cursor = 'move';
				var addX=event.x-mousedownTempX;
				var addY=event.y-mousedownTempY;
				dragGroup(currentLine,addX,addY);
			}	
				
		})
		
		
	// 松开鼠标左键
		scene.mouseup(function(e) {
			lineDrag=false;
			
			if (2 == e.button) return;
			var node = e.target;
			currentNode = node;
			 if (window.event.ctrlKey) {
       			
    		}else{
    			removeSelectColor();
    			
    		}
    		
    		if(lineTemp){
				addLineToCanvas(lineTempType,e);
				lineTemp=false;	
    		}
			
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
				//选中了node
				if(node && node instanceof JTopo.Node && !node.startNode&&node.nodeType=="imgNode"){
				validateFirstSelect();
					if (lineMode)
						linkHandler(node);
					showObjectParams(node);
				}else if(node && node instanceof JTopo.Link){
					if(!rightDrag){
					addLineNode(node);
					}
					showObjectParams(node);
					hideLink();
				}else{
					removeLineNode();
					hideLink();
					removeSelectColor();
					//addSelectColor();
					alignObject=null;
					
				}
			}
		});
		scene.mousemove(function(e) {
			var node = e.target;
			currentNode = node;
			if((node instanceof JTopo.Node)){
				if( typeof nodeMouseOver === 'function'){
        			nodeMouseOver(node.funcId,event,node);
   				}
				 
			}else{
				$("#funInfo").hide();
			}
			
		}); 
		
		var textfield = $("#jtopoTextfield");
		//双击改控件名称
		scene.dbclick(function(e) {
			var node = e.target;
			if (null != node) {
				hideLink();
			if(null == node.text){
					node.text = "";
			}
			
			if(node instanceof JTopo.Node){
				if( typeof nodeMouseDbc == 'function'){
        			nodeMouseDbc(node.funcId,event,node);
   				}
				return false;
			}
			
			
			if(node.groupLinkUUid!=undefined){
				if(node.Uline=="end"){
					node=canvasObj.selectLineByUuid(node.groupLinkUUid);
				}
			}
			
			textfield.css({
					top: e.pageY,
					left: e.pageX - node.width / 2
				}).show().attr("value", node.text).focus().select();
				node.text = "";
				textfield[0].JTopoNode = node;
			}});
			$("#jtopoTextfield").blur(function() { 
			textfield[0].JTopoNode.text = textfield.hide().val();
			textfield[0].JTopoNode.fontColor= '0,0,0';
			//updateLinkLableProperty(textfield[0].JTopoNode);
		});
		stage.click(function(e) {
			0 == e.button && $("#contextmenu").hide();
		});
		
		scene.mouseup(function(e) {
			$("#funInfo").hide();
			currentNode = e.target;
			if(2 == e.button){
				popMenu(e);
				hideLink();
			}
			
		});
		
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
				link.nodeZ.x = node.getCenterLocation().x, 
				link.nodeZ.y = node.getCenterLocation().y; 
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
			var nodeData={
					font:$("#pFontSize").val()+" "+$("#pFont").val(),
					processType:$("#processType").val(),
					textPosition:$("#pLabelPosition").val(),
					startProcedure:0,
					endProcedure:0,
					alarm:"",
					alarmColor:""
			};
			if($('#startProcedure').is(':checked')) {
				nodeData.startProcedure=1;
				nodeData.alarm="开始工序";
				nodeData.alarmColor="0,35,0";
			}
			if($('#endProcedure').is(':checked')) {
				nodeData.endProcedure=1;
				nodeData.alarm="结束工序";
				nodeData.alarmColor="255,0,0";
			}
			
			var temp=$("#processType").val();
			
			canvasObj.updateNodeProperty(currentObj,nodeData);
		}else if(currentObj instanceof JTopo.Link){
			var temp=true;
			  $(".num-class").each(function(){
				  var value=$(this).val();
				  var patt=new RegExp("^[0-9]+(.[0-9]{2})?$");
				  if(patt.test(value)==false){
				  	utilsFp.confirmIcon(1,"","","", $(this).prev().html()+"为整数",0,"260","");
					  temp=false;
					  return temp;
				  }
				   
			  });
			  if(temp==false){
				  return false;
			  }
			var lineData={
					font:$("#pFontSize").val()+" "+$("#pFont").val(),
					lineWidth:$("#pLineSize").val(),
					arrowsRadius:$("#pLineArrow").val(),
					strokeColor:$("#lineColor").attr("title").colorRgb()
			};	
			canvasObj.updateLineProperty(currentObj,lineData);	
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
		if (node instanceof JTopo.Link){
			if(node.groupLink!=undefined){
				node.groupLink.selected=true;
			}
			//updateLinkLableProperty(node);
			$(".line-class").show();
			$(".node-class-next").hide();
		}else if(node instanceof JTopo.Node){
			$(".line-class").hide();
			$(".node-class-next").show();
			//updateNodeLableProperty(node);//更新lable的数据
			
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
				text:"",
				font:"12px Consolas",
				fontColor:"0,0,0",
				lineWidth:1,
				arrowsRadius:7,
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
		canvasObj.addLineByJson(link.startNode, node, lineJson);
		
		
	}
	/**
	 * 画布添加节点
	 * @param imgSrc：图片背景 
	 * @param event：点击事件 
	 */
	function addCanvasNode(imgSrc,event,groupCode){
		var uuid = util.getUUID();
		var nodeJson={
				text:nodeText,
				imgUrl:imgSrc,
				x:event.x,
				y:event.y,
				uuid:uuid,
				font:"12px Consolas",
				fontColor:"0,0,0",
				startProcedure:0,
				endProcedure:0,
				processType:0,
				borderColor:"0,0,0",
				nodeType:"imgNode",
				borderColor:"0,255,0",
				alarm:"",
				alarmColor:"",
				groupCode:groupCode,
				dragable:true,
				width:naturalWidth,
				height:naturalHeight,
				funcId:funcId
		};
		if(pointType==false){
			nodeJson.dragable=false;
		}
		canvasObj.addNodeByJson(nodeJson);
	}
	
	
	/**
	 * 展示节点属性
	 * @param node 节点
	 */
	function updateNodeLableProperty(node){
		$("#pLabel").val(node.text);
		parseFont(node.font);
		$("#pColor").val(node.fontColor);
		$("#pLabelPosition").val(node.textPosition);
		var processType=node.processType;
		var select = document.getElementById("processType"); //选中工序类型
		for(var i=0; i<select.options.length;i++){
				 if(select.options[i].value == processType){  
			         select.options[i].selected = true;  
			         break;  
			     }  
		} 
		//开始工序被选中
		if(node.startProcedure==1){
			$("#startProcedure").attr("checked",true);
		}else{
			$("#startProcedure").attr("checked",false);
		}
		//结束工序被选中
		if(node.endProcedure==1){
			$("#endProcedure").attr("checked",true);
		}else{
			$("#endProcedure").attr("checked",false);
		}
	}
	

	/**
	 * 展示线体属性
	 * @param link 节点
	
	function updateLinkLableProperty(node){
		$("#pLabel").val(node.text);
		parseFont(node.font);
		$("#pColor").val(node.fontColor);
		$("#pLabelPosition").val(node.textPosition);
		$("#pLineSize").val(node.lineWidth);
		$("#pColor").val(node.strokeColor);
		if(node.groupLinkUUid!=undefined){
			var groupLink=canvasObj.selectLineByUuid(node.groupLinkUUid);
			if(node.arrowsRadius==0){
				$("#pLineArrow").val(groupLink.arrowsRadius);
			}else{
				$("#pLineArrow").val(node.arrowsRadius);
				$("#pLabel").val(groupLink.text);
			}	
		}else{
			$("#pLineArrow").val(node.arrowsRadius);
		}
		var select = document.getElementById("pLabelPosition"); //显示文字位置
		for(var i=0; i<select.options.length;i++){
				 if(select.options[i].value == node.textPosition){  
			         select.options[i].selected = true;  
			         break;  
			     }  
		} 
	}
	 */
	/**
	 * 更新线体颜色
	 * @param jscolor 16进制颜色
	 */
	function updateColor(jscolor) {
			$("#lineColor").val("#"+jscolor);
			$("#lineColor").attr("title","#"+jscolor);
		updateObject();
		
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
	 
	function parseFont(fontstr){
		var parts = fontstr.split(" ");
		$("#pFontBold").attr("checked", false);
		$("#pFontItalic").attr("checked", false);
		var select = document.getElementById("pFont"); //选中工序类型
		for(var i=0; i<select.options.length;i++){
				 if(select.options[i].value == parts[1]){  
			         select.options[i].selected = true;  
			         break;  
			     }  
		} 
		for (i=0; i<parts.length; i++){
			if (parts[i].indexOf("px")>0){
				$("#pFontSize").val(parts[i]);
			}else if (parts[i]=="bold"){
				$("#pFontBold").attr("checked", true);
			}else if (parts[i]=="italic"){
				$("#pFontItalic").attr("checked", true);
			}else if (parts[i].indexOf(",")>0){
				$("#pColor").val(parts[i]);	
			}else{
				//$("#pFont").val(parts[i]);	
			}
		}
	}
	*/
	
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
				left:e.pageX+35
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
		var imgId=e.target.id;
		var imgObject = document.getElementById(imgId);
		naturalWidth=imgObject.naturalWidth;
		naturalHeight=imgObject.naturalHeight;
		if(naturalWidth==0){
			naturalWidth=40;
			naturalHeight=40;
		}
		nodeText=imgObject.nextSibling.innerHTML;
		funcId=imgObject.getAttribute("dataType");
		
	}
	function drop(e) { 
		e.preventDefault();
	}
	
	function upClear(){
		utilsFp.confirmIcon(1,"","cleanScene","", "是否确认删除？","1","260","");
	}
	
	function upDelete(){
		 if(currentObj instanceof JTopo.Node){
			canvasObj.removeNode(currentObj);
		}else if(currentObj instanceof JTopo.Link){
			if((currentObj.nodeA.nodeType!=undefined)&&(currentObj.nodeA.nodeType=="middle")){
				var nodeA=currentObj.nodeA;
				var nodeZ=currentObj.nodeZ;
				canvasObj.removeNode(nodeA);
				canvasObj.removeNode(nodeZ);
			}
			canvasObj.removeLine(currentObj);
		}
	}
	
	/**
	 * 保存数据
	 */
	function saveInfo(){
		nonRepetitionNode.length=0;
		addNonErgodic();
		var temp=canvasObj.validateBeforeNode(nodeArray[0],nodeArray[1]);
		utilsFp.confirmIcon(1,"","","", validateProcedure(),0,"260","");
		
		
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
	 * 选择连线模式
	 */
	function changeLineType(lineType,object){
		var event = getEvent();
		event.preventDefault()
		$(".tool-con").each(function(){
			   $(this).removeClass("tool-con-active");
			  });
			$(object).addClass("tool-con-active");
		currentNode=null;
		pointType=false;
		for(var i=0;i<nodeArray.length;i++){
			nodeArray[i].dragable=false;
		}
		lineTemp=false;
		lineTempType=lineType;
		 if("straight" == lineType){
				//beginLine(currentNode);
				lineMode = true;
				addLineType="straight";
				
				
			}else if("broken" ==lineType){
				lineMode = true;
				addLineType="broken";
				
				
			}else if("Uline"==lineType){      
				lineMode = true;
				addLineType="Uline";
				
			}else if(("horizontal"==lineType)||("vertical"==lineType)||("slash"==lineType)){
				lineTemp=true;
				pointType=true;
				for(var i=0;i<nodeArray.length;i++){
					nodeArray[i].dragable=true;
				}
			}
		 
	}
	/**
	 * 切换成指针模式
	 */
	function gainPointType(object){
		var event = getEvent();
		event.preventDefault()
		$(".tool-con").each(function(){
		   $(this).removeClass("tool-con-active");
		  });
		$(object).addClass("tool-con-active");
		canvasObj.pointType();
		lineMode = false;
		pointType=true;
		
	}
	
	/**
	 * 画布添加节点
	 * @param imgSrc：图片背景 
	 * @param event：点击事件 
	 */
	function saveTopoInfo(){
		var temp=validateProcedure();
		var imgNodeToArray=new Array();
		var middelNodeArray=new Array();
		var lineToArray=new Array();
		var lineShow=new Array();
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].nodeType=="imgNode"){
				var node=nodeArray[i];
				var nodeNext={
						text:node.text,
						imgUrl:node.imgUrl,
						x:node.x,
						y:node.y,
						width:node.width,
						height:node.height,
						uuid:node.uuid,
						nodeType:node.nodeType,
						treeNodeUUid:node.treeNodeUUid,
						directionType:node.directionType,
						groupCode:node.groupCode, 
						funcId:node.funcId
				};
				imgNodeToArray.push(nodeNext);
				
			}else if(nodeArray[i].nodeType=="middle"){
				var node=nodeArray[i];
				var nodeNext={
						uuid:node.uuid,
						nodeType:node.nodeType,
						beginNodeUuid:node.beginNodeUuid,
						endNodeUuid:node.endNodeUuid,
						directionType:node.directionType,
						x:node.x,
						y:node.y,
						brotherId:node.brotherId,
						directionType:node.directionType
				};
				middelNodeArray.push(nodeNext);
			}
		}
		for(var i=0;i<linkArray.length;i++){
			if(linkArray[i].nodeA!=undefined){
				var line={
					nodeAUuid:linkArray[i].nodeA.uuid,
					nodeZUuid:linkArray[i].nodeZ.uuid,
					nodeAGroupCode:linkArray[i].nodeA.groupCode,
					nodeZGroupCode:linkArray[i].nodeZ.groupCode,
					uuid:linkArray[i].uuid,
					text:linkArray[i].text,
					font:linkArray[i].font,
					fontColor:linkArray[i].fontColor,
					lineWidth:linkArray[i].lineWidth,
					arrowsRadius:linkArray[i].arrowsRadius,
					strokeColor:linkArray[i].strokeColor,
					direction:linkArray[i].direction,
					Uline:linkArray[i].Uline,
					lineType:linkArray[i].lineType,
					groupLinkUUid:linkArray[i].groupLinkUUid,
					middleNodeUUid:linkArray[i].middleNodeUUid,
			};
			lineShow.push(line);
			
			}
			
		}
		//保存线体数据
		for(var i=0;i<linkArray.length;i++){
			if(linkArray[i].nodeA!=undefined&&linkArray[i].lineType!="Uline"){
				var line={
						nodeAUuid:linkArray[i].nodeA.uuid,
						nodeZUuid:linkArray[i].nodeZ.uuid,
						nodeAGroupCode:linkArray[i].nodeA.groupCode,
						nodeZGroupCode:linkArray[i].nodeZ.groupCode,
						uuid:linkArray[i].uuid,
						text:linkArray[i].text,
						font:linkArray[i].font,
						fontColor:linkArray[i].fontColor,
						lineWidth:linkArray[i].lineWidth,
						arrowsRadius:linkArray[i].arrowsRadius,
						strokeColor:linkArray[i].strokeColor,
						direction:linkArray[i].direction,
						Uline:linkArray[i].Uline,
						lineType:linkArray[i].lineType,
						groupLinkUUid:linkArray[i].groupLinkUUid,
						middleNodeUUid:linkArray[i].middleNodeUUid,
				};
				lineToArray.push(line);
			}else if((linkArray[i].lineType=="Uline")&&(linkArray[i].Uline=="begin")){
				var groupLink=selectLineByUuidN(linkArray[i].groupLinkUUid);
				
				var line={
						nodeAUuid:linkArray[i].nodeA.uuid,
						nodeZUuid:groupLink.nodeZ.uuid,
						nodeAGroupCode:linkArray[i].nodeA.groupCode,
						nodeZGroupCode:groupLink.nodeZ.groupCode,
						uuid:linkArray[i].uuid,
						text:linkArray[i].text,
						font:linkArray[i].font,
						fontColor:linkArray[i].fontColor,
						lineWidth:linkArray[i].lineWidth,
						arrowsRadius:linkArray[i].arrowsRadius,
						strokeColor:linkArray[i].strokeColor,
						direction:linkArray[i].direction,
						Uline:linkArray[i].Uline,
						lineType:linkArray[i].lineType,
						groupLinkUUid:linkArray[i].groupLinkUUid,
						middleNodeUUid:linkArray[i].middleNodeUUid,
				};
				lineToArray.push(line);
			}
		}
		var json={imgNode:imgNodeToArray,middelNode:middelNodeArray,line:lineToArray,lineShow:lineShow};
		return json;
	}
	/**
	 * 添加工序顺序
	 */
	function addSequence(){
		var sequence=3;
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].startProcedure==1){
				nodeArray[i].sequence=1;
			}
			if(nodeArray[i].endProcedure==1){
				nodeArray[i].sequence=2;
			}
			if((nodeArray[i].startProcedure!=1)&&(nodeArray[i].endProcedure!=1)&&(nodeArray[i].nodeType=="imgNode")){
				nodeArray[i].sequence=sequence;
				sequence++;
			}
		}
	}
	/**
	 * 假装展示数据
	 * @param jsonStr
	 */
	function showTopoData(jsonStr){
		sequenceTemp=2;
		var jsonData=JSON.parse(jsonStr);
		var middelNode=jsonData.middelNode;
		var imgNode=jsonData.imgNode;
		var lineJson=jsonData.lineShow;
		var node;
		//加载图形节点
		for(var i=0;i<imgNode.length;i++){
			node=imgNode[i];
			var nodeJson={
					text:node.text,
					imgUrl:node.imgUrl,
					x:node.x,
					y:node.y,
					width:node.width,
					height:node.height,
					uuid:node.uuid,
					font:node.font,
					fontColor:node.fontColor,
					startProcedure:node.startProcedure,
					endProcedure:node.endProcedure,
					processType:node.processType,
					nodeType:"imgNode",
					alarm:"",
					alarmColor:"",
					borderColor:"0,0,0",
					groupCode:node.groupCode,
					dragable:true,
					nodeRefer:node.nodeRefer,
					treeNodeUUid:node.treeNodeUUid,
					directionType:node.directionType,
					sequence:node.sequence,
					funcId:node.funcId
			};
			if(node.startProcedure==1) {
				nodeJson.startProcedure=1;
				nodeJson.alarm="开始工序";
				nodeJson.alarmColor="0,35,0";
			}
			if(node.endProcedure==1) {
				nodeJson.endProcedure=1;
				nodeJson.alarm="结束工序";
				nodeJson.alarmColor="255,0,0";
			}
			
			var temp=node.processType;
			canvasObj.addNodeByJson(nodeJson);
		}
		addMiddleNodeN(middelNode,lineJson);
		removeLineNode();
		
	}
	/**
	 * 添加线下数据
	 */
	function addLineData(lineJson){
		ulineTempLike=1;
		var lineN;
		for(var i=0;i<lineJson.length;i++){
			lineN=lineJson[i];
			var temp=selectNodeByUUid(lineN.nodeAUuid,lineN.nodeZUuid);
			var lineJsonN={
					uuid:lineN.uuid,
					text:lineN.text,
					font:lineN.font,
					fontColor:lineN.fontColor,
					lineWidth:lineN.lineWidth,
					arrowsRadius:lineN.arrowsRadius,
					strokeColor:lineN.strokeColor,
					direction:lineN.direction,
					lineType:lineN.lineType,
					Uline:lineN.Uline,
					groupLinkUUid:lineN.groupLinkUUid,
					middleNodeUUid:lineN.middleNodeUUid
			};
			
			var linkL=canvasObj.addLineByJson(temp.nodeA, temp.nodeZ, lineJsonN);
			if(temp.nodeA.nodeType=="middle"){
				linkL.arrowsRadius=0;
			}
		}
		ulineTempLike=2;
		
	}
	/**
	 * 添加中间节点
	 */
	function addMiddleNodeN(middleJson,lineJson){
		var middleNodeN;
		var middleJsonNT=middleJson;
		for(var i=0;i<middleJsonNT.length;i++){
			middleNodeN=middleJsonNT[i];
			var middleJsonN={
					uuid:middleNodeN.uuid,
					x:middleNodeN.x,
					y:middleNodeN.y,
					beginNodeUuid:middleNodeN.beginNodeUuid,
					endNodeUuid:middleNodeN.endNodeUuid,
					directionType:middleNodeN.directionType,
					nodeType:middleNodeN.nodeType,
					brotherId:middleNodeN.brotherId,
					directionType:middleNodeN.directionType
			};
			canvasObj.addMiddleNodeByJson(middleJsonN);
		}
		addLineData(lineJson);
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
	 * 居左
	 */
	function alignSide(type){
		var event = getEvent();
		event.preventDefault()
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
		if(alignObject==null){
			alignObject=alignArray[0];
		}
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
		
		if((src.indexOf("horizontal")>=0)){
			nodeAJson.x=event.x;
			nodeZJson.x=event.x+80;
			lineJson.directionType="horizontal";
			nodeAJson.directionType="horizontal";
			nodeZJson.directionType="horizontal";
		}else if((src.indexOf("vertical")>=0)){
			nodeAJson.y=event.y;
			nodeZJson.y=event.y+80;
			nodeAJson.directionType="vertical";
			nodeZJson.directionType="vertical";
		}else if((src.indexOf("slash")>=0)){
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
		linkL.arrowsRadius=0;
	}
	
	
	
	
	/**
	 * 放大，缩小功能
	 */
	function changeSceneSize(type){
		var event = getEvent();
	event.preventDefault()
		if(type==1){
			scene.scaleX=scene.scaleX*1.25;
    		scene.scaleY=scene.scaleY*1.25;
		}else{
			scene.scaleX=scene.scaleX*0.8;
    		scene.scaleY=scene.scaleY*0.8;
		}
	}
	
	function removeSelectColor(){
		for(var i=0;i<nodeArray.length;i++){
				var temp=nodeArray[i].processType;
				
			
		}
	}
	
	function addSelectColor(){
		for(var i=0;i<nodeArray.length;i++){
			if(nodeArray[i].selected){
				nodeArray[i].borderColor = '255,0,0'; //边框颜色   
			}
		
		}
	
	}
	
	/**
	 * 移除线条头尾节点
	 */
	function removeLineNode(){
		for(var i=0;i<linkArray.length;i++){
			if(linkArray[i] instanceof JTopo.Link){
				var nodeA=linkArray[i].nodeA;
				var nodeZ=linkArray[i].nodeZ;
				linkArray[i].selected=false;
				
				if((nodeA!=undefined&&nodeA.nodeType!=undefined&&nodeA.nodeType=="middle")&&(nodeZ!=undefined&&nodeZ.nodeType!=undefined&&nodeZ.nodeType=="middle")){
					var temp=nodeA.getBound();
					var width=temp.width;
					if(width!=1){
						nodeA.setSize(1,1);
						nodeZ.setSize(1,1);
						nodeA.x=nodeA.x+3;
						nodeZ.x=nodeZ.x+3;
						nodeA.y=nodeA.y+3;
						nodeZ.y=nodeZ.y+3;
					}
					
				}
			}
			
			
		}
	}
	/**
	 * 添加线条节点
	 */
	function addLineNode(linkValue){
		var nodeA=linkValue.nodeA;
		var nodeZ=linkValue.nodeZ;
		if(nodeA!=undefined&&nodeA.nodeType!=undefined&&nodeA.nodeType=="middle"){
			nodeA.setSize(7,7);
			nodeZ.setSize(7,7);
			nodeA.x=nodeA.x-3;
			nodeZ.x=nodeZ.x-3;
			nodeA.y=nodeA.y-3;
			nodeZ.y=nodeZ.y-3;
		}
	}
	
	
	function setNoDrag(){
		for(var i=0;i<nodeArray.length;i++){
			nodeArray[i].dragable=false;
		}
		rightDrag=false;
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
	
var getEvent = function(){
    return window.event || arguments.callee.caller.arguments[0];
}