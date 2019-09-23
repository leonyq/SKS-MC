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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
<style type="text/css">
.imgClass{
width: 11px;
margin-left: 3px;
}
</style>
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
			        <button type="button" onclick="addFai();"><i class="ico ico-save"></i><dict:lang value="保存" /></button><!--  </i><dict:lang value="保存" /> -->
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height:600px;">

					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1c6dc1908e8645b5b0104ac2031b5c41" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1c6dc1908e8645b5b0104ac2031b5c41" />
	<input type="hidden" name="1c6dc1908e8645b5b0104ac2031b5c41" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_CFI_CHECK_EMP" name="paraMap1@0#CFI_CHECK_EMP"/>
	<input type="hidden" id="paraMap1_CFI_CHECK_TIME" name="paraMap1@0#CFI_CHECK_TIME"/>
	
		<s:set name="_$viewId" value="'55938fced69243fba1716203ea465437'" />
		<s:set name="_$formId_1" value="'1c6dc1908e8645b5b0104ac2031b5c41'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_PROJECT_ID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_MODEL_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name-six" /><bu:uitn colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41"><bu:ui colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_MODEL_NAME}" formIndex="1"/></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41"><bu:ui colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_SPEC}" formIndex="1"/></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_PRODUCT_STEP}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_FAI_NUM}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_CHECK_RESULT}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_CHECK_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six"/><span>产品SN</span></td>
			<td class="dec-self"><input type="text" id="productSn" name="productSn" class=" input isSubmit" placeholder="请输入产品SN，然后按Enter键"/></td>
		</tr>
		
		<tr>
			<td class="name-six" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41" colspan="4">
			<div id="myDiv" style="height:80px;width:100%;border:1px solid #ccc">
			</div>
			<input type="hidden" id="cfiCheckSn" name="cfiCheckSn"/>
			<!--<bu:ui colNo="CFI_CHECK_SN" cssClass=" _VAL_OjbsData"   formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_CHECK_SN}" formIndex="1" style="height:80px;display:none;"/>
			-->
			</bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" colspan="4"><bu:ui colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" value="%{CFI_CHECK_CONTENT}" formIndex="1" style="height:80px;width:100%;" /></bu:td>
		</tr>
	 
		
	</table>
			<bu:jsVal formId="1c6dc1908e8645b5b0104ac2031b5c41" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
