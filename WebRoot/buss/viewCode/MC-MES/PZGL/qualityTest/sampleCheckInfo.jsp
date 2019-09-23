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
		<dict:lang value="VM-样本检验信息" />
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
		<bu:header formId ="04685069ff7e40b2b83a84462dae2208"/>

    
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
		<bu:func viewId="c64bc075a4e74353b4fe96c06060a8b7" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="c64bc075a4e74353b4fe96c06060a8b7" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage04685069ff7e40b2b83a84462dae2208" id="formPage04685069ff7e40b2b83a84462dae2208" value="${formPage04685069ff7e40b2b83a84462dae2208}"/>
		<input type="hidden" name="formId" id="formId1" value='04685069ff7e40b2b83a84462dae2208'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="04685069ff7e40b2b83a84462dae2208">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax04685069ff7e40b2b83a84462dae2208" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner04685069ff7e40b2b83a84462dae2208">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable04685069ff7e40b2b83a84462dae2208">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="04685069ff7e40b2b83a84462dae2208" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_04685069ff7e40b2b83a84462dae2208" onclick="_selectAjaxTableAllData(this,'04685069ff7e40b2b83a84462dae2208')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIP_SN" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIP_INSPECT_SN" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIP_TEST_RESULT" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIP_TEST_FLAG" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QIP_CONCESSION_FLAG" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIP_SAMPLE_FLAG" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIP_ITEM_CODE" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIP_ITEM_NAME" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIP_ITEM_SPEC" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIP_DOC_NUM" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIP_ITEM_NUM" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIP_TEST_NUM" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIP_SCARP_NUM" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIP_ERROR_NUM" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QIP_TEST_EMP" formId="04685069ff7e40b2b83a84462dae2208" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QIP_TEST_TIME" formId="04685069ff7e40b2b83a84462dae2208" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv04685069ff7e40b2b83a84462dae2208" onscroll="ajaxTableScroll(this,'04685069ff7e40b2b83a84462dae2208')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax04685069ff7e40b2b83a84462dae2208">
		<tbody id="tbody_04685069ff7e40b2b83a84462dae2208" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage04685069ff7e40b2b83a84462dae2208==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=04685069ff7e40b2b83a84462dae2208&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="c64bc075a4e74353b4fe96c06060a8b7" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="c64bc075a4e74353b4fe96c06060a8b7" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
$(function(){
    $("#161a2aaaca194343b4acab89cc3aa04b").attr("style","display:none;");
})
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='04685069ff7e40b2b83a84462dae2208'){<%--检验单母本信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v['DATA_AUTH']+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='QIP_SN' class='datagrid-cell "+ms.tdClass(formId, 'QIP_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'QIP_SN')+"' "+ms.tdEvent(formId, 'QIP_SN')+">")
            arrHtml.push("<span colno='QIP_SN' class='"+ms.uiClass(formId, 'QIP_SN')+"' onclick='itemJump1(\""+v['QIP_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QIP_SN')+" title='"+v['QIP_SN']+"' >"+v['QIP_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_INSPECT_SN' class='datagrid-cell "+ms.tdClass(formId, 'QIP_INSPECT_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'QIP_INSPECT_SN')+"' "+ms.tdEvent(formId, 'QIP_INSPECT_SN')+">")
            arrHtml.push("<span colno='QIP_INSPECT_SN' class='"+ms.uiClass(formId, 'QIP_INSPECT_SN')+"' onclick='itemJump2(\""+v['QIP_INSPECT_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QIP_INSPECT_SN')+" title='"+v['QIP_INSPECT_SN']+"' >"+v['QIP_INSPECT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_TEST_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'QIP_TEST_RESULT')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'QIP_TEST_RESULT')+"' "+ms.tdEvent(formId, 'QIP_TEST_RESULT')+">")
            arrHtml.push("<span colno='QIP_TEST_RESULT' class='"+ms.uiClass(formId, 'QIP_TEST_RESULT')+"' style='"+ms.uiStyle(formId, 'QIP_TEST_RESULT')+"' "+ms.uiEvent(formId, 'QIP_TEST_RESULT')+" title='"+ms.titleAttr(formId,'QIP_TEST_RESULT','IS_TITLE_ATTR',v)+"' >"+v['QIP_TEST_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_TEST_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QIP_TEST_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'QIP_TEST_FLAG')+"' "+ms.tdEvent(formId, 'QIP_TEST_FLAG')+">")
            arrHtml.push("<span colno='QIP_TEST_FLAG' class='"+ms.uiClass(formId, 'QIP_TEST_FLAG')+"' style='"+ms.uiStyle(formId, 'QIP_TEST_FLAG')+"' "+ms.uiEvent(formId, 'QIP_TEST_FLAG')+" title='"+ms.titleAttr(formId,'QIP_TEST_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QIP_TEST_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_CONCESSION_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QIP_CONCESSION_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QIP_CONCESSION_FLAG')+"' "+ms.tdEvent(formId, 'QIP_CONCESSION_FLAG')+">")
            arrHtml.push("<span colno='QIP_CONCESSION_FLAG' class='"+ms.uiClass(formId, 'QIP_CONCESSION_FLAG')+"' style='"+ms.uiStyle(formId, 'QIP_CONCESSION_FLAG')+"' "+ms.uiEvent(formId, 'QIP_CONCESSION_FLAG')+" title='"+ms.titleAttr(formId,'QIP_CONCESSION_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QIP_CONCESSION_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_SAMPLE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QIP_SAMPLE_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'QIP_SAMPLE_FLAG')+"' "+ms.tdEvent(formId, 'QIP_SAMPLE_FLAG')+">")
            arrHtml.push("<span colno='QIP_SAMPLE_FLAG' class='"+ms.uiClass(formId, 'QIP_SAMPLE_FLAG')+"' style='"+ms.uiStyle(formId, 'QIP_SAMPLE_FLAG')+"' "+ms.uiEvent(formId, 'QIP_SAMPLE_FLAG')+" title='"+ms.titleAttr(formId,'QIP_SAMPLE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QIP_SAMPLE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QIP_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'QIP_ITEM_CODE')+"' "+ms.tdEvent(formId, 'QIP_ITEM_CODE')+">")
            arrHtml.push("<span colno='QIP_ITEM_CODE' class='"+ms.uiClass(formId, 'QIP_ITEM_CODE')+"' onclick='itemJump3(\""+v['QIP_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QIP_ITEM_CODE')+" title='"+v['QIP_ITEM_CODE']+"' >"+v['QIP_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QIP_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'QIP_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QIP_ITEM_NAME')+">")
            arrHtml.push("<span colno='QIP_ITEM_NAME' class='"+ms.uiClass(formId, 'QIP_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QIP_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QIP_ITEM_NAME')+" title='"+v['QIP_ITEM_NAME']+"' >"+v['QIP_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QIP_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'QIP_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'QIP_ITEM_SPEC')+">")
            arrHtml.push("<span colno='QIP_ITEM_SPEC' class='"+ms.uiClass(formId, 'QIP_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'QIP_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'QIP_ITEM_SPEC')+" title='"+v['QIP_ITEM_SPEC']+"' >"+v['QIP_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QIP_DOC_NUM')+"' style='width:150px;"+ms.tdStyle(formId, 'QIP_DOC_NUM')+"' "+ms.tdEvent(formId, 'QIP_DOC_NUM')+">")
            arrHtml.push("<span colno='QIP_DOC_NUM' class='"+ms.uiClass(formId, 'QIP_DOC_NUM')+"' onclick='itemJump4(\""+v['QIP_DOC_NUM']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QIP_DOC_NUM')+" title='"+v['QIP_DOC_NUM']+"' >"+v['QIP_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            
            
            arrHtml.push("<td colno='QIP_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QIP_ITEM_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'QIP_ITEM_NUM')+"' "+ms.tdEvent(formId, 'QIP_ITEM_NUM')+">")
            arrHtml.push("<span colno='QIP_ITEM_NUM' class='"+ms.uiClass(formId, 'QIP_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'QIP_ITEM_NUM')+"' "+ms.uiEvent(formId, 'QIP_ITEM_NUM')+" title='"+ms.titleAttr(formId,'QIP_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['QIP_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_TEST_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QIP_TEST_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'QIP_TEST_NUM')+"' "+ms.tdEvent(formId, 'QIP_TEST_NUM')+">")
            arrHtml.push("<span colno='QIP_TEST_NUM' class='"+ms.uiClass(formId, 'QIP_TEST_NUM')+"' style='"+ms.uiStyle(formId, 'QIP_TEST_NUM')+"' "+ms.uiEvent(formId, 'QIP_TEST_NUM')+" title='"+ms.titleAttr(formId,'QIP_TEST_NUM','IS_TITLE_ATTR',v)+"' >"+v['QIP_TEST_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_SCARP_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QIP_SCARP_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'QIP_SCARP_NUM')+"' "+ms.tdEvent(formId, 'QIP_SCARP_NUM')+">")
            arrHtml.push("<span colno='QIP_SCARP_NUM' class='"+ms.uiClass(formId, 'QIP_SCARP_NUM')+"' style='"+ms.uiStyle(formId, 'QIP_SCARP_NUM')+"' "+ms.uiEvent(formId, 'QIP_SCARP_NUM')+" title='"+ms.titleAttr(formId,'QIP_SCARP_NUM','IS_TITLE_ATTR',v)+"' >"+v['QIP_SCARP_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_ERROR_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QIP_ERROR_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'QIP_ERROR_NUM')+"' "+ms.tdEvent(formId, 'QIP_ERROR_NUM')+">")
            arrHtml.push("<span colno='QIP_ERROR_NUM' class='"+ms.uiClass(formId, 'QIP_ERROR_NUM')+"' style='"+ms.uiStyle(formId, 'QIP_ERROR_NUM')+"' "+ms.uiEvent(formId, 'QIP_ERROR_NUM')+" title='"+ms.titleAttr(formId,'QIP_ERROR_NUM','IS_TITLE_ATTR',v)+"' >"+v['QIP_ERROR_NUM']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='QIP_TEST_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QIP_TEST_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'QIP_TEST_EMP')+"' "+ms.tdEvent(formId, 'QIP_TEST_EMP')+">")
            arrHtml.push("<span colno='QIP_TEST_EMP' class='"+ms.uiClass(formId, 'QIP_TEST_EMP')+"' style='"+ms.uiStyle(formId, 'QIP_TEST_EMP')+"' "+ms.uiEvent(formId, 'QIP_TEST_EMP')+" title='"+ms.titleAttr(formId,'QIP_TEST_EMP','IS_TITLE_ATTR',v)+"' >"+v['QIP_TEST_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIP_TEST_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QIP_TEST_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QIP_TEST_TIME')+"' "+ms.tdEvent(formId, 'QIP_TEST_TIME')+">")
            arrHtml.push("<span colno='QIP_TEST_TIME' class='"+ms.uiClass(formId, 'QIP_TEST_TIME')+"' style='"+ms.uiStyle(formId, 'QIP_TEST_TIME')+"' "+ms.uiEvent(formId, 'QIP_TEST_TIME')+" title='"+v['QIP_TEST_TIME']+"' >"+v['QIP_TEST_TIME']+"</span>")
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
                  $("#QIP_SN").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//品质抽样信息
function itemJump1(obj){
      winOptMethod.jump("47b119c317d3420cb6b389caa3e35f28","F7635","jumpId",obj);
}  


//品质检验单
function itemJump2(obj){
    winOptMethod.jump("905fce48212c4ce9beecd8bdf72e2a72","F11330","jumpId",obj);
} 

//物料信息
function itemJump3(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//制令单信息
function itemJump4(obj){
  winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
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
