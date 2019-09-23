<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>  
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="修改" />
</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
</jsp:include>

<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script src="${path}js/jchose/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="${path}js/jchose/chosen.css" />
<script type="text/javascript">
		$(function(){
        		$("#paraMapObj_TRACKING_DATE").val('${dataMap.nowDate}');
        		
        		$('.ico-date-h').css('left',300 - 15 + 'px');
			$('.ico-date-readonly').css('left',300 - 15 + 'px');
        	});
        	
		
		var addTableTrMap;
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
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

		var FORM_COL_ID_D=null;
	    function valData(){
			var checkRes = true;
			return checkRes;		
			}
		function initEditDataLs(){
			getEditRows("2d4d0184423b492cabd07b99279a36d2","2","48144a83dd8d48bfb2efd478b3e61934","2d4d0184423b492cabd07b99279a36d2","779f2a5bc172400b91e553d8dfb505c1","${dataId}");
		}
		
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="/mes/buss/bussModel_editSubDataAx.ms";
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
					_toClickColor(row);// 
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
	</script>
</head>
<body>
	<div class="edit">
            		<div class="hd">
			    <div class="optn">
			        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>
			</div>
			<div class="bd">
			<form id="editForm" name="editForm"
				action="${path}buss/bussModel_editComm.ms" method="post"
				<bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}"> <input
					type="hidden" name="formId"
					value="48144a83dd8d48bfb2efd478b3e61934"> <input
					type="hidden" name="dataId" value="${dataId}">
				<%--<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}"
					value="%{FUNC_CODE_2}" />
				<s:token />
				<%--<table class="func_table">
					<tr>
						<td width="100%" align="right"><input type="button"
							value="<dict:lang value="提交" />" onclick="edit(this);"
							class="botton_img_add">
							value="<dict:lang value="关闭" />" onclick="parent.closePopWin();"
							class="botton_img_search"></td>
					</tr>
				</table>
				<table class="add_table">
					<tr>
						<th colspan="4"><span class="Eng">*</span> 为必填项</th>
					</tr>
				</table>--%>
				<div style="display: none;">
					<div style="padding:1px;"></div>
				<table id="addTable_2d4d0184423b492cabd07b99279a36d2"
					class="table_list">
					<input type="hidden" name="formIds"
						value="2d4d0184423b492cabd07b99279a36d2" />
					<input type="hidden" name="2d4d0184423b492cabd07b99279a36d2"
						value="paraMap2@" />
					<input type="hidden" name="paraMap2@__LEVEL__" value="2" />
					<input type="hidden" name="paraMap2@__DATA_COUNT__" value="2" />
					<thead>
						<tr>
							<th colspan="9">[评审记录人员]&nbsp;&nbsp;<span class="dot"></span>为必填项&nbsp;&nbsp;<a
								href="javascript:addRow('2d4d0184423b492cabd07b99279a36d2','2');"
								title="?追加数据"><img
									src="/mes/plf/style/css1/images/button_add.gif" />
							</a>
							</th>
						</tr>
						<tr class="tdcolor">
							<th class="name">用户ID</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<input type="hidden"
							id="addTable_FORM_COL_ID_D2d4d0184423b492cabd07b99279a36d2"
							value="779f2a5bc172400b91e553d8dfb505c1">
						<textarea id="_addTableTr_2d4d0184423b492cabd07b99279a36d2"
							style="width:0px;height:0px;display:none;" disabled="disabled">
		 				&lt;tr id=&quot;addTableTr0_2d4d0184423b492cabd07b99279a36d2&quot;  &gt; 			&lt;td&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMapObj_0_USER_ID&quot; name=&quot;paraMap2@0#USER_ID&quot; class=&quot;isSubmit null&quot; /&gt;
&lt;/td&gt;			&lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; onclick=&quot;delEditRow(this,'','2d4d0184423b492cabd07b99279a36d2');&quot; title=&quot;?&#21024;&#38500;&#25968;&#25454;&quot;&gt;&lt;img src=&quot;/mes/plf/style/css1/images/m_rm.gif&quot; /&gt;&lt;/a&gt;&lt;/td&gt;		&lt;/tr&gt;		</textarea>
						<script> 
 
