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
		<dict:lang value="VM-备品报废信息" />
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
		<bu:header formId ="cbef7e8bb8b04fd2980ff69ee3725893"/>

    
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
		<bu:func viewId="33cb973389c248b39e8e90bc65d93838" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="33cb973389c248b39e8e90bc65d93838" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagecbef7e8bb8b04fd2980ff69ee3725893" id="formPagecbef7e8bb8b04fd2980ff69ee3725893" value="${formPagecbef7e8bb8b04fd2980ff69ee3725893}"/>
		<input type="hidden" name="formId" id="formId1" value='cbef7e8bb8b04fd2980ff69ee3725893'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="cbef7e8bb8b04fd2980ff69ee3725893">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxcbef7e8bb8b04fd2980ff69ee3725893" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innercbef7e8bb8b04fd2980ff69ee3725893">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablecbef7e8bb8b04fd2980ff69ee3725893">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="cbef7e8bb8b04fd2980ff69ee3725893" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_cbef7e8bb8b04fd2980ff69ee3725893" onclick="_selectAjaxTableAllData(this,'cbef7e8bb8b04fd2980ff69ee3725893')" style="cursor: pointer;"title="全选"/></span></td>
			<!---<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WSS_ADD_TYPE" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>--->
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSS_ITEM_SN" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSS_ITEM_CODE" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSS_ITEM_NUM" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSS_ITEM_NAME" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSS_ITEM_SPEC" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSS_PRODUCE_DATE" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSS_RECEIVE_TIME" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSS_RECEIVE_EMP" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSS_MEMO" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivcbef7e8bb8b04fd2980ff69ee3725893" onscroll="ajaxTableScroll(this,'cbef7e8bb8b04fd2980ff69ee3725893')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxcbef7e8bb8b04fd2980ff69ee3725893">
		<tbody id="tbody_cbef7e8bb8b04fd2980ff69ee3725893" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagecbef7e8bb8b04fd2980ff69ee3725893==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=cbef7e8bb8b04fd2980ff69ee3725893&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="33cb973389c248b39e8e90bc65d93838" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="33cb973389c248b39e8e90bc65d93838" />
    
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
    if(formId=='cbef7e8bb8b04fd2980ff69ee3725893'){<%--备品报废信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            /*
            arrHtml.push("<td colno='WSS_ADD_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSS_ADD_TYPE')+"' style='width:70px;"+ms.tdStyle(formId, 'WSS_ADD_TYPE')+"' "+ms.tdEvent(formId, 'WSS_ADD_TYPE')+">")
            arrHtml.push("<span colno='WSS_ADD_TYPE' class='"+ms.uiClass(formId, 'WSS_ADD_TYPE')+"' style='"+ms.uiStyle(formId, 'WSS_ADD_TYPE')+"' "+ms.uiEvent(formId, 'WSS_ADD_TYPE')+" title='"+ms.titleAttr(formId,'WSS_ADD_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WSS_ADD_TYPE']+"</span>")
            arrHtml.push("</td>");
            */
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='WSS_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSS_ITEM_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSS_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSS_ITEM_SN')+">")
            arrHtml.push("<span colno='WSS_ITEM_SN' class='"+ms.uiClass(formId, 'WSS_ITEM_SN')+"' onclick='itemJump1(\""+v['WSS_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WSS_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSS_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSS_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSS_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSS_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSS_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSS_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSS_ITEM_CODE' class='"+ms.uiClass(formId, 'WSS_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSS_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSS_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSS_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSS_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSS_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSS_ITEM_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSS_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WSS_ITEM_NUM')+">")
            arrHtml.push("<span colno='WSS_ITEM_NUM' class='"+ms.uiClass(formId, 'WSS_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WSS_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WSS_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WSS_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSS_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSS_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSS_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSS_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WSS_ITEM_NAME')+">")
            arrHtml.push("<span colno='WSS_ITEM_NAME' class='"+ms.uiClass(formId, 'WSS_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WSS_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WSS_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WSS_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WSS_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSS_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WSS_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSS_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WSS_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WSS_ITEM_SPEC' class='"+ms.uiClass(formId, 'WSS_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WSS_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WSS_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WSS_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WSS_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSS_PRODUCE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WSS_PRODUCE_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WSS_PRODUCE_DATE')+"' "+ms.tdEvent(formId, 'WSS_PRODUCE_DATE')+">")
            arrHtml.push("<span colno='WSS_PRODUCE_DATE' class='"+ms.uiClass(formId, 'WSS_PRODUCE_DATE')+"' style='"+ms.uiStyle(formId, 'WSS_PRODUCE_DATE')+"' "+ms.uiEvent(formId, 'WSS_PRODUCE_DATE')+" title='"+ms.titleAttr(formId,'WSS_PRODUCE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WSS_PRODUCE_DATE']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WSS_RECEIVE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSS_RECEIVE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WSS_RECEIVE_TIME')+"' "+ms.tdEvent(formId, 'WSS_RECEIVE_TIME')+">")
            arrHtml.push("<span colno='WSS_RECEIVE_TIME' class='"+ms.uiClass(formId, 'WSS_RECEIVE_TIME')+"' style='"+ms.uiStyle(formId, 'WSS_RECEIVE_TIME')+"' "+ms.uiEvent(formId, 'WSS_RECEIVE_TIME')+" title='"+ms.titleAttr(formId,'WSS_RECEIVE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSS_RECEIVE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSS_RECEIVE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WSS_RECEIVE_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSS_RECEIVE_EMP')+"' "+ms.tdEvent(formId, 'WSS_RECEIVE_EMP')+">")
            arrHtml.push("<span colno='WSS_RECEIVE_EMP' class='"+ms.uiClass(formId, 'WSS_RECEIVE_EMP')+"' style='"+ms.uiStyle(formId, 'WSS_RECEIVE_EMP')+"' "+ms.uiEvent(formId, 'WSS_RECEIVE_EMP')+" title='"+ms.titleAttr(formId,'WSS_RECEIVE_EMP','IS_TITLE_ATTR',v)+"' >"+v['WSS_RECEIVE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSS_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WSS_MEMO')+"' style='width:200px;"+ms.tdStyle(formId, 'WSS_MEMO')+"' "+ms.tdEvent(formId, 'WSS_MEMO')+">")
            arrHtml.push("<span colno='WSS_MEMO' class='"+ms.uiClass(formId, 'WSS_MEMO')+"' style='"+ms.uiStyle(formId, 'WSS_MEMO')+"' "+ms.uiEvent(formId, 'WSS_MEMO')+" title='"+ms.titleAttr(formId,'WSS_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WSS_MEMO']+"</span>")
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//备品建档
function itemJump1(obj){
      winOptMethod.jump("3ba296cba3a544729ccd331795ef6c17","F7671","jumpId",obj);
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
