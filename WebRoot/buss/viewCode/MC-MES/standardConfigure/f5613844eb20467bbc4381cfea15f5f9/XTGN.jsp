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
		<dict:lang value="系统功能" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="6cb6d4e03c0b41b1b14a5657b33604c9"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="97fc6a2a9b084def89e728fd212e62e7" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="97fc6a2a9b084def89e728fd212e62e7" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6cb6d4e03c0b41b1b14a5657b33604c9" id="formPage6cb6d4e03c0b41b1b14a5657b33604c9" value="${formPage6cb6d4e03c0b41b1b14a5657b33604c9}"/>
		<input type="hidden" name="formId" id="formId1" value='6cb6d4e03c0b41b1b14a5657b33604c9'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6cb6d4e03c0b41b1b14a5657b33604c9">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6cb6d4e03c0b41b1b14a5657b33604c9" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6cb6d4e03c0b41b1b14a5657b33604c9">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6cb6d4e03c0b41b1b14a5657b33604c9">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6cb6d4e03c0b41b1b14a5657b33604c9" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6cb6d4e03c0b41b1b14a5657b33604c9" onclick="_selectAjaxTableAllData(this,'6cb6d4e03c0b41b1b14a5657b33604c9')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_FUNC_MODEL" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_PHOTO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_PATH" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6cb6d4e03c0b41b1b14a5657b33604c9" onscroll="ajaxTableScroll(this,'6cb6d4e03c0b41b1b14a5657b33604c9')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6cb6d4e03c0b41b1b14a5657b33604c9">
		<tbody id="tbody_6cb6d4e03c0b41b1b14a5657b33604c9" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6cb6d4e03c0b41b1b14a5657b33604c9==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6cb6d4e03c0b41b1b14a5657b33604c9&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="97fc6a2a9b084def89e728fd212e62e7" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="97fc6a2a9b084def89e728fd212e62e7" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='6cb6d4e03c0b41b1b14a5657b33604c9'){<%--FM-系统功能信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_FUNC_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FUNC_MODEL')+"' style='"+ms.tdStyle(formId, 'CFI_FUNC_MODEL')+"' "+ms.tdEvent(formId, 'CFI_FUNC_MODEL')+">")
            arrHtml.push("<span colno='CFI_FUNC_MODEL' class='"+ms.uiClass(formId, 'CFI_FUNC_MODEL')+"' style='"+ms.uiStyle(formId, 'CFI_FUNC_MODEL')+"' "+ms.uiEvent(formId, 'CFI_FUNC_MODEL')+" title='"+ms.titleAttr(formId,'CFI_FUNC_MODEL','IS_TITLE_ATTR',v)+"' >"+v['CFI_FUNC_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_FUNC_SN' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FUNC_SN')+"' style='"+ms.tdStyle(formId, 'CFI_FUNC_SN')+"' "+ms.tdEvent(formId, 'CFI_FUNC_SN')+">")
            arrHtml.push("<span colno='CFI_FUNC_SN' class='"+ms.uiClass(formId, 'CFI_FUNC_SN')+"' style='"+ms.uiStyle(formId, 'CFI_FUNC_SN')+"' "+ms.uiEvent(formId, 'CFI_FUNC_SN')+" title='"+ms.titleAttr(formId,'CFI_FUNC_SN','IS_TITLE_ATTR',v)+"' >"+v['CFI_FUNC_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_FUNC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FUNC_NAME')+"' style='"+ms.tdStyle(formId, 'CFI_FUNC_NAME')+"' "+ms.tdEvent(formId, 'CFI_FUNC_NAME')+">")
            arrHtml.push("<span colno='CFI_FUNC_NAME' class='"+ms.uiClass(formId, 'CFI_FUNC_NAME')+"' style='"+ms.uiStyle(formId, 'CFI_FUNC_NAME')+"' "+ms.uiEvent(formId, 'CFI_FUNC_NAME')+" title='"+ms.titleAttr(formId,'CFI_FUNC_NAME','IS_TITLE_ATTR',v)+"' >"+v['CFI_FUNC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_PHOTO' class='datagrid-cell "+ms.tdClass(formId, 'CFI_PHOTO')+"' style='"+ms.tdStyle(formId, 'CFI_PHOTO')+"' "+ms.tdEvent(formId, 'CFI_PHOTO')+">")
            arrHtml.push("<span colno='CFI_PHOTO' class='"+ms.uiClass(formId, 'CFI_PHOTO')+"' style='"+ms.uiStyle(formId, 'CFI_PHOTO')+"' "+ms.uiEvent(formId, 'CFI_PHOTO')+" title='"+ms.titleAttr(formId,'CFI_PHOTO','IS_TITLE_ATTR',v)+"' >"+v['CFI_PHOTO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_PATH' class='datagrid-cell "+ms.tdClass(formId, 'CFI_PATH')+"' style='"+ms.tdStyle(formId, 'CFI_PATH')+"' "+ms.tdEvent(formId, 'CFI_PATH')+">")
            arrHtml.push("<span colno='CFI_PATH' class='"+ms.uiClass(formId, 'CFI_PATH')+"' style='"+ms.uiStyle(formId, 'CFI_PATH')+"' "+ms.uiEvent(formId, 'CFI_PATH')+" title='"+ms.titleAttr(formId,'CFI_PATH','IS_TITLE_ATTR',v)+"' >"+v['CFI_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_FUNC_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FUNC_MEMO')+"' style='"+ms.tdStyle(formId, 'CFI_FUNC_MEMO')+"' "+ms.tdEvent(formId, 'CFI_FUNC_MEMO')+">")
            arrHtml.push("<span colno='CFI_FUNC_MEMO' class='"+ms.uiClass(formId, 'CFI_FUNC_MEMO')+"' style='"+ms.uiStyle(formId, 'CFI_FUNC_MEMO')+"' "+ms.uiEvent(formId, 'CFI_FUNC_MEMO')+" title='"+ms.titleAttr(formId,'CFI_FUNC_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CFI_FUNC_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll(formId);
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
