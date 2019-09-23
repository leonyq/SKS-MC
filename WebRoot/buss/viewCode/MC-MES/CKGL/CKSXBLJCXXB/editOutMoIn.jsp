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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:390px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="dc22be86e17d468fa1b1daffaab81702" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="dc22be86e17d468fa1b1daffaab81702" />
	<input type="hidden" name="dc22be86e17d468fa1b1daffaab81702" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d136a902eed34c48b3896bec17c26459'" />
		<s:set name="_$formId_1" value="'dc22be86e17d468fa1b1daffaab81702'" />
		<s:set name="_$type" value="'edit'"/>
		
		<tr>
			<td class="name" style="width:90px;"/><bu:uitn colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		    			
            <td class="name" style="width:90px;"/><bu:uitn colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
			
		    	<td class="name" style="width:90px;"/><bu:uitn colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
			
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
	
	        <td class="name" /><bu:uitn colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
	
			<td class="name" /><bu:uitn colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>	
            
			<td class="name" style="width:90px;"/><bu:uitn colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self"  style="width:200px;" colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" colspan="7"><bu:ui colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="height:80px;width:97.5%;"/></bu:td>
		
		</tr>
		
		
		
	</table>
			<bu:jsVal formId="dc22be86e17d468fa1b1daffaab81702" formIndex="1" />
									
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
	    	    $("#paraMapObj_WOM_MODEL_CODE_SHOW").attr("disabled",true);
	    	    $("#paraMapObj_WOM_MO_NUMBER_SHOW").attr("disabled",true);
	    	    
	    	})
	    	var isQuery = false;
                    function edit(thisObj){
                       // if($("#paraMapObj_WOM_STATUS").val()=="3"){
                       //     utilsFp.confirmIcon(1,"","","", "记录已关结",0,"300","");
                      //  }else{
                    
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
                        emptyValToHide();
                        document.forms.editForm.submit();
                        isQuery = true;
                     //   }
                    }
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
