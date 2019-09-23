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
		<dict:lang value="仓库物料冻结列表" />
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
		<bu:header formId ="d67504b364614451ae814526364a482c"/>

    
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
		<bu:func viewId="0cb723444e80436b97bcc708618b4a19" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="0cb723444e80436b97bcc708618b4a19" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPaged67504b364614451ae814526364a482c" id="formPaged67504b364614451ae814526364a482c" value="${formPaged67504b364614451ae814526364a482c}"/>
		<input type="hidden" name="formId" id="formId1" value='d67504b364614451ae814526364a482c'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="dataAuth" name="dataAuth" value='${sessionScope.mcDataAuth}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="d67504b364614451ae814526364a482c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxd67504b364614451ae814526364a482c">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-innerd67504b364614451ae814526364a482c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabled67504b364614451ae814526364a482c">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d67504b364614451ae814526364a482c" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_d67504b364614451ae814526364a482c" onclick="_selectAjaxTableAllData(this,'d67504b364614451ae814526364a482c')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_SN" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WFI_FREEZE_FLAG" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WFI_NUM" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_ITEM_CODE" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_ITEM_NAME" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_ITEM_SPEC" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WFI_LOT" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WFI_CUST_CODE" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WFI_SUP_CODE" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_FREEZE_MEMO" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_FREEZE_TIME" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WFI_FREEZE_EMP" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_THAW_TIME" formId="d67504b364614451ae814526364a482c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WFI_THAW_EMP" formId="d67504b364614451ae814526364a482c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivd67504b364614451ae814526364a482c" onscroll="ajaxTableScroll(this,'d67504b364614451ae814526364a482c')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxd67504b364614451ae814526364a482c" > <!-- style="min-width:1750px;" -->
		<tbody id="tbody_d67504b364614451ae814526364a482c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPaged67504b364614451ae814526364a482c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=d67504b364614451ae814526364a482c&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="0cb723444e80436b97bcc708618b4a19" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0cb723444e80436b97bcc708618b4a19" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
