<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="产品不良信息" />
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
		<bu:header formId ="6587fb2a1c54437cb98b5146ebf8cfbc"/>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="5d5a4065eb404c01aba139984a37bb85" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
		<bu:search viewId="5d5a4065eb404c01aba139984a37bb85" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6587fb2a1c54437cb98b5146ebf8cfbc" id="formPage6587fb2a1c54437cb98b5146ebf8cfbc" value="${formPage6587fb2a1c54437cb98b5146ebf8cfbc}"/>
		<input type="hidden" name="formId" id="formId1" value='6587fb2a1c54437cb98b5146ebf8cfbc'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6587fb2a1c54437cb98b5146ebf8cfbc">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6587fb2a1c54437cb98b5146ebf8cfbc" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6587fb2a1c54437cb98b5146ebf8cfbc">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6587fb2a1c54437cb98b5146ebf8cfbc" style="min-width:1740px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6587fb2a1c54437cb98b5146ebf8cfbc" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6587fb2a1c54437cb98b5146ebf8cfbc" onclick="_selectAjaxTableAllData(this,'6587fb2a1c54437cb98b5146ebf8cfbc')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WE_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WE_AREA_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WE_REPAIR_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WE_MO_NUMBER" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WE_MODEL_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WE_MODEL_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WE_MODEL_STANDARD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WE_PROCESS_FACE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WE_ERROR_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WE_ERROR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WE_POINT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WE_POINT_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WE_ERROR_NUM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WE_TEST_EMP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WE_TEST_TIME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6587fb2a1c54437cb98b5146ebf8cfbc" onscroll="ajaxTableScroll(this,'6587fb2a1c54437cb98b5146ebf8cfbc')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6587fb2a1c54437cb98b5146ebf8cfbc" style="min-width:1720px;">
		<tbody id="tbody_6587fb2a1c54437cb98b5146ebf8cfbc" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6587fb2a1c54437cb98b5146ebf8cfbc==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6587fb2a1c54437cb98b5146ebf8cfbc&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="5d5a4065eb404c01aba139984a37bb85" />
		     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="5d5a4065eb404c01aba139984a37bb85" />
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>		
 
