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
			    	        <button type="button" onclick="editInfo(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 184px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6c618bbd5f12409f8ebf3e8ffee81395" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6c618bbd5f12409f8ebf3e8ffee81395" />
	<input type="hidden" name="6c618bbd5f12409f8ebf3e8ffee81395" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d26525af02b343b3947ebd8c661cc94a'" />
		<s:set name="_$formId_1" value="'6c618bbd5f12409f8ebf3e8ffee81395'" />
		<s:set name="_$type" value="'edit'"/>
	<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QII_ITEM_CODE" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<bu:td cssClass="dec" colNo="QII_ITEM_CODE" formId="6c618bbd5f12409f8ebf3e8ffee81395" ><bu:ui colNo="QII_ITEM_CODE" formId="6c618bbd5f12409f8ebf3e8ffee81395" dataId="%{dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="QII_ITEM_NAME" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<bu:td cssClass="dec" colNo="QII_ITEM_NAME" formId="6c618bbd5f12409f8ebf3e8ffee81395" style="width:230px;" ><bu:ui colNo="QII_ITEM_NAME" formId="6c618bbd5f12409f8ebf3e8ffee81395" dataId="%{dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="QII_EFFECTIVE_FLAG" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<bu:td cssClass="dec" colNo="QII_EFFECTIVE_FLAG" formId="6c618bbd5f12409f8ebf3e8ffee81395" ><bu:ui colNo="QII_EFFECTIVE_FLAG" formId="6c618bbd5f12409f8ebf3e8ffee81395" dataId="%{dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QII_ITEM_TYPE" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<bu:td cssClass="dec" colNo="QII_ITEM_TYPE" formId="6c618bbd5f12409f8ebf3e8ffee81395" ><bu:ui colNo="QII_ITEM_TYPE" formId="6c618bbd5f12409f8ebf3e8ffee81395" dataId="%{dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
            <td class="name" /><bu:uitn colNo="QII_TEST_CONTENT" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<bu:td cssClass="dec" colNo="QII_TEST_CONTENT" formId="6c618bbd5f12409f8ebf3e8ffee81395" style="height:80px;" colspan="3" ><bu:ui colNo="QII_TEST_CONTENT"  formId="6c618bbd5f12409f8ebf3e8ffee81395" dataId="%{dataId}" formIndex="1" style="height:100%;width:100%;"  /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="6c618bbd5f12409f8ebf3e8ffee81395" formIndex="1" />
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    
	
		

	<!-- js初始化方法 -->
	 <script type="text/javascript">
                     var parentWindow;
                        $(function(){
                             parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
                        });
                    var isQuery = false;
                    function editInfo(thisObj){
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
                        emptyValToHide('N');
                        document.forms.editForm.submit();
                        isQuery = true;
                    }
                    
                    function alertInfo(msg){
                        isQuery = false;
                        utilsFp.confirmIcon(3,"","","", msg,"","350","");
                    }
                    
                    function reloadPg(msg,title,width,height,time){
                        isQuery = false;
                        parentWindow.reloadPg(msg,title,width,height,time);
                    }
            
                    //重置    
                    function resetForm(){
                        $("#editForm")[0].reset();
                        $(".dept_select").trigger("chosen:updated");
                    }
                            
                    
                    
                    function init(){
                        if($("#leftTable-kz").length>0){
                            $("#leftTable-kz").show();
                        }
                        
                        if($("#leftTable").length>0){
                            $("#leftTable").show();
                        }
                        if($("input[type='hidden'][name='formIds']").length>1){
                            initEditDataLs();
                        }
                        /*
                        var formIds = $("input[type='hidden'][name='formIds']").val();
                        var formIdLs = formIds.split(",");
                        for(var i=0,j=formIdLs.length;i<j;i++){
                            getEditRows(formIdLs[i],"0");
                        }
                        */
                    }
                    
            
                
             </script>


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
