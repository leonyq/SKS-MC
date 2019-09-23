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


<script>
	function editInfo(){
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
		    if($("#paraMap1_WML_COLOR_SN").val()==""){
				_alertValMsg($("#paraMap1_WML_COLOR_SN"), "<dict:lang value="该项不能为空" />");
				return;
			}
			
            document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=84b5d02455a84f9ab0f92168e764f392";
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
        					
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="e5b14e462ec74fa49c5694fe412b4071" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="e5b14e462ec74fa49c5694fe412b4071" />
	<input type="hidden" id="prefixInd" name="e5b14e462ec74fa49c5694fe412b4071" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e59a6d9981dc4a61ba5bbe975d7b5d4a'" />
		<s:set name="_$formId_1" value="'e5b14e462ec74fa49c5694fe412b4071'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WML_COLOR_SN" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<bu:td cssClass="dec" colNo="WML_COLOR_SN" formId="e5b14e462ec74fa49c5694fe412b4071" ><bu:ui colNo="WML_COLOR_SN" formId="e5b14e462ec74fa49c5694fe412b4071" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WML_COLOR" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<bu:td cssClass="dec" colNo="WML_COLOR" formId="e5b14e462ec74fa49c5694fe412b4071" ><bu:ui colNo="WML_COLOR" formId="e5b14e462ec74fa49c5694fe412b4071" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WML_DISABLE_FLAG" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<bu:td cssClass="dec" colNo="WML_DISABLE_FLAG" formId="e5b14e462ec74fa49c5694fe412b4071" ><bu:ui colNo="WML_DISABLE_FLAG" formId="e5b14e462ec74fa49c5694fe412b4071" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<tr>
			<td class="name" /><bu:uitn colNo="WML_MEMO" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<bu:td cssClass="dec" colNo="WML_MEMO" style="height:80px;" formId="e5b14e462ec74fa49c5694fe412b4071" ><bu:ui colNo="WML_MEMO" style="height:100%;" formId="e5b14e462ec74fa49c5694fe412b4071" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="e5b14e462ec74fa49c5694fe412b4071" formIndex="1" />
									
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
