<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param value="HotKey" name="1"/>
	<jsp:param name="spectrum" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
<style type="text/css">
		.all {
	width: 100%;
	}

	.cursor_hand {
	cursor: pointer;
	}
	.hd{
	    height: 30px;
    	line-height: 30px;
    	margin-bottom: -1px;
	}
	.optn {
    position: absolute;
    right: 0;
    top: 0px;
	}
	
	.func_table {
    width: 100%;
    color: #1133ae;
    margin-bottom: 1px;
    height: 21px;
    line-height: 21px;
	}
	
	.func_table2{
    width: 100%;
    color: #1133ae;
    border: solid 1px #a8c7ce;
    margin-bottom: 1px;
    background-color: #74bff7;
    height: 30px;
    line-height: 21px;
	}
	
	td input[type="button"]{
		border: 1px solid #aace36;
	    border-radius: 2px;
	    background-color: #fff;
	    color: #666;
	    height: 28px;
	    line-height: 26px;
	    padding: 0 10px;
	    margin-right: 6px;
	    cursor: pointer;
	    float: right;
	  
	}
	
	td input[type="button"]:hover{
		background-color: #aace36;
	    color: #fff;
	}
	
	.addTable{
		width:90%;
	}
	.addTable th{
		border: 1px solid #ccc;
		color: #f8fcff;
		background-color:#74bff7;
	}
	.addTable tr{
		height:30px;
	
	}
	.addTable td{
		height:30px;
		border: 1px solid #ccc;
		text-align:center;
	}
	
	.leftdiv{
		 width:50%;
		 float:left;
	}
	.rightdiv{
		 width:50%;
		 float:right;
	}
	
	.rightdiv td{
		 width:50%;
		 border:1px solid #ccc;
		 box-sizing:border-box;
		 height: 28px;
	}
	.rightdiv .title{
		padding:0 5px;
		text-align:right;
	}
	.rightdiv .centent input[type='text'],.rightdiv .centent select{
		width:100%;
		border:0;
		outline: none;
	}
	.rightdiv .centent input[type='checkbox']{
		width:20px;
		height:20px;
	}
