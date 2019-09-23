<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="表单关联配置" />
</title>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="html5" value="1" />
</jsp:include>

<style>
.div_box {
	position: absolute;
	z-index: 1;
	top: 0;
	left: 0;
}
</style>

<script>
					var relObjArr = new Array();
					
					var contextObj = null;//canvas画布
					
					var offsetCount = 0;//X轴偏移
					
					var colorMap = new Map();//颜色Map
					
					function mousePos(e){
						//console.log("mouse position----x:"+e.pageX+",y:"+e.pageY);
					}

					//获取位置 getPos(obj).x;getPos(obj).y
					function getPos(obj)
					{
						if(typeof obj=='string'){
							obj = $("#"+obj);
							}
						//return {x:obj.offsetLeft+obj.offsetWidth/2, y:obj.offsetTop+obj.offsetHeight/2};
						return {x:obj.offset().left+obj.outerWidth(), y:obj.offset().top+obj.outerHeight()};
					}
					
					var width = $(document).width()-100;
					var height = $(document).height()*2;
					//var lineColor = "#419edb";
					
					//初始化canvas
					function initCanvas(){
						var canvas = document.getElementById("canvas");
						canvas.width = width;
						canvas.height = height+200;
						if(canvas.getContext("2d") != undefined){
							var context = canvas.getContext("2d");
							/*context.moveTo(sourceObj.x,sourceObj.y);
							context.lineTo(destinationObj.x,destinationObj.y);
							context.strokeStyle = lineColor;
							context.stroke();*/
							return context;
						}else{
							alert("当前浏览器不支持canvas！");
							return null;
						}
					}
					//画线
					//参数依次为canvas.getContext对象，源坐标，目的坐标，关联线数（两张表间，一条关联线，不偏移，每多一条 关联线，X轴就偏移5px，防止线重叠）
					function drawLine(contextObj,sourceObj,destinationObj,offsetCount,color){
						//contextObj.beginPath();
						var distance = Math.abs(sourceObj.x - destinationObj.x)/3;//折线
						
						contextObj.moveTo(sourceObj.x,sourceObj.y-15);
						
						contextObj.lineTo(sourceObj.x+distance+offsetCount,sourceObj.y-15);
						
						contextObj.lineTo(sourceObj.x+distance+offsetCount,destinationObj.y-15);
						
						contextObj.lineTo(destinationObj.x,destinationObj.y-15);
						
						//contextObj.closePath();
						contextObj.strokeStyle = color;//util.getRandomColor();
						contextObj.stroke();
					}
					
					//拖动方法
					function drag(obj, fnDuring)
					{
						var iMouseStartX=0;
						var iMouseStartY=0;
						
						var iDivStartX=0;
						var iDivStartY=0;
						
						if(typeof obj=='string')obj=document.getElementById(obj);
						
						obj.onmousedown=startDrag;
						
						function startDrag(ev)
						{
							var oEvent=ev||event;
							
							iMouseStartX=oEvent.clientX;
							iMouseStartY=oEvent.clientY;
							
							iDivStartX=obj.offsetLeft;
							iDivStartY=obj.offsetTop;
							
							if(obj.setCapture)
							{
								obj.onmousemove=doDrag;
								obj.onmouseup=stopDrag;
								
								obj.setCapture();	//捕获事件
							}
							else
							{
								document.addEventListener('mousemove', doDrag, true);
								document.addEventListener('mouseup', stopDrag, true);
							}
							
							//bMouseDown=true;
						}
						
						function doDrag(ev)	//鼠标移动
						{
							var oEvent=ev||event;
							
							var l=oEvent.clientX - iMouseStartX + iDivStartX;
							var t=oEvent.clientY - iMouseStartY + iDivStartY;
							
							obj.style.left=l + 'px';
							obj.style.top=t + 'px';
							
							if(fnDuring)fnDuring.call(obj, l, t);
						}
						
						function stopDrag()	//按键抬起
						{
							if(obj.releaseCapture)
							{
								obj.onmousemove=null;
								obj.onmouseup=null;
								obj.releaseCapture();	//释放捕获
							}
							else
							{
								document.removeEventListener('mousemove', doDrag, true);
								document.removeEventListener('mouseup', stopDrag, true);
							}
						}
					}
		</script>