function addFai(){

    var dd=new Date();
    var y=dd.getFullYear();
    var M = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);
    var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate();
    var H = dd.getHours()<10?"0"+dd.getHours():dd.getHours();
    var m = dd.getMinutes()<10?"0"+dd.getMinutes():dd.getMinutes();
    var s = dd.getSeconds()<10?"0"+dd.getSeconds():dd.getSeconds();
    var curDate=y+"-"+M+"-"+d+" "+H+":"+m+":"+s;
    $("#paraMap1_CFI_CHECK_TIME").val(curDate);
    
    var isQuery = false;
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
		if($("#cfiCheckSn").val()==""){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="检测产品SN不能为空" />",0,"260","");

            return false;
        }
		$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
		$DisInput.attr("disabled", false); 
		if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			$("#addForm").append($("#isCloseWin").clone());
			$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
		}
		$("#saveBtn").prop("disabled","disabled");
        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=568229adf372467e9bf630f9549f68c7";
		document.forms.addForm.submit();
		isQuery = true;
		$DisInput.attr("disabled", true);

}
</script>
<script type="text/javascript">
var checkSn = "";
var checkNum = 0;
var tempCount = 0;
var checkNumMap = new Map();
document.onkeyup = function (e){
var checkInputSnUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=f0702f12afbd41bd8f814c3404eae6b8";//VM-首件检测-新增 操作功能 校验输入的SN
        e = e || window.event;
        var keycode = e.keyCode;
        var dataAuth = $("#deptLs_data_auth").val();
        var productSn=$.trim($("#productSn").val());
        var jsondata = { "productSn": productSn,"dataAuth": dataAuth};
        if (keycode == 13){
          if($.trim($("#productSn").val())==""){
          	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请输入产品SN" />","",280,"");
          	return;
          }else{//console.log(checkInputSnUrl);
          	jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: checkInputSnUrl,
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
				if(pList==""){
					utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN不存在" />","",280,"");
					//return "0";
				}else{
 				for(var i=0;i<pList.length;i++){
 					if(pList[i].WT_PROJECT_ID!=$("#paraMap1_CFI_PROJECT_ID").val()){
 						utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前产品SN对应工单与当前选择工单不一致" />","",350,"");
 						//return "0";
 					}else{
 					
 						if(checkSn==""){
 						
          		checkSn = $("#productSn").val();
          		checkNum+=pList[i].WT_NUM;
          		checkNumMap.put(productSn,pList[i].WT_NUM);
          		$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
          		$("#cfiCheckSn").val(checkSn);
          				//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+checkSn+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	$("#myDiv").append(tempHtml);
          	}else{
          		if(checkSn.indexOf(",")>0){
          			var arr = checkSn.split(",");
          			var tempFlag = 0;
          			for(var j=0;j<arr.length;j++){
          				if(arr[j]==$("#productSn").val()){
          					tempFlag = 1;
          					utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN已检测" />","",280,"");
          					$("#productSn").val("");
          					break;
          				}	
          			}
          			if(tempFlag==0){
          				checkSn = checkSn + "," + $("#productSn").val();
          				checkNum+=pList[i].WT_NUM;
          				checkNumMap.put(productSn,pList[i].WT_NUM);
          				$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
          				$("#cfiCheckSn").val(checkSn);
          				//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+$("#productSn").val()+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	$("#myDiv").append(tempHtml);
          			}
          		}else{
          			if(checkSn!=$("#productSn").val()){
          				checkSn = checkSn + "," + $("#productSn").val();
          				checkNum+=pList[i].WT_NUM;
          				checkNumMap.put(productSn,pList[i].WT_NUM);
          				$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
          				$("#cfiCheckSn").val(checkSn);
          				//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+$("#productSn").val()+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	$("#myDiv").append(tempHtml);
          			}else{
          				utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN已检测" />","",280,"");
          				$("#productSn").val("");
          			}
          		}

          	}
 					}
 				}
 				}
 					
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
     				if(msg.readyState!=0){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					utilsFp.alert("error:"+errorThrown);
 				}
 				}
 		   }
 		});
          	
          	
          }  $("#productSn").select();
        }
}

Array.prototype.remove = function(val) {
  var index = this.indexOf(val);
  if (index > -1) {
  this.splice(index, 1);
  }
};
  
Array.prototype.indexOf = function(val) {
  for (var i = 0; i < this.length; i++) {
  if (this[i] == val) return i;
  }
  return -1;
}

function delTest(count){
var tempSn = "";
//alert(checkSn);
if(checkSn.indexOf(",")>0){
	var arr = checkSn.split(",");
	for(var j=0;j<arr.length;j++){
		if(arr[j]==$("#sp_"+count).html()){
			arr.remove(arr[j]);
		}
	}//alert(arr);
	//checkSn = arr;
	for(var i=0;i<arr.length;i++){
		if(tempSn == ""){
			tempSn = arr[i];
		}else{
			tempSn = tempSn+","+arr[i];
		}
	}
	checkSn = tempSn;
	//alert(checkSn);
}else{
    checkSn = "";
}
checkNum-=checkNumMap.get($("#sp_"+count).html());
checkNumMap.remove($("#sp_"+count).html());
$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
$("#cfiCheckSn").val(checkSn);
$("#"+count).html("");
}

