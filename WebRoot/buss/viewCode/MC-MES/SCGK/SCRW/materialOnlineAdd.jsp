<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 

	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
	target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
               <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>

			    <div class="optn">
			        <button type="button" onclick="saveObj();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height:250px;">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="11ff50fd76e4429382befd74804e9d00" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="11ff50fd76e4429382befd74804e9d00" />
	<input type="hidden" name="11ff50fd76e4429382befd74804e9d00" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b5d3e2e1d1d5496dbe4ffe101cb72a5d'" />
		<s:set name="_$formId_1" value="'11ff50fd76e4429382befd74804e9d00'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CMO_AREA_SN" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_AREA_SN" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_AREA_SN" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_AREA_SN}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CMO_ITEM_CODE" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_ITEM_CODE" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_ITEM_CODE" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="B#CI_ITEM_NAME" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="B#CI_ITEM_NAME" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="B#CI_ITEM_NAME" formId="11ff50fd76e4429382befd74804e9d00" value="%{B#CI_ITEM_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="B#CI_ITEM_SPEC" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="B#CI_ITEM_SPEC" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="B#CI_ITEM_SPEC" formId="11ff50fd76e4429382befd74804e9d00" value="%{B#CI_ITEM_SPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CMO_DEVICE_SEQ" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_DEVICE_SEQ" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_DEVICE_SEQ" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_DEVICE_SEQ}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CMO_TABLE_NO" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_TABLE_NO" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_TABLE_NO" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_TABLE_NO}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CMO_LOADPOINT" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_LOADPOINT" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_LOADPOINT" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_LOADPOINT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CMO_CHANEL_SN" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_CHANEL_SN" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_CHANEL_SN" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_CHANEL_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CMO_POINT_LOCATION" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_POINT_LOCATION" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_POINT_LOCATION" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_POINT_LOCATION}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CMO_POINT_NUM" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_POINT_NUM" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_POINT_NUM" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_POINT_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" style="width:80px;"/><bu:uitn colNo="CMO_TRY_FLAG" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_TRY_FLAG" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_TRY_FLAG" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_TRY_FLAG}" formIndex="1" />
			<bu:uitn colNo="CMO_SHKIP_FLAG" formId="11ff50fd76e4429382befd74804e9d00" />
			<bu:ui colNo="CMO_SHKIP_FLAG" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_SHKIP_FLAG}" formIndex="1" />			
			</bu:td>
			<td>&nbsp;</td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CMO_TRACK" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<bu:td cssClass="dec-self" colNo="CMO_TRACK" formId="11ff50fd76e4429382befd74804e9d00" ><bu:ui colNo="CMO_TRACK" formId="11ff50fd76e4429382befd74804e9d00" value="%{CMO_TRACK}" formIndex="1" /></bu:td>		

		</tr>
	</table>
			<bu:jsVal formId="11ff50fd76e4429382befd74804e9d00" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:script viewId="b5d3e2e1d1d5496dbe4ffe101cb72a5d" />
<script type="text/javascript">
$(function(){
    mySetChosen();
})
	function init(){
		//$("#paraMap1_CMO_AREA_SN").attr("onchange","getDeviceSeq()");
		//$("#paraMap1_CMO_DEVICE_SEQ").attr("onchange","getTable()");
	//	$("#paraMap1_CMO_TABLE_NO").attr("onchange","getLoadPoint()");
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	//根据线别获取设备序号并生成下拉框
	function getDeviceSeq(){
	        var getDeviceUrl="${path}buss/bussModel_exeFunc.ms?funcMId=48f7f1bd00d74224b17fd916e5db1af0";//VM-在线料表-新增 操作功能 加载设备信息

	        var areaId = $("#paraMap1_CMO_AREA_SN").val();
	        $("#paraMap1_CMO_TABLE_NO").empty();
 		$("#paraMap1_CMO_TABLE_NO").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_CMO_TABLE_NO").trigger("chosen:updated");
 		
 		$("#paraMap1_CMO_LOADPOINT").empty();
 		$("#paraMap1_CMO_LOADPOINT").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_CMO_LOADPOINT").trigger("chosen:updated");
 				
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getDeviceUrl,
 	    	        data:{
 	    	            "type":"deviceSeq",
 	    	            "areaId":areaId
 	    	        },
 			success: function(data){
 				var pList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<pList.length;i++){
 				    tempOption = tempOption + "<option value='"+pList[i].CAD_DEVICE_SEQUENCE+"'>"+pList[i].CAD_DEVICE_SEQUENCE+"</option>" ;
 				}
 				$("#paraMap1_CMO_DEVICE_SEQ").empty();
 				$("#paraMap1_CMO_DEVICE_SEQ").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_CMO_DEVICE_SEQ").append(tempOption);
 				mySetChosen();
 				$("#paraMap1_CMO_DEVICE_SEQ").trigger("chosen:updated");
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					//utilsFp.alert("error:"+errorThrown);
 					 utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
 				}
 		   }
 		});
 		
	}
	
	//根据设备序号获取Table并生成下拉框
	/*
	function getTable(){
	        var getDeviceUrl="${path}buss/bussModel_exeFunc.ms?funcMId=48f7f1bd00d74224b17fd916e5db1af0";

	        var areaId = $("#paraMap1_CMO_AREA_SN").val();
	        var table = $("#paraMap1_CMO_DEVICE_SEQ").val();
	        $("#paraMap1_CMO_LOADPOINT").empty();
 		$("#paraMap1_CMO_LOADPOINT").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_CMO_LOADPOINT").trigger("chosen:updated");
 		
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getDeviceUrl,
 	    	        data:{
 	    	          "type":"deviceTable",
 	    	          "table":table,
 	    	          "areaId":areaId
 	    	        },
 			success: function(data){
 				var pList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<pList.length;i++){
 				    tempOption = tempOption + "<option value='"+pList[i].CDL_TABLE+"'>"+pList[i].CDL_TABLE+"</option>" ;
 				}
 				$("#paraMap1_CMO_TABLE_NO").empty();
 				$("#paraMap1_CMO_TABLE_NO").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_CMO_TABLE_NO").append(tempOption);
 				$("#paraMap1_CMO_TABLE_NO").trigger("chosen:updated");
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					//utilsFp.alert("error:"+errorThrown);
 					utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
 				}
 		   }
 		});
 	
	}
	*/
	//根据Table获取料站并生成下拉框
	/*
	function getLoadPoint(){
		var areaId = $("#paraMap1_CMO_AREA_SN").val();
	        var table = $("#paraMap1_CMO_DEVICE_SEQ").val();
	        var loadPoint= $("#paraMap1_CMO_TABLE_NO").val();
	        var getDeviceUrl="${path}buss/bussModel_exeFunc.ms?funcMId=48f7f1bd00d74224b17fd916e5db1af0";

	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getDeviceUrl,
 	    	        data:{
 	    	           "type":"LoadPoint",
 	    	           "loadPoint":loadPoint,
 	    	           "areaId":areaId,
 	    	           "table":table
 	    	        },
 			success: function(data){
 			console.log("ssssswwwwwwwwwwwwwww");
 				var pList=data.ajaxList;
 				console.log(pList);
 				var tempOption = "";
 				for(var i=0;i<pList.length;i++){
 				    tempOption = tempOption + "<option value='"+pList[i].CDL_LOADPOINT+"'>"+pList[i].CDL_LOADPOINT+"</option>" ;
 				}
 				$("#paraMap1_CMO_LOADPOINT").empty();
 				$("#paraMap1_CMO_LOADPOINT").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_CMO_LOADPOINT").append(tempOption);
 				$("#paraMap1_CMO_LOADPOINT").trigger("chosen:updated");
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					//utilsFp.alert("error:"+errorThrown);
 					utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
 				}
 		   }
 		});
 		
	}
	*/
	function checkInfo(){
	         var CMO_DEVICE_SEQ = $("#paraMap1_CMO_DEVICE_SEQ").val();
		 if(CMO_DEVICE_SEQ == -1){
                           var TEMP_DEVICE_SEQ = document.getElementById("paraMap1_CMO_DEVICE_SEQ");
                           _alertValMsg(TEMP_DEVICE_SEQ ,"<dict:lang value="该项不能为空" />");
                           return "0";
                 }
                 var CMO_TABLE_NO = $("#paraMap1_CMO_TABLE_NO").val();
                 if(CMO_TABLE_NO == -1){
                           var TEMP_TABLE_NO = document.getElementById("paraMap1_CMO_TABLE_NO");
                           _alertValMsg(TEMP_TABLE_NO ,"<dict:lang value="该项不能为空" />");
                           return "0";
                 }
                 var CMO_LOADPOINT = $("#paraMap1_CMO_LOADPOINT").val();
                 if(CMO_LOADPOINT== -1){
                           var TEMP_LOADPOINT = document.getElementById("paraMap1_CMO_LOADPOINT");
                           _alertValMsg(TEMP_LOADPOINT ,"<dict:lang value="该项不能为空" />");
                           return "0";
                 }
	}
	//设置下拉框样式
function mySetChosen(){
	
	var curWinHeight = $(document).height();//当前窗口高度
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:true,//是否隐藏搜索框
		disable_search_threshold:15//少于15项，隐藏搜索框
	});

	//大于10个选项的，显示搜索框
	var len1 = $(".dept_select").length;
	$(".dept_select").each(function(index,item){
		if(item.id!=""){
		if(item != null && item.length > 10){
			//.chosen-container-single .chosen-search
			$("#"+item.id+"_chosen .chosen-search").css("display","block");
		}

		var offset = $("#"+item.id+"_chosen").offset(); //计算当前下拉框的偏移量
		
		var maxHeight = $("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
		
		var searchHeight = 0;//下拉搜索框的高度，默认为0
		//如果有显示搜索框，则需多计算搜索框的高度
		if(!$("#"+item.id+"_chosen .chosen-drop .chosen-search").is(":hidden")){
			searchHeight = 35;
		}
		//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
		if(offset.top > (curWinHeight/2)){
			$("#"+item.id+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
			//console.log($("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
			if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
				
			}
		}else{
			var itemHeight = curWinHeight - offset.top;
			if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
			}
			
		}
		}

	});
}
	
	
	function saveObj(){    
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
                        var tempCheck = checkInfo();
                        if(tempCheck == "0"){
				return ;
                        }
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                         if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
                        
			$("#saveBtn").prop("disabled","disabled");
                   
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=54d4754e382d48cbb8bb25857791fa7c";
       
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
}
</script>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>