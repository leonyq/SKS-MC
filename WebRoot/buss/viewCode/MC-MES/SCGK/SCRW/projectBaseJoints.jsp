<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="关结" /></title>
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
    
    <script>
       function closeDoc(){
           document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=17876a2b5ce44e64abc8e24d63410978";
           document.forms.editForm.submit();
       }
    </script>
</head>
<body>
	<div class="edit">
	    	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
	    	<bu:formet exeid="%{exeid}" />>	
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
			    	       <!-- <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>-->
			    	        <button type="button" onclick="closeDoc();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i>取消</button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 250px;">
				
							
						   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="d34c8f48bead40d88c24a153c731de82" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d34c8f48bead40d88c24a153c731de82" />
	<input type="hidden" name="d34c8f48bead40d88c24a153c731de82" value="paraMap1@" />
	<input type="hidden" name="paraMapObj.PROJECT_STATUS" value="2" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'30a82dc01ec04a68adbeced50315cec0'" />
		<s:set name="_$formId_1" value="'d34c8f48bead40d88c24a153c731de82'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td/><bu:uitn colNo="PM_CLOSE_REASON" formId="d34c8f48bead40d88c24a153c731de82" />：</td>
		
			<bu:td cssClass="dec" colNo="PM_CLOSE_REASON" formId="d34c8f48bead40d88c24a153c731de82"  colspan="3"><bu:ui colNo="PM_CLOSE_REASON" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" style="margin: 0px; width: 530px; height: 142px;" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="d34c8f48bead40d88c24a153c731de82" formIndex="1" />		<div style="padding:1px;"></div>



									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>


	
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
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>