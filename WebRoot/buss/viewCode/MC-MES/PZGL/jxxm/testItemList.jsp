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
		<dict:lang value="品质检测项目列表" />
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
		<bu:header formId ="737e3d7aac9c49c2ace9d8c0b212a2f5"/>

    
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
		<bu:func viewId="27711efe1d6a4b7d95f70dd1c39357ea" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="27711efe1d6a4b7d95f70dd1c39357ea" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage737e3d7aac9c49c2ace9d8c0b212a2f5" id="formPage737e3d7aac9c49c2ace9d8c0b212a2f5" value="${formPage737e3d7aac9c49c2ace9d8c0b212a2f5}"/>
		<input type="hidden" name="formId" id="formId1" value='737e3d7aac9c49c2ace9d8c0b212a2f5'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="737e3d7aac9c49c2ace9d8c0b212a2f5">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax737e3d7aac9c49c2ace9d8c0b212a2f5" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner737e3d7aac9c49c2ace9d8c0b212a2f5">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable737e3d7aac9c49c2ace9d8c0b212a2f5" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="737e3d7aac9c49c2ace9d8c0b212a2f5" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_737e3d7aac9c49c2ace9d8c0b212a2f5" onclick="_selectAjaxTableAllData(this,'737e3d7aac9c49c2ace9d8c0b212a2f5')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QTI_TEST_STEP" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QTI_DEFAULT_FLAG" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QTI_ITEM_SN" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QTI_ITEM_NAME" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QTI_ITEM_TYPE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QTI_ITEM_CLASS" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QTI_ITEM_MAXVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QTI_ITEM_MINVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QTI_ITEM_UNIT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QTI_TEST_METHOD" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="QTI_TEST_CONTENT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QTI_TEST_SEQ" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv737e3d7aac9c49c2ace9d8c0b212a2f5" onscroll="ajaxTableScroll(this,'737e3d7aac9c49c2ace9d8c0b212a2f5')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax737e3d7aac9c49c2ace9d8c0b212a2f5" >
		<tbody id="tbody_737e3d7aac9c49c2ace9d8c0b212a2f5" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage737e3d7aac9c49c2ace9d8c0b212a2f5==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=737e3d7aac9c49c2ace9d8c0b212a2f5&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="27711efe1d6a4b7d95f70dd1c39357ea" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="27711efe1d6a4b7d95f70dd1c39357ea" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
<%--生成异步表格--%>

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
    	//checkboxAll("joblist");
  	}
     function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#QTI_ITEM_SN").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }

function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='737e3d7aac9c49c2ace9d8c0b212a2f5'){<%--品质检测项目信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QTI_TEST_STEP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QTI_TEST_STEP')+"' "+ms.tdEvent(formId, 'QTI_TEST_STEP')+">")
            arrHtml.push("<span colno='QTI_TEST_STEP' class='"+ms.uiClass(formId, 'QTI_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QTI_TEST_STEP')+"' "+ms.uiEvent(formId, 'QTI_TEST_STEP')+" title='"+ms.titleAttr(formId,'QTI_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QTI_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QTI_DEFAULT_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QTI_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'QTI_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='QTI_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'QTI_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'QTI_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'QTI_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'QTI_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QTI_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'QTI_ITEM_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'QTI_ITEM_SN')+"' "+ms.tdEvent(formId, 'QTI_ITEM_SN')+">")
            arrHtml.push("<span colno='QTI_ITEM_SN' class='"+ms.uiClass(formId, 'QTI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'QTI_ITEM_SN')+"' "+ms.uiEvent(formId, 'QTI_ITEM_SN')+" title='"+ms.titleAttr(formId,'QTI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['QTI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QTI_ITEM_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'QTI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QTI_ITEM_NAME')+">")
            arrHtml.push("<span colno='QTI_ITEM_NAME' class='"+ms.uiClass(formId, 'QTI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QTI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QTI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QTI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QTI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QTI_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QTI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'QTI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='QTI_ITEM_TYPE' class='"+ms.uiClass(formId, 'QTI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'QTI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'QTI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'QTI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QTI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_ITEM_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'QTI_ITEM_CLASS')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QTI_ITEM_CLASS')+"' "+ms.tdEvent(formId, 'QTI_ITEM_CLASS')+">")
            arrHtml.push("<span colno='QTI_ITEM_CLASS' class='"+ms.uiClass(formId, 'QTI_ITEM_CLASS')+"' style='"+ms.uiStyle(formId, 'QTI_ITEM_CLASS')+"' "+ms.uiEvent(formId, 'QTI_ITEM_CLASS')+" title='"+ms.titleAttr(formId,'QTI_ITEM_CLASS','IS_TITLE_ATTR',v)+"' >"+v['QTI_ITEM_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_ITEM_MAXVALUE' class='datagrid-cell "+ms.tdClass(formId, 'QTI_ITEM_MAXVALUE')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QTI_ITEM_MAXVALUE')+"' "+ms.tdEvent(formId, 'QTI_ITEM_MAXVALUE')+">")
            arrHtml.push("<span colno='QTI_ITEM_MAXVALUE' class='"+ms.uiClass(formId, 'QTI_ITEM_MAXVALUE')+"' style='"+ms.uiStyle(formId, 'QTI_ITEM_MAXVALUE')+"' "+ms.uiEvent(formId, 'QTI_ITEM_MAXVALUE')+" title='"+ms.titleAttr(formId,'QTI_ITEM_MAXVALUE','IS_TITLE_ATTR',v)+"' >"+v['QTI_ITEM_MAXVALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_ITEM_MINVALUE' class='datagrid-cell "+ms.tdClass(formId, 'QTI_ITEM_MINVALUE')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QTI_ITEM_MINVALUE')+"' "+ms.tdEvent(formId, 'QTI_ITEM_MINVALUE')+">")
            arrHtml.push("<span colno='QTI_ITEM_MINVALUE' class='"+ms.uiClass(formId, 'QTI_ITEM_MINVALUE')+"' style='"+ms.uiStyle(formId, 'QTI_ITEM_MINVALUE')+"' "+ms.uiEvent(formId, 'QTI_ITEM_MINVALUE')+" title='"+ms.titleAttr(formId,'QTI_ITEM_MINVALUE','IS_TITLE_ATTR',v)+"' >"+v['QTI_ITEM_MINVALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_ITEM_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'QTI_ITEM_UNIT')+"' style='width:80px;"+ms.tdStyle(formId, 'QTI_ITEM_UNIT')+"' "+ms.tdEvent(formId, 'QTI_ITEM_UNIT')+">")
            arrHtml.push("<span colno='QTI_ITEM_UNIT' class='"+ms.uiClass(formId, 'QTI_ITEM_UNIT')+"' style='"+ms.uiStyle(formId, 'QTI_ITEM_UNIT')+"' "+ms.uiEvent(formId, 'QTI_ITEM_UNIT')+" title='"+ms.titleAttr(formId,'QTI_ITEM_UNIT','IS_TITLE_ATTR',v)+"' >"+v['QTI_ITEM_UNIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_TEST_METHOD' class='datagrid-cell "+ms.tdClass(formId, 'QTI_TEST_METHOD')+"' style='width:120px;"+ms.tdStyle(formId, 'QTI_TEST_METHOD')+"' "+ms.tdEvent(formId, 'QTI_TEST_METHOD')+">")
            arrHtml.push("<span colno='QTI_TEST_METHOD' class='"+ms.uiClass(formId, 'QTI_TEST_METHOD')+"' style='"+ms.uiStyle(formId, 'QTI_TEST_METHOD')+"' "+ms.uiEvent(formId, 'QTI_TEST_METHOD')+" title='"+ms.titleAttr(formId,'QTI_TEST_METHOD','IS_TITLE_ATTR',v)+"' >"+v['QTI_TEST_METHOD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_TEST_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'QTI_TEST_CONTENT')+"' style='width:180px;"+ms.tdStyle(formId, 'QTI_TEST_CONTENT')+"' "+ms.tdEvent(formId, 'QTI_TEST_CONTENT')+">")
            arrHtml.push("<span colno='QTI_TEST_CONTENT' class='"+ms.uiClass(formId, 'QTI_TEST_CONTENT')+"' style='"+ms.uiStyle(formId, 'QTI_TEST_CONTENT')+"' "+ms.uiEvent(formId, 'QTI_TEST_CONTENT')+" title='"+ms.titleAttr(formId,'QTI_TEST_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['QTI_TEST_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QTI_TEST_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'QTI_TEST_SEQ')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QTI_TEST_SEQ')+"' "+ms.tdEvent(formId, 'QTI_TEST_SEQ')+">")
            arrHtml.push("<span colno='QTI_TEST_SEQ' class='"+ms.uiClass(formId, 'QTI_TEST_SEQ')+"' style='"+ms.uiStyle(formId, 'QTI_TEST_SEQ')+"' "+ms.uiEvent(formId, 'QTI_TEST_SEQ')+" title='"+ms.titleAttr(formId,'QTI_TEST_SEQ','IS_TITLE_ATTR',v)+"' >"+v['QTI_TEST_SEQ']+"</span>")
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
