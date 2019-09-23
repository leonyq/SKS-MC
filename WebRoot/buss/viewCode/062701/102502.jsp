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
		<dict:lang value="T_CITY" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="0aa4f0cbbee94c71a5707eb111a2b47c"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="0ed48239536347f4a4510a66d4d7631e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="0ed48239536347f4a4510a66d4d7631e" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0aa4f0cbbee94c71a5707eb111a2b47c" id="formPage0aa4f0cbbee94c71a5707eb111a2b47c" value="${formPage0aa4f0cbbee94c71a5707eb111a2b47c}"/>
		<input type="hidden" name="formId" id="formId1" value='0aa4f0cbbee94c71a5707eb111a2b47c'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0aa4f0cbbee94c71a5707eb111a2b47c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0aa4f0cbbee94c71a5707eb111a2b47c" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0aa4f0cbbee94c71a5707eb111a2b47c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0aa4f0cbbee94c71a5707eb111a2b47c">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="0aa4f0cbbee94c71a5707eb111a2b47c" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0aa4f0cbbee94c71a5707eb111a2b47c" onclick="_selectAjaxTableAllData(this,'0aa4f0cbbee94c71a5707eb111a2b47c')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_PROVINCE" class="datagrid-cell"><bu:uitn colNo="PROVINCE" formId="0aa4f0cbbee94c71a5707eb111a2b47c" /></td>
			<td name="noprintset_CITY" class="datagrid-cell"><bu:uitn colNo="CITY" formId="0aa4f0cbbee94c71a5707eb111a2b47c" /></td>
			<td name="noprintset_TOWN" class="datagrid-cell"><bu:uitn colNo="TOWN" formId="0aa4f0cbbee94c71a5707eb111a2b47c" /></td>
			<td name="noprintset_VILLAGE" class="datagrid-cell"><bu:uitn colNo="VILLAGE" formId="0aa4f0cbbee94c71a5707eb111a2b47c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0aa4f0cbbee94c71a5707eb111a2b47c" onscroll="ajaxTableScroll(this,'0aa4f0cbbee94c71a5707eb111a2b47c')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0aa4f0cbbee94c71a5707eb111a2b47c">
		<tbody id="tbody_0aa4f0cbbee94c71a5707eb111a2b47c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0aa4f0cbbee94c71a5707eb111a2b47c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0aa4f0cbbee94c71a5707eb111a2b47c&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('0aa4f0cbbee94c71a5707eb111a2b47c','1');">打印</button>
 </div>
 </div>
 <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
 <table id="printset_tab" class="basic-table" style="text-align: center;margin-top:10px;">
 <tr>
 <td style="width: 100px;text-align: right;">列字段</td>
 <td style="padding-left: 5px;">是否打印</td>
 <td style="padding-left: 5px;">打印列宽</td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>序号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SEQ" value="30" title_name="序号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>省</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROVINCE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROVINCE" value="" title_name="省" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?市</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CITY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CITY" value="" title_name="?市" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?镇</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TOWN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TOWN" value="" title_name="?镇" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?村</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="VILLAGE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="VILLAGE" value="" title_name="?村" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="0ed48239536347f4a4510a66d4d7631e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0ed48239536347f4a4510a66d4d7631e" />
    
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
    if(formId=='0aa4f0cbbee94c71a5707eb111a2b47c'){<%--T_CITY--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROVINCE' name='noprintset_PROVINCE' class='datagrid-cell "+ms.tdClass(formId, 'PROVINCE')+"' style='"+ms.tdStyle(formId, 'PROVINCE')+"' "+ms.tdEvent(formId, 'PROVINCE')+">")
            arrHtml.push("<span colno='PROVINCE' class='"+ms.uiClass(formId, 'PROVINCE')+"' style='"+ms.uiStyle(formId, 'PROVINCE')+"' "+ms.uiEvent(formId, 'PROVINCE')+" title='"+ms.titleAttr(formId,'PROVINCE','IS_TITLE_ATTR',v)+"' >"+v['PROVINCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CITY' name='noprintset_CITY' class='datagrid-cell "+ms.tdClass(formId, 'CITY')+"' style='"+ms.tdStyle(formId, 'CITY')+"' "+ms.tdEvent(formId, 'CITY')+">")
            arrHtml.push("<span colno='CITY' class='"+ms.uiClass(formId, 'CITY')+"' style='"+ms.uiStyle(formId, 'CITY')+"' "+ms.uiEvent(formId, 'CITY')+" title='"+ms.titleAttr(formId,'CITY','IS_TITLE_ATTR',v)+"' >"+v['CITY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TOWN' name='noprintset_TOWN' class='datagrid-cell "+ms.tdClass(formId, 'TOWN')+"' style='"+ms.tdStyle(formId, 'TOWN')+"' "+ms.tdEvent(formId, 'TOWN')+">")
            arrHtml.push("<span colno='TOWN' class='"+ms.uiClass(formId, 'TOWN')+"' style='"+ms.uiStyle(formId, 'TOWN')+"' "+ms.uiEvent(formId, 'TOWN')+" title='"+ms.titleAttr(formId,'TOWN','IS_TITLE_ATTR',v)+"' >"+v['TOWN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VILLAGE' name='noprintset_VILLAGE' class='datagrid-cell "+ms.tdClass(formId, 'VILLAGE')+"' style='"+ms.tdStyle(formId, 'VILLAGE')+"' "+ms.tdEvent(formId, 'VILLAGE')+">")
            arrHtml.push("<span colno='VILLAGE' class='"+ms.uiClass(formId, 'VILLAGE')+"' style='"+ms.uiStyle(formId, 'VILLAGE')+"' "+ms.uiEvent(formId, 'VILLAGE')+" title='"+ms.titleAttr(formId,'VILLAGE','IS_TITLE_ATTR',v)+"' >"+v['VILLAGE']+"</span>")
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
    setScroll(formId);
}
</script><script>
<%--生成异步表格--%>
function createTableModel_print(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='0aa4f0cbbee94c71a5707eb111a2b47c'){<%--T_CITY--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='PROVINCE' name='noprintset_PROVINCE' class='datagrid-cell "+ms.tdClass(formId, 'PROVINCE')+"' style='"+ms.tdStyle(formId, 'PROVINCE')+"' "+ms.tdEvent(formId, 'PROVINCE')+">")
            arrHtml.push("<span colno='PROVINCE' class='"+ms.uiClass(formId, 'PROVINCE')+"' style='"+ms.uiStyle(formId, 'PROVINCE')+"' "+ms.uiEvent(formId, 'PROVINCE')+" title='"+ms.titleAttr(formId,'PROVINCE','IS_TITLE_ATTR',v)+"' >"+v['PROVINCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CITY' name='noprintset_CITY' class='datagrid-cell "+ms.tdClass(formId, 'CITY')+"' style='"+ms.tdStyle(formId, 'CITY')+"' "+ms.tdEvent(formId, 'CITY')+">")
            arrHtml.push("<span colno='CITY' class='"+ms.uiClass(formId, 'CITY')+"' style='"+ms.uiStyle(formId, 'CITY')+"' "+ms.uiEvent(formId, 'CITY')+" title='"+ms.titleAttr(formId,'CITY','IS_TITLE_ATTR',v)+"' >"+v['CITY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TOWN' name='noprintset_TOWN' class='datagrid-cell "+ms.tdClass(formId, 'TOWN')+"' style='"+ms.tdStyle(formId, 'TOWN')+"' "+ms.tdEvent(formId, 'TOWN')+">")
            arrHtml.push("<span colno='TOWN' class='"+ms.uiClass(formId, 'TOWN')+"' style='"+ms.uiStyle(formId, 'TOWN')+"' "+ms.uiEvent(formId, 'TOWN')+" title='"+ms.titleAttr(formId,'TOWN','IS_TITLE_ATTR',v)+"' >"+v['TOWN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VILLAGE' name='noprintset_VILLAGE' class='datagrid-cell "+ms.tdClass(formId, 'VILLAGE')+"' style='"+ms.tdStyle(formId, 'VILLAGE')+"' "+ms.tdEvent(formId, 'VILLAGE')+">")
            arrHtml.push("<span colno='VILLAGE' class='"+ms.uiClass(formId, 'VILLAGE')+"' style='"+ms.uiStyle(formId, 'VILLAGE')+"' "+ms.uiEvent(formId, 'VILLAGE')+" title='"+ms.titleAttr(formId,'VILLAGE','IS_TITLE_ATTR',v)+"' >"+v['VILLAGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll(formId);
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