</head>
<body>
	<div class="all">
		<div style="overflow:hidden;">
			<form id="listForm" name="listForm"
				action="${path}sys/BussModelAction_showCfgForm.ms" method="post">
				<canvas id="canvas" class="div_box">
				</canvas>
				<s:hidden name="paraMap.MID" />
				<s:hidden name="paraMap.ID" />
				
				  
				<div id="main_table"
					style="position:absolute; z-index:2; overflow:hidden;">
				
					</br>
					
					<div class="table_div" style="width: 400px;">
					<table class="table_list" style="width: 390px;">
						<tr>
							<th colspan="4"><s:if test="dataMap.formColLs.size >0">
									<a style="font-size:14px;"
										href="${path}sys/BussModelAction_viewOrm.ms?viewtype=1&paraMap.MID=1&paraMap.ORMID=<s:property value="dataMap.formColLs[0].ID_T3" />"
										target="_blank"> <s:property
											value="dataMap.formColLs[0].FORM_NAME_T5" />:<s:property
											value="dataMap.formColLs[0].TABLE_NAME_T3" /> </a>
								</s:if></th>
						</tr>
						
						<col style="width: 10%" />
						<col style="width: 35%" />
						<col style="width: 35%" />
						<col style="width: 20%" />
							
						<s:iterator value="dataMap.formColLs" status="index">
							<tr>
								<td  class="tr1"><s:property
										value="%{#index.count}" /></td>
								<td  class="tr1" style="text-align: left;"><s:property
										value="COL_NO_T2" />
								</td>
								
								<td ><s:property value="TITLE_NAME" />
								</td>
								<td id="rel_s_<s:property value="ID" />" 
									onmouseover="showAdd(this);" onmouseout="hideAdd(this);"
									style="cursor: pointer;text-align: center;"><span
									style="display: none;"><a class="layui-btn layui-btn-xs" href='javascript:void(0);'
										onclick="selectFormCol(this,'<s:property value="ID" />','<s:property value="FORMID" />');"><dict:lang
												value="关联" />
									</a>
								</span></td>
							</tr>
						</s:iterator>
					</table></div></div>

				<s:iterator id="relLs" value="dataMap.relFormColLs" status="index">
					<script>
					var relObj = new Object();
					relObj.id = "<s:property value="#relLs[0].UP_COL_ID" />";
					relObjArr[<s:property value="#index.index" />] = relObj;
					
					var relS = 'rel_s_<s:property value="#relLs[0].UP_COL_ID" />';
					$("#"+relS).css("background","#dfebf7")/*.siblings().css("background","#dfebf7")*/;
					//var sourceObj = getPos(relS);
					//var destinationObj;
				</script>
					<s:if test="#relLs[0].FORM_ID_D != #pri_FORM_ID">
						<s:if test="#relLs[0].UP_COL_ID != #priUP_COL_ID">

							<s:if test="#index.count !=1">
								<%-- 第二个开始补上一个循环的结束标签 --%>
								</td>
								</tr>
								</table>
		</div>
		</s:if>

		<div id="rel_d_<s:property value="#relLs[0].UP_COL_ID" />"
			style="position:absolute; cursor:move; z-index:2;left: <s:property value="#relLs[0].FORM_LEVEL *289 +1" />px;top: <s:property value="#index.count *30" />px;">
			<script type="text/javascript">
							//if(!util.isIE()){
								drag("rel_d_<s:property value="#relLs[0].UP_COL_ID" />",function(){
									//console.log(width);
									contextObj = null;
									contextObj = initCanvas();
									if(util.isIE()){
										contextObj.fillStyle = "#000000";
										contextObj.beginPath();
										contextObj.clearRect(0,0,width,height+200);
										contextObj.closePath();
									}
									offsetCount = 0;
									drawLineNew();
								});
							//}
						</script>
						
			</br></br>
			<table class="table_list" style="width: 500px;"
				style="margin: 0px;padding: 0px;">
				<tr>
					<td style="background: rgb(242,242,242);">

						<div class="div_auto_wrap" style="width: 300px;">
							<div
								style="width: 284px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;font-size:14px;"
								title="<dict:lang value='关联的表单' />">
								<dict:lang value='关联的表单' />
							</div>
							<div >
								<a href="javascript:void(0);"
									onclick="show(this,'rel_d_<s:property value="#relLs[0].UP_COL_ID" />');"
									title="<dict:lang value="显示/隐藏" />">^</a>
							</div>
						</div></td>
				</tr>

				<tr>
					<td style="padding: 0px;"></s:if>

						<table class="_relFormTable table_list"
							style="margin: 0px;padding: 0px;table-layout:fixed;"
							width="500px">
							<tr>
								<th colspan="3"><a style="font-size:14px;"
									href="${path}sys/BussModelAction_viewOrm.ms?viewtype=1&paraMap.MID=1&paraMap.ORMID=<s:property value="#relLs[0].ID_T3" />"
									target="_blank"> <s:property value="#relLs[0].FORM_NAME_T5" />:<s:property
											value="#relLs[0].TABLE_NAME_T3" /> </a></th>
								<th colspan="1" align="center" style="text-align: center;">
									<a href='javascript:void(0);'
									onclick="delRelForm(this,'<s:property value="#relLs[0].MS_FORM_COL_MODEL_ID" />');"
									title="<dict:lang value="移除关联的表单" />"><img
										src="${IMG_PATH}/ContImg10.gif" />
								</a></th>
							</tr>
							<col style="width: 10%" />
							<col style="width: 35%" />
							<col style="width: 35%" />
							<col style="width: 20%" />
							<tbody>

								<s:iterator value="relLs" status="index">
									<tr>
										<td width="60px;" class="tr1"
											id='id_d_<s:property value="ID" />'
											style="word-wrap:break-word;<s:if test="#relLs[0].FORM_COL_ID_D == ID">background: #dfebf7;</s:if>">
											<s:property value="%{#index.count}" /></td>
										<td width="110px;" class="tr1"
											style="word-wrap:break-word;text-align: left;"><s:property
												value="COL_NO_T2" />
										</td>
										<td width="110px;" class="tr2" style="word-wrap:break-word;background: rgb(242,242,242);">
											<s:property value="TITLE_NAME" />
										</td>
										<td id="rel_s_<s:property value="ID" />" class="tr2"
											width="100px" onmouseover="showAdd(this);"
											onmouseout="hideAdd(this);"
											style="cursor: pointer;text-align: center;background: rgb(242,242,242);"><span
											style="display: none;"><a href='javascript:void(0);' class="layui-btn layui-btn-xs"
												onclick="selectFormCol(this,'<s:property value="ID" />','<s:property value="FORMID" />');"><dict:lang
														value="关联" />
											</a>
										</span></td>
									</tr>
								</s:iterator>

							</tbody>
						</table> <s:set name="priUP_COL_ID" value="#relLs[0].UP_COL_ID" /> <s:set
							name="pri_FORM_ID" value="#relLs[0].FORM_ID_D" /> <s:if
							test="#index.count == dataMap.relFormColLs.size ">
							<%-- 最后一个补上结束标签 --%>
					</td>
				</tr>
			</table>
		</div>
		</s:if>
		</s:if>
		<s:else>
			<script type="text/javascript">
						<s:iterator value="relLs" status="index">
							if($('#id_d_<s:property value="ID" />').prop("id") == 'id_d_<s:property value="#relLs[0].FORM_COL_ID_D"/>'){
								$('#id_d_<s:property value="#relLs[0].FORM_COL_ID_D"/>').css("background","#dfebf7")/*.siblings().css("background","#dfebf7")*/;
							}
						</s:iterator>
						</script>
		</s:else>
		</s:iterator>

		</form>
	</div>

	</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame"
		method="post">
		<input type="hidden" id="FORM_COL_ID" name="paraMap.FORM_COL_ID" /> <input
			type="hidden" id="FORM_ID_D_UP" name="paraMap.FORM_ID_D_UP" value="" />
		<input type="hidden" id="FORM_ID_D" name="paraMap.FORM_ID_D" value="" />
		<input type="hidden" id="FORM_ID_S" name="paraMap.FORM_ID_S"
			value="<s:property value="dataMap.formColLs[0].FORMID" />" /> <input
			type="hidden" id="MS_FORM_COL_MODEL_ID"
			name="paraMap.MS_FORM_COL_MODEL_ID" value="" />
	</form>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">

	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
		
	}
	function reloadPgExe(){
		document.listForm.submit();
	}
	
	function closePopWin(){
		hidePopWin(false);
	}
	
	function showAdd(thisObj){
		$(thisObj).find("span").show();
	}
	
	function hideAdd(thisObj){
		$(thisObj).find("span").hide();
	}
	
	var maxZindex = 100;
	function show(thisObj,id){
		if("^" == $(thisObj).text()){
			$(thisObj).text("v");
			$("#"+id).css("z-index", "1");
			$("#"+id).find("table [class='_relFormTable']").hide();
		}else{
			$(thisObj).text("^");
			maxZindex +=1;
			$("#"+id).css("z-index", maxZindex);
			$("#"+id).find("table [class='_relFormTable']").show();
		}
	}

	function selectFormCol(thisObj,ID,FORMID){
		 var mcIframeName = window.frameElement.name; //外层iframe的name
		var FORMID_S = "<s:property value="dataMap.formColLs[0].FORMID" />";
		var url = "${path}sys/BussModelAction_selectFormCol.ms?paraMap.ID="+ID+"&paraMap.FORMID="+FORMID+"&paraMap.FORMID_S="+FORMID_S+"&mcIframeName="+mcIframeName;
		showPopWin(url, 600, 500,null,"<dict:lang value="关联表单字段" /> <dict:lang value="选择" />");
	}
	
	//(this,'<s:property value="ID" />','<s:property value="FORMID" />','<s:property value="FORM_ID_D" />')
	/*
	function delRelForm(thisObj,FORM_COL_ID,FORM_ID_D_UP,FORM_ID_D){
		util.confirm(delConfirm,"<dict:lang value="确认移除关联关系吗"/>?");
		$("#FORM_COL_ID").val(FORM_COL_ID);
		$("#FORM_ID_D_UP").val(FORM_ID_D_UP);
		$("#FORM_ID_D").val(FORM_ID_D);
	}*/
	function delRelForm(thisObj,MS_FORM_COL_MODEL_ID){
		util.confirm(delConfirm,"<dict:lang value="确认移除关联关系吗"/>?");
		$("#MS_FORM_COL_MODEL_ID").val(MS_FORM_COL_MODEL_ID);
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/BussModelAction_delRelForm.ms";
		document.forms.submitForm.submit();
	}
	
	function hideFormList(){
		$("#FormList").hide();
	}
	
	//首次或移动时绘线
	function drawLineNew(){
		//var relFormLs = '<s:property value="dataMap.relFormLs"/>';
		<s:if test="dataMap.relFormLs.size() > 0">
			//contextObj = contextObj == null ? initCanvas() : contextObj;
				<s:iterator id="relFormLs" value="dataMap.relFormLs">
					var startPos = getPos('rel_s_<s:property value="#relFormLs.FORM_COL_ID" />');
					var endPos = getPos('id_d_<s:property value="#relFormLs.FORM_COL_ID_D" />');
					var color = "";
					if(colorMap.get('rel_s_<s:property value="#relFormLs.FORM_COL_ID" />'+'id_d_<s:property value="#relFormLs.FORM_COL_ID_D" />') == null){
						color = util.getRandomColor();
						colorMap.put('rel_s_<s:property value="#relFormLs.FORM_COL_ID" />'+'id_d_<s:property value="#relFormLs.FORM_COL_ID_D" />',color);
					}else{
						color = colorMap.get('rel_s_<s:property value="#relFormLs.FORM_COL_ID" />'+'id_d_<s:property value="#relFormLs.FORM_COL_ID_D" />');
					}
					drawLine(contextObj,startPos,endPos,offsetCount,color);
					offsetCount += 5;
				</s:iterator>
				//drawStrok(contextObj);
		</s:if>
				
	}
	
	function init(){
		<%-- 初始化关联表单的位置 --%>
		for(var i=0,j=relObjArr.length;i<j;i++){
			var relObj = relObjArr[i];
			var upTdJqObj = $("#rel_s_"+relObj.id);
			var offset = upTdJqObj.offset();
			//upTdTop = offset.top;
			//if(!util.isIE()){
				upTdTop = 0;
				$("#rel_d_"+relObj.id).offset({top:upTdTop,left:(offset.left+upTdJqObj.outerWidth()+100)});
			//}else{
			//	upTdTop = offset.top;
			//	$("#rel_d_"+relObj.id).offset({top:upTdTop,left:(offset.left+upTdJqObj.outerWidth())});
			//}
		}

	}
	$(function(){
		contextObj = null;
		contextObj = initCanvas();
		drawLineNew();		
		
	});

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>