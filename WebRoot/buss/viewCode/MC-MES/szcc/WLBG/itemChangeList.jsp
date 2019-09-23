<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="物料变更列表" />
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
		<bu:header formId ="2387cf6ddf684e6b9259dccd40aed2d6"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="e6b4dc8ebf5b43ca82cb02d7f19669ef" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="e6b4dc8ebf5b43ca82cb02d7f19669ef" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage2387cf6ddf684e6b9259dccd40aed2d6" id="formPage2387cf6ddf684e6b9259dccd40aed2d6" value="${formPage2387cf6ddf684e6b9259dccd40aed2d6}"/>
		<input type="hidden" name="formId" id="formId1" value='2387cf6ddf684e6b9259dccd40aed2d6'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="2387cf6ddf684e6b9259dccd40aed2d6">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2387cf6ddf684e6b9259dccd40aed2d6" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner2387cf6ddf684e6b9259dccd40aed2d6">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2387cf6ddf684e6b9259dccd40aed2d6">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="2387cf6ddf684e6b9259dccd40aed2d6" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_2387cf6ddf684e6b9259dccd40aed2d6" onclick="_selectAjaxTableAllData(this,'2387cf6ddf684e6b9259dccd40aed2d6')" style="cursor: pointer;"title="全选"/></span></td>
	    	<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WIC_ITEM_SN" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WIC_CHANGE_TYPE" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WIC_ORIGINAL_VALUE" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WIC_EXISTING_VALUE" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WIC_CHANGE_TIME" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WIC_CHANGE_EMP" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv2387cf6ddf684e6b9259dccd40aed2d6" onscroll="ajaxTableScroll(this,'2387cf6ddf684e6b9259dccd40aed2d6')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2387cf6ddf684e6b9259dccd40aed2d6">
		<tbody id="tbody_2387cf6ddf684e6b9259dccd40aed2d6" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage2387cf6ddf684e6b9259dccd40aed2d6==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=2387cf6ddf684e6b9259dccd40aed2d6&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="e6b4dc8ebf5b43ca82cb02d7f19669ef" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="e6b4dc8ebf5b43ca82cb02d7f19669ef" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
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
                    $(document.getElementById('WIC_CHANGE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('WIC_CHANGE_TIME_END')).val(timeEndString());
                     
                    listAjaxTable($("#formId1").val());
                    
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
    if(formId=='2387cf6ddf684e6b9259dccd40aed2d6'){<%--物料变更信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WIC_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WIC_ITEM_SN')+"' style='width:200px; "+ms.tdStyle(formId, 'WIC_ITEM_SN')+"' "+ms.tdEvent(formId, 'WIC_ITEM_SN')+">")
            arrHtml.push("<span colno='WIC_ITEM_SN' class='"+ms.uiClass(formId, 'WIC_ITEM_SN')+"' onclick='itemJump1(\""+v['WIC_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WIC_ITEM_SN')+" title='"+ms.titleAttr(formId,'WIC_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WIC_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIC_CHANGE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WIC_CHANGE_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WIC_CHANGE_TYPE')+"' "+ms.tdEvent(formId, 'WIC_CHANGE_TYPE')+">")
            arrHtml.push("<span colno='WIC_CHANGE_TYPE' class='"+ms.uiClass(formId, 'WIC_CHANGE_TYPE')+"' style='"+ms.uiStyle(formId, 'WIC_CHANGE_TYPE')+"' "+ms.uiEvent(formId, 'WIC_CHANGE_TYPE')+" title='"+ms.titleAttr(formId,'WIC_CHANGE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WIC_CHANGE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIC_ORIGINAL_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'WIC_ORIGINAL_VALUE')+"' style='width:100px;text-align:right; "+ms.tdEvent(formId, 'WIC_ORIGINAL_VALUE')+">")
            arrHtml.push("<span colno='WIC_ORIGINAL_VALUE' class='"+ms.uiClass(formId, 'WIC_ORIGINAL_VALUE')+"' style='"+ms.uiStyle(formId, 'WIC_ORIGINAL_VALUE')+"' "+ms.uiEvent(formId, 'WIC_ORIGINAL_VALUE')+" title='"+ms.titleAttr(formId,'WIC_ORIGINAL_VALUE','IS_TITLE_ATTR',v)+"' >"+v['WIC_ORIGINAL_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIC_EXISTING_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'WIC_EXISTING_VALUE')+"' style='width:100px;text-align:right; "+ms.tdEvent(formId, 'WIC_EXISTING_VALUE')+">")
            arrHtml.push("<span colno='WIC_EXISTING_VALUE' class='"+ms.uiClass(formId, 'WIC_EXISTING_VALUE')+"' style='"+ms.uiStyle(formId, 'WIC_EXISTING_VALUE')+"' "+ms.uiEvent(formId, 'WIC_EXISTING_VALUE')+" title='"+ms.titleAttr(formId,'WIC_EXISTING_VALUE','IS_TITLE_ATTR',v)+"' >"+v['WIC_EXISTING_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIC_CHANGE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WIC_CHANGE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WIC_CHANGE_TIME')+"' "+ms.tdEvent(formId, 'WIC_CHANGE_TIME')+">")
            arrHtml.push("<span colno='WIC_CHANGE_TIME' class='"+ms.uiClass(formId, 'WIC_CHANGE_TIME')+"' style='"+ms.uiStyle(formId, 'WIC_CHANGE_TIME')+"' "+ms.uiEvent(formId, 'WIC_CHANGE_TIME')+" title='"+ms.titleAttr(formId,'WIC_CHANGE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WIC_CHANGE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIC_CHANGE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WIC_CHANGE_EMP')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WIC_CHANGE_EMP')+"' "+ms.tdEvent(formId, 'WIC_CHANGE_EMP')+">")
            arrHtml.push("<span colno='WIC_CHANGE_EMP' class='"+ms.uiClass(formId, 'WIC_CHANGE_EMP')+"' style='"+ms.uiStyle(formId, 'WIC_CHANGE_EMP')+"' "+ms.uiEvent(formId, 'WIC_CHANGE_EMP')+" title='"+ms.titleAttr(formId,'WIC_CHANGE_EMP','IS_TITLE_ATTR',v)+"' >"+v['WIC_CHANGE_EMP']+"</span>")
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
 
 /*function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    $(document.getElementById('WIC_CHANGE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('WIC_CHANGE_TIME_END')).val(timeEndString());
                     //$(document.getElementById('WMI_BAKE_STATE')).val('3');
                    listAjaxTable($("#formId1").val());
                    
                 }*/
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


function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  
</script>

<script type="text/javascript" src="${path}buss/js/common.js"></script>


<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
