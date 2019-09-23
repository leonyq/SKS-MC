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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:410px;" >
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c1036359818b474286d53dc1952f10c2" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c1036359818b474286d53dc1952f10c2" />
	<input type="hidden" name="c1036359818b474286d53dc1952f10c2" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'be55eaf099ad4787bee83d74a1121a15'" />
		<s:set name="_$formId_1" value="'c1036359818b474286d53dc1952f10c2'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name"  style="width:63px"/><span class="dot">*</span><bu:uitn colNo="IB_ITEM_SN" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" ><bu:ui colNo="IB_ITEM_SN" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" /></td>
			
			<td class="name" style="width:70px"/><span class="dot">*</span><bu:uitn colNo="IB_WORKSTATION_SN" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec"><bu:ui colNo="IB_WORKSTATION_SN" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" /></td>
			
			<td class="name" style="width:70px"/><span class="dot">*</span><bu:uitn colNo="IB_MO_NUMBER" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec"><bu:ui colNo="IB_MO_NUMBER" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="IB_NUM" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" ><bu:ui colNo="IB_NUM" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<bu:td cssClass="dec" colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" colspan="5" style="height:200px;"><bu:ui style="width:100%;" colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="IB_REMARK" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" colspan="5" ><bu:ui colNo="IB_REMARK" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" style="width:100%;height:80px;"/></td>
			
		</tr>
	</table>
			<bu:jsVal formId="c1036359818b474286d53dc1952f10c2" formIndex="1" />
									
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
