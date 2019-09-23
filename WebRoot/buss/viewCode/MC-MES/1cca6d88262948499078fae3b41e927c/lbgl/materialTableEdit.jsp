<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	
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
			if(tag=="tag1"&&loaded==1){
    		    setChosen();//设置下拉框样式
    		    loaded++;
		    }
		    if(tag=="tag1"){
				document.getElementById("tag3").style.display="none";
				document.getElementById("tag4").style.display="";
				
		}
		if(tag=="tag2"){
			document.getElementById("tag3").style.display="";
			document.getElementById("tag4").style.display="none";
		}
					
		}
	</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
            <div style="margin-left:10px;">
				<s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
			</div>
			    <div class="optn">
			        <button type="button" onclick="editSave(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd"  style="height: 510px;">
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
		   				<jsp:param name="location" value="editForm" />
		            </jsp:include>
<bu:set name="paraMapObj" value="${dataId}" formId="167639778c8f4ee08caad77b61e5081c" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="167639778c8f4ee08caad77b61e5081c" />
	<input type="hidden" name="167639778c8f4ee08caad77b61e5081c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="code" id="code" value="" />
		<s:set name="_$viewId" value="'cc0e1f728f23464db5fee6a9384ee9b4'" />
		<s:set name="_$formId_1" value="'167639778c8f4ee08caad77b61e5081c'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:82px"/><span class="dot">*</span><bu:uitn colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" cssClass="isaddSubmit" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" style="width:82px"/><span class="dot">*</span><bu:uitn colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		    	<td class="name" style="width:68px"/><span class="dot">*</span><bu:uitn colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_PROCESS_FACE" cssClass="isaddSubmit" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		  
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c"  dataId="${dataId}" formIndex="1" style="width:200px"  /></bu:td>
			<td class="name" /><bu:uitn colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" /><bu:uitn colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		    	<td class="name" /><bu:uitn colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_ITEM_COUNT" cssClass="isaddSubmit" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>


	        <td class="name" /><bu:uitn colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" >
			<bu:ui colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:100px"/>
	
			</bu:td>

	
		</tr>
		<tr>
         	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CM_TRACK" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_TRACK" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_TRACK" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:200px"/>
			
			</bu:td>
	    
       </tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colspan="5" colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MEMO" rows="3" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" style="width:100%"/></bu:td>
		</tr>
	</table>
	<bu:jsVal formId="167639778c8f4ee08caad77b61e5081c" formIndex="1" />		<div style="padding:1px;"></div>
	
	<div class="js-tab">
	<div id="container">
		<DIV  style="margin-bottom: 11px;">
			<UL class="tab-list tab">
				
				<LI id="tag2" class="current"><A class="selectli1"
					onclick="switchTag('tag2','content2','','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="关联线别" /></SPAN> </A></LI>
				<LI id="tag1"><A class=""
					onclick="switchTag('tag1','content1','','');this.blur();"
					href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="料站表明细" /></SPAN>
				</A></LI>
                <LI id="tag3" style="display:block;margin-left:69%;">
					<div class="extend-btn" style="float: right;margin-top:8px;">
						<button type="button"    onclick="_addRowExtend('99b52ba36c464464aef5216e173ca678','3');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('99b52ba36c464464aef5216e173ca678','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
			</div>               
                                    
                </LI>
            <LI id="tag4" style="display:none;margin-left:69%;">
					<div class="extend-btn" style="float: right;margin-top:8px;">
						<button type="button"    onclick="showAddPopWin('1abddbae1d704169a987c0af3e06c1df','57dfee4dbc9f40b3bf376573e86795b4');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('1abddbae1d704169a987c0af3e06c1df','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
						
					</div>  
                                    
                </LI> 
			</UL>
		</DIV>
