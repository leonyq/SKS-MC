<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_10" />
		<jsp:param name="location" value="inHead" />
	</jsp:include>
	<!-- head里面 -->

	<!-- 产品静态资源 -->


</head>
<body style="overflow:auto;">
<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
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
								  listKey="id" listValue="name" value=""  name="_DATA_AUTH"
								  id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
					</s:else>
				</s:if>


			</div>
			<div class="optn">
				<button type="button" onclick="add(this,'<c:out value="${formId}" />');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
				<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			</div>

		</div>
		<div class="bd">

			<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
				<jsp:param name="modelName" value="VIEW_TYPE_10" />
				<jsp:param name="location" value="addForm" />
			</jsp:include>
			<bu:set name="paraMapObj" value="${dataId}" formId="640840a5c9ad4beba8b135096ed4ce00" type="add" />
			<table class="basic-table" >
				<input type="hidden" name="formIds" value="640840a5c9ad4beba8b135096ed4ce00" />
				<input type="hidden" id="prefixInd" name="640840a5c9ad4beba8b135096ed4ce00" value="paraMap1@" />
				<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<s:set name="_$viewId" value="'b7fe39732df64a89875d22dc64779225'" />
				<s:set name="_$formId_1" value="'640840a5c9ad4beba8b135096ed4ce00'" />
				<s:set name="_$type" value="'add'" />

				<tr>
					<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" value="%{THRESHOLD_TYPE}" formIndex="1" /></bu:td>
					<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" value="%{FACTORY_CODE}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name-six" /><bu:uitn colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" value="%{WORK_STATION_CODE}" formIndex="1" /></bu:td>
					<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" value="%{ITEM_CODE}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" value="%{THRESHOLD_NUM}" formIndex="1" /></bu:td>
				</tr>
			</table>
			<bu:jsVal formId="640840a5c9ad4beba8b135096ed4ce00" formIndex="1" />		<div style="padding:1px;"></div>

			<div class="mod" >
				<div class="mod-hd">
					<h3 class="tit"><dict:lang value="HLY-量级配置" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('ec7d8835a55f4dfbae645cf1192a6a97','2','','','');numberCheck();"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('ec7d8835a55f4dfbae645cf1192a6a97','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i>
						</button>
					</div>
				</div>
				<div class="mod-bd" >
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
							<div class="datagrid-header" >
								<div class="datagrid-header-inner" id="datagrid-header-innerec7d8835a55f4dfbae645cf1192a6a97">
									<bu:addSub formid="640840a5c9ad4beba8b135096ed4ce00" formIndex="2"  selfformid="ec7d8835a55f4dfbae645cf1192a6a97" hidecol=""  viewid="" />
								</div>
							</div>
							<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'ec7d8835a55f4dfbae645cf1192a6a97')" >
								<table class="glxb-table fixedTable" style="width:100%" id="addTable_ec7d8835a55f4dfbae645cf1192a6a97" >
									<tbody id="tbody_ec7d8835a55f4dfbae645cf1192a6a97" >
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</form>
</div>

<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
	<jsp:param name="location" value="jsLoading" />
