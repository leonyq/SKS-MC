<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<style>
		._height{height:352px !important;}
	</style>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body style="background-color:#fff">
	<div class="edit">
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
<jsp:param name="modelName" value="VIEW_TYPE_10" />
   <jsp:param name="location" value="addForm" />
		</jsp:include>
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd" style="padding-bottom:10px;margin:0;background-color:#f6f5f7;">
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
        					<%--<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>--%>
			    </div>

			</div>
			<div class="bd _height" style="padding-bottom: 15px;border-bottom:none;height:450px;">

								<input type="hidden" name="exeid" value="<c:out value='${exeid}'/>">
								<input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
								<input type="hidden" name="formId" value="99c3f63c8b62498589698545e9de3b18">
								<input type="hidden" name=iframeId value="<c:out value='${iframeId}' />">
								<input type="hidden" name="dataId" value="<c:out value='${dataId}' />">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="99c3f63c8b62498589698545e9de3b18" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="99c3f63c8b62498589698545e9de3b18" />
	<input type="hidden" name="99c3f63c8b62498589698545e9de3b18" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="bomId" >
	<!-- <input type="hidden" id="paraMapObj_CTI_ITEM_CODE" name="paraMapObj.CTI_ITEM_CODE"> -->
		<s:set name="_$viewId" value="'0cf8739b23d04b1b969b472ff554f0c5'" />
		<s:set name="_$formId_1" value="'99c3f63c8b62498589698545e9de3b18'" />
		<s:set name="_$type" value="'edit'" />
		<input type="hidden" name="paraMap2.type" value="edit" />
		<tr>
			<td class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:68px;"/><bu:uitn colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" ><dict:lang value="机种名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="MODEL_NAME" name="MODEL_NAME" disabled="disabled"/></td>
		
			<td class="name" ><dict:lang value="机种规格" /></td>
			<td class="dec"><input type="text" class=" input isSubmit " id="MODEL_GUIGE" name="MODEL_GUIGE" disabled="disabled" /></td>
			</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td id="ctiItemCode" cssClass="dec" colNo="CTI_ITEM_CTRL" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_CTRL" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="2" /></bu:td>
			<bu:td id="ctiAssisCode" cssClass="dec" colNo="CTI_ASSIS_CTRL" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSIS_CTRL" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="2" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name" ><dict:lang value="物料名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_NAME" name="ITEM_NAME" disabled="disabled" /></td>
			<td class="name" ><dict:lang value="物料规格" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_GUIGE" name="ITEM_GUIGE" disabled="disabled" /></td>
			
			<td class="dec" style="display:none;"><bu:ui colNo="CTI_ITEM_NAME" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></td>
			
			<td class="dec" style="display:none;"><bu:ui colNo="CTI_ITEM_SPEC" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></td>
			</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		<!--  -->	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td> 
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_PROCESS_FACE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_PROCESS_FACE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_PROCESS_FACE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CTI_SN_RULE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_SN_RULE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_SN_RULE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18"  colspan="3"><bu:ui colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" style="height:80px;width:100%;" formIndex="1" /></bu:td>
		</tr>
		<tr style="display: none">
			<bu:td cssClass="dec" colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="99c3f63c8b62498589698545e9de3b18" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

	<script type="text/javascript">
	
	
	function itemOrAssis(){
		if ($("#paraMapObj_CTI_ITEM_TYPE").val()=="0") {
			$("#paraMapObj_CTI_ITEM_CODE").val("");
			$("#paraMapObj_CTI_ITEM_CTRL_SHOW").val("");
			$("#paraMapObj_CTI_ASSIS_CTRL_SHOW").val("");
			$("#ctiItemCode").val("");
			$("#ITEM_NAME").val("");
			$("#ITEM_GUIGE").val("");
			document.getElementById("ctiItemCode").style.display = "block";
			document.getElementById("ctiAssisCode").style.display = "none";
		}else if ($("#paraMapObj_CTI_ITEM_TYPE").val()=="1") {
			$("#paraMapObj_CTI_ITEM_CODE").val("");
			$("#paraMapObj_CTI_ITEM_CTRL_SHOW").val("");
			$("#paraMapObj_CTI_ASSIS_CTRL_SHOW").val("");
			$("#ctiAssisCode").val("");
			$("#ITEM_NAME").val("");
			$("#ITEM_GUIGE").val("");
			document.getElementById("ctiAssisCode").style.display = "block";
			document.getElementById("ctiItemCode").style.display = "none";
		}
	}