function getCheckSn(projectId){
checkSn = "";
checkNum = 0;
tempCount = 0;
$("#paraMap1_CFI_CHECK_NUM").val("");
$("#cfiCheckSn").val("");
$("#myDiv").html("");
var getCheckSnUrl="${path}buss/bussModel_exeFunc.ms?funcMId=a9bf5f3efde34ef2b38ba6d43d5d32af&formId=%{formId}";//VM-首件检测-新增 操作功能 根据工单获取产品SN
var dataAuth = $("#deptLs_data_auth").val();
var jsondata = { "projectId": projectId,"dataAuth": dataAuth};
	        jQuery.ajax({
	        	
 			type: "POST",
 	   		dataType: "json",
 	    	url: getCheckSnUrl,
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
 				for(var i=0;i<pList.length;i++){
 					if(pList[i].CFI_EXAMINE_RESULT!=0){
 						utilsFp.confirmIcon(3,"","","", "<dict:lang value="该工单已审核" />","",280,"");
 						clearProductVal(1);
 						return;
 					}else{
						checkSn = pList[i].CFI_CHECK_SN;
						checkNum = pList[i].CFI_CHECK_NUM;
						$("#paraMap1_CFI_CHECK_NUM").val(pList[i].CFI_CHECK_NUM);
	          			$("#cfiCheckSn").val(pList[i].CFI_CHECK_SN);
	          			$("#paraMap1_CFI_CHECK_RESULT").val(pList[i].CFI_CHECK_RESULT);
	          			$("#paraMap1_CFI_CHECK_RESULT").trigger("chosen:updated");
	          			$("#paraMap1_CFI_CHECK_CONTENT").val(pList[i].CFI_CHECK_CONTENT);
	          			if(checkSn.indexOf(",")>0){
	          				var arr = checkSn.split(",");
	          				for(var j=0;j<arr.length;j++){
	          					//拼接html并展示
			 					tempCount++;
			 					var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+arr[j]+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        			$("#myDiv").append(tempHtml);
	          				}
	          			}else{
	          				//拼接html并展示
		 					tempCount++;
		 					var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+checkSn+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
		        			$("#myDiv").append(tempHtml);
	          			}
	          			
          			 }
 				}
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
     				if(msg.readyState!=0){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					utilsFp.alert("error:"+errorThrown);
 				}
 				}
 		   }
 		});
}

