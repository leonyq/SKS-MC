<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
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
<style type="text/css">
.imgClass{
width: 11px;
margin-left: 3px;
}
</style>
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
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:600px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					                  </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1c6dc1908e8645b5b0104ac2031b5c41" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1c6dc1908e8645b5b0104ac2031b5c41" />
	<input type="hidden" name="1c6dc1908e8645b5b0104ac2031b5c41" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_CFI_CHECK_EMP" name="paraMap1@0#CFI_CHECK_EMP"/>
	
		<s:set name="_$viewId" value="'9c669e58b3204746aa1990beb4d18cd3'" />
		<s:set name="_$formId_1" value="'1c6dc1908e8645b5b0104ac2031b5c41'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six"  style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six"/><span>产品SN</span></td>
			<td class="dec-self"><input type="text" id="productSn" name="productSn" class=" input isSubmit"  placeholder="请输入产品SN，然后按Enter键"/></td>
		</tr>
		<tr>	
			<td class="name-six"  style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41" colspan="4">
			<div id="myDiv" style="height:80px;border:1px solid #ccc">
			</div>
			<input type="hidden" id="paraMapObj_CFI_CHECK_SN" name="paraMapObj.CFI_CHECK_SN"/>
			<!--<bu:ui colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" style="width:100%;height:80px;"/>-->
			</bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" colspan="4"><bu:ui colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" style="height:80px;width:100%;"/></bu:td>	
		</tr>
		<tr style="display:none;">
			<td class="name-six" /><bu:uitn colNo="CFI_CHECK_TIME" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_TIME" formId="1c6dc1908e8645b5b0104ac2031b5c41" colspan="4"><bu:ui colNo="CFI_CHECK_TIME" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>	
		</tr>
	 
	</table>
			<bu:jsVal formId="1c6dc1908e8645b5b0104ac2031b5c41" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:script viewId="9c669e58b3204746aa1990beb4d18cd3" />
	<script type="text/javascript">
	