</jsp:include>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="needValidate" value="1" />
</jsp:include>
<script>
	function add(thisObj){
		isQuery = false;
		if(!valNullCheck()){
			return;
		}
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
		//阀值信息校验
		if(!thresholeCheck()){
			return ;
		}

		//量级校验
		if(!quantityCheck()){
			return ;
        }
        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
		$DisInput.attr("disabled", false);
		if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){

			$("#addForm").append($("#isCloseWin").clone());
			$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
		}
		$("#saveBtn").prop("disabled",true);
		try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
		document.forms.addForm.submit();
		isQuery = true;
		$DisInput.attr("disabled", true);
	}

	function valNullCheck() {
		if($("#paraMap1_THRESHOLD_TYPE").val()==""){
			_alertValMsg($("#paraMap1_THRESHOLD_TYPE_chosen"),"<dict:lang value="该项不能为空" />");
			return false;
		}
		if($("#paraMap1_FACTORY_CODE").val()==""){
			_alertValMsg($("#paraMap1_FACTORY_CODE"),"<dict:lang value="该项不能为空" />");
			return false;
		}
		<%--if($("#paraMap1_THRESHOLD_TYPE").val()==2 && $("#paraMap1_WORK_STATION_CODE").val()==""){--%>
			<%--_alertValMsg($("#paraMap1_WORK_STATION_CODE"),"<dict:lang value="该项不能为空" />");--%>
			<%--return false;--%>
		<%--}--%>
		<%--if($("#paraMap1_THRESHOLD_TYPE").val()==2 && $("#paraMap1_PROJECT_CODE").val()==""){--%>
			<%--_alertValMsg($("#paraMap1_PROJECT_CODE"),"<dict:lang value="该项不能为空" />");--%>
			<%--return false;--%>
		<%--}--%>

		if($("#paraMap1_THRESHOLD_NUM").val()==""){
			_alertValMsg($("#paraMap1_THRESHOLD_NUM"),"<dict:lang value="该项不能为空" />");
			return false;
		}
		return true;
	}


	function thresholeCheck() {
		var THRESHOLD_TYPE=$("#paraMap1_THRESHOLD_TYPE").val();
		var FACTORY_CODE=$("#paraMap1_FACTORY_CODE").val();
		var WORK_STATION_CODE=$("#paraMap1_WORK_STATION_CODE").val();
		var PROJECT_CODE=$("#paraMap1_PROJECT_CODE").val();

		var back = true;
		$.ajax({
			type:"post",
			async: false,
			dataType:"json",
			url:"${path}buss/bussModel_exeFunc.ms?funcMId=c83aff0684804ffd82470716d08aea27",
			data:{
				THRESHOLD_TYPE:THRESHOLD_TYPE,
				FACTORY_CODE:FACTORY_CODE,
				WORK_STATION_CODE:WORK_STATION_CODE,
				PROJECT_CODE:PROJECT_CODE
			},
			success:function(data){
				var num = Number(data.ajaxString);
				debugger;
				if(num!="0"){
					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="改阀值已维护.请勿重复添加!" />", 0, "160", "");
					back = false;
				}
			},
			error:function(error){
				showLoading(false);
			}
		});
		return back;
	}

	function quantityCheck() {
		var quantityLenght = Number($("#tbody_ec7d8835a55f4dfbae645cf1192a6a97").children().length);
		if(quantityLenght==0){
			return true;
		}
		var levelNameArr = [];
		var levelLowArr = [];
		var levelHightArr = [];
		var thresholdNumArr = [];
		$("input[id$='_LEVEL_NAME']").each(function () {
			var cur = $(this).val();
			if (cur != null) {
				levelNameArr.push(cur);
			} else {
				levelNameArr.push("");
			}
		});

		$("input[id$='_LEVEL_LOW']").each(function () {
			var cur = $(this).val();
			if (cur != null) {
				levelLowArr.push(cur);
			} else {
				levelLowArr.push("");
			}
		});

		$("input[id$='_LEVEL_HIGHT']").each(function () {
			var cur = $(this).val();
			if (cur != null) {
				levelHightArr.push(cur);
			} else {
				levelHightArr.push("");
			}
		});

		$("input[id$='_THRESHOLD_NUM']").each(function () {
			var cur = $(this).val();
			if (cur != null) {
				thresholdNumArr.push(cur);
			} else {
				thresholdNumArr.push("");
			}
		});

		var back = true;
		$.ajax({
			type:"post",
			async: false,
			dataType:"json",
			url:"${path}buss/bussModel_exeFunc.ms?funcMId=ac728511a74a4aebbcc5f2282d762880",
			data:{
				LEVEL_LOW:levelLowArr.join(","),
				LEVEL_HIGHT:levelHightArr.join(","),
			},
			success:function(data){
				var num = Number(data.ajaxString);
				if(num!=0){
					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="区间有误" />", 0, "160", "");
					back = false;
				}
			},
			error:function(error){
				showLoading(false);
			}
		});
		return back;
	}

	$("#paraMap1_THRESHOLD_NUM").keyup(function() {
		onlyNumber(this);
	});

	function numberCheck() {
		$("input[id$='_LEVEL_LOW']").keyup(function () {
			onlyNumber(this);
		});

		$("input[id$='_LEVEL_HIGHT']").keyup(function () {
			onlyNumber(this);
		});

		$("input[id$='_THRESHOLD_NUM']").keyup(function () {
			onlyNumber(this);
		});
	}


	function onlyNumber(obj){
		//得到第一个字符是否为负号
		var t = obj.value.charAt(0);
		//先把非数字的都替换掉，除了数字和.
		obj.value = obj.value.replace(/[^\d\.]/g,'');
		//必须保证第一个为数字而不是.
		obj.value = obj.value.replace(/^\./g,'');
		//保证只有出现一个.而没有多个.
		obj.value = obj.value.replace(/\.{2,}/g,'.');
		//保证.只出现一次，而不能出现两次以上
		obj.value = obj.value.replace('.','$#$').replace(/\./g,'').replace('$#$','.');
		//如果第一位是负号，则允许添加
		if(t == '-'){
			obj.value = '-'+obj.value;
		}
	}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>
