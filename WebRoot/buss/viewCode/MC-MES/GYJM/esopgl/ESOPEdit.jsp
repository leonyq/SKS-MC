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
        					
			    </div>

			</div>
			<div class="bd" style="height: 350px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="62e5f8f76eab45ddbcf24c091ee691ce" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="62e5f8f76eab45ddbcf24c091ee691ce" />
	<input type="hidden" name="62e5f8f76eab45ddbcf24c091ee691ce" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'4edf6dfaaebf4f7eb7f8fd5cb65a2436'" />
		<s:set name="_$formId_1" value="'62e5f8f76eab45ddbcf24c091ee691ce'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		     <td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>

             		<td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>

				
		</tr>
		<tr>
		        <td class="name" style="width:70px;"/><bu:uitn colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>

			
		        <td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
		        <bu:td cssClass="dec" colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		
		<tr>
		    <td class="name" style="width:70px;"/><bu:uitn colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
                  
			<td class="name" style="width:70px;"/><bu:uitn colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
		<!--
		        <td class="name" style="width:70px;"/><bu:uitn colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
                -->  
			<td class="name" style="width:70px;"/><bu:uitn colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
		       <td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
          
			<td class="name" Style="width: 100px;" /><span class="dot">*</span><bu:uitn colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
		        <td class="name" style="width:70px;"/><bu:uitn colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			    <bu:td cssClass="dec" colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" colspan="3"><bu:ui colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}"  style="height:80px;width:100%;" formIndex="1" /></bu:td>

		
		</tr>
	</table>
			<bu:jsVal formId="62e5f8f76eab45ddbcf24c091ee691ce" formIndex="1" />
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
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
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
			emptyValToHide('N');
			if($("input[type='hidden'][name='paraMapObj.CSI_ADDRESS']").length == 0){
			    $("#editForm").append("<input type='hidden'  name='paraMapObj.CSI_ADDRESS' value='esop'/>");	
			}
			document.forms.editForm.submit();
			isQuery = true;
		}
	
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$(".dept_select").trigger("chosen:updated");
			$("#paraMapObj_CSI_GROUP").val(CSI_GROUP);
			alert($("#paraMapObj_CSI_GROUP").val());
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
		
		/**删除附件
		*参数:a 标签ID，文件名，文件路径，输入框ID，输入框名称
		**/
		function delFile(aId,fileName,filePath,inputId,inputName){
			var obj = new Object();
			obj.fileName = fileName;
			obj.filePath = filePath;
			obj.inputId = inputId;
			obj.inputName = inputName;
			obj.aId = aId;
			utilsFp.confirmIcon(1,"","delFileConFirm",obj, "<dict:lang value="删除之后不可恢复，确定删除吗？" />","1","260","");
			//util.confirm(delFileConFirm,"<dict:lang value="删除之后不可恢复，确定删除吗？" />",obj);
		}
		var fileMap = new Map();//临时存放file相关input
		function delFileConFirm(obj){
			util.showLoading();
			var url ="${path}buss/bussModel_delFileAx.ms";
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data:{'paraMap.FILENAME':obj.fileName,'paraMap.FILEPATH':obj.filePath},
					success: function(data){
						util.closeLoading();
						if(data.ajaxMap != null){
							if(data.ajaxMap.msg == "1"){
								//util.alert("<dict:lang value="删除成功！" />");
								$("#"+obj.aId).parent().find("input").each(function(idx){
									this.value = "";
								});
								fileMap.put(obj.inputName,$("#"+obj.aId).parent().find("input"));
								$("#"+obj.aId).parent().html("<input type='file' name='"+obj.inputName+"' id='"+obj.inputId+"'/>");
							}else{
								util.alert("error:"+data.ajaxMap.msg);
							}
						}else{
							util.alert("<dict:lang value="服务器无响应，请稍候再试！" />");
						}
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