function checkInputSn(productSn){
var checkInputSnUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=f0702f12afbd41bd8f814c3404eae6b8&formId=%{formId}";//VM-首件检测-新增 操作功能 校验输入的SN
var dataAuth = $("#deptLs_data_auth").val();
var jsondata = { "productSn": productSn,"dataAuth": dataAuth};
	jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: checkInputSnUrl,
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
				if(pList==""){
					utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN不存在" />","",280,"");
					return "0";
				}else{
 				for(var i=0;i<pList.length;i++){
 					if(pList[i].WT_PROJECT_ID!=$("#paraMap1_CFI_PROJECT_ID").val()){
 						utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前产品SN对应工单与当前选择工单是不一致" />","",350,"");
 						return "0";
 					}
 				}
 				}
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
     				if(msg.readyState!=0){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					utilsFp.alert("error:"+errorThrown);
 				}
 				}
 		   }
 		});
}

	function init(){

	
	
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		//$("#paraMap1_CFI_PRODUCT_STEP").val(1);
		//$("#paraMap1_CFI_MODEL_NAME").removeAttr("disabled");
		//$("#paraMap1_CFI_SPEC").removeAttr("disabled");
		
		$("#paraMap1_CFI_CHECK_SN").attr("readonly","readonly");
		$("#paraMap1_CFI_CHECK_NUM").attr("readonly","readonly");
		
		$("#paraMap1_CFI_MODEL_NAME").addClass("readonly");
		$("#paraMap1_CFI_SPEC").addClass("readonly");
		
		
		$("#paraMap1_CFI_CHECK_EMP").val("<c:out value='${dataMap.curUser}' />");
	//	$("#paraMap1_CFI_CHECK_EMP").val('${dataMap.curUser}');
	//	$("#paraMap1_CFI_CHECK_TIME").val('${dataMap.nowDate}');
		$("#paraMap1_CFI_CHECK_RESULT").addClass('_VAL_NULL'); 
		
    	$("#paraMap1_CFI_MODEL_CODE").addClass("readonly");
		$("#paraMap1_CFI_MODEL_CODE").attr("readonly","readonly");
	//	$("#paraMap1_CFI_MODEL_NAME").addClass("readonly");
	//	$("#paraMap1_CFI_MODEL_NAME").attr("readonly","readonly");
	//	$("#paraMap1_CFI_SPEC").addClass("readonly");
	//	$("#paraMap1_CFI_SPEC").attr("readonly","readonly");
		$("#paraMap1_CFI_PRODUCT_STEP").addClass("readonly");
		$("#paraMap1_CFI_PRODUCT_STEP").attr("readonly","readonly");
		$("#paraMap1_CFI_FAI_NUM").addClass("readonly");
		$("#paraMap1_CFI_FAI_NUM").attr("readonly","readonly"); 
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	
	
	    $('#paraMap1_CFI_CHECK_NUM').bind('keyup', function () {
     	
             if( ! /^\+?[1-9][0-9]*$/.test(this.value)){
             	this.value='';
               _alertValMsg($('#paraMap1_CFI_CHECK_NUM'),"<dict:lang value="该项只能正整数" />");
             }
         });
         
         
    function addFai(tis){

        var dd=new Date();
        var y=dd.getFullYear();
        var M = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);
        var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate();
        var H = dd.getHours()<10?"0"+dd.getHours():dd.getHours();
        var m = dd.getMinutes()<10?"0"+dd.getMinutes():dd.getMinutes();
        var s = dd.getSeconds()<10?"0"+dd.getSeconds():dd.getSeconds();
        var curDate=y+"-"+M+"-"+d+" "+H+":"+m+":"+s;
        $("#paraMap1_CFI_CHECK_TIME").val(curDate);
        
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
			if($("#cfiCheckSn").val()==""){
                            utilsFp.confirmIcon(3,"","","", "<dict:lang value="检测产品SN不能为空" />",0,"260","");
		
                            return false;
                        }
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=568229adf372467e9bf630f9549f68c7";
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);

    }
</script>
<script type="text/javascript">
var checkSn = "";
var checkNum = 0;
var tempCount = 0;

    
document.onkeyup = function (e){
var checkInputSnUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=f0702f12afbd41bd8f814c3404eae6b8";//VM-首件检测-新增 操作功能 校验输入的SN
        e = e || window.event;
        var keycode = e.keyCode;
        var productSn=$.trim($("#productSn").val())；
        var dataAuth = $("#deptLs_data_auth").val();
        var jsondata = { "productSn": productSn,"dataAuth":dataAuth};
        if (keycode == 13){
          if($.trim($("#productSn").val())==""){
          	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请输入产品SN" />","",280,"");
          	return;
          }else{//console.log(checkInputSnUrl);
          	jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: checkInputSnUrl,
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
				if(pList==""){
					utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN不存在" />","",280,"");
					//return "0";
				}else{
 				for(var i=0;i<pList.length;i++){
 					if(pList[i].WT_PROJECT_ID!=$("#paraMap1_CFI_PROJECT_ID").val()){
 						utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前产品SN对应工单与当前选择工单不一致" />","",350,"");
 						//return "0";
 					}else{
 					
 						if(checkSn==""){
 						
          		checkSn = $("#productSn").val();
          		checkNum++;
          		$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
          		$("#cfiCheckSn").val(checkSn);
          				//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+checkSn+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	console.log(tempHtml);
			        	$("#myDiv").append(tempHtml);
			        	console.log("3:"tempHtml);
          	}else{
          		if(checkSn.indexOf(",")>0){
          			var arr = checkSn.split(",");
          			var tempFlag = 0;
          			for(var i=0;i<arr.length;i++){
          				if(arr[i]==$("#productSn").val()){
          					tempFlag = 1;
          					utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN已检测" />","",280,"");
          					$("#productSn").val("");
          					break;
          				}	
          			}
          			if(tempFlag==0){
          				checkSn = checkSn + "," + $("#productSn").val();
          				checkNum++;
          				$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
          				$("#cfiCheckSn").val(checkSn);
          				//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+$("#productSn").val()+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	$("#myDiv").append(tempHtml);
			        	console.log("4:"tempHtml);
          			}
          		}else{
          			if(checkSn!=$("#productSn").val()){
          				checkSn = checkSn + "," + $("#productSn").val();
          				checkNum++;
          				$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
          				$("#cfiCheckSn").val(checkSn);
          				//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+$("#productSn").val()+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	$("#myDiv").append(tempHtml);
			        	console.log("5:"tempHtml);
          			}else{
          				utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN已检测" />","",280,"");
          				$("#productSn").val("");
          			}
          		}

          	}
 					}
 				}
 				}
 					
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
     				if(msg.readyState!=0){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					utilsFp.alert("error:"+errorThrown);
 				}
 				}
 		   }
 		});
          	
          	
          }  $("#productSn").select();
        }
}

