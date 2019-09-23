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
		<dict:lang value="测试16" />
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
		<bu:header formId ="eb160d7842a04a208fe8919ec7f58faa"/>

    
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
		<bu:func viewId="5b5cc84720b44c6abb563e74d61727c8" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="5b5cc84720b44c6abb563e74d61727c8" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageeb160d7842a04a208fe8919ec7f58faa" id="formPageeb160d7842a04a208fe8919ec7f58faa" value="${formPageeb160d7842a04a208fe8919ec7f58faa}"/>
		<input type="hidden" name="formId" id="formId1" value='eb160d7842a04a208fe8919ec7f58faa'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='5d69ed10187a43c19b9098a909ee1958'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='063fd7b4b50a43298f14fbffccee7da2'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="eb160d7842a04a208fe8919ec7f58faa">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxeb160d7842a04a208fe8919ec7f58faa" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innereb160d7842a04a208fe8919ec7f58faa">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableeb160d7842a04a208fe8919ec7f58faa">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="eb160d7842a04a208fe8919ec7f58faa" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_eb160d7842a04a208fe8919ec7f58faa" onclick="_selectAjaxTableAllData(this,'eb160d7842a04a208fe8919ec7f58faa')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST4" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST2" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST3" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiveb160d7842a04a208fe8919ec7f58faa" onscroll="ajaxTableScroll(this,'eb160d7842a04a208fe8919ec7f58faa')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxeb160d7842a04a208fe8919ec7f58faa">
		<tbody id="tbody_eb160d7842a04a208fe8919ec7f58faa" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageeb160d7842a04a208fe8919ec7f58faa==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=eb160d7842a04a208fe8919ec7f58faa&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="formPage063fd7b4b50a43298f14fbffccee7da2" id="formPage063fd7b4b50a43298f14fbffccee7da2" value="${formPage063fd7b4b50a43298f14fbffccee7da2}"/>
		<input type="hidden" name="formId" id="formId2" value='063fd7b4b50a43298f14fbffccee7da2'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="063fd7b4b50a43298f14fbffccee7da2">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax063fd7b4b50a43298f14fbffccee7da2" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner063fd7b4b50a43298f14fbffccee7da2">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable063fd7b4b50a43298f14fbffccee7da2">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="063fd7b4b50a43298f14fbffccee7da2" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_063fd7b4b50a43298f14fbffccee7da2" onclick="_selectAjaxTableAllData(this,'063fd7b4b50a43298f14fbffccee7da2')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="063fd7b4b50a43298f14fbffccee7da2" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST2" formId="063fd7b4b50a43298f14fbffccee7da2" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST3" formId="063fd7b4b50a43298f14fbffccee7da2" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PID" formId="063fd7b4b50a43298f14fbffccee7da2" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv063fd7b4b50a43298f14fbffccee7da2" onscroll="ajaxTableScroll(this,'063fd7b4b50a43298f14fbffccee7da2')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax063fd7b4b50a43298f14fbffccee7da2">
		<tbody id="tbody_063fd7b4b50a43298f14fbffccee7da2" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage063fd7b4b50a43298f14fbffccee7da2==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=063fd7b4b50a43298f14fbffccee7da2&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="5b5cc84720b44c6abb563e74d61727c8" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="5b5cc84720b44c6abb563e74d61727c8" />
    
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
    if(formId=='eb160d7842a04a208fe8919ec7f58faa'){<%--数据权限测试--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST4' class='datagrid-cell "+ms.tdClass(formId, 'TEST4')+"' style='"+ms.tdStyle(formId, 'TEST4')+"' "+ms.tdEvent(formId, 'TEST4')+">")
            arrHtml.push("<span colno='TEST4' class='"+ms.uiClass(formId, 'TEST4')+"' style='"+ms.uiStyle(formId, 'TEST4')+"' "+ms.uiEvent(formId, 'TEST4')+" title='"+ms.titleAttr(formId,'TEST4','IS_TITLE_ATTR',v)+"' >"+v['TEST4']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST1' class='datagrid-cell "+ms.tdClass(formId, 'TEST1')+"' style='"+ms.tdStyle(formId, 'TEST1')+"' "+ms.tdEvent(formId, 'TEST1')+">")
            arrHtml.push("<span colno='TEST1' class='"+ms.uiClass(formId, 'TEST1')+"' style='"+ms.uiStyle(formId, 'TEST1')+"' "+ms.uiEvent(formId, 'TEST1')+" title='"+ms.titleAttr(formId,'TEST1','IS_TITLE_ATTR',v)+"' >"+v['TEST1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST2' class='datagrid-cell "+ms.tdClass(formId, 'TEST2')+"' style='"+ms.tdStyle(formId, 'TEST2')+"' "+ms.tdEvent(formId, 'TEST2')+">")
            arrHtml.push("<span colno='TEST2' class='"+ms.uiClass(formId, 'TEST2')+"' style='"+ms.uiStyle(formId, 'TEST2')+"' "+ms.uiEvent(formId, 'TEST2')+" title='"+ms.titleAttr(formId,'TEST2','IS_TITLE_ATTR',v)+"' >"+v['TEST2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST3' class='datagrid-cell "+ms.tdClass(formId, 'TEST3')+"' style='"+ms.tdStyle(formId, 'TEST3')+"' "+ms.tdEvent(formId, 'TEST3')+">")
            arrHtml.push("<span colno='TEST3' class='"+ms.uiClass(formId, 'TEST3')+"' style='"+ms.uiStyle(formId, 'TEST3')+"' "+ms.uiEvent(formId, 'TEST3')+" title='"+ms.titleAttr(formId,'TEST3','IS_TITLE_ATTR',v)+"' >"+v['TEST3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='063fd7b4b50a43298f14fbffccee7da2'){<%--数据权限测试子表--%>
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
            arrHtml.push("<td colno='TEST3' class='datagrid-cell "+ms.tdClass(formId, 'TEST3')+"' style='"+ms.tdStyle(formId, 'TEST3')+"' "+ms.tdEvent(formId, 'TEST3')+">")
            arrHtml.push("<span colno='TEST3' class='"+ms.uiClass(formId, 'TEST3')+"' style='"+ms.uiStyle(formId, 'TEST3')+"' "+ms.uiEvent(formId, 'TEST3')+" title='"+ms.titleAttr(formId,'TEST3','IS_TITLE_ATTR',v)+"' >"+v['TEST3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PID' class='datagrid-cell "+ms.tdClass(formId, 'PID')+"' style='"+ms.tdStyle(formId, 'PID')+"' "+ms.tdEvent(formId, 'PID')+">")
            arrHtml.push("<span colno='PID' class='"+ms.uiClass(formId, 'PID')+"' style='"+ms.uiStyle(formId, 'PID')+"' "+ms.uiEvent(formId, 'PID')+" title='"+ms.titleAttr(formId,'PID','IS_TITLE_ATTR',v)+"' >"+v['PID']+"</span>")
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
