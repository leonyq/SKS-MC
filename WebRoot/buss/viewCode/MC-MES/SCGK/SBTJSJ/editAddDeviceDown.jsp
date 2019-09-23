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
			    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="    height: 434px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c5b9c9cc6c8445029a1854920fc91303" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c5b9c9cc6c8445029a1854920fc91303" />
	<input type="hidden" name="c5b9c9cc6c8445029a1854920fc91303" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0983fc96d1324a0a9a26f01f333f161a'" />
		<s:set name="_$formId_1" value="'c5b9c9cc6c8445029a1854920fc91303'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="dot">*</span>
			<bu:uitn colNo="CDD_DEVICE_SN" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_DEVICE_SN" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_DEVICE_SN" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CD_DEVICE_NAME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="T2#VALUE" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="T2#VALUE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="T2#VALUE" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span>
			<bu:uitn colNo="CDD_STOP_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_STOP_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_STOP_TYPE" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CDD_START_TIME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_START_TIME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CDD_END_TIME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CDD_DEVICE_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_END_TIME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span>
			<bu:uitn colNo="CDD_STOP_REASON" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_STOP_REASON" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_STOP_REASON" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_TEMPORARY_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_TEMPORARY_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_TEMPORARY_METHOD" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_LONGTERM_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_LONGTERM_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_LONGTERM_METHOD" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_MEMO" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_MEMO" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_MEMO" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		
	</table>
			<bu:jsVal formId="c5b9c9cc6c8445029a1854920fc91303" formIndex="1" />
									
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
             if($("#paraMapObj_CDD_END_TIME").val() == null || $("#paraMapObj_CDD_END_TIME").val() ==""){
                 var nowTimeStr=timeEndString();
                 $("#paraMapObj_CDD_END_TIME").val(nowTimeStr);
             }
        });
        function timeEndString(){
			var datetime = new Date();
			
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
			
			var hour=datetime.getHours() + 1 < 10 ? "0" + (datetime.getHours() + 1) : datetime.getHours() + 1;
            var minute=datetime.getMinutes() + 1 < 10 ? "0" + (datetime.getMinutes() + 1) : datetime.getMinutes() + 1;
            var second=datetime.getSeconds() + 1 < 10 ? "0" + (datetime.getSeconds() + 1) : datetime.getSeconds() + 1;
			
			return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
		}
		
	     function editInfo(){
                       
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
                return ;
            }
            
            if($("#deptLs_data_auth").val() == null || $("#deptLs_data_auth").val() ==""){
               	_alertValMsg($('#deptLs_data_auth_chosen'), "<dict:lang value="该项不能为空" />");
                 return ;
            } 
            if($("#paraMapObj_CDD_DEVICE_SN").val() == null || $("#paraMapObj_CDD_DEVICE_SN").val() ==""){
               	_alertValMsg($('#paraMapObj_CDD_DEVICE_SN_SHOW'), "<dict:lang value="该项不能为空" />");
                 return ;
            }  
            if($("#paraMapObj_CDD_STOP_TYPE").val() == null || $("#paraMapObj_CDD_STOP_TYPE").val() ==""){
               	_alertValMsg($('#paraMapObj_CDD_STOP_TYPE_chosen'), "<dict:lang value="该项不能为空" />");
                 return ;
            }   
            if($("#paraMapObj_CDD_STOP_REASON").val() == null || $("#paraMapObj_CDD_STOP_REASON").val() ==""){
               	_alertValMsg($('#paraMapObj_CDD_STOP_REASON'), "<dict:lang value="该项不能为空" />");
                 return ;
            }   
            
				
            document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e7701010d3fa477aa9e29a6e72494cfb";
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
