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
		<dict:lang value="容器信息" />
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
		<bu:header formId ="279c5856e1534dd0a77caf1eda21aec8"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body style="overflow: hidden;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="176ef453e033492080bd682ea4321a1d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="176ef453e033492080bd682ea4321a1d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage279c5856e1534dd0a77caf1eda21aec8" id="formPage279c5856e1534dd0a77caf1eda21aec8" value="${formPage279c5856e1534dd0a77caf1eda21aec8}"/>
		<input type="hidden" name="formId" id="formId1" value='279c5856e1534dd0a77caf1eda21aec8'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="279c5856e1534dd0a77caf1eda21aec8">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax279c5856e1534dd0a77caf1eda21aec8" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner279c5856e1534dd0a77caf1eda21aec8">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable279c5856e1534dd0a77caf1eda21aec8" style="min-width:1160px">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="279c5856e1534dd0a77caf1eda21aec8" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_279c5856e1534dd0a77caf1eda21aec8" onclick="_selectAjaxTableAllData(this,'279c5856e1534dd0a77caf1eda21aec8')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CONTAINER_SN" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CONTAINER_TYPE" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="ENABLE_FLAG" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CONTAINER_CAPACITY" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CONTAINER_SPEC" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="STATE_FLAG" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="MO_NUMBER" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="AREA_ID" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="EDIT_USER" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDIT_TIME" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv279c5856e1534dd0a77caf1eda21aec8" onscroll="ajaxTableScroll(this,'279c5856e1534dd0a77caf1eda21aec8')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax279c5856e1534dd0a77caf1eda21aec8" style="min-width:1160px">
		<tbody id="tbody_279c5856e1534dd0a77caf1eda21aec8" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage279c5856e1534dd0a77caf1eda21aec8==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=279c5856e1534dd0a77caf1eda21aec8&showLoading=0" />
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
		<bu:submit viewId="176ef453e033492080bd682ea4321a1d" />
		<bu:script viewId="176ef453e033492080bd682ea4321a1d" />
		
		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        	<jsp:param name="modelName" value="VIEW_TYPE_17" />
        	<jsp:param name="location" value="jsLoading" />
        </jsp:include>
    
<script>
//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='279c5856e1534dd0a77caf1eda21aec8'){<%--容器信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var containerSN=v['CONTAINER_SN'];
            var containerSpec=v['CONTAINER_SPEC'];
            var areaId=v['AREA_ID'];
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
                arrHtml.push("<td colno='CONTAINER_SN' title='"+containerSN+"' class='datagrid-cell "+ms.tdClass(formId, 'CONTAINER_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CONTAINER_SN')+"' "+ms.tdEvent(formId, 'CONTAINER_SN')+">")
                arrHtml.push("<span colno='CONTAINER_SN' class='"+ms.uiClass(formId, 'CONTAINER_SN')+"' style='"+ms.uiStyle(formId, 'CONTAINER_SN')+"' "+ms.uiEvent(formId, 'CONTAINER_SN')+" title='"+v['CONTAINER_SN']+"'>"+v['CONTAINER_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CONTAINER_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CONTAINER_TYPE')+"' style='width:90px;"+ms.tdStyle(formId, 'CONTAINER_TYPE')+"' "+ms.tdEvent(formId, 'CONTAINER_TYPE')+">")
                arrHtml.push("<span colno='CONTAINER_TYPE' class='"+ms.uiClass(formId, 'CONTAINER_TYPE')+"' style='"+ms.uiStyle(formId, 'CONTAINER_TYPE')+"' "+ms.uiEvent(formId, 'CONTAINER_TYPE')+" title='"+v['CONTAINER_TYPE']+"'>"+v['CONTAINER_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ENABLE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'ENABLE_FLAG')+"' style='width:70px;"+ms.tdStyle(formId, 'ENABLE_FLAG')+"' "+ms.tdEvent(formId, 'ENABLE_FLAG')+">")
                arrHtml.push("<span colno='ENABLE_FLAG' class='"+ms.uiClass(formId, 'ENABLE_FLAG')+"' style='"+ms.uiStyle(formId, 'ENABLE_FLAG')+"' "+ms.uiEvent(formId, 'ENABLE_FLAG')+" >"+v['ENABLE_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CONTAINER_CAPACITY' class='datagrid-cell "+ms.tdClass(formId, 'CONTAINER_CAPACITY')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'CONTAINER_CAPACITY')+"' "+ms.tdEvent(formId, 'CONTAINER_CAPACITY')+">")
                arrHtml.push("<span colno='CONTAINER_CAPACITY' class='"+ms.uiClass(formId, 'CONTAINER_CAPACITY')+"' style='"+ms.uiStyle(formId, 'CONTAINER_CAPACITY')+"' "+ms.uiEvent(formId, 'CONTAINER_CAPACITY')+" title='"+v['CONTAINER_CAPACITY']+"'>"+v['CONTAINER_CAPACITY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CONTAINER_SPEC' title='"+containerSpec+"' class='datagrid-cell "+ms.tdClass(formId, 'CONTAINER_SPEC')+"' style='width:70px;"+ms.tdStyle(formId, 'CONTAINER_SPEC')+"' "+ms.tdEvent(formId, 'CONTAINER_SPEC')+">")
                arrHtml.push("<span colno='CONTAINER_SPEC' class='"+ms.uiClass(formId, 'CONTAINER_SPEC')+"' style='"+ms.uiStyle(formId, 'CONTAINER_SPEC')+"' "+ms.uiEvent(formId, 'CONTAINER_SPEC')+" title='"+v['CONTAINER_SPEC']+"'>"+v['CONTAINER_SPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='STATE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'STATE_FLAG')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'STATE_FLAG')+"' "+ms.tdEvent(formId, 'STATE_FLAG')+">")
                arrHtml.push("<span colno='STATE_FLAG' class='"+ms.uiClass(formId, 'STATE_FLAG')+"' style='"+ms.uiStyle(formId, 'STATE_FLAG')+"' "+ms.uiEvent(formId, 'STATE_FLAG')+" title='"+v['STATE_FLAG']+"'>"+v['STATE_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
                arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'MO_NUMBER')+"' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+v['MO_NUMBER']+"'>"+v['MO_NUMBER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='AREA_ID' title='"+areaId+"' class='datagrid-cell "+ms.tdClass(formId, 'AREA_ID')+"' style='width:110px;"+ms.tdStyle(formId, 'AREA_ID')+"' "+ms.tdEvent(formId, 'AREA_ID')+">")
                arrHtml.push("<span colno='AREA_ID' class='"+ms.uiClass(formId, 'AREA_ID')+"' style='"+ms.uiStyle(formId, 'AREA_ID')+"' "+ms.uiEvent(formId, 'AREA_ID')+" title='"+v['AREA_ID']+"'>"+v['AREA_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_USER')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'EDIT_USER')+"' "+ms.tdEvent(formId, 'EDIT_USER')+">")
                arrHtml.push("<span colno='EDIT_USER' class='"+ms.uiClass(formId, 'EDIT_USER')+"' style='"+ms.uiStyle(formId, 'EDIT_USER')+"' "+ms.uiEvent(formId, 'EDIT_USER')+" title='"+v['EDIT_USER']+"'>"+v['EDIT_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
                arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+v['EDIT_TIME']+"'>"+v['EDIT_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
   
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
