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
		<dict:lang value="仓库报废物料列表" />
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
		<bu:header formId ="1aad990f8a774aeaa80d6b02a13a12ef"/>

    
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
		<bu:func viewId="7b8cfeadb9a0455b9e55bf4e69e0a32e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="7b8cfeadb9a0455b9e55bf4e69e0a32e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage1aad990f8a774aeaa80d6b02a13a12ef" id="formPage1aad990f8a774aeaa80d6b02a13a12ef" value="${formPage1aad990f8a774aeaa80d6b02a13a12ef}"/>
		<input type="hidden" name="formId" id="formId1" value='1aad990f8a774aeaa80d6b02a13a12ef'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="1aad990f8a774aeaa80d6b02a13a12ef">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1aad990f8a774aeaa80d6b02a13a12ef" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner1aad990f8a774aeaa80d6b02a13a12ef">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1aad990f8a774aeaa80d6b02a13a12ef" style="min-width: 1570px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="1aad990f8a774aeaa80d6b02a13a12ef" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_1aad990f8a774aeaa80d6b02a13a12ef" onclick="_selectAjaxTableAllData(this,'1aad990f8a774aeaa80d6b02a13a12ef')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width: 200px;"><bu:uitn colNo="DATA_AUTH" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="WSD_ITEM_SN" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="WSD_ITEM_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 80px;"><bu:uitn colNo="WSD_SCARP_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="WSD_ITEM_NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="WSD_ITEM_SPEC" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 100px;"><bu:uitn colNo="T2#WAD_WH_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 100px;"><bu:uitn colNo="T2#WAD_SCARP_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 80px;"><bu:uitn colNo="T2#WAD_CREATE_MAN" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="T2#WAD_CREATE_TIME" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<td class="datagrid-cell" ><bu:uitn colNo="T2#WAD_SCARP_REASON" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv1aad990f8a774aeaa80d6b02a13a12ef" onscroll="ajaxTableScroll(this,'1aad990f8a774aeaa80d6b02a13a12ef')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax1aad990f8a774aeaa80d6b02a13a12ef" style="min-width: 1570px;">
		<tbody id="tbody_1aad990f8a774aeaa80d6b02a13a12ef" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage1aad990f8a774aeaa80d6b02a13a12ef==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=1aad990f8a774aeaa80d6b02a13a12ef&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="7b8cfeadb9a0455b9e55bf4e69e0a32e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="7b8cfeadb9a0455b9e55bf4e69e0a32e" />
    
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
                    $(document.getElementById('T2#WAD_CREATE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('T2#WAD_CREATE_TIME_END')).val(timeEndString());
                     
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
    if(formId=='1aad990f8a774aeaa80d6b02a13a12ef'){<%--仓库报废单明细信息--%>
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
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='WSD_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSD_DOC_NUM')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSD_DOC_NUM')+"' "+ms.tdEvent(formId, 'WSD_DOC_NUM')+">")
            arrHtml.push("<span colno='WSD_DOC_NUM' class='"+ms.uiClass(formId, 'WSD_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WSD_DOC_NUM')+"' "+ms.uiEvent(formId, 'WSD_DOC_NUM')+" title='"+ms.titleAttr(formId,'WSD_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSD_DOC_NUM']+"</span>")
            arrHtml.push("<input type='hidden' id='WSD_DOC_NUM"+v.ID+"' value='"+v['WSD_DOC_NUM']+"' /></td>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSD_ITEM_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSD_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSD_ITEM_SN')+">")
            arrHtml.push("<span colno='WSD_ITEM_SN' class='"+ms.uiClass(formId, 'WSD_ITEM_SN')+"' onclick='itemJump1(\""+v['WSD_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WSD_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSD_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSD_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSD_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSD_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSD_ITEM_CODE' class='"+ms.uiClass(formId, 'WSD_ITEM_CODE')+"' onclick='itemJump2(\""+v['WSD_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WSD_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSD_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSD_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_SCARP_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSD_SCARP_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSD_SCARP_NUM')+"' "+ms.tdEvent(formId, 'WSD_SCARP_NUM')+">")
            arrHtml.push("<span colno='WSD_SCARP_NUM' class='"+ms.uiClass(formId, 'WSD_SCARP_NUM')+"' style='"+ms.uiStyle(formId, 'WSD_SCARP_NUM')+"' "+ms.uiEvent(formId, 'WSD_SCARP_NUM')+" title='"+ms.titleAttr(formId,'WSD_SCARP_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSD_SCARP_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSD_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSD_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WSD_ITEM_NAME')+">")
            arrHtml.push("<span colno='WSD_ITEM_NAME' class='"+ms.uiClass(formId, 'WSD_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WSD_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WSD_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WSD_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WSD_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WSD_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSD_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WSD_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WSD_ITEM_SPEC' class='"+ms.uiClass(formId, 'WSD_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WSD_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WSD_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WSD_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WSD_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#WA_AREA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T4#WA_AREA_NAME')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'T4#WA_AREA_NAME')+"' "+ms.tdEvent(formId, 'T4#WA_AREA_NAME')+">")
            arrHtml.push("<span colno='T4#WA_AREA_NAME' class='"+ms.uiClass(formId, 'T4#WA_AREA_NAME')+"' style='"+ms.uiStyle(formId, 'T4#WA_AREA_NAME')+"' "+ms.uiEvent(formId, 'T4#WA_AREA_NAME')+" title='"+ms.titleAttr(formId,'T4#WA_AREA_NAME','IS_TITLE_ATTR',v)+"' >"+v['T4#WA_AREA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WAD_SCARP_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WAD_SCARP_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'T2#WAD_SCARP_TYPE')+"' "+ms.tdEvent(formId, 'T2#WAD_SCARP_TYPE')+">")
            arrHtml.push("<span colno='T2#WAD_SCARP_TYPE' class='"+ms.uiClass(formId, 'T2#WAD_SCARP_TYPE')+"' style='"+ms.uiStyle(formId, 'T2#WAD_SCARP_TYPE')+"' "+ms.uiEvent(formId, 'T2#WAD_SCARP_TYPE')+" title='"+ms.titleAttr(formId,'T2#WAD_SCARP_TYPE','IS_TITLE_ATTR',v)+"' >"+v['T2#WAD_SCARP_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'T3#NAME')+"' "+ms.tdEvent(formId, 'T3#NAME')+">")
            arrHtml.push("<span colno='T3#NAME' class='"+ms.uiClass(formId, 'T3#NAME')+"' style='"+ms.uiStyle(formId, 'T3#NAME')+"' "+ms.uiEvent(formId, 'T3#NAME')+" title='"+ms.titleAttr(formId,'T3#NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WAD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'T2#WAD_CREATE_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'T2#WAD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'T2#WAD_CREATE_TIME')+">")
            arrHtml.push("<span colno='T2#WAD_CREATE_TIME' class='"+ms.uiClass(formId, 'T2#WAD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'T2#WAD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'T2#WAD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'T2#WAD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['T2#WAD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WAD_SCARP_REASON' class='datagrid-cell "+ms.tdClass(formId, 'T2#WAD_SCARP_REASON')+"' style='text-align:left;"+ms.tdStyle(formId, 'T2#WAD_SCARP_REASON')+"' "+ms.tdEvent(formId, 'T2#WAD_SCARP_REASON')+">")
            arrHtml.push("<span colno='T2#WAD_SCARP_REASON' class='"+ms.uiClass(formId, 'T2#WAD_SCARP_REASON')+"' style='"+ms.uiStyle(formId, 'T2#WAD_SCARP_REASON')+"' "+ms.uiEvent(formId, 'T2#WAD_SCARP_REASON')+" title='"+ms.titleAttr(formId,'T2#WAD_SCARP_REASON','IS_TITLE_ATTR',v)+"' >"+v['T2#WAD_SCARP_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WAD_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WAD_WH_CODE')+"' style='display:none;"+ms.tdStyle(formId, 'T2#WAD_WH_CODE')+"' "+ms.tdEvent(formId, 'T2#WAD_WH_CODE')+">")
            arrHtml.push("<span colno='T2#WAD_WH_CODE' class='"+ms.uiClass(formId, 'T2#WAD_WH_CODE')+"' style='"+ms.uiStyle(formId, 'T2#WAD_WH_CODE')+"' "+ms.uiEvent(formId, 'T2#WAD_WH_CODE')+" title='"+ms.titleAttr(formId,'T2#WAD_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['T2#WAD_WH_CODE']+"</span>")
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
                    $(document.getElementById('T2#WAD_CREATE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('T2#WAD_CREATE_TIME_END')).val(timeEndString());
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

//工序定义
function itemJump3(obj){
    winOptMethod.jump("b074327f728643948b734bce9a5f7fc9","F3158","jumpId",obj);
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
