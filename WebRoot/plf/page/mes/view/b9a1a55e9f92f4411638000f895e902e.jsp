<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	<script type="text/javascript">
		var loaded = 1;
	var tab_len = 4;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		document.getElementById("content3").style.display="";
		document.getElementById("content4").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}
	
	$(function() {
		$("#tag1").addClass("current");
		/*$("#allSelect1").live("click",function(){
	    			if($("#allSelect1").attr("checked") == "checked"){
	        			$("input[name='isSelect1']").attr("checked","checked");
	    			}else{
	        			$("input[name='isSelect1']").removeAttr("checked","checked");
	    			}
				});*/
	});
	</script>
	<script type="text/javascript">
	var trCount1 = 0;
	var trCount2 = 0;
	var trCount3 = 0;
	var trCount4 = 0;
	function addRow(tableId,tempType,selectIndex){
		if(tempType=='1'){ 
			trCount1++;
			var mySelect = "<select id='sel1_"+trCount1+"' name='paraMap"+trCount1+"@1#CDI_ITEM_CLASS' onchange='changeVal(1,"+trCount1+")' class=' input isSubmit  _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option><option value='0'>范围值</option>"
						+"<option value='1'>固定值</option>"
						+"<option value='2'>状态值</option>";	
			$("#"+tableId+" tbody:last").append("<tr id='tr1_"+trCount1+"' ></tr>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' style='width: 13px;' value='tr1_"+trCount1+"' name='isSelect"+selectIndex+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;'><input type='text' id='deviceItemName1_"+trCount1+"' name='deviceItemName1_"+trCount1+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'><input type='text' id='deviceItemCode1_"+trCount1+"' name='deviceItemCode1_"+trCount1+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;overflow: visible;text-align: center;'>"+mySelect+"</td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;'><input type='text' id='deviceitemMaxvalue1_"+trCount1+"' name='deviceitemMaxvalue1_"+trCount1+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceitemMinvalue1_"+trCount1+"' name='deviceitemMinvalue1_"+trCount1+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;'><input type='text' id='deviceItemUnit1_"+trCount1+"' name='deviceItemUnit1_"+trCount1+"'/></td>");
			
		}else if(tempType=='2'){ 
			trCount2++;
			var mySelect = "<select id='sel2_"+trCount2+"' name='paraMap"+trCount2+"@2#CDI_ITEM_CLASS' onchange='changeVal(2,"+trCount2+")' class=' input isSubmit  _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option><option value='0'>范围值</option>"
						+"<option value='1'>固定值</option>"
						+"<option value='2'>状态值</option>";	
			$("#"+tableId+" tbody:last").append("<tr id='tr2_"+trCount2+"' ></tr>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' style='width: 13px;' value='tr2_"+trCount2+"' name='isSelect"+selectIndex+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;'><input type='text' id='deviceItemName2_"+trCount2+"' name='deviceItemName2_"+trCount2+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'><input type='text' id='deviceItemCode2_"+trCount2+"' name='deviceItemCode2_"+trCount2+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;overflow: visible;text-align: center;'>"+mySelect+"</td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;'><input type='text' id='deviceitemMaxvalue2_"+trCount2+"' name='deviceitemMaxvalue2_"+trCount2+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceitemMinvalue2_"+trCount2+"' name='deviceitemMinvalue2_"+trCount2+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align: center;'><input type='text' id='deviceItemUnit2_"+trCount2+"' name='deviceItemUnit2_"+trCount2+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;'><input type='text' id='deviceItemCycle2_"+trCount2+"' name='deviceItemCycle2_"+trCount2+"'/></td>");
		}else if(tempType=='3'){
			trCount3++;
			var mySelect = "<select id='sel3_"+trCount3+"' name='paraMap"+trCount3+"@3#CDI_ITEM_CLASS' onchange='changeVal(3,"+trCount3+")' class=' input isSubmit  _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option><option value='0'>范围值</option>"
						+"<option value='1'>固定值</option>"
						+"<option value='2'>状态值</option>";	
			$("#"+tableId+" tbody:last").append("<tr id='tr3_"+trCount3+"' ></tr>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' style='width: 13px;' value='tr3_"+trCount3+"' name='isSelect"+selectIndex+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;'><input type='text' id='deviceItemName3_"+trCount3+"' name='deviceItemName3_"+trCount3+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'><input type='text' id='deviceItemCode3_"+trCount3+"' name='deviceItemCode3_"+trCount3+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;overflow: visible;text-align: center;'>"+mySelect+"</td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;'><input type='text' id='deviceitemMaxvalue3_"+trCount3+"' name='deviceitemMaxvalue3_"+trCount3+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceitemMinvalue3_"+trCount3+"' name='deviceitemMinvalue3_"+trCount3+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;'><input type='text' id='deviceItemUnit3_"+trCount3+"' name='deviceItemUnit3_"+trCount3+"'/></td>");
			
		}else if(tempType=='4'){
			trCount4++;
			var mySelect = "<select id='sel4_"+trCount4+"' name='paraMap"+trCount4+"@4#CDI_ITEM_CLASS' onchange='changeVal(4,"+trCount4+")' class=' input isSubmit  _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option><option value='0'>范围值</option>"
						+"<option value='1'>固定值</option>"
						+"<option value='2'>状态值</option>";	
			$("#"+tableId+" tbody:last").append("<tr id='tr4_"+trCount4+"' ></tr>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' style='width: 13px;' value='tr4_"+trCount4+"' name='isSelect"+selectIndex+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;'><input type='text' id='deviceItemName4_"+trCount4+"' name='deviceItemName4_"+trCount4+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'><input type='text' id='deviceItemCode4_"+trCount4+"' name='deviceItemCode4_"+trCount4+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;overflow: visible;text-align: center;'>"+mySelect+"</td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;'><input type='text' id='deviceitemMaxvalue4_"+trCount4+"' name='deviceitemMaxvalue4_"+trCount4+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceitemMinvalue4_"+trCount4+"' name='deviceitemMinvalue4_"+trCount4+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align: center;'><input type='text' id='deviceItemUnit4_"+trCount4+"' name='deviceItemUnit4_"+trCount4+"'/></td>");
			$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;'><input type='text' id='deviceItemCycle4_"+trCount4+"' name='deviceItemCycle4_"+trCount4+"'/></td>");
		
		}
		setChosen();//设置下拉框样式
			//console.log(ttt[0]);		
		$(".glxb-table .chosen-container").css("width","100%");
		$('#saveInfo').attr("onclick","addVal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')"); 
	}
	
	$(function() {
        	$('#saveInfo').attr("onclick","addVal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')");  
  	});
  		
	function changeVal(typeId,indexId){     //根据值域控制上限下限
	var tempMax = "#deviceitemMaxvalue"+typeId+"_"+indexId;
	var tempMin = "#deviceitemMinvalue"+typeId+"_"+indexId;
		if($("#sel"+typeId+"_"+indexId).val()=='0'){
			$(tempMax).attr("disabled","disabled");
			$(tempMin).attr("disabled","disabled");
		}
		if($("#sel"+typeId+"_"+indexId).val()=='1'){
			$(tempMax).removeAttr("disabled");
			$(tempMin).attr("disabled","disabled");
		}
		if($("#sel"+typeId+"_"+indexId).val()=='2'){
			$(tempMax).removeAttr("disabled");
			$(tempMin).removeAttr("disabled");
		}
	}
	
	function delRow(tableId,selectIndex){
		var falg = 0; 
		$("input[name='isSelect"+selectIndex+"']:checkbox").each(function () { 
			if ($(this).attr("checked")) { 
			falg =1; 
			} 
			});
			if (falg > 0) {
		$("input[name='isSelect"+selectIndex+"']:checked").each(function() { // 遍历选中的checkbox
	            var n = $(this).parents("#"+tableId+" tr").index();  // 获取checkbox所在行的顺序
	            if(n>=0){
		            var temp=$(this).val();
		            var trId=document.getElementById(temp);
		            var table1=document.getElementById(tableId);
		            table1.removeChild(trId);
	            }
	             //$("#loadPoint").find("tr:eq("+temp+")").remove();
        	 });
        	 
        	 }else 
        	 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
	}
	
	function checkVal1(trCount1){
		var tempVal;
		var tempId;
		var tempFlag1;
		var tempFlag2;
		for(var i=1;i<=trCount1;i++){
			tempVal = $("#deviceitemMaxvalue1_"+i).val();
			if(tempVal==null) continue;
			if(tempVal!=""){
				tempId = document.getElementById("deviceitemMaxvalue1_"+i);
				tempFlag1 = checkNum(tempVal,tempId);
			}
			tempVal = $("#deviceitemMinvalue1_"+i).val();
			if(tempVal!=""){
				tempId = document.getElementById("deviceitemMinvalue1_"+i);
				tempFlag2 = checkNum(tempVal,tempId);
			}
		}
		if(tempFlag1=="0"||tempFlag2=="0"){
		     return "0";
		}
	}
	function checkVal2(trCount2){
		var tempVal;
		var tempId;
		var tempFlag1;
		var tempFlag2;
		var tempFlag3;
		for(var i=1;i<=trCount2;i++){
			tempVal = $("#deviceitemMaxvalue2_"+i).val();
			if(tempVal==null) continue;
			if(tempVal!=""){
				tempId = document.getElementById("deviceitemMaxvalue2_"+i);
				tempFlag1 = checkNum(tempVal,tempId);
			}
			tempVal = $("#deviceitemMinvalue2_"+i).val();
			if(tempVal!=""){
				tempId = document.getElementById("deviceitemMinvalue2_"+i);
				tempFlag2 = checkNum(tempVal,tempId);
			}
			tempVal = $("#deviceItemCycle2_"+i).val();
			if(tempVal!=""){
				tempId = document.getElementById("deviceItemCycle2_"+i);
				tempFlag3 = checkNum(tempVal,tempId);
			}
		}
		if(tempFlag1=="0"||tempFlag2=="0"||tempFlag3=="0"){
		     return "0";
		}
	}
	function checkVal3(trCount3){
		var tempVal;
		var tempId;
		var tempFlag1;
		var tempFlag2;
		for(var i=1;i<=trCount3;i++){
			tempVal = $("#deviceitemMaxvalue13_"+i).val();
			if(tempVal==null) continue;
			if(tempVal!=""){
				tempId = document.getElementById("deviceitemMaxvalue3_"+i);
				tempFlag1 = checkNum(tempVal,tempId);
			}
			tempVal = $("#deviceitemMinvalue3_"+i).val();
			if(tempVal!=""){
				tempId = document.getElementById("deviceitemMinvalue3_"+i);
				tempFlag2 = checkNum(tempVal,tempId);
			}
		}
		if(tempFlag1=="0"||tempFlag2=="0"){
		     return "0";
		}
	}
	function checkVal4(trCount4){
		var tempVal;
		var tempId;
		var tempFlag1;
		var tempFlag2;
		var tempFlag3;
		for(var i=1;i<=trCount4;i++){
			tempVal = $("#deviceitemMaxvalue4_"+i).val();
			if(tempVal==null) continue;
			if(tempVal!=""){
				tempId = document.getElementById("deviceitemMaxvalue4_"+i);
				tempFlag1 = checkNum(tempVal,tempId);
			}
			tempVal = $("#deviceitemMinvalue4_"+i).val();
			if(tempVal!=""){
				tempId = document.getElementById("deviceitemMinvalue4_"+i);
				tempFlag2 = checkNum(tempVal,tempId);
			}
			tempVal = $("#deviceItemCycle4_"+i).val();
			if(tempVal!=""){
				tempId = document.getElementById("deviceItemCycle4_"+i);
				tempFlag3 = checkNum(tempVal,tempId);
			}
		}
		if(tempFlag1=="0"||tempFlag2=="0"||tempFlag3=="0"){
		     return "0";
		}
	}
	
	function checkNum(tempVal,tempId){
		if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0){
			    _alertValMsg(tempId,"<dict:lang value="该项必须为正整数" />");
			    return "0";  
		}else 
		return "1"; 
	}
	</script>
</head>
<body scroll="no">
				
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="addVal();"  id="saveInfo"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			
						<div class="bd">
						<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
						<input type="hidden" name="deviceItemIds" id="deviceItemIds"/>  <!-- 项目信息id -->
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
		<bu:set name="paraMapObj" value="${dataId}" formId="be2f4ab4973e496ab3fde3c3874c38a1" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="be2f4ab4973e496ab3fde3c3874c38a1" />
	<input type="hidden" name="be2f4ab4973e496ab3fde3c3874c38a1" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0642981d918e448883a2ca2f8a0ec956'" />
		<s:set name="_$formId_1" value="'be2f4ab4973e496ab3fde3c3874c38a1'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><bu:uitn colNo="CDI_DEVICE_TYPE" formId="be2f4ab4973e496ab3fde3c3874c38a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDI_DEVICE_TYPE" formId="be2f4ab4973e496ab3fde3c3874c38a1" ><bu:ui colNo="CDI_DEVICE_TYPE" onchange="setVal();" formId="be2f4ab4973e496ab3fde3c3874c38a1" value="%{CDI_DEVICE_TYPE}" formIndex="1" /></bu:td>
			<div style="display:none" id="testHid">
			<!-- <bu:ui colNo="CDI_ITEM_CLASS" formId="be2f4ab4973e496ab3fde3c3874c38a1" id="haha" onchange="test1(this);" value="%{CDI_ITEM_CLASS}" formIndex="1" /> -->
		    </div>
		</tr>
	</table>
			<bu:jsVal formId="be2f4ab4973e496ab3fde3c3874c38a1" formIndex="1" />
			<div class="js-tab">
					<DIV id="container" style="padding:0 20px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								<LI id="tag1"><A class="selectli1"
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="设备参数" /></SPAN>
									<input type="hidden" name="type1" value="设备参数"/>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="保养项目" /></SPAN> </A>
									<input type="hidden" name="type2" value="保养项目"/>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="点检项目" /></SPAN> </A>
									<input type="hidden" name="type3" value="点检项目"/>
								</LI>
								<LI id="tag4"><A class=""
									onclick="switchTag('tag4','content4','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="校验项目" /></SPAN> </A>
									<input type="hidden" name="type4" value="校验项目"/>
								</LI>

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<div class="mod" >
			<div class="mod-hd" style="height: 29px;"> 
					<div class="extend-btn" style="float: right;margin-top:2px;">
						<button type="button"    onclick="addRow('deviceItem_1','1','1');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="delRow('addDeviceItem_1','1');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" style="max-width:100%">
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable  " id="deviceItem1_1">
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect1" name="isSelect1" class="but-select" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></thd >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell"><dict:lang value="单位" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:180px;max-width:100%">
							<table class="glxb-table fixedTable" style="width:100%"  id="deviceItem_1" >
								<tbody id="addDeviceItem_1" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
			<div class="mod" >
			<div class="mod-hd" style="height: 29px;"> 
					<div class="extend-btn" style="float: right;margin-top:2px;">
						<button type="button"    onclick="addRow('deviceItem_2','2','2');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="delRow('addDeviceItem_2','2');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable  " id="deviceItem1_2">
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect2" name="isSelect2" class="but-select"/></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></thd >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="单位" /></td >
										<td class="datagrid-cell"><dict:lang value="周期（天）" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:320px">
							<table class="glxb-table fixedTable" style="width:100%"  id="deviceItem_2" >
								<tbody id="addDeviceItem_2" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
		 				</DIV>
		 				<DIV id="content3" style="display:none" data-tab="tag3">
						<div class="mod" >
			<div class="mod-hd" style="height: 29px;"> 
					<div class="extend-btn" style="float: right;margin-top:2px;">
						<button type="button"    onclick="addRow('deviceItem_3','3','3');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="delRow('addDeviceItem_3','3');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" style="max-width:100%">
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable  " id="deviceItem1_3">
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect3" name="isSelect3" class="but-select"/></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></thd >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell"><dict:lang value="单位" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:320px;max-width:100%">
							<table class="glxb-table fixedTable" style="width:100%"  id="deviceItem_3" >
								<tbody id="addDeviceItem_3" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
						</DIV>
						<DIV id="content4" style="display:none" data-tab="tag4">
						<div class="mod" >
			<div class="mod-hd" style="height: 29px;"> 
					<div class="extend-btn" style="float: right;margin-top:2px;">
						<button type="button"    onclick="addRow('deviceItem_4','4','4');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="delRow('addDeviceItem_4','4');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header">
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable  " id="deviceItem1_4">
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect4" name="isSelect4" class="but-select"/></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></thd >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="单位" /></td >
										<td class="datagrid-cell"><dict:lang value="周期（天）" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:320px;">
							<table class="glxb-table fixedTable" style="width:100%"  id="deviceItem_4" >
								<tbody id="addDeviceItem_4" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
						</DIV>

						</DIV>
									</form>
						</DIV>
						</DIV>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:script viewId="0642981d918e448883a2ca2f8a0ec956" />
<script type="text/javascript">
	$(".but-select").click(function(){
		var tempName=$(this).attr("name");
		var tempCheck=$(this).attr("checked");
		tempChe(tempCheck,tempName);
		/*if($(this).attr("checked") == "checked"){
	        	$("input[name='isSelect1']").attr("checked","checked");
	    }else{
	        			$("input[name='isSelect1']").removeAttr("checked","checked");
	    }*/
	});
	function tempChe(tempCheck,tempName){
		$("input[type='checkbox']").each(function(){
    		if($(this).attr("name")==tempName){
    			if(tempCheck == "checked"){
    				$("input[name='"+tempName+"']").attr("checked","checked");
    			}else{
    				$("input[name='"+tempName+"']").removeAttr("checked","checked");
    			}
    		}
  		});
	}
	
	function getValue(url){
	var deviceType = $("#paraMap1_CDI_DEVICE_TYPE").val();
	$("#addDeviceItem_1").html("");
	$("#addDeviceItem_2").html("");
	$("#addDeviceItem_3").html("");
	$("#addDeviceItem_4").html("");
	var itemIds = "";
					$.ajax({
						url:url,
						type:"post",
						data:{"deviceType":deviceType},
						success:function(data){
							var itemList=data.ajaxList;
							if(itemList!=""){
								for(var i=0;i<itemList.length;i++){
									if(i!=itemList.length-1){
										itemIds = itemIds+"'"+itemList[i].ID+"'"+",";
									}else{
										itemIds = itemIds+"'"+itemList[i].ID+"'";
									}
									if(itemList[i].CDI_ITEM_MAXVALUE==null||itemList[i].CDI_ITEM_MAXVALUE=='undefined'){
										itemList[i].CDI_ITEM_MAXVALUE=0;
									}
									if(itemList[i].CDI_ITEM_MINVALUE==null||itemList[i].CDI_ITEM_MINVALUE=='undefined'){
										itemList[i].CDI_ITEM_MINVALUE=0;
									}
									if(itemList[i].CDI_ITEM_CYCLE==null||itemList[i].CDI_ITEM_CYCLE=='undefined'){
										itemList[i].CDI_ITEM_CYCLE=0;
									}
									if(itemList[i].CDI_ITEM_TYPE=="设备参数"){
										trCount1++;
										var mySelect = "<select id='sel1_"+trCount1+"' name='paraMap"+trCount1+"@1#CDI_ITEM_CLASS' onchange='changeVal(1,"+trCount1+")' class=' input isSubmit  _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option><option value='0'>范围值</option>"
													+"<option value='1'>固定值</option>"
													+"<option value='2'>状态值</option>";	
										$("#deviceItem_1 tbody:last").append("<tr id='tr1_"+trCount1+"' ></tr>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' style='width: 13px;' value='tr1_"+trCount1+"' name='isSelect1'/></td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;'><input type='text' id='deviceItemCode1_"+trCount1+"' name='deviceItemCode1_"+trCount1+"' value='"+itemList[i].CDI_ITEM_CODE+"'/></td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'><input type='text' id='deviceItemName1_"+trCount1+"' name='deviceItemName1_"+trCount1+"' value='"+itemList[i].CDI_ITEM_NAME+"'/></td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;overflow: visible;text-align: center;'>"+mySelect+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;'><input type='text' id='deviceitemMaxvalue1_"+trCount1+"' name='deviceitemMaxvalue1_"+trCount1+"' value='"+itemList[i].CDI_ITEM_MAXVALUE+"'/></td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceitemMinvalue1_"+trCount1+"' name='deviceitemMinvalue1_"+trCount1+"' value='"+itemList[i].CDI_ITEM_MINVALUE+"'/></td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;'><input type='text' id='deviceItemUnit1_"+trCount1+"' name='deviceItemUnit1_"+trCount1+"' value='"+itemList[i].CDI_ITEM_UNIT+"'/></td>");
										$("#sel1_"+trCount1).val(itemList[i].CDI_ITEM_CLASS);
										changeVal(1,trCount1);
									}
									if(itemList[i].CDI_ITEM_TYPE=="保养项目"){
										trCount2++;
										var mySelect = "<select id='sel2_"+trCount2+"' name='paraMap"+trCount2+"@2#CDI_ITEM_CLASS' onchange='changeVal(2,"+trCount2+")' class=' input isSubmit  _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option><option value='0'>范围值</option>"
													+"<option value='1'>固定值</option>"
													+"<option value='2'>状态值</option>";	
										$("#deviceItem_2 tbody:last").append("<tr id='tr2_"+trCount2+"' ></tr>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' style='width: 13px;' value='tr2_"+trCount2+"' name='isSelect2'/></td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;'><input type='text' id='deviceItemCode2_"+trCount2+"' name='deviceItemCode2_"+trCount2+"' value='"+itemList[i].CDI_ITEM_CODE+"'/></td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'><input type='text' id='deviceItemName2_"+trCount2+"' name='deviceItemName2_"+trCount2+"' value='"+itemList[i].CDI_ITEM_NAME+"'/></td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;overflow: visible;text-align: center;'>"+mySelect+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;'><input type='text' id='deviceitemMaxvalue2_"+trCount2+"' name='deviceitemMaxvalue2_"+trCount2+"' value='"+itemList[i].CDI_ITEM_MAXVALUE+"'/></td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceitemMinvalue2_"+trCount2+"' name='deviceitemMinvalue2_"+trCount2+"' value='"+itemList[i].CDI_ITEM_MINVALUE+"'/></td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align: center;'><input type='text' id='deviceItemUnit2_"+trCount2+"' name='deviceItemUnit2_"+trCount2+"' value='"+itemList[i].CDI_ITEM_UNIT+"'/></td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;'><input type='text' id='deviceItemCycle2_"+trCount2+"' name='deviceItemCycle2_"+trCount2+"' value='"+itemList[i].CDI_ITEM_CYCLE+"'/></td>");
										$("#sel2_"+trCount2).val(itemList[i].CDI_ITEM_CLASS);
										changeVal(2,trCount2);
									}
									if(itemList[i].CDI_ITEM_TYPE=="点检项目"){
										trCount3++;
										var mySelect = "<select id='sel3_"+trCount3+"' name='paraMap"+trCount3+"@3#CDI_ITEM_CLASS' onchange='changeVal(3,"+trCount3+")' class=' input isSubmit  _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option><option value='0'>范围值</option>"
													+"<option value='1'>固定值</option>"
													+"<option value='2'>状态值</option>";	
										$("#deviceItem_3 tbody:last").append("<tr id='tr3_"+trCount3+"' ></tr>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' style='width: 13px;' value='tr3_"+trCount3+"' name='isSelect3'/></td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;'><input type='text' id='deviceItemCode3_"+trCount3+"' name='deviceItemCode3_"+trCount3+"' value='"+itemList[i].CDI_ITEM_CODE+"'/></td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'><input type='text' id='deviceItemName3_"+trCount3+"' name='deviceItemName3_"+trCount3+"' value='"+itemList[i].CDI_ITEM_NAME+"'/></td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;overflow: visible;text-align: center;'>"+mySelect+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;'><input type='text' id='deviceitemMaxvalue3_"+trCount3+"' name='deviceitemMaxvalue3_"+trCount3+"' value='"+itemList[i].CDI_ITEM_MAXVALUE+"'/></td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceitemMinvalue3_"+trCount3+"' name='deviceitemMinvalue3_"+trCount3+"' value='"+itemList[i].CDI_ITEM_MINVALUE+"'/></td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;'><input type='text' id='deviceItemUnit3_"+trCount3+"' name='deviceItemUnit3_"+trCount3+"' value='"+itemList[i].CDI_ITEM_UNIT+"'/></td>");
										$("#sel3_"+trCount3).val(itemList[i].CDI_ITEM_CLASS);
										changeVal(3,trCount3);
									}
									if(itemList[i].CDI_ITEM_TYPE=="校验项目"){
										trCount4++;
										var mySelect = "<select id='sel4_"+trCount4+"' name='paraMap"+trCount4+"@4#CDI_ITEM_CLASS' onchange='changeVal(4,"+trCount4+")' class=' input isSubmit  _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option><option value='0'>范围值</option>"
													+"<option value='1'>固定值</option>"
													+"<option value='2'>状态值</option>";	
										$("#deviceItem_4 tbody:last").append("<tr id='tr4_"+trCount4+"' ></tr>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' style='width: 13px;' value='tr4_"+trCount4+"' name='isSelect4'/></td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;'><input type='text' id='deviceItemCode4_"+trCount4+"' name='deviceItemCode4_"+trCount4+"' value='"+itemList[i].CDI_ITEM_CODE+"'/></td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'><input type='text' id='deviceItemName4_"+trCount4+"' name='deviceItemName4_"+trCount4+"' value='"+itemList[i].CDI_ITEM_NAME+"'/></td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;overflow: visible;text-align: center;'>"+mySelect+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;'><input type='text' id='deviceitemMaxvalue4_"+trCount4+"' name='deviceitemMaxvalue4_"+trCount4+"' value='"+itemList[i].CDI_ITEM_MAXVALUE+"'/></td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceitemMinvalue4_"+trCount4+"' name='deviceitemMinvalue4_"+trCount4+"' value='"+itemList[i].CDI_ITEM_MINVALUE+"'/></td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align: center;'><input type='text' id='deviceItemUnit4_"+trCount4+"' name='deviceItemUnit4_"+trCount4+"' value='"+itemList[i].CDI_ITEM_UNIT+"'/></td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;'><input type='text' id='deviceItemCycle4_"+trCount4+"' name='deviceItemCycle4_"+trCount4+"' value='"+itemList[i].CDI_ITEM_CYCLE+"'/></td>");
										$("#sel4_"+trCount4).val(itemList[i].CDI_ITEM_CLASS);
										changeVal(4,trCount4);
										//$("#sel4_"+trCount4).find("option[value='"+itemList[i].CDI_ITEM_CLASS+"]'").attr("selected",true);
										//$("#sel4_"+trCount4).trigger("chosen:updated");
									}
								}
								setChosen();//设置下拉框样式
							$(".glxb-table .chosen-container").css("width","100%");
							
							}
							//alert(itemList[0].CDI_ITEM_CODE);
							//console.log(itemIds);
							$("#deviceItemIds").val(itemIds);
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
	}
	
	function init(){
		setVal();
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