</style>
</head>
<body style="background-color:#fff;">
	
	<div class="all">
		<form id="addData" name="addData" target="submitFrame">
			<div id="div_head" style="background-color: #f6f5f7;">
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<table width="100%"    style=" height: 38px;">
							<tr>
									<td align="left" width="400px" style="padding-left: 30px;">
											
											<div class="hd">
							                 <div class="optn">
							                 <table >
								                 <tr>
													<td width="100%" align="right" >
												   	<button type="button" onclick="return commit(this);" style="margin-top: 4px" ><i class="ico ico-save"></i><dict:lang value="提交" /></button>
												    <button type="button" onclick="closeWindow();"><i class="ico ico-sc"></i><dict:lang value="取消" /></button>
													</td>
									    		</tr>
											</table>
											</div>
											</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="leftdiv">
			<div id="div_changeForSQL" style="margin:10px;background-color: #fff;height:230px;">
				<table class="func_table2">	
								<tr>
									<td align="left" width="400px"  style="font-size: 13px;padding-left:5px;line-height:30px;position: relative;">数据库适配:&nbsp;<label
										for="sqlType_comm" class="cursor_hand"><input
											type="radio" id="sqlType_comm" name="paraMap.sqlType" value="commsql"
											/>通用</label>
											&nbsp;&nbsp;
										<label for="sqlType_oracle" class="cursor_hand"><input
											type="radio" id="sqlType_oracle" name="paraMap.sqlType"  value="oracle"
										     />ORACLE</label>
										    &nbsp;&nbsp;
										<label for="sqlType_mysql" class="cursor_hand"><input
											type="radio" id="sqlType_mysql" name="paraMap.sqlType" value="mysql"
											 />MYSQL</label>
											&nbsp;&nbsp;
										<label for="sqlType_sqlserver" class="cursor_hand"><input
											type="radio" id="sqlType_sqlserver" name="paraMap.sqlType" value="sqlserver"
											/>SQLSERVER</label>
											
										
										<input id="analyButton" type="button" onclick="analySql()" style="display: none;margin-right:25px;margin-top: 1px;" value="<dict:lang value='解析' />" />
										<input id="confirmButton" style="display: none;margin-top: 1px;" type="button" onclick="showSqlParam()" value="<dict:lang value='确定' />" />
										
									</td>
								</tr>
							</table>
				<div id="div_changeForSQLName"  >
						<table style="width: 100%;">
							<tr>
								<td>
									<textarea id="comm_sql" name="paraMap.comm_sql" rows="6"
									style="width: 100%;overflow:scroll;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
									<textarea id="oracle_sql" name="paraMap.oracle_sql" rows="6"
									style="width: 100%;overflow:scroll;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
									<textarea id="sqlserver_sql" name="paraMap.sqlserver_sql" rows="6" 
									style="width: 100%;overflow:scroll;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
									<textarea id="mysql_sql" name="paraMap.mysql_sql" rows="6" 
									style="width: 100%;overflow:scroll;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
								</td>
							</tr>
						</table>
						
				</div>
			</div>
				
			
			<div id="div_sql_param" style="padding: 0 10px;" >
					<table style="height: 100%;width: 100%;" id="addSqlTable" class="addTable" >
						<thead>
							<th style='height:30px;width:10%;text-align:center'><dict:lang value="序号" /></th>
							<th style="height:30px;width:45%;text-align:center"><dict:lang value="参数名" /></th>
							<th style="height:30px;width:45%;text-align:center;"><dict:lang value="参数值" /></th>
						</thead>
						<tbody id="sqlTbody">
						
						</tbody>
					</table>
			</div>
				<s:hidden id="DATA_COMMENT_ID" name="paraMap.DATA_COMMENT_ID"/>
				<s:textarea  id="DATA_COMMENT_VALUE" name="paraMap.DATA_COMMENT_VALUE" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:hidden id="PARA_ARGS_ID" name="paraMap.PARA_ARGS_ID"/>
				<s:hidden id="PARA_ARGS_VALUE" name="paraMap.PARA_ARGS_VALUE"/>
				<s:hidden id="COL_PRO_ID" name="paraMap.COL_PRO_ID"/>
				<s:hidden id="COL_PRO_VALUE" name="paraMap.COL_PRO_VALUE"/>
				<s:hidden id="CHARTS_CONFIG_ID" name="paraMap.CHARTS_CONFIG_ID"/>
				<s:hidden id="BUTTON_ID" name="paraMap.BUTTON_ID"/>
				<s:hidden id="parentiframeId" name="iframeId"/><!-- 父表单的iframe	-->
				<s:hidden id="DELETE_FLAG" name="paraMap.DELETE_FLAG"/>
				<s:hidden id="curDataType" name="curDataType"/>
				<s:textarea  id="COMM_SQL_ID" name="paraMap.COMM_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:textarea  id="ORACLE_SQL_ID" name="paraMap.ORACLE_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:textarea  id="SQLSERVER_SQL_ID" name="paraMap.SQLSERVER_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:textarea  id="MYSQL_SQL_ID" name="paraMap.MYSQL_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				</div>
				<div class="rightdiv">
					<div style="margin:10px;overflow:auto;height:540px;border-top:1px solid #ccc;border-bottom:1px solid #ccc;box-sizing:border-box;">
						<table style="width:100%;table-layout: fixed;" cellspacing="0" cellpadding="0">
							<tr>
								<td class="title">标题</td>
								<td class="centent" >
									<input type="text" id="titleText" class="input" name="chartsConfig.titleText"/>
								</td>
							</tr>
							<tr>
								<td class="title">副标题</td>
								<td class="centent">
									<input type="text"  id="titleSubtext" class="input" name="chartsConfig.titleSubtext"/>
								</td>
							</tr>
							<tr>
								<td class="title">标题字体</td>
								<td class="centent">
									<select  id="titleTextFontFamily">
										<option name="chartsConfig.titleTextFontFamily" value="宋体" >宋体</option>
										<option name="chartsConfig.titleTextFontFamily" value="黑体">黑体</option>
										<option name="chartsConfig.titleTextFontFamily" value="sans-serif" >sans-serif</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">标题颜色</td>
								<td class="centent">
									<input type="text" id="titleColor"  class="input" value="#000000" name="chartsConfig.titletextColor"/>
								</td>
							</tr>
							<tr>
								<td class="title">标题字号</td>
								<td class="centent">
									<input type="text"  id="titleFontSize"  class="input" value="15" name="chartsConfig.titletextFontSize" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
								</td>
							</tr>
							<tr>
								<td class="title">标题文字样式</td>
								<td class="centent">
									<select id="titleTextFontWeight" >
										<option name="chartsConfig.titleTextFontWeight" value="normal">正常</option>
										<option name="chartsConfig.titleTextFontWeight" value="bold">粗体</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">副标题字体</td>
								<td class="centent" >
									<select id="titleSubtextFontFamily">
										<option name="chartsConfig.titleSubtextFontFamily" value="宋体" >宋体</option>
										<option name="chartsConfig.titleSubtextFontFamily" value="黑体">黑体</option>
										<option name="chartsConfig.titleSubtextFontFamily" value="sans-serif">sans-serif</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">副标题颜色</td>
								<td class="centent">
									<input type="text" id="titleSubtextColor" class="input" value="#CCCCCC" name="chartsConfig.titleSubtextColor"/>
								</td>
							</tr>
							<tr>
								<td class="title">副标题字号</td>
								<td class="centent">
									<input type="text" id="titleSubtextFontSize" class="input" value="12" name="chartsConfig.titleSubtextFontSize" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
								</td>
							</tr>
							<tr>
								<td class="title">副标题文本样式</td>
								<td class="centent">
									<select id="titleSubtextFontWeight">
										<option name="chartsConfig.titleSubtextFontWeight" value="normal">正常</option>
										<option name="chartsConfig.titleSubtextFontWeight" value="bold">粗体</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">画布宽度(像素绝对值)</td>
								<td class="centent">
									<input type="text" id="canvasWidth" class="input" placeholder="像素绝对值" value="600" name="chartsConfig.canvasWidth" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
								</td>
							</tr>
							<tr>
								<td class="title">画布高度(像素绝对值)</td>
								<td class="centent">
									<input type="text" id="canvasHeight" class="input" placeholder="像素绝对值" value="600" name="chartsConfig.canvasHeight" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
								</td>
							</tr>
							<tr>
								<td class="title">是否显示加载动画</td>
								<td class="centent">
									<select  id="animation">
										<option name="chartsConfig.animation" value="1">显示</option>
										<option name="chartsConfig.animation" value="0">不显示</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">饼图点击事件</td>
								<td class="centent"  >
									<input type="text"  id="eventClick" class="input" name="chartsConfig.eventClick"/>
								</td>
							</tr>
							<tr>
								<td class="title">背景图url</td>
								<td class="centent">
									<input type="text"  id="backgroundUrl" class="input" name="chartsConfig.backgroundUrl"/>
								</td>
							</tr>
							<tr>
								<td class="title">背景图透明度(100为不透明,0为完全透明)</td>
								<td class="centent">
									<input type="text"  id="backgroundAlpha" class="input" placeholder="100为完全不透明，0为完全透明" value="100"name="chartsConfig.backgroundAlpha" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
								</td>
							</tr>
							<tr>
								<td class="title">图例说明的排列方式</td>
								<td class="centent">
									<select  id="legendOrient">
										<option name="pie.legendOrient" value="vertical">竖向排列</option>
										<option name="pie.legendOrient" value="horizontal">横向排列</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">图例说明的水平位置</td>
								<td class="centent">
									<select  id="legendX"> 
										<option name="pie.legendX"  value="left">居左</option>
										<option name="pie.legendX" value="center">居中</option>
										<option name="pie.legendX" value="right">居右</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">图例说明的垂直位置</td>
								<td class="centent"  >
									<select id="legendY">
										<option name="pie.legendY" value="left">居左</option>
										<option name="pie.legendY" value="center">居中</option>
										<option name="pie.legendY" value="right">居右</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">是否显示标签</td>
								<td class="centent">
									<select  id="labelNormalShow">
										<option name="pie.labelNormalShow"  value="1">显示</option>
										<option name="pie.labelNormalShow"  value="0">不显示</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">标签内容</td>
								<td class="centent">
									<label><input  id="labelFormatterC" type="checkbox" class="input" name="pie.labelFormatterC" value="1"/>分类数值</label>&#x3000;&#x3000;
									<label><input  id="labelFormatterD" type="checkbox" class="input" name="pie.labelFormatterD" value="1"/>分类百分比</label>
								</td>
							</tr>
							<tr>
								<td class="title">鼠标指上时是否显示提示信息</td>
								<td class="centent" id="canvasWidth" >
									<select id="tooltipTrigger">
										<option name="pie.tooltipTrigger" value="item">显示</option>
										<option name="pie.tooltipTrigger" value="none">不显示</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="title">提示信息上的标题</td>
								<td class="centent" >
									<input type="text"  id="seriesName" class="input" name="pie.seriesName"/>
								</td>
							</tr>
							<tr>
								<td class="title">图形显示面积(%)</td>
								<td class="centent" >
									<input type="text"  id="seriesRadius" class="input"  value="60" name="pie.seriesRadius" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
								</td>
							</tr>
							<tr>
								<td class="title">饼图圆心x轴位置(%)</td>
								<td class="centent" >
									<input type="text"  id="seriesCenterX" class="input"  value="50" name="pie.seriesCenterX" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
								</td>
							</tr>
							<tr>
								<td class="title">饼图圆心y轴位置(%)</td>
								<td class="centent" >
									<input type="text"  id="seriesCenterY" class="input"  value="50" name="pie.seriesCenterY" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
								</td>
							</tr>
							
						</table>
					</div>
				</div>
				<input type="hidden" id="chType" name="chartsConfig.type" value="1"/>
				<input type="hidden" id="chId" name="chartsConfig.id" value="1"/>
				</form>