<%--生成异步表格--%>
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

 function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    $(document.getElementById('WFI_FREEZE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('WFI_FREEZE_TIME_END')).val(timeEndString());
                     
                    listAjaxTable($("#formId1").val());
                    
                 }


function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='d67504b364614451ae814526364a482c'){<%--仓库物料冻结信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> </td>");
            arrHtml.push("<td colno='WFI_SN' class='datagrid-cell "+ms.tdClass(formId, 'WFI_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WFI_SN')+"' "+ms.tdEvent(formId, 'WFI_SN')+">")
            arrHtml.push("<span colno='WFI_SN' class='"+ms.uiClass(formId, 'WFI_SN')+"' onclick='itemJump1(\""+v['WFI_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WFI_SN')+" title='"+ms.titleAttr(formId,'WFI_SN','IS_TITLE_ATTR',v)+"' >"+v['WFI_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_FREEZE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WFI_FREEZE_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WFI_FREEZE_FLAG')+"' "+ms.tdEvent(formId, 'WFI_FREEZE_FLAG')+">")
            arrHtml.push("<span colno='WFI_FREEZE_FLAG' class='"+ms.uiClass(formId, 'WFI_FREEZE_FLAG')+"' style='"+ms.uiStyle(formId, 'WFI_FREEZE_FLAG')+"' "+ms.uiEvent(formId, 'WFI_FREEZE_FLAG')+" title='"+ms.titleAttr(formId,'WFI_FREEZE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WFI_FREEZE_FLAG']+"</span>")
            arrHtml.push("<input type='hidden' id='WH_CODE_"+v.ID+"' value='"+v['WFI_WH_CODE']+"' /></td>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WFI_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WFI_NUM')+"' "+ms.tdEvent(formId, 'WFI_NUM')+">")
            arrHtml.push("<span colno='WFI_NUM' class='"+ms.uiClass(formId, 'WFI_NUM')+"' style='"+ms.uiStyle(formId, 'WFI_NUM')+"' "+ms.uiEvent(formId, 'WFI_NUM')+" title='"+ms.titleAttr(formId,'WFI_NUM','IS_TITLE_ATTR',v)+"' >"+v['WFI_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WFI_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WFI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WFI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WFI_ITEM_CODE' class='"+ms.uiClass(formId, 'WFI_ITEM_CODE')+"' onclick='itemJump2(\""+v['WFI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WFI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WFI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WFI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WFI_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WFI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WFI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WFI_ITEM_NAME' class='"+ms.uiClass(formId, 'WFI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WFI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WFI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WFI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WFI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WFI_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WFI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WFI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WFI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WFI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WFI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WFI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WFI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WFI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WFI_LOT')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WFI_LOT')+"' "+ms.tdEvent(formId, 'WFI_LOT')+">")
            arrHtml.push("<span colno='WFI_LOT' class='"+ms.uiClass(formId, 'WFI_LOT')+"' style='"+ms.uiStyle(formId, 'WFI_LOT')+"' "+ms.uiEvent(formId, 'WFI_LOT')+" title='"+ms.titleAttr(formId,'WFI_LOT','IS_TITLE_ATTR',v)+"' >"+v['WFI_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WFI_CUST_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WFI_CUST_CODE')+"' "+ms.tdEvent(formId, 'WFI_CUST_CODE')+">")
            arrHtml.push("<span colno='WFI_CUST_CODE' class='"+ms.uiClass(formId, 'WFI_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WFI_CUST_CODE')+"' "+ms.uiEvent(formId, 'WFI_CUST_CODE')+" title='"+ms.titleAttr(formId,'WFI_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WFI_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WFI_SUP_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WFI_SUP_CODE')+"' "+ms.tdEvent(formId, 'WFI_SUP_CODE')+">")
            arrHtml.push("<span colno='WFI_SUP_CODE' class='"+ms.uiClass(formId, 'WFI_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WFI_SUP_CODE')+"' "+ms.uiEvent(formId, 'WFI_SUP_CODE')+" title='"+ms.titleAttr(formId,'WFI_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WFI_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_FREEZE_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WFI_FREEZE_MEMO')+"' style='width:150px;"+ms.tdStyle(formId, 'WFI_FREEZE_MEMO')+"' "+ms.tdEvent(formId, 'WFI_FREEZE_MEMO')+">")
            arrHtml.push("<span colno='WFI_FREEZE_MEMO' class='"+ms.uiClass(formId, 'WFI_FREEZE_MEMO')+"' style='"+ms.uiStyle(formId, 'WFI_FREEZE_MEMO')+"' "+ms.uiEvent(formId, 'WFI_FREEZE_MEMO')+" title='"+ms.titleAttr(formId,'WFI_FREEZE_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WFI_FREEZE_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_FREEZE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WFI_FREEZE_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WFI_FREEZE_TIME')+"' "+ms.tdEvent(formId, 'WFI_FREEZE_TIME')+">")
            arrHtml.push("<span colno='WFI_FREEZE_TIME' class='"+ms.uiClass(formId, 'WFI_FREEZE_TIME')+"' style='"+ms.uiStyle(formId, 'WFI_FREEZE_TIME')+"' "+ms.uiEvent(formId, 'WFI_FREEZE_TIME')+" title='"+ms.titleAttr(formId,'WFI_FREEZE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WFI_FREEZE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_FREEZE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WFI_FREEZE_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WFI_FREEZE_EMP')+"' "+ms.tdEvent(formId, 'WFI_FREEZE_EMP')+">")
            arrHtml.push("<span colno='WFI_FREEZE_EMP' class='"+ms.uiClass(formId, 'WFI_FREEZE_EMP')+"' style='"+ms.uiStyle(formId, 'WFI_FREEZE_EMP')+"' "+ms.uiEvent(formId, 'WFI_FREEZE_EMP')+" title='"+ms.titleAttr(formId,'WFI_FREEZE_EMP','IS_TITLE_ATTR',v)+"' >"+v['WFI_FREEZE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_THAW_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WFI_THAW_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WFI_THAW_TIME')+"' "+ms.tdEvent(formId, 'WFI_THAW_TIME')+">")
            arrHtml.push("<span colno='WFI_THAW_TIME' class='"+ms.uiClass(formId, 'WFI_THAW_TIME')+"' style='"+ms.uiStyle(formId, 'WFI_THAW_TIME')+"' "+ms.uiEvent(formId, 'WFI_THAW_TIME')+" title='"+ms.titleAttr(formId,'WFI_THAW_TIME','IS_TITLE_ATTR',v)+"' >"+v['WFI_THAW_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_THAW_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WFI_THAW_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WFI_THAW_EMP')+"' "+ms.tdEvent(formId, 'WFI_THAW_EMP')+">")
            arrHtml.push("<span colno='WFI_THAW_EMP' class='"+ms.uiClass(formId, 'WFI_THAW_EMP')+"' style='"+ms.uiStyle(formId, 'WFI_THAW_EMP')+"' "+ms.uiEvent(formId, 'WFI_THAW_EMP')+" title='"+ms.titleAttr(formId,'WFI_THAW_EMP','IS_TITLE_ATTR',v)+"' >"+v['WFI_THAW_EMP']+"</span>")
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
    //init();
})
//function init(){
 //                  
//      $(document.getElementById('WMI_RECEIVE_TIME_BEGIN')).val(timeBeginString());
//        $(document.getElementById('WMI_RECEIVE_TIME_END')).val(timeEndString());
//        listAjaxTable($("#formId1").val());
        
                
// }
 
 function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    $(document.getElementById('WFI_FREEZE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('WFI_FREEZE_TIME_END')).val(timeEndString());
                     //$(document.getElementById('WMI_BAKE_STATE')).val('3');
                    listAjaxTable($("#formId1").val());
                    
                 }
            function timeBeginString(){
    			var datetime = new Date();
    			datetime.setDate(datetime.getDate()-30);
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			return year + "-" + month + "-" + date+" 00:00:00";
    		}
    
    		function timeEndString(){
    			var datetime = new Date();
    			
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			
    			return year + "-" + month + "-" + date+" 23:59:59";
    		}
		function getEndDay(date1){
             //构造当前日期对象
           var date = new Date();
           var year = date.getFullYear();
            //获取当前月份
           var mouth = date.getMonth();
           var days;
           if (mouth == 2) {
               days = year %4 == 0 ? 29: 28;
           }else if(mouth == 1 || mouth == 3 || mouth == 5 || mouth == 7 ||mouth == 8 ||mouth == 8 ||mouth == 12){
               days = 31;
           }else{
               days = 30;
           }
           return Number(days)+Number(date1)-30;
        }

</script>

<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料追溯
function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  


//物料信息
function itemJump2(obj){
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
