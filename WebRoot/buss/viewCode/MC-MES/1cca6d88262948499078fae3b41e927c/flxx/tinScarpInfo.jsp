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
		<dict:lang value="VM-辅料报废-列表" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="536730f0f221402c8ddc9bb284b26acc"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="b169fd35be164d6f87480662cf4e43c7" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="b169fd35be164d6f87480662cf4e43c7" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage536730f0f221402c8ddc9bb284b26acc" id="formPage536730f0f221402c8ddc9bb284b26acc" value="${formPage536730f0f221402c8ddc9bb284b26acc}"/>
		<input type="hidden" name="formId" id="formId1" value='536730f0f221402c8ddc9bb284b26acc'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="536730f0f221402c8ddc9bb284b26acc">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax536730f0f221402c8ddc9bb284b26acc" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner536730f0f221402c8ddc9bb284b26acc">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable536730f0f221402c8ddc9bb284b26acc" style="min-width:1520px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="536730f0f221402c8ddc9bb284b26acc" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_536730f0f221402c8ddc9bb284b26acc" onclick="_selectAjaxTableAllData(this,'536730f0f221402c8ddc9bb284b26acc')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:210px;"><bu:uitn colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
	        <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:80px;"><dict:lang value="操作人员"/></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv536730f0f221402c8ddc9bb284b26acc" onscroll="ajaxTableScroll(this,'536730f0f221402c8ddc9bb284b26acc')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax536730f0f221402c8ddc9bb284b26acc" style="min-width:1520px;">
		<tbody id="tbody_536730f0f221402c8ddc9bb284b26acc" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage536730f0f221402c8ddc9bb284b26acc==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=536730f0f221402c8ddc9bb284b26acc&showLoading=0" />
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
		<bu:submit viewId="b169fd35be164d6f87480662cf4e43c7" />
		<bu:script viewId="b169fd35be164d6f87480662cf4e43c7" />
        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        	<jsp:param name="modelName" value="VIEW_TYPE_17" />
        	<jsp:param name="location" value="jsLoading" />
        </jsp:include>
<script>

function reloadPg(msg,title,width,height,time,isCloseWin){
	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
 /* document.forms.search_form.submit();
 util.showTopLoading(); */
 query("formId1");
 if ("1" != isCloseWin) {
   top.$(".dialog-close").click();
 }
  checkboxAll("joblist");

}

<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    console.log(uiTxt);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='536730f0f221402c8ddc9bb284b26acc'){<%--FM-辅料报废信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var tinSN=v['CTS_TIN_SN'];
            var itemCode=v['CTS_ITEM_CODE'];
            var name=v['ASSISTANTTOOLNAME'];
            var spec=v['ASSISTANTTOOLSPEC'];
            var reason=v['CTS_SCARP_REASON'];
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' title='"+tinSN+"' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTS_TIN_SN' title='"+tinSN+"' class='datagrid-cell "+ms.tdClass(formId, 'CTS_TIN_SN')+"' style='width:210px;"+ms.tdStyle(formId, 'CTS_TIN_SN')+"' "+ms.tdEvent(formId, 'CTS_TIN_SN')+">")
            arrHtml.push("<span colno='CTS_TIN_SN' class='"+ms.uiClass(formId, 'CTS_TIN_SN')+"' onclick='itemJump1(\""+v['CTS_TIN_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTS_TIN_SN')+" >"+v['CTS_TIN_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTS_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTS_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CTS_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CTS_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CTS_ITEM_TYPE' class='"+ms.uiClass(formId, 'CTS_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CTS_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CTS_ITEM_TYPE')+" >"+v['CTS_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTS_ITEM_CODE' title='"+itemCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CTS_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTS_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CTS_ITEM_CODE')+">")
            arrHtml.push("<span colno='CTS_ITEM_CODE' class='"+ms.uiClass(formId, 'CTS_ITEM_CODE')+"' onclick='itemJump2(\""+v['CTS_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTS_ITEM_CODE')+" >"+v['CTS_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTTOOLNAME' title='"+name+"' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTTOOLNAME')+"' style='width:120px;"+ms.tdStyle(formId, 'ASSISTANTTOOLNAME')+"' "+ms.tdEvent(formId, 'ASSISTANTTOOLNAME')+">")
            arrHtml.push("<span colno='ASSISTANTTOOLNAME' class='"+ms.uiClass(formId, 'ASSISTANTTOOLNAME')+"' style='"+ms.uiStyle(formId, 'ASSISTANTTOOLNAME')+"' "+ms.uiEvent(formId, 'ASSISTANTTOOLNAME')+" >"+v['ASSISTANTTOOLNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTTOOLSPEC' title='"+spec+"' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTTOOLSPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'ASSISTANTTOOLSPEC')+"' "+ms.tdEvent(formId, 'ASSISTANTTOOLSPEC')+">")
            arrHtml.push("<span colno='ASSISTANTTOOLSPEC' class='"+ms.uiClass(formId, 'ASSISTANTTOOLSPEC')+"' style='"+ms.uiStyle(formId, 'ASSISTANTTOOLSPEC')+"' "+ms.uiEvent(formId, 'ASSISTANTTOOLSPEC')+" >"+v['ASSISTANTTOOLSPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTS_LOT' class='datagrid-cell "+ms.tdClass(formId, 'CTS_LOT')+"' style='width:100px;"+ms.tdStyle(formId, 'CTS_LOT')+"' "+ms.tdEvent(formId, 'CTS_LOT')+">")
            arrHtml.push("<span colno='CTS_LOT' class='"+ms.uiClass(formId, 'CTS_LOT')+"' style='"+ms.uiStyle(formId, 'CTS_LOT')+"' "+ms.uiEvent(formId, 'CTS_LOT')+" title='"+v.CTS_LOT+"'>"+v['CTS_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SUPPLIER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'SUPPLIER_NAME')+"' style='width:180px;"+ms.tdStyle(formId, 'SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'SUPPLIER_NAME')+">")
            arrHtml.push("<span colno='SUPPLIER_NAME' class='"+ms.uiClass(formId, 'SUPPLIER_NAME')+"' style='"+ms.uiStyle(formId, 'SUPPLIER_NAME')+"' "+ms.uiEvent(formId, 'SUPPLIER_NAME')+" title='"+v.SUPPLIER_NAME+"'>"+v['SUPPLIER_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTS_SCARP_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTS_SCARP_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CTS_SCARP_TYPE')+"' "+ms.tdEvent(formId, 'CTS_SCARP_TYPE')+">")
            arrHtml.push("<span colno='CTS_SCARP_TYPE' class='"+ms.uiClass(formId, 'CTS_SCARP_TYPE')+"' style='"+ms.uiStyle(formId, 'CTS_SCARP_TYPE')+"' "+ms.uiEvent(formId, 'CTS_SCARP_TYPE')+" title='"+v.CTS_SCARP_TYPE+"'>"+v['CTS_SCARP_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTS_SCARP_REASON' title='"+reason+"' class='datagrid-cell "+ms.tdClass(formId, 'CTS_SCARP_REASON')+"' style='width:200px;"+ms.tdStyle(formId, 'CTS_SCARP_REASON')+"' "+ms.tdEvent(formId, 'CTS_SCARP_REASON')+">")
            arrHtml.push("<span colno='CTS_SCARP_REASON' class='"+ms.uiClass(formId, 'CTS_SCARP_REASON')+"' style='"+ms.uiStyle(formId, 'CTS_SCARP_REASON')+"' "+ms.uiEvent(formId, 'CTS_SCARP_REASON')+" >"+v['CTS_SCARP_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTS_SCARP_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTS_SCARP_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CTS_SCARP_TIME')+"' "+ms.tdEvent(formId, 'CTS_SCARP_TIME')+">")
            arrHtml.push("<span colno='CTS_SCARP_TIME' class='"+ms.uiClass(formId, 'CTS_SCARP_TIME')+"' style='"+ms.uiStyle(formId, 'CTS_SCARP_TIME')+"' "+ms.uiEvent(formId, 'CTS_SCARP_TIME')+" title='"+v.CTS_SCARP_TIME+"'>"+v['CTS_SCARP_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#NAME')+"' style='text-align:center;width:80px;"+ms.tdStyle(formId, 'T2#NAME')+"' "+ms.tdEvent(formId, 'T2#NAME')+">")
            arrHtml.push("<span colno='T2#NAME' class='"+ms.uiClass(formId, 'T2#NAME')+"' style='"+ms.uiStyle(formId, 'T2#NAME')+"' "+ms.uiEvent(formId, 'T2#NAME')+" >"+v['T2#NAME']+"</span>")
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
    //setTableWidth(formId);
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
    
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//辅料履历
function itemJump1(obj){
      winOptMethod.jump("c4d83196ce8d43b59a659770faab3b00","F3830","jumpId",obj);
}  


//辅料制具料号
function itemJump2(obj){
    winOptMethod.jump("8d8dfef2f0e140e88073f6cdad4b431d","F3722","jumpId",obj);
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