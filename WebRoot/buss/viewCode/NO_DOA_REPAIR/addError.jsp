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
<body>
	<div class="edit " style="height:191px; ">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
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
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			    <div class="optn">
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd " >
			<div class="mod">
	    	<div class="mod-hd" style="height:125px;border:none;">		
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0ab26fe960da4b8e824ba7b136743db9" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0ab26fe960da4b8e824ba7b136743db9" />
	<input type="hidden" name="0ab26fe960da4b8e824ba7b136743db9" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden"  name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="paraMap1@0#WE_SN" value="${param.weSn}"/>
	<input type="hidden" name="DR_REPAIR_STATION" value="${param.DR_REPAIR_STATION}"/>
	<input type="hidden" id="paraMap1@0#DR_MO_NUMBER" name="paraMap1@0#DR_MO_NUMBER" value="${param.DR_MO_NUMBER}"/>
		<input type="hidden" name="paraMap1@0#DR_MODEL_CODE" value="${param.DR_MODEL_CODE}"/>
		<s:set name="_$viewId" value="'3aee1bc3b6af4a21acd6e6d3b9b6c431'" />
		<s:set name="_$formId_1" value="'0ab26fe960da4b8e824ba7b136743db9'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="DR_ERROR_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec-self" colNo="DR_ERROR_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_ERROR_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_ERROR_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="DR_ERROR_DESC" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec-self" colNo="DR_ERROR_DESC" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_ERROR_DESC" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_ERROR_DESC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="DR_POINT" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec-self" colNo="DR_POINT" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_POINT"   formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_POINT}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="0ab26fe960da4b8e824ba7b136743db9" formIndex="1" />
		</div>		
		</div>	
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	
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
	var dataAuth = '${paraMap.dataAuth}';
	$("#deptLs_data_auth option").each(function(){
	 if($(this).val()==dataAuth){
	 $(this).attr("selected","selected");
	 }
	});
	}//控制与上一级弹窗的组织机构相同
	
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	function add(){
            console.log("获得志宁单"+$("paraMap1@0#DR_MO_NUMBER").val());
            
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
           
			$("#saveBtn").prop("disabled","disabled");
                   
            document.forms.addForm.action = "buss/bussModel_exeFunc.ms?funcMId=0a54d982b72e460982f9a86228466b0e&model=save";
       
			document.forms.addForm.submit();
			
			
       }
       
       
    function addParentData(msg,title,width,height,time){
	  msgPop(msg,'',title,width,height,time);
	  var piframeId='${param.piframeId}';
	  
	  var parentWindows = $(window.parent.document).contents().find("#"+piframeId)[0].contentWindow;
	  var weSn='${param.weSn}';

	  parentWindows.queryErrorList(weSn);
	  if($("#isCloseWin").attr('checked')){
	  	  closeTopPopWinFp(window.frameElement.id + "pop");
	  }
	  
	}
	
	function queryError(val){
	 
	  jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=a65b93b5ddf04b16b40f59b2fc2019b0&errorCode="+val+"&type=1",
 			success: function(data){
 				var pList=data.ajaxList; 				
 				
 				$("#paraMap1_WE_ERROR_DESC").val(pList[0].CEC_DESC);
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				
 		   }
 		});
	}


</script>
	
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
