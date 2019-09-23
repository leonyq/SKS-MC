<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="放行" /></title>
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
			    	        <button type="button" onclick="releaseSave();"><i class="ico ico-save"></i><dict:lang value="放行" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<!--<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>-->
			    </div>

			</div>
			<div class="bd" style="    height: 272px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="776a9d93290b4cef813dc66f100cbe1e" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="776a9d93290b4cef813dc66f100cbe1e" />
	<input type="hidden" name="776a9d93290b4cef813dc66f100cbe1e" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden"  id="iframeId" name="iframeId" value="${iframeId}" />
		<s:set name="_$viewId" value="'ce42e53059f64a9a8361854cb9058a50'" />
		<s:set name="_$formId_1" value="'776a9d93290b4cef813dc66f100cbe1e'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self" colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-three" /><bu:uitn colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self" colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e"  colspan="7"><bu:ui colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
		
		    <td class="name-six" /><bu:uitn colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self" colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self" colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
		<td class="name-six" /><bu:uitn colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self" colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name-six" /><bu:uitn colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self" colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
		
		<td class="name-six" /><bu:uitn colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self" colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name-six" /><bu:uitn colNo="CTT_MAX_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self" colNo="CTT_MAX_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_MAX_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		
			<td class="name-six" /><bu:uitn colNo="CTT_PASS_MEMO" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec-self"  colNo="CTT_PASS_MEMO" formId="776a9d93290b4cef813dc66f100cbe1e" colspan="3"><bu:ui style="height:70px; width:615px"  colNo="CTT_PASS_MEMO" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
		
		
	</table>
			<bu:jsVal formId="776a9d93290b4cef813dc66f100cbe1e" formIndex="1" />		<div style="padding:1px;"></div>

	<!--	<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="FM-辅料履历信息表" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('62aabb92147842e1983bcfcda04f9a1d','2','','','');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('62aabb92147842e1983bcfcda04f9a1d','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			
			
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner62aabb92147842e1983bcfcda04f9a1d">
								<bu:addSub formid="776a9d93290b4cef813dc66f100cbe1e" formIndex="2"  selfformid="62aabb92147842e1983bcfcda04f9a1d" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'62aabb92147842e1983bcfcda04f9a1d')" >
							<table class="glxb-table" style="width:100%" id="addTable_62aabb92147842e1983bcfcda04f9a1d" >
								<tbody id="tbody_62aabb92147842e1983bcfcda04f9a1d" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
		 -->
<script>
function initEditDataLs(){
getEditRows("62aabb92147842e1983bcfcda04f9a1d","2","776a9d93290b4cef813dc66f100cbe1e","","0cd2859aea234203835da68e4b7c6cdb","");
$('table').find('tbody tr:eq(0)').click();
}

function releaseSave(){
    	$("#iframeId").val(window.name);
    document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=6f1019dda4fa4486b06dc1ce8cd9689f"; 

                          document.forms.editForm.submit();

                          
}
</script>

									
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
