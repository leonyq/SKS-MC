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
		<dict:lang value="VM-检查项目" />
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
		<bu:header formId ="01cd879dda5346a48b383622571bc6c2"/>

    
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
		<bu:func viewId="0ffbf3b03cdd4a21b3adba5bc6b2ad18" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="0ffbf3b03cdd4a21b3adba5bc6b2ad18" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage01cd879dda5346a48b383622571bc6c2" id="formPage01cd879dda5346a48b383622571bc6c2" value="${formPage01cd879dda5346a48b383622571bc6c2}"/>
		<input type="hidden" name="formId" id="formId1" value='01cd879dda5346a48b383622571bc6c2'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='b066c434655c40229de8b7a8921b9c1b'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='02a4fef35fc845d5b563b1502e4760c0'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="01cd879dda5346a48b383622571bc6c2">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax01cd879dda5346a48b383622571bc6c2" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner01cd879dda5346a48b383622571bc6c2">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable01cd879dda5346a48b383622571bc6c2">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="01cd879dda5346a48b383622571bc6c2" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_01cd879dda5346a48b383622571bc6c2" onclick="_selectAjaxTableAllData(this,'01cd879dda5346a48b383622571bc6c2')" style="cursor: pointer;"title="全选"/></span></td>
	    	<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CO_PROJECT_CODE" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;" ><bu:uitn colNo="CO_PROJECT_NAME" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center;"><bu:uitn colNo="CO_PROJECT_TYPE" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<!--<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CO_DEFAULT" formId="01cd879dda5346a48b383622571bc6c2" /></td>-->
			<td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="CO_PRODUCT_STEP" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CO_AFFECT_INFO" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><bu:uitn colNo="CREATE_TIME" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="CO_REMARK" formId="01cd879dda5346a48b383622571bc6c2" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv01cd879dda5346a48b383622571bc6c2" onscroll="ajaxTableScroll(this,'01cd879dda5346a48b383622571bc6c2')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax01cd879dda5346a48b383622571bc6c2">
		<tbody id="tbody_01cd879dda5346a48b383622571bc6c2" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage01cd879dda5346a48b383622571bc6c2==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=01cd879dda5346a48b383622571bc6c2&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="formPage02a4fef35fc845d5b563b1502e4760c0" id="formPage02a4fef35fc845d5b563b1502e4760c0" value="${formPage02a4fef35fc845d5b563b1502e4760c0}"/>
		<input type="hidden" name="formId" id="formId2" value='02a4fef35fc845d5b563b1502e4760c0'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="02a4fef35fc845d5b563b1502e4760c0">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax02a4fef35fc845d5b563b1502e4760c0" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner02a4fef35fc845d5b563b1502e4760c0">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable02a4fef35fc845d5b563b1502e4760c0">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="02a4fef35fc845d5b563b1502e4760c0" i18n="1"/></td>
			<!--<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_02a4fef35fc845d5b563b1502e4760c0" onclick="_selectAjaxTableAllData(this,'02a4fef35fc845d5b563b1502e4760c0')" style="cursor: pointer;"title="全选"/></span></td>-->
	<!--	<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_02a4fef35fc845d5b563b1502e4760c0" onclick="_selectAjaxTableAllData(this,'02a4fef35fc845d5b563b1502e4760c0')" style="cursor: pointer;"title="全选"/></span></td> -->
			<td class="datagrid-cell" style="width:200px;text-align:center;"><bu:uitn colNo="CO_DEPT_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
			<td class="datagrid-cell" style="width:200px;text-align:center;"><bu:uitn colNo="CO_CONFIRM_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
			<td class="datagrid-cell" style="width:200px;text-align:center;"><bu:uitn colNo="CO_CHECK_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv02a4fef35fc845d5b563b1502e4760c0" onscroll="ajaxTableScroll(this,'02a4fef35fc845d5b563b1502e4760c0')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax02a4fef35fc845d5b563b1502e4760c0">
		<tbody id="tbody_02a4fef35fc845d5b563b1502e4760c0" class="isChilds" >
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage02a4fef35fc845d5b563b1502e4760c0==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=02a4fef35fc845d5b563b1502e4760c0&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="0ffbf3b03cdd4a21b3adba5bc6b2ad18" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0ffbf3b03cdd4a21b3adba5bc6b2ad18" />
    
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
                  $("#CO_PROJECT_CODE").val(jumpId);
                  
                  }                listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	checkboxAll("joblist");
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
    if(formId=='01cd879dda5346a48b383622571bc6c2'){<%--FM-指示单项目--%>
   // $('.scroll2').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_PROJECT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CO_PROJECT_CODE')+"' style='width:150px;"+ms.tdEvent(formId, 'CO_PROJECT_CODE')+">")
            arrHtml.push("<span colno='CO_PROJECT_CODE' class='"+ms.uiClass(formId, 'CO_PROJECT_CODE')+"' style='"+ms.uiStyle(formId, 'CO_PROJECT_CODE')+"' "+ms.uiEvent(formId, 'CO_PROJECT_CODE')+" title='"+ms.titleAttr(formId,'CO_PROJECT_CODE','IS_TITLE_ATTR',v)+"' >"+v['CO_PROJECT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_PROJECT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_PROJECT_NAME')+"' style='width:200px;"+ms.tdEvent(formId, 'CO_PROJECT_NAME')+">")
            arrHtml.push("<span colno='CO_PROJECT_NAME' class='"+ms.uiClass(formId, 'CO_PROJECT_NAME')+"' style='"+ms.uiStyle(formId, 'CO_PROJECT_NAME')+"' "+ms.uiEvent(formId, 'CO_PROJECT_NAME')+" title='"+ms.titleAttr(formId,'CO_PROJECT_NAME','IS_TITLE_ATTR',v)+"' >"+v['CO_PROJECT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_PROJECT_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CO_PROJECT_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CO_PROJECT_TYPE')+"' "+ms.tdEvent(formId, 'CO_PROJECT_TYPE')+">")
            arrHtml.push("<span colno='CO_PROJECT_TYPE' class='"+ms.uiClass(formId, 'CO_PROJECT_TYPE')+"' style='"+ms.uiStyle(formId, 'CO_PROJECT_TYPE')+"' "+ms.uiEvent(formId, 'CO_PROJECT_TYPE')+" title='"+ms.titleAttr(formId,'CO_PROJECT_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CO_PROJECT_TYPE']+"</span>")
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_DEFAULT' class='datagrid-cell "+ms.tdClass(formId, 'CO_DEFAULT')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CO_DEFAULT')+"' "+ms.tdEvent(formId, 'CO_DEFAULT')+">")
            //arrHtml.push("<span colno='CO_DEFAULT' class='"+ms.uiClass(formId, 'CO_DEFAULT')+"' style='"+ms.uiStyle(formId, 'CO_DEFAULT')+"' "+ms.uiEvent(formId, 'CO_DEFAULT')+" title='"+ms.titleAttr(formId,'CO_DEFAULT','IS_TITLE_ATTR',v)+"' >"+v['CO_DEFAULT']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CO_PRODUCT_STEP')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CO_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CO_PRODUCT_STEP')+">")
            arrHtml.push("<span colno='CO_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CO_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CO_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CO_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'CO_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['CO_PRODUCT_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_AFFECT_INFO' class='datagrid-cell "+ms.tdClass(formId, 'CO_AFFECT_INFO')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CO_AFFECT_INFO')+"' "+ms.tdEvent(formId, 'CO_AFFECT_INFO')+">")
            arrHtml.push("<span colno='CO_AFFECT_INFO' class='"+ms.uiClass(formId, 'CO_AFFECT_INFO')+"' style='"+ms.uiStyle(formId, 'CO_AFFECT_INFO')+"' "+ms.uiEvent(formId, 'CO_AFFECT_INFO')+" title='"+ms.titleAttr(formId,'CO_AFFECT_INFO','IS_TITLE_ATTR',v)+"' >"+v['CO_AFFECT_INFO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_REMARK' class='datagrid-cell "+ms.tdClass(formId, 'CO_REMARK')+"' style='width:200px;"+ms.tdEvent(formId, 'CO_REMARK')+">")
            arrHtml.push("<span colno='CO_REMARK' class='"+ms.uiClass(formId, 'CO_REMARK')+"' style='"+ms.uiStyle(formId, 'CO_REMARK')+"' "+ms.uiEvent(formId, 'CO_REMARK')+" title='"+ms.titleAttr(formId,'CO_REMARK','IS_TITLE_ATTR',v)+"' >"+v['CO_REMARK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        //setCrossWiseScroll(formId,arrHtml);
        setPopScroll('.scroll2','.head2');
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='02a4fef35fc845d5b563b1502e4760c0'){<%--FM-指示单项目责任人--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            //arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            //arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            //arrHtml.push("</td>");
           // arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
          //  arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
          //  arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_DEPT_ID' class='datagrid-cell "+ms.tdClass(formId, 'CO_DEPT_ID')+"' style='width:200px;text-align:center;"+ms.tdEvent(formId, 'CO_DEPT_ID')+">")
            arrHtml.push("<span colno='CO_DEPT_ID' class='"+ms.uiClass(formId, 'CO_DEPT_ID')+"' style='"+ms.uiStyle(formId, 'CO_DEPT_ID')+"' "+ms.uiEvent(formId, 'CO_DEPT_ID')+" title='"+ms.titleAttr(formId,'CO_DEPT_ID','IS_TITLE_ATTR',v)+"' >"+v['CO_DEPT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_CONFIRM_ID' class='datagrid-cell "+ms.tdClass(formId, 'CO_CONFIRM_ID')+"' style='width:200px;text-align:center;"+ms.tdEvent(formId, 'CO_CONFIRM_ID')+">")
            arrHtml.push("<span colno='CO_CONFIRM_ID' class='"+ms.uiClass(formId, 'CO_CONFIRM_ID')+"' style='"+ms.uiStyle(formId, 'CO_CONFIRM_ID')+"' "+ms.uiEvent(formId, 'CO_CONFIRM_ID')+" title='"+ms.titleAttr(formId,'CO_CONFIRM_ID','IS_TITLE_ATTR',v)+"' >"+v['CO_CONFIRM_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_CHECK_ID' class='datagrid-cell "+ms.tdClass(formId, 'CO_CHECK_ID')+"' style='width:200px;text-align:center;"+ms.tdEvent(formId, 'CO_CHECK_ID')+">")
            arrHtml.push("<span colno='CO_CHECK_ID' class='"+ms.uiClass(formId, 'CO_CHECK_ID')+"' style='"+ms.uiStyle(formId, 'CO_CHECK_ID')+"' "+ms.uiEvent(formId, 'CO_CHECK_ID')+" title='"+ms.titleAttr(formId,'CO_CHECK_ID','IS_TITLE_ATTR',v)+"' >"+v['CO_CHECK_ID']+"</span>")
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
