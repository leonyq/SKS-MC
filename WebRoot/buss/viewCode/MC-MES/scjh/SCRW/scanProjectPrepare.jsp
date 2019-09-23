<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VOID-扫描备料" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="cfbe3bf0d5aa41398415daf4b28f48c9"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
  	
  	<div class="edit">
    <form id="addForm" name="addForm" action="${path}buss/bussModel.ms?" method="post"
            <bu:formet exeid="%{exeid}"/> target="submitFrame">
        <div class="hd">
            <div style="margin-left:10px;">
                <div class="save-close" style="display:none;"
                        <dict:lang value="关闭保存并关闭窗口"/> onclick="saveClose(this)"></div>
                <input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                    <span class="dot">*</span>
                    <dict:lang value="组织机构"/> <s:if test="${fn:length(deptLs)==1}">
                    <s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:if> <s:else>
                    <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:else> </s:if>
            </div>

            <div style="margin-left:10px;">
                <div class="save-close" onclick="switchInput(this)"></div>
                <input type="checkbox" checked id="inputType" name="inputType" value="0" style="display: none;"/>
            </div>

            <div class="optn">
                <button type="button" onclick="userSave();"><i class="ico ico-save"></i><dict:lang value="建立关联"/></button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                </button>
            </div>

    </div>
  
  
  
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="81a993856fad461ebc59f1f105ab0108" />
            </div>
            <div class="bd">
              	
              	<tr>
                    <td class="name"/>
                    <span class="dot">*</span>
                    工单号</td>
                    <bu:td cssClass="dec" colNo="CFO_FIX_SN_S" formId="7be0e5e80b8f4977ba730bfdc6e382ae" colspan="6">
                        <input type="text" id="CFO_FIX_SN_S" name="CFO_FIX_SN_S" autocomplete="off" value="" class="input isSubmit " style="width:300px;" save_mark="0" onkeypress="addSplit(event);"onkeydown="addSplit();"> </bu:td>
                </tr>
      
              	<DIV style="margin-bottom: 11px;">
                    <UL class="tab-list tab">
                        <LI id="tag1">
                            <A class="selectli1" href="javascript:void(0);">
                                <SPAN><dict:lang value="工单信息"/></SPAN>
                            </A>
                        </LI>                   
                    </UL>
                </DIV>
          
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
<!--
  <table class="search_table">
      <bu:search deal_mark="1" viewId="81a993856fad461ebc59f1f105ab0108" /> 

  </table>-->

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagecfbe3bf0d5aa41398415daf4b28f48c9" id="formPagecfbe3bf0d5aa41398415daf4b28f48c9" value="${formPagecfbe3bf0d5aa41398415daf4b28f48c9}"/>
		<input type="hidden" name="formId" id="formId1" value='cfbe3bf0d5aa41398415daf4b28f48c9'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="cfbe3bf0d5aa41398415daf4b28f48c9">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxcfbe3bf0d5aa41398415daf4b28f48c9" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innercfbe3bf0d5aa41398415daf4b28f48c9">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablecfbe3bf0d5aa41398415daf4b28f48c9">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="cfbe3bf0d5aa41398415daf4b28f48c9" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_cfbe3bf0d5aa41398415daf4b28f48c9" onclick="_selectAjaxTableAllData(this,'cfbe3bf0d5aa41398415daf4b28f48c9')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_PROJECT_ID" class="datagrid-cell"style="width:100px;"><bu:uitn colNo="PROJECT_ID" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>
			<td name="noprintset_PRODUCT_NAME" class="datagrid-cell" style="width:100px;"><bu:uitn colNo="PRODUCT_NAME" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>
          	<td name="noprintset_PRODUCT_MATERIAL" class="datagrid-cell" style="width:100px;"><bu:uitn colNo="PRODUCT_MATERIAL" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>
			<td name="noprintset_PRODUCT_COUNT" class="datagrid-cell" style="width:100px;"><bu:uitn colNo="PRODUCT_COUNT" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>
			<td name="noprintset_CREATE_TIME" class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CREATE_TIME" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>
		
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivcfbe3bf0d5aa41398415daf4b28f48c9" onscroll="ajaxTableScroll(this,'cfbe3bf0d5aa41398415daf4b28f48c9')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxcfbe3bf0d5aa41398415daf4b28f48c9">
		<tbody id="tbody_cfbe3bf0d5aa41398415daf4b28f48c9" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagecfbe3bf0d5aa41398415daf4b28f48c9==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=cfbe3bf0d5aa41398415daf4b28f48c9&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('cfbe3bf0d5aa41398415daf4b28f48c9','1');">打印</button>
 </div>
 </div>
 <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">

 </div>
 </div>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="81a993856fad461ebc59f1f105ab0108" />
  <!--
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="81a993856fad461ebc59f1f105ab0108" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>-->
    
<script type="text/javascript">
	function switchInput(self) {
        if (manual == true) {
            $(self).addClass('save-not-close');
            $(self).attr("title", "<dict:lang value="当前:扫描输入"/>");
            manual = false;
            $('#inputType').attr('checked', false);
        }
        else if (manual == false) {
            $(self).removeClass('save-not-close');
            $(self).attr("title", "<dict:lang value="当前:手动输入"/>");
            manual = true;
            $('#inputType').attr('checked', true);
        }
    }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