Array.prototype.remove = function(val) {
  var index = this.indexOf(val);
  if (index > -1) {
  this.splice(index, 1);
  }
};
  
Array.prototype.indexOf = function(val) {
  for (var i = 0; i < this.length; i++) {
  if (this[i] == val) return i;
  }
  return -1;
}

function delTest(count){
var tempSn = "";
//alert(checkSn);
if(checkSn.indexOf(",")>0){
	var arr = checkSn.split(",");
	for(var j=0;j<arr.length;j++){
		if(arr[j]==$("#sp_"+count).html()){
			arr.remove(arr[j]);
		}
	}//alert(arr);
	//checkSn = arr;
	for(var i=0;i<arr.length;i++){
		if(tempSn == ""){
			tempSn = arr[i];
		}else{
			tempSn = tempSn+","+arr[i];
		}
	}
	checkSn = tempSn;
	//alert(checkSn);
}else{
    checkSn = "";
}
checkNum-=checkNumMap.get($("#sp_"+count).html());
$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
$("#cfiCheckSn").val(checkSn);
$("#"+count).html("");
}

function getCheckSn(projectId){
checkSn = "";
checkNum = 0;
tempCount = 0;
$("#paraMap1_CFI_CHECK_NUM").val("");
$("#cfiCheckSn").val("");
$("#myDiv").html("");
var getCheckSnUrl="${path}buss/bussModel_exeFunc.ms?funcMId=a9bf5f3efde34ef2b38ba6d43d5d32af&formId=%{formId}";
var dataAuth = $("#deptLs_data_auth").val();
var jsondata = { "projectId": projectId,"dataAuth":dataAuth};
	        jQuery.ajax({
	        	
 			type: "POST",
 	   		dataType: "json",
 	    	url: getCheckSnUrl,
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
 				for(var i=0;i<pList.length;i++){
 					if(pList[i].CFI_EXAMINE_RESULT!=0){
 						utilsFp.confirmIcon(3,"","","", "<dict:lang value="该工单已审核" />","",280,"");
 						clearProductVal(1);
 						return;
 					}else{
						checkSn = pList[i].CFI_CHECK_SN;
						checkNum = pList[i].CFI_CHECK_NUM;
						$("#paraMap1_CFI_CHECK_NUM").val(pList[i].CFI_CHECK_NUM);
	          			$("#cfiCheckSn").val(pList[i].CFI_CHECK_SN);
	          			$("#paraMap1_CFI_CHECK_RESULT").val(pList[i].CFI_CHECK_RESULT);
	          			$("#paraMap1_CFI_CHECK_RESULT").trigger("chosen:updated");
	          			$("#paraMap1_CFI_CHECK_CONTENT").val(pList[i].CFI_CHECK_CONTENT);
	          			if(checkSn.indexOf(",")>0){
	          				var arr = checkSn.split(",");
	          				for(var j=0;j<arr.length;j++){
	          					//拼接html并展示
			 					tempCount++;
			 					var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+arr[j]+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        			$("#myDiv").append(tempHtml);
			        			console.log("1:"tempHtml);
	          				}
	          			}else{
	          				//拼接html并展示
		 					tempCount++;
		 					var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+checkSn+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
		        			$("#myDiv").append(tempHtml);
		        			console.log("2:"tempHtml);
	          			}
	          			
          			 }
 				}
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
     				if(msg.readyState!=0){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					utilsFp.alert("error:"+errorThrown);
 				}
 				}
 		   }
 		});
}

