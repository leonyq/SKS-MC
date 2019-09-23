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
		<dict:lang value="条码打印" />
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
		<bu:header formId ="fd43d63021be4eadb08e73d0ac80b243"/>

    
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
		<bu:func viewId="e9f4b63921454f2bbcad68677656453a" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="e9f4b63921454f2bbcad68677656453a" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagefd43d63021be4eadb08e73d0ac80b243" id="formPagefd43d63021be4eadb08e73d0ac80b243" value="${formPagefd43d63021be4eadb08e73d0ac80b243}"/>
		<input type="hidden" name="formId" id="formId1" value='fd43d63021be4eadb08e73d0ac80b243'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="fd43d63021be4eadb08e73d0ac80b243">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxfd43d63021be4eadb08e73d0ac80b243" style="min-width:1570px;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerfd43d63021be4eadb08e73d0ac80b243">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablefd43d63021be4eadb08e73d0ac80b243">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="fd43d63021be4eadb08e73d0ac80b243" i18n="1"/></td>
			<!--<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_fd43d63021be4eadb08e73d0ac80b243" onclick="_selectAjaxTableAllData(this,'fd43d63021be4eadb08e73d0ac80b243')" style="cursor: pointer;"title="全选"/></span></td>-->
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WRC_NEW_SN" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WRC_OLD_SN" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WRC_TYPE" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRC_ITEM_CODE" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRC_ITEM_NAME" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRC_ITEM_SPEC" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WRC_OLD_NUM" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WRC_NEW_NUM" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WRC_REPRINT_EMP" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WRC_REPRINT_TIME" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WRC_MEMO" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivfd43d63021be4eadb08e73d0ac80b243" onscroll="ajaxTableScroll(this,'fd43d63021be4eadb08e73d0ac80b243')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxfd43d63021be4eadb08e73d0ac80b243" style="min-width:1570px;">
		<tbody id="tbody_fd43d63021be4eadb08e73d0ac80b243" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagefd43d63021be4eadb08e73d0ac80b243==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=fd43d63021be4eadb08e73d0ac80b243&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="e9f4b63921454f2bbcad68677656453a" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="e9f4b63921454f2bbcad68677656453a" />
    
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
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='fd43d63021be4eadb08e73d0ac80b243'){<%--条码重打信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            //arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            //arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_NEW_SN' class='datagrid-cell "+ms.tdClass(formId, 'WRC_NEW_SN')+"' style='width:200px;text-align:left;"+ms.tdStyle(formId, 'WRC_NEW_SN')+"' "+ms.tdEvent(formId, 'WRC_NEW_SN')+">")
            arrHtml.push("<span colno='WRC_NEW_SN' class='"+ms.uiClass(formId, 'WRC_NEW_SN')+"' onclick='itemJump1(\""+v['WRC_NEW_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WRC_NEW_SN')+" title='"+ms.titleAttr(formId,'WRC_NEW_SN','IS_TITLE_ATTR',v)+"' >"+v['WRC_NEW_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_OLD_SN' class='datagrid-cell "+ms.tdClass(formId, 'WRC_OLD_SN')+"' style='width:200px;text-align:left;"+ms.tdStyle(formId, 'WRC_OLD_SN')+"' "+ms.tdEvent(formId, 'WRC_OLD_SN')+">")
            arrHtml.push("<span colno='WRC_OLD_SN' class='"+ms.uiClass(formId, 'WRC_OLD_SN')+"' onclick='itemJump2(\""+v['WRC_OLD_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WRC_OLD_SN')+" title='"+ms.titleAttr(formId,'WRC_OLD_SN','IS_TITLE_ATTR',v)+"' >"+v['WRC_OLD_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WRC_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WRC_TYPE')+"' "+ms.tdEvent(formId, 'WRC_TYPE')+">")
            arrHtml.push("<span colno='WRC_TYPE' class='"+ms.uiClass(formId, 'WRC_TYPE')+"' style='"+ms.uiStyle(formId, 'WRC_TYPE')+"' "+ms.uiEvent(formId, 'WRC_TYPE')+" title='"+ms.titleAttr(formId,'WRC_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WRC_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRC_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WRC_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WRC_ITEM_CODE')+">")
            arrHtml.push("<span colno='WRC_ITEM_CODE' class='"+ms.uiClass(formId, 'WRC_ITEM_CODE')+"' onclick='itemJump3(\""+v['WRC_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WRC_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WRC_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRC_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WRC_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WRC_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WRC_ITEM_NAME')+">")
            arrHtml.push("<span colno='WRC_ITEM_NAME' class='"+ms.uiClass(formId, 'WRC_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WRC_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WRC_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WRC_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WRC_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WRC_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WRC_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WRC_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WRC_ITEM_SPEC' class='"+ms.uiClass(formId, 'WRC_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WRC_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WRC_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WRC_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WRC_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_OLD_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRC_OLD_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WRC_OLD_NUM')+"' "+ms.tdEvent(formId, 'WRC_OLD_NUM')+">")
            arrHtml.push("<span colno='WRC_OLD_NUM' class='"+ms.uiClass(formId, 'WRC_OLD_NUM')+"' style='"+ms.uiStyle(formId, 'WRC_OLD_NUM')+"' "+ms.uiEvent(formId, 'WRC_OLD_NUM')+" title='"+ms.titleAttr(formId,'WRC_OLD_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRC_OLD_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_NEW_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRC_NEW_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WRC_NEW_NUM')+"' "+ms.tdEvent(formId, 'WRC_NEW_NUM')+">")
            arrHtml.push("<span colno='WRC_NEW_NUM' class='"+ms.uiClass(formId, 'WRC_NEW_NUM')+"' style='"+ms.uiStyle(formId, 'WRC_NEW_NUM')+"' "+ms.uiEvent(formId, 'WRC_NEW_NUM')+" title='"+ms.titleAttr(formId,'WRC_NEW_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRC_NEW_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_REPRINT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WRC_REPRINT_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WRC_REPRINT_EMP')+"' "+ms.tdEvent(formId, 'WRC_REPRINT_EMP')+">")
            arrHtml.push("<span colno='WRC_REPRINT_EMP' class='"+ms.uiClass(formId, 'WRC_REPRINT_EMP')+"' style='"+ms.uiStyle(formId, 'WRC_REPRINT_EMP')+"' "+ms.uiEvent(formId, 'WRC_REPRINT_EMP')+" title='"+ms.titleAttr(formId,'WRC_REPRINT_EMP','IS_TITLE_ATTR',v)+"' >"+v['WRC_REPRINT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_REPRINT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WRC_REPRINT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WRC_REPRINT_TIME')+"' "+ms.tdEvent(formId, 'WRC_REPRINT_TIME')+">")
            arrHtml.push("<span colno='WRC_REPRINT_TIME' class='"+ms.uiClass(formId, 'WRC_REPRINT_TIME')+"' style='"+ms.uiStyle(formId, 'WRC_REPRINT_TIME')+"' "+ms.uiEvent(formId, 'WRC_REPRINT_TIME')+" title='"+ms.titleAttr(formId,'WRC_REPRINT_TIME','IS_TITLE_ATTR',v)+"' >"+v['WRC_REPRINT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRC_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WRC_MEMO')+"' style='width:200px;text-align:left;"+ms.tdStyle(formId, 'WRC_MEMO')+"' "+ms.tdEvent(formId, 'WRC_MEMO')+">")
            arrHtml.push("<span colno='WRC_MEMO' class='"+ms.uiClass(formId, 'WRC_MEMO')+"' style='"+ms.uiStyle(formId, 'WRC_MEMO')+"' "+ms.uiEvent(formId, 'WRC_MEMO')+" title='"+ms.titleAttr(formId,'WRC_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WRC_MEMO']+"</span>")
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
    //setScroll(formId);
    setScroll();
}

function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    //initTableWidth();
                    //$(document.getElementById('T2#WPD_DELIVERY_DATE_BEGIN')).val(timeBeginString());
                    //$(document.getElementById('T2#WPD_DELIVERY_DATE_END')).val(timeEndString());
                     //$(document.getElementById('T2#WRD_DOC_TYPE')).val('DJ02');
                     var datetime = new Date();
                     $(document.getElementById('WRC_REPRINT_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('WRC_REPRINT_TIME_END')).val(timeEndString());
                    listAjaxTable($("#formId1").val());
                    console.log(datetime.getDate());
                      console.log(datetime.getTime());
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

//物料作业履历
function itemJump1(obj){
      winOptMethod.jump("6c35b229d90b483c90542ca341d70f2d","F7200","jumpId",obj);
}  


//物料作业履历
function itemJump2(obj){
    winOptMethod.jump("6c35b229d90b483c90542ca341d70f2d","F7200","jumpId",obj);
} 

//物料信息
function itemJump3(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
