<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>

<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
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
		var addTableTrMap;
		var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content,url) {
			if(currentTag == tag){
				return false;
			}
			document.getElementById("content1").style.display="";
			
			for (i = 1; i < (tab_len+1); i++) {
				if ("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
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
	
	</script>
	
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name=iframeId value="${iframeId}">
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
										<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
		   				<jsp:param name="location" value="editForm" />
		            </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="167639778c8f4ee08caad77b61e5081c" type="detail" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="167639778c8f4ee08caad77b61e5081c" />
	<input type="hidden" name="167639778c8f4ee08caad77b61e5081c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cc0e1f728f23464db5fee6a9384ee9b4'" />
		<s:set name="_$formId_1" value="'167639778c8f4ee08caad77b61e5081c'" />
		<s:set name="_$type" value="'detail'" />
		<tr>
			<td class="name" style="width:84px"/><bu:uitn colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec"  colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" cssClass="isaddSubmit" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width:82px"/><bu:uitn colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		    	<td class="name" style="width:68px"/><bu:uitn colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_PROCESS_FACE" cssClass="isaddSubmit" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		  
		</tr>
		<tr>
	        <td class="name" /><bu:uitn colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" /><bu:uitn colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" /><bu:uitn colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		
		
		<tr>
			<td class="name" /><bu:uitn colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		    	<td class="name" /><bu:uitn colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_ITEM_COUNT" cssClass="isaddSubmit" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
	        	<td class="name" /><bu:uitn colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
	
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colspan="5" colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MEMO" rows="3" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:100%"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="167639778c8f4ee08caad77b61e5081c" formIndex="1" />		<div style="padding:1px;"></div>

	<div class="js-tab">
	<div id="container">
		<DIV class="hd" style="margin-bottom: 11px;">
			<UL class="tab-list tab">
				
				<LI id="tag2" class="current"><A class="selectli1"
					onclick="switchTag('tag2','content2','','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="关联线别" /></SPAN> </A></LI>
				<LI id="tag1"><A class=""
					onclick="switchTag('tag1','content1','','');this.blur();"
					href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="料站表明细" /></SPAN>
				</A></LI>

			</UL>
		</DIV>
<DIV class="content1" id="content" >			
<DIV id="content1" data-tab="tag1" style="display:none">
		<div class="mod" >
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" style="height:300px"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner1abddbae1d704169a987c0af3e06c1df">
								<bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="2"  selfformid="1abddbae1d704169a987c0af3e06c1df" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:260px" onscroll="ajaxTableScroll(this,'1abddbae1d704169a987c0af3e06c1df')">
							<table class="glxb-table fixedTable" style="width:100%;" id="addTable_1abddbae1d704169a987c0af3e06c1df"  >
								<tbody id="tbody_1abddbae1d704169a987c0af3e06c1df" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
</DIV>
<DIV id="content2"  data-tab="tag2">
	
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="height:300px" >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner99b52ba36c464464aef5216e173ca678">
								<bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="3"  selfformid="99b52ba36c464464aef5216e173ca678" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:260px">
							<table class="glxb-table fixedTable" style="width:100%" id="addTable_99b52ba36c464464aef5216e173ca678" >
								<tbody id="tbody_99b52ba36c464464aef5216e173ca678" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		
</DIV>
</DIV>
</div>
</div>

			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
	function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			if(relColVal==''||relColVal==null||relColVal==undefined||relColVal=='null'){
			     var colNo=$("input[name='COL_NO"+tableId+"']").val();
			     if(colNo=='ID') relColVal=$("input[type='hidden'][name='dataId']").val();
			     else{
			        relColVal=$("input[name='"+colNo+"']").val();
			     }
			}
			var url ="/N2/buss/bussModel_editExtendSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// 
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    async:false,
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					/* if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					} */
					var row = $(data.ajaxPage.tableData);
					console.log(row)
					_toClickColor(row);// 
					addTtable.append(row);
					var relV="";
					var colNo=$("input[name='COL_NO_D"+tableId+"']").val();
					$("#addTable_"+tableId+" tbody tr td").find(":input[name^='paraMap'][name$='"+colNo+"']").each(function(k){
                           if(k>0) relV+=";";
                           relV+=$(this).val();
                           
                    });
                    if(relV=='') relV=relColVal;
                    var input=document.createElement("input");
                    input.type="hidden";
                    input.name=tableId+'_'+colNo;
                    input.value=relV;
                    document.getElementById('editForm').appendChild(input);
					
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				//	setChosen();//设置下拉框样式
					$(".glxb-table .chosen-container").css("width","100%");
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
	$(function(){
	    
	    $(".mod-hd").remove();
	})	
	
	
function init(){
		
	initEditDataLs();

	   /* var dataList=$("#CM_MODEL_CODE_dataList").text();
	    var dataJson=JSON.parse(dataList);
	    //console.log(dataJson);
	    $("#paraMapObj_CM_MODEL_NAME").val(dataJson.CI_ITEM_NAME);
	    $("#paraMapObj_CM_MODEL_STANDARD").val(dataJson.CI_ITEM_SPEC);
	    $("#tag2").addClass("current");
	  
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();*/
	}//初始化方法
	
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			
			});					

	var parentWindow;
	$(function(){
		 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
	});
		
		function initEditDataLs(){
            var relColVal=$("#paraMapObj_CM_SN").val();
            initLineTable();
            initDetTable();
            //getEditRows("1abddbae1d704169a987c0af3e06c1df","2","167639778c8f4ee08caad77b61e5081c","","169fb0cbc258411b9fff8e59f9ff7ff5",relColVal);
            //getEditRows("99b52ba36c464464aef5216e173ca678","3","167639778c8f4ee08caad77b61e5081c","","f3a8e0d4da0542539db9956286dd37e8",relColVal);

}
function initDetTable(){
    var obj1 = $("#CMD_DEVICE_TYPE").html();
    var obj2 = $("#TRACK_TYPE").html();
    var obj3 = $("#CHANEL_SN").html();
    util.showLoading("处理中...");
    var cmSn = $("#paraMapObj_CM_SN").val();
    var dataId = $("input[name='dataId']").val();
    console.log(dataId);
    jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=46d7f6e7f17141248c87891bf4c92b72",
 	    	data:{"flag":"DelM","cmSn":cmSn,"dataId":dataId},
 			success: function(data){
 			    util.closeLoading();
 				var pList=data.ajaxList;
                $("#tbody_1abddbae1d704169a987c0af3e06c1df").empty();
 				for(var i=0;i<pList.length;i++){
 				    var j=i+1;
 				    var pre="paraMapObj_"+i+"_";
 				    var preName = "paraMap2@"+i+"#";
 				    var tempHtml = "<tr id='addTableTr"+j+"_1abddbae1d704169a987c0af3e06c1df' >"
         		        +"<td style='width:30px;text-align:center' class='datagrid-cell'><span><input type='checkbox' name='checkbox1abddbae1d704169a987c0af3e06c1df' id='checkbox1abddbae1d704169a987c0af3e06c1df' style='cursor: pointer;width:15px;height:30px;'></span><input type='hidden' class='associted' name='"+preName+"ID' value='"+pList[i].ID+"'></td>"
         				+"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_DEVICE_TYPE' name='"+preName+"CMD_DEVICE_TYPE' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' >"
         				+"</td>"
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_PROGRAM_NAME' name='"+preName+"CMD_PROGRAM_NAME' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_DEVICE_SEQ' name='"+preName+"CMD_DEVICE_SEQ' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        //+"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_TRACK' name='"+preName+"CMD_TRACK' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE coctra' ><select id='"+pre+"CMD_TRACK2' name='"+preName+"CMD_TRACK2' class='coctra' style='width:100%'>"+obj2
                        //+"</select></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_TABLE_NO' name='"+preName+"CMD_TABLE_NO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_LOADPOINT' name='"+preName+"CMD_LOADPOINT' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_CHANEL_SN' name='"+preName+"CMD_CHANEL_SN' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' >"
                        +"</td>"
                        +"<td style='position: relative; width: 150px;'><input type='text' id='"+pre+"CMD_ITEM_CODE' name='"+preName+"CMD_ITEM_CODE' value='' ></td>"
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CI_ITEM_NAME' name='"+preName+"CI_ITEM_NAME' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"                        
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CI_ITEM_SPEC' name='"+preName+"CI_ITEM_SPEC' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"                                                
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_FEEDER_SPEC' name='"+preName+"CMD_FEEDER_SPEC' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 100px;'><select id='"+pre+"CMD_TRY_FLAG' name='"+preName+"CMD_TRY_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                        +"<td style='position: relative; width: 100px;'><select id='"+pre+"CMD_SHKIP_FLAG' name='"+preName+"CMD_SHKIP_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"                        
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_POINT_NUM' name='"+preName+"CMD_POINT_NUM' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"                        
                        +"<td style='position: relative; width: 150px;'><input type='text' id='"+pre+"CMD_POINT_LOCATION' name='"+preName+"CMD_POINT_LOCATION' value=''  class='isSubmit input  _VAL_DATABASE'></td>"
                        +"<td style='position: relative; width: 80px;'><select id='"+pre+"CMD_BOM_FLAG' name='"+preName+"CMD_BOM_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                        +"<td style='position: relative;'><input type='text' id='"+pre+"CMD_MEMO' name='"+preName+"CMD_MEMO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"                        
                        +"</tr>";
                    $("#tbody_1abddbae1d704169a987c0af3e06c1df").append(tempHtml);
                    
 				    $("#"+pre+"CMD_DEVICE_TYPE").val(pList[i].CMD_DEVICE_TYPE);
 				    $("#"+pre+"CMD_DEVICE_TYPE2").val(pList[i].CMD_DEVICE_TYPE);
 				    $("#"+pre+"CMD_PROGRAM_NAME").val(pList[i].CMD_PROGRAM_NAME);
 				    $("#"+pre+"CMD_DEVICE_SEQ").val(pList[i].CMD_DEVICE_SEQ);
 				    $("#"+pre+"CMD_TRACK").val(pList[i].CMD_TRACK);
 				    $("#"+pre+"CMD_TRACK2").val(pList[i].CMD_TRACK);
 				    $("#"+pre+"CMD_TABLE_NO").val(pList[i].CMD_TABLE_NO);
 				    $("#"+pre+"CMD_LOADPOINT").val(pList[i].CMD_LOADPOINT);
 				    $("#"+pre+"CMD_CHANEL_SN").val(pList[i].CMD_CHANEL_SN);
 				    $("#"+pre+"CMD_CHANEL_SN2").val(pList[i].CMD_CHANEL_SN);
 				    $("#"+pre+"CMD_ITEM_CODE").val(pList[i].CMD_ITEM_CODE);
 				    $("#"+pre+"CMD_ITEM_CODE_SHOW").val(pList[i].CMD_ITEM_CODE);
 				    $("#"+pre+"CMD_FEEDER_SPEC").val(pList[i].CMD_FEEDER_SPEC);
 				    $("#"+pre+"CMD_TRY_FLAG").val(pList[i].CMD_TRY_FLAG);
 				    $("#"+pre+"CMD_SHKIP_FLAG").val(pList[i].CMD_SHKIP_FLAG);
 				    $("#"+pre+"CMD_POINT_NUM").val(pList[i].CMD_POINT_NUM);
 				    $("#"+pre+"CMD_POINT_LOCATION").val(pList[i].CMD_POINT_LOCATION);
 				    $("#"+pre+"CMD_BOM_FLAG").val(pList[i].CMD_BOM_FLAG);
 				    $("#"+pre+"CMD_MEMO").val(pList[i].CMD_MEMO);
 				    $("#"+pre+"CI_ITEM_NAME").val(pList[i].CI_ITEM_NAME); 
 				    $("#"+pre+"CI_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC); 
 				}
 			},
 			error: function(msg){
 				util.closeLoading();
	            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"260","");
 
 		   }
 		});        
}
function initLineTable(){
    util.showLoading("处理中...");
    var cmSn = $("#paraMapObj_CM_SN").val();
    var dataId = $("input[name='dataId']").val();
    console.log(dataId);
    jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=46d7f6e7f17141248c87891bf4c92b72",
 	    	data:{"flag":"Line","cmSn":cmSn,"dataId":dataId},
 			success: function(data){
 			    util.closeLoading();
 				var pList=data.ajaxList;
                                $("#tbody_99b52ba36c464464aef5216e173ca678").empty();
 				for(var i=0;i<pList.length;i++){
 				    var j=i+1;
 				    var pre="paraMapObj_"+i+"_";
 				    var preName = "paraMap3@"+i+"#";
 				    var tempHtml = "<tr id='addTableTr"+j+"_b9f80468a9fe4b74ada4fceff23db738' >"
         		        +"<td style='width:30px;text-align:center' class='datagrid-cell'><span><input type='checkbox' name='checkbox99b52ba36c464464aef5216e173ca678' style='cursor: pointer;width:13px;height:30px;'></span><input type='hidden' class='associted' name='"+preName+"ID' value='"+pList[i].ID+"'></td>"
         				+"<td style='position: relative; width: 300px;'><input type='hidden' id='"+pre+"CML_AREA_SN' name='"+preName+"CML_AREA_SN' value='' class='_VAL_NULL isSubmit input _VAL_DATABASE'>"
         				//+"<input editname='"+preName+"CML_AREA_SN' textval='"+preName+"CML_AREA_SNSHOW' type='text' id='"+pre+"CML_AREA_SN_SHOW' value='' maxlength='50' class='input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input' onclick=\"_showSelFkSql(this,'edit%2C99b52ba36c464464aef5216e173ca678%2C1774111b72f94b25ad491a1e2acd70f6','线别代码','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','3fbbc995-9999-471e-b7ff-b09e4a7aa6f2');\" readonly='readonly'>"
         				+"</td>"
         				+"<td style='position: relative; width: 300px;'><input type='text' id='"+pre+"CML_AREA_NAME' name='"+preName+"CML_AREA_NAME' value='' maxlength='50' class='isSubmit input readonly _VAL_DATABASE' disabled='disabled'></td>"
                        +"<td style='position: relative;'><input type='text' id='"+pre+"CML_WORKSHOP_NAME' name='"+preName+"CML_WORKSHOP_NAME' value='' maxlength='50' class='isSubmit input readonly _VAL_DATABASE' disabled='disabled'></td>"
                        +"</tr>";
                    $("#tbody_99b52ba36c464464aef5216e173ca678").append(tempHtml);
                    
 				    $("#"+pre+"CML_AREA_SN").val(pList[i].CML_AREA_SN);
 				    $("#"+pre+"CML_AREA_SN_SHOW").val(pList[i].CML_AREA_SN);
 				    $("#"+pre+"CML_AREA_NAME").val(pList[i].CML_AREA_NAME);
 				    $("#"+pre+"CML_WORKSHOP_NAME").val(pList[i].CML_WORKSHOP_NAME);
 				}
 			},
 			error: function(msg){
 				util.closeLoading();
	            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"260","");
 
 		   }
 		});    
}
		
		/*function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/

		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
    
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');	

  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
