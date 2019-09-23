<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="工序信息" />
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
		<bu:header formId ="f4bff8054eec43dd9b7ffe75eb0f03ac"/>
         <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="b074327f728643948b734bce9a5f7fc9" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
		<bu:search viewId="b074327f728643948b734bce9a5f7fc9" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPagef4bff8054eec43dd9b7ffe75eb0f03ac" id="formPagef4bff8054eec43dd9b7ffe75eb0f03ac" value="${formPagef4bff8054eec43dd9b7ffe75eb0f03ac}"/>
		<input type="hidden" name="formId" id="formId1" value='f4bff8054eec43dd9b7ffe75eb0f03ac'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="f4bff8054eec43dd9b7ffe75eb0f03ac">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf4bff8054eec43dd9b7ffe75eb0f03ac" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef4bff8054eec43dd9b7ffe75eb0f03ac">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="f4bff8054eec43dd9b7ffe75eb0f03ac" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_f4bff8054eec43dd9b7ffe75eb0f03ac" onclick="_selectAjaxTableAllData(this,'f4bff8054eec43dd9b7ffe75eb0f03ac')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="GROUP_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="GROUP_NAME" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="VALID_FLAG" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;" ><bu:uitn colNo="MS_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="GROUP_DESC" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDivf4bff8054eec43dd9b7ffe75eb0f03ac" onscroll="ajaxTableScroll(this,'f4bff8054eec43dd9b7ffe75eb0f03ac')" style="overflow-x:hidden;">
		<table class="datagrid-btable fixedTable query-list dblClick"  id="datagrid-btable-ajaxf4bff8054eec43dd9b7ffe75eb0f03ac" style="table-layout:fixed;">
		<tbody id="tbody_f4bff8054eec43dd9b7ffe75eb0f03ac" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagef4bff8054eec43dd9b7ffe75eb0f03ac==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=f4bff8054eec43dd9b7ffe75eb0f03ac&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="b074327f728643948b734bce9a5f7fc9" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>		
		<bu:script viewId="b074327f728643948b734bce9a5f7fc9" />
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>		
    <script type="text/javascript">
        function setTableHeight(){
        $(".datagrid-htable").css("width",$(".datagrid-header").width()-20+'px');
        $(".datagrid-btable").css("width",$(".datagrid-header").width()-20+'px');
    }

function reloadPg(msg,title,width,height,time,isCloseWin){
    msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
  }


function reloadPgExe(isCloseWin){
    /* document.forms.search_form.submit();
    util.showTopLoading(); */
    query("formId1");
    if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
    checkboxAll("joblist");
    
  }
    

</script>
<script>
var isFirstSetScroll=0;
//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='f4bff8054eec43dd9b7ffe75eb0f03ac'){<%--工序信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
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
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
                arrHtml.push("</td>");            
                arrHtml.push("<td colno='GROUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'GROUP_CODE')+"' style='width:100px;"+ms.tdStyle(formId, 'GROUP_CODE')+"' "+ms.tdEvent(formId, 'GROUP_CODE')+">")
                arrHtml.push("<span colno='GROUP_CODE' class='"+ms.uiClass(formId, 'GROUP_CODE')+"' style='"+ms.uiStyle(formId, 'GROUP_CODE')+"' "+ms.uiEvent(formId, 'GROUP_CODE')+" title='"+ms.titleAttr(formId,'GROUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['GROUP_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='GROUP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'GROUP_NAME')+"' style='width:100px;"+ms.tdStyle(formId, 'GROUP_NAME')+"' "+ms.tdEvent(formId, 'GROUP_NAME')+">")
                arrHtml.push("<span colno='GROUP_NAME' class='"+ms.uiClass(formId, 'GROUP_NAME')+"' style='"+ms.uiStyle(formId, 'GROUP_NAME')+"' "+ms.uiEvent(formId, 'GROUP_NAME')+" title='"+ms.titleAttr(formId,'GROUP_NAME','IS_TITLE_ATTR',v)+"' >"+v['GROUP_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'VALID_FLAG')+"' style='width:100px;"+ms.tdStyle(formId, 'VALID_FLAG')+"' "+ms.tdEvent(formId, 'VALID_FLAG')+">")
                arrHtml.push("<span colno='VALID_FLAG' class='"+ms.uiClass(formId, 'VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'VALID_FLAG')+"' "+ms.uiEvent(formId, 'VALID_FLAG')+" title='"+ms.titleAttr(formId,'VALID_FLAG','IS_TITLE_ATTR',v)+"' >"+v['VALID_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MS_CODE' class='datagrid-cell "+ms.tdClass(formId, 'MS_CODE')+"' style='width:100px;"+ms.tdStyle(formId, 'MS_CODE')+"' "+ms.tdEvent(formId, 'MS_CODE')+">")
                arrHtml.push("<span colno='MS_CODE' class='"+ms.uiClass(formId, 'MS_CODE')+"' style='"+ms.uiStyle(formId, 'MS_CODE')+"' "+ms.uiEvent(formId, 'MS_CODE')+" title='"+ms.titleAttr(formId,'MS_CODE','IS_TITLE_ATTR',v)+"' >"+v['MS_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='GROUP_DESC' class='datagrid-cell "+ms.tdClass(formId, 'GROUP_DESC')+"' style='width:100px;"+ms.tdStyle(formId, 'GROUP_DESC')+"' "+ms.tdEvent(formId, 'GROUP_DESC')+">")
                arrHtml.push("<span colno='GROUP_DESC' class='"+ms.uiClass(formId, 'GROUP_DESC')+"' style='"+ms.uiStyle(formId, 'GROUP_DESC')+"' "+ms.uiEvent(formId, 'GROUP_DESC')+" title='"+ms.titleAttr(formId,'GROUP_DESC','IS_TITLE_ATTR',v)+"' >"+v['GROUP_DESC']+"</span>")
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
    	setPopScroll(".scroll","head");
    }
}
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
   
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>