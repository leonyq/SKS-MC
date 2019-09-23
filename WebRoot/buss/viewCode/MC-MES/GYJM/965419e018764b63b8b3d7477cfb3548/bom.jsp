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
		<dict:lang value="VM-BOM-列表" />
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
		<bu:header formId ="881411561f8f4940ac22575c4b8f02ef"/>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="64d40315e7ae489a8bb8e0d1871234ae" />
            </div>
            <div class="bd">
            
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                        </jsp:include>
		<bu:search viewId="64d40315e7ae489a8bb8e0d1871234ae" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                    </jsp:include>
		<input type="hidden" name="formPage881411561f8f4940ac22575c4b8f02ef" id="formPage881411561f8f4940ac22575c4b8f02ef" value="${formPage881411561f8f4940ac22575c4b8f02ef}"/>
		<input type="hidden" name="formId" id="formId1" value='881411561f8f4940ac22575c4b8f02ef'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/><!--3a6a195ea82c4ebbaaaacc3ee52c6438-->
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/><!--b9f80468a9fe4b74ada4fceff23db738-->
		<div class="panel-ajax datagrid datagrid-div1"  id="881411561f8f4940ac22575c4b8f02ef">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax881411561f8f4940ac22575c4b8f02ef" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner881411561f8f4940ac22575c4b8f02ef">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable881411561f8f4940ac22575c4b8f02ef" style="min-width:860px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="881411561f8f4940ac22575c4b8f02ef" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_881411561f8f4940ac22575c4b8f02ef" onclick="_selectAjaxTableAllData(this,'881411561f8f4940ac22575c4b8f02ef')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell" style="width:60px; text-align:center"><bu:uitn colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv881411561f8f4940ac22575c4b8f02ef" onscroll="ajaxTableScroll(this,'881411561f8f4940ac22575c4b8f02ef')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax881411561f8f4940ac22575c4b8f02ef" style="min-width:860px;">
		<tbody id="tbody_881411561f8f4940ac22575c4b8f02ef" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage881411561f8f4940ac22575c4b8f02ef==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=881411561f8f4940ac22575c4b8f02ef&showLoading=0" />
			</div>
		</c:if>
		</div>

		
        
		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
    	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
        </jsp:include>
		<bu:submit viewId="64d40315e7ae489a8bb8e0d1871234ae" />
		<bu:script viewId="64d40315e7ae489a8bb8e0d1871234ae" />
        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        	<jsp:param name="modelName" value="VIEW_TYPE_17" />
        	<jsp:param name="location" value="jsLoading" />
        </jsp:include>
<script>


function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              if(jumpId!=""){
                  
                  $("#CB_ITEM_CODE_SHOW").val(jumpId);
                  $("#CB_ITEM_CODE").val(jumpId);
                  }
                    listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
                 
                 
function reloadPg(msg,title,width,height,time,isCloseWin){
   msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
  
function reloadPgExe(isCloseWin){
    /* document.forms.search_form.submit();
	util.showTopLoading(); */
	query("formId1");
	if ("0" == isCloseWin || undefined == isCloseWin ) {
	  top.$(".dialog-close").click();
	}
	//checkboxAll("joblist");
    
}

<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='881411561f8f4940ac22575c4b8f02ef'){<%--BOM清单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
          //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title=\""+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"\" >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            //arrHtml.push("</td>");  
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='CB_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CB_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CB_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CB_ITEM_CODE')+">")
            arrHtml.push("<span colno='CB_ITEM_CODE' class='"+ms.uiClass(formId, 'CB_ITEM_CODE')+"' onclick='itemJump1(\""+v['CB_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CB_ITEM_CODE')+" title=\""+ms.titleAttr(formId,'CB_ITEM_CODE','IS_TITLE_ATTR',v)+"\" >"+v['CB_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T2#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_NAME')+"title=\""+ms.titleAttr(formId,'T2#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"\" >"+v['T2#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T2#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_SPEC')+"title=\""+ms.titleAttr(formId,'T2#CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"\" >"+v['T2#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CB_VER' class='datagrid-cell "+ms.tdClass(formId, 'CB_VER')+"' style='width:100px;"+ms.tdStyle(formId, 'CB_VER')+"' "+ms.tdEvent(formId, 'CB_VER')+">")
            arrHtml.push("<span colno='CB_VER' class='"+ms.uiClass(formId, 'CB_VER')+"' style='"+ms.uiStyle(formId, 'CB_VER')+"' "+ms.uiEvent(formId, 'CB_VER')+"title=\""+ms.titleAttr(formId,'CB_ITEM_CODE','CB_VER',v)+"\" >"+v['CB_VER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CB_DEFAULT' class='datagrid-cell "+ms.tdClass(formId, 'CB_DEFAULT')+"' style='width:60px;text-align:center;"+ms.tdStyle(formId, 'CB_DEFAULT')+"' "+ms.tdEvent(formId, 'CB_DEFAULT')+">")
            arrHtml.push("<span colno='CB_DEFAULT' class='"+ms.uiClass(formId, 'CB_DEFAULT')+"' style='"+ms.uiStyle(formId, 'CB_DEFAULT')+"' "+ms.uiEvent(formId, 'CB_DEFAULT')+"title=\""+ms.titleAttr(formId,'CB_DEFAULT','IS_TITLE_ATTR',v)+"\" >"+v['CB_DEFAULT']+"</span>")
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
   // setTableWidth(formId);
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
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
