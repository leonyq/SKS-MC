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
		<dict:lang value="VM-禁用物料-列表" />
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
		<bu:header formId ="09206fb514ca4b258beb531bc903334b"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="176de10501914dd4baa0730679545b2d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="176de10501914dd4baa0730679545b2d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage09206fb514ca4b258beb531bc903334b" id="formPage09206fb514ca4b258beb531bc903334b" value="${formPage09206fb514ca4b258beb531bc903334b}"/>
		<input type="hidden" name="formId" id="formId1" value='09206fb514ca4b258beb531bc903334b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="09206fb514ca4b258beb531bc903334b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax09206fb514ca4b258beb531bc903334b"style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head" id="datagrid-header-inner09206fb514ca4b258beb531bc903334b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable09206fb514ca4b258beb531bc903334b" style="min-width:1100px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="09206fb514ca4b258beb531bc903334b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_09206fb514ca4b258beb531bc903334b" onclick="_selectAjaxTableAllData(this,'09206fb514ca4b258beb531bc903334b')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CF_MODEL_CODE_VER" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDiv09206fb514ca4b258beb531bc903334b" onscroll="ajaxTableScroll(this,'09206fb514ca4b258beb531bc903334b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax09206fb514ca4b258beb531bc903334b" style="min-width:1100px;">
		<tbody id="tbody_09206fb514ca4b258beb531bc903334b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage09206fb514ca4b258beb531bc903334b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=09206fb514ca4b258beb531bc903334b&showLoading=0" />
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
		<bu:submit viewId="176de10501914dd4baa0730679545b2d" />
		<bu:script viewId="176de10501914dd4baa0730679545b2d" />
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
    if(formId=='09206fb514ca4b258beb531bc903334b'){<%--禁用物料--%>
    $('.scroll').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var itemCode=v['CF_ITEM_CODE'];
            var itemName=v['CF_ITEM_NAME'];
            var itemDesc=v['CF_ITEM_DESC'];
            var memo=v['CF_MEMO'];
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='CF_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CF_TYPE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CF_TYPE')+"' "+ms.tdEvent(formId, 'CF_TYPE')+">")
            arrHtml.push("<span colno='CF_TYPE' class='"+ms.uiClass(formId, 'CF_TYPE')+"' style='"+ms.uiStyle(formId, 'CF_TYPE')+"' "+ms.uiEvent(formId, 'CF_TYPE')+" >"+v['CF_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'CF_PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'CF_PROJECT_ID')+"' "+ms.tdEvent(formId, 'CF_PROJECT_ID')+">")
            arrHtml.push("<span colno='CF_PROJECT_ID' class='"+ms.uiClass(formId, 'CF_PROJECT_ID')+"' onclick='itemJump1(\""+v['CF_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CF_PROJECT_ID')+" >"+v['CF_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CF_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CF_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CF_MODEL_CODE')+">")
            arrHtml.push("<span colno='CF_MODEL_CODE' class='"+ms.uiClass(formId, 'CF_MODEL_CODE')+"' onclick='itemJump2(\""+v['CF_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CF_MODEL_CODE')+" >"+v['CF_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_MODEL_CODE_VER' class='datagrid-cell "+ms.tdClass(formId, 'CF_MODEL_CODE_VER')+"' style='width:150px;"+ms.tdStyle(formId, 'CF_MODEL_CODE_VER')+"' "+ms.tdEvent(formId, 'CF_MODEL_CODE_VER')+">")
            arrHtml.push("<span colno='CF_MODEL_CODE_VER' class='"+ms.uiClass(formId, 'CF_MODEL_CODE_VER')+"' style='"+ms.uiStyle(formId, 'CF_MODEL_CODE_VER')+"' "+ms.uiEvent(formId, 'CF_MODEL_CODE_VER')+" >"+v['CF_MODEL_CODE_VER']+"</span>")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='CF_ITEM_CODE' title='"+itemCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CF_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CF_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CF_ITEM_CODE')+">")
            arrHtml.push("<span colno='CF_ITEM_CODE' class='"+ms.uiClass(formId, 'CF_ITEM_CODE')+"' onclick='itemJump3(\""+v['CF_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CF_ITEM_CODE')+" >"+v['CF_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_ITEM_NAME' title='"+itemName+"' class='datagrid-cell "+ms.tdClass(formId, 'CF_ITEM_NAME')+"' style='width:110px;"+ms.tdStyle(formId, 'CF_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CF_ITEM_NAME')+">")
            arrHtml.push("<span colno='CF_ITEM_NAME' class='"+ms.uiClass(formId, 'CF_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CF_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CF_ITEM_NAME')+" >"+v['CF_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_ITEM_DESC' title='"+itemDesc+"' class='datagrid-cell "+ms.tdClass(formId, 'CF_ITEM_DESC')+"' style='width:110px;"+ms.tdStyle(formId, 'CF_ITEM_DESC')+"' "+ms.tdEvent(formId, 'CF_ITEM_DESC')+">")
            arrHtml.push("<span colno='CF_ITEM_DESC' class='"+ms.uiClass(formId, 'CF_ITEM_DESC')+"' style='"+ms.uiStyle(formId, 'CF_ITEM_DESC')+"' "+ms.uiEvent(formId, 'CF_ITEM_DESC')+" >"+v['CF_ITEM_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CF_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CF_STATUS')+"' "+ms.tdEvent(formId, 'CF_STATUS')+">")
            arrHtml.push("<span colno='CF_STATUS' class='"+ms.uiClass(formId, 'CF_STATUS')+"' style='"+ms.uiStyle(formId, 'CF_STATUS')+"' "+ms.uiEvent(formId, 'CF_STATUS')+" >"+v['CF_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_MEMO' title='"+memo+"' class='datagrid-cell "+ms.tdClass(formId, 'CF_MEMO')+"' style='"+ms.tdStyle(formId, 'CF_MEMO')+"' "+ms.tdEvent(formId, 'CF_MEMO')+">")
            arrHtml.push("<span colno='CF_MEMO' class='"+ms.uiClass(formId, 'CF_MEMO')+"' style='"+ms.uiStyle(formId, 'CF_MEMO')+"' "+ms.uiEvent(formId, 'CF_MEMO')+" >"+v['CF_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
       // setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    //setTableWidth(formId);
//if(isFirstSetScroll == 0){
  //  	isFirstSetScroll =1;
    //	setScroll();
   // }
   setTableWidth(formId);
    //setScroll();
    setPopScroll('.scroll','.head')
     $(".head").scrollLeft(0);
}
/*
//物料料号弹出选择窗调用，别删
function cbFus(){
    
}
*/
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//工单信息
function itemJump1(obj){
      winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
}  


//BOM管理
function itemJump2(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 

//物料信息
function itemJump3(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
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