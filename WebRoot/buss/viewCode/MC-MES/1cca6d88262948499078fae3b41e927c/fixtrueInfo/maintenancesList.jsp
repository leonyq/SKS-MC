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
		<dict:lang value="VM-保养维修-列表2" />
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
		<bu:header formId ="9e447f80074441dcb0541aa75341e0b5"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="8c854ece267f4f0ebad265db117c0de4" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="8c854ece267f4f0ebad265db117c0de4" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage9e447f80074441dcb0541aa75341e0b5" id="formPage9e447f80074441dcb0541aa75341e0b5" value="${formPage9e447f80074441dcb0541aa75341e0b5}"/>
		<input type="hidden" name="formId" id="formId1" value='9e447f80074441dcb0541aa75341e0b5'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9e447f80074441dcb0541aa75341e0b5">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9e447f80074441dcb0541aa75341e0b5" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9e447f80074441dcb0541aa75341e0b5">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9e447f80074441dcb0541aa75341e0b5" style="min-width:2100px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9e447f80074441dcb0541aa75341e0b5" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9e447f80074441dcb0541aa75341e0b5" onclick="_selectAjaxTableAllData(this,'9e447f80074441dcb0541aa75341e0b5')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:210px;"><bu:uitn colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFM_ITEM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>

			
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CFM_MT_TIME" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9e447f80074441dcb0541aa75341e0b5" onscroll="ajaxTableScroll(this,'9e447f80074441dcb0541aa75341e0b5')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax9e447f80074441dcb0541aa75341e0b5" style="min-width:2100px;">
		<tbody id="tbody_9e447f80074441dcb0541aa75341e0b5" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9e447f80074441dcb0541aa75341e0b5==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9e447f80074441dcb0541aa75341e0b5&showLoading=0" />
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
		<bu:submit viewId="8c854ece267f4f0ebad265db117c0de4" />
		<bu:script viewId="8c854ece267f4f0ebad265db117c0de4" />
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
//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='9e447f80074441dcb0541aa75341e0b5'){<%--FM-制具-保养维修--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var fixSN=v['CFM_FIX_SN'];
            var itemCode=v['CFM_ITEM_CODE'];
            var itemName=v['CFM_ITEM_NAME'];
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
                //arrHtml.push("<td colno='DATA_AUTH'  class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span>")
                //arrHtml.push("</td>");
                //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
               // arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
                //arrHtml.push("</td>");
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	            arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_FIX_SN' title='"+fixSN+"' class='datagrid-cell "+ms.tdClass(formId, 'CFM_FIX_SN')+"' style='width:210px;"+ms.tdStyle(formId, 'CFM_FIX_SN')+"' "+ms.tdEvent(formId, 'CFM_FIX_SN')+">")
                arrHtml.push("<span colno='CFM_FIX_SN' class='"+ms.uiClass(formId, 'CFM_FIX_SN')+"' onclick='itemJump1(\""+v['CFM_FIX_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CFM_FIX_SN')+" >"+v['CFM_FIX_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CFM_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFM_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CFM_ITEM_TYPE')+">")
                arrHtml.push("<span colno='CFM_ITEM_TYPE' class='"+ms.uiClass(formId, 'CFM_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CFM_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CFM_ITEM_TYPE')+" >"+v['CFM_ITEM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_ITEM_CODE' title='"+itemCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CFM_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'CFM_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CFM_ITEM_CODE')+">")
                arrHtml.push("<span colno='CFM_ITEM_CODE' class='"+ms.uiClass(formId, 'CFM_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CFM_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CFM_ITEM_CODE')+" >"+v['CFM_ITEM_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_ITEM_NAME' title='"+itemName+"' class='datagrid-cell "+ms.tdClass(formId, 'CFM_ITEM_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'CFM_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CFM_ITEM_NAME')+">")
                arrHtml.push("<span colno='CFM_ITEM_NAME' class='"+ms.uiClass(formId, 'CFM_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CFM_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CFM_ITEM_NAME')+" >"+v['CFM_ITEM_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CFM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFM_TYPE')+"' "+ms.tdEvent(formId, 'CFM_TYPE')+">")
                arrHtml.push("<span colno='CFM_TYPE' class='"+ms.uiClass(formId, 'CFM_TYPE')+"' style='"+ms.uiStyle(formId, 'CFM_TYPE')+"' "+ms.uiEvent(formId, 'CFM_TYPE')+" >"+v['CFM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_LEFT_TOP' class='datagrid-cell "+ms.tdClass(formId, 'CFM_LEFT_TOP')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CFM_LEFT_TOP')+"' "+ms.tdEvent(formId, 'CFM_LEFT_TOP')+">")
                arrHtml.push("<span colno='CFM_LEFT_TOP' class='"+ms.uiClass(formId, 'CFM_LEFT_TOP')+"' style='"+ms.uiStyle(formId, 'CFM_LEFT_TOP')+"' "+ms.uiEvent(formId, 'CFM_LEFT_TOP')+" >"+v['CFM_LEFT_TOP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_LEFT_LOWER' class='datagrid-cell "+ms.tdClass(formId, 'CFM_LEFT_LOWER')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CFM_LEFT_LOWER')+"' "+ms.tdEvent(formId, 'CFM_LEFT_LOWER')+">")
                arrHtml.push("<span colno='CFM_LEFT_LOWER' class='"+ms.uiClass(formId, 'CFM_LEFT_LOWER')+"' style='"+ms.uiStyle(formId, 'CFM_LEFT_LOWER')+"' "+ms.uiEvent(formId, 'CFM_LEFT_LOWER')+" >"+v['CFM_LEFT_LOWER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_MIDDLE' class='datagrid-cell "+ms.tdClass(formId, 'CFM_MIDDLE')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CFM_MIDDLE')+"' "+ms.tdEvent(formId, 'CFM_MIDDLE')+">")
                arrHtml.push("<span colno='CFM_MIDDLE' class='"+ms.uiClass(formId, 'CFM_MIDDLE')+"' style='"+ms.uiStyle(formId, 'CFM_MIDDLE')+"' "+ms.uiEvent(formId, 'CFM_MIDDLE')+" >"+v['CFM_MIDDLE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_RIGHT_TOP' class='datagrid-cell "+ms.tdClass(formId, 'CFM_RIGHT_TOP')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CFM_RIGHT_TOP')+"' "+ms.tdEvent(formId, 'CFM_RIGHT_TOP')+">")
                arrHtml.push("<span colno='CFM_RIGHT_TOP' class='"+ms.uiClass(formId, 'CFM_RIGHT_TOP')+"' style='"+ms.uiStyle(formId, 'CFM_RIGHT_TOP')+"' "+ms.uiEvent(formId, 'CFM_RIGHT_TOP')+" >"+v['CFM_RIGHT_TOP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_RIGHT_LOWER' class='datagrid-cell "+ms.tdClass(formId, 'CFM_RIGHT_LOWER')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CFM_RIGHT_LOWER')+"' "+ms.tdEvent(formId, 'CFM_RIGHT_LOWER')+">")
                arrHtml.push("<span colno='CFM_RIGHT_LOWER' class='"+ms.uiClass(formId, 'CFM_RIGHT_LOWER')+"' style='"+ms.uiStyle(formId, 'CFM_RIGHT_LOWER')+"' "+ms.uiEvent(formId, 'CFM_RIGHT_LOWER')+" >"+v['CFM_RIGHT_LOWER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_STRAIN_DIS' class='datagrid-cell "+ms.tdClass(formId, 'CFM_STRAIN_DIS')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CFM_STRAIN_DIS')+"' "+ms.tdEvent(formId, 'CFM_STRAIN_DIS')+">")
                arrHtml.push("<span colno='CFM_STRAIN_DIS' class='"+ms.uiClass(formId, 'CFM_STRAIN_DIS')+"' style='"+ms.uiStyle(formId, 'CFM_STRAIN_DIS')+"' "+ms.uiEvent(formId, 'CFM_STRAIN_DIS')+" >"+v['CFM_STRAIN_DIS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_TINCKNESS' class='datagrid-cell "+ms.tdClass(formId, 'CFM_TINCKNESS')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CFM_TINCKNESS')+"' "+ms.tdEvent(formId, 'CFM_TINCKNESS')+">")
                arrHtml.push("<span colno='CFM_TINCKNESS' class='"+ms.uiClass(formId, 'CFM_TINCKNESS')+"' style='"+ms.uiStyle(formId, 'CFM_TINCKNESS')+"' "+ms.uiEvent(formId, 'CFM_TINCKNESS')+" >"+v['CFM_TINCKNESS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_FLATNESS' class='datagrid-cell "+ms.tdClass(formId, 'CFM_FLATNESS')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CFM_FLATNESS')+"' "+ms.tdEvent(formId, 'CFM_FLATNESS')+">")
                arrHtml.push("<span colno='CFM_FLATNESS' class='"+ms.uiClass(formId, 'CFM_FLATNESS')+"' style='"+ms.uiStyle(formId, 'CFM_FLATNESS')+"' "+ms.uiEvent(formId, 'CFM_FLATNESS')+" >"+v['CFM_FLATNESS']+"</span>")
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='CFM_MT_MAN' class='datagrid-cell "+ms.tdClass(formId, 'CFM_MT_MAN')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CFM_MT_MAN')+"' "+ms.tdEvent(formId, 'CFM_MT_MAN')+">")
                arrHtml.push("<span colno='CFM_MT_MAN' class='"+ms.uiClass(formId, 'CFM_MT_MAN')+"' style='"+ms.uiStyle(formId, 'CFM_MT_MAN')+"' "+ms.uiEvent(formId, 'CFM_MT_MAN')+" >"+v['CFM_MT_MAN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_REPORTER' class='datagrid-cell "+ms.tdClass(formId, 'CFM_REPORTER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFM_REPORTER')+"' "+ms.tdEvent(formId, 'CFM_REPORTER')+">")
                arrHtml.push("<span colno='CFM_REPORTER' class='"+ms.uiClass(formId, 'CFM_REPORTER')+"' style='"+ms.uiStyle(formId, 'CFM_REPORTER')+"' "+ms.uiEvent(formId, 'CFM_REPORTER')+" >"+v['CFM_REPORTER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_AUDIT' class='datagrid-cell "+ms.tdClass(formId, 'CFM_AUDIT')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFM_AUDIT')+"' "+ms.tdEvent(formId, 'CFM_AUDIT')+">")
                arrHtml.push("<span colno='CFM_AUDIT' class='"+ms.uiClass(formId, 'CFM_AUDIT')+"' style='"+ms.uiStyle(formId, 'CFM_AUDIT')+"' "+ms.uiEvent(formId, 'CFM_AUDIT')+" >"+v['CFM_AUDIT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_MT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CFM_MT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CFM_MT_TIME')+"' "+ms.tdEvent(formId, 'CFM_MT_TIME')+">")
                arrHtml.push("<span colno='CFM_MT_TIME' class='"+ms.uiClass(formId, 'CFM_MT_TIME')+"' style='"+ms.uiStyle(formId, 'CFM_MT_TIME')+"' "+ms.uiEvent(formId, 'CFM_MT_TIME')+" >"+v['CFM_MT_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFM_DEFECT_REMARK' class='datagrid-cell "+ms.tdClass(formId, 'CFM_DEFECT_REMARK')+"'ondblclick='remark(this);'  title='${CFM_DEFECT_REMARK}' style='text-overflow:ellipsis; white-space:nowrap; overflow:hidden;"+ms.tdStyle(formId, 'CFM_DEFECT_REMARK')+"' "+ms.tdEvent(formId, 'CFM_DEFECT_REMARK')+">")
                arrHtml.push("<span colno='CFM_DEFECT_REMARK' class='"+ms.uiClass(formId, 'CFM_DEFECT_REMARK')+"' style='"+ms.uiStyle(formId, 'CFM_DEFECT_REMARK')+"' "+ms.uiEvent(formId, 'CFM_DEFECT_REMARK')+" >"+v['CFM_DEFECT_REMARK']+"</span>")
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

 function remark(obj)
        {
	utilsFp.popRemark("",obj.title,"");
	}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制具履历
function itemJump1(obj){
      winOptMethod.jump("68260cc1824b481693825d3f54658ad0","F8890","jumpId",obj);
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


