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
		<dict:lang value="料站表列表" />
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
		<bu:header formId ="167639778c8f4ee08caad77b61e5081c"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="63bdf9a6ebfd4397b90fbe1683c5ea1e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="63bdf9a6ebfd4397b90fbe1683c5ea1e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage167639778c8f4ee08caad77b61e5081c" id="formPage167639778c8f4ee08caad77b61e5081c" value="${formPage167639778c8f4ee08caad77b61e5081c}"/>
		<input type="hidden" name="formId" id="formId1" value='167639778c8f4ee08caad77b61e5081c'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="167639778c8f4ee08caad77b61e5081c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax167639778c8f4ee08caad77b61e5081c" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner167639778c8f4ee08caad77b61e5081c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable167639778c8f4ee08caad77b61e5081c"  style="min-width:1300px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="167639778c8f4ee08caad77b61e5081c" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_167639778c8f4ee08caad77b61e5081c" onclick="_selectAjaxTableAllData(this,'167639778c8f4ee08caad77b61e5081c')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CM_TRACK" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CREATE_TIME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CREATE_USER" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv167639778c8f4ee08caad77b61e5081c" onscroll="ajaxTableScroll(this,'167639778c8f4ee08caad77b61e5081c')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax167639778c8f4ee08caad77b61e5081c" style="min-width:1300px;">
		<tbody id="tbody_167639778c8f4ee08caad77b61e5081c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage167639778c8f4ee08caad77b61e5081c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=167639778c8f4ee08caad77b61e5081c&showLoading=0" />
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
		<bu:submit viewId="63bdf9a6ebfd4397b90fbe1683c5ea1e" />
		<bu:script viewId="63bdf9a6ebfd4397b90fbe1683c5ea1e" />
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
 if ("0" == isCloseWin || undefined == isCloseWin) {
   top.$(".dialog-close").click();
 }
  checkboxAll("joblist");

}

<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='167639778c8f4ee08caad77b61e5081c'){<%--料站表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var cmSN=v['CM_SN'];
            var cmName=v['CM_NAME'];
            var modelCode=v['CM_MODEL_CODE'];
            var modelName=v['CM_MODEL_NAME'];
            var modelStandard=v['CM_MODEL_STANDARD'];
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
                arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrLeftHtml.push("</td>");
            }else{
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
            }
                arrHtml.push("<td colno='DATA_AUTH' title='"+v['DATA_AUTH']+"' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ")
                arrHtml.push("</td>");            
                arrHtml.push("<td colno='CM_SN' title='"+cmSN+"' class='datagrid-cell "+ms.tdClass(formId, 'CM_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CM_SN')+"' "+ms.tdEvent(formId, 'CM_SN')+">")
                arrHtml.push("<span colno='CM_SN' class='"+ms.uiClass(formId, 'CM_SN')+"' style='"+ms.uiStyle(formId, 'CM_SN')+"' "+ms.uiEvent(formId, 'CM_SN')+" >"+v['CM_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CM_NAME' title='"+cmName+"' class='datagrid-cell "+ms.tdClass(formId, 'CM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CM_NAME')+"' "+ms.tdEvent(formId, 'CM_NAME')+">")
                arrHtml.push("<span colno='CM_NAME' class='"+ms.uiClass(formId, 'CM_NAME')+"' style='"+ms.uiStyle(formId, 'CM_NAME')+"' "+ms.uiEvent(formId, 'CM_NAME')+" >"+v['CM_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CM_MODEL_CODE' title='"+modelCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CM_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CM_MODEL_CODE')+">")
                arrHtml.push("<span colno='CM_MODEL_CODE' class='"+ms.uiClass(formId, 'CM_MODEL_CODE')+"' onclick='itemJump1(\""+v['CM_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CM_MODEL_CODE')+" >"+v['CM_MODEL_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CM_MODEL_NAME' title='"+modelName+"' class='datagrid-cell "+ms.tdClass(formId, 'CM_MODEL_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CM_MODEL_NAME')+"' "+ms.tdEvent(formId, 'CM_MODEL_NAME')+">")
                arrHtml.push("<span colno='CM_MODEL_NAME' class='"+ms.uiClass(formId, 'CM_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'CM_MODEL_NAME')+"' "+ms.uiEvent(formId, 'CM_MODEL_NAME')+" >"+v['CM_MODEL_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CM_MODEL_STANDARD' title='"+modelStandard+"' class='datagrid-cell "+ms.tdClass(formId, 'CM_MODEL_STANDARD')+"' style='width:150px;"+ms.tdStyle(formId, 'CM_MODEL_STANDARD')+"' "+ms.tdEvent(formId, 'CM_MODEL_STANDARD')+">")
                arrHtml.push("<span colno='CM_MODEL_STANDARD' class='"+ms.uiClass(formId, 'CM_MODEL_STANDARD')+"' style='"+ms.uiStyle(formId, 'CM_MODEL_STANDARD')+"' "+ms.uiEvent(formId, 'CM_MODEL_STANDARD')+" >"+v['CM_MODEL_STANDARD']+"</span>")
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='CM_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CM_PROCESS_FACE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CM_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CM_PROCESS_FACE')+">")
                arrHtml.push("<span colno='CM_PROCESS_FACE' class='"+ms.uiClass(formId, 'CM_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CM_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CM_PROCESS_FACE')+" >"+v['CM_PROCESS_FACE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CM_TRACK' class='datagrid-cell "+ms.tdClass(formId, 'CM_TRACK')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CM_TRACK')+"' "+ms.tdEvent(formId, 'CM_TRACK')+">")
                arrHtml.push("<span colno='CM_TRACK' class='"+ms.uiClass(formId, 'CM_TRACK')+"' style='"+ms.uiStyle(formId, 'CM_TRACK')+"' "+ms.uiEvent(formId, 'CM_TRACK')+" >"+v['CM_TRACK']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CM_STAUS' class='datagrid-cell "+ms.tdClass(formId, 'CM_STAUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CM_STAUS')+"' "+ms.tdEvent(formId, 'CM_STAUS')+">")
                arrHtml.push("<span colno='CM_STAUS' class='"+ms.uiClass(formId, 'CM_STAUS')+"' style='"+ms.uiStyle(formId, 'CM_STAUS')+"' "+ms.uiEvent(formId, 'CM_STAUS')+" >"+v['CM_STAUS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
                arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" >"+v['CREATE_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
                arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" >"+v['CREATE_USER']+"</span>")
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

//BOM管理
function itemJump1(obj){
      winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
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
