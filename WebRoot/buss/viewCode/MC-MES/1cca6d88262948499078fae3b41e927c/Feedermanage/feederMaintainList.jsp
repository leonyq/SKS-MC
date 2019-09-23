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
		<dict:lang value="FEEDER保养与维修信息" />
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
		<bu:header formId ="9fe40c6681484bbdaeeee44cc7fe3c2a"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="e7762c0eb62d4894b75db048d6bc8a48" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
                       
		<bu:search viewId="e7762c0eb62d4894b75db048d6bc8a48" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                   
		<input type="hidden" name="formPage9fe40c6681484bbdaeeee44cc7fe3c2a" id="formPage9fe40c6681484bbdaeeee44cc7fe3c2a" value="${formPage9fe40c6681484bbdaeeee44cc7fe3c2a}"/>
		<input type="hidden" name="formId" id="formId1" value='9fe40c6681484bbdaeeee44cc7fe3c2a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9fe40c6681484bbdaeeee44cc7fe3c2a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9fe40c6681484bbdaeeee44cc7fe3c2a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9fe40c6681484bbdaeeee44cc7fe3c2a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9fe40c6681484bbdaeeee44cc7fe3c2a" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9fe40c6681484bbdaeeee44cc7fe3c2a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a" onclick="_selectAjaxTableAllData(this,'9fe40c6681484bbdaeeee44cc7fe3c2a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="TCF_FEEDER_SN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:118px;"><bu:uitn colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:118px;"><bu:uitn colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:118px;"><bu:uitn colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="TCFM_DATETIME" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:300px;"><bu:uitn colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:118px;"><bu:uitn colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9fe40c6681484bbdaeeee44cc7fe3c2a" onscroll="ajaxTableScroll(this,'9fe40c6681484bbdaeeee44cc7fe3c2a')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax9fe40c6681484bbdaeeee44cc7fe3c2a" >
		<tbody id="tbody_9fe40c6681484bbdaeeee44cc7fe3c2a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9fe40c6681484bbdaeeee44cc7fe3c2a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9fe40c6681484bbdaeeee44cc7fe3c2a&showLoading=0" />
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
		<bu:submit viewId="e7762c0eb62d4894b75db048d6bc8a48" />
		
		<bu:script viewId="e7762c0eb62d4894b75db048d6bc8a48" />
    
        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        	<jsp:param name="modelName" value="VIEW_TYPE_17" />
        	<jsp:param name="location" value="jsLoading" />
        </jsp:include>
<script>
	
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
    	checkboxAll("joblist");
    }
	
