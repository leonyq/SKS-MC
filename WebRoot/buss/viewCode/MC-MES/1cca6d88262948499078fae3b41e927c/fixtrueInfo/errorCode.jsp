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
		<dict:lang value="VM-不良代码" />
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
		<bu:header formId ="c5a94bc73341487cb6fc5f9c0ee93e9d"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="0ca7cd10e18b43bfb72a9e038bc9e16b" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="0ca7cd10e18b43bfb72a9e038bc9e16b" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagec5a94bc73341487cb6fc5f9c0ee93e9d" id="formPagec5a94bc73341487cb6fc5f9c0ee93e9d" value="${formPagec5a94bc73341487cb6fc5f9c0ee93e9d}"/>
		<input type="hidden" name="formId" id="formId1" value='c5a94bc73341487cb6fc5f9c0ee93e9d'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="c5a94bc73341487cb6fc5f9c0ee93e9d">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc5a94bc73341487cb6fc5f9c0ee93e9d" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc5a94bc73341487cb6fc5f9c0ee93e9d">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec5a94bc73341487cb6fc5f9c0ee93e9d">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c5a94bc73341487cb6fc5f9c0ee93e9d" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c5a94bc73341487cb6fc5f9c0ee93e9d" onclick="_selectAjaxTableAllData(this,'c5a94bc73341487cb6fc5f9c0ee93e9d')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivc5a94bc73341487cb6fc5f9c0ee93e9d" onscroll="ajaxTableScroll(this,'c5a94bc73341487cb6fc5f9c0ee93e9d')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxc5a94bc73341487cb6fc5f9c0ee93e9d">
		<tbody id="tbody_c5a94bc73341487cb6fc5f9c0ee93e9d" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec5a94bc73341487cb6fc5f9c0ee93e9d==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=c5a94bc73341487cb6fc5f9c0ee93e9d&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
        </jsp:include>
		<bu:submit viewId="0ca7cd10e18b43bfb72a9e038bc9e16b" />
		<bu:script viewId="0ca7cd10e18b43bfb72a9e038bc9e16b" />
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
    if(formId=='c5a94bc73341487cb6fc5f9c0ee93e9d'){<%--不良信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='CEC_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CEC_CODE')+"' style='"+ms.tdStyle(formId, 'CEC_CODE')+"' "+ms.tdEvent(formId, 'CEC_CODE')+">")
            arrHtml.push("<span colno='CEC_CODE' class='"+ms.uiClass(formId, 'CEC_CODE')+"' style='"+ms.uiStyle(formId, 'CEC_CODE')+"' "+ms.uiEvent(formId, 'CEC_CODE')+" title='"+ms.titleAttr(formId,'CEC_CODE','IS_TITLE_ATTR',v)+"' >"+v['CEC_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CEC_NAME')+"' style='"+ms.tdStyle(formId, 'CEC_NAME')+"' "+ms.tdEvent(formId, 'CEC_NAME')+">")
            arrHtml.push("<span colno='CEC_NAME' class='"+ms.uiClass(formId, 'CEC_NAME')+"' style='"+ms.uiStyle(formId, 'CEC_NAME')+"' "+ms.uiEvent(formId, 'CEC_NAME')+" title='"+ms.titleAttr(formId,'CEC_NAME','IS_TITLE_ATTR',v)+"' >"+v['CEC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CEC_TYPE')+"' style='text-align:center;"+ms.tdStyle(formId, 'CEC_TYPE')+"' "+ms.tdEvent(formId, 'CEC_TYPE')+">")
            arrHtml.push("<span colno='CEC_TYPE' class='"+ms.uiClass(formId, 'CEC_TYPE')+"' style='"+ms.uiStyle(formId, 'CEC_TYPE')+"' "+ms.uiEvent(formId, 'CEC_TYPE')+" title='"+ms.titleAttr(formId,'CEC_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CEC_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEC_LEVEL' class='datagrid-cell "+ms.tdClass(formId, 'CEC_LEVEL')+"' style='text-align:center;"+ms.tdStyle(formId, 'CEC_LEVEL')+"' "+ms.tdEvent(formId, 'CEC_LEVEL')+">")
            arrHtml.push("<span colno='CEC_LEVEL' class='"+ms.uiClass(formId, 'CEC_LEVEL')+"' style='"+ms.uiStyle(formId, 'CEC_LEVEL')+"' "+ms.uiEvent(formId, 'CEC_LEVEL')+" title='"+ms.titleAttr(formId,'CEC_LEVEL','IS_TITLE_ATTR',v)+"' >"+v['CEC_LEVEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEC_DESC' class='datagrid-cell "+ms.tdClass(formId, 'CEC_DESC')+"' style='"+ms.tdStyle(formId, 'CEC_DESC')+"' "+ms.tdEvent(formId, 'CEC_DESC')+">")
            arrHtml.push("<span colno='CEC_DESC' class='"+ms.uiClass(formId, 'CEC_DESC')+"' style='"+ms.uiStyle(formId, 'CEC_DESC')+"' "+ms.uiEvent(formId, 'CEC_DESC')+" title='"+ms.titleAttr(formId,'CEC_DESC','IS_TITLE_ATTR',v)+"' >"+v['CEC_DESC']+"</span>")
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

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#CEC_CODE").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
