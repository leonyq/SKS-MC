<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="修改" />
</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	<jsp:param name="datePicker" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type="text/javascript">
		$(function(){
        		$("#paraMapObj_IMPROVE_DATE").val('${dataMap.nowDate}');
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
					<input type="hidden" name="definedMsg" value="${definedMsg}">
				<%--<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}"
					value="%{FUNC_CODE_2}" />
				<s:token />
				<%--<table class="func_table">
					<tr>
						<td width="100%" align="right"><input type="button"
							value="<dict:lang value="提交" />" onclick="edit(this);"
							class="botton_img_add"> <input type="button"
							value="<dict:lang value="关闭" />" onclick="parent.closePopWin();"
							class="botton_img_search"></td>
					</tr>
				</table>--%>
				<div style="padding:1px;"></div>
						<div class="mod">
<div class="mod-hd">
<h3 class="tit">评审记录人员</h3>
<div class="more">
<a href="javascript:addRow('2d4d0184423b492cabd07b99279a36d2','2');" title="?添加" class="btn-op"><i class="ico ico-add"></i>?添加</a>
</div>
</div>
<div class="mod-bd">
<table id="addTable_2d4d0184423b492cabd07b99279a36d2" width="100%" class="glxb-table table-line">
	<input type="hidden" name="formIds" value="2d4d0184423b492cabd07b99279a36d2" />
	<input type="hidden" name="2d4d0184423b492cabd07b99279a36d2" value="paraMap2@" />
	<input type="hidden" name="paraMap2@__LEVEL__" value="2" />
	<input type="hidden" name="paraMap2@__DATA_COUNT__" value="2" />
		<thead>
		<tr>
			<th class="tr1 ">评审人员</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<input type="hidden" id="addTable_FORM_COL_ID_D2d4d0184423b492cabd07b99279a36d2" value="779f2a5bc172400b91e553d8dfb505c1" > 
				<textarea id="_addTableTr_2d4d0184423b492cabd07b99279a36d2" style="width:0px;height:0px;display:none;" disabled="disabled" >	
					&lt;tr id=&quot;addTableTr0_2d4d0184423b492cabd07b99279a36d2&quot; &gt; 			&lt;td&gt;				&lt;input type=&quot;hidden&quot;  id=&quot;paraMap1_USER_ID&quot; name=&quot;paraMap2@0#USER_ID&quot; class=&quot;isSubmit &quot; /&gt;
				&lt;div&gt;&lt;nobr&gt;&lt;input editName=&quot;paraMap2@#USER_ID&quot; type=&quot;text&quot;  id=&quot;paraMap1_USER_ID_SHOW&quot; class=&quot;isSubmit &quot; style=&quot;border:1px solid #FFD397;&quot; ondblclick=&quot;_showSelFkSql(this,'add%2C2d4d0184423b492cabd07b99279a36d2%2C06c7d132144b4ee288f3d7217df698da','&#29992;&#25143;ID'); &quot;  readonly=&quot;readonly&quot;   /&gt;&lt;img src=&quot;/mes/plf/images/ContImg25.gif&quot; onclick=&quot;_showSelFkSql_img(this,'paraMap2@0#USER_ID');&quot; style=&quot;cursor: pointer;&quot; title=&quot;&#28857;&#20987;&#36873;&#25321; &#29992;&#25143;ID&quot; /&gt;&lt;/nobr&gt;&lt;/div&gt;
&lt;/td&gt;			&lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; onclick=&quot;delRow(this);&quot; title=&quot;?&#31227;&#38500;&#34892;&quot;&gt;&lt;img src=&quot;/mes/plf/style/css1/images/m_rm.gif&quot; /&gt;&lt;/a&gt;&lt;/td&gt;		&lt;/tr&gt;		</textarea>
<script> 
 
</script>
		</tbody>
	</table>
</div>
</div>
				<table class="basic-table">
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
						<td class="name "><span class="dot">*</span><bu:uitn colNo="RESPOMSOBLE"
							formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td class="dec"><bu:ui colNo="RESPOMSOBLE"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1" disabled="disabled"/></td>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="MODNAME" formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td class="dec" style="width:230px;"><bu:ui colNo="MODNAME"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1" disabled="disabled"/></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="PROJECT" formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td class="dec"><bu:ui colNo="PROJECT"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1" disabled="disabled"/></td>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="PRIORITY" formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td class="dec"><bu:ui colNo="PRIORITY"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1" disabled="disabled"/></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="REVIEW_DATE"
							formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td class="dec"><bu:ui colNo="REVIEW_DATE"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1" disabled="disabled"/></td>
						<td class="name "><bu:uitn colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934"
							cssClass="name" />
						</td>
						<td class="dec"><bu:ui colNo="STATE"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1"  /></td>
					</tr>
					<tr>
						<td class="name "><bu:uitn colNo="CODE_PATH" formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td colspan="3"  style="height:80px;" class="dec" ><bu:ui colNo="CODE_PATH"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1"  style="width:100%;height:100%;" disabled="disabled"/></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="CODE_DETAIL"
							formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td colspan="3" style="height:80px;" class="dec"><bu:ui colNo="CODE_DETAIL"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1"  style="width:100%;height:100%;" disabled="disabled"/></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="IMPROVE_USER"
							formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td class="dec"><bu:ui colNo="IMPROVE_USER"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="IMPROVE_DATE"
							formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td class="dec"><bu:ui colNo="IMPROVE_DATE"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="IMPROVE_REMARK"
							formId="48144a83dd8d48bfb2efd478b3e61934" />
						</td>
						<td colspan="3" style="height:8px;" class="dec"><bu:ui colNo="IMPROVE_REMARK"
								formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}"
								formIndex="1"  style="width:100%;height:100%;" cssClass="_VAL_NULL isSubmit" /></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="CHECK_USER" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td class="dec"><bu:ui colNo="CHECK_USER" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td class="dec"><bu:ui colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td colspan="3" style="height:80px;" class="dec"><bu:ui colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" style="width:100%;height:100%" disabled="disabled"/></td>
					</tr>
					<tr>
						<td class="name "><span class="dot">*</span><bu:uitn colNo="CHECK_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
						<td colspan="3" style="height:80px;" class="dec"><bu:ui colNo="CHECK_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" dataId="${dataId}" formIndex="1" style="width:100%;height:100%" disabled="disabled"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>
	<bu:script viewId="b7ed8bee77fe42e0afe6cac63c3c7f28" />

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
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp"%>