var str = "";
window.onload = function(){
    
	str = "<dict:lang value="请输入管控物料" /> | ";
	document.getElementById("ctiAssisCode").style.display = "none";
        util.showTopLoading();
	//getGroup();
	editHuixian();
	$("#paraMapObj_CTI_ITEM_CTRL").val($("#paraMapObj_CTI_ITEM_CODE").val());
	$("#paraMapObj_CTI_ASSIS_CTRL").val($("#paraMapObj_CTI_ITEM_CODE").val());
	$("#paraMapObj_CTI_ITEM_CTRL_SHOW").val($("#paraMapObj_CTI_ITEM_CODE").val());
	$("#paraMapObj_CTI_ASSIS_CTRL_SHOW").val($("#paraMapObj_CTI_ITEM_CODE").val());
	
	$("#ITEM_NAME").val($("#paraMapObj_CTI_ITEM_NAME").val());
	$("#ITEM_GUIGE").val($("#paraMapObj_CTI_ITEM_SPEC").val());
};

       function getGroup(){
       		ajaxFlag = false;
       		var ctiGroup = $("#paraMapObj_CTI_GROUP").val();
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?funcMId=7242147fdce040e8b6722b66e1f0c6ca",
     		    data:{
     		     'routeStep':$("#paraMapObj_CTI_PRODUCT_STEP").val(),
     		     'flag':'getGroup'
     		    },
     			success: function(data){
     					ajaxFlag = true;
     					//util.closeLoading();
     					$("#paraMapObj_CTI_GROUP").empty();
     					var html = "";
     					var getGroupLs = data.groupList;
     					if(getGroupLs != null && getGroupLs != ""){
     						for ( var i = 0; i < getGroupLs.length; i++) {
     						    html = html + "<option value='"+getGroupLs[i].GROUP_CODE+"' >"+getGroupLs[i].GROUP_NAME+"</option>";
     							//$("#paraMap1_CTI_GROUP").append("<option value='"+data.ajaxList[i].GROUP_CODE+"' >"+data.ajaxList[i].GROUP_NAME+"</option>");			
     					}
     					$("#paraMapObj_CTI_GROUP").append(html);
					$("#paraMapObj_CTI_GROUP").find("option[value='"+ctiGroup+"']").attr("selected",true);
     					$("#paraMapObj_CTI_GROUP").trigger("chosen:updated");
						}
     				},
     			error: function(msg){
     				if(msg.readyState!=0){
     					util.closeLoading();
     					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     				}
     			  }
     			});		
        }
        
      function editHuixian(){
      		ajaxFlag = false;
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?funcMId=7242147fdce040e8b6722b66e1f0c6ca",
     		    data:{
     		     'ctiItemCode':$("#paraMapObj_CTI_ITEM_CODE").val(),
     		     'ctiModelCode':$("#paraMapObj_CTI_MODEL_CODE").val(),
     		     'flag':'editHuixian',
     		     'assisItem':$("#paraMapObj_CTI_ITEM_TYPE").val()
     		    },
     			success: function(data){
     					ajaxFlag = true;
     					util.closeLoading();
     					var modelListLs = data.modelList;
     					var itemListLs = data.itemList;
     					if(modelListLs != null && modelListLs != ""){
						$("#MODEL_NAME").val(modelListLs[0].CI_ITEM_NAME);
     						$("#MODEL_GUIGE").val(modelListLs[0].CI_ITEM_SPEC);
     						$("#bomId").val(modelListLs[0].ID);
					}
     					if(itemListLs != null && itemListLs != ""){
     						$("#ITEM_NAME").val(itemListLs[0].CI_ITEM_NAME);
     						$("#ITEM_GUIGE").val(itemListLs[0].CI_ITEM_SPEC);
     						//$("#bomId").val(data.dataList.ID);
						}
						if ($("#paraMapObj_CTI_ITEM_TYPE").val()=="0") {
							document.getElementById("ctiItemCode").style.display = "block";
							document.getElementById("ctiAssisCode").style.display = "none";
							$("#paraMapObj_CTI_TIEM_CTRL").val($("#paraMapObj_CTI_ITEM_CODE").val());
							$("#paraMapObj_CTI_TIEM_CTRL_SHOW").val($("#paraMapObj_CTI_ITEM_CODE").val());
						}else if ($("#paraMapObj_CTI_ITEM_TYPE").val()=="1") {
						document.getElementById("ctiItemCode").style.display = "block";
							document.getElementById("ctiAssisCode").style.display = "none";
							$("#paraMapObj_CTI_TIEM_CTRL").val($("#paraMapObj_CTI_ITEM_CODE").val());
							$("#paraMapObj_CTI_TIEM_CTRL_SHOW").val($("#paraMapObj_CTI_ITEM_CODE").val());
						}
     				},
     			error: function(msg){
     				if(msg.readyState!=0){
     					util.closeLoading();
     					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     				}
     			  }
     			});		
        }
	
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
			if(ajaxFlag){
				$("#paraMapObj_CTI_ITEM_CTRL").remove();
				$("#paraMapObj_CTI_ASSIS_CTRL").remove();
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
				emptyValToHide();
				document.forms.editForm.submit();
				isQuery = true;
			}else{
				utilsFp.confirmIcon(1,"","","", "<dict:lang value='页面未加载完成' />",0,"","");
			}
		}
		
		function alertInfo(msg){
			isQuery = false;
               	 	utilsFp.confirmIcon(1,"","","", msg,"","340","145");
			//utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
        	util.showTopLoading();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
     				if(msg.readyState!=0){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
     					utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"300","");
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
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		$(function(){
        //$('#paraMapObj_CTI_ITEM_CTRL_SHOW').addClass('_VAL_NULL input isSubmit input clearField _VAL_DATABASE ico-search-input'); 
         $('#MODEL_NAME').addClass(' input readonly isSubmit '); 
          $('#MODEL_GUIGE').addClass('input readonly isSubmit'); 
           $('#ITEM_NAME').addClass('input readonly isSubmit'); 
            $('#ITEM_GUIGE').addClass('input readonly isSubmit'); 
})

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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>