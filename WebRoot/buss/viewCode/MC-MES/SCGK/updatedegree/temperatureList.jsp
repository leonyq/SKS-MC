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
		<dict:lang value="温度曲线上传" />
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
		<bu:header formId ="ec819630ac4041b1ace478a3c5163782"/>

    
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
		<bu:func viewId="45e331974224478599cf82069afa3bef" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="45e331974224478599cf82069afa3bef" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageec819630ac4041b1ace478a3c5163782" id="formPageec819630ac4041b1ace478a3c5163782" value="${formPageec819630ac4041b1ace478a3c5163782}"/>
		<input type="hidden" name="formId" id="formId1" value='ec819630ac4041b1ace478a3c5163782'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="ec819630ac4041b1ace478a3c5163782">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxec819630ac4041b1ace478a3c5163782" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerec819630ac4041b1ace478a3c5163782">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableec819630ac4041b1ace478a3c5163782">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ec819630ac4041b1ace478a3c5163782" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ec819630ac4041b1ace478a3c5163782" onclick="_selectAjaxTableAllData(this,'ec819630ac4041b1ace478a3c5163782')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" /></td>	
		    <td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="T2#CA_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			
		
			
			
		<!--	<td class="datagrid-cell"><bu:uitn colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td> -->
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivec819630ac4041b1ace478a3c5163782" onscroll="ajaxTableScroll(this,'ec819630ac4041b1ace478a3c5163782')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxec819630ac4041b1ace478a3c5163782">
		<tbody id="tbody_ec819630ac4041b1ace478a3c5163782" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageec819630ac4041b1ace478a3c5163782==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ec819630ac4041b1ace478a3c5163782&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="45e331974224478599cf82069afa3bef" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="45e331974224478599cf82069afa3bef" />
    
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
    if(formId=='ec819630ac4041b1ace478a3c5163782'){<%--温度曲线信息表--%>
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
            arrHtml.push("<td colno='MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='width:140px;"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' onclick='itemJump1(\""+v['MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='P#PM_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'P#PM_PROJECT_ID')+"' style='width:140px;width:140px;"+ms.tdStyle(formId, 'P#PM_PROJECT_ID')+"' "+ms.tdEvent(formId, 'P#PM_PROJECT_ID')+">")
            arrHtml.push("<span colno='P#PM_PROJECT_ID' class='"+ms.uiClass(formId, 'P#PM_PROJECT_ID')+"' onclick='itemJump2(\""+v['P#PM_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'P#PM_PROJECT_ID')+" title='"+ms.titleAttr(formId,'P#PM_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['P#PM_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='P#PM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'P#PM_MODEL_CODE')+"' style='width:140px;"+ms.tdStyle(formId, 'P#PM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'P#PM_MODEL_CODE')+">")
            arrHtml.push("<span colno='P#PM_MODEL_CODE' class='"+ms.uiClass(formId, 'P#PM_MODEL_CODE')+"' onclick='itemJump3(\""+v['P#PM_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'P#PM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'P#PM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['P#PM_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CA_NAME')+"' style='width:140px;"+ms.tdStyle(formId, 'T2#CA_NAME')+"' "+ms.tdEvent(formId, 'T2#CA_NAME')+">")
            arrHtml.push("<span colno='T2#CA_NAME' class='"+ms.uiClass(formId, 'T2#CA_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CA_NAME')+"' "+ms.uiEvent(formId, 'T2#CA_NAME')+" title='"+ms.titleAttr(formId,'T2#CA_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'WORK_STATION')+"' style='width:140px;"+ms.tdStyle(formId, 'WORK_STATION')+"' "+ms.tdEvent(formId, 'WORK_STATION')+">")
            arrHtml.push("<span colno='WORK_STATION' class='"+ms.uiClass(formId, 'WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WORK_STATION')+"' "+ms.uiEvent(formId, 'WORK_STATION')+" title='"+ms.titleAttr(formId,'WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            if(v['CURVE_TYPE']==1){
                v['CURVE_TYPE']='正常';
            }if(v['CURVE_TYPE']==2){
                v['CURVE_TYPE']='偏高';
            }if(v['CURVE_TYPE']==3){
                v['CURVE_TYPE']='偏低';
            }
            arrHtml.push("<td  style='text-align:center' colno='CURVE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CURVE_TYPE')+"' style='width:140px;"+ms.tdStyle(formId, 'CURVE_TYPE')+"' "+ms.tdEvent(formId, 'CURVE_TYPE')+">")
            arrHtml.push("<span colno='CURVE_TYPE' class='"+ms.uiClass(formId, 'CURVE_TYPE')+"' style='"+ms.uiStyle(formId, 'CURVE_TYPE')+"' "+ms.uiEvent(formId, 'CURVE_TYPE')+" title='"+ms.titleAttr(formId,'CURVE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CURVE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BEGIN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'BEGIN_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'BEGIN_TIME')+"' "+ms.tdEvent(formId, 'BEGIN_TIME')+">")
            arrHtml.push("<span colno='BEGIN_TIME' class='"+ms.uiClass(formId, 'BEGIN_TIME')+"' style='"+ms.uiStyle(formId, 'BEGIN_TIME')+"' "+ms.uiEvent(formId, 'BEGIN_TIME')+" title='"+ms.titleAttr(formId,'BEGIN_TIME','IS_TITLE_ATTR',v)+"' >"+v['BEGIN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'END_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'END_TIME')+"' "+ms.tdEvent(formId, 'END_TIME')+">")
            arrHtml.push("<span colno='END_TIME' class='"+ms.uiClass(formId, 'END_TIME')+"' style='"+ms.uiStyle(formId, 'END_TIME')+"' "+ms.uiEvent(formId, 'END_TIME')+" title='"+ms.titleAttr(formId,'END_TIME','IS_TITLE_ATTR',v)+"' >"+v['END_TIME']+"</span>")
            arrHtml.push("</td>");
            
         
            
            
            
          /* arrHtml.push("<td colno='P#PM_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'P#PM_AREA_SN')+"' style='"+ms.tdStyle(formId, 'P#PM_AREA_SN')+"' "+ms.tdEvent(formId, 'P#PM_AREA_SN')+">")
            arrHtml.push("<span colno='P#PM_AREA_SN' class='"+ms.uiClass(formId, 'P#PM_AREA_SN')+"' style='"+ms.uiStyle(formId, 'P#PM_AREA_SN')+"' "+ms.uiEvent(formId, 'P#PM_AREA_SN')+" title='"+ms.titleAttr(formId,'P#PM_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['P#PM_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='P#PM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'P#PM_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'P#PM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'P#PM_MODEL_CODE')+">")
            arrHtml.push("<span colno='P#PM_MODEL_CODE' class='"+ms.uiClass(formId, 'P#PM_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'P#PM_MODEL_CODE')+"' "+ms.uiEvent(formId, 'P#PM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'P#PM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['P#PM_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='P#PM_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'P#PM_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'P#PM_PROJECT_ID')+"' "+ms.tdEvent(formId, 'P#PM_PROJECT_ID')+">")
            arrHtml.push("<span colno='P#PM_PROJECT_ID' class='"+ms.uiClass(formId, 'P#PM_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'P#PM_PROJECT_ID')+"' "+ms.uiEvent(formId, 'P#PM_PROJECT_ID')+" title='"+ms.titleAttr(formId,'P#PM_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['P#PM_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CURVE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CURVE_TYPE')+"' style='"+ms.tdStyle(formId, 'CURVE_TYPE')+"' "+ms.tdEvent(formId, 'CURVE_TYPE')+">")
            arrHtml.push("<span colno='CURVE_TYPE' class='"+ms.uiClass(formId, 'CURVE_TYPE')+"' style='"+ms.uiStyle(formId, 'CURVE_TYPE')+"' "+ms.uiEvent(formId, 'CURVE_TYPE')+" title='"+ms.titleAttr(formId,'CURVE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CURVE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'WORK_STATION')+"' style='"+ms.tdStyle(formId, 'WORK_STATION')+"' "+ms.tdEvent(formId, 'WORK_STATION')+">")
            arrHtml.push("<span colno='WORK_STATION' class='"+ms.uiClass(formId, 'WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WORK_STATION')+"' "+ms.uiEvent(formId, 'WORK_STATION')+" title='"+ms.titleAttr(formId,'WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'FILE_NAME')+"' style='"+ms.tdStyle(formId, 'FILE_NAME')+"' "+ms.tdEvent(formId, 'FILE_NAME')+">")
            arrHtml.push("<span colno='FILE_NAME' class='"+ms.uiClass(formId, 'FILE_NAME')+"' style='"+ms.uiStyle(formId, 'FILE_NAME')+"' "+ms.uiEvent(formId, 'FILE_NAME')+" title='"+ms.titleAttr(formId,'FILE_NAME','IS_TITLE_ATTR',v)+"' >"+v['FILE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BEGIN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'BEGIN_TIME')+"' style='"+ms.tdStyle(formId, 'BEGIN_TIME')+"' "+ms.tdEvent(formId, 'BEGIN_TIME')+">")
            arrHtml.push("<span colno='BEGIN_TIME' class='"+ms.uiClass(formId, 'BEGIN_TIME')+"' style='"+ms.uiStyle(formId, 'BEGIN_TIME')+"' "+ms.uiEvent(formId, 'BEGIN_TIME')+" title='"+ms.titleAttr(formId,'BEGIN_TIME','IS_TITLE_ATTR',v)+"' >"+v['BEGIN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'END_TIME')+"' style='"+ms.tdStyle(formId, 'END_TIME')+"' "+ms.tdEvent(formId, 'END_TIME')+">")
            arrHtml.push("<span colno='END_TIME' class='"+ms.uiClass(formId, 'END_TIME')+"' style='"+ms.uiStyle(formId, 'END_TIME')+"' "+ms.uiEvent(formId, 'END_TIME')+" title='"+ms.titleAttr(formId,'END_TIME','IS_TITLE_ATTR',v)+"' >"+v['END_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'MO_NUMBER')+"' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");*/
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setScroll();
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
}



</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//BOM管理
function itemJump3(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
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
