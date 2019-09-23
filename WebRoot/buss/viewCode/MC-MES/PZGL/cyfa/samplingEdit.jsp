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
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
            
                <div style="margin-left:20px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 140px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	        <button type="button" onclick="edit1(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:283px">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="eec4f10d65b0411eb66da26fd2b55837" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="eec4f10d65b0411eb66da26fd2b55837" />
	<input type="hidden" name="eec4f10d65b0411eb66da26fd2b55837" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0cb2052bdab04ee7a063651da40da318'" />
		<s:set name="_$formId_1" value="'eec4f10d65b0411eb66da26fd2b55837'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-three" style="width:95px;"/><span class="dot">*</span><bu:uitn colNo="QSP_TEST_STEP" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<bu:td cssClass="dec-self" colNo="QSP_TEST_STEP" formId="eec4f10d65b0411eb66da26fd2b55837" ><bu:ui colNo="QSP_TEST_STEP" style="width:300px;" formId="eec4f10d65b0411eb66da26fd2b55837" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="QSP_PLAN_TYPE" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<bu:td cssClass="dec-self" colNo="QSP_PLAN_TYPE" formId="eec4f10d65b0411eb66da26fd2b55837" ><bu:ui colNo="QSP_PLAN_TYPE" style="width:300px;" formId="eec4f10d65b0411eb66da26fd2b55837" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="QSP_PLAN_NAME" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<bu:td cssClass="dec-self" colNo="QSP_PLAN_NAME" formId="eec4f10d65b0411eb66da26fd2b55837" ><bu:ui colNo="QSP_PLAN_NAME" style="width:300px;" formId="eec4f10d65b0411eb66da26fd2b55837" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="QSP_DEFAULT_FLAG" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<bu:td cssClass="dec-self" colNo="QSP_DEFAULT_FLAG" formId="eec4f10d65b0411eb66da26fd2b55837" ><bu:ui colNo="QSP_DEFAULT_FLAG" formId="eec4f10d65b0411eb66da26fd2b55837" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="QSP_MEMO" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<bu:td cssClass="dec-self" colNo="QSP_MEMO" formId="eec4f10d65b0411eb66da26fd2b55837" ><bu:ui colNo="QSP_MEMO" rows="3" style="width:300px;" formId="eec4f10d65b0411eb66da26fd2b55837" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="eec4f10d65b0411eb66da26fd2b55837" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    <script type="text/javascript">
        var isQuery = false;
                    function edit1(thisObj){
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
                        //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                        emptyValToHide("N");
                        document.forms.editForm.submit();
                        isQuery = true;
                    }

    </script>
	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