</div>

<script>
	var flag;
	var type;
	var isChange = false;//为了判断是否有更改内容
	var isParaChange = false;//为了判断是否有更改内容
	var analySucess=false;
	var isDel=false;
	var isAnaly=false;//判断是否点击解析
	var isAnalyOther=false;//判断sql当前数据库是否解析成功;
	var isAnalyCommon=false;//判断sql通用是否解析成功；
	var isConfirmButton=false;
	var curDataType="<s:property value="curDataType" />";
	var _codeType= "<s:property value="paraMap.CODE_TYPE_VALUE" />";
	var DATA_TYPE="";
	
	 $('.dialog-bd',parent.document).css('padding','0');
	 function Height(){
	      $('.scroll').mCustomScrollbar({
	        scrollInertia:150,
	        autoHideScrollbar:true
	      });
	      $('.btable').parent().css('margin','0');
	 }
	 Height();
	 $(window).resize(function(){
	      $('.scroll').mCustomScrollbar("destroy");
	      Height();
	 });
	function textChange(){
		 isChange=true;
	}
	function paraChange(){
		 isParaChange=true;
	}	 
	function init() {//页面初始化数值
		var COL_PRO_VALUE = $("#COL_PRO_VALUE").val();
		var parentiframeId = $("#parentiframeId").val();
		var DATA_COMMENT_ID = $("#DATA_COMMENT_ID").val();
		var COMM_SQL_ID = $("#COMM_SQL_ID").val();
		var MYSQL_SQL_ID = $("#MYSQL_SQL_ID").val();
		var ORACLE_SQL_ID = $("#ORACLE_SQL_ID").val();
		var SQLSERVER_SQL_ID = $("#SQLSERVER_SQL_ID").val();
		var PARA_ARGS_VALUE = $("#PARA_ARGS_VALUE").val();
		var DATA_COMMENT_VALUE = $("#DATA_COMMENT_VALUE").val();
		var CHARTS_CONFIG_ID=$("#CHARTS_CONFIG_ID").val();
		var parentFrame = top.document.getElementById(parentiframeId);//获取到父iframe对象
		var parentDATA_COMMENT_ID = parentFrame.contentWindow.document
				.getElementById(DATA_COMMENT_ID);
		var parentSQLSERVER_SQL_ID = parentFrame.contentWindow.document
				.getElementById(SQLSERVER_SQL_ID);
		var parentMYSQL_SQL_ID = parentFrame.contentWindow.document
				.getElementById(MYSQL_SQL_ID);
		var parentCOMM_SQL_ID = parentFrame.contentWindow.document
				.getElementById(COMM_SQL_ID);
		var parentORACLE_SQL_ID = parentFrame.contentWindow.document
				.getElementById(ORACLE_SQL_ID);
		var parentCHARTS_CONFIG_ID = parentFrame.contentWindow.document
		.getElementById(CHARTS_CONFIG_ID);
		var titleColor =null;
		var Subtext =null;
		if(parentCHARTS_CONFIG_ID.value==""){
			$("#comm_sql").val("");
			$("#oracle_sql").val("");
			$("#sqlserver_sql").val("");
			$("#mysql_sql").val("");
			$("#div_changeForSQLName").show();
			$("#div_changeForSQL").show();
			if (curDataType == 'oracle') {
				$("#sqlType_oracle").attr("checked", 'checked');
				$("#oracle_sql").show();
			} else if (curDataType == 'sqlserver') {
				$("#sqlType_sqlserver").attr("checked", 'checked');
				$("#sqlserver_sql").show();
			} else if (curDataType == 'mysql') {
				$("#sqlType_mysql").attr("checked", 'checked');
				$("#mysql_sql").show();
			} 
			$("#analyButton").show();
			$("#confirmButton").show();
			var spec1 = $("#titleColor").spectrum({
				color: "#000000",
			    showInput: true,
			    className: "full-spectrum",
			    showInitial: true,
			    showPaletteOnly: true,
			    showSelectionPalette: true,
			    maxSelectionSize: 10,
			    preferredFormat: "hex",
			    cancelText:$("#colorPickerCancle").val(),
			    chooseText:$("#colorPickerChoose").val(),
			    togglePaletteOnly:true,
			    togglePaletteMoreText:$("#togglePaletteMoreText").val(),
			    togglePaletteLessText:$("#togglePaletteLessText").val(),					    
			    localStorageKey:false,
			   // localStorageKey: "spectrum.demo",
			    move: function (color) {
			        
			    },
			    show: function () {
			    
			    },
			    beforeShow: function () {
			    
			    },
			    hide: function () {
			    },
			    change: function() {

			    },
			    palette: [
			        ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)",
			        "rgb(204, 204, 204)", "rgb(217, 217, 217)","rgb(255, 255, 255)"],
			        ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
			        "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"], 
			        ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)", 
			        "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)", 
			        "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)", 
			        "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)", 
			        "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)", 
			        "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
			        "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
			        "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
			        "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)", 
			        "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
			    ]
			});
			var spec2 = $("#titleSubtextColor").spectrum({
				color: "#000000",
			    showInput: true,
			    className: "full-spectrum",
			    showInitial: true,
			    showPaletteOnly: true,
			    showSelectionPalette: true,
			    maxSelectionSize: 10,
			    preferredFormat: "hex",
			    cancelText:$("#colorPickerCancle").val(),
			    chooseText:$("#colorPickerChoose").val(),
			    togglePaletteOnly:true,
			    togglePaletteMoreText:$("#togglePaletteMoreText").val(),
			    togglePaletteLessText:$("#togglePaletteLessText").val(),					    
			    localStorageKey:false,
			   // localStorageKey: "spectrum.demo",
			    move: function (color) {
			        
			    },
			    show: function () {
			    
			    },
			    beforeShow: function () {
			    
			    },
			    hide: function () {
			    },
			    change: function() {

			    },
			    palette: [
			        ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)",
			        "rgb(204, 204, 204)", "rgb(217, 217, 217)","rgb(255, 255, 255)"],
			        ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
			        "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"], 
			        ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)", 
			        "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)", 
			        "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)", 
			        "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)", 
			        "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)", 
			        "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
			        "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
			        "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
			        "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)", 
			        "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
			    ]
			});
			return;
		}
		
		var chartsConfigJson=parentCHARTS_CONFIG_ID.value;//字符串转换
		chartsConfigJson=eval('('+chartsConfigJson+')')//饼图公共属性json字符串转换
		
		var chartsOtherJson=chartsConfigJson.other
		chartsOtherJson=eval('('+chartsOtherJson+')')//饼图私有属性json字符串转换
		//-----------------饼图页面初始化值--------------
		$("#chId").val(chartsConfigJson.id);
		$("#chType").val(chartsConfigJson.type);
		$("#titleText").val(chartsConfigJson.titleText);//主标题
		$("#titleTextFontFamily").val(chartsConfigJson.titleTextFontFamily);//主标题字体
		$("#titleColor").val(chartsConfigJson.titleTextColor);//主标题颜色
		var spec1 = $("#titleColor").spectrum({
			color: chartsConfigJson.titleTextColor,
		    showInput: true,
		    className: "full-spectrum",
		    showInitial: true,
		    showPaletteOnly: true,
		    showSelectionPalette: true,
		    maxSelectionSize: 10,
		    preferredFormat: "hex",
		    cancelText:$("#colorPickerCancle").val(),
		    chooseText:$("#colorPickerChoose").val(),
		    togglePaletteOnly:true,
		    togglePaletteMoreText:$("#togglePaletteMoreText").val(),
		    togglePaletteLessText:$("#togglePaletteLessText").val(),					    
		    localStorageKey:false,
		   // localStorageKey: "spectrum.demo",
		    move: function (color) {
		        
		    },
		    show: function () {
		    
		    },
		    beforeShow: function () {
		    
		    },
		    hide: function () {
		    },
		    change: function() {

		    },
		    palette: [
		        ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)",
		        "rgb(204, 204, 204)", "rgb(217, 217, 217)","rgb(255, 255, 255)"],
		        ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
		        "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"], 
		        ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)", 
		        "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)", 
		        "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)", 
		        "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)", 
		        "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)", 
		        "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
		        "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
		        "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
		        "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)", 
		        "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
		    ]
		});
		
		$("#titleFontSize").val(chartsConfigJson.titleTextFontSize);//主标题字号
		$("#titleTextFontWeight").val(chartsConfigJson.titleTextFontWeight);//主标题文字样式
		$("#titleSubtext").val(chartsConfigJson.titleSubtext);//副标题
		$("#titleSubtextFontFamily").val(chartsConfigJson.titleSubtextFontFamily);//副标题字体
		$("#titleSubtextColor").val(chartsConfigJson.titleSubtextColor);//副标题颜色
		var spec1 = $("#titleSubtextColor").spectrum({
			color: chartsConfigJson.titleSubtextColor,
		    showInput: true,
		    className: "full-spectrum",
		    showInitial: true,
		    showPaletteOnly: true,
		    showSelectionPalette: true,
		    maxSelectionSize: 10,
		    preferredFormat: "hex",
		    cancelText:$("#colorPickerCancle").val(),
		    chooseText:$("#colorPickerChoose").val(),
		    togglePaletteOnly:true,
		    togglePaletteMoreText:$("#togglePaletteMoreText").val(),
		    togglePaletteLessText:$("#togglePaletteLessText").val(),					    
		    localStorageKey:false,
		   // localStorageKey: "spectrum.demo",
		    move: function (color) {
		        
		    },
		    show: function () {
		    
		    },
		    beforeShow: function () {
		    
		    },
		    hide: function () {
		    },
		    change: function() {

		    },
		    palette: [
		        ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)",
		        "rgb(204, 204, 204)", "rgb(217, 217, 217)","rgb(255, 255, 255)"],
		        ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
		        "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"], 
		        ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)", 
		        "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)", 
		        "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)", 
		        "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)", 
		        "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)", 
		        "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
		        "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
		        "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
		        "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)", 
		        "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
		    ]
		});
		$("#titleSubtextFontSize").val(chartsConfigJson.titleSubtextFontSize);//副标题字号
		$("#titleSubtextFontWeight").val(chartsConfigJson.titleSubtextFontWeight);//副标题文字样式
		$("#animation").val(chartsConfigJson.animation);//是否显示加载动画	
		$("#eventClick").val(chartsConfigJson.eventClick);//饼图点击事件
		$("#backgroundUrl").val(chartsConfigJson.backgroundUrl);//背景图url
		$("#backgroundAlpha").val(chartsConfigJson.backgroundAlpha);//背景图透明度
		$("#canvasHeight").val(chartsConfigJson.canvasHeight);//画布高度	
		$("#canvasWidth").val(chartsConfigJson.canvasWidth);//画布宽度
		$("#seriesName").val(chartsOtherJson.seriesName);//提示信息上的标题
		$("#seriesRadius").val(chartsOtherJson.seriesRadius);//图形显示面积(可填页面百分比或绝对值)
		$("#seriesCenterX").val(chartsOtherJson.seriesCenterX);//饼图圆心x轴位置(可填页面百分比或坐标绝对值)
		$("#seriesCenterY").val(chartsOtherJson.seriesCenterY);//饼图圆心y轴位置(可填页面百分比或坐标绝对值)
		$("#tooltipTrigger").val(chartsOtherJson.tooltipTrigger);//鼠标指上时是否显示提示信息
		if(chartsOtherJson.labelNormalShow!=null&&chartsOtherJson.labelNormalShow==true){
			$("#labelNormalShow").val("1");//是否显示标签
		}
		if(chartsOtherJson.labelNormalShow!=null&&chartsOtherJson.labelNormalShow==false){
			$("#labelNormalShow").val("0");//是否显示标签
		}
		$("#legendOrient").val(chartsOtherJson.legendOrient);//图例说明的排列方式
		$("#legendX").val(chartsOtherJson.legendX);//图例说明的水平位置
		$("#legendY").val(chartsOtherJson.legendY);//图例说明的垂直位置
		//$("#legendLength").val(chartsOtherJson.legendLength);//图例显示文字长度
		$("#labelFormatterA").val(chartsOtherJson.labelFormatterA);//
		$("#labelFormatterB").val(chartsOtherJson.labelFormatterB);//
		if(chartsOtherJson.labelFormatterC!=null&&chartsOtherJson.labelFormatterC=="true"){
			$(":checkbox[id=labelFormatterC]").prop("checked",true);
		}
		if(chartsOtherJson.labelFormatterD!=null&&chartsOtherJson.labelFormatterD=="true"){
			$(":checkbox[id=labelFormatterD]").prop("checked",true);
		}
		//------------------------------------------------------------
		$("#comm_sql").val(parentCOMM_SQL_ID.value);
		$("#oracle_sql").val(parentORACLE_SQL_ID.value);
		$("#sqlserver_sql").val(parentSQLSERVER_SQL_ID.value);
		$("#mysql_sql").val(parentMYSQL_SQL_ID.value);
		if(PARA_ARGS_VALUE!=""){
			var arr = PARA_ARGS_VALUE.split(",");
			var name;
			var addSqlTableBody = "";
			var j = 1;
			for ( var i = 0; i < arr.length; i++) {
				if (arr[i] == "") {
					continue;
				}
				name = arr[i].split("=");
				if(i==0){
					addSqlTableBody="<thead>"
					+"<tr>"
					+"  <th style='width:25px;text-align:center'><dict:lang value='序号' /></th>"
					+"	<th style='width:75px;text-align:center;'><dict:lang value='参数名' /></th>"
					+"  <th style=\"width:75px;text-align:center;\"><dict:lang value='参数值' /></th>"
					+" </tr>"
					+" </thead>"
					+"<tbody >"
					
				}
				 if((i%2)==0){
					 addSqlTableBody += "<tr>"
				 }else{
					 addSqlTableBody += "<tr class=\"tr-hover\">"
				 }
				addSqlTableBody +=  "<td align='center'style=\"width:10%;\">"
						+ j
						+ "</td>"
						+ "<td align='center' style=\"width:45%;\"><input type='hidden' value='"+name[0]+"'><dict:lang value='"+name[0]+"' /></input></td>"
						+ "<td align='center' onchange=\"paraChange()\" style=\"width:45%;\"><select id='select_"+i+"' class='dept_select'>"
				if (name[1] == 0) {
					addSqlTableBody += "<option value='0' selected ><dict:lang value='用户Id' /></option>"
				} else {
					addSqlTableBody += "<option value='0' ><dict:lang value='用户Id' /></option>"
				}
				if (name[1] == 1) {
					addSqlTableBody += "<option value='1' selected><dict:lang value='用户名称' /></option>"
				} else {
					addSqlTableBody += "<option value='1'><dict:lang value='用户名称' /></option>"
				}
				if (name[1] == 2) {
					addSqlTableBody += "<option value='2' selected><dict:lang value='部门Id' /></option>"
				} else {
					addSqlTableBody += "<option value='2'><dict:lang value='部门Id' /></option>"
				}
				if (name[1] == 3) {
					addSqlTableBody += "<option value='3' selected><dict:lang value='当前时间' /></option>"
				} else {
					addSqlTableBody += "<option value='3'><dict:lang value='当前时间' /></option>"
				}
				+"</select></td></tr></tbody>";
				j++;
			}
			addSqlTableBody += "</tbody>";
			$("#addSqlTable").html(addSqlTableBody);
			if(arr!=""||arr!=null){
				for ( var i = 0; i < arr.length; i++) {
					$("#select_" + i).trigger("chosen:updated");
					setChosen();
				}
			}
		}
		$("#div_changeForSQLName").show();
		$("#div_changeForSQL").show();
		if (curDataType == 'oracle') {
			$("#sqlType_oracle").attr("checked", 'checked');
			$("#oracle_sql").show();
		} else if (curDataType == 'sqlserver') {
			$("#sqlType_sqlserver").attr("checked", 'checked');
			$("#sqlserver_sql").show();
		} else if (curDataType == 'mysql') {
			$("#sqlType_mysql").attr("checked", 'checked');
			$("#mysql_sql").show();
		} 
		$("#analyButton").show();
		$("#confirmButton").show();
	}
	function commit(obj) {//数据源提交按钮
		var parentiframeId = $("#parentiframeId").val();
		var parentFrame = top.document.getElementById(parentiframeId);//获取到父iframe对象
		var titleText=$("#titleText").val();//主标题
		if(titleText==""){
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="请填写主标题！" />", "", 320,
					150);
			return false;
		}
		var titleTextFontFamily=$("#titleTextFontFamily").val();//主标题字体
		var titleColor=$("#titleColor").val();//主标题颜色
		var titleFontSize=$("#titleFontSize").val();//主标题字号
		var titleTextFontWeight=$("#titleTextFontWeight").val();//主标题文字样式
		var titleSubtext=$("#titleSubtext").val();//副标题
		if(titleText==""){
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="请填写副标题！" />", "", 320,
					150);
			return false;
		}
		var titleSubtextFontFamily=$("#titleSubtextFontFamily").val();//副标题字体
		var titleSubtextColor=$("#titleSubtextColor").val();//副标题颜色
		var titleSubtextFontSize=$("#titleSubtextFontSize").val();//副标题字号
		var titleSubtextFontWeight=$("#titleSubtextFontWeight").val();//副标题文字样式
		var animation=$("#animation").val();//是否显示加载动画	
		var eventClick=$("#eventClick").val();//饼图点击事件
		var backgroundUrl=$("#backgroundUrl").val();//背景图url
		var backgroundAlpha=$("#backgroundAlpha").val();//背景图透明度
		if(backgroundAlpha>100){
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="背景图透明度0~100" />", "", 320,
					150);
			return false;
		}
		var canvasHeight=$("#canvasHeight").val();//画布高度	
		var canvasWidth=$("#canvasWidth").val();//画布宽度
		var seriesName=$("#seriesName").val();//提示信息上的标题
		var seriesRadius=$("#seriesRadius").val();//图形显示面积(可填页面百分比或绝对值)
		if(seriesRadius>100){
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="图形显示面积百分比0~100" />", "", 320,
					150);
			return false;
		}
		var seriesCenterX=$("#seriesCenterX").val();//饼图圆心x轴位置(可填页面百分比或坐标绝对值)
		if(seriesCenterX>100){
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="饼图圆心x轴位置百分比0~100" />", "", 320,
					150);
			return false;
		}
		var seriesCenterY=$("#seriesCenterY").val();//饼图圆心y轴位置(可填页面百分比或坐标绝对值)
		if(seriesCenterY>100){
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="饼图圆心y轴位置百分比0~100" />", "", 320,
					150);
			return false;
		}
		var tooltipTrigger=$("#tooltipTrigger").val();//鼠标指上时是否显示提示信息
		var labelNormalShow=$("#labelNormalShow").val();//是否显示标签 0-false 1-true
		var legendOrient=$("#legendOrient").val();//图例说明的排列方式
		var legendX=$("#legendX").val();//图例说明的水平位置
		var legendY=$("#legendY").val();//图例说明的垂直位置
		var labelFormatterC=$("#labelFormatterC").val();//
		var labelFormatterD=$("#labelFormatterD").val();//
		var chId=$("#chId").val();//
		var chType=$("#chType").val();//
		var chartsConfig="{\"id\":\""+chId+"\","
		+"\"type\":\""+chType+"\","
		+"\"titleText\":\""+titleText+"\","
		+"\"titleTextFontFamily\":\""+titleTextFontFamily+"\","
		+"\"titleTextColor\":\""+titleColor+"\","
		+"\"titleTextFontSize\":\""+titleFontSize+"\","
		+"\"titleTextFontWeight\":\""+titleTextFontWeight+"\","
		+"\"titleSubtext\":\""+titleSubtext+"\","
		+"\"titleSubtextFontFamily\":\""+titleSubtextFontFamily+"\","
		+"\"titleSubtextColor\":\""+titleSubtextColor+"\","
		+"\"titleSubtextFontSize\":\""+titleSubtextFontSize+"\","
		+"\"titleSubtextFontWeight\":\""+titleSubtextFontWeight+"\","
		+"\"other\":\"{\\\"seriesName\\\":\\\""+seriesName+"\\\","
		+"\\\"seriesRadius\\\":\\\""+seriesRadius+"\\\","
		+"\\\"seriesCenterX\\\":\\\""+seriesCenterX+"\\\","
		+"\\\"seriesCenterY\\\":\\\""+seriesCenterY+"\\\","
		+"\\\"tooltipTrigger\\\":\\\""+tooltipTrigger+"\\\","
		if(labelNormalShow==0){
			chartsConfig+="\\\"labelNormalShow\\\":false,"
		}else{
			chartsConfig+="\\\"labelNormalShow\\\":true,"
		}
		chartsConfig+="\\\"legendOrient\\\":\\\""+legendOrient+"\\\","
		+"\\\"legendX\\\":\\\""+legendX+"\\\","
		+"\\\"legendY\\\":\\\""+legendY+"\\\","
		+"\\\"legendLength\\\":null,"
		+"\\\"labelFormatterA\\\":null,"
		if($("#labelFormatterC").attr("checked")){
			chartsConfig+="\\\"labelFormatterC\\\":\\\""+true+"\\\","
		}else{
			chartsConfig+="\\\"labelFormatterC\\\":null,"
		}
		if($("#labelFormatterD").attr("checked")){
			chartsConfig+="\\\"labelFormatterD\\\":\\\""+true+"\\\","
		}else{
			chartsConfig+="\\\"labelFormatterD\\\":null,"
		}
		chartsConfig+="\\\"labelFormatterB\\\":null}\","
		+"\"animation\":\""+animation+"\","
		if(eventClick==""||eventClick==null){
			chartsConfig+="\"eventClick\":\""+false+"\","
		}else{
			chartsConfig+="\"eventClick\":\""+eventClick+"\","
		}
		chartsConfig+="\"backgroundUrl\":\""+backgroundUrl+"\","
		+"\"backgroundAlpha\":\""+backgroundAlpha+"\","
		+"\"canvasHeight\":\""+canvasHeight+"\",\"canvasWidth\":\""+canvasWidth+"\"}"
		var CHARTS_CONFIG_ID=$("#CHARTS_CONFIG_ID").val();
		var parentCHARTS_CONFIG_ID = parentFrame.contentWindow.document.getElementById(CHARTS_CONFIG_ID);
		parentCHARTS_CONFIG_ID.value=chartsConfig;
		
		var comm_sql = $("#comm_sql").val();
		var oracle_sql = $("#oracle_sql").val();
		var sqlserver_sql = $("#sqlserver_sql").val();
		var mysql_sql = $("#mysql_sql").val();
		var DATA_COMMENT_ID = $("#DATA_COMMENT_ID").val();
		var PARA_ARGS_ID = $("#PARA_ARGS_ID").val();
		var COL_PRO_ID = $("#COL_PRO_ID").val();
		
		var BUTTON_ID = $("#BUTTON_ID").val();
		var COMM_SQL_ID = $("#COMM_SQL_ID").val();
		var MYSQL_SQL_ID = $("#MYSQL_SQL_ID").val();
		var ORACLE_SQL_ID = $("#ORACLE_SQL_ID").val();
		var SQLSERVER_SQL_ID = $("#SQLSERVER_SQL_ID").val();
		
		var parentCOL_PRO_ID = parentFrame.contentWindow.document
				.getElementById(COL_PRO_ID);//通过父iframe找到菜单Id这个输入框
		var parentDATA_COMMENT_ID = parentFrame.contentWindow.document
				.getElementById(DATA_COMMENT_ID);
		var parentSQLSERVER_SQL_ID = parentFrame.contentWindow.document
				.getElementById(SQLSERVER_SQL_ID);
		var parentMYSQL_SQL_ID = parentFrame.contentWindow.document
				.getElementById(MYSQL_SQL_ID);
		var parentCOMM_SQL_ID = parentFrame.contentWindow.document
				.getElementById(COMM_SQL_ID);
		var parentORACLE_SQL_ID = parentFrame.contentWindow.document
				.getElementById(ORACLE_SQL_ID);
		var parentPARA_ARGS_ID = parentFrame.contentWindow.document
				.getElementById(PARA_ARGS_ID);
		var BUTTON_ID_ID = parentFrame.contentWindow.document
				.getElementById(BUTTON_ID);
		if(oracle_sql == ""&&mysql_sql == ""&&sqlserver_sql == ""&&comm_sql == ""){
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="未填写任何sql语句" />", "", 320,
					150);
			return false;
		}
		if(!isChange&&!isParaChange){
			closeWindow();
			return;
		}
		if(isChange){
			if (oracle_sql != "" &&curDataType == 'oracle') {
					
				if (!isAnalyOther) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="当前数据库sql解析未成功,不能提交！" />", "", 320,
							150);
					return false;
				}
			}
			if (mysql_sql != "" &&curDataType == 'mysql') {
				
				if (!isAnalyOther) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="当前数据库sql解析未成功,不能提交！" />", "", 320,
							150);
					return false;
				}
			}
			if (sqlserver_sql != "" &&curDataType == 'sqlserver') {
				
				if (!isAnalyOther) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="当前数据库sql解析未成功,不能提交！" />", "", 320,
							150);
					return false;
				}
			}
			if (comm_sql != "") {
				if (!isAnalyCommon) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="通用sql解析未成功,不能提交！" />", "", 320, 150);
					return false;
				}
			}
		}
		
			var sqlPara = "";
			var sqlRs = "";
			var flag = false;
			parentCOMM_SQL_ID.value = comm_sql;
			parentSQLSERVER_SQL_ID.value = sqlserver_sql;
			parentMYSQL_SQL_ID.value = mysql_sql;
			parentORACLE_SQL_ID.value = oracle_sql;
			$("#addSqlTable tbody tr").each(function(seq, length) {
				var tdArr = $(this).children();
				param = tdArr.eq(1).find("input").val();
				dateValue = tdArr.eq(2).find("select").val();
				sqlPara = sqlPara + param + "=" + dateValue + ",";
			});
			var totalWidth=0;
			if(flag){
				return;
			}
			parentPARA_ARGS_ID.value = sqlPara;
			parentCOL_PRO_ID.value = sqlRs;
			BUTTON_ID_ID.innerText = "已配置";
			closeWindow();
	}
	function showSqlParam() {//解析sql查询条件参数，查询结果参数
		isConfirmButton = true;
		var sqlType = $('input[name="paraMap.sqlType"]:checked').val();
		if (sqlType == "commsql") {
			sqlContext = $("#comm_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType = "oracle") {
			sqlContext = $("#oracle_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType = "mysql") {
			sqlContext = $("#mysql_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType = "sqlserver") {
			sqlContext = $("#sqlserver_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		}
		var  url="${path}sys/AdKeyDataAction_getQueryPara.ms";
		$.ajax({
			type: "POST",
		    dataType: "json",
		    url: url,
		    data: "paraMap.sql="+sqlContext,
		    success: function(data){
		    	var arr=data.ajaxList;
		    	var filedName="";
		    	if(arr.length!=2){
		    		utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="只能查询2个字段！" />", "", 320, 150);
					return false;
		    	}
		    	if((arr[1].typeName!="NUMBER")&&(arr[1].typeName!="INTEGER")){
		    		utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="第二个查询字段必须为数值类型！" />", "", 320, 150);
					return false;
		    	}
		    }
		})
		var type = /:param([1-9]*|[1-2][0-9]*)/g;//匹配1-29
		var arr = sqlContext.match(type);
		var addSqlTableBody = ""
		if (arr != null) {
			var index = 1;
			for ( var i = 0; i < arr.length; i++) {
				if((i%2)==0){
					 addSqlTableBody += "<tr>"
				 }else{
					 addSqlTableBody += "<tr class=\"tr-hover\">"
				 }
				addSqlTableBody += "<td style='width:10%;' align='center'>"
						+ index
						+ "</td>"
						+ "<td style='width:45%;' align='center'><input type='hidden' value='"+arr[i]+"'>"
						+ arr[i]
						+ "</input></td>"
						+ "<td style='width:45%;'onchange=\"paraChange()\" align='center'><select id='select_"+i+"' class='dept_select'>"
						+ "<option value='0' selected='selected'><dict:lang value='用户Id'/></option>"
						+ "<option value='1'><dict:lang value='用户名称'/></option>"
						+ "<option value='2'><dict:lang value='部门Id'/></option><option value='3'><dict:lang value='当前时间'/></option>"
						+ "</select></td></tr>";
				index++;
			}
		}
		
			$("#sqlTbody").html(addSqlTableBody);
			if(arr!=null){
			for ( var i = 0; i < arr.length; i++) {
				$("#select_" + i).trigger("chosen:updated");
				setChosen();
			}
			
			}
			utilsFp.confirmIcon("1","","","","获取参数完成","",320,150);
	}
	$("#sqlType_comm").click(function() {
		$("#comm_sql").show();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").hide();
		$("#oracle_sql").hide();
		isAnaly = false;
		$("#analyButton").show();
		$("#confirmButton").show();

	});
	$("#sqlType_sqlserver").click(function() {
		$("#comm_sql").hide();
		$("#sqlserver_sql").show();
		$("#mysql_sql").hide();
		$("#oracle_sql").hide();
		isAnaly = false;
		if (curDataType == 'sqlserver') {
			$("#analyButton").show();
			$("#confirmButton").show();
		} else {
			$("#analyButton").hide();
			$("#confirmButton").hide();
		}
	});
	$("#sqlType_mysql").click(function() {
		$("#comm_sql").hide();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").show();
		$("#oracle_sql").hide();
		isAnaly = false;
		if (curDataType == 'mysql') {
			$("#analyButton").show();
			$("#confirmButton").show();
		} else {
			$("#analyButton").hide();
			$("#confirmButton").hide();
		}
	});
	$("#sqlType_oracle").click(function() {
		$("#comm_sql").hide();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").hide();
		$("#oracle_sql").show();
		isAnaly = false;
		if (curDataType == 'oracle') {
			$("#analyButton").show();
			$("#confirmButton").show();
		} else {
			$("#analyButton").hide();
			$("#confirmButton").hide();
		}
	});
	function analySql() {//解析sql
		if (isChange&&!isConfirmButton) {//sql参数已经解析了，则不会提示，有参数但是没有点击确定直接解析会报错
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="请先点击确定，再点击解析！" />", "", 320, 150);
			return false;
		}
		var sqlType = $('input[name="paraMap.sqlType"]:checked').val();
		if (sqlType == "commsql") {//判断当前的sql是否有写入内容
			sqlContext = $("#comm_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType = "oracle") {
			sqlContext = $("#oracle_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType = "mysql") {
			sqlContext = $("#mysql_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType = "sqlserver") {
			sqlContext = $("#sqlserver_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		}
		var sqlPara = "";
		var sqlRs = "";
		var sqlContext = $("#sqlContext").val();
		var sqlType = $('input[name="paraMap.sqlType"]:checked').val();
		if (sqlType == "commsql") {
			sqlContext = $("#comm_sql").val();
		} else if (sqlType = "oracle") {
			sqlContext = $("#oracle_sql").val();
		} else if (sqlType = "mysql") {
			sqlContext = $("#mysql_sql").val();
		} else if (sqlType = "sqlserver") {
			sqlContext = $("#sqlserver_sql").val();
		}
		$("#addSqlTable tbody tr").each(function(seq, length) {
			var tdArr = $(this).children();
			param = tdArr.eq(1).find("input").val();
			dateValue = tdArr.eq(2).find("select").val();
			sqlPara = sqlPara + param + "=" + dateValue + ",";
		});
		$("#addParamTable tbody tr").each(function(seq, length) {
			var tdArr = $(this).children();
			var fieldName = tdArr.eq(1).html();
			var showName = tdArr.eq(2).find("input").val();
			if(showName==""){
				utilsFp.confirmIcon("1", "", "", "",
						"<dict:lang value="页面显示别名必输！" />", "", 320, 150);
				flag=true;
				return false;
			}
			var showWidth = tdArr.eq(3).find("input").val();//获取table中第三列的数据
			if(showWidth==""){
				utilsFp.confirmIcon("1", "", "", "",
						"<dict:lang value="页面显示高度必输！" />", "", 320, 150);
				flag=true;
				return false;
			}
			if(seq==0){
				sqlRs +="["
			}
			sqlRs += "{\"FIELD_NAME\":\""+fieldName+"\",\"SHOW_NAME\":\""+showName+"\",\"SHOW_WIDTH\":\""+showWidth+"\"}";
			if(seq==$("#addParamTable tbody tr").length-1){
				sqlRs += "]";
			}else{
				sqlRs += ",";
			}
		});
		$.ajax({
			type : "POST",
			url : "${path}sys/AdminTargetDataAction_analyKeyPieSql.ms?",
			data : "paraMap.sqlPara=" + sqlPara + "&paraMap.sqlType=" + sqlType
					+ "&paraMap.sqlContext=" + sqlContext+"&paraMap.sqlKeyRs="+sqlRs,
			success : function(data) {
				if (data.ajaxMap.status == "false") {
					if (sqlType == "commsql") {
						isAnalyCommon = false
					} else {
						isAnalyOther = false;
					}
					utilsFp.confirmIcon("1", "", "", "", data.ajaxMap.info, "",
							320, 150);
				} else {
					if (sqlType == "commsql") {
						isAnalyCommon = true
					} else {
						isAnalyOther = true;
					}
					utilsFp.confirmIcon("2", "", "", "", data.ajaxMap.info, "",
							320, 150);
				}
			},
			error : function(msg) {
				isNoInit = true;
				if (isNoInit) {
					util.closeLoading();
				}
				utilsFp.confirmIcon("3", "", "", "", "error:" + msg, "", 320,
						150);
			}

		});
	}
</script>

</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp"%>