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
		<dict:lang value="VM-采购单管理NEW" />
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
		<bu:header formId ="f961ef99b03c4536a66dc8f3ddcca076"/>

    
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
		<bu:func viewId="3465c822bb554b43af180b6def3cd860" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="3465c822bb554b43af180b6def3cd860" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagef961ef99b03c4536a66dc8f3ddcca076" id="formPagef961ef99b03c4536a66dc8f3ddcca076" value="${formPagef961ef99b03c4536a66dc8f3ddcca076}"/>
		<input type="hidden" name="formId" id="formId1" value='f961ef99b03c4536a66dc8f3ddcca076'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="f961ef99b03c4536a66dc8f3ddcca076">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf961ef99b03c4536a66dc8f3ddcca076" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerf961ef99b03c4536a66dc8f3ddcca076">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef961ef99b03c4536a66dc8f3ddcca076" style="min-width:1320px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="f961ef99b03c4536a66dc8f3ddcca076" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_f961ef99b03c4536a66dc8f3ddcca076" onclick="_selectAjaxTableAllData(this,'f961ef99b03c4536a66dc8f3ddcca076')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="DATA_AUTH" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WPD_PO" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WPD_ITEM_CODE" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WPD_ITEM_SEQ" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WPD_ITEM_NAME" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WPD_ITEM_SPEC" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="T2#WPI_STATUS" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T3#SUPPLIER_NAME" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WPD_PLAN_NUM" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WPD_RECEIVE_NUM" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T4#NAME" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#WPI_CREATE_TIME" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivf961ef99b03c4536a66dc8f3ddcca076" onscroll="ajaxTableScroll(this,'f961ef99b03c4536a66dc8f3ddcca076')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxf961ef99b03c4536a66dc8f3ddcca076" style="min-width:1320px;">
		<tbody id="tbody_f961ef99b03c4536a66dc8f3ddcca076" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagef961ef99b03c4536a66dc8f3ddcca076==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=f961ef99b03c4536a66dc8f3ddcca076&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3465c822bb554b43af180b6def3cd860" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3465c822bb554b43af180b6def3cd860" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function reloadPg(msg,title,width,height,time,isCloseWin){
    	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    }
function reloadPgExeAx(isCloseWin){
  	query("formId1");//alert(_currentFrame);
  	//document.getElementById(_currentFrame).contentWindow.clearInfo();
  	//window.frames[_currentFrame].document.getElementByIdx_x("addItemInfo").empty();
  	//window.top.$("#addItemInfo").empty();console.log(window.top);
  	
  	//$("#popupFrameFpId")[0].contentWindow().clearInfo();
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}else{
  	    top.document.getElementById("popupFrameFpId").contentWindow.getItemByPo();
  	}
   	//checkboxAll("joblist");
}
    function reloadPgExe(isCloseWin){
    	/* document.forms.search_form.submit();
    	util.showTopLoading(); */
    	query("formId1");
    	if ("0" == isCloseWin || undefined == isCloseWin) {
      		top.$(".dialog-close").click();
    	}
    	//checkboxAll("joblist");
}