//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='9fe40c6681484bbdaeeee44cc7fe3c2a'){<%--FEEDER保养维修信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var remark=v['TCFM_DEFECT_REMARK'];
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
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"'>"+v['DATA_AUTH']+"</span>")
                arrHtml.push(" <input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />  ")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'TCF_FEEDER_SN')+"' style='width:180px;"+ms.tdStyle(formId, 'TCF_FEEDER_SN')+"' "+ms.tdEvent(formId, 'TCF_FEEDER_SN')+">")
                arrHtml.push("<span colno='TCF_FEEDER_SN' class='"+ms.uiClass(formId, 'TCF_FEEDER_SN')+"' onclick='itemJump1(\""+v['TCF_FEEDER_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'TCF_FEEDER_SN')+"title='"+ms.titleAttr(formId,'TCF_FEEDER_SN','IS_TITLE_ATTR',v)+"' >"+v['TCF_FEEDER_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_TYPE')+"' style='width:118px;text-align:center;"+ms.tdStyle(formId, 'TCFM_TYPE')+"' "+ms.tdEvent(formId, 'TCFM_TYPE')+">")
                arrHtml.push("<span colno='TCFM_TYPE' class='"+ms.uiClass(formId, 'TCFM_TYPE')+"' style='"+ms.uiStyle(formId, 'TCFM_TYPE')+"' "+ms.uiEvent(formId, 'TCFM_TYPE')+" title='"+ms.titleAttr(formId,'TCFM_TYPE','IS_TITLE_ATTR',v)+"'>"+v['TCFM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_MT_MAN' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_MT_MAN')+"' style='width:118px;text-align:center;"+ms.tdStyle(formId, 'TCFM_MT_MAN')+"' "+ms.tdEvent(formId, 'TCFM_MT_MAN')+">")
                arrHtml.push("<span colno='TCFM_MT_MAN' class='"+ms.uiClass(formId, 'TCFM_MT_MAN')+"' style='"+ms.uiStyle(formId, 'TCFM_MT_MAN')+"' "+ms.uiEvent(formId, 'TCFM_MT_MAN')+" title='"+ms.titleAttr(formId,'TCFM_MT_MAN','IS_TITLE_ATTR',v)+"'>"+v['TCFM_MT_MAN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_REPORTER' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_REPORTER')+"' style='width:118px;text-align:center;"+ms.tdStyle(formId, 'TCFM_REPORTER')+"' "+ms.tdEvent(formId, 'TCFM_REPORTER')+">")
                arrHtml.push("<span colno='TCFM_REPORTER' class='"+ms.uiClass(formId, 'TCFM_REPORTER')+"' style='"+ms.uiStyle(formId, 'TCFM_REPORTER')+"' "+ms.uiEvent(formId, 'TCFM_REPORTER')+" title='"+ms.titleAttr(formId,'TCFM_REPORTER','IS_TITLE_ATTR',v)+"'>"+v['TCFM_REPORTER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_DATETIME' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_DATETIME')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'TCFM_DATETIME')+"' "+ms.tdEvent(formId, 'TCFM_DATETIME')+">")
                arrHtml.push("<span colno='TCFM_DATETIME' class='"+ms.uiClass(formId, 'TCFM_DATETIME')+"' style='"+ms.uiStyle(formId, 'TCFM_DATETIME')+"' "+ms.uiEvent(formId, 'TCFM_DATETIME')+" title='"+ms.titleAttr(formId,'TCFM_DATETIME','IS_TITLE_ATTR',v)+"'>"+v['TCFM_DATETIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_DEFECT_REMARK' title='"+remark+"' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_DEFECT_REMARK')+"' style='width:300px;"+ms.tdStyle(formId, 'TCFM_DEFECT_REMARK')+"' "+ms.tdEvent(formId, 'TCFM_DEFECT_REMARK')+">")
                arrHtml.push("<span colno='TCFM_DEFECT_REMARK' class='"+ms.uiClass(formId, 'TCFM_DEFECT_REMARK')+"' style='"+ms.uiStyle(formId, 'TCFM_DEFECT_REMARK')+"' "+ms.uiEvent(formId, 'TCFM_DEFECT_REMARK')+" title='"+ms.titleAttr(formId,'TCFM_DEFECT_REMARK','IS_TITLE_ATTR',v)+"'>"+v['TCFM_DEFECT_REMARK']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_AUDIT' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_AUDIT')+"' style='width:118px;text-align:center;"+ms.tdStyle(formId, 'TCFM_AUDIT')+"' "+ms.tdEvent(formId, 'TCFM_AUDIT')+">")
                arrHtml.push("<span colno='TCFM_AUDIT' class='"+ms.uiClass(formId, 'TCFM_AUDIT')+"' style='"+ms.uiStyle(formId, 'TCFM_AUDIT')+"' "+ms.uiEvent(formId, 'TCFM_AUDIT')+" title='"+ms.titleAttr(formId,'TCFM_AUDIT','IS_TITLE_ATTR',v)+"'>"+v['TCFM_AUDIT']+"</span>")
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
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//FEEDER建档
function itemJump1(obj){
      winOptMethod.jump("cc2ddbed4a104e41af37781fea378239","F3542","jumpId",obj);
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