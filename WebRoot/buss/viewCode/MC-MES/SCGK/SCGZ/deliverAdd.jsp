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
	<div class="edit">
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="55eb4787d33d4dbbaa1708806ece31b5" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="55eb4787d33d4dbbaa1708806ece31b5" />
	<input type="hidden" id="prefixInd" name="55eb4787d33d4dbbaa1708806ece31b5" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'9df5bba1764c4d1ea068bd9e55798960'" />
		<s:set name="_$formId_1" value="'55eb4787d33d4dbbaa1708806ece31b5'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><bu:uitn colNo="TWD_PROJECT" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec" colNo="TWD_PROJECT" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui colNo="TWD_PROJECT" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_PROJECT}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TWD_UNIT" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="TWD_UNIT" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui colNo="TWD_UNIT" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_UNIT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TWD_SCLH" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec" colNo="TWD_SCLH" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui colNo="TWD_SCLH" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_SCLH}" formIndex="1" readonly="readonly"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="TWD_CPXH" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec" colNo="TWD_CPXH" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui colNo="TWD_CPXH" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_CPXH}" formIndex="1" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TWD_NUM" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec" colNo="TWD_NUM" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui colNo="TWD_NUM" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_NUM}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TWD_CONTENT" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec" colNo="TWD_CONTENT" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui colNo="TWD_CONTENT" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_CONTENT}" formIndex="1" readonly="readonly"/></bu:td>
		</tr>
		<tr>
					<td class="name" /><bu:uitn colNo="TWD_QUALITY_NO" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec" colNo="TWD_QUALITY_NO" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui colNo="TWD_QUALITY_NO" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_QUALITY_NO}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="TWD_MEMO" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec" colNo="TWD_MEMO" formId="55eb4787d33d4dbbaa1708806ece31b5"  colspan="3" style="height:80px;"><bu:ui colNo="TWD_MEMO" style="width:100%;height:100%;" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_MEMO}" formIndex="1" /></bu:td>
		
		</tr>
	</table>
			<bu:jsVal formId="55eb4787d33d4dbbaa1708806ece31b5" formIndex="1" />
				
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
<script type="text/javascript">
//获取用户单位
function getCompareInfo(project){
    
    util.showLoading("处理中...");
			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=18ad0f68cd4a4ca38469b7f167151231";
	       $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	               "project" : project
	           },
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxMap){
                	    if(data.ajaxMap.TWD_UNIT!=null){
                	        $("#paraMap1_TWD_UNIT").val(data.ajaxMap.TWD_UNIT);
                	    }
                	}
	           },
	           error:function(msg){
	                if(msg.readyState!=0){
    	               util.closeLoading();
    	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	                }
	           }
	       });
}
	    function addCal(){
                        
                        isQuery = false;
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
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false);
                        			
                       if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
            		
			           
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=7befcdec29bf42bd93bbc56304a84d88";
                        document.forms.addForm.submit();
                        isQuery = true;
			$DisInput.attr("disabled", true);
            }
	
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
