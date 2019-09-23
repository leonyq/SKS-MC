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
		<dict:lang value="设备信息" />
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
		<bu:header formId ="99338dfb95df4eec8d5714a4e773b127"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="574da5a0885547d58d4ea2db64af2158" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                        </jsp:include>
		<bu:search viewId="574da5a0885547d58d4ea2db64af2158" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                    </jsp:include>
		<input type="hidden" name="formPage99338dfb95df4eec8d5714a4e773b127" id="formPage99338dfb95df4eec8d5714a4e773b127" value="${formPage99338dfb95df4eec8d5714a4e773b127}"/>
		<input type="hidden" name="formId" id="formId1" value='99338dfb95df4eec8d5714a4e773b127'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='2eca2d7cb432432787511b896b69ac55'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='79b9927d25ac45349b521bb480966fbe'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="99338dfb95df4eec8d5714a4e773b127">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax99338dfb95df4eec8d5714a4e773b127">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner99338dfb95df4eec8d5714a4e773b127">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable99338dfb95df4eec8d5714a4e773b127" style="min-width:1380px">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="99338dfb95df4eec8d5714a4e773b127" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_99338dfb95df4eec8d5714a4e773b127" onclick="_selectAjaxTableAllData(this,'99338dfb95df4eec8d5714a4e773b127')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CD_DEVICE_NAME" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CD_STATUS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CD_VALID_FLAG" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CDP_PLAN_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CD_PRODECT_DATE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CD_BUY_DATE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CD_CHARGE_MAN_TWO" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CD_CHARGE_MAN_THREE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CD_SUPPLIER_ID" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CD_FILES" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv99338dfb95df4eec8d5714a4e773b127" onscroll="ajaxTableScroll(this,'99338dfb95df4eec8d5714a4e773b127')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax99338dfb95df4eec8d5714a4e773b127" style="min-width:1380px">
		<tbody id="tbody_99338dfb95df4eec8d5714a4e773b127" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage99338dfb95df4eec8d5714a4e773b127==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=99338dfb95df4eec8d5714a4e773b127&showLoading=0" />
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
		<bu:submit viewId="574da5a0885547d58d4ea2db64af2158" />
		<bu:script viewId="574da5a0885547d58d4ea2db64af2158" />
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
                  $("#CD_DEVICE_SN").val(jumpId);
                  
                  }                listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
function reloadPg(msg,title,width,height,time,isCloseWin){
	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
    /* document.forms.search_form.submit();
 	util.showTopLoading(); */
 	query("formId1");
 	if ("0" == isCloseWin) {
   	top.$(".dialog-close").click();
    }
    //checkboxAll("joblist");
}