function checkInputSn(productSn){
var checkInputSnUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=f0702f12afbd41bd8f814c3404eae6b8&formId=%{formId}";//VM-首件检测-新增 操作功能 校验输入的SN
var dataAuth = $("#deptLs_data_auth").val();
var jsondata = { "productSn": productSn,"dataAuth": dataAuth};
	jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: checkInputSnUrl,
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
				if(pList==""){
					utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN不存在" />","",280,"");
					return "0";
				}else{
 				for(var i=0;i<pList.length;i++){
 					if(pList[i].WT_PROJECT_ID!=$("#paraMap1_CFI_PROJECT_ID").val()){
 						utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前产品SN对应工单与当前选择工单是不一致" />","",350,"");
 						return "0";
 					}
 				}
 				}
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
     				if(msg.readyState!=0){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					utilsFp.alert("error:"+errorThrown);
 				}
 				}
 		   }
 		});
}

	function init(){

	
	
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		//$("#paraMap1_CFI_PRODUCT_STEP").val(1);
		//$("#paraMap1_CFI_MODEL_NAME").removeAttr("disabled");
		//$("#paraMap1_CFI_SPEC").removeAttr("disabled");
		
		$("#paraMap1_CFI_CHECK_SN").attr("readonly","readonly");
		$("#paraMap1_CFI_CHECK_NUM").attr("readonly","readonly");
		
		$("#paraMap1_CFI_MODEL_NAME").addClass("readonly");
		$("#paraMap1_CFI_SPEC").addClass("readonly");
		
		
		$("#paraMap1_CFI_CHECK_EMP").val("<c:out value='${dataMap.curUser}' />");
	//	$("#paraMap1_CFI_CHECK_EMP").val('${dataMap.curUser}');
	//	$("#paraMap1_CFI_CHECK_TIME").val('${dataMap.nowDate}');
		$("#paraMap1_CFI_CHECK_RESULT").addClass('_VAL_NULL'); 
		
    	$("#paraMap1_CFI_MODEL_CODE").addClass("readonly");
		$("#paraMap1_CFI_MODEL_CODE").attr("readonly","readonly");
	//	$("#paraMap1_CFI_MODEL_NAME").addClass("readonly");
	//	$("#paraMap1_CFI_MODEL_NAME").attr("readonly","readonly");
	//	$("#paraMap1_CFI_SPEC").addClass("readonly");
	//	$("#paraMap1_CFI_SPEC").attr("readonly","readonly");
		$("#paraMap1_CFI_PRODUCT_STEP").addClass("readonly");
		$("#paraMap1_CFI_PRODUCT_STEP").attr("readonly","readonly");
		$("#paraMap1_CFI_FAI_NUM").addClass("readonly");
		$("#paraMap1_CFI_FAI_NUM").attr("readonly","readonly"); 
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	
	
	    $('#paraMap1_CFI_CHECK_NUM').bind('keyup', function () {
     	
             if( ! /^\+?[1-9][0-9]*$/.test(this.value)){
             	this.value='';
               _alertValMsg($('#paraMap1_CFI_CHECK_NUM'),"<dict:lang value="该项只能正整数" />");
             }
         });
         
         
    
	
</script>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
</jsp:include>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
  <jsp:param name="modelName" value="VIEW_TYPE_10" />
  <jsp:param name="location" value="jsLoading" />
</jsp:include>
<bu:submit viewId="55938fced69243fba1716203ea465437" />
<bu:script viewId="55938fced69243fba1716203ea465437" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>

