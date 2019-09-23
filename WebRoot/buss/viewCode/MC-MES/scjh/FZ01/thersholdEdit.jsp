<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_11" />
		<jsp:param name="location" value="inHead" />
	</jsp:include>
	<!-- 产品静态资源 -->

</head>
<body style="overflow:auto;">
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
		<div class="bd">
			<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
				<jsp:param name="modelName" value="VIEW_TYPE_11" />
				<jsp:param name="location" value="editForm" />
			</jsp:include>
			<bu:set name="paraMapObj" value="${dataId}" formId="640840a5c9ad4beba8b135096ed4ce00" type="edit" />
			<table class="basic-table" >
				<input type="hidden" name="formIds" value="640840a5c9ad4beba8b135096ed4ce00" />
				<input type="hidden" id="prefixInd" name="640840a5c9ad4beba8b135096ed4ce00" value="paraMap1@" />
				<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<s:set name="_$viewId" value="'c7e75e3cd11c41b5ba18aced935a863e'" />
				<s:set name="_$formId_1" value="'640840a5c9ad4beba8b135096ed4ce00'" />
				<s:set name="_$type" value="'edit'"/>
				<tr>
					<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
					<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name-six" /><bu:uitn colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
					<td class="name-six" /><bu:uitn colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
					<bu:td cssClass="dec-self" colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
			</table>
			<bu:jsVal formId="640840a5c9ad4beba8b135096ed4ce00" formIndex="1" />		<div style="padding:1px;"></div>

			<div class="mod" >
				<div class="mod-hd">
					<h3 class="tit"><dict:lang value="量级配置" /></h3>
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
								<table class="glxb-table" style="width:100%" id="addTable_ec7d8835a55f4dfbae645cf1192a6a97" >
									<tbody id="tbody_ec7d8835a55f4dfbae645cf1192a6a97" >
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				function initEditDataLs(){
					getEditRows("ec7d8835a55f4dfbae645cf1192a6a97","2","640840a5c9ad4beba8b135096ed4ce00","","a86f0d2967e04ae2bb95a9aa8dfb8a02","");
					$('table').find('tbody tr:eq(0)').click();
                  	numberCheck();
				}
			</script>


		</div>
	</form>
</div>

<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>

<!-- js初始化方法 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="jsLoading" />
</jsp:include>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
	<jsp:param name="needValidate" value="1" />
</jsp:include>

<script>
	function edit(thisObj){
		if(isQuery){util.alert("数据正在提交，请稍候...");}
		if(!val.valNullData()){
			return ;
		}
		if(!valNullCheck()){
			return;
		}
		if(!val.valDataBaseSetData()){
			return ;
		}
		if(!valData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}

		//阀值信息校验
		// if(!thresholeCheck()){
		// 	return ;
		// }

		//量级校验
		if(!quantityCheck()){
			return ;
        }
        //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题
		emptyValToHide();
		document.forms.editForm.submit();
		isQuery = true;
	}

	function valNullCheck() {
		if($("#paraMapObj_THRESHOLD_TYPE").val()==""){
			_alertValMsg($("#paraMapObj_THRESHOLD_TYPE_chosen"),"<dict:lang value="该项不能为空" />");
			return false;
		}
		if($("#paraMapObj_FACTORY_CODE").val()==""){
			_alertValMsg($("#paraMapObj_FACTORY_CODE"),"<dict:lang value="该项不能为空" />");
			return false;
		}
		if($("#paraMapObj_THRESHOLD_TYPE").val()==2 && $("#paraMapObj_WORK_STATION_CODE").val()==""){
			_alertValMsg($("#paraMapObj_WORK_STATION_CODE_chosen"),"<dict:lang value="该项不能为空" />");
			return false;
		}
		if($("#paraMapObj_ITEM_CODE").val()!="" && $("#paraMapObj_WORK_STATION_CODE").val()==""){
			_alertValMsg($("#paraMapObj_WORK_STATION_CODE_chosen"),"<dict:lang value="该项不能为空" />");
			return false;
		}

		if($("#paraMapObj_THRESHOLD_NUM").val()==""){
			_alertValMsg($("#paraMapObj_THRESHOLD_NUM"),"<dict:lang value="该项不能为空" />");
			return false;
		}
		return true;
	}

	function thresholeCheck() {
		var THRESHOLD_TYPE=$("#paraMapObj_THRESHOLD_TYPE").val();
		var FACTORY_CODE=$("#paraMapObj_FACTORY_CODE").val();
		var WORK_STATION_CODE=$("#paraMapObj_WORK_STATION_CODE").val();
		var ITEM_CODE=$("#paraMapObj_ITEM_CODE").val();

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
				ITEM_CODE:ITEM_CODE
			},
			success:function(data){
				var num = Number(data.ajaxString);
				debugger;
				if(num!="0"){
					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="该阀值已维护.请勿重复添加!" />", 0, "160", "");
					back = false;
				}
			},
			error:function(error){
				utilsFp.confirmIcon(3, "", "", "", "保存异常!", 0, "160", "");
				back = false;
			}
		});
		return back;
	}

	function quantityCheck() {
		var quantityLenght = Number($("#tbody_ec7d8835a55f4dfbae645cf1192a6a97").children().length);
		if(quantityLenght==0){
			return true;
		}
		var levelLowArr = [];
		var levelHightArr = [];

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
					utilsFp.confirmIcon(3, "", "", "", data.ajaxString, 0, "160", "");
					back = false;
				}
			},
			error:function(error){
				utilsFp.confirmIcon(3, "", "", "", "保存异常!", 0, "160", "");
				back = false;
			}
		});
		return back;
	}

	/*
	var ITEM_CODE = "paraMapObj_ITEM_CODE_SHOW";
	if($("#paraMapObj_THRESHOLD_TYPE").val()=="1"){
		$("#"+ITEM_CODE).removeClass("readonly");
		$("#"+ITEM_CODE).removeAttr("pointer-events");
	}else{
		$("#paraMapObj_ITEM_CODE").val("");
		$("#"+ITEM_CODE).val("");
		$("#"+ITEM_CODE).addClass("readonly");
		$("#"+ITEM_CODE).attr("pointer-events","none");
	}
	$("#paraMapObj_THRESHOLD_TYPE").change(function () {
		debugger;
		if(this.value=="1"){
			$("#"+ITEM_CODE).removeClass("readonly");
			$("#"+ITEM_CODE).removeAttr("pointer-events");
		}else{
			$("#paraMapObj_ITEM_CODE").val("");
			$("#"+ITEM_CODE).val("");
			$("#"+ITEM_CODE).addClass("readonly");
			$("#"+ITEM_CODE).attr("pointer-events","none");
		}
	});
	*/
  
  
	$("#paraMapObj_THRESHOLD_NUM").keyup(function() {
      debugger;
		onlyNumber(this);
	});
  
    function numberCheck(){
       $("input[id$='_LEVEL_LOW']").keyup(function() {
				onlyNumber(this);
	   });

	   $("input[id$='_LEVEL_HIGHT']").keyup(function() {
		   onlyNumber(this);
	   });

	   $("input[id$='_THRESHOLD_NUM']").keyup(function() {
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
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>