</script>
					</tbody>
				</table>
				</div>
				<table class="basic-table" style="display:none;">
					<%--<input type="hidden" name="formIds"
						value="48144a83dd8d48bfb2efd478b3e61934" />
					<input type="hidden" name="48144a83dd8d48bfb2efd478b3e61934"
						value="paraMap1@" />
					--%><%--<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
					<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
					--%>
					<s:set name="_$viewId" value="'8c48a9cf080d435098e1b7e2622ecc91'" />
					<s:set name="_$formId_1" value="'48144a83dd8d48bfb2efd478b3e61934'" />
					<s:set name="_$type" value="'edit'" />
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="RESPOMSOBLE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td><bu:ui colNo="RESPOMSOBLE" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
						<td class="name "><span class="dot"></span><bu:uitn colNo="MODNAME" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td><bu:ui colNo="MODNAME" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="PROJECT" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td><bu:ui colNo="PROJECT" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
						<td class="name "><span class="dot"></span><bu:uitn colNo="PRIORITY" formId="48144a83dd8d48bfb2efd478b3e61934" /> </td>
						<td class="dec"><bu:ui colNo="PRIORITY" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="REVIEW_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td class="dec"><bu:ui colNo="REVIEW_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
						<%--
						<td class="name "><span class="dot">*</span><bu:uitn colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td><bu:ui colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>--%>
					</tr>
					<tr>
						<td class="name "><bu:uitn colNo="CODE_PATH" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td colspan="3"><bu:ui colNo="CODE_PATH" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
					</tr>
					<tr>
						<td class="name "><bu:uitn colNo="CODE_DETAIL" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td colspan="3" class="dec"><bu:ui colNo="CODE_DETAIL" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
					</tr>
					<tr>
						<td class="name "><bu:uitn colNo="IMPROVE_USER" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td><bu:ui colNo="IMPROVE_USER" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
						<td class="name "><bu:uitn colNo="IMPROVE_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td class="dec"><bu:ui colNo="IMPROVE_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
					</tr>
					<tr>
						<td class="name "><bu:uitn colNo="IMPROVE_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td colspan="3"><bu:ui colNo="IMPROVE_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
					</tr>
					<tr>
						<td class="name "><bu:uitn colNo="CHECK_USER" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td><bu:ui colNo="CHECK_USER" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
						<td class="name "><bu:uitn colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td class="dec"><bu:ui colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" /></td>
					</tr>
					<tr>
						<td class="name "><bu:uitn colNo="CHECK_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td colspan="3"><bu:ui colNo="CHECK_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"  formIndex="1" /></td>
					</tr>
					</table>
					<table class="basic-table" >
					<tr>
						<td class="name " style="width:93px;" ><span class="dot">*</span><bu:uitn colNo="HANDLE_USER" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td class="dec" ><bu:ui colNo="HANDLE_USER" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"  style="width:300px;" formIndex="1"  cssClass="_VAL_NULL isSubmit" /></td>
					</tr>
					<tr>	
						<td class="name "><span class="dot">*</span><bu:uitn colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td class="dec" ><dict:selectDict dictCode="CODECK_STATE" dictValue="%{paraMapObj.STATE}"  id="paraMapObj_STATE" 
							cssClass="input _VAL_NULL isSubmit" name="paraMapObj.STATE"  style="width:300px;" onchange="setUiData(this);"  filterVal="0,1,2,6"/> </td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="TRACKING_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td class="dec" ><bu:ui colNo="TRACKING_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"  style="width:300px;" formIndex="1"  cssClass="_VAL_NULL isSubmit" /></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="HANDLE_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td style="height:80px;" class="dec"><bu:ui colNo="HANDLE_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" style="width:300px;height:100%;" formIndex="1"  cssClass="_VAL_NULL isSubmit" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>
	<bu:script viewId="31d5f38ec755477ebe7a2a7ad574b919" />

	<script type="text/javascript">
		
     	</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	function init(){
		initEditDataLs();
		$(".<s:property value="%{@com.more.mes.common.tags.mes.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
		/*
		var formIds = $("input[type='hidden'][name='formIds']").val();
		var formIdLs = formIds.split(",");
		for(var i=0,j=formIdLs.length;i<j;i++){
			getEditRows(formIdLs[i],"0");
		}
		*/	
	}//初始化方法
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
