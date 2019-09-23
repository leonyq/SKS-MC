<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="图标显示控件" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
	  	<jsp:param name="spectrum" value="1" />
	  	<jsp:param name="layui" value="1" />
	  	<jsp:param name="popDivWin" value="1" />
	  	
	</jsp:include>
	<style>
		#tab {
			margin-top: 20px;
		}
		#tab thead td {
			background-color: #E6E6E6;
		}
		#tab td {
			padding: 5px 0;
			border: 1px solid #f2f2f2;
		}
	</style>
</head>
<body>
		<div class="all">
			<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<!--  
				<table class = "func_table">
					<tbody>
						<tr>
							<td width="100%" align="right">
								<input class="layui-btn layui-btn-xs" id="addCol" type="button" class="botton_img_add" value = "<dict:lang value="新增键值" />"></input>
								<input class="layui-btn layui-btn-danger layui-btn-xs" id="delCol" type="button" class="botton_img_del" value= "<dict:lang value="删除键值" />" onclick="delRow()"></input>
				
							</td>
						</tr>
					</tbody>
				</table>
				-->
				
				<table class="add_table element_table">

					<tr>
						<td class="tr1 title">
							<dict:lang value="图标宽度(px)" />
						</td>
						<td colspan="4">
							<input type = "text" id="widthInput" name="paraMap.width" value="<c:out value='${dataMap.width}'/>" />
						</td>
					</tr>
					
					
					
				</table>
				<table id="tab" class="add_table element_table">
					<thead>
						<tr>
							<td class="txt-center title" >
								<dict:lang value="选择" />
							</td>
							<td width="25%" align="center">
								<dict:lang value="数据内容" />
							</td>
							<td width="25%" align="center">
								<dict:lang value="展示内容" />
							</td>
							<td width="16%" align="center">
								<dict:lang value="背景颜色" />
							</td>
							<td width="16%" align="center">
								<dict:lang value="字体颜色" />
							</td>
						</tr>
					</thead>
					
					<c:forEach items="${dataMap.UI_DATA}" var="ls" varStatus="index">
					<tr>
						<td class="txt-center title"><input type = "checkbox" name="checkbox" lay-skin="primary" style="width:30px" /></td>
						<td width="25%" align="center"><input type = "text" id="keyInput_<c:out value='${ls.num}'/>" name="paramList[<c:out value='${ls.num}'/>].key" value="<c:out value='${ls.key}'/>" style="width:95%"/></td>
						<td width="25%" align="center"><input type = "text" id="valInput_<c:out value='${ls.num}'/>" name="paramList[<c:out value='${ls.num}'/>].val" value="<c:out value='${ls.val}'/>" style="width:95%"/></td>
						<td width="16%" align="center"><input type = "text" id="backInput_<c:out value='${ls.num}'/>" name="paramList[<c:out value='${ls.num}'/>].back" value="<c:out value='${ls.back}'/>" class="input_sh" readOnly/></td>
						<td width="16%" align="center"><input type = "text" id="fontInput_<c:out value='${ls.num}'/>" name="paramList[<c:out value='${ls.num}'/>].font" value="<c:out value='${ls.font}'/>" class="input_sh" readOnly/></td>
					</tr>
					</c:forEach>
				</table>
				
				<div class="ptop_10 txac">
					<!--  
					<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
					-->
					
					<input class="layui-btn" id="addCol" type="button"  value = "<dict:lang value="新增键值" />"></input>
					<input class="layui-btn layui-btn-danger" id="delCol" type="button" value= "<dict:lang value="删除键值" />" onclick="delRow()"></input>
				
					
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>				
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin_ui();" class="layui-btn layui-btn-danger">
				</div>

			</form>
			</div>
		</div>


	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	
	var isSubmit = false;
	var total = "<c:out value='${dataMap.UI_DATA_TOTAL}' />";
	var tab = document.getElementById("tab");
	var count = 0;
	if(total != null && total != "")
	{
		count = total;
	}
	var addCol = document.getElementById("addCol");
	
	for(var i = 0; i <= count - 1; i++ )
	{
		console.log(i);
		var spec1 = $("#backInput_"+i).spectrum({
			color: "<c:out value='${dataMap.UI_DATA[i].back}' />",
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
		var spec2 = $("#fontInput_"+i).spectrum({
			color: "<c:out value='${dataMap.UI_DATA[i].font}' />",
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

	}
	
	function delRow(){
		var delIds="";
		var removeAdd = false;
		console.log("delRow");
		$("#tab").find("tbody tr").each(function(seq) {
			
			var ckBoxObj = $(this).find("td").eq(0).find("input[type='checkbox']");
			if(ckBoxObj.prop("checked")){
					$(this).remove();
					removeAdd = true;
				}else{
					delIds+=ckBoxObj.val();
					delIds+=",";
				}
		});
		if(""==delIds){
			if(!removeAdd){
				util.alert("<dict:lang value="请至少勾选一条记录" />");
			}else{
				util.alert("<dict:lang value="删除成功" />");
			}
			return false;
		}
		delId = delIds;
		return true;
	}
	
	$('#addCol').click(function()
	{
		
		var trHTML = "<tr>";
		var checkBox = "<td class=\"txt-center title\" line-height=\"28px\"><input type=\"checkbox\" lay-skin=\"primary\" style=\"width:30px\" /></td>"
		var keyInput = "<td width=\"25%\" align=\"center\" line-height=\"28px\"><input type=\"text\" style=\"width:95%\" id=\"key_" + count + "\" name=\"paramList[" + count + "].key\"/></td>";
		var valInput = "<td width=\"25%\" align=\"center\" line-height=\"28px\"><input type=\"text\" style=\"width:95%\" id=\"val_" + count + "\" name=\"paramList[" + count + "].val\"/></td>";
		var backGroudInput = "<td width=\"16%\" align=\"center\" line-height=\"28px\"><input type=\"text\" id=\"backInput_" + count + "\" name=\"paramList[" + count + "].back\" readOnly class=\"input_sh\"/></td>";
		var fontInput = "<td width=\"16%\" align=\"center\" line-height=\"28px\"><input type=\"text\" id=\"fontInput_" + count + "\" name=\"paramList[" + count + "].font\" readOnly class=\"input_sh\"/></td>";
		trHTML += checkBox;
		trHTML += keyInput;	
		trHTML += valInput;
		trHTML += backGroudInput;
		trHTML += fontInput;
		trHTML += "</tr>";
		$("#tab").append(trHTML);
		var spec1 = $("#backInput_" + count).spectrum({
			color: "#000",
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
		var spec2 = $("#fontInput_" + count).spectrum({
			color: "#FFF",
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
		count++;
		 form.render();
		 
	});
	
	function reloadPg(msg){
		isSubmit = false;
		//window.parent.parent.reloadPg(msg);
		window.parent.parent.add();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		var keyElement = null;
		var valElement = null;
		var backElement = null;
		var fontElement = null;
		for(var i = 0; i <= count - 1; i++ )
		{
			keyElement = document.getElementById("keyInput_" + i);
			valElement = document.getElementById("valInput_" + i)
			backElement = document.getElementById("backInput_"+i);
			fontElement = document.getElementById("fontInput_"+i);
			if(keyElement != null)
			{
				console.log("key:" + keyElement.value);
				if(keyElement.value == null || keyElement.value == "")
				{
					
					util.alert("<dict:lang value="数据内容不能为空" />");
					return;
				}
			}
			if(valElement != null)
			{
				console.log("val:" + valElement.value);
				if(valElement.value == null || valElement.value == "")
				{
					util.alert("<dict:lang value="展示内容不能为空" />");
					return;
				}
			}
			if(backElement != null && (backElement.value == null || backElement.value == ""))
			{
				backElement.value = "#000000";
			}
			if(fontElement != null && (fontElement.value == null || fontElement.value == ""))
			{
				fontElement.value = "#FFFFFF";	
			}
		}	
		
		document.forms.add_form.submit();
		isSubmit = true;
	}
        
	function valData(){
		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		if(typeVal == "2"){
			var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
	   	if(val.isBlank(paraMap_UI_DATA_2)){
	   		_alertValMsg(paraMap_UI_DATA_2,"<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}else if(typeVal == "3"){
			var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
	   	if(val.isBlank(paraMap_UI_DATA_3)){
	   		_alertValMsg(paraMap_UI_DATA_3,"<dict:lang value="数据字典编码(key)" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}else if(typeVal == "4"){
			var paraMap_UI_DATA_4_1 = document.getElementById("paraMap_UI_DATA_4_1");
	   	if(val.isBlank(paraMap_UI_DATA_4_1)){
	   		_alertValMsg(paraMap_UI_DATA_4_1,"<dict:lang value="外键表名" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_2 = document.getElementById("paraMap_UI_DATA_4_2");
	   	if(val.isBlank(paraMap_UI_DATA_4_2)){
	   		_alertValMsg(paraMap_UI_DATA_4_2,"<dict:lang value="外键显示字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_3 = document.getElementById("paraMap_UI_DATA_4_1");
	   	if(val.isBlank(paraMap_UI_DATA_4_3)){
	   		_alertValMsg(paraMap_UI_DATA_4_3,"<dict:lang value="外键取值字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_4 = document.getElementById("paraMap_UI_DATA_4_1");
	   	if(val.isBlank(paraMap_UI_DATA_4_4)){
	   		_alertValMsg(paraMap_UI_DATA_4_4,"<dict:lang value="外键关联字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}
   	
	   	var widthInput = document.getElementById("widthInput");
	   	if(!validateInput(widthInput))
	   	{
	   		return false;
	   	}
    
		return true;
	}
	
	function setUiData(thisObj){
		$('#UI_DATA_2').hide();
		$('#UI_DATA_3').hide();
		$('#UI_DATA_4').hide();
		$('#UI_DATA_'+$(thisObj).val()).show();
	}
	
	function validateInput(input)
	{
		var input_value = input.value;
	   	if(input_value != "" && input_value != null)
	   	{
	   		if(input_value.indexOf("\"") != -1 || input_value.indexOf("\'") != -1 || input_value.indexOf("<") != -1 || input_value.indexOf(">") != -1  
				|| input_value.indexOf("{") != -1 || input_value.indexOf("}") != -1 || input_value.indexOf("[") != -1 || input_value.indexOf("]") != -1 
				|| input_value.indexOf("(") != -1 || input_value.indexOf(")") != -1 )
			{
				_alertValMsg(input,"<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />");
		   		return false;	   		
		   	}
	   	}
	   	return true;
	}
	
	function init(){
	}
		setUiData($("#paraMap_UI_DATA_TYPE"));
		
var form;
$(function(){
	layui.use('form', function(){
	    	 form = layui.form;
	          
			 form.on('submit(filterSubmit)', function (data) {
			 	document.getElementById("mcIframeName").value=window.parent.location.href;
			 	document.getElementById("curIframeName").value=window.parent.name;
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
	
	    });
	    
})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>