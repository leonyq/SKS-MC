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
		<dict:lang value="VM-MSD物料作业日志" />
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
		<bu:header formId ="290809fe2e144a05aec1149bcd2e2840"/>

    
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
		<bu:func viewId="9d08f2000ba34d05bcc700706532326a" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="9d08f2000ba34d05bcc700706532326a" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage290809fe2e144a05aec1149bcd2e2840" id="formPage290809fe2e144a05aec1149bcd2e2840" value="${formPage290809fe2e144a05aec1149bcd2e2840}"/>
		<input type="hidden" name="formId" id="formId1" value='290809fe2e144a05aec1149bcd2e2840'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="290809fe2e144a05aec1149bcd2e2840">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax290809fe2e144a05aec1149bcd2e2840" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner290809fe2e144a05aec1149bcd2e2840">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable290809fe2e144a05aec1149bcd2e2840">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="290809fe2e144a05aec1149bcd2e2840" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_290809fe2e144a05aec1149bcd2e2840" onclick="_selectAjaxTableAllData(this,'290809fe2e144a05aec1149bcd2e2840')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="DATA_AUTH" formId="290809fe2e144a05aec1149bcd2e2840" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMT_ITEM_SN" formId="290809fe2e144a05aec1149bcd2e2840" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMT_ITEM_CODE" formId="290809fe2e144a05aec1149bcd2e2840" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T2#CI_ITEM_NAME" formId="290809fe2e144a05aec1149bcd2e2840" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="290809fe2e144a05aec1149bcd2e2840" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WMT_OPERATE_TYPE" formId="290809fe2e144a05aec1149bcd2e2840" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WMT_OPERATE_TIME" formId="290809fe2e144a05aec1149bcd2e2840" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WMT_OPERATE_EMP" formId="290809fe2e144a05aec1149bcd2e2840" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv290809fe2e144a05aec1149bcd2e2840" onscroll="ajaxTableScroll(this,'290809fe2e144a05aec1149bcd2e2840')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax290809fe2e144a05aec1149bcd2e2840">
		<tbody id="tbody_290809fe2e144a05aec1149bcd2e2840" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage290809fe2e144a05aec1149bcd2e2840==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=290809fe2e144a05aec1149bcd2e2840&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="9d08f2000ba34d05bcc700706532326a" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="9d08f2000ba34d05bcc700706532326a" />
    
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
    if(formId=='290809fe2e144a05aec1149bcd2e2840'){<%--FM-MSD物料作业日志--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v['DATA_AUTH']+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMT_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WMT_ITEM_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WMT_ITEM_SN')+"' "+ms.tdEvent(formId, 'WMT_ITEM_SN')+">")
            arrHtml.push("<span colno='WMT_ITEM_SN' class='"+ms.uiClass(formId, 'WMT_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WMT_ITEM_SN')+"' "+ms.uiEvent(formId, 'WMT_ITEM_SN')+" title='"+v['WMT_ITEM_SN']+"' >"+v['WMT_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMT_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WMT_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WMT_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WMT_ITEM_CODE')+">")
            arrHtml.push("<span colno='WMT_ITEM_CODE' class='"+ms.uiClass(formId, 'WMT_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WMT_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WMT_ITEM_CODE')+" title='"+v['WMT_ITEM_CODE']+"' >"+v['WMT_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_NAME')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T2#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_NAME')+" title='"+v['T2#CI_ITEM_NAME']+"' >"+v['T2#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_SPEC')+"' style='width:120px;"+ms.tdStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T2#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_SPEC')+" title='"+v['T2#CI_ITEM_SPEC']+"' >"+v['T2#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMT_OPERATE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WMT_OPERATE_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WMT_OPERATE_TYPE')+"' "+ms.tdEvent(formId, 'WMT_OPERATE_TYPE')+">")
            arrHtml.push("<span colno='WMT_OPERATE_TYPE' class='"+ms.uiClass(formId, 'WMT_OPERATE_TYPE')+"' style='"+ms.uiStyle(formId, 'WMT_OPERATE_TYPE')+"' "+ms.uiEvent(formId, 'WMT_OPERATE_TYPE')+" title='"+v['WMT_OPERATE_TYPE']+"' >"+v['WMT_OPERATE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMT_OPERATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WMT_OPERATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WMT_OPERATE_TIME')+"' "+ms.tdEvent(formId, 'WMT_OPERATE_TIME')+">")
            arrHtml.push("<span colno='WMT_OPERATE_TIME' class='"+ms.uiClass(formId, 'WMT_OPERATE_TIME')+"' style='"+ms.uiStyle(formId, 'WMT_OPERATE_TIME')+"' "+ms.uiEvent(formId, 'WMT_OPERATE_TIME')+" title='"+v['WMT_OPERATE_TIME']+"' >"+v['WMT_OPERATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMT_OPERATE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WMT_OPERATE_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WMT_OPERATE_EMP')+"' "+ms.tdEvent(formId, 'WMT_OPERATE_EMP')+">")
            arrHtml.push("<span colno='WMT_OPERATE_EMP' class='"+ms.uiClass(formId, 'WMT_OPERATE_EMP')+"' style='"+ms.uiStyle(formId, 'WMT_OPERATE_EMP')+"' "+ms.uiEvent(formId, 'WMT_OPERATE_EMP')+" title='"+v['WMT_OPERATE_EMP']+"' >"+v['WMT_OPERATE_EMP']+"</span>")
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
<script type="text/javascript">
$(function(){
    init();
})
function init(){
                var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WMT_ITEM_SN").val(jumpId);
                  
                  }
                  if(jumpId==''){
        $(document.getElementById('WMT_OPERATE_TIME_BEGIN')).val(timeBeginString());
        $(document.getElementById('WMT_OPERATE_TIME_END')).val(timeEndString());
        }
        listAjaxTable($("#formId1").val());
        
                
 }
            function timeBeginString(){
    			var datetime = new Date();
    			datetime.setDate(datetime.getDate()-7);
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			return year + "-" + month + "-" + date+" "+"00:"+"00:"+"00";
    		}
    
    		function timeEndString(){
    			var datetime = new Date();
    			
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			
    			return year + "-" + month + "-" + date+" "+"23:"+"59:"+"59";
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