<script>
var isFirstSetScroll=0;
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='6587fb2a1c54437cb98b5146ebf8cfbc'){<%--产品不良信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='WE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WE_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'WE_SN')+"' "+ms.tdEvent(formId, 'WE_SN')+">")
            arrHtml.push("<span colno='WE_SN' class='"+ms.uiClass(formId, 'WE_SN')+"' onclick='itemJump1(\""+v['WE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WE_SN')+" title='"+ms.titleAttr(formId,'WE_SN','IS_TITLE_ATTR',v)+"' >"+v['WE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'WE_AREA_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'WE_AREA_SN')+"' "+ms.tdEvent(formId, 'WE_AREA_SN')+">")
            arrHtml.push("<span colno='WE_AREA_SN' class='"+ms.uiClass(formId, 'WE_AREA_SN')+"' style='"+ms.uiStyle(formId, 'WE_AREA_SN')+"' "+ms.uiEvent(formId, 'WE_AREA_SN')+" title='"+ms.titleAttr(formId,'WE_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['WE_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_REPAIR_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WE_REPAIR_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WE_REPAIR_FLAG')+"' "+ms.tdEvent(formId, 'WE_REPAIR_FLAG')+">")
            arrHtml.push("<span colno='WE_REPAIR_FLAG' class='"+ms.uiClass(formId, 'WE_REPAIR_FLAG')+"' style='"+ms.uiStyle(formId, 'WE_REPAIR_FLAG')+"' "+ms.uiEvent(formId, 'WE_REPAIR_FLAG')+" >"+v['WE_REPAIR_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WE_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'WE_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WE_MO_NUMBER')+">")
            arrHtml.push("<span colno='WE_MO_NUMBER' class='"+ms.uiClass(formId, 'WE_MO_NUMBER')+"' onclick='itemJump2(\""+v['WE_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WE_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WE_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WE_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WE_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WE_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WE_MODEL_CODE')+">")
            arrHtml.push("<span colno='WE_MODEL_CODE' class='"+ms.uiClass(formId, 'WE_MODEL_CODE')+"' onclick='itemJump3(\""+v['WE_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WE_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WE_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WE_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WE_MODEL_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WE_MODEL_NAME')+"' "+ms.tdEvent(formId, 'WE_MODEL_NAME')+">")
            arrHtml.push("<span colno='WE_MODEL_NAME' class='"+ms.uiClass(formId, 'WE_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'WE_MODEL_NAME')+"' "+ms.uiEvent(formId, 'WE_MODEL_NAME')+" title='"+ms.titleAttr(formId,'WE_MODEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['WE_MODEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MODEL_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'WE_MODEL_STANDARD')+"' style='width:110px;"+ms.tdStyle(formId, 'WE_MODEL_STANDARD')+"' "+ms.tdEvent(formId, 'WE_MODEL_STANDARD')+">")
            arrHtml.push("<span colno='WE_MODEL_STANDARD' class='"+ms.uiClass(formId, 'WE_MODEL_STANDARD')+"' style='"+ms.uiStyle(formId, 'WE_MODEL_STANDARD')+"' "+ms.uiEvent(formId, 'WE_MODEL_STANDARD')+" title='"+ms.titleAttr(formId,'WE_MODEL_STANDARD','IS_TITLE_ATTR',v)+"' >"+v['WE_MODEL_STANDARD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WE_PROCESS_FACE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WE_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WE_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WE_PROCESS_FACE' class='"+ms.uiClass(formId, 'WE_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WE_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WE_PROCESS_FACE')+" >"+v['WE_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_ERROR_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_CODE')+"' style='width:110px;"+ms.tdStyle(formId, 'WE_ERROR_CODE')+"' "+ms.tdEvent(formId, 'WE_ERROR_CODE')+">")
            arrHtml.push("<span colno='WE_ERROR_CODE' class='"+ms.uiClass(formId, 'WE_ERROR_CODE')+"' onclick='itemJump4(\""+v['WE_ERROR_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WE_ERROR_CODE')+" title='"+ms.titleAttr(formId,'WE_ERROR_CODE','IS_TITLE_ATTR',v)+"' >"+v['WE_ERROR_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_ERROR_DESC' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_DESC')+"' style='width:110px;"+ms.tdStyle(formId, 'WE_ERROR_DESC')+"' "+ms.tdEvent(formId, 'WE_ERROR_DESC')+">")
            arrHtml.push("<span colno='WE_ERROR_DESC' class='"+ms.uiClass(formId, 'WE_ERROR_DESC')+"' style='"+ms.uiStyle(formId, 'WE_ERROR_DESC')+"' "+ms.uiEvent(formId, 'WE_ERROR_DESC')+" title='"+ms.titleAttr(formId,'WE_ERROR_DESC','IS_TITLE_ATTR',v)+"' >"+v['WE_ERROR_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WE_POINT')+"' style='width:70px;"+ms.tdStyle(formId, 'WE_POINT')+"' "+ms.tdEvent(formId, 'WE_POINT')+">")
            arrHtml.push("<span colno='WE_POINT' class='"+ms.uiClass(formId, 'WE_POINT')+"' style='"+ms.uiStyle(formId, 'WE_POINT')+"' "+ms.uiEvent(formId, 'WE_POINT')+" title='"+ms.titleAttr(formId,'WE_POINT','IS_TITLE_ATTR',v)+"' >"+v['WE_POINT']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WE_POINT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WE_POINT_COUNT')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WE_POINT_COUNT')+"' "+ms.tdEvent(formId, 'WE_POINT_COUNT')+">")
            arrHtml.push("<span colno='WE_POINT_COUNT' class='"+ms.uiClass(formId, 'WE_POINT_COUNT')+"' style='"+ms.uiStyle(formId, 'WE_POINT_COUNT')+"' "+ms.uiEvent(formId, 'WE_POINT_COUNT')+" title='"+ms.titleAttr(formId,'WE_POINT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WE_POINT_COUNT']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WE_ERROR_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WE_ERROR_NUM')+"' "+ms.tdEvent(formId, 'WE_ERROR_NUM')+">")
            arrHtml.push("<span colno='WE_ERROR_NUM' class='"+ms.uiClass(formId, 'WE_ERROR_NUM')+"' style='"+ms.uiStyle(formId, 'WE_ERROR_NUM')+"' "+ms.uiEvent(formId, 'WE_ERROR_NUM')+" >"+v['WE_ERROR_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_TEST_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WE_TEST_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WE_TEST_EMP')+"' "+ms.tdEvent(formId, 'WE_TEST_EMP')+">")
            arrHtml.push("<span colno='WE_TEST_EMP' class='"+ms.uiClass(formId, 'WE_TEST_EMP')+"' style='"+ms.uiStyle(formId, 'WE_TEST_EMP')+"' "+ms.uiEvent(formId, 'WE_TEST_EMP')+" title='"+ms.titleAttr(formId,'WE_TEST_EMP','IS_TITLE_ATTR',v)+"' >"+v['WE_TEST_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_TEST_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WE_TEST_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WE_TEST_TIME')+"' "+ms.tdEvent(formId, 'WE_TEST_TIME')+">")
            arrHtml.push("<span colno='WE_TEST_TIME' class='"+ms.uiClass(formId, 'WE_TEST_TIME')+"' style='"+ms.uiStyle(formId, 'WE_TEST_TIME')+"' "+ms.uiEvent(formId, 'WE_TEST_TIME')+" title='"+ms.titleAttr(formId,'WE_TEST_TIME','IS_TITLE_ATTR',v)+"' >"+v['WE_TEST_TIME']+"</span>")
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
   // setTableWidth(formId);
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
}



function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                     $("#WE_TEST_TIME_BEGIN").val(timeBeginString());
    
                    $("#WE_TEST_TIME_END").val(timeEndString());
                    listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
                 /*
    function timeBeginString(){
			var datetime = new Date();
			//datetime.setDate(datetime.getDate()-360);
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth()+ 1 ;
			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
			if(0>=date<=7){
			  //  console.log(getEndDay());
			    date=getEndDay(date);
			    var month = datetime.getMonth()  < 10 ? "0" + (datetime.getMonth() ) : datetime.getMonth() ;
			    if(month==12){
			        year = datetime.getFullYear()-1;
			    }
			}
		//	date =date < 10 ? "0" + date : date;
			//console.log("date:"+date);
			return year + "-" + month + "-" + date +" 00:00:00";
	}

	function timeEndString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()+360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		return year + "-" + month + "-" + date +" 23:59:59";
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
   return Number(days)+Number(date1)-7;
}
*/
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

//产品追溯
function itemJump1(obj){
      winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//BOM管理
function itemJump3(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 

//不良代码
function itemJump4(obj){
  winOptMethod.jump("0ca7cd10e18b43bfb72a9e038bc9e16b","F5485","jumpId",obj);
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