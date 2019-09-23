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
		<dict:lang value="已停用工单" />
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
		<bu:header formId ="b376f2a126f2414d81c63507a3c699c0"/>

    
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
		<bu:func viewId="0584f012a9774e70ac210ce5b9e6d2f9" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="0584f012a9774e70ac210ce5b9e6d2f9" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
              <!--?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />-->
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageb376f2a126f2414d81c63507a3c699c0" id="formPageb376f2a126f2414d81c63507a3c699c0" value="${formPageb376f2a126f2414d81c63507a3c699c0}"/>
		<input type="hidden" name="formId" id="formId1" value='b376f2a126f2414d81c63507a3c699c0'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='5ee6f7f0d5e04e9ea961d06ac1a909e2'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value=''/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b376f2a126f2414d81c63507a3c699c0">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb376f2a126f2414d81c63507a3c699c0" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb376f2a126f2414d81c63507a3c699c0">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb376f2a126f2414d81c63507a3c699c0">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="b376f2a126f2414d81c63507a3c699c0" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b376f2a126f2414d81c63507a3c699c0" onclick="_selectAjaxTableAllData(this,'b376f2a126f2414d81c63507a3c699c0')" style="cursor: pointer;"title="全选"/></span></td>
			
          	
          
          	<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="PROJECT_ID" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
          								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="PROJECT_STATUS" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
          
           								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="LOT_NUMBER" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
           
           								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="PRODUCT_MATERIAL" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
           
           								<td class="datagrid-cell" style="text-align:center;width:150px;">
           									<bu:uitn colNo="PRODUCT_NAME" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
          
          
           								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="PRODUCT_COUNT" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
          
		  								<td class="datagrid-cell" style="text-align:center;width:70px;">
          									<bu:uitn colNo="PROJECT_SORT" formId="b376f2a126f2414d81c63507a3c699c0"/></td>                                                                  
                                      
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="CREATE_USER" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="CREATE_TIME" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                                                                
                                      	<td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="EDIT_TIME" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
          
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb376f2a126f2414d81c63507a3c699c0" onscroll="ajaxTableScroll(this,'b376f2a126f2414d81c63507a3c699c0')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb376f2a126f2414d81c63507a3c699c0">
		<tbody id="tbody_b376f2a126f2414d81c63507a3c699c0" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb376f2a126f2414d81c63507a3c699c0==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b376f2a126f2414d81c63507a3c699c0&showLoading=0" />
			</div>
		</c:if>


		
 </div>
 </div>
		<input type="hidden" id="relColVals" name="relColVals" value='PROJECT_ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="0584f012a9774e70ac210ce5b9e6d2f9" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0584f012a9774e70ac210ce5b9e6d2f9" />
    
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
    if(formId=='b376f2a126f2414d81c63507a3c699c0'){<%--VOID-工单关联-当日待处理表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            //arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
      		
      		arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' id='check_"+v.ID+"' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
      		
            
      
      			arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STATUS' name='noprintset_PROJECT_STATUS' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='PROJECT_STATUS' class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " title='" + ms.titleAttr(formId, 'PROJECT_STATUS', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_STATUS'] + "</span>");
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='LOT_NUMBER' name='noprintset_LOT_NUMBER' class='datagrid-cell  " + ms.tdClass(formId, 'LOT_NUMBER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'LOT_NUMBER') + "' " + ms.tdEvent(formId, 'LOT_NUMBER') + ">");
                arrHtml.push("<span colno='LOT_NUMBER' class='" + ms.uiClass(formId, 'LOT_NUMBER') + "' style='" + ms.uiStyle(formId, 'LOT_NUMBER') + "' " + ms.uiEvent(formId, 'LOT_NUMBER') + " title='" + ms.titleAttr(formId, 'LOT_NUMBER', 'IS_TITLE_ATTR', v) + "' >" + v['LOT_NUMBER'] + "</span>");
                arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='PRODUCT_MATERIAL' name='noprintset_PRODUCT_MATERIAL' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.uiStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + ms.titleAttr(formId, 'PRODUCT_MATERIAL', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_MATERIAL'] + "</span>");
                arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='PRODUCT_NAME' name='noprintset_PRODUCT_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='text-align:center;width:150px;" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + ms.titleAttr(formId, 'PRODUCT_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='PRODUCT_COUNT' name='noprintset_PRODUCT_COUNT' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_SORT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_SORT') + "' " + ms.tdEvent(formId, 'PROJECT_SORT') + ">");
                arrHtml.push("<span colno='PROJECT_SORT' class='" + ms.uiClass(formId, 'PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'PROJECT_SORT') + "' " + ms.uiEvent(formId, 'PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_SORT'] + "</span>");
                arrHtml.push("</td>");
				               
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " title='" + ms.titleAttr(formId, 'EDIT_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_TIME'] + "</span>");
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
    //setScroll(formId);
   if (isFirstSetScroll == 0) {
            isFirstSetScroll = 1;
            setScroll();
    }
}
</script>
<script type="text/javascript">
  
function editProjectStatus(){
  
  var projectSnArr = [];
	var formId = $("#formId1").val();
    
        $("span[colno='PROJECT_ID']").each(function (){         
          var dataId = $(this).parent().parent().attr("id");
          console.log("dataId>>>");
          console.log(dataId);
            if ($("input[id='check_"+dataId+"']").attr('checked')) {
               var curTitle = $(this).text();
              console.log(curTitle);
               if (curTitle != null) {
                    projectSnArr.push(curTitle);
                 	console.log("projectSnArr>>>");
                 	console.log(projectSnArr);
                }
            }
        });

        var workOrderSn = projectSnArr.join(",");
		//56318a3d165d4a03ae101faeb29d8df6
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=2eb1c97a0d9646dc9951addf31f53556";

        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: {"workOrderSn":workOrderSn},
            success: function (data) {
                var msg = data.ajaxString;
                util.closeLoading();
                utilsFp.confirmIcon(2,"","query","", msg,0,"300","");
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
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
