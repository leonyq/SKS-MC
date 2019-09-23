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
		<dict:lang value="更新日志" />
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
		<bu:header formId ="4b8431cdb7f64a48bfc4cd96790b9cab"/>

    
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
		<bu:func viewId="2aea483db9714a0e91a74c36b373820c" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="2aea483db9714a0e91a74c36b373820c" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage4b8431cdb7f64a48bfc4cd96790b9cab" id="formPage4b8431cdb7f64a48bfc4cd96790b9cab" value="${formPage4b8431cdb7f64a48bfc4cd96790b9cab}"/>
		<input type="hidden" name="formId" id="formId1" value='4b8431cdb7f64a48bfc4cd96790b9cab'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4b8431cdb7f64a48bfc4cd96790b9cab">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4b8431cdb7f64a48bfc4cd96790b9cab" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4b8431cdb7f64a48bfc4cd96790b9cab">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4b8431cdb7f64a48bfc4cd96790b9cab">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4b8431cdb7f64a48bfc4cd96790b9cab" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4b8431cdb7f64a48bfc4cd96790b9cab" onclick="_selectAjaxTableAllData(this,'4b8431cdb7f64a48bfc4cd96790b9cab')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CUL_FILE" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CREATE_USER" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CREATE_TIME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4b8431cdb7f64a48bfc4cd96790b9cab" onscroll="ajaxTableScroll(this,'4b8431cdb7f64a48bfc4cd96790b9cab')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4b8431cdb7f64a48bfc4cd96790b9cab">
		<tbody id="tbody_4b8431cdb7f64a48bfc4cd96790b9cab" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4b8431cdb7f64a48bfc4cd96790b9cab==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4b8431cdb7f64a48bfc4cd96790b9cab&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="2aea483db9714a0e91a74c36b373820c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="2aea483db9714a0e91a74c36b373820c" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	//checkboxAll("joblist");
}
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='4b8431cdb7f64a48bfc4cd96790b9cab'){<%--FM-更新日志--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ")
            arrHtml.push("</td>");          
            arrHtml.push("<td colno='CUL_SN' class='datagrid-cell "+ms.tdClass(formId, 'CUL_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'CUL_SN')+"' "+ms.tdEvent(formId, 'CUL_SN')+">")
            arrHtml.push("<span colno='CUL_SN' class='"+ms.uiClass(formId, 'CUL_SN')+"' style='"+ms.uiStyle(formId, 'CUL_SN')+"' "+ms.uiEvent(formId, 'CUL_SN')+" title='"+ms.titleAttr(formId,'CUL_SN','IS_TITLE_ATTR',v)+"' >"+v['CUL_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUL_RANK' class='datagrid-cell "+ms.tdClass(formId, 'CUL_RANK')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CUL_RANK')+"' "+ms.tdEvent(formId, 'CUL_RANK')+">")
            arrHtml.push("<span colno='CUL_RANK' class='"+ms.uiClass(formId, 'CUL_RANK')+"' style='"+ms.uiStyle(formId, 'CUL_RANK')+"' "+ms.uiEvent(formId, 'CUL_RANK')+" title='"+ms.titleAttr(formId,'CUL_RANK','IS_TITLE_ATTR',v)+"' >"+v['CUL_RANK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUL_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'CUL_MODEL')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CUL_MODEL')+"' "+ms.tdEvent(formId, 'CUL_MODEL')+">")
            arrHtml.push("<span colno='CUL_MODEL' class='"+ms.uiClass(formId, 'CUL_MODEL')+"' style='"+ms.uiStyle(formId, 'CUL_MODEL')+"' "+ms.uiEvent(formId, 'CUL_MODEL')+" title='"+ms.titleAttr(formId,'CUL_MODEL','IS_TITLE_ATTR',v)+"' >"+v['CUL_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CUL_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CUL_NAME')+"' "+ms.tdEvent(formId, 'CUL_NAME')+">")
            arrHtml.push("<span colno='CUL_NAME' class='"+ms.uiClass(formId, 'CUL_NAME')+"' style='"+ms.uiStyle(formId, 'CUL_NAME')+"' "+ms.uiEvent(formId, 'CUL_NAME')+" title='"+ms.titleAttr(formId,'CUL_NAME','IS_TITLE_ATTR',v)+"' >"+v['CUL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUL_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'CUL_CONTENT')+"' style='width:150px;"+ms.tdStyle(formId, 'CUL_CONTENT')+"' "+ms.tdEvent(formId, 'CUL_CONTENT')+">")
            arrHtml.push("<span colno='CUL_CONTENT' class='"+ms.uiClass(formId, 'CUL_CONTENT')+"' style='height:30px;"+ms.uiStyle(formId, 'CUL_CONTENT')+"' "+ms.uiEvent(formId, 'CUL_CONTENT')+" title='"+ms.titleAttr(formId,'CUL_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['CUL_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUL_FILE' class='datagrid-cell "+ms.tdClass(formId, 'CUL_FILE')+"' style='width:150px;"+ms.tdStyle(formId, 'CUL_FILE')+"' "+ms.tdEvent(formId, 'CUL_FILE')+">")
            arrHtml.push("<span colno='CUL_FILE' class='"+ms.uiClass(formId, 'CUL_FILE')+"' style='"+ms.uiStyle(formId, 'CUL_FILE')+"' "+ms.uiEvent(formId, 'CUL_FILE')+" title='"+ms.titleAttr(formId,'CUL_FILE','IS_TITLE_ATTR',v)+"' >"+v['CUL_FILE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
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
    setScroll();
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
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
