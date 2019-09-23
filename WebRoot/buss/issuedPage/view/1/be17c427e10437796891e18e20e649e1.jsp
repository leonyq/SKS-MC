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
		<dict:lang value="产品项目2" />
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
		<bu:header formId ="2afde634fbc5470d96dd81dbc7d251ac"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="1e971c4104a649b18a40cadc18596501" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="1e971c4104a649b18a40cadc18596501" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage2afde634fbc5470d96dd81dbc7d251ac" id="formPage2afde634fbc5470d96dd81dbc7d251ac" value="${formPage2afde634fbc5470d96dd81dbc7d251ac}"/>
		<input type="hidden" name="formId" id="formId1" value='2afde634fbc5470d96dd81dbc7d251ac'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="2afde634fbc5470d96dd81dbc7d251ac">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2afde634fbc5470d96dd81dbc7d251ac" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner2afde634fbc5470d96dd81dbc7d251ac">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2afde634fbc5470d96dd81dbc7d251ac">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="2afde634fbc5470d96dd81dbc7d251ac" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_2afde634fbc5470d96dd81dbc7d251ac" onclick="_selectAjaxTableAllData(this,'2afde634fbc5470d96dd81dbc7d251ac')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDIT_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRJ" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv2afde634fbc5470d96dd81dbc7d251ac" onscroll="ajaxTableScroll(this,'2afde634fbc5470d96dd81dbc7d251ac')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2afde634fbc5470d96dd81dbc7d251ac">
		<tbody id="tbody_2afde634fbc5470d96dd81dbc7d251ac" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage2afde634fbc5470d96dd81dbc7d251ac==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=2afde634fbc5470d96dd81dbc7d251ac&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="1e971c4104a649b18a40cadc18596501" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="1e971c4104a649b18a40cadc18596501" />
    
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
    if(formId=='2afde634fbc5470d96dd81dbc7d251ac'){<%--产品项目表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_NO' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_NO')+"' style='"+ms.tdStyle(formId, 'PROJECT_NO')+"' "+ms.tdEvent(formId, 'PROJECT_NO')+">")
            arrHtml.push("<span colno='PROJECT_NO' class='"+ms.uiClass(formId, 'PROJECT_NO')+"' style='"+ms.uiStyle(formId, 'PROJECT_NO')+"' "+ms.uiEvent(formId, 'PROJECT_NO')+" title='"+ms.titleAttr(formId,'PROJECT_NO','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_NAME')+"' style='"+ms.tdStyle(formId, 'PROJECT_NAME')+"' "+ms.tdEvent(formId, 'PROJECT_NAME')+">")
            arrHtml.push("<span colno='PROJECT_NAME' class='"+ms.uiClass(formId, 'PROJECT_NAME')+"' style='"+ms.uiStyle(formId, 'PROJECT_NAME')+"' "+ms.uiEvent(formId, 'PROJECT_NAME')+" title='"+ms.titleAttr(formId,'PROJECT_NAME','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_LIABLE' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_LIABLE')+"' style='"+ms.tdStyle(formId, 'PERSON_LIABLE')+"' "+ms.tdEvent(formId, 'PERSON_LIABLE')+">")
            arrHtml.push("<span colno='PERSON_LIABLE' class='"+ms.uiClass(formId, 'PERSON_LIABLE')+"' style='"+ms.uiStyle(formId, 'PERSON_LIABLE')+"' "+ms.uiEvent(formId, 'PERSON_LIABLE')+" title='"+ms.titleAttr(formId,'PERSON_LIABLE','IS_TITLE_ATTR',v)+"' >"+v['PERSON_LIABLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BEG_DATE' class='datagrid-cell "+ms.tdClass(formId, 'BEG_DATE')+"' style='"+ms.tdStyle(formId, 'BEG_DATE')+"' "+ms.tdEvent(formId, 'BEG_DATE')+">")
            arrHtml.push("<span colno='BEG_DATE' class='"+ms.uiClass(formId, 'BEG_DATE')+"' style='"+ms.uiStyle(formId, 'BEG_DATE')+"' "+ms.uiEvent(formId, 'BEG_DATE')+" title='"+ms.titleAttr(formId,'BEG_DATE','IS_TITLE_ATTR',v)+"' >"+v['BEG_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='END_DATE' class='datagrid-cell "+ms.tdClass(formId, 'END_DATE')+"' style='"+ms.tdStyle(formId, 'END_DATE')+"' "+ms.tdEvent(formId, 'END_DATE')+">")
            arrHtml.push("<span colno='END_DATE' class='"+ms.uiClass(formId, 'END_DATE')+"' style='"+ms.uiStyle(formId, 'END_DATE')+"' "+ms.uiEvent(formId, 'END_DATE')+" title='"+ms.titleAttr(formId,'END_DATE','IS_TITLE_ATTR',v)+"' >"+v['END_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPEED_PROGRESS' class='datagrid-cell "+ms.tdClass(formId, 'SPEED_PROGRESS')+"' style='"+ms.tdStyle(formId, 'SPEED_PROGRESS')+"' "+ms.tdEvent(formId, 'SPEED_PROGRESS')+">")
            arrHtml.push("<span colno='SPEED_PROGRESS' class='"+ms.uiClass(formId, 'SPEED_PROGRESS')+"' style='"+ms.uiStyle(formId, 'SPEED_PROGRESS')+"' "+ms.uiEvent(formId, 'SPEED_PROGRESS')+" title='"+ms.titleAttr(formId,'SPEED_PROGRESS','IS_TITLE_ATTR',v)+"' >"+v['SPEED_PROGRESS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
            arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"' >"+v['EDIT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRJ' class='datagrid-cell "+ms.tdClass(formId, 'PRJ')+"' style='"+ms.tdStyle(formId, 'PRJ')+"' "+ms.tdEvent(formId, 'PRJ')+">")
            arrHtml.push("<span colno='PRJ' class='"+ms.uiClass(formId, 'PRJ')+"' style='"+ms.uiStyle(formId, 'PRJ')+"' "+ms.uiEvent(formId, 'PRJ')+" title='"+ms.titleAttr(formId,'PRJ','IS_TITLE_ATTR',v)+"' >"+v['PRJ']+"</span>")
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
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
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