<DIV class="content1" id="content" >			
<DIV id="content1" data-tab="tag1" style="display:none">
		<div class="mod" >
		<!--	<div class="mod-hd"> 
				
					<div class="extend-btn" style="float: right;margin-top:8px;">
						<button type="button"    onclick="showAddPopWin('1abddbae1d704169a987c0af3e06c1df','57dfee4dbc9f40b3bf376573e86795b4');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('1abddbae1d704169a987c0af3e06c1df','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
						
					</div>
			</div>-->
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header " >
							<div class="datagrid-header-inner scroll001" id="datagrid-header-inner1abddbae1d704169a987c0af3e06c1df">
								<bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="2"  selfformid="1abddbae1d704169a987c0af3e06c1df" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"  style="height:200px" onscroll="ajaxTableScroll(this,'1abddbae1d704169a987c0af3e06c1df')">
							<table class="glxb-table fixedTable" style="width:100%;min-width:1750px;" id="addTable_1abddbae1d704169a987c0af3e06c1df"  >
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
		<div class="mod" >
		<!--	<div class="mod-hd"> 
					<div class="extend-btn" style="float: right;margin-top:8px;">
						<button type="button"    onclick="_addRowExtend('99b52ba36c464464aef5216e173ca678','3');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('99b52ba36c464464aef5216e173ca678','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>-->
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner99b52ba36c464464aef5216e173ca678">
								<bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="3"  selfformid="99b52ba36c464464aef5216e173ca678" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:180px">
							<table class="glxb-table fixedTable" style="width:100%;" id="addTable_99b52ba36c464464aef5216e173ca678" >
								<tbody id="tbody_99b52ba36c464464aef5216e173ca678" >
								</tbody>
							</table>
						</div>
						                <div style="display:none;">
										<dict:selectDict id="CMD_DEVICE_TYPE" name="CMD_DEVICE_TYPE" dictCode="CMD_DEVICE_TYPE" />
										</div >
						                <div style="display:none;">
										<dict:selectDict id="TRACK_TYPE" name="TRACK_TYPE" dictCode="TRACK_TYPE" />
										</div >	
						                <div style="display:none;">
										<dict:selectDict id="CHANEL_SN" name="CHANEL_SN" dictCode="CHANEL_SN" />
										</div >											
					</div>
				</div>
			</div>
		 </div>
