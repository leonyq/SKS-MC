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
    <style>
    .basic-table input{
        width:180px !important;
    }
    
   
  
   a{
      
        display:block;
    }
    
    </style>
    	<script>
    	    	var fileMap = new Map();
    	</script>
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
			    	        <button type="button" onclick="edit1();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="heoght:470px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ec819630ac4041b1ace478a3c5163782" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ec819630ac4041b1ace478a3c5163782" />
	<input type="hidden" name="ec819630ac4041b1ace478a3c5163782" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b43c887937674912a3ea4592aac170ef'" />
		<s:set name="_$formId_1" value="'ec819630ac4041b1ace478a3c5163782'" />
		<s:set name="_$type" value="'edit'"/>
		<!--	<td class="name-six" /><bu:uitn colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-three" /><bu:uitn colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782"  colspan="3"><bu:ui colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
		<tr>
			<td class="name-six" style="width:180px;" /><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" dataId="%{dataId}" formIndex="1" style="width:180px;"/></bu:td>

			<td class="name-six" /><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" dataId="%{dataId}" formIndex="1"  style="width:180px;"/></bu:td>
	&nbsp;&nbsp;&nbsp;&nbsp;
		<td class="name-six" text-align="left" style="width:100px;"/><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" dataId="%{dataId}" formIndex="1" style="width:180px;"/></bu:td>

	</tr>
		<tr>
			
			<td class="name-six" /><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="%{dataId}" formIndex="1" style="width:180px;" /></bu:td>
	
			<td class="name-six" /><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782"  dataId="%{dataId}" formIndex="1" style="width:180px;"/></bu:td>
		&nbsp;&nbsp;&nbsp;&nbsp;
		
	        <td class="name-six" text-align="left" /><bu:uitn colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td id="file1"  cssClass="dec-self" colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="FILE_NAME"  formId="ec819630ac4041b1ace478a3c5163782" dataId="%{dataId}" formIndex="1" 	style="width:180px;" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" colspan="5"  style="height:250px;" ><bu:ui  style="width:800px;height:250px;" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782"  dataId="%{dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
	</tr>
		
		
		
		<!--
		<tr>
			<td class="name-six" /><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="P#PMO_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PMO_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PMO_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="P#PMO_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PMO_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PMO_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="P#PMO_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PMO_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PMO_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-three" /><bu:uitn colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782"  colspan="3"><bu:ui colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
	</table>
			<bu:jsVal formId="ec819630ac4041b1ace478a3c5163782" formIndex="1" />
									
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
	
	
	<script>
	
	function edit1(){
	                    //alert("0");
                        if(isQuery){util.alert("?数据正在提交，请稍候...");}
                        if(!val.valNullData()){
                            return ;
                        }
                        if(!val.valDataBaseSetData()){
                            return ;
                        }
                        if(!valData()){
                            alert("3");
                            return ;
                        }
                        if(!val.valOjbsData()){
                            alert("4");
                            return ;
                        }
                        
                        var date1=$("#paraMapObj_BEGIN_TIME").val();
                        var date2=$("#paraMapObj_END_TIME").val();
                        if(date1>date2){
			    utilsFp.confirmIcon(1,"","","", "开始时间大于结束时间","","360","145");
			    return;

			}
                        //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                        emptyValToHide();
                        document.forms.editForm.submit();
                        isQuery = true;
                    }

	
	</script>
	

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
