<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body style="cursor: auto; ">
	<div class="edit" >
	<form  id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd" >
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;width:700px; ">
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
			    	        <button type="button" onclick="editDatile();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:300px">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="862fd67fe05f4b32a421197aaaab281d" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="862fd67fe05f4b32a421197aaaab281d" />
	<input type="hidden" name="862fd67fe05f4b32a421197aaaab281d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="CODE" name="WMI_ITEM_CODE" value=""/>
	<input type="hidden" id="STATUS" name="WMI_STATUS" value=""/>
		<s:set name="_$viewId" value="'2c08ac515c9d472db7955c8133bd2b06'" />
		<s:set name="_$formId_1" value="'862fd67fe05f4b32a421197aaaab281d'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WMI_ITEM_SN" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<bu:td cssClass="dec-self" colNo="WMI_ITEM_SN" formId="862fd67fe05f4b32a421197aaaab281d" ><bu:ui  readonly="true" colNo="WMI_ITEM_SN" formId="862fd67fe05f4b32a421197aaaab281d" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="WMI_STATUS" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<bu:td cssClass="dec-self" colNo="WMI_STATUS" formId="862fd67fe05f4b32a421197aaaab281d" ><bu:ui readonly="true" colNo="WMI_STATUS" formId="862fd67fe05f4b32a421197aaaab281d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WMI_ITEM_CODE" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<bu:td cssClass="dec-self" colNo="WMI_ITEM_CODE" formId="862fd67fe05f4b32a421197aaaab281d" ><bu:ui  colNo="WMI_ITEM_CODE" formId="862fd67fe05f4b32a421197aaaab281d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="WMI_ITEM_LOT" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<bu:td cssClass="dec-self" colNo="WMI_ITEM_LOT" formId="862fd67fe05f4b32a421197aaaab281d" ><bu:ui readonly="true" colNo="WMI_ITEM_LOT" formId="862fd67fe05f4b32a421197aaaab281d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WMI_ITEM_NUM" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<bu:td cssClass="dec-self" colNo="WMI_ITEM_NUM" formId="862fd67fe05f4b32a421197aaaab281d" ><bu:ui readonly="true" colNo="WMI_ITEM_NUM" formId="862fd67fe05f4b32a421197aaaab281d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="WMI_WORK_AREA" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<bu:td cssClass="dec-self" colNo="WMI_WORK_AREA" formId="862fd67fe05f4b32a421197aaaab281d" ><bu:ui readonly="true" colNo="WMI_WORK_AREA" formId="862fd67fe05f4b32a421197aaaab281d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td   class="name-six" /><bu:uitn colNo="WMI_PASS_MEMO" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<bu:td colspan="3"  cssClass="dec-self" colNo="WMI_PASS_MEMO" formId="862fd67fe05f4b32a421197aaaab281d" ><bu:ui  rows="3" style="width:98.5%;" colNo="WMI_PASS_MEMO" formId="862fd67fe05f4b32a421197aaaab281d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="862fd67fe05f4b32a421197aaaab281d" formIndex="1"  />
									
			</div>
	</form>	
	</div>

	<div style="display: none;" >
		<iframe id="submitFrame" name="submitFrame" width="0" height="0" src="" ></iframe>
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
    <script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
    <bu:submit viewId="2c08ac515c9d472db7955c8133bd2b06" />
    <bu:script viewId="2c08ac515c9d472db7955c8133bd2b06" />
    <script type="text/javascript">
        	$(function(){
        	   $("#CODE").val($("#paraMapObj_WMI_ITEM_CODE").val());
        	    
        	    $("#STATUS").val($("#paraMapObj_WMI_STATUS").val());
        	    
        	});
        	
    </script>
    <script type="text/javascript">
        function editDatile(){
                      
                        
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
                         
                       
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=3452fff912504f6c8d426cd469fd87db";
  document.forms.editForm.submit();
}
    
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
