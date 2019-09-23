<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
  <%@ include file="/buss/inc_files/inc_dev.jsp"%>
<head>
    <title>
		<dict:lang value="清单打印详情" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="fd43d63021be4eadb08e73d0ac80b243"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	    <script src="${path}plf/page/mlabel/page/labelDesigner/js/jscolor.js"></script>
    <script src="${path}plf/page/mlabel/page/labelDesigner/js/colpick.js"></script>
    <script src="${path}plf/page/mlabel/page/labelDesigner/js/topo.js?version=<%=PRINT_TOPO_JS%>"></script>
	<script type="text/javascript" src="${path}plf/page/mlabel/page/labelDesigner/js/jtopo-min1.js"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/toHex.js"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/spectrum.js"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/businessTopo.js?version=<%=PRINT_BUSINESSTOPO_JS%>"></script>
	<script language="javascript" src="${path}plf/page/mlabel/page/labelDesigner/js/morePrint.js"></script>
	<script src="http://localhost:18000/CLodopfuncs.js?priority=0"></script>
    <script src="http://localhost:8000/CLodopfuncs.js?priority=1"></script>
     <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>
	<style>
	table th,table td{ border:1px solid #000000;text-align: center;} 
	table{ border-collapse:collapse;}
	table th, table td {
    border: 1px solid #000000;
    text-align: center;
    word-break: break-all;
    }
	</style>
</head>

<body style="overflow: auto;">
	<div style="width:100%;border:0px solid;position: relative;" id="headInformation">
		
	</div>
	<div style="width:100%;border:0px solid;position: relative;" id="bodyInformation">
		
	</div>
	<div style="width:100%;border:0px solid;position: relative;"id="footInformation">
		
	</div>
	<script>
	
	localStorage.printResult=1;
	 var DisplayWayData;
	 var topSourceArray;
	 var buttomSourceArray;
		var printListSource=JSON.parse(localStorage.printListSource); //传过来数据
		var itemInfo=printListSource.ITEM_INFO;//打印数据
	    //console.log(printListSource.LABELCSS);
		printListSource=JSON.parse(printListSource.LABELCSS);//打印样式
		var pageInfo=printListSource.page;//页面资料
		var paperWidth;//宽度
		var paperHeight;//高度
    	paperWidth=pageInfo.paperWidth;
		paperHeight=pageInfo.paperHeight;
    	var paperWidthNext=parseFloat(paperWidth)*794/210;
    	var paperHeightNext=parseFloat(paperHeight)*1123/297;
    	var bodyWidth=paperWidthNext+"px";//设置纸张打印内容宽度
    	$("body").css("width",bodyWidth);
		var sourceArray=printListSource.sourceArray;//数据项
		var noSourceArray=printListSource.noSourceArray;//非数据项
		noSourceArray = noSourceArray.concat(sourceArray);
		orderNodeInfo();
		var MaxHeight=(topSourceArray[0].nodeY/(5*paperHeight))*paperHeightNext+(topSourceArray[0].nodeHeight/(5*paperHeight))*paperHeightNext;//设置非数据高度
		for(var i=0;i<topSourceArray.length;i++){
			if(topSourceArray[i].nodeType!="middle"){
				var nodeX=(topSourceArray[i].nodeX/(5*paperWidth))*paperWidthNext+40;
				var nodeY=(topSourceArray[i].nodeY/(5*paperHeight))*paperHeightNext;
				var nodeWidth=(topSourceArray[i].nodeWidth/(5*paperWidth))*paperWidthNext*1+30;
				var nodeHeight=((topSourceArray[i].nodeHeight+10)/(5*paperHeight))*paperHeightNext;
				var tempMaxHeight=nodeY+40;
				if(tempMaxHeight>MaxHeight){
					MaxHeight=tempMaxHeight;
				}
				var classStyle="";
				var dataSource="";
				if(topSourceArray[i].dataSource!=undefined&&topSourceArray[i].dataSource!=""){
					classStyle=topSourceArray[i].dataSource;
				}else{
					dataSource=topSourceArray[i].fontText;
				}
				if(topSourceArray[i].nodeType=="imgType"){
					var imgUrl=topSourceArray[i].imgUrl;
					imgUrl=_GLO_PATH+"up_load/comm/dataItemPic/"+imgUrl.substring(imgUrl.length-36, imgUrl.length);
					var html="<img  src='"+imgUrl+"' style='position:absolute;left:"+nodeX+"px;top:"+nodeY+"px;width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>";
					$("#headInformation").append(html);
				}else if(topSourceArray[i].nodeType=="imgNode"){
					if(classStyle==""){
						nodeWidth=parseInt(nodeWidth);
						nodeHeight=parseInt(nodeHeight);
						var ImgJson=[{"codeId":1,value:topSourceArray[i].fontText,"codeType":topSourceArray[i].barcode,"width":nodeWidth,"height":nodeHeight}];
						var srcResult=addGenerateCode(ImgJson);
						var imgUrl=_GLO_PATH+srcResult.fileUrl.replace(/\\/g,"/");
						nodeWidth=srcResult.width;
						nodeHeightsrcResult.height;
						var html="<img class='"+classStyle+"' src='"+imgUrl+"' style='position:absolute;left:"+nodeX+"px;top:"+nodeY+"px;width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>";
						$("#headInformation").append(html);
					}else{
						var html="<img class='"+classStyle+"' src='"+topSourceArray[i].barcode+"' style='position:absolute;left:"+nodeX+"px;top:"+nodeY+"px;width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>";
						$("#headInformation").append(html);
					}
					
				}
				else{
					var fontSize=topSourceArray[i].fontSize+"px";
					var fontItalic="";
					var fontBold="";
					if(topSourceArray[i].italic!=undefined&&topSourceArray[i].italic=="Italic"){
						fontItalic="font-style: italic";
					}
					if(topSourceArray[i].bold!=undefined&&topSourceArray[i].bold=="Bold"){
						fontBold="font-weight: bold";
					}
					var html="<div class='"+classStyle+"' style='position:absolute;word-wrap: break-word;"+fontItalic+";"+fontBold+";left:"+nodeX+"px;top:"+nodeY+"px;font-size:"+fontSize+";width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>"+dataSource+"</div>";
					$("#headInformation").append(html);
				}
			}
			
			
		}
		
		for(var i=0;i<topSourceArray.length;i++){
			if(topSourceArray[i].fontText.indexOf("TABLE")>-1){
				var html="<table style='position:absolute;top:"+MaxHeight+"px;border: 1px solid;';><tr><td>table"+i+"</td></tr></table>";
				$("body").append(html);
				MaxHeight=MaxHeight+MaxHeight;
			}
			
		}
		addSourceInfo(itemInfo,MaxHeight);
		addButtomInfo();
		
		
		/**
	 	* 添加数据项信息
	 	*/
		function addSourceInfo(itemInfo,MaxHeight){
			var maxValue=1;
			for(var i=0;i<itemInfo.length;i++){
				var displayWay=itemInfo[i].CLD_DISPLAY_WAY;
				if(displayWay=="0"){
					var columnName="."+itemInfo[i].CLD_COLUMN_NAME;
					//$(columnName).html(itemInfo[i].CLD_ITEM_VALUE);
					  $(columnName).each(function(){
						if($(this).attr("src")!=undefined&&$(this).attr("src")!=""){
								var nodeWidth=parseInt($(this).width());
								var nodeHeight=parseInt($(this).height());
								var ImgJson=[{"codeId":1,value:itemInfo[i].CLD_ITEM_VALUE,"codeType":$(this).attr("src"),"width":nodeWidth,"height":nodeHeight}];
								var srcResult=addGenerateCode(ImgJson);
								$(this).attr("src",_GLO_PATH+srcResult.fileUrl.replace(/\\/g,"/"));
								$(this).width(srcResult.width);
								$(this).height(srcResult.height);
								
						}else{
							$(this).html(itemInfo[i].CLD_ITEM_VALUE);
						}
					    
					  });
					
				}else if(displayWay=="1"){
					var cldInfo=itemInfo[i].CLD_ITEM_INFO;
					var columnName="."+itemInfo[i].CLD_COLUMN_NAME;
					var topValue=$(columnName).css('top');
					addValueInfo(cldInfo,MaxHeight,maxValue,itemInfo[i].CLD_TITLE_INFO);
					maxValue++;
				}else if(displayWay=="2"){
					var cldInfo=itemInfo[i].CLD_ITEM_INFO;
					var columnName="."+itemInfo[i].CLD_COLUMN_NAME;
					var topValue=$(columnName).css('top');
					addValueInfoSecond(cldInfo,MaxHeight,maxValue,itemInfo[i].CLD_TITLE_INFO);
					maxValue++;
				}
				
			}
			
		}
	
		function addButtomInfo(){
			if(buttomSourceArray==undefined){
				localStorage.printResult=2;
				return false;
			}
			var buttomMargin=gainMinimumNode();
				for(var i=0;i<buttomSourceArray.length;i++){
					if(buttomSourceArray[i].nodeType!="middle"){
					var nodeX=(buttomSourceArray[i].nodeX/(5*paperWidth))*paperWidthNext+40;
					var nodeY=((buttomSourceArray[i].nodeY-buttomMargin)/(5*paperHeight))*paperHeightNext;
					var nodeWidth=(buttomSourceArray[i].nodeWidth/(5*paperWidth))*paperWidthNext*1+30;
					var nodeHeight=(40/(5*paperHeight))*paperHeightNext;
					var tempMaxHeight=nodeY+40;
					if(tempMaxHeight>MaxHeight){
						MaxHeight=tempMaxHeight;
					}
					var classStyle="";
					var dataSource="";
					if(buttomSourceArray[i].dataSource!=undefined&&buttomSourceArray[i].dataSource!=""){
						classStyle=buttomSourceArray[i].dataSource;
					}else{
						dataSource=buttomSourceArray[i].fontText;
					}
					var fontSize=buttomSourceArray[i].fontSize+"px";
					var fontItalic="";
					var fontBold="";
					if(buttomSourceArray[i].italic!=undefined&&buttomSourceArray[i].italic=="Italic"){
						fontItalic="font-style: italic";
					}
					if(buttomSourceArray[i].bold!=undefined&&buttomSourceArray[i].bold=="Bold"){
						fontBold="font-weight: bold";
					}
					
					var html="<div class='"+classStyle+"' style='position:absolute;"+fontItalic+";"+fontBold+";left:"+nodeX+"px;top:"+nodeY+"px;font-size:"+fontSize+";width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>"+dataSource+"</div>";
				}
				
				$("#footInformation").append(html);
			}
				localStorage.printResult=2;
		}
		
		/**
	 	* 添加内容
	 	*/
		function addValueInfo(resultList,topValue,maxValue,columnData){
			var allColumn=0;
			var tableIdNext="table"+maxValue;
			var resultListValue=resultList[0];
			var html="";
			topValue=topValue+5;
			var nodeWidth=0;
			var fontSize="12px";
			if(DisplayWayData!=undefined){
				var nodeWidth=(DisplayWayData.nodeWidth/(5*paperWidth))*paperWidthNext*1+10;
				fontSize=DisplayWayData.fontSize+"px";
			}
			if(maxValue==1){
				html="<div style='width:100%'><table style='margin-top:"+topValue+"px;margin-left:"+nodeWidth+"px;font-size:"+fontSize+" ;border:1;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><tr>";
			}else{
				var height=topValue;
				for(var i=1;i<maxValue;i++){
					var tableId="#table"+i;
					height+=$(tableId).outerHeight(); 
				}
				html="<div style='width:100%'><table style='margin-top:"+10+"px;margin-left:"+nodeWidth+"px;font-size:"+fontSize+" ;border:1;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><thead><tr>";
			}
			
			
			var keyName=new Array();
			 for (var key in resultListValue){
				 keyName.push(key);
			 }
			 
			 
			 for(var i=0;i<keyName.length;i++){
				 var result=getColumnProperty(columnData,keyName[i]);
				 	var width=result.CLD_COLUMN_WIDTH;
					html+="<td style='word-break: break-all;width:"+width+"px'>"+keyName[i]+"</td>";
					allColumn+=width;
				}
				html+="</thead></tr>";
			for(var i=0;i<resultList.length;i++){
				html+="<tr>";
				var result=resultList[i];
				for(var j=0;j<keyName.length;j++){
					html+="<td>"+resultList[i][keyName[j]]+"</td>";
				}
				html+="</tr>";
				
			}
			
			$("#bodyInformation").append(html+"</table></div>");
			tableIdNext="#"+tableIdNext;
			$(tableIdNext).css("width",allColumn);
			
			
		}
		
		function printTableValue(){
			
		}
		
		//添加内容值
		function addValueInfoSecond(resultList,topValue,maxValue,columnData){
			 var tableIdNext="table"+maxValue;
			 var allColumn=0;
			var resultListValue=resultList[0];
			var html="";
			topValue=topValue+5;
			var leftMargin=0;
			if(DisplayWayData==undefined){
				leftMargin=80;
			}else{
				var leftMargin=(DisplayWayData.nodeX/(5*paperWidth))*paperWidthNext*1+10;
			}
			if(maxValue==1){
				html="<table style='margin-top:"+topValue+"px;margin-left:"+leftMargin+"px; border:1;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><tr>";
			}else{
				var height=topValue;
				for(var i=1;i<maxValue;i++){
					var tableId="#table"+i;
					height+=$(tableId).outerHeight(); 
				}
				html="<table style='top:"+height+"px;border:1;margin-left:"+leftMargin+"px;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><tr>";
			}
			
			
			var keyName=new Array();
			 for (var key in resultListValue){
				 keyName.push(key);
			 }
			 
			 var result=getColumnProperty(columnData,keyName[0]);
			 var addValue=0;
			 var column=parseInt(result.CLD_COLUMN);
			 for(var i=0;i<resultList.length;i++){
				 	if(addValue<column){
						var result=resultList[i];
						html+="<td>"+resultList[i][keyName[0]]+"</td>";
						addValue++;
					}else{
						html+="</tr>";
						html+="<td>"+resultList[i][keyName[0]]+"</td>";
						addValue=0;
						addValue++;
					}
				}
				html+="</tr>";
			$("#bodyInformation").append(html+"</table>");
			//tableIdNext="#"+tableIdNext;
			//$(tableIdNext).css("width",allColumn);
		}
		
		
		
		/**
		 *获取列宽度
		 */
		function getColumnProperty(columnData,columnName){
			var columnProperty;
			for(var i=0;i<columnData.length;i++){
				if(columnName==columnData[i].CLD_COLUMN_NAME){
					columnProperty=columnData[i];break;
				}
			}
			return columnProperty;
		}
		
	
		/**
		 *重新排序节点位置
		 */
		
		function orderNodeInfo(){
			topSourceArrayValue=new Array();
			var buttomSoruceArrayValue=new Array();
			var displayWayArray=new Array();
			for(var i=0;i<noSourceArray.length;i++){
				for(var j=0;j<itemInfo.length;j++){
					if((noSourceArray[i].dataSource==itemInfo[j].CLD_COLUMN_NAME)&&(itemInfo[j].CLD_DISPLAY_WAY=="1"||itemInfo[j].CLD_DISPLAY_WAY=="2")){
						DisplayWayData=noSourceArray[i];
						displayWayArray.push(noSourceArray[i]);
					}
				}
			}
			if(DisplayWayData!=undefined){
				for(var i=0;i<noSourceArray.length;i++){
					if((noSourceArray[i].nodeY>=DisplayWayData.nodeY)&&(noSourceArray[i].dataSource!=DisplayWayData.dataSource)){
						buttomSoruceArrayValue.push(noSourceArray[i]);
					}else if(!validateDisplayWay(displayWayArray,noSourceArray[i])){
						topSourceArrayValue.push(noSourceArray[i]);
					}
				}
				topSourceArray=topSourceArrayValue;
				buttomSourceArray=buttomSoruceArrayValue;
			}else{
				topSourceArray=noSourceArray;
			}
			
		}
		
		/**
		 *验证table数据是否存在
		 */
		function validateDisplayWay(displayWayArray,currentNode){
			var tempResult=false;
			for(var i=0;i<displayWayArray.length;i++){
				if(displayWayArray[i]==currentNode){
					tempResult=true;break;
				}
			}
			return tempResult;
		}
		
		/**
		 *重新排序底部节点位置
		 */
		function gainMinimumNode(){
			if((buttomSourceArray==undefined)||(buttomSourceArray.length==0)){
				return 0;
			}
			var beginNode=buttomSourceArray[0];
				for(var i=0;i<buttomSourceArray.length;i++){
					if(buttomSourceArray[i].nodeY<=beginNode.nodeY){
						beginNode=buttomSourceArray[i];
					}
				}
		
			var minNodeY=beginNode.nodeY;
			return minNodeY;
		}
		
		
		
		/**
		 *添加条形码
		 */
		function addGenerateCode(jsonData){
			var resultImg="";
			var codeValue=JSON.stringify(jsonData);
			$.ajax({
	            url : "buss/bussModel_exeFunc.ms?funcMId=b16b72ca40a042d887334b24b7c590f2",
	            data : {codeValue:codeValue},
	            type : "post",
	            dataType : "json",
	            async:false,
	            success : function(data) { 
	             	var dataResult=data.ajaxMap.result;
	             	if(dataResult.length>0){
	             		resultImg= dataResult[0];
	             	}
	             	
	            },
	            error : function(msg) {
	              util.closeLoading();
	              utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
	                  0, "300", "");
	            }
	          });
			return resultImg;
		}
		
	</script>  
	
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
