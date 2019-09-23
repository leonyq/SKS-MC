<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
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
			    	        <button type="button" onclick="editCal2();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<!-- <button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>  -->
			    </div>

			</div>
			<div class="bd" style="height:400px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="cc45a8ab4c87407090593be875962853" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cc45a8ab4c87407090593be875962853" />
	<input type="hidden" name="cc45a8ab4c87407090593be875962853" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'97293504bfee4eb9873adfee6c12f9a6'" />
		<s:set name="_$formId_1" value="'cc45a8ab4c87407090593be875962853'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853"  ><bu:ui colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name-three" /><bu:uitn colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853"  colspan="4"><bu:ui colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CPI_SYS_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_SYS_NAME" formId="cc45a8ab4c87407090593be875962853" colspan="3"><bu:ui colNo="CPI_SYS_NAME" name="upFile" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CPI_MEMO" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MEMO" formId="cc45a8ab4c87407090593be875962853"  style="height:80px;" colspan="3"><bu:ui colNo="CPI_MEMO" style="width: 93%;height: 100%;" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
	</table>
			<bu:jsVal formId="cc45a8ab4c87407090593be875962853" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="97293504bfee4eb9873adfee6c12f9a6" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script type="text/javascript">
function editCal2(){
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
 
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=09ff3ca4973e4297803d3668fdadbaca";
                        document.forms.editForm.submit();
                        isQuery = true;
}
var parentWindow;
$(function(){
    $("#paraMapObj_CPI_GROUP").attr("class","_VAL_NULL input isSubmit _VAL_OjbsData _VAL_DATABASE dept_select");
parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
//	$("#paraMapObj_CPI_SYS_NAME").live("change", function () {
//		getFileName();
//	})
})
function getFileName(){
	var fp = $("#paraMapObj_CPI_SYS_NAME");
	var lg = fp[0].files.length; // get length
    	var items = fp[0].files;
    	if (lg > 0) {
        for (var i = 0; i < lg; i++) {
            var fileName = items[i].name; // get file name
            $("#paraMapObj_CPI_NAME").val(fileName.substring(0,fileName.lastIndexOf(".")));
        }
        }
}


var isQuery = false;
var fileMap = new Map();
function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
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
			//$("#paraMapObj_CPI_PRODUCT_STEP").trigger("chosen:updated");
			$("#paraMapObj_CPI_PROCESS_FACE").trigger("chosen:updated");
			//$("#paraMapObj_CPI_GROUP").trigger("chosen:updated");
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
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
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
</script>
	<!-- js初始化方法 
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>-->

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