<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='f961ef99b03c4536a66dc8f3ddcca076'){<%--FM-采购单明细信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:150px;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='WPD_PO' class='datagrid-cell "+ms.tdClass(formId, 'WPD_PO')+"' style='width:150px;"+ms.tdStyle(formId, 'WPD_PO')+"' "+ms.tdEvent(formId, 'WPD_PO')+">")
            arrHtml.push("<span colno='WPD_PO' class='"+ms.uiClass(formId, 'WPD_PO')+"' onclick='itemJump1(\""+v['WPD_PO']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WPD_PO')+" title='"+ms.titleAttr(formId,'WPD_PO','IS_TITLE_ATTR',v)+"' >"+v['WPD_PO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WPD_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WPD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WPD_ITEM_CODE')+">")
            arrHtml.push("<span colno='WPD_ITEM_CODE' class='"+ms.uiClass(formId, 'WPD_ITEM_CODE')+"' onclick='itemJump2(\""+v['WPD_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WPD_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WPD_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WPD_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPD_ITEM_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WPD_ITEM_SEQ')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WPD_ITEM_SEQ')+"' "+ms.tdEvent(formId, 'WPD_ITEM_SEQ')+">")
            arrHtml.push("<span colno='WPD_ITEM_SEQ' class='"+ms.uiClass(formId, 'WPD_ITEM_SEQ')+"' style='"+ms.uiStyle(formId, 'WPD_ITEM_SEQ')+"' "+ms.uiEvent(formId, 'WPD_ITEM_SEQ')+" title='"+ms.titleAttr(formId,'WPD_ITEM_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WPD_ITEM_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPD_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WPD_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WPD_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WPD_ITEM_NAME')+">")
            arrHtml.push("<span colno='WPD_ITEM_NAME' class='"+ms.uiClass(formId, 'WPD_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WPD_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WPD_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WPD_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WPD_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPD_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WPD_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'WPD_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WPD_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WPD_ITEM_SPEC' class='"+ms.uiClass(formId, 'WPD_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WPD_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WPD_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WPD_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WPD_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WPI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'T2#WPI_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'T2#WPI_STATUS')+"' "+ms.tdEvent(formId, 'T2#WPI_STATUS')+">")
            arrHtml.push("<span colno='T2#WPI_STATUS' class='"+ms.uiClass(formId, 'T2#WPI_STATUS')+"' style='"+ms.uiStyle(formId, 'T2#WPI_STATUS')+"' "+ms.uiEvent(formId, 'T2#WPI_STATUS')+" title='"+ms.titleAttr(formId,'T2#WPI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['T2#WPI_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#SUPPLIER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#SUPPLIER_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'T3#SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'T3#SUPPLIER_NAME')+">")
            arrHtml.push("<span colno='T3#SUPPLIER_NAME' class='"+ms.uiClass(formId, 'T3#SUPPLIER_NAME')+"' style='"+ms.uiStyle(formId, 'T3#SUPPLIER_NAME')+"' "+ms.uiEvent(formId, 'T3#SUPPLIER_NAME')+" title='"+ms.titleAttr(formId,'T3#SUPPLIER_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#SUPPLIER_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPD_PLAN_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WPD_PLAN_NUM')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'WPD_PLAN_NUM')+"' "+ms.tdEvent(formId, 'WPD_PLAN_NUM')+">")
            arrHtml.push("<span colno='WPD_PLAN_NUM' class='"+ms.uiClass(formId, 'WPD_PLAN_NUM')+"' style='"+ms.uiStyle(formId, 'WPD_PLAN_NUM')+"' "+ms.uiEvent(formId, 'WPD_PLAN_NUM')+" title='"+ms.titleAttr(formId,'WPD_PLAN_NUM','IS_TITLE_ATTR',v)+"' >"+v['WPD_PLAN_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPD_RECEIVE_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WPD_RECEIVE_NUM')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'WPD_RECEIVE_NUM')+"' "+ms.tdEvent(formId, 'WPD_RECEIVE_NUM')+">")
            arrHtml.push("<span colno='WPD_RECEIVE_NUM' class='"+ms.uiClass(formId, 'WPD_RECEIVE_NUM')+"' style='"+ms.uiStyle(formId, 'WPD_RECEIVE_NUM')+"' "+ms.uiEvent(formId, 'WPD_RECEIVE_NUM')+" title='"+ms.titleAttr(formId,'WPD_RECEIVE_NUM','IS_TITLE_ATTR',v)+"' >"+v['WPD_RECEIVE_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T4#NAME')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'T4#NAME')+"' "+ms.tdEvent(formId, 'T4#NAME')+">")
            arrHtml.push("<span colno='T4#NAME' class='"+ms.uiClass(formId, 'T4#NAME')+"' style='"+ms.uiStyle(formId, 'T4#NAME')+"' "+ms.uiEvent(formId, 'T4#NAME')+" title='"+ms.titleAttr(formId,'T4#NAME','IS_TITLE_ATTR',v)+"' >"+v['T4#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WPI_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'T2#WPI_CREATE_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'T2#WPI_CREATE_TIME')+"' "+ms.tdEvent(formId, 'T2#WPI_CREATE_TIME')+">")
            arrHtml.push("<span colno='T2#WPI_CREATE_TIME' class='"+ms.uiClass(formId, 'T2#WPI_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'T2#WPI_CREATE_TIME')+"' "+ms.uiEvent(formId, 'T2#WPI_CREATE_TIME')+" title='"+ms.titleAttr(formId,'T2#WPI_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['T2#WPI_CREATE_TIME']+"</span>")
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
                    var jumpId = $("#jumpId").val();  
                    console.log(1);
              		if(jumpId!=""){
                    $("#WPD_PO").val(jumpId);
                  
                    }     
                    if(jumpId==''){
                    $(document.getElementById('T2#WAD_CREATE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('T2#WAD_CREATE_TIME_END')).val(timeEndString());
                     }
                    $(document.getElementById('T2#WPI_CREATE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('T2#WPI_CREATE_TIME_END')).val(timeEndString());
                     //$(document.getElementById('WMI_BAKE_STATE')).val('3');
                    listAjaxTable($("#formId1").val());
                    
                 }
            function timeBeginString(){
			var datetime = new Date();
			//datetime.setDate(datetime.getDate()-360);
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth()+ 1 ;
			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
			date =date < 10 ? "0" + date : date;
			if(0>=date<=30){
			  //  console.log(getEndDay());
			    date=getEndDay(date);
			    month = datetime.getMonth()  < 10 ? "0" + (datetime.getMonth() ) : datetime.getMonth() ;
			}
			return year + "-" + month + "-" + date +" 00:00:00";
	}

	function timeEndString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()+360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		
		return year + "-" + month + "-" + date +" 23:59:59";
		//return year + "-" + month + "-" + date;
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

//采购入库
function itemJump1(obj){
      winOptMethod.jump("db26ac43455245b8a8c60f8d3cc69ac9","F6712","jumpId",obj);
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
