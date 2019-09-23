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
<style>
	.dialog-bd{
		height:159px;
	}
	
		
	
</style>
	
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
			        <!--<button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>-->
			         <button type="button" onclick="btImport();"><i class="ico ico-lead"></i><dict:lang value="导入" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ba1fc70eef83416c878e187b59b7882f" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ba1fc70eef83416c878e187b59b7882f" />
	<input type="hidden" name="ba1fc70eef83416c878e187b59b7882f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'53a0e52ab05a40f8a4dd15d1cc108e05'" />
		<s:set name="_$formId_1" value="'ba1fc70eef83416c878e187b59b7882f'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><bu:uitn colNo="WOS_FILE" formId="ba1fc70eef83416c878e187b59b7882f" />
		   </td>
			<bu:td cssClass="dec-self" colNo="WOS_FILE" formId="ba1fc70eef83416c878e187b59b7882f" ><input type="file" name="upFile" id="upFile" accept=".xlsx,.xls"></td></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WOS_SUP_CO" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<bu:td cssClass="dec-self" colNo="WOS_SUP_CO" formId="ba1fc70eef83416c878e187b59b7882f" ><bu:ui colNo="WOS_SUP_CO" formId="ba1fc70eef83416c878e187b59b7882f" value="%{WOS_SUP_CO}" formIndex="1" /></bu:td>
		</tr>
	
	</table>
			<bu:jsVal formId="ba1fc70eef83416c878e187b59b7882f" formIndex="1" />
				
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
	
	function btImport(){
    	var oInput = document.getElementById("upFile").files[0];
    	if(oInput==null){
     	utilsFp.confirmIcon(3,"","","", "未选择任何文件",0,"300","");
       		 return;
    	}  
      if($("#paraMap1_WOS_SUP_CO").val()==""){
      	utilsFp.confirmIcon(3,"","","", "请选择供应商",0,"300","");
      	return;
      }
		var statusStr;
         var formData = new FormData();
        formData.append("upFile", document.getElementById("upFile").files[0]); 
    	$.ajax({
        	type:"POST",
        	dataType:"json",
        	url:"${path}buss/bussModel_exeFunc.ms?funcMId=49e56b6d76c9479ab4dd3d8e4a43abe2&paraMap.supCode="+$("#paraMap1_WOS_SUP_CO").val(),
        	contentType: false,
        	processData: false,
        	data:formData,
        	success:function(data){
    	    	            console.log(data);
    	    	            if(data.ajaxMap&&"OK"==data.ajaxMap.MSG){
    	    	                utilsFp.confirmIcon(2,"","","", "导入成功。",0,"300","");
    	    	                return;
    	    	            }
    	    	          // utilsFp.confirmIcon(2,"","","", "导入失败。",2,"300","");
    	    	           utilsFp.confirmIcon(3,"","","", "导入失败",0,"300","");
    	    	            },
    	    	            
        	error:function(msg){
        		if(msg.readyState==4){
    	    	         //  utilsFp.confirmIcon(2,"","","", "导入失败。",2,"300","");
    	    	           utilsFp.confirmIcon(3,"","","", "导入失败",0,"300","");
        		}
        		
        	}
    	});
	}
	
	$(function(){
		$("#popupFrameFpId").css("height","159px");	
		$(".dialog-bd").css("height","159px");
	});
	
	

</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
