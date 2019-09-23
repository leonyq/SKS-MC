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
		<dict:lang value="VM-仓库单据信息" />
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
		<bu:header formId ="4aa1b94ead7a4014a51b26b4cdb69a6f"/>

    
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
		<bu:func viewId="f4c3cfb840234a24b5ac7135d783b7e3" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="f4c3cfb840234a24b5ac7135d783b7e3" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage4aa1b94ead7a4014a51b26b4cdb69a6f" id="formPage4aa1b94ead7a4014a51b26b4cdb69a6f" value="${formPage4aa1b94ead7a4014a51b26b4cdb69a6f}"/>
		<input type="hidden" name="formId" id="formId1" value='4aa1b94ead7a4014a51b26b4cdb69a6f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4aa1b94ead7a4014a51b26b4cdb69a6f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4aa1b94ead7a4014a51b26b4cdb69a6f" style="overflow-x:hidden;">
		<div class="datagrid-header ">
		<div class="datagrid-header-inner head1" id="datagrid-header-inner4aa1b94ead7a4014a51b26b4cdb69a6f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4aa1b94ead7a4014a51b26b4cdb69a6f" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4aa1b94ead7a4014a51b26b4cdb69a6f" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4aa1b94ead7a4014a51b26b4cdb69a6f" onclick="_selectAjaxTableAllData(this,'4aa1b94ead7a4014a51b26b4cdb69a6f')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WDI_DOC_NUM" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WDI_STATUS" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WDI_URGENT_FLAG" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell"style="width:120px;"><bu:uitn colNo="WDI_SUP_CODE" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WDI_CUST_CODE" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>			
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WDI_DOC_TYPE" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WDI_DISPATCH_TYPE" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WDI_CREATE_MAN" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WDI_CREATE_TIME" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="T2#NAME" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WDI_CLOSE_TIME" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WDI_MEMO" formId="4aa1b94ead7a4014a51b26b4cdb69a6f" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" id="tableDiv4aa1b94ead7a4014a51b26b4cdb69a6f" onscroll="ajaxTableScroll(this,'4aa1b94ead7a4014a51b26b4cdb69a6f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4aa1b94ead7a4014a51b26b4cdb69a6f" >
		<tbody id="tbody_4aa1b94ead7a4014a51b26b4cdb69a6f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4aa1b94ead7a4014a51b26b4cdb69a6f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4aa1b94ead7a4014a51b26b4cdb69a6f&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="f4c3cfb840234a24b5ac7135d783b7e3" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="f4c3cfb840234a24b5ac7135d783b7e3" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
    function query(thisObj){
         var formId = $("#formId1").val();
      $('.scroll1').mCustomScrollbar("destroy");
                      
                  try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                     listAjaxTable(formId);
                     setPopScroll('.scroll1','.head1');

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
    if(formId=='4aa1b94ead7a4014a51b26b4cdb69a6f'){<%--FM-仓库单据信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v['DATA_AUTH']+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WDI_DOC_NUM')+"' style='width:150px;"+ms.tdStyle(formId, 'WDI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WDI_DOC_NUM')+">")
            arrHtml.push("<span colno='WDI_DOC_NUM' class='"+ms.uiClass(formId, 'WDI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WDI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WDI_DOC_NUM')+" title='"+v['WDI_DOC_NUM']+"' >"+v['WDI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WDI_STATUS')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WDI_STATUS')+"' "+ms.tdEvent(formId, 'WDI_STATUS')+">")
            arrHtml.push("<span colno='WDI_STATUS' class='"+ms.uiClass(formId, 'WDI_STATUS')+"' style='"+ms.uiStyle(formId, 'WDI_STATUS')+"' "+ms.uiEvent(formId, 'WDI_STATUS')+" title='"+v['WDI_STATUS']+"' >"+v['WDI_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_URGENT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WDI_URGENT_FLAG')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WDI_URGENT_FLAG')+"' "+ms.tdEvent(formId, 'WDI_URGENT_FLAG')+">")
            arrHtml.push("<span colno='WDI_URGENT_FLAG' class='"+ms.uiClass(formId, 'WDI_URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'WDI_URGENT_FLAG')+"' "+ms.uiEvent(formId, 'WDI_URGENT_FLAG')+" title='"+v['WDI_URGENT_FLAG']+"' >"+v['WDI_URGENT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WDI_SUP_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WDI_SUP_CODE')+"' "+ms.tdEvent(formId, 'WDI_SUP_CODE')+">")
            arrHtml.push("<span colno='WDI_SUP_CODE' class='"+ms.uiClass(formId, 'WDI_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WDI_SUP_CODE')+"' "+ms.uiEvent(formId, 'WDI_SUP_CODE')+" title='"+v['WDI_SUP_CODE']+"' >"+v['WDI_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WDI_CUST_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WDI_CUST_CODE')+"' "+ms.tdEvent(formId, 'WDI_CUST_CODE')+">")
            arrHtml.push("<span colno='WDI_CUST_CODE' class='"+ms.uiClass(formId, 'WDI_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WDI_CUST_CODE')+"' "+ms.uiEvent(formId, 'WDI_CUST_CODE')+" title='"+v['WDI_CUST_CODE']+"' >"+v['WDI_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_DOC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WDI_DOC_TYPE')+"' style='width:90px;"+ms.tdStyle(formId, 'WDI_DOC_TYPE')+"' "+ms.tdEvent(formId, 'WDI_DOC_TYPE')+">")
            arrHtml.push("<span colno='WDI_DOC_TYPE' class='"+ms.uiClass(formId, 'WDI_DOC_TYPE')+"' style='"+ms.uiStyle(formId, 'WDI_DOC_TYPE')+"' "+ms.uiEvent(formId, 'WDI_DOC_TYPE')+" title='"+v['WDI_DOC_TYPE']+"' >"+v['WDI_DOC_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_DISPATCH_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WDI_DISPATCH_TYPE')+"' style='width:90px;"+ms.tdStyle(formId, 'WDI_DISPATCH_TYPE')+"' "+ms.tdEvent(formId, 'WDI_DISPATCH_TYPE')+">")
            arrHtml.push("<span colno='WDI_DISPATCH_TYPE' class='"+ms.uiClass(formId, 'WDI_DISPATCH_TYPE')+"' style='"+ms.uiStyle(formId, 'WDI_DISPATCH_TYPE')+"' "+ms.uiEvent(formId, 'WDI_DISPATCH_TYPE')+" title='"+v['WDI_DISPATCH_TYPE']+"' >"+v['WDI_DISPATCH_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_CREATE_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WDI_CREATE_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WDI_CREATE_MAN')+"' "+ms.tdEvent(formId, 'WDI_CREATE_MAN')+">")
            arrHtml.push("<span colno='WDI_CREATE_MAN' class='"+ms.uiClass(formId, 'WDI_CREATE_MAN')+"' style='"+ms.uiStyle(formId, 'WDI_CREATE_MAN')+"' "+ms.uiEvent(formId, 'WDI_CREATE_MAN')+" title='"+v['WDI_CREATE_MAN']+"' >"+v['WDI_CREATE_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WDI_CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WDI_CREATE_TIME')+"' "+ms.tdEvent(formId, 'WDI_CREATE_TIME')+">")
            arrHtml.push("<span colno='WDI_CREATE_TIME' class='"+ms.uiClass(formId, 'WDI_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'WDI_CREATE_TIME')+"' "+ms.uiEvent(formId, 'WDI_CREATE_TIME')+" title='"+v['WDI_CREATE_TIME']+"' >"+v['WDI_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'T2#NAME')+"' "+ms.tdEvent(formId, 'T2#NAME')+">")
            arrHtml.push("<span colno='T2#NAME' class='"+ms.uiClass(formId, 'T2#NAME')+"' style='"+ms.uiStyle(formId, 'T2#NAME')+"' "+ms.uiEvent(formId, 'T2#NAME')+" title='"+v['T2#NAME']+"' >"+v['T2#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_CLOSE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WDI_CLOSE_TIME')+"' style='width:140px;text-align:center;width:150px;"+ms.tdStyle(formId, 'WDI_CLOSE_TIME')+"' "+ms.tdEvent(formId, 'WDI_CLOSE_TIME')+">")
            arrHtml.push("<span colno='WDI_CLOSE_TIME' class='"+ms.uiClass(formId, 'WDI_CLOSE_TIME')+"' style='"+ms.uiStyle(formId, 'WDI_CLOSE_TIME')+"' "+ms.uiEvent(formId, 'WDI_CLOSE_TIME')+" title='"+v['WDI_CLOSE_TIME']+"' >"+v['WDI_CLOSE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDI_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WDI_MEMO')+"' style='width:150px;"+ms.tdStyle(formId, 'WDI_MEMO')+"' "+ms.tdEvent(formId, 'WDI_MEMO')+">")
            arrHtml.push("<span colno='WDI_MEMO' class='"+ms.uiClass(formId, 'WDI_MEMO')+"' style='"+ms.uiStyle(formId, 'WDI_MEMO')+"' "+ms.uiEvent(formId, 'WDI_MEMO')+" title='"+v['WDI_MEMO']+"' >"+v['WDI_MEMO']+"</span>")
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

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WDI_DOC_NUM").val(jumpId);
                  
                  }  
                    listAjaxTable($("#formId1").val());
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