</DIV>
</DIV>
</div>
</div>
									</form>
			</div>
		
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script>(function($){
  $(window).on('load',function(){
    //setPopScroll('.scroll1','.scroll001');
  })
})(jQuery)</script>
<script type="text/javascript">
    function delddd(){
        $("#tbody_1abddbae1d704169a987c0af3e06c1df").empty();
       
    }
	function init(){
	initEditDataLs();
	var dataAuth = $("#dataDataAuth");
//	console.log(dataAuth);
	    var dataList=$("#CM_MODEL_CODE_dataList").text();
	    var dataJson=JSON.parse(dataList);
	    //console.log(dataJson);
	    $("#paraMapObj_CM_MODEL_NAME").val(dataJson.CI_ITEM_NAME);
	    $("#paraMapObj_CM_MODEL_STANDARD").val(dataJson.CI_ITEM_SPEC);
	    $("#tag2").addClass("current");
	    $("#paraMapObj_CM_MODEL_CODE_SHOW").attr("class","input  input isSubmit  _VAL_OjbsData clearPopVal readonly");
	    $("#paraMapObj_CM_MODEL_CODE_SHOW").attr("disabled",true);
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	var parentWindow;
	$(function(){
		 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
		$("#code").val($("#paraMapObj_CM_MODEL_CODE").val());
	
	});

	
	function showAddPopWin(formId,exeid)
		{
			var piframeId = window.frameElement.id;
			var relcol = $("input[type='hidden'][name='relcol']").val();
			var url;
			var trid = getCurRow();
			var areaSn='';
			$("#addTable_99b52ba36c464464aef5216e173ca678").find("tbody tr td").find(":input[name^='paraMap'][name$='CML_AREA_SN']").each(function(i){
			    if(areaSn=='') areaSn+=$(this).val();
			    else{
			     areaSn=areaSn+","+$(this).val();
			    }
			});
			var  modelCode= $("#paraMapObj_CM_MODEL_CODE").val();
			if(modelCode==''){
			    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择机种" />",0,"",""); 
			    return;
			}
			if(areaSn=='') {
			   utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先关联线别" />",0,"","");
			   return;
			}
			url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&relcol=" + relcol + "&formId=" + formId  + "&areaSn=" + areaSn+"&modelCode="+modelCode;
			
			showPopWinFp(url, 680, 350,"","<dict:lang value="新增"/>","add","");
		}
		
        
        function addData(data,formId){
			
			 var trId=$("#addTable_"+formId+" tbody").find("tr:last").attr("id");
			 if(trId!=undefined){
			    var i=trId.indexOf("_");
			    curRowSeq=trId.substring(10,i);
			    curRowSeq++;
			 }
			 else{
			    curRowSeq=0;
			 }
			 //_addRowExtend(formId,'2');
			 newAddData();
		
		}
		function newAddData(){
	var obj1 = $("#CMD_DEVICE_TYPE").html();
    var obj2 = $("#TRACK_TYPE").html();
    var obj3 = $("#CHANEL_SN").html();
   // console.log("obj1:::"+obj1);
    //
 				    var i = $("#tbody_1abddbae1d704169a987c0af3e06c1df tr").length;
 				    var pre="paraMapObj_"+i+"_";
 				    var preName = "paraMap2@"+i+"#";
 				    var tempHtml = "<tr id='addTableTr"+(i+1)+"_1abddbae1d704169a987c0af3e06c1df' >"
         		        +"<td style='width:30px;text-align:center' class='datagrid-cell'><span><input type='checkbox' name='checkbox1abddbae1d704169a987c0af3e06c1df' id='checkbox1abddbae1d704169a987c0af3e06c1df' style='cursor: pointer;width:15px;height:30px;'></span><input type='hidden' class='associted' name='"+preName+"ID' value=''></td>"
         				+"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_DEVICE_TYPE2' name='paraMap2@CMD_DEVICE_TYPE' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ><select id='"+pre+"CMD_DEVICE_TYPE' name='paraMap2@CMD_DEVICE_TYPE2' style='width:100%'>"+obj1
         				+"</select></td>"
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_PROGRAM_NAME' name='paraMap2@CMD_PROGRAM_NAME' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_DEVICE_SEQ' name='paraMap2@CMD_DEVICE_SEQ' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                       // +"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_TRACK' name='"+preName+"CMD_TRACK' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE coctra' ><select id='"+pre+"CMD_TRACK2' name='"+preName+"CMD_TRACK2' class='coctra' style='width:100%'>"+obj2
                       // +"</select></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_TABLE_NO' name='paraMap2@CMD_TABLE_NO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_LOADPOINT' name='paraMap2@CMD_LOADPOINT' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_CHANEL_SN' name='paraMap2@CMD_CHANEL_SN' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ><select id='"+pre+"CMD_CHANEL_SN2' name='paraMap2@CMD_CHANEL_SN2' style='width:100%'>"+obj3
                        +"</select></td>"
                        +"<td style='position: relative; width: 150px;'><input type='hidden' id='"+pre+"CMD_ITEM_CODE' name='paraMap2@CMD_ITEM_CODE' value='' ><input editname='"+preName+"CMD_ITEM_CODE' textval='"+preName+"CMD_ITEM_CODESHOW' type='text' id='"+pre+"CMD_ITEM_CODE_SHOW' value='' maxlength='50' class='input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input' onclick=\"_showSelFkSql(this,'add%2Cb9f80468a9fe4b74ada4fceff23db738%2Ce39c1a17560c40639118d30ce3414d6b','物料代码','','%7B%22WP_WIDTH%22%3A%22600%22%2C%22WP_HEIGHT%22%3A%22600%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','360c00d3-10fd-44c1-b1de-2c554f254e91');\" readonly='readonly'></td>"
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_ITEM_NAME' name='paraMap2@CMD_ITEM_NAME' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"                        
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_ITEM_STANDARD' name='paraMap2@CMD_ITEM_STANDARD' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"                                                
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_FEEDER_SPEC' name='paraMap2@CMD_FEEDER_SPEC' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 100px;'><select id='"+pre+"CMD_TRY_FLAG' name='paraMap2@CMD_TRY_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                        +"<td style='position: relative; width: 100px;'><select id='"+pre+"CMD_SHKIP_FLAG' name='paraMap2@CMD_SHKIP_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"                        
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_POINT_NUM' name='paraMap2@CMD_POINT_NUM' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"                        
                        +"<td style='position: relative; width: 150px;'><input type='text' id='"+pre+"CMD_POINT_LOCATION' name='paraMap2@CMD_POINT_LOCATION' value=''  class='isSubmit input  _VAL_DATABASE'></td>"
                        +"<td style='position: relative; width: 80px;'><select id='"+pre+"CMD_BOM_FLAG' name='paraMap2@CMD_BOM_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                        +"<td style='position: relative;'><input type='text' id='"+pre+"CMD_MEMO' name='paraMap2@CMD_MEMO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"                        
                        +"</tr>";
                        $("#tbody_1abddbae1d704169a987c0af3e06c1df").append(tempHtml);
                        $('.scroll1').mCustomScrollbar("destroy");
                        setPopScroll('.scroll1','.scroll001');
                        
                        
		}
		function editData(formId,colNo,colNoValue)
		{
		
		    var trId=$("#addTable_"+formId+" tbody").find("tr:last").attr("id");
		     $("#"+trId).find(":input[name^='paraMap'][name$='"+colNo+"']").each(function(k){
		       // console.log("colNo===>",colNo);
		        if(colNo=='CMD_ITEM_CODE'){
		           //console.log($(this).attr('id'));
		           var show=$(this).attr('id')+"_SHOW";
		           
		           $("#"+show).val(colNoValue);
		        } 
		        if(colNo=='CMD_POINT_NUM'){
		           //console.log($(this).attr('id'));
		          //console.log("CMD_POINT_NUM==>",colNoValue);
		          var  num =$("#paraMapObj_CM_ITEM_COUNT").val();
		          num=Number(num)+Number(colNoValue);
		          $("#paraMapObj_CM_ITEM_COUNT").val(num);
		        } 
                $(this).val(colNoValue);
               // console.log("va__"+colNoValue);
                var idd = $(this).attr("id");
                //console.log("id__"+idd);
                //console.log("geshi::"+$(this)[0].tagName);
                
                if($(this)[0].tagName=='SELECT'){
                    $(this).trigger("chosen:updated");                
                }
                var tagNames=idd.lastIndexOf("CMD_DEVICE_TYPE2");
              //  console.log("tagNames:"+tagNames);
                if(tagNames!=-1){
                   console.log(idd.substring(0, idd.length - 1));
                    $("#"+idd.substring(0, idd.length - 1)).val($(this).val());    
                    $("#"+idd.substring(0, idd.length - 1)).trigger("chosen:updated");    
                }
                tagNames=idd.lastIndexOf("CMD_CHANEL_SN");
                if(tagNames!=-1){
                  // console.log(idd.substring(0, idd.length - 1));
                    $("#"+idd+"2").val($(this).val());    
                    $("#"+idd+"2").trigger("chosen:updated");    
                }
           // console.log("```````````````````````````````````");               
         });
         //setChosen();//设置下拉框样式
		// $(".glxb-table .chosen-container").css("width","100%");
		
		}
		
		function _delRowExtendConfirm(obj){
		    var tableId=obj.tableId;		    
			$("input[name='checkbox"+tableId+"']:checked").each(function() { // 遍历选中的checkbox
                var trIndex = $(this).parents("tr").index();  
                $("#addTable_"+tableId).find("tr:eq("+trIndex+")").remove();
                
		        
              });
              calItemCount(tableId);
		}
		
		function calItemCount(formId){
		//console.log("Sssssssssssssssssssssssssssssssssssssssss");
		  var relV;
		  var itemCount=0;
		  //console.log(formId);
		  $("#addTable_"+formId+" tbody tr td").find(":input[name^='paraMap'][name$='CMD_POINT_NUM']").each(function(k){
		      relV=$(this).val();
		      console.log("relV==>",relV);
		      itemCount=Number(itemCount)+Number(relV);
		  });
		  
		  //$("#paraMapObj_CM_STAUS").val(itemCount);
		  console.log("itemCount==>",itemCount);
		  $("#paraMapObj_CM_ITEM_COUNT").val(itemCount);
		}
		
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
    var dataAuth = $("#deptLs_data_auth").val();
    var dataId = $("input[name='dataId']").val();
    util.showLoading("处理中...");
    var cmSn = $("#paraMapObj_CM_SN").val();
    jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=46d7f6e7f17141248c87891bf4c92b72",
 	    	data:{
 	    	    "flag":"DelM",
 	    	    "cmSn":cmSn,
 	    	    "dataId":dataId
 	    	},
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
         				+"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_DEVICE_TYPE' name='paraMap2@CMD_DEVICE_TYPE' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ><select id='"+pre+"CMD_DEVICE_TYPE2' name='paraMap2@CMD_DEVICE_TYPE2' style='width:100%'>"+obj1
         				+"</select></td>"
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_PROGRAM_NAME' name='paraMap2@CMD_PROGRAM_NAME' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_DEVICE_SEQ' name='paraMap2@CMD_DEVICE_SEQ' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        //+"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_TRACK' name='"+preName+"CMD_TRACK' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE coctra' ><select id='"+pre+"CMD_TRACK2' name='"+preName+"CMD_TRACK2' class='coctra' style='width:100%'>"+obj2
                        //+"</select></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_TABLE_NO' name='paraMap2@CMD_TABLE_NO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_LOADPOINT' name='paraMap2@CMD_LOADPOINT' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 100px;'><input type='hidden' id='"+pre+"CMD_CHANEL_SN' name='paraMap2@CMD_CHANEL_SN' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ><select id='"+pre+"CMD_CHANEL_SN2' name='paraMap2@CMD_CHANEL_SN2' style='width:100%'>"+obj3
                        +"</select></td>"
                        +"<td style='position: relative; width: 150px;'><input type='hidden' id='"+pre+"CMD_ITEM_CODE' name='paraMap2@CMD_ITEM_CODE' value='' ><input editname='"+preName+"CMD_ITEM_CODE' textval='"+preName+"CMD_ITEM_CODESHOW' type='text' id='"+pre+"CMD_ITEM_CODE_SHOW' value='' maxlength='50' class='input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input' onclick=\"_showSelFkSql(this,'add%2Cb9f80468a9fe4b74ada4fceff23db738%2Ce39c1a17560c40639118d30ce3414d6b','物料代码','','%7B%22WP_WIDTH%22%3A%22600%22%2C%22WP_HEIGHT%22%3A%22600%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','360c00d3-10fd-44c1-b1de-2c554f254e91');\" readonly='readonly'><input type='hidden' id='paraMapObj_"+i+"_CMD_ITEM_CODE_SHOW_isOpenDataAuth' value='1'></td>"
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_ITEM_NAME' name='paraMap2@CMD_ITEM_NAME' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"                        
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_ITEM_SPEC' name='paraMap2@CMD_ITEM_SPEC' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"                                                
                        +"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CMD_FEEDER_SPEC' name='paraMap2@CMD_FEEDER_SPEC' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                        +"<td style='position: relative; width: 100px;'><select id='"+pre+"CMD_TRY_FLAG' name='paraMap2@CMD_TRY_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                        +"<td style='position: relative; width: 100px;'><select id='"+pre+"CMD_SHKIP_FLAG' name='paraMap2@CMD_SHKIP_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"                        
                        +"<td style='position: relative; width: 80px;'><input type='text' id='"+pre+"CMD_POINT_NUM' name='paraMap2@CMD_POINT_NUM' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"                        
                        +"<td style='position: relative; width: 150px;'><input type='text' id='"+pre+"CMD_POINT_LOCATION' name='paraMap2@CMD_POINT_LOCATION' value=''  class='isSubmit input  _VAL_DATABASE'></td>"
                        +"<td style='position: relative; width: 80px;'><select id='"+pre+"CMD_BOM_FLAG' name='paraMap2@CMD_BOM_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                        +"<td style='position: relative;'><input type='text' id='"+pre+"CMD_MEMO' name='paraMap2@CMD_MEMO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"                        
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
 				    $("#"+pre+"CMD_ITEM_NAME").val(pList[i].CI_ITEM_NAME); 
 				    $("#"+pre+"CMD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC); 
 				}
 				$('.scroll1').mCustomScrollbar("destroy");
                setPopScroll('.scroll1','.scroll001');
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
    var dataAuth = $("#deptLs_data_auth").val();
    var dataId = $("input[name='dataId']").val();
    jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=46d7f6e7f17141248c87891bf4c92b72",
 	    	data:{
 	    	    "flag":"Line",
 	    	    "cmSn":cmSn,
 	    	    "dataId":dataId
 	    	},
 			success: function(data){
 			    util.closeLoading();
 				var pList=data.ajaxList;
                                $("#tbody_99b52ba36c464464aef5216e173ca678").empty();
               
 				for(var i=0;i<pList.length;i++){
 				    var j=i+1;
 				    var pre="paraMap0"+i+"_";
 				    var preName = "paraMap3@0"+i+"#";
 				    var tempHtml = "<tr id='addTableTr"+j+"_b9f80468a9fe4b74ada4fceff23db738' >"
         		        +"<td style='width:30px;text-align:center' class='datagrid-cell'><span><input type='checkbox' name='checkbox99b52ba36c464464aef5216e173ca678' style='cursor: pointer;width:13px;height:30px;'></span><input type='hidden' class='associted' name='"+preName+"ID' value='"+pList[i].ID+"'></td>"
         				+"<td style='position: relative; width: 300px;'><input type='hidden' id='"+pre+"CML_AREA_SN' name='"+preName+"CML_AREA_SN' value='' class='_VAL_NULL isSubmit input _VAL_DATABASE'>"
         				+"<input editname='"+preName+"CML_AREA_SN' textval='"+preName+"CML_AREA_SNSHOW' type='text' id='"+pre+"CML_AREA_SN_SHOW' value='' maxlength='50' class='input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input' onclick=\"_showSelFkSql(this,'edit%2C99b52ba36c464464aef5216e173ca678%2C1774111b72f94b25ad491a1e2acd70f6','线别代码','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','3fbbc995-9999-471e-b7ff-b09e4a7aa6f2');\" readonly='readonly'><input type='hidden' id='paraMap"+i+"_CML_AREA_SN_SHOW_isOpenDataAuth' value='1'>"
         				+"</td>"
         				+"<td style='position: relative; width: 300px;'><input type='text' id='"+pre+"CML_AREA_NAME' name='paraMap2@CML_AREA_NAME' value='' maxlength='50' class='isSubmit input readonly _VAL_DATABASE' disabled='disabled'></td>"
                        +"<td style='position: relative;'><input type='text' id='"+pre+"CML_WORKSHOP_NAME' name='paraMap2@CML_WORKSHOP_NAME' value='' maxlength='50' class='isSubmit input readonly _VAL_DATABASE' disabled='disabled'></td>"
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
function excelImport(formId,exeid)
		{
			var piframeId = window.frameElement.id;
			var url;
			var areaSn='';
			$("#addTable_99b52ba36c464464aef5216e173ca678").find("tbody tr td").find(":input[name^='paraMap'][name$='CML_AREA_SN']").each(function(i){
			    if(areaSn=='') areaSn+=$(this).val();
			    else{
			     areaSn=areaSn+","+$(this).val();
			    }
			});
			 if(areaSn=='') {
			   utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先关联线别" />",0,"","");
			   return;
			} 
			url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId  + "&formId=" + formId  + "&areaSn=" + areaSn;
			
			showPopWinFp(url, 680, 350,"","<dict:lang value="Excel导入"/>","add","");
		}
		
		function editSave(thisObj){
                        isQuery = false;
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
                       if(!val.valDataBaseSetData()){
                               return ;
                        }
                        
           var areaSn='';
			$("#addTable_99b52ba36c464464aef5216e173ca678").find("tbody tr td").find(":input[name^='paraMap'][name$='CML_AREA_SN']").each(function(i){
			    if(areaSn=='') areaSn+=$(this).val();
			    else{
			     areaSn=areaSn+","+$(this).val();
			    }
			});
		//	var countLength = $("#tbody_99b52ba36c464464aef5216e173ca678 tr").length;
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                        document.forms.editForm.action ="${path}buss/bussModel_exeFunc.ms?funcMId=bfe449aed57440b39ca4edc5f7eebe05&areaSn="+areaSn; 
                        emptyValToHide('N');
			document.forms.editForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
}
function cbFun(MKEY,val,obj){
	_thisSelObj.value = val;
	var editName=$(_thisSelObj).attr("editName");
	var idshow=$(_thisSelObj).attr("id");
	
	var ids = idshow.substring(0,idshow.indexOf("_SHOW"));
	$("#"+ids).val(MKEY);
	$("input[name='"+editName+"']").val(MKEY);
	if(null!=obj){
	    
		var indx = editName.indexOf("#");	
        var ide = idshow.indexOf("CMD_ITEM_CODE_SHOW");	

		if(editName.indexOf("CMD_ITEM_CODE")>0){
	//	paraMapObj_0_CI_ITEM_NAME+paraMapObj_0_CMD_ITEM_CODE_SHOW
		
		var CB_ITEM_NAME = idshow.substring(0,ide)+"CMD_ITEM_NAME";
		$("#"+CB_ITEM_NAME).val(obj.eq(4).text());
		
		var CB_ITEM_SPEC = idshow.substring(0,ide)+"CMD_ITEM_SPEC";
		$("#"+CB_ITEM_SPEC).val(obj.eq(5).text());
		
		var CMD_ITEM_STANDARD = idshow.substring(0,ide)+"CMD_ITEM_STANDARD";
		$("#"+CMD_ITEM_STANDARD).val(obj.eq(5).text());
		//var CB_ITEM_TYPE = editName.substring(0,indx)+"#"+"CMD_ITEM_TYPE";
		//var str='';
		//if(obj.eq(6).text()==1){
		//	str='PCB';
		//}else{
		//	str='物料';
    	//	}
		//$("input[name='"+CB_ITEM_TYPE+"']").val(str);		    
		}else{
		var CML_AREA_NAME = editName.substring(0,indx)+"#"+"CML_AREA_NAME";
		$("input[name='"+CML_AREA_NAME+"']").val(obj.eq(4).text());
		var CML_WORKSHOP_NAME = editName.substring(0,indx)+"#"+"CML_WORKSHOP_NAME";
		$("input[name='"+CML_WORKSHOP_NAME+"']").val(obj.eq(5).text());		    
		}

	}
	_thisSelObj.focus();
}
//$("#paraMapObj_CM_TRACK").change(function(){
//    var newval = $(this).val();
//    $(".coctra").val(newval);
//})

function cbFun3(MKEY,val,obj){//物料弹窗回调
	_thisSelObj.value = val;
	var editName=$(_thisSelObj).attr("id");
	$("input[name='"+editName+"']").val(MKEY);
	//var editObj = "input[type='hidden'][name='"+$(_thisSelObj).attr("editName")+"']";paraMapObj_0_CMD_ITEM_NAME
	if(null!=obj){
		//var indx = editName.indexOf("#");
		var CB_ITEM_CODE = editName.substring(0,12)+"_CMD_ITEM_CODE";
		$("input[id='"+CB_ITEM_CODE+"']").val(obj.eq(3).text());		
		var CB_ITEM_NAME = editName.substring(0,12)+"_CMD_ITEM_NAME";
		$("input[id='"+CB_ITEM_NAME+"']").val(obj.eq(4).text());
		var CB_ITEM_SPEC = editName.substring(0,12)+"_CMD_ITEM_SPEC";
		$("input[id='"+CB_ITEM_SPEC+"']").val(obj.eq(5).text());
		var CB_ITEM_TYPE = editName.substring(0,12)+"_CMD_ITEM_TYPE";
		var str='';
		if(obj.eq(6).text()==1){
			str='PCB';
		}else{
			str='物料';
		}
		$("input[id='"+CB_ITEM_TYPE+"']").val(str);
	}
	_thisSelObj.focus();
}
function cbFun6(MKEY,val,obj){//线别回调
	_thisSelObj.value = val;
	var editName=$(_thisSelObj).attr("id");
	$("input[name='"+editName+"']").val(MKEY);
	//var editObj = "input[type='hidden'][name='"+$(_thisSelObj).attr("editName")+"']";paraMapObj_0_CMD_ITEM_NAME
	if(null!=obj){
		//var indx = editName.indexOf("#");
		var CML_AREA_SN = editName.substring(0,12)+"_CML_AREA_SN";
		$("input[id='"+CML_AREA_SN+"']").val(obj.eq(3).text());		
		var CML_AREA_NAME = editName.substring(0,12)+"_CML_AREA_NAME";
		$("input[id='"+CML_AREA_NAME+"']").val(obj.eq(4).text());
		var CML_WORKSHOP_NAME = editName.substring(0,12)+"_CML_WORKSHOP_NAME";
		$("input[id='"+CML_WORKSHOP_NAME+"']").val(obj.eq(5).text());
	}
	_thisSelObj.focus();
}

</script>
<bu:script viewId="cc0e1f728f23464db5fee6a9384ee9b4" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
