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
		<dict:lang value="电子料车物料" />
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
		<bu:header formId ="62341c56c83840a589cd28ea59d9ebaf"/>

    
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
		<bu:func viewId="bd93d69449f14a10ac010f112a52802d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="bd93d69449f14a10ac010f112a52802d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage62341c56c83840a589cd28ea59d9ebaf" id="formPage62341c56c83840a589cd28ea59d9ebaf" value="${formPage62341c56c83840a589cd28ea59d9ebaf}"/>
		<input type="hidden" name="formId" id="formId1" value='62341c56c83840a589cd28ea59d9ebaf'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="62341c56c83840a589cd28ea59d9ebaf">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax62341c56c83840a589cd28ea59d9ebaf" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner62341c56c83840a589cd28ea59d9ebaf">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable62341c56c83840a589cd28ea59d9ebaf" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="62341c56c83840a589cd28ea59d9ebaf" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_62341c56c83840a589cd28ea59d9ebaf" onclick="_selectAjaxTableAllData(this,'62341c56c83840a589cd28ea59d9ebaf')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_MO_NUMNBER" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_OUT_DOC" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_SN" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_ITEM_SN" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_ITEM_CODE" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center" ><bu:uitn colNo="WEV_ITEM_NUM" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_STORAGE_SN" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_SHELF_SN" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_ITEM_SIZE" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WEV_MT_SN" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center" ><bu:uitn colNo="WEV_DEVICE_SEQ" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center" ><bu:uitn colNo="WEV_LOADPOINT" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center" ><bu:uitn colNo="WEV_TABLE_NO" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center" ><bu:uitn colNo="WEV_CHANEL_SN" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center" ><bu:uitn colNo="WEV_TRY_FLAG" formId="62341c56c83840a589cd28ea59d9ebaf" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv62341c56c83840a589cd28ea59d9ebaf" onscroll="ajaxTableScroll(this,'62341c56c83840a589cd28ea59d9ebaf')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax62341c56c83840a589cd28ea59d9ebaf">
		<tbody id="tbody_62341c56c83840a589cd28ea59d9ebaf" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage62341c56c83840a589cd28ea59d9ebaf==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=62341c56c83840a589cd28ea59d9ebaf&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="bd93d69449f14a10ac010f112a52802d" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="bd93d69449f14a10ac010f112a52802d" />
    
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
    if(formId=='62341c56c83840a589cd28ea59d9ebaf'){<%--FM-仓库电子周转料车物料信息--%>
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
            arrHtml.push("<td colno='WEV_MO_NUMNBER' class='datagrid-cell "+ms.tdClass(formId, 'WEV_MO_NUMNBER')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WEV_MO_NUMNBER')+"' "+ms.tdEvent(formId, 'WEV_MO_NUMNBER')+">")
            arrHtml.push("<span colno='WEV_MO_NUMNBER' class='"+ms.uiClass(formId, 'WEV_MO_NUMNBER')+"' onclick='itemJump1(\""+v['WEV_MO_NUMNBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WEV_MO_NUMNBER')+" title='"+ms.titleAttr(formId,'WEV_MO_NUMNBER','IS_TITLE_ATTR',v)+"' >"+v['WEV_MO_NUMNBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_OUT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WEV_OUT_DOC')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WEV_OUT_DOC')+"' "+ms.tdEvent(formId, 'WEV_OUT_DOC')+">")
            arrHtml.push("<span colno='WEV_OUT_DOC' class='"+ms.uiClass(formId, 'WEV_OUT_DOC')+"' onclick='itemJump2(\""+v['WEV_OUT_DOC']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WEV_OUT_DOC')+" title='"+ms.titleAttr(formId,'WEV_OUT_DOC','IS_TITLE_ATTR',v)+"' >"+v['WEV_OUT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_SN' class='datagrid-cell "+ms.tdClass(formId, 'WEV_SN')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WEV_SN')+"' "+ms.tdEvent(formId, 'WEV_SN')+">")
            arrHtml.push("<span colno='WEV_SN' class='"+ms.uiClass(formId, 'WEV_SN')+"' style='"+ms.uiStyle(formId, 'WEV_SN')+"' "+ms.uiEvent(formId, 'WEV_SN')+" title='"+ms.titleAttr(formId,'WEV_SN','IS_TITLE_ATTR',v)+"' >"+v['WEV_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WEV_ITEM_SN')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WEV_ITEM_SN')+"' "+ms.tdEvent(formId, 'WEV_ITEM_SN')+">")
            arrHtml.push("<span colno='WEV_ITEM_SN' class='"+ms.uiClass(formId, 'WEV_ITEM_SN')+"' onclick='itemJump3(\""+v['WEV_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WEV_ITEM_SN')+" title='"+ms.titleAttr(formId,'WEV_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WEV_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WEV_ITEM_CODE')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WEV_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WEV_ITEM_CODE')+">")
            arrHtml.push("<span colno='WEV_ITEM_CODE' class='"+ms.uiClass(formId, 'WEV_ITEM_CODE')+"' onclick='itemJump4(\""+v['WEV_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WEV_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WEV_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WEV_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WEV_ITEM_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WEV_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WEV_ITEM_NUM')+">")
            arrHtml.push("<span colno='WEV_ITEM_NUM' class='"+ms.uiClass(formId, 'WEV_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WEV_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WEV_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WEV_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WEV_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_STORAGE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WEV_STORAGE_SN')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WEV_STORAGE_SN')+"' "+ms.tdEvent(formId, 'WEV_STORAGE_SN')+">")
            arrHtml.push("<span colno='WEV_STORAGE_SN' class='"+ms.uiClass(formId, 'WEV_STORAGE_SN')+"' style='"+ms.uiStyle(formId, 'WEV_STORAGE_SN')+"' "+ms.uiEvent(formId, 'WEV_STORAGE_SN')+" title='"+ms.titleAttr(formId,'WEV_STORAGE_SN','IS_TITLE_ATTR',v)+"' >"+v['WEV_STORAGE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_SHELF_SN' class='datagrid-cell "+ms.tdClass(formId, 'WEV_SHELF_SN')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WEV_SHELF_SN')+"' "+ms.tdEvent(formId, 'WEV_SHELF_SN')+">")
            arrHtml.push("<span colno='WEV_SHELF_SN' class='"+ms.uiClass(formId, 'WEV_SHELF_SN')+"' style='"+ms.uiStyle(formId, 'WEV_SHELF_SN')+"' "+ms.uiEvent(formId, 'WEV_SHELF_SN')+" title='"+ms.titleAttr(formId,'WEV_SHELF_SN','IS_TITLE_ATTR',v)+"' >"+v['WEV_SHELF_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_ITEM_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'WEV_ITEM_SIZE')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'WEV_ITEM_SIZE')+"' "+ms.tdEvent(formId, 'WEV_ITEM_SIZE')+">")
            arrHtml.push("<span colno='WEV_ITEM_SIZE' class='"+ms.uiClass(formId, 'WEV_ITEM_SIZE')+"' style='"+ms.uiStyle(formId, 'WEV_ITEM_SIZE')+"' "+ms.uiEvent(formId, 'WEV_ITEM_SIZE')+" title='"+ms.titleAttr(formId,'WEV_ITEM_SIZE','IS_TITLE_ATTR',v)+"' >"+v['WEV_ITEM_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_MT_SN' class='datagrid-cell "+ms.tdClass(formId, 'WEV_MT_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WEV_MT_SN')+"' "+ms.tdEvent(formId, 'WEV_MT_SN')+">")
            arrHtml.push("<span colno='WEV_MT_SN' class='"+ms.uiClass(formId, 'WEV_MT_SN')+"' style='"+ms.uiStyle(formId, 'WEV_MT_SN')+"' "+ms.uiEvent(formId, 'WEV_MT_SN')+" title='"+ms.titleAttr(formId,'WEV_MT_SN','IS_TITLE_ATTR',v)+"' >"+v['WEV_MT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_DEVICE_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WEV_DEVICE_SEQ')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WEV_DEVICE_SEQ')+"' "+ms.tdEvent(formId, 'WEV_DEVICE_SEQ')+">")
            arrHtml.push("<span colno='WEV_DEVICE_SEQ' class='"+ms.uiClass(formId, 'WEV_DEVICE_SEQ')+"' style='"+ms.uiStyle(formId, 'WEV_DEVICE_SEQ')+"' "+ms.uiEvent(formId, 'WEV_DEVICE_SEQ')+" title='"+ms.titleAttr(formId,'WEV_DEVICE_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WEV_DEVICE_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_LOADPOINT' class='datagrid-cell "+ms.tdClass(formId, 'WEV_LOADPOINT')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WEV_LOADPOINT')+"' "+ms.tdEvent(formId, 'WEV_LOADPOINT')+">")
            arrHtml.push("<span colno='WEV_LOADPOINT' class='"+ms.uiClass(formId, 'WEV_LOADPOINT')+"' style='"+ms.uiStyle(formId, 'WEV_LOADPOINT')+"' "+ms.uiEvent(formId, 'WEV_LOADPOINT')+" title='"+ms.titleAttr(formId,'WEV_LOADPOINT','IS_TITLE_ATTR',v)+"' >"+v['WEV_LOADPOINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_TABLE_NO' class='datagrid-cell "+ms.tdClass(formId, 'WEV_TABLE_NO')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WEV_TABLE_NO')+"' "+ms.tdEvent(formId, 'WEV_TABLE_NO')+">")
            arrHtml.push("<span colno='WEV_TABLE_NO' class='"+ms.uiClass(formId, 'WEV_TABLE_NO')+"' style='"+ms.uiStyle(formId, 'WEV_TABLE_NO')+"' "+ms.uiEvent(formId, 'WEV_TABLE_NO')+" title='"+ms.titleAttr(formId,'WEV_TABLE_NO','IS_TITLE_ATTR',v)+"' >"+v['WEV_TABLE_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_CHANEL_SN' class='datagrid-cell "+ms.tdClass(formId, 'WEV_CHANEL_SN')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WEV_CHANEL_SN')+"' "+ms.tdEvent(formId, 'WEV_CHANEL_SN')+">")
            arrHtml.push("<span colno='WEV_CHANEL_SN' class='"+ms.uiClass(formId, 'WEV_CHANEL_SN')+"' style='"+ms.uiStyle(formId, 'WEV_CHANEL_SN')+"' "+ms.uiEvent(formId, 'WEV_CHANEL_SN')+" title='"+ms.titleAttr(formId,'WEV_CHANEL_SN','IS_TITLE_ATTR',v)+"' >"+v['WEV_CHANEL_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEV_TRY_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WEV_TRY_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WEV_TRY_FLAG')+"' "+ms.tdEvent(formId, 'WEV_TRY_FLAG')+">")
            arrHtml.push("<span colno='WEV_TRY_FLAG' class='"+ms.uiClass(formId, 'WEV_TRY_FLAG')+"' style='"+ms.uiStyle(formId, 'WEV_TRY_FLAG')+"' "+ms.uiEvent(formId, 'WEV_TRY_FLAG')+" title='"+ms.titleAttr(formId,'WEV_TRY_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WEV_TRY_FLAG']+"</span>")
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

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WEV_SN").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
                 
             
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
}  


//生产领料
function itemJump2(obj){
    winOptMethod.jump("b1bd96ced2af4ca1af9ea4e8dd2886a7","F6725","jumpId",obj);
} 

//物料追溯
function itemJump3(obj){
    winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
} 

//物料信息
function itemJump4(obj){
  winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
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