//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='99338dfb95df4eec8d5714a4e773b127'){<%--设备信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var deviceType=v['CD_DEVICE_TYPE'];
            var deviceSN=v['CD_DEVICE_SN'];
            var deviceName=v['CD_DEVICE_NAME'];
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
                arrHtml.push("<td colno='DATA_AUTH' title='"+deviceType+"' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ")
                arrHtml.push("</td>");            
                arrHtml.push("<td colno='CD_DEVICE_TYPE' title='"+deviceType+"' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_TYPE')+"' style='width:130px;"+ms.tdStyle(formId, 'CD_DEVICE_TYPE')+"' "+ms.tdEvent(formId, 'CD_DEVICE_TYPE')+">")
                arrHtml.push("<span colno='CD_DEVICE_TYPE' class='"+ms.uiClass(formId, 'CD_DEVICE_TYPE')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_TYPE')+"' "+ms.uiEvent(formId, 'CD_DEVICE_TYPE')+" >"+v['CD_DEVICE_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_DEVICE_SN' title='"+deviceSN+"' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_SN')+"' style='width:130px;"+ms.tdStyle(formId, 'CD_DEVICE_SN')+"' "+ms.tdEvent(formId, 'CD_DEVICE_SN')+">")
                arrHtml.push("<span colno='CD_DEVICE_SN' class='"+ms.uiClass(formId, 'CD_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_SN')+"' "+ms.uiEvent(formId, 'CD_DEVICE_SN')+" >"+v['CD_DEVICE_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_DEVICE_NAME' title='"+deviceName+"' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_NAME')+"' style='width:130px;"+ms.tdStyle(formId, 'CD_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'CD_DEVICE_NAME')+">")
                arrHtml.push("<span colno='CD_DEVICE_NAME' class='"+ms.uiClass(formId, 'CD_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'CD_DEVICE_NAME')+" >"+v['CD_DEVICE_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CD_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CD_STATUS')+"' "+ms.tdEvent(formId, 'CD_STATUS')+">")
                arrHtml.push("<span colno='CD_STATUS' class='"+ms.uiClass(formId, 'CD_STATUS')+"' style='"+ms.uiStyle(formId, 'CD_STATUS')+"' "+ms.uiEvent(formId, 'CD_STATUS')+" >"+v['CD_STATUS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CD_VALID_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CD_VALID_FLAG')+"' "+ms.tdEvent(formId, 'CD_VALID_FLAG')+">")
                arrHtml.push("<span colno='CD_VALID_FLAG' class='"+ms.uiClass(formId, 'CD_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'CD_VALID_FLAG')+"' "+ms.uiEvent(formId, 'CD_VALID_FLAG')+" >"+v['CD_VALID_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_DEVICE_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_CLASS')+"' style='width:110px;"+ms.tdStyle(formId, 'CD_DEVICE_CLASS')+"' "+ms.tdEvent(formId, 'CD_DEVICE_CLASS')+">")
                arrHtml.push("<span colno='CD_DEVICE_CLASS' class='"+ms.uiClass(formId, 'CD_DEVICE_CLASS')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_CLASS')+"' "+ms.uiEvent(formId, 'CD_DEVICE_CLASS')+" >"+v['CD_DEVICE_CLASS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CDP_PLAN_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDP_PLAN_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'CDP_PLAN_SN')+"' "+ms.tdEvent(formId, 'CDP_PLAN_SN')+">")
                arrHtml.push("<span colno='CDP_PLAN_SN' class='"+ms.uiClass(formId, 'CDP_PLAN_SN')+"' style='"+ms.uiStyle(formId, 'CDP_PLAN_SN')+"' "+ms.uiEvent(formId, 'CDP_PLAN_SN')+" >"+v['CDP_PLAN_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_PRODECT_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CD_PRODECT_DATE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CD_PRODECT_DATE')+"' "+ms.tdEvent(formId, 'CD_PRODECT_DATE')+">")
                arrHtml.push("<span colno='CD_PRODECT_DATE' class='"+ms.uiClass(formId, 'CD_PRODECT_DATE')+"' style='"+ms.uiStyle(formId, 'CD_PRODECT_DATE')+"' "+ms.uiEvent(formId, 'CD_PRODECT_DATE')+" >"+v['CD_PRODECT_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_BUY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CD_BUY_DATE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CD_BUY_DATE')+"' "+ms.tdEvent(formId, 'CD_BUY_DATE')+">")
                arrHtml.push("<span colno='CD_BUY_DATE' class='"+ms.uiClass(formId, 'CD_BUY_DATE')+"' style='"+ms.uiStyle(formId, 'CD_BUY_DATE')+"' "+ms.uiEvent(formId, 'CD_BUY_DATE')+" >"+v['CD_BUY_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_USE_DEP' class='datagrid-cell "+ms.tdClass(formId, 'CD_USE_DEP')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'CD_USE_DEP')+"' "+ms.tdEvent(formId, 'CD_USE_DEP')+">")
                arrHtml.push("<span colno='CD_USE_DEP' class='"+ms.uiClass(formId, 'CD_USE_DEP')+"' style='"+ms.uiStyle(formId, 'CD_USE_DEP')+"' "+ms.uiEvent(formId, 'CD_USE_DEP')+" >"+v['CD_USE_DEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_CHARGE_MAN' class='datagrid-cell "+ms.tdClass(formId, 'CD_CHARGE_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CD_CHARGE_MAN')+"' "+ms.tdEvent(formId, 'CD_CHARGE_MAN')+">")
                arrHtml.push("<span colno='CD_CHARGE_MAN' class='"+ms.uiClass(formId, 'CD_CHARGE_MAN')+"' style='"+ms.uiStyle(formId, 'CD_CHARGE_MAN')+"' "+ms.uiEvent(formId, 'CD_CHARGE_MAN')+" >"+v['CD_CHARGE_MAN']+"</span>")
                arrHtml.push("</td>");
            
                arrHtml.push("<td colno='CD_CHARGE_MAN_TWO' class='datagrid-cell "+ms.tdClass(formId, 'CD_CHARGE_MAN_TWO')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CD_CHARGE_MAN_TWO')+"' "+ms.tdEvent(formId, 'CD_CHARGE_MAN_TWO')+">")
                arrHtml.push("<span colno='CD_CHARGE_MAN_TWO' class='"+ms.uiClass(formId, 'CD_CHARGE_MAN_TWO')+"' style='"+ms.uiStyle(formId, 'CD_CHARGE_MAN_TWO')+"' "+ms.uiEvent(formId, 'CD_CHARGE_MAN_TWO')+" >"+v['CD_CHARGE_MAN_TWO']+"</span>")
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='CD_CHARGE_MAN_THREE' class='datagrid-cell "+ms.tdClass(formId, 'CD_CHARGE_MAN_THREE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CD_CHARGE_MAN_THREE')+"' "+ms.tdEvent(formId, 'CD_CHARGE_MAN_THREE')+">")
                arrHtml.push("<span colno='CD_CHARGE_MAN_THREE' class='"+ms.uiClass(formId, 'CD_CHARGE_MAN_THREE')+"' style='"+ms.uiStyle(formId, 'CD_CHARGE_MAN_THREE')+"' "+ms.uiEvent(formId, 'CD_CHARGE_MAN_THREE')+" >"+v['CD_CHARGE_MAN_THREE']+"</span>")
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='CD_SUPPLIER_ID'  style='width:200px;' class='datagrid-cell "+ms.tdClass(formId, 'CD_SUPPLIER_ID') +ms.tdStyle(formId, 'CD_SUPPLIER_ID')+"' "+ms.tdEvent(formId, 'CD_SUPPLIER_ID')+">")
                arrHtml.push("<span colno='CD_SUPPLIER_ID' class='"+ms.uiClass(formId, 'CD_SUPPLIER_ID')+"' style='"+ms.uiStyle(formId, 'CD_SUPPLIER_ID')+"' "+ms.uiEvent(formId, 'CD_SUPPLIER_ID')+" >"+v['CD_SUPPLIER_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_FILES'  style='width:200px;' class='datagrid-cell "+ms.tdClass(formId, 'CD_FILES') +ms.tdStyle(formId, 'CD_FILES')+"' "+ms.tdEvent(formId, 'CD_FILES')+">")
                arrHtml.push("<span colno='CD_FILES' class='"+ms.uiClass(formId, 'CD_FILES')+"' style='"+ms.uiStyle(formId, 'CD_FILES')+"' "+ms.uiEvent(formId, 'CD_FILES')+" >"+v['CD_FILES']+"</span>")
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