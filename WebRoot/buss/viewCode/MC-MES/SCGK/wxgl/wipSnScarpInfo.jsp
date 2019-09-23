<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
		target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
               <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 160px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 160px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    <div class="optn">
			        <button type="button" id="saveBtn" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
            			<div class="mod">
                    <div class="mod-hd" style="height:370px;border:none;">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="2b6254b6777a466c87c43d5061ba0617" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2b6254b6777a466c87c43d5061ba0617" />
	<input type="hidden" name="2b6254b6777a466c87c43d5061ba0617" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_WSC_PROJECT_ID" name="paraMap1@0#WSC_PROJECT_ID" value="<c:out value='${param.PROJECT_ID}'/>">
	<input type="hidden" id="paraMap1_WSC_WORK_STAION" name="paraMap1@0#WSC_WORK_STAION" value="<c:out value='${param.WORK_STATION}'/>">
		<s:set name="_$viewId" value="'df1a6b8143be4549874ab47ef01d691c'" />
		<s:set name="_$formId_1" value="'2b6254b6777a466c87c43d5061ba0617'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:82px;"/><bu:uitn colNo="WSC_SN" formId="2b6254b6777a466c87c43d5061ba0617" /></td>
			<td class="dec"  ><input type="text" id="paraMap1_WSC_SN" name="paraMap1@0#WSC_SN" value="<c:out value='${param.weSn}'/>" disabled="disabled" class=" input isSubmit " style="width:300px;"></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSC_MO_NUMBER" formId="2b6254b6777a466c87c43d5061ba0617" /></td>
			<td class="dec"   ><input type="text" id="paraMap1_WSC_MO_NUMBER" name="paraMap1@0#WSC_MO_NUMBER" value="<c:out value='${param.MO_NUMBER}'/>" disabled="disabled" class=" input isSubmit " style="width:300px;"></td>
		</tr>
		<tr>
			
			<td class="name" /><bu:uitn colNo="WSC_ITEM_CODE" formId="2b6254b6777a466c87c43d5061ba0617" /></td>
			<td class="dec"   ><input type="text" id="paraMap1_WSC_ITEM_CODE" name="paraMap1@0#WSC_ITEM_CODE" value="<c:out value='${param.MODEL_CODE}'/>" disabled="disabled" class=" input isSubmit " style="width:300px;"></td>
		</tr>
		<tr>
			
			<td class="name" /><dict:lang value="机种名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="WSC_MODEL_NAME" name="WSC_MODEL_NAME" value="<c:out value='${param.MODEL_NAME}'/>" disabled="disabled" style="width:300px;"/></td>
		</tr>
		<tr>
			
			<td class="name" /><dict:lang value="机种规格" /></td>
			<td class="dec"><input type="text" class=" input isSubmit " id="WSC_MODEL_SPEC" name="WSC_MODEL_SPEC" value="<c:out value='${param.MODEL_SPEC}'/>" disabled="disabled" style="width:300px;"/></td>
		</tr>
		<tr>
			
			<td class="name" /><span class="dot" id="pi">*</span><bu:uitn colNo="WSC_SCARP_NUM" formId="2b6254b6777a466c87c43d5061ba0617" /></td>
			<bu:td cssClass="dec" colNo="WSC_SCARP_NUM" formId="2b6254b6777a466c87c43d5061ba0617" ><bu:ui colNo="WSC_SCARP_NUM" formId="2b6254b6777a466c87c43d5061ba0617" value="%{WSC_SCARP_NUM}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			
			<td class="name" /><bu:uitn colNo="WSC_SCARP_TYPE" formId="2b6254b6777a466c87c43d5061ba0617" /></td>
			<bu:td cssClass="dec" colNo="WSC_SCARP_TYPE" formId="2b6254b6777a466c87c43d5061ba0617" ><bu:ui colNo="WSC_SCARP_TYPE" formId="2b6254b6777a466c87c43d5061ba0617" value="%{WSC_SCARP_TYPE}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSC_SCARP_REASON" formId="2b6254b6777a466c87c43d5061ba0617" /></td>
			<bu:td cssClass="dec" colNo="WSC_SCARP_REASON" formId="2b6254b6777a466c87c43d5061ba0617" ><bu:ui colNo="WSC_SCARP_REASON" formId="2b6254b6777a466c87c43d5061ba0617" value="%{WSC_SCARP_REASON}" formIndex="1" style="width:300px;height:80px;"/></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="2b6254b6777a466c87c43d5061ba0617" formIndex="1" />
									</form>
			</div>
		</div>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		setDataAuthVal();
	}//初始化方法
		function setDataAuthVal(){
	var dataAuth = '<c:out value="${paraMap.dataAuth}"/>';
	$("#deptLs_data_auth option").each(function(){
	 if($(this).val()==dataAuth){
	 $(this).attr("selected","selected");
	 }
	});
	}

	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	function add(){
                       
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
            $DisInput = $(":input[disabled='disabled'][class*='isSubmit']");
			$DisInput.attr("disabled", false); 
			$("#saveBtn").prop("disabled","disabled");
                   
            document.forms.addForm.action = "buss/bussModel_exeFunc.ms?funcMId=a65b93b5ddf04b16b40f59b2fc2019b0&type=saveScarp";
			document.forms.addForm.submit();
			$("#saveBtn").prop("disabled",false);
            $DisInput.attr("disabled", true);
       }
       
       function addParentData(msg,title,width,height,time){
	     msgPop(msg,'',title,width,height,time);
	     var piframeId='<c:out value="${param.piframeId}"/>';
	  
	  var parentWindows = $(window.parent.document).contents().find("#"+piframeId)[0].contentWindow;
	  var weSn='<c:out value="${param.weSn}"/>';
	  
	  parentWindows.queryErrorList(weSn);
	  
	     closeTopPopWinFp(window.frameElement.id + "pop");
	}
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>