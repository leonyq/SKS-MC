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
		<dict:lang value="角色功能" />
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
		<bu:header formId ="499653397d8f4ea7bb0aadf8d98aedd5"/>

    
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
		<bu:func viewId="35526b08a39e4d63ba9cfadd67249040" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="35526b08a39e4d63ba9cfadd67249040" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage499653397d8f4ea7bb0aadf8d98aedd5" id="formPage499653397d8f4ea7bb0aadf8d98aedd5" value="${formPage499653397d8f4ea7bb0aadf8d98aedd5}"/>
		<input type="hidden" name="formId" id="formId1" value='499653397d8f4ea7bb0aadf8d98aedd5'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="499653397d8f4ea7bb0aadf8d98aedd5">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax499653397d8f4ea7bb0aadf8d98aedd5" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head" id="datagrid-header-inner499653397d8f4ea7bb0aadf8d98aedd5">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable499653397d8f4ea7bb0aadf8d98aedd5">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="499653397d8f4ea7bb0aadf8d98aedd5" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_499653397d8f4ea7bb0aadf8d98aedd5" onclick="_selectAjaxTableAllData(this,'499653397d8f4ea7bb0aadf8d98aedd5')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_TAR_ROLE_ID" style="width:100px; text-align:center" class="datagrid-cell"><bu:uitn colNo="TAR_ROLE_ID" formId="499653397d8f4ea7bb0aadf8d98aedd5" /></td>
			<td name="noprintset_TAR_MENU_ID" style="width:100px; text-align:center" class="datagrid-cell"><bu:uitn colNo="TAR_MENU_ID" formId="499653397d8f4ea7bb0aadf8d98aedd5" /></td>
			<td name="noprintset_TAR_MOUDLE_ID" style="width:100px; text-align:center" class="datagrid-cell"><bu:uitn colNo="TAR_MOUDLE_ID" formId="499653397d8f4ea7bb0aadf8d98aedd5" /></td>
			<td name="noprintset_TAS_FUN_ID" style="width:100px; text-align:center" class="datagrid-cell"><bu:uitn colNo="TAS_FUN_ID" formId="499653397d8f4ea7bb0aadf8d98aedd5" /></td>
			<td name="noprintset_TAR_SEQ" style="width:60px; text-align:center" class="datagrid-cell"><bu:uitn colNo="TAR_SEQ" formId="499653397d8f4ea7bb0aadf8d98aedd5" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDiv499653397d8f4ea7bb0aadf8d98aedd5" onscroll="ajaxTableScroll(this,'499653397d8f4ea7bb0aadf8d98aedd5')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax499653397d8f4ea7bb0aadf8d98aedd5">
		<tbody id="tbody_499653397d8f4ea7bb0aadf8d98aedd5" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage499653397d8f4ea7bb0aadf8d98aedd5==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=getInfoList&formId=499653397d8f4ea7bb0aadf8d98aedd5&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('499653397d8f4ea7bb0aadf8d98aedd5','1');">打印</button>
 </div>
 </div>
 <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
 <table id="printset_tab" class="basic-table" style="text-align: center;margin-top:10px;">
 <tr>
 <td style="width: 100px;text-align: right;">列字段</td>
 <td style="padding-left: 5px;">是否打印</td>
 <td style="padding-left: 5px;">打印列宽</td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>序号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SEQ" value="30" title_name="序号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?APP功能模块ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAR_MOUDLE_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAR_MOUDLE_ID" value="" title_name="?APP功能模块ID" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?角色ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAR_ROLE_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAR_ROLE_ID" value="" title_name="?角色ID" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>显示顺序</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAR_SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAR_SEQ" value="" title_name="显示顺序" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?功能细项ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAS_FUN_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAS_FUN_ID" value="" title_name="?功能细项ID" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?菜单ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAR_MENU_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAR_MENU_ID" value="" title_name="?菜单ID" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="35526b08a39e4d63ba9cfadd67249040" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="35526b08a39e4d63ba9cfadd67249040" />
    
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
                  getInfoList();
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
function query(){
    getInfoList();
}
                 
function getInfoList(paginationImpl){ 
    	var currentPage = paginationImpl==undefined? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  paginationImpl==undefined? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var tarRoleId = $("#TAR_ROLE_ID").val();
    	var tarMenuId = $("#TAR_MENU_ID").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=67a430b8284c494380a88ee4a2e28c03",
			    data:{
                        "page.currentPage":currentPage,
                        "page.pageRecord": pageRecord,
                        "tarRoleId":tarRoleId,
                        "tarMenuId":tarMenuId
                    },
				success: function(data){
						util.closeLoading();
						$("#tbody_499653397d8f4ea7bb0aadf8d98aedd5").empty();
						if(null != data.ajaxPage.dataList){
							var list = eval(data.ajaxPage.dataList);
							for(var i = 0;i < list.length; i++){
							    if(list[i].ROLE_NAME==null)  list[i].ROLE_NAME="";
								if(list[i].MENU_NAME==null)  list[i].MENU_NAME="";
								if(list[i].MOUDLE_NAME==null)  list[i].MOUDLE_NAME="";
								if(list[i].FUN_NAME==null)  list[i].FUN_NAME="";
								if(list[i].TAR_SEQ==null)  list[i].TAR_SEQ="";
								$("#datagrid-btable-ajax499653397d8f4ea7bb0aadf8d98aedd5 tbody").append("<tr class='datagrid-row' id='"+list[i].ID+"'  style='cursor: pointer;'></tr>");
                        $("#tbody_499653397d8f4ea7bb0aadf8d98aedd5 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
						$("#tbody_499653397d8f4ea7bb0aadf8d98aedd5 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' class='_selectdata' value='"+list[i].ID+"' name='isSelect'/></td>");
						$("#tbody_499653397d8f4ea7bb0aadf8d98aedd5 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:100px;' >"+list[i].ROLE_NAME+"</td>");
						$("#tbody_499653397d8f4ea7bb0aadf8d98aedd5 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: left;width:100px;' >"+list[i].MENU_NAME+"</td>");
                        $("#tbody_499653397d8f4ea7bb0aadf8d98aedd5 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;width:100px;' >"+list[i].MOUDLE_NAME+"</td>");
						$("#tbody_499653397d8f4ea7bb0aadf8d98aedd5 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: left;width:100px;' >"+list[i].FUN_NAME+"</td>");
                        $("#tbody_499653397d8f4ea7bb0aadf8d98aedd5 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: left;width:60px;' >"+list[i].TAR_SEQ+"</td>");	    
							}
						}
						pageFun(data.ajaxPage,"499653397d8f4ea7bb0aadf8d98aedd5");
						var tableTrJs = $("#datagrid-btable-ajax499653397d8f4ea7bb0aadf8d98aedd5 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('499653397d8f4ea7bb0aadf8d98aedd5');
						defTableWidthRewrite("499653397d8f4ea7bb0aadf8d98aedd5");
						$('.scroll').mCustomScrollbar("destroy");
                        setPopScroll('.scroll','.head');
                        $('.head')[0].scrollLeft = 0 
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
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
    if(formId=='499653397d8f4ea7bb0aadf8d98aedd5'){<%--APP角色表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='TAR_ROLE_ID' name='noprintset_TAR_ROLE_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAR_ROLE_ID')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'TAR_ROLE_ID')+"' "+ms.tdEvent(formId, 'TAR_ROLE_ID')+">")
            arrHtml.push("<span colno='TAR_ROLE_ID' class='"+ms.uiClass(formId, 'TAR_ROLE_ID')+"' style='"+ms.uiStyle(formId, 'TAR_ROLE_ID')+"' "+ms.uiEvent(formId, 'TAR_ROLE_ID')+" title='"+ms.titleAttr(formId,'TAR_ROLE_ID','IS_TITLE_ATTR',v)+"' >"+v['TAR_ROLE_ID']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='TAR_MENU_ID' name='noprintset_TAR_MENU_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAR_MENU_ID')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'TAR_MENU_ID')+"' "+ms.tdEvent(formId, 'TAR_MENU_ID')+">")
            arrHtml.push("<span colno='TAR_MENU_ID' class='"+ms.uiClass(formId, 'TAR_MENU_ID')+"' style='"+ms.uiStyle(formId, 'TAR_MENU_ID')+"' "+ms.uiEvent(formId, 'TAR_MENU_ID')+" title='"+ms.titleAttr(formId,'TAR_MENU_ID','IS_TITLE_ATTR',v)+"' >"+v['TAR_MENU_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAR_MOUDLE_ID' name='noprintset_TAR_MOUDLE_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAR_MOUDLE_ID')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'TAR_MOUDLE_ID')+"' "+ms.tdEvent(formId, 'TAR_MOUDLE_ID')+">")
            arrHtml.push("<span colno='TAR_MOUDLE_ID' class='"+ms.uiClass(formId, 'TAR_MOUDLE_ID')+"' style='"+ms.uiStyle(formId, 'TAR_MOUDLE_ID')+"' "+ms.uiEvent(formId, 'TAR_MOUDLE_ID')+" title='"+ms.titleAttr(formId,'TAR_MOUDLE_ID','IS_TITLE_ATTR',v)+"' >"+v['TAR_MOUDLE_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAS_FUN_ID' name='noprintset_TAS_FUN_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAS_FUN_ID')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'TAS_FUN_ID')+"' "+ms.tdEvent(formId, 'TAS_FUN_ID')+">")
            arrHtml.push("<span colno='TAS_FUN_ID' class='"+ms.uiClass(formId, 'TAS_FUN_ID')+"' style='"+ms.uiStyle(formId, 'TAS_FUN_ID')+"' "+ms.uiEvent(formId, 'TAS_FUN_ID')+" title='"+ms.titleAttr(formId,'TAS_FUN_ID','IS_TITLE_ATTR',v)+"' >"+v['TAS_FUN_ID']+"</span>")
            arrHtml.push("</td>");

            arrHtml.push("<td colno='TAR_SEQ' name='noprintset_TAR_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'TAR_SEQ')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'TAR_SEQ')+"' "+ms.tdEvent(formId, 'TAR_SEQ')+">")
            arrHtml.push("<span colno='TAR_SEQ' class='"+ms.uiClass(formId, 'TAR_SEQ')+"' style='"+ms.uiStyle(formId, 'TAR_SEQ')+"' "+ms.uiEvent(formId, 'TAR_SEQ')+" title='"+ms.titleAttr(formId,'TAR_SEQ','IS_TITLE_ATTR',v)+"' >"+v['TAR_SEQ']+"</span>")
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
</script><script>
<%--生成异步表格--%>
function createTableModel_print(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='499653397d8f4ea7bb0aadf8d98aedd5'){<%--APP角色表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='TAR_ROLE_ID' name='noprintset_TAR_ROLE_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAR_ROLE_ID')+"' style='width:100px;"+ms.tdStyle(formId, 'TAR_ROLE_ID')+"' "+ms.tdEvent(formId, 'TAR_ROLE_ID')+">")
            arrHtml.push("<span colno='TAR_ROLE_ID' class='"+ms.uiClass(formId, 'TAR_ROLE_ID')+"' style='"+ms.uiStyle(formId, 'TAR_ROLE_ID')+"' "+ms.uiEvent(formId, 'TAR_ROLE_ID')+" title='"+ms.titleAttr(formId,'TAR_ROLE_ID','IS_TITLE_ATTR',v)+"' >"+v['TAR_ROLE_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAR_MENU_ID' name='noprintset_TAR_MENU_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAR_MENU_ID')+"' style='width:100px;"+ms.tdStyle(formId, 'TAR_MENU_ID')+"' "+ms.tdEvent(formId, 'TAR_MENU_ID')+">")
            arrHtml.push("<span colno='TAR_MENU_ID' class='"+ms.uiClass(formId, 'TAR_MENU_ID')+"' style='"+ms.uiStyle(formId, 'TAR_MENU_ID')+"' "+ms.uiEvent(formId, 'TAR_MENU_ID')+" title='"+ms.titleAttr(formId,'TAR_MENU_ID','IS_TITLE_ATTR',v)+"' >"+v['TAR_MENU_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAR_MOUDLE_ID' name='noprintset_TAR_MOUDLE_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAR_MOUDLE_ID')+"' style='width:100px;"+ms.tdStyle(formId, 'TAR_MOUDLE_ID')+"' "+ms.tdEvent(formId, 'TAR_MOUDLE_ID')+">")
            arrHtml.push("<span colno='TAR_MOUDLE_ID' class='"+ms.uiClass(formId, 'TAR_MOUDLE_ID')+"' style='"+ms.uiStyle(formId, 'TAR_MOUDLE_ID')+"' "+ms.uiEvent(formId, 'TAR_MOUDLE_ID')+" title='"+ms.titleAttr(formId,'TAR_MOUDLE_ID','IS_TITLE_ATTR',v)+"' >"+v['TAR_MOUDLE_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAS_FUN_ID' name='noprintset_TAS_FUN_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAS_FUN_ID')+"' style='width:100px;"+ms.tdStyle(formId, 'TAS_FUN_ID')+"' "+ms.tdEvent(formId, 'TAS_FUN_ID')+">")
            arrHtml.push("<span colno='TAS_FUN_ID' class='"+ms.uiClass(formId, 'TAS_FUN_ID')+"' style='"+ms.uiStyle(formId, 'TAS_FUN_ID')+"' "+ms.uiEvent(formId, 'TAS_FUN_ID')+" title='"+ms.titleAttr(formId,'TAS_FUN_ID','IS_TITLE_ATTR',v)+"' >"+v['TAS_FUN_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAR_SEQ' name='noprintset_TAR_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'TAR_SEQ')+"' style='width:100px;"+ms.tdStyle(formId, 'TAR_SEQ')+"' "+ms.tdEvent(formId, 'TAR_SEQ')+">")
            arrHtml.push("<span colno='TAR_SEQ' class='"+ms.uiClass(formId, 'TAR_SEQ')+"' style='"+ms.uiStyle(formId, 'TAR_SEQ')+"' "+ms.uiEvent(formId, 'TAR_SEQ')+" title='"+ms.titleAttr(formId,'TAR_SEQ','IS_TITLE_ATTR',v)+"' >"+v['TAR_SEQ']+"</span>")
            arrHtml.push("</td>");
            
            
            
            
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll(formId);
}
function clickTr(formId){
		    var tableId = "tbody_"+formId;
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
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
