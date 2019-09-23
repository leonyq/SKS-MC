<%@page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<%@ include file="/common/pub_meta.jsp"%>
	<title><dict:lang value="？？？" /></title>
	<jsp:include page="/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/page/common/buss/bussCommJs.jsp"%>
</head>
<body>
	<div class="all">
		<div>
			<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
				<bu:formet exeid="%{exeid}" />>
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="formId" value="${formId}">
				<input type="hidden" name="dataId" value="${dataId}">
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<input type="button" value="<dict:lang value="？？" />" onclick="edit(this);" class="botton_img_add">
							<input type="reset" value="<dict:lang value="？？？？" />" class="botton_img_search" />
							<input type="button" value="<dict:lang value="？？？" />" onclick="parent.closePopWin();" class="botton_img_search">
						</td>
					</tr>
				</table>

				<table class="add_table">
					<tr>
						<th colspan="4">
							<span class="Eng">*</span>
							<dict:lang value="？？？？？？？" />
						</th>
					</tr>
				</table>
<bu:editcp exeid="%{exeid}" formId="%{formId}" dataId="%{dataId}" />
			</form>

		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="？？？？？？？？？？？？？？？？" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			util.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parent.reloadPg(msg);;
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
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- ？？？？？？？？？subRelColId --%>
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
					_toClickColor(row);// <%-- ？е？？？？？ --%>
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
			initEditDataLs();<%-- ？？？？？？？？？？？？？？？？？？б？ --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

	<%-- //？？？？？？？？？？ε？？？Ч？？？？？？？？？？？(？？？？？？thisObj？？？ε？DOM？？？？？？title？？？？？ε？？？？)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("？？γ？？？？？？С？？")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>

	<jsp:include page="/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/common/pub_end.jsp"%>
