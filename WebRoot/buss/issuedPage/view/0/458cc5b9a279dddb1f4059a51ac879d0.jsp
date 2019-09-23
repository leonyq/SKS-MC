<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="测试列表外键报错" />
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
		<bu:header formId ="1fc2ddc8ba7b4dfd8344b7de335ed645"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="9b7100eeb6274b2f8b7a66042036b222" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="9b7100eeb6274b2f8b7a66042036b222" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage1fc2ddc8ba7b4dfd8344b7de335ed645" id="formPage1fc2ddc8ba7b4dfd8344b7de335ed645" value="${formPage1fc2ddc8ba7b4dfd8344b7de335ed645}"/>
		<input type="hidden" name="formId" id="formId1" value='1fc2ddc8ba7b4dfd8344b7de335ed645'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="1fc2ddc8ba7b4dfd8344b7de335ed645">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1fc2ddc8ba7b4dfd8344b7de335ed645" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner1fc2ddc8ba7b4dfd8344b7de335ed645">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1fc2ddc8ba7b4dfd8344b7de335ed645">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="1fc2ddc8ba7b4dfd8344b7de335ed645" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_1fc2ddc8ba7b4dfd8344b7de335ed645" onclick="_selectAjaxTableAllData(this,'1fc2ddc8ba7b4dfd8344b7de335ed645')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="1fc2ddc8ba7b4dfd8344b7de335ed645" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST2" formId="1fc2ddc8ba7b4dfd8344b7de335ed645" /></td>
			
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="1fc2ddc8ba7b4dfd8344b7de335ed645" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_USER" formId="1fc2ddc8ba7b4dfd8344b7de335ed645" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDIT_TIME" formId="1fc2ddc8ba7b4dfd8344b7de335ed645" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDIT_USER" formId="1fc2ddc8ba7b4dfd8344b7de335ed645" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv1fc2ddc8ba7b4dfd8344b7de335ed645" onscroll="ajaxTableScroll(this,'1fc2ddc8ba7b4dfd8344b7de335ed645')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax1fc2ddc8ba7b4dfd8344b7de335ed645">
		<tbody id="tbody_1fc2ddc8ba7b4dfd8344b7de335ed645" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage1fc2ddc8ba7b4dfd8344b7de335ed645==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=1fc2ddc8ba7b4dfd8344b7de335ed645&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="9b7100eeb6274b2f8b7a66042036b222" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="9b7100eeb6274b2f8b7a66042036b222" />
    
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
    if(formId=='1fc2ddc8ba7b4dfd8344b7de335ed645'){<%--测试列表外键--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST1' class='datagrid-cell "+ms.tdClass(formId, 'TEST1')+"' style='"+ms.tdStyle(formId, 'TEST1')+"' "+ms.tdEvent(formId, 'TEST1')+">")
            arrHtml.push("<span colno='TEST1' class='"+ms.uiClass(formId, 'TEST1')+"' style='"+ms.uiStyle(formId, 'TEST1')+"' "+ms.uiEvent(formId, 'TEST1')+" title='"+ms.titleAttr(formId,'TEST1','IS_TITLE_ATTR',v)+"' >"+v['TEST1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST2' class='datagrid-cell "+ms.tdClass(formId, 'TEST2')+"' style='"+ms.tdStyle(formId, 'TEST2')+"' "+ms.tdEvent(formId, 'TEST2')+">")
            arrHtml.push("<span colno='TEST2' class='"+ms.uiClass(formId, 'TEST2')+"' style='"+ms.uiStyle(formId, 'TEST2')+"' "+ms.uiEvent(formId, 'TEST2')+" title='"+ms.titleAttr(formId,'TEST2','IS_TITLE_ATTR',v)+"' >"+v['TEST2']+"</span>")
            arrHtml.push("</td>");
            
              arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            
              arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            
            
              arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
            arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"' >"+v['EDIT_TIME']+"</span>")
            arrHtml.push("</td>");
            
            
              arrHtml.push("<td colno='EDIT_USER' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_USER')+"' style='"+ms.tdStyle(formId, 'EDIT_USER')+"' "+ms.tdEvent(formId, 'EDIT_USER')+">")
            arrHtml.push("<span colno='EDIT_USER' class='"+ms.uiClass(formId, 'EDIT_USER')+"' style='"+ms.uiStyle(formId, 'EDIT_USER')+"' "+ms.uiEvent(formId, 'EDIT_USER')+" title='"+ms.titleAttr(formId,'EDIT_USER','IS_TITLE_ATTR',v)+"' >"+v['EDIT_USER']+"</span>")
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
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
