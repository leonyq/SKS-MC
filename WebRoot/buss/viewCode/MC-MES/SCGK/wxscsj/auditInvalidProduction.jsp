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
	<title><dict:lang value="审核" /></title>
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
<body>
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
        					<!--<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>-->
			    </div>

			</div>
			<div class="bd" style="    height: 384px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6209be18186f43ba92fa495365a68c02" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6209be18186f43ba92fa495365a68c02" />
	<input type="hidden" name="6209be18186f43ba92fa495365a68c02" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a5231e6470284734a44776d32b4747e3'" />
		<s:set name="_$formId_1" value="'6209be18186f43ba92fa495365a68c02'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:85px;"/><span class="dot">*</span><bu:uitn colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>

		    <td class="name" style="width:110px;"/><bu:uitn colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1"  /></bu:td>
		
		</tr>
		<tr>		
            <td class="name" /><bu:uitn colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
					
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_BEGIN_TIME" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" onchange="getBegTime()"/></bu:td>
	
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_END_TIME" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" onchange="getBegTime()"/></bu:td>
	
	        <td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_STOP_TYPE" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
	        <td class="name" /><bu:uitn colNo="CSI_MAINTENANCE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_MAINTENANCE" style="height:80px;" colspan="3" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MAINTENANCE" disabled="disabled" style="width:100%;height:100%;" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CSI_MAINTENANCE_EMP" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_MAINTENANCE_EMP" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MAINTENANCE_EMP" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
	        <td class="name" /><bu:uitn colNo="CSI_MAINTENANCE_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_MAINTENANCE_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MAINTENANCE_TIME" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CSI_EXAMINE_RESULT" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_EXAMINE_RESULT" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_EXAMINE_RESULT"  formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
	        <td class="name" /><bu:uitn colNo="CSI_EXAMINE_REASON" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_EXAMINE_REASON" style="height:80px;" colspan="3" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_EXAMINE_REASON" style="width:100%;height:100%;" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="6209be18186f43ba92fa495365a68c02" formIndex="1" />
									
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
	<script type="text/javascript">
	$(function(){
	    $("#paraMapObj_CSI_MAINTENANCE").attr("disabled","disabled");
        $("#paraMapObj_CSI_MAINTENANCE").attr("class","_VAL_NULL isSubmit input readonly _VAL_DATABASE");
        $("#paraMapObj_CSI_MAINTENANCE_EMP_SHOW").attr("style","");
	})
	    var isQuery = false;
                    function edit(thisObj){				
                        
                            if(isQuery){util.alert("?数据正在提交，请稍候...");}
                            if(!val.valNullData()){
                                return ;
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
                            var id="${dataId}";
                            var result=$("#paraMapObj_CSI_EXAMINE_RESULT").val();
                            if(""==result){
                                utilsFp.confirmIcon(3,"","","", "审核结果未选择",0,"300","");
                            }else{
                                //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                                emptyValToHide();
                                document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=5e642736729c490b8dc603ce75e31fb7&id="+id;
                                document.forms.editForm.submit();
                                isQuery = true;
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
