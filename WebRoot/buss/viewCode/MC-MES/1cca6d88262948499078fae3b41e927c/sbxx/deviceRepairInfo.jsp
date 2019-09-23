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
		<dict:lang value="VM-设备维修信息" />
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
		<bu:header formId ="415deefd6f8c4b4397c66b6e77cce579"/>

    
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
		<bu:func viewId="1c0666dc3fe1494fa11126734ab5b912" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="1c0666dc3fe1494fa11126734ab5b912" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage415deefd6f8c4b4397c66b6e77cce579" id="formPage415deefd6f8c4b4397c66b6e77cce579" value="${formPage415deefd6f8c4b4397c66b6e77cce579}"/>
		<input type="hidden" name="formId" id="formId1" value='415deefd6f8c4b4397c66b6e77cce579'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='1a5ebc68278b4aae80c328a3f809edd2'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='37706529238246b884d06623606e4320'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="415deefd6f8c4b4397c66b6e77cce579">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax415deefd6f8c4b4397c66b6e77cce579" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner415deefd6f8c4b4397c66b6e77cce579">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable415deefd6f8c4b4397c66b6e77cce579">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="415deefd6f8c4b4397c66b6e77cce579" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_415deefd6f8c4b4397c66b6e77cce579" onclick="_selectAjaxTableAllData(this,'415deefd6f8c4b4397c66b6e77cce579')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_DEVICE_SN" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_DEVICE_TYPE" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_DEVICE_NAME" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_DEVICE_CLASS" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_REPAIR_LONG" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_REPAIR_REASON" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_REPAIR_DESC" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_REPAIR_MEMO" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CDE_REPAIR_EMP" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CDE_REPAIR_TIME" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv415deefd6f8c4b4397c66b6e77cce579" onscroll="ajaxTableScroll(this,'415deefd6f8c4b4397c66b6e77cce579')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax415deefd6f8c4b4397c66b6e77cce579">
		<tbody id="tbody_415deefd6f8c4b4397c66b6e77cce579" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage415deefd6f8c4b4397c66b6e77cce579==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=415deefd6f8c4b4397c66b6e77cce579&showLoading=0" />
			</div>
		</c:if>
			<div class="panel-ajax datagrid datagrid-div1" style="margin-top:10px;" id="37706529238246b884d06623606e4320">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax37706529238246b884d06623606e4320" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner37706529238246b884d06623606e4320">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable37706529238246b884d06623606e4320">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="37706529238246b884d06623606e4320" i18n="1"/></td>
			<!--<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_37706529238246b884d06623606e4320" onclick="_selectAjaxTableAllData(this,'37706529238246b884d06623606e4320')" style="cursor: pointer;"title="全选"/></span></td>-->
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDF_ITEM_LIST" formId="37706529238246b884d06623606e4320" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDF_ITEM_CODE" formId="37706529238246b884d06623606e4320" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CDF_ITEM_NAME" formId="37706529238246b884d06623606e4320" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CDF_ITEM_SPEC" formId="37706529238246b884d06623606e4320" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDF_ITEM_NUM" formId="37706529238246b884d06623606e4320" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CDF_CHANGE_REASON" formId="37706529238246b884d06623606e4320" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CDF_MEMO" formId="37706529238246b884d06623606e4320" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv37706529238246b884d06623606e4320" onscroll="ajaxTableScroll(this,'37706529238246b884d06623606e4320')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax37706529238246b884d06623606e4320">
		<tbody id="tbody_37706529238246b884d06623606e4320" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage37706529238246b884d06623606e4320==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=37706529238246b884d06623606e4320&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPage37706529238246b884d06623606e4320" id="formPage37706529238246b884d06623606e4320" value="${formPage37706529238246b884d06623606e4320}"/>
		<input type="hidden" name="formId" id="formId2" value='37706529238246b884d06623606e4320'/>
	
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="1c0666dc3fe1494fa11126734ab5b912" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="1c0666dc3fe1494fa11126734ab5b912" />
    
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
    if(formId=='415deefd6f8c4b4397c66b6e77cce579'){<%--FM-设备维修信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center; "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDE_DEVICE_SN')+"' style='width:150px; text-align:center;"+ms.tdStyle(formId, 'CDE_DEVICE_SN')+"'"+ms.tdEvent(formId, 'CDE_DEVICE_SN')+">")
            arrHtml.push("<span colno='CDE_DEVICE_SN'  class='"+ms.uiClass(formId, 'CDE_DEVICE_SN')+"' onclick='itemJump1(\""+v['CDE_DEVICE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;'"+ms.uiEvent(formId, 'CDE_DEVICE_SN')+" title='"+ms.titleAttr(formId,'CDE_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['CDE_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_DEVICE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CDE_DEVICE_TYPE')+"' style='width:150px;text-align:center; "+ms.tdEvent(formId, 'CDE_DEVICE_TYPE')+">")
            arrHtml.push("<span colno='CDE_DEVICE_TYPE' class='"+ms.uiClass(formId, 'CDE_DEVICE_TYPE')+"' style='"+ms.uiStyle(formId, 'CDE_DEVICE_TYPE')+"' "+ms.uiEvent(formId, 'CDE_DEVICE_TYPE')+" title='"+ms.titleAttr(formId,'CDE_DEVICE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CDE_DEVICE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CDE_DEVICE_NAME')+"' style='width:150px; "+ms.tdEvent(formId, 'CDE_DEVICE_NAME')+">")
            arrHtml.push("<span colno='CDE_DEVICE_NAME' class='"+ms.uiClass(formId, 'CDE_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'CDE_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'CDE_DEVICE_NAME')+" title='"+ms.titleAttr(formId,'CDE_DEVICE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CDE_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_DEVICE_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CDE_DEVICE_CLASS')+"' style='width:150px; "+ms.tdEvent(formId, 'CDE_DEVICE_CLASS')+">")
            arrHtml.push("<span colno='CDE_DEVICE_CLASS' class='"+ms.uiClass(formId, 'CDE_DEVICE_CLASS')+"' style='"+ms.uiStyle(formId, 'CDE_DEVICE_CLASS')+"' "+ms.uiEvent(formId, 'CDE_DEVICE_CLASS')+" title='"+ms.titleAttr(formId,'CDE_DEVICE_CLASS','IS_TITLE_ATTR',v)+"' >"+v['CDE_DEVICE_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_REPAIR_LONG' class='datagrid-cell "+ms.tdClass(formId, 'CDE_REPAIR_LONG')+"' style='width:150px;text-align:right; "+ms.tdStyle(formId, 'CDE_REPAIR_LONG')+"' "+ms.tdEvent(formId, 'CDE_REPAIR_LONG')+">")
            arrHtml.push("<span colno='CDE_REPAIR_LONG' class='"+ms.uiClass(formId, 'CDE_REPAIR_LONG')+"' style='"+ms.uiStyle(formId, 'CDE_REPAIR_LONG')+"' "+ms.uiEvent(formId, 'CDE_REPAIR_LONG')+" title='"+ms.titleAttr(formId,'CDE_REPAIR_LONG','IS_TITLE_ATTR',v)+"' >"+v['CDE_REPAIR_LONG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_REPAIR_REASON' class='datagrid-cell "+ms.tdClass(formId, 'CDE_REPAIR_REASON')+"' style='width:150px; "+ms.tdEvent(formId, 'CDE_REPAIR_REASON')+">")
            arrHtml.push("<span colno='CDE_REPAIR_REASON' class='"+ms.uiClass(formId, 'CDE_REPAIR_REASON')+"' style='"+ms.uiStyle(formId, 'CDE_REPAIR_REASON')+"' "+ms.uiEvent(formId, 'CDE_REPAIR_REASON')+" title='"+ms.titleAttr(formId,'CDE_REPAIR_REASON','IS_TITLE_ATTR',v)+"' >"+v['CDE_REPAIR_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_REPAIR_DESC' class='datagrid-cell "+ms.tdClass(formId, 'CDE_REPAIR_DESC')+"' style='width:150px; "+ms.tdEvent(formId, 'CDE_REPAIR_DESC')+">")
            arrHtml.push("<span colno='CDE_REPAIR_DESC' class='"+ms.uiClass(formId, 'CDE_REPAIR_DESC')+"' style='"+ms.uiStyle(formId, 'CDE_REPAIR_DESC')+"' "+ms.uiEvent(formId, 'CDE_REPAIR_DESC')+" title='"+ms.titleAttr(formId,'CDE_REPAIR_DESC','IS_TITLE_ATTR',v)+"' >"+v['CDE_REPAIR_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_REPAIR_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CDE_REPAIR_MEMO')+"' style='width:150px;"+ms.tdEvent(formId, 'CDE_REPAIR_MEMO')+">")
            arrHtml.push("<span colno='CDE_REPAIR_MEMO' class='"+ms.uiClass(formId, 'CDE_REPAIR_MEMO')+"' style='"+ms.uiStyle(formId, 'CDE_REPAIR_MEMO')+"' "+ms.uiEvent(formId, 'CDE_REPAIR_MEMO')+" title='"+ms.titleAttr(formId,'CDE_REPAIR_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CDE_REPAIR_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_REPAIR_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CDE_REPAIR_EMP')+"' style='width:150px;text-align:center; "+ms.tdEvent(formId, 'CDE_REPAIR_EMP')+">")
            arrHtml.push("<span colno='CDE_REPAIR_EMP' class='"+ms.uiClass(formId, 'CDE_REPAIR_EMP')+"' style='"+ms.uiStyle(formId, 'CDE_REPAIR_EMP')+"' "+ms.uiEvent(formId, 'CDE_REPAIR_EMP')+" title='"+ms.titleAttr(formId,'CDE_REPAIR_EMP','IS_TITLE_ATTR',v)+"' >"+v['CDE_REPAIR_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDE_REPAIR_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDE_REPAIR_TIME')+"' style='width:150px;text-align:center; "+ms.tdEvent(formId, 'CDE_REPAIR_TIME')+">")
            arrHtml.push("<span colno='CDE_REPAIR_TIME' class='"+ms.uiClass(formId, 'CDE_REPAIR_TIME')+"' style='"+ms.uiStyle(formId, 'CDE_REPAIR_TIME')+"' "+ms.uiEvent(formId, 'CDE_REPAIR_TIME')+" title='"+ms.titleAttr(formId,'CDE_REPAIR_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDE_REPAIR_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='37706529238246b884d06623606e4320'){<%--FM-设备备件更换信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            //arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            //arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='CDF_ITEM_LIST' class='datagrid-cell "+ms.tdClass(formId, 'CDF_ITEM_LIST')+"' style='width:150px;"+ms.tdEvent(formId, 'CDF_ITEM_LIST')+">")
            arrHtml.push("<span colno='CDF_ITEM_LIST' class='"+ms.uiClass(formId, 'CDF_ITEM_LIST')+"' style='"+ms.uiStyle(formId, 'CDF_ITEM_LIST')+"' "+ms.uiEvent(formId, 'CDF_ITEM_LIST')+" title='"+ms.titleAttr(formId,'CDF_ITEM_LIST','IS_TITLE_ATTR',v)+"' >"+v['CDF_ITEM_LIST']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDF_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CDF_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CDF_ITEM_CODE')+"'"+ms.tdEvent(formId, 'CDF_ITEM_CODE')+">")
            arrHtml.push("<span colno='CDF_ITEM_CODE' class='"+ms.uiClass(formId, 'CDF_ITEM_CODE')+"' onclick='itemJump2(\""+v['CDF_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CDF_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CDF_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CDF_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDF_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CDF_ITEM_NAME')+"' style='width:200px;"+ms.tdEvent(formId, 'CDF_ITEM_NAME')+">")
            arrHtml.push("<span colno='CDF_ITEM_NAME' class='"+ms.uiClass(formId, 'CDF_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CDF_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CDF_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CDF_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CDF_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDF_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CDF_ITEM_SPEC')+"' style='width:200px;"+ms.tdEvent(formId, 'CDF_ITEM_SPEC')+">")
            arrHtml.push("<span colno='CDF_ITEM_SPEC' class='"+ms.uiClass(formId, 'CDF_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CDF_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CDF_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'CDF_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['CDF_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDF_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'CDF_ITEM_NUM')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'CDF_ITEM_NUM')+"' "+ms.tdEvent(formId, 'CDF_ITEM_NUM')+">")
            arrHtml.push("<span colno='CDF_ITEM_NUM' class='"+ms.uiClass(formId, 'CDF_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'CDF_ITEM_NUM')+"' "+ms.uiEvent(formId, 'CDF_ITEM_NUM')+" title='"+ms.titleAttr(formId,'CDF_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['CDF_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDF_CHANGE_REASON' class='datagrid-cell "+ms.tdClass(formId, 'CDF_CHANGE_REASON')+"' style='width:200px;"+ms.tdEvent(formId, 'CDF_CHANGE_REASON')+">")
            arrHtml.push("<span colno='CDF_CHANGE_REASON' class='"+ms.uiClass(formId, 'CDF_CHANGE_REASON')+"' style='"+ms.uiStyle(formId, 'CDF_CHANGE_REASON')+"' "+ms.uiEvent(formId, 'CDF_CHANGE_REASON')+" title='"+ms.titleAttr(formId,'CDF_CHANGE_REASON','IS_TITLE_ATTR',v)+"' >"+v['CDF_CHANGE_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDF_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CDF_MEMO')+"' style='width:200px;"+ms.tdEvent(formId, 'CDF_MEMO')+">")
            arrHtml.push("<span colno='CDF_MEMO' class='"+ms.uiClass(formId, 'CDF_MEMO')+"' style='"+ms.uiStyle(formId, 'CDF_MEMO')+"' "+ms.uiEvent(formId, 'CDF_MEMO')+" title='"+ms.titleAttr(formId,'CDF_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CDF_MEMO']+"</span>")
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
    
    
$(function(){
$("#cfbaa9170bee47b99944fe28c4d29758").attr("style","display:none;");
})
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//设备建档
function itemJump1(obj){
      winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
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
