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
		<dict:lang value="交付作业" />
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
		<bu:header formId ="55eb4787d33d4dbbaa1708806ece31b5"/>

    
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
		<bu:func viewId="a15b46772aab41c59780427df10a9661" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="a15b46772aab41c59780427df10a9661" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage55eb4787d33d4dbbaa1708806ece31b5" id="formPage55eb4787d33d4dbbaa1708806ece31b5" value="${formPage55eb4787d33d4dbbaa1708806ece31b5}"/>
		<input type="hidden" name="formId" id="formId1" value='55eb4787d33d4dbbaa1708806ece31b5'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="55eb4787d33d4dbbaa1708806ece31b5">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax55eb4787d33d4dbbaa1708806ece31b5" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner55eb4787d33d4dbbaa1708806ece31b5">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable55eb4787d33d4dbbaa1708806ece31b5">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="55eb4787d33d4dbbaa1708806ece31b5" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_55eb4787d33d4dbbaa1708806ece31b5" onclick="_selectAjaxTableAllData(this,'55eb4787d33d4dbbaa1708806ece31b5')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_TWD_NO" class="datagrid-cell"><bu:uitn colNo="TWD_NO" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="noprintset_TWD_UNIT" class="datagrid-cell"><bu:uitn colNo="TWD_UNIT" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="noprintset_TWD_SCLH" class="datagrid-cell"><bu:uitn colNo="TWD_SCLH" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="noprintset_TWD_CPXH" class="datagrid-cell"><bu:uitn colNo="TWD_CPXH" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="noprintset_TWD_NUM" class="datagrid-cell"><bu:uitn colNo="TWD_NUM" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="noprintset_TWD_CONTENT" class="datagrid-cell"><bu:uitn colNo="TWD_CONTENT" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="noprintset_TWD_MEMO" class="datagrid-cell"><bu:uitn colNo="TWD_MEMO" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="noprintset_TWD_QUALITY_NO" class="datagrid-cell"><bu:uitn colNo="TWD_QUALITY_NO" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="CREATE_USER" class="datagrid-cell"><bu:uitn colNo="CREATE_USER" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<td name="CREATE_TIME" class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			
		</tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv55eb4787d33d4dbbaa1708806ece31b5" onscroll="ajaxTableScroll(this,'55eb4787d33d4dbbaa1708806ece31b5')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax55eb4787d33d4dbbaa1708806ece31b5">
		<tbody id="tbody_55eb4787d33d4dbbaa1708806ece31b5" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage55eb4787d33d4dbbaa1708806ece31b5==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=55eb4787d33d4dbbaa1708806ece31b5&showLoading=0" />
			</div>
		</c:if>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
    <div style="display: none;">
		
		<form id="dowm_form" name="downForm" action="${path}sys/UserAction_downTemplate.ms" method="post">
       <input type="hidden" name="paraMap.fileName" id="fileName" value="BOM导入模板.xlsx">
       <input type="hidden" name="paraMap.filePath" id="filePath" value="plf/template/bomTemplate.xlsx">
     </form>
	</div>
		<bu:submit viewId="a15b46772aab41c59780427df10a9661" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="a15b46772aab41c59780427df10a9661" />
    
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
    if(formId=='55eb4787d33d4dbbaa1708806ece31b5'){<%--交付作业--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TWD_NO' name='noprintset_TWD_NO' class='datagrid-cell "+ms.tdClass(formId, 'TWD_NO')+"' style='"+ms.tdStyle(formId, 'TWD_NO')+"' "+ms.tdEvent(formId, 'TWD_NO')+">")
            arrHtml.push("<span colno='TWD_NO' class='"+ms.uiClass(formId, 'TWD_NO')+"' style='"+ms.uiStyle(formId, 'TWD_NO')+"' "+ms.uiEvent(formId, 'TWD_NO')+" title='"+ms.titleAttr(formId,'TWD_NO','IS_TITLE_ATTR',v)+"' >"+v['TWD_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TWD_UNIT' name='noprintset_TWD_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'TWD_UNIT')+"' style='"+ms.tdStyle(formId, 'TWD_UNIT')+"' "+ms.tdEvent(formId, 'TWD_UNIT')+">")
            arrHtml.push("<span colno='TWD_UNIT' class='"+ms.uiClass(formId, 'TWD_UNIT')+"' style='"+ms.uiStyle(formId, 'TWD_UNIT')+"' "+ms.uiEvent(formId, 'TWD_UNIT')+" title='"+ms.titleAttr(formId,'TWD_UNIT','IS_TITLE_ATTR',v)+"' >"+v['TWD_UNIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TWD_SCLH' name='noprintset_TWD_SCLH' class='datagrid-cell "+ms.tdClass(formId, 'TWD_SCLH')+"' style='"+ms.tdStyle(formId, 'TWD_SCLH')+"' "+ms.tdEvent(formId, 'TWD_SCLH')+">")
            arrHtml.push("<span colno='TWD_SCLH' class='"+ms.uiClass(formId, 'TWD_SCLH')+"' style='"+ms.uiStyle(formId, 'TWD_SCLH')+"' "+ms.uiEvent(formId, 'TWD_SCLH')+" title='"+ms.titleAttr(formId,'TWD_SCLH','IS_TITLE_ATTR',v)+"' >"+v['TWD_SCLH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TWD_CPXH' name='noprintset_TWD_CPXH' class='datagrid-cell "+ms.tdClass(formId, 'TWD_CPXH')+"' style='"+ms.tdStyle(formId, 'TWD_CPXH')+"' "+ms.tdEvent(formId, 'TWD_CPXH')+">")
            arrHtml.push("<span colno='TWD_CPXH' class='"+ms.uiClass(formId, 'TWD_CPXH')+"' style='"+ms.uiStyle(formId, 'TWD_CPXH')+"' "+ms.uiEvent(formId, 'TWD_CPXH')+" title='"+ms.titleAttr(formId,'TWD_CPXH','IS_TITLE_ATTR',v)+"' >"+v['TWD_CPXH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TWD_NUM' name='noprintset_TWD_NUM' class='datagrid-cell "+ms.tdClass(formId, 'TWD_NUM')+"' style='"+ms.tdStyle(formId, 'TWD_NUM')+"' "+ms.tdEvent(formId, 'TWD_NUM')+">")
            arrHtml.push("<span colno='TWD_NUM' class='"+ms.uiClass(formId, 'TWD_NUM')+"' style='"+ms.uiStyle(formId, 'TWD_NUM')+"' "+ms.uiEvent(formId, 'TWD_NUM')+" title='"+ms.titleAttr(formId,'TWD_NUM','IS_TITLE_ATTR',v)+"' >"+v['TWD_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TWD_CONTENT' name='noprintset_TWD_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'TWD_CONTENT')+"' style='"+ms.tdStyle(formId, 'TWD_CONTENT')+"' "+ms.tdEvent(formId, 'TWD_CONTENT')+">")
            arrHtml.push("<span colno='TWD_CONTENT' class='"+ms.uiClass(formId, 'TWD_CONTENT')+"' style='"+ms.uiStyle(formId, 'TWD_CONTENT')+"' "+ms.uiEvent(formId, 'TWD_CONTENT')+" title='"+ms.titleAttr(formId,'TWD_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['TWD_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TWD_MEMO' name='noprintset_TWD_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'TWD_MEMO')+"' style='"+ms.tdStyle(formId, 'TWD_MEMO')+"' "+ms.tdEvent(formId, 'TWD_MEMO')+">")
            arrHtml.push("<span colno='TWD_MEMO' class='"+ms.uiClass(formId, 'TWD_MEMO')+"' style='"+ms.uiStyle(formId, 'TWD_MEMO')+"' "+ms.uiEvent(formId, 'TWD_MEMO')+" title='"+ms.titleAttr(formId,'TWD_MEMO','IS_TITLE_ATTR',v)+"' >"+v['TWD_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TWD_QUALITY_NO' name='noprintset_TWD_QUALITY_NO' class='datagrid-cell "+ms.tdClass(formId, 'TWD_QUALITY_NO')+"' style='"+ms.tdStyle(formId, 'TWD_QUALITY_NO')+"' "+ms.tdEvent(formId, 'TWD_QUALITY_NO')+">")
            arrHtml.push("<span colno='TWD_QUALITY_NO' class='"+ms.uiClass(formId, 'TWD_QUALITY_NO')+"' style='"+ms.uiStyle(formId, 'TWD_QUALITY_NO')+"' "+ms.uiEvent(formId, 'TWD_QUALITY_NO')+" title='"+ms.titleAttr(formId,'TWD_QUALITY_NO','IS_TITLE_ATTR',v)+"' >"+v['TWD_QUALITY_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' name='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' name='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
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
</script>
<script>
function expConfirm(){
    var dataId = _selectedEditTr.attr("id");
    util.showLoading("处理中...");
	       $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	               "dataId" : dataId
	           },
	           url:"${path}buss/bussModel_exeFunc.ms?funcMId=0c103c95cf584defbb1987e511f4614d",
	           success:function(data){	
                	util.closeLoading();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxMap){
                	  /* var $form = $('<form method="GET"></form>');
                        $form.attr('action', "${path}"+data.ajaxMap.newPath);
                        $form.appendTo($('body'));
                        $form.submit();*/
                        $("#fileName").val(data.ajaxMap.name+".pdf");
                        $("#filePath").val(data.ajaxMap.newPath);
                        
                        document.forms.dowm_form.submit();
                        //window.open("${path}"+data.ajaxMap.newPath);
                        //document.getElementById("download").href="http://192.168.28.200:8080${path}"+data.ajaxMap.newPath;
                	}
	           },
	           error:function(msg){
	                if(msg.readyState!=0){
    	               util.closeLoading();
    	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	                }
	           }
	       });
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