var checkSn = "";
var checkNum = 0;
var tempCount = 0;
document.onkeyup = function (e){
        e = e || window.event;
        var keycode = e.keyCode;
        var productSn=$.trim($("#productSn").val());
        var dataAuth=$("#deptLs_data_auth").val();
        var jsondata = { "productSn": productSn,"dataAuth":dataAuth};
        if (keycode == 13){
          if($.trim($("#productSn").val())==""){
          	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请输入产品SN" />","",280,"");
          	return;
          }else{
          var url = "buss/bussModel_exeFunc.ms?funcMId=f0702f12afbd41bd8f814c3404eae6b8&formId=1c6dc1908e8645b5b0104ac2031b5c41";//VM-首件检测-新增 操作功能 校验输入的SN
          jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: url,
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
				if(pList==""){
					utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN不存在" />","",280,"");
					//return "0";
				}else{
 				for(var i=0;i<pList.length;i++){
 					if(pList[i].WT_PROJECT_ID!=$("#paraMapObj_CFI_PROJECT_ID").val()){
 						utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前产品SN对应工单与当前选择工单不一致" />","",350,"");
 						//return "0";
 					}else{
 						if(checkSn==""){
                  		checkSn = $("#productSn").val();
                  		checkNum++;
                  		$("#paraMapObj_CFI_CHECK_NUM").val(checkNum);
                  		$("#paraMapObj_CFI_CHECK_SN").val(checkSn);
          		//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+checkSn+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	$("#myDiv").append(tempHtml);
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
          				$("#paraMapObj_CFI_CHECK_NUM").val(checkNum);
          				$("#paraMapObj_CFI_CHECK_SN").val(checkSn);
          				//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+$("#productSn").val()+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	$("#myDiv").append(tempHtml);
          			}
          		}else{
          			if(checkSn!=$("#productSn").val()){
          				checkSn = checkSn + "," + $("#productSn").val();
          				checkNum++;
          				$("#paraMapObj_CFI_CHECK_NUM").val(checkNum);
          				$("#paraMapObj_CFI_CHECK_SN").val(checkSn);
          				//拼接html并展示
			 			tempCount++;
			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"'>"+$("#productSn").val()+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='${path}/plf/js/jsPlumb/images/close2.png'></a></div>";
			        	$("#myDiv").append(tempHtml);
          			}else{
          				utilsFp.confirmIcon(3,"","","", "<dict:lang value="该产品SN已检测" />","",280,"");
          				$("#productSn").val("");
          				/*$("#paraMap1_CFI_CHECK_NUM").val(checkNum);
          				$("#paraMap1_CFI_CHECK_SN").val(checkSn);*/
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
//alert(checkSn.indexOf(","));
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
checkNum--;
$("#paraMapObj_CFI_CHECK_NUM").val(checkNum);
$("#paraMapObj_CFI_CHECK_SN").val(checkSn);
$("#"+count).html("");
}

function getCheckSn(projectId){
checkSn = "";
checkNum = 0;
tempCount = 0;
$("#paraMapObj_CFI_CHECK_NUM").val("");
$("#paraMapObj_CFI_CHECK_SN").val("");
$("#myDiv").html("");
var dataAuth = $("#deptLs_data_auth").val();
var jsondata = { "projectId": projectId, "dataAuth":dataAuth, "type":"backFill"};
	        jQuery.ajax({
	        	
 			type: "POST",
 	   		dataType: "json",
 	    	url: "buss/bussModel_exeFunc.ms?funcMId=a9bf5f3efde34ef2b38ba6d43d5d32af&formId=1c6dc1908e8645b5b0104ac2031b5c41",//VM-首件检测-新增 操作功能 根据工单获取产品SN
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
 				for(var i=0;i<pList.length;i++){
						checkSn = pList[i].CFI_CHECK_SN;
						checkNum = pList[i].CFI_CHECK_NUM;
						if(checkNum==""||checkNum==null){
                  		    checkNum=0;
                  		}
						$("#paraMapObj_CFI_CHECK_NUM").val(pList[i].CFI_CHECK_NUM);
	          			$("#paraMapObj_CFI_CHECK_SN").val(pList[i].CFI_CHECK_SN);
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

function getFaiNum(projectId){
var getProjectFaiNumUrl="${path}buss/bussModel_exeFunc.ms?funcMId=351bafdc091d468e8113d0c6fe5536fd";//VM-首件检测-编辑 操作功能 更新工单首件检测数量
var jsondata = { "projectId": projectId};
jQuery.ajax({
	        	
 			type: "POST",
 	   		dataType: "json",
 	    	url: getProjectFaiNumUrl,
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
 				for(var i=0;i<pList.length;i++){
					$("#paraMapObj_CFI_FAI_NUM").val(pList[i].FAI_NUM);
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
$(function(){
getCheckSn($("#paraMapObj_CFI_PROJECT_ID").val());
getFaiNum($("#paraMapObj_CFI_PROJECT_ID").val());
});

			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
		    var dd=new Date();
            var y=dd.getFullYear();
            var M = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);
            var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate();
            var H = dd.getHours()<10?"0"+dd.getHours():dd.getHours();
            var m = dd.getMinutes()<10?"0"+dd.getMinutes():dd.getMinutes();
            var s = dd.getSeconds()<10?"0"+dd.getSeconds():dd.getSeconds();
            var curDate=y+"-"+M+"-"+d+" "+H+":"+m+":"+s;
            $("#paraMapObj_CFI_CHECK_TIME").val(curDate);
		
			if(isQuery){utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...","",300,"");;}
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
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide("N");
			document.forms.editForm.submit();
			isQuery = true;
		}


		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$("#paraMapObj_CFI_CHECK_RESULT").trigger("chosen:updated");
			getCheckSn($("#paraMapObj_CFI_PROJECT_ID").val());
		}
				
		
		
		function init(){
			
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
			$("#paraMapObj_CFI_CHECK_NUM").attr("readonly","readonly");
			$("#paraMapObj_CFI_FAI_NUM").attr("readonly","readonly");
			
		        //$("#paraMapObj_CFI_MODEL_CODE").addClass("readonly");
			$("#paraMapObj_CFI_MODEL_CODE").attr("disabled","disabled"); 
			//$("#paraMapObj_CFI_MODEL_NAME").addClass("readonly");
			$("#paraMapObj_CFI_MODEL_NAME").attr("disabled","disabled"); 
			//$("#paraMapObj_CFI_SPEC").addClass("readonly");
			$("#paraMapObj_CFI_SPEC").attr("disabled","disabled"); 
			//$("#paraMapObj_CFI_FAI_NUM").addClass("readonly");
			//$("#paraMapObj_CFI_FAI_NUM").attr("disabled","disabled"); 
		        //$("#paraMapObj_CFI_PRODUCT_STEP").addClass("readonly");
			$("#paraMapObj_CFI_PRODUCT_STEP").attr("disabled","disabled"); 
			//$("#paraMapObj_CFI_FAI_NUM").addClass("readonly");
			//$("#paraMapObj_CFI_FAI_NUM").attr("disabled","disabled"); 
			
			
			
			$("#paraMapObj_CFI_CHECK_RESULT").addClass('_VAL_NULL'); 
		
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			
		}
		
	 
	 
	  $('#paraMapObj_CFI_CHECK_NUM').bind('keyup', function () {
     	
             if( ! /^\+?[1-9][0-9]*$/.test(this.value)){
             	this.value='';
               _alertValMsg($('#paraMapObj_CFI_CHECK_NUM'),"<dict:lang value="该项只能正整数" />");
             }
         });

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
 	<jsp:param name="modelName" value="VIEW_TYPE_11" />
    <jsp:param name="location" value="jsLoading" />
</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>