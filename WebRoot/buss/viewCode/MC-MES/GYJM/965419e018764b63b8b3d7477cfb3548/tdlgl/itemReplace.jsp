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
		<dict:lang value="VM-替代物料-列表" />
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
		<bu:header formId ="65eec5ae8fa948b0bfaa48c814f5725d"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="dca0305cd0a248e080de8204f1e5fb9e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="dca0305cd0a248e080de8204f1e5fb9e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage65eec5ae8fa948b0bfaa48c814f5725d" id="formPage65eec5ae8fa948b0bfaa48c814f5725d" value="${formPage65eec5ae8fa948b0bfaa48c814f5725d}"/>
		<input type="hidden" name="formId" id="formId1" value='65eec5ae8fa948b0bfaa48c814f5725d'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" name="jumpId2" id="jumpId2" value='${param.jumpId2}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="65eec5ae8fa948b0bfaa48c814f5725d">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax65eec5ae8fa948b0bfaa48c814f5725d" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner65eec5ae8fa948b0bfaa48c814f5725d">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable65eec5ae8fa948b0bfaa48c814f5725d" style="min-width:1360px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="65eec5ae8fa948b0bfaa48c814f5725d" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_65eec5ae8fa948b0bfaa48c814f5725d" onclick="_selectAjaxTableAllData(this,'65eec5ae8fa948b0bfaa48c814f5725d')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CR_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CR_MODEL_CODE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CR_MODEL_CODE_VER" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CR_PROJECT_ID" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CR_MAIN_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CR_MAIN_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CR_ITEM_REPLACE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CR_ITEM_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CR_ITEM_DESC" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CR_STATUS" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_MEMO" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv65eec5ae8fa948b0bfaa48c814f5725d" onscroll="ajaxTableScroll(this,'65eec5ae8fa948b0bfaa48c814f5725d')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax65eec5ae8fa948b0bfaa48c814f5725d" style="min-width:1360px;">
		<tbody id="tbody_65eec5ae8fa948b0bfaa48c814f5725d" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage65eec5ae8fa948b0bfaa48c814f5725d==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=65eec5ae8fa948b0bfaa48c814f5725d&showLoading=0" />
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
		<bu:submit viewId="dca0305cd0a248e080de8204f1e5fb9e" />
		<bu:script viewId="dca0305cd0a248e080de8204f1e5fb9e" />
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
    if(formId=='65eec5ae8fa948b0bfaa48c814f5725d'){<%--替代物料--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var modelCode=v['CR_MODEL_CODE'];
            var proId=v['CR_PROJECT_ID'];
            var itemMain=v['CR_ITEM_MIAN'];
            var mainName=v['CR_MAIN_NAME'];
            var mainType=v['CR_MAIN_TYPE'];
            var itemReplace=v['CR_ITEM_REPLACE'];
            var itemName=v['CR_ITEM_NAME'];
            var itemDesc=v['CR_ITEM_DESC'];
            var memo=v['CR_MEMO'];
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ")
            arrHtml.push("</td>");           
            arrHtml.push("<td colno='CR_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CR_TYPE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CR_TYPE')+"' "+ms.tdEvent(formId, 'CR_TYPE')+">")
            arrHtml.push("<span colno='CR_TYPE' class='"+ms.uiClass(formId, 'CR_TYPE')+"' style='"+ms.uiStyle(formId, 'CR_TYPE')+"' "+ms.uiEvent(formId, 'CR_TYPE')+" >"+v['CR_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_MODEL_CODE' title='"+modelCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_MODEL_CODE')+"' style='width:110px;"+ms.tdStyle(formId, 'CR_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CR_MODEL_CODE')+">")
            arrHtml.push("<span colno='CR_MODEL_CODE' class='"+ms.uiClass(formId, 'CR_MODEL_CODE')+"' onclick='itemJump1(\""+v['CR_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CR_MODEL_CODE')+" >"+v['CR_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_MODEL_CODE_VER' title='"+modelCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_MODEL_CODE_VER')+"' style='width:110px;"+ms.tdStyle(formId, 'CR_MODEL_CODE_VER')+"' "+ms.tdEvent(formId, 'CR_MODEL_CODE_VER')+">")
            arrHtml.push("<span colno='CR_MODEL_CODE_VER' class='"+ms.uiClass(formId, 'CR_MODEL_CODE_VER')+"' style='"+ms.uiStyle(formId, 'CR_MODEL_CODE_VER')+"' "+ms.uiEvent(formId, 'CR_MODEL_CODE_VER')+" >"+v['CR_MODEL_CODE_VER']+"</span>")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='CR_PROJECT_ID' title='"+proId+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_PROJECT_ID')+"' style='width:110px;"+ms.tdStyle(formId, 'CR_PROJECT_ID')+"' "+ms.tdEvent(formId, 'CR_PROJECT_ID')+">")
            arrHtml.push("<span colno='CR_PROJECT_ID' class='"+ms.uiClass(formId, 'CR_PROJECT_ID')+"' onclick='itemJump2(\""+v['CR_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CR_PROJECT_ID')+" >"+v['CR_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_ITEM_MIAN' title='"+itemMain+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_ITEM_MIAN')+"' style='width:140px;"+ms.tdStyle(formId, 'CR_ITEM_MIAN')+"' "+ms.tdEvent(formId, 'CR_ITEM_MIAN')+">")
            arrHtml.push("<span colno='CR_ITEM_MIAN' class='"+ms.uiClass(formId, 'CR_ITEM_MIAN')+"' onclick='itemJump3(\""+v['CR_ITEM_MIAN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CR_ITEM_MIAN')+" >"+v['CR_ITEM_MIAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_MAIN_NAME' title='"+mainName+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_MAIN_NAME')+"' style='width:110px;"+ms.tdStyle(formId, 'CR_MAIN_NAME')+"' "+ms.tdEvent(formId, 'CR_MAIN_NAME')+">")
            arrHtml.push("<span colno='CR_MAIN_NAME' class='"+ms.uiClass(formId, 'CR_MAIN_NAME')+"' style='"+ms.uiStyle(formId, 'CR_MAIN_NAME')+"' "+ms.uiEvent(formId, 'CR_MAIN_NAME')+" >"+v['CR_MAIN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_MAIN_TYPE' title='"+mainType+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_MAIN_TYPE')+"' style='width:110px;"+ms.tdStyle(formId, 'CR_MAIN_TYPE')+"' "+ms.tdEvent(formId, 'CR_MAIN_TYPE')+">")
            arrHtml.push("<span colno='CR_MAIN_TYPE' class='"+ms.uiClass(formId, 'CR_MAIN_TYPE')+"' style='"+ms.uiStyle(formId, 'CR_MAIN_TYPE')+"' "+ms.uiEvent(formId, 'CR_MAIN_TYPE')+" >"+v['CR_MAIN_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_ITEM_REPLACE' title='"+itemReplace+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_ITEM_REPLACE')+"' style='width:140px;"+ms.tdStyle(formId, 'CR_ITEM_REPLACE')+"' "+ms.tdEvent(formId, 'CR_ITEM_REPLACE')+">")
            arrHtml.push("<span colno='CR_ITEM_REPLACE' class='"+ms.uiClass(formId, 'CR_ITEM_REPLACE')+"' onclick='itemJump4(\""+v['CR_ITEM_REPLACE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CR_ITEM_REPLACE')+" >"+v['CR_ITEM_REPLACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_ITEM_NAME' title='"+itemName+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_ITEM_NAME')+"' style='width:110px;"+ms.tdStyle(formId, 'CR_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CR_ITEM_NAME')+">")
            arrHtml.push("<span colno='CR_ITEM_NAME' class='"+ms.uiClass(formId, 'CR_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CR_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CR_ITEM_NAME')+" >"+v['CR_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_ITEM_DESC' title='"+itemDesc+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_ITEM_DESC')+"' style='width:110px;"+ms.tdStyle(formId, 'CR_ITEM_DESC')+"' "+ms.tdEvent(formId, 'CR_ITEM_DESC')+">")
            arrHtml.push("<span colno='CR_ITEM_DESC' class='"+ms.uiClass(formId, 'CR_ITEM_DESC')+"' style='"+ms.uiStyle(formId, 'CR_ITEM_DESC')+"' "+ms.uiEvent(formId, 'CR_ITEM_DESC')+" >"+v['CR_ITEM_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CR_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CR_STATUS')+"' "+ms.tdEvent(formId, 'CR_STATUS')+">")
            arrHtml.push("<span colno='CR_STATUS' class='"+ms.uiClass(formId, 'CR_STATUS')+"' style='"+ms.uiStyle(formId, 'CR_STATUS')+"' "+ms.uiEvent(formId, 'CR_STATUS')+" >"+v['CR_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_MEMO' title='"+memo+"' class='datagrid-cell "+ms.tdClass(formId, 'CR_MEMO')+"' style='"+ms.tdStyle(formId, 'CR_MEMO')+"' "+ms.tdEvent(formId, 'CR_MEMO')+">")
            arrHtml.push("<span colno='CR_MEMO' class='"+ms.uiClass(formId, 'CR_MEMO')+"' style='"+ms.uiStyle(formId, 'CR_MEMO')+"' "+ms.uiEvent(formId, 'CR_MEMO')+" >"+v['CR_MEMO']+"</span>")
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

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
              		$("#CR_ITEM_MIAN_SHOW").attr("save_mark","0");
                  $("#CR_ITEM_MIAN_SHOW").val(jumpId);
                  $("#CR_ITEM_MIAN").val(jumpId);
                  }   
                  var jumpId2 = $("#jumpId2").val();  
              		if(jumpId2!=""){
              		$("#CR_ITEM_REPLACE_SHOW").attr("save_mark","0");
                  $("#CR_ITEM_REPLACE_SHOW").val(jumpId2);
                  $("#CR_ITEM_REPLACE").val(jumpId2);
                  }        
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
/*
//主料料号弹出选择窗调用，勿删
function cbfun(){
    
}
//替代料号弹出选择窗调用，勿删
function cbFu3(){
    
}
*/
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//BOM管理
function itemJump1(obj){
      winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//物料信息
function itemJump3(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 
//物料信息
function itemJump4(obj){
  winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
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
