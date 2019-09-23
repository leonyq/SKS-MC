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
		<dict:lang value="品质抽样信息" />
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
		<bu:header formId ="b392490de1734e82baf6a803ab6ccc4c"/>

    
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
		<bu:func viewId="47b119c317d3420cb6b389caa3e35f28" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="47b119c317d3420cb6b389caa3e35f28" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageb392490de1734e82baf6a803ab6ccc4c" id="formPageb392490de1734e82baf6a803ab6ccc4c" value="${formPageb392490de1734e82baf6a803ab6ccc4c}"/>
		<input type="hidden" name="formId" id="formId1" value='b392490de1734e82baf6a803ab6ccc4c'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b392490de1734e82baf6a803ab6ccc4c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb392490de1734e82baf6a803ab6ccc4c" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb392490de1734e82baf6a803ab6ccc4c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb392490de1734e82baf6a803ab6ccc4c">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="b392490de1734e82baf6a803ab6ccc4c" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b392490de1734e82baf6a803ab6ccc4c" onclick="_selectAjaxTableAllData(this,'b392490de1734e82baf6a803ab6ccc4c')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSI_ITEM_SN" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSI_ITEM_CODE" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSI_ITEM_NAME" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSI_ITEM_SPEC" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSI_CONNECT_DOC" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSI_INSPECT_DOC" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSI_SAMPLE_NUM" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSI_SCARP_NUM" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSI_SAMPLE_EMP" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QSI_SAMPLE_TIME" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSI_RETURN_EMP" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QSI_RETURN_TIME" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSI_SAMPLE_HOEMP" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSI_RETURN_HOEMP" formId="b392490de1734e82baf6a803ab6ccc4c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb392490de1734e82baf6a803ab6ccc4c" onscroll="ajaxTableScroll(this,'b392490de1734e82baf6a803ab6ccc4c')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb392490de1734e82baf6a803ab6ccc4c" >
		<tbody id="tbody_b392490de1734e82baf6a803ab6ccc4c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb392490de1734e82baf6a803ab6ccc4c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b392490de1734e82baf6a803ab6ccc4c&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="47b119c317d3420cb6b389caa3e35f28" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="47b119c317d3420cb6b389caa3e35f28" />
    
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
    if(formId=='b392490de1734e82baf6a803ab6ccc4c'){<%--品质抽样信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'QSI_ITEM_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'QSI_ITEM_SN')+">")
            arrHtml.push("<span colno='QSI_ITEM_SN' class='"+ms.uiClass(formId, 'QSI_ITEM_SN')+"' onclick='itemJump1(\""+v['QSI_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'QSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['QSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QSI_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'QSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='QSI_ITEM_CODE' class='"+ms.uiClass(formId, 'QSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'QSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'QSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'QSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['QSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QSI_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QSI_ITEM_NAME')+">")
            arrHtml.push("<span colno='QSI_ITEM_NAME' class='"+ms.uiClass(formId, 'QSI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QSI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QSI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QSI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QSI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QSI_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'QSI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='QSI_ITEM_SPEC' class='"+ms.uiClass(formId, 'QSI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'QSI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'QSI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'QSI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['QSI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'QSI_CONNECT_DOC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSI_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'QSI_CONNECT_DOC')+">")
            arrHtml.push("<span colno='QSI_CONNECT_DOC' class='"+ms.uiClass(formId, 'QSI_CONNECT_DOC')+"' onclick='itemJump2(\""+v['QSI_CONNECT_DOC']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QSI_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'QSI_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['QSI_CONNECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_INSPECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'QSI_INSPECT_DOC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSI_INSPECT_DOC')+"' "+ms.tdEvent(formId, 'QSI_INSPECT_DOC')+">")
            arrHtml.push("<span colno='QSI_INSPECT_DOC' class='"+ms.uiClass(formId, 'QSI_INSPECT_DOC')+"' onclick='itemJump3(\""+v['QSI_INSPECT_DOC']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QSI_INSPECT_DOC')+" title='"+ms.titleAttr(formId,'QSI_INSPECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['QSI_INSPECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_SAMPLE_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QSI_SAMPLE_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QSI_SAMPLE_NUM')+"' "+ms.tdEvent(formId, 'QSI_SAMPLE_NUM')+">")
            arrHtml.push("<span colno='QSI_SAMPLE_NUM' class='"+ms.uiClass(formId, 'QSI_SAMPLE_NUM')+"' style='"+ms.uiStyle(formId, 'QSI_SAMPLE_NUM')+"' "+ms.uiEvent(formId, 'QSI_SAMPLE_NUM')+" title='"+ms.titleAttr(formId,'QSI_SAMPLE_NUM','IS_TITLE_ATTR',v)+"' >"+v['QSI_SAMPLE_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_SCARP_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QSI_SCARP_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QSI_SCARP_NUM')+"' "+ms.tdEvent(formId, 'QSI_SCARP_NUM')+">")
            arrHtml.push("<span colno='QSI_SCARP_NUM' class='"+ms.uiClass(formId, 'QSI_SCARP_NUM')+"' style='"+ms.uiStyle(formId, 'QSI_SCARP_NUM')+"' "+ms.uiEvent(formId, 'QSI_SCARP_NUM')+" title='"+ms.titleAttr(formId,'QSI_SCARP_NUM','IS_TITLE_ATTR',v)+"' >"+v['QSI_SCARP_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_SAMPLE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QSI_SAMPLE_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSI_SAMPLE_EMP')+"' "+ms.tdEvent(formId, 'QSI_SAMPLE_EMP')+">")
            arrHtml.push("<span colno='QSI_SAMPLE_EMP' class='"+ms.uiClass(formId, 'QSI_SAMPLE_EMP')+"' style='"+ms.uiStyle(formId, 'QSI_SAMPLE_EMP')+"' "+ms.uiEvent(formId, 'QSI_SAMPLE_EMP')+" title='"+ms.titleAttr(formId,'QSI_SAMPLE_EMP','IS_TITLE_ATTR',v)+"' >"+v['QSI_SAMPLE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_SAMPLE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QSI_SAMPLE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QSI_SAMPLE_TIME')+"' "+ms.tdEvent(formId, 'QSI_SAMPLE_TIME')+">")
            arrHtml.push("<span colno='QSI_SAMPLE_TIME' class='"+ms.uiClass(formId, 'QSI_SAMPLE_TIME')+"' style='"+ms.uiStyle(formId, 'QSI_SAMPLE_TIME')+"' "+ms.uiEvent(formId, 'QSI_SAMPLE_TIME')+" title='"+ms.titleAttr(formId,'QSI_SAMPLE_TIME','IS_TITLE_ATTR',v)+"' >"+v['QSI_SAMPLE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_RETURN_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QSI_RETURN_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSI_RETURN_EMP')+"' "+ms.tdEvent(formId, 'QSI_RETURN_EMP')+">")
            arrHtml.push("<span colno='QSI_RETURN_EMP' class='"+ms.uiClass(formId, 'QSI_RETURN_EMP')+"' style='"+ms.uiStyle(formId, 'QSI_RETURN_EMP')+"' "+ms.uiEvent(formId, 'QSI_RETURN_EMP')+" title='"+ms.titleAttr(formId,'QSI_RETURN_EMP','IS_TITLE_ATTR',v)+"' >"+v['QSI_RETURN_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_RETURN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QSI_RETURN_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QSI_RETURN_TIME')+"' "+ms.tdEvent(formId, 'QSI_RETURN_TIME')+">")
            arrHtml.push("<span colno='QSI_RETURN_TIME' class='"+ms.uiClass(formId, 'QSI_RETURN_TIME')+"' style='"+ms.uiStyle(formId, 'QSI_RETURN_TIME')+"' "+ms.uiEvent(formId, 'QSI_RETURN_TIME')+" title='"+ms.titleAttr(formId,'QSI_RETURN_TIME','IS_TITLE_ATTR',v)+"' >"+v['QSI_RETURN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_SAMPLE_HOEMP' class='datagrid-cell "+ms.tdClass(formId, 'QSI_SAMPLE_HOEMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSI_SAMPLE_HOEMP')+"' "+ms.tdEvent(formId, 'QSI_SAMPLE_HOEMP')+">")
            arrHtml.push("<span colno='QSI_SAMPLE_HOEMP' class='"+ms.uiClass(formId, 'QSI_SAMPLE_HOEMP')+"' style='"+ms.uiStyle(formId, 'QSI_SAMPLE_HOEMP')+"' "+ms.uiEvent(formId, 'QSI_SAMPLE_HOEMP')+" title='"+ms.titleAttr(formId,'QSI_SAMPLE_HOEMP','IS_TITLE_ATTR',v)+"' >"+v['QSI_SAMPLE_HOEMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSI_RETURN_HOEMP' class='datagrid-cell "+ms.tdClass(formId, 'QSI_RETURN_HOEMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSI_RETURN_HOEMP')+"' "+ms.tdEvent(formId, 'QSI_RETURN_HOEMP')+">")
            arrHtml.push("<span colno='QSI_RETURN_HOEMP' class='"+ms.uiClass(formId, 'QSI_RETURN_HOEMP')+"' style='"+ms.uiStyle(formId, 'QSI_RETURN_HOEMP')+"' "+ms.uiEvent(formId, 'QSI_RETURN_HOEMP')+" title='"+ms.titleAttr(formId,'QSI_RETURN_HOEMP','IS_TITLE_ATTR',v)+"' >"+v['QSI_RETURN_HOEMP']+"</span>")
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
$(function(){
$("#bcdc8a1717e34df289486f29d05b2bce").attr("style","display:none;");
})

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#QSI_ITEM_SN").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
                 
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料追溯
function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  


//仓库单据信息
function itemJump2(obj){
    winOptMethod.jump("f4c3cfb840234a24b5ac7135d783b7e3","F7011","jumpId",obj);
} 

//品质检验单
function itemJump3(obj){
    winOptMethod.jump("905fce48212c4ce9beecd8bdf72e2a72","F11330","jumpId",obj);
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
