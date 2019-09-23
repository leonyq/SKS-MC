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
						<form id="editForm" name="editForm" action="${path}buss/bussModel_exeFunc.ms?funcMId=59f4c3345634443fb49112b9aaf5d7e7&type=edit" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            
			<div class="bd" style="height: 400px;">

							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="f4bff8054eec43dd9b7ffe75eb0f03ac" />
	<input type="hidden" name="f4bff8054eec43dd9b7ffe75eb0f03ac" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	
		<s:set name="_$viewId" value="'40a67be826844f11989bc0049b53978b'" />
		<s:set name="_$formId_1" value="'f4bff8054eec43dd9b7ffe75eb0f03ac'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:73px;"/><span class="dot">*</span><bu:uitn colNo="GROUP_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="GROUP_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" disabled="disabled"  dataId="${dataId}" formIndex="1" /></td>
			<td rowspan="5" class="dec" style="vertical-align: bottom;width: 230px;" title="<dict:lang value="点击上传工序图片,图片大小在2M以内"/>" >
				<div id="photoImgd60bd57aa37c40f1b3842beeb828a0e6"> 
					<img id="preview53bb92ed69a846788fb8f2cd0ef98609" src="${path}up_load/comm/${paraMapObj.PHOTO_PATH}" align="bottom" style="width: 133px; height: 133px; margin-bottom: 15px;"> 
				</div>
				
				<input type="hidden" name="serverfileName" id="serverfileName" value="" />
				<input type="file" id="upFiled60bd57aa37c40f1b3842beeb828a0e6" onchange="javascript:_setImagePreview('photoImgd60bd57aa37c40f1b3842beeb828a0e6','preview53bb92ed69a846788fb8f2cd0ef98609','upFiled60bd57aa37c40f1b3842beeb828a0e6');" style="display:none;" name="paraMapObj.PHOTO_PATH" value="" class="isSubmit input">
			</td>
		</tr>
		<tr>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="GROUP_NAME" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="GROUP_NAME" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" disabled="disabled"   dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="MS_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="MS_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" disabled="disabled"  dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="GROUP_TYPE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="GROUP_TYPE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" disabled="disabled"  dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="GROUP_COLOR" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><select id="paraMapObj_GROUP_COLOR" name="paraMapObj.GROUP_COLOR" disabled="disabled"  class=" input isSubmit _VAL_OjbsData dept_select" >
<option value="">--请选择--</option>
 <option style="background-color:#FF0000" value="#FF0000" <s:if test="${paraMapObj.GROUP_COLOR=='#FF0000' }">selected</s:if> >红色</option>
<option style="background-color:#800080" value="#800080" <s:if test="${paraMapObj.GROUP_COLOR=='#800080' }">selected</s:if> >紫色</option>
<option style="background-color:#00FF00" value="#00FF00" <s:if test="${paraMapObj.GROUP_COLOR=='#00FF00' }">selected</s:if> >绿色</option>
<option style="background-color:#0000FF" value="#0000FF" <s:if test="${paraMapObj.GROUP_COLOR=='#0000FF' }">selected</s:if> >蓝色</option>
<option style="background-color:#FFFF00" value="#FFFF00" <s:if test="${paraMapObj.GROUP_COLOR=='#FFFF00' }">selected</s:if> >黄色</option>
<option style="background-color:#FFFFFF" value="#FFFFFF" <s:if test="${paraMapObj.GROUP_COLOR=='#FFFFFF' }">selected</s:if>>白色</option>
<option style="background-color:#000000" value="#000000" <s:if test="${paraMapObj.GROUP_COLOR=='#000000' }">selected</s:if>>黑色</option>
</select>
</td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CROUP_TEST_MAX" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="CROUP_TEST_MAX" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="VALID_FLAG" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="VALID_FLAG" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" disabled="disabled"  dataId="${dataId}" formIndex="1" /></td>
		
		<tr>
			<td class="name" /><bu:uitn colNo="GROUP_DESC" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec" colspan="2" ><bu:ui colNo="GROUP_DESC" formId="f4bff8054eec43dd9b7ffe75eb0f03ac"  disabled="disabled"  dataId="${dataId}" rows="4" formIndex="1" style="height:80px;width:100%;"/></td>
		</tr>
	</table>
			<bu:jsVal formId="f4bff8054eec43dd9b7ffe75eb0f03ac" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		var fileMap = new Map();
	
		
		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$(".dept_select").trigger("chosen:updated");
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

			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
		
		}
		




function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}


$('#select_locale').click(function(){
	$('#upFiled60bd57aa37c40f1b3842beeb828a0e6').click();
})

function judgeImg(){
 var src=document.getElementById('img0').src;
 if(src.indexOf('plf/page/fp/img/process')==-1){//不是服务器图片
    document.getElementById('serverfileName').value='';
 }

}
function choosePic() {
				
	var piframeId = window.frameElement.id;
				
	var url = "${path}buss/bussModel.ms?exeid=2696ac9808c64dfd9d1b2d8e63f13568&piframeId="+piframeId;						

	showPopWinFp(url, 700, 350, "", "<dict:lang value="选择默认图片"/>",
						"choosePic", "");
	}
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