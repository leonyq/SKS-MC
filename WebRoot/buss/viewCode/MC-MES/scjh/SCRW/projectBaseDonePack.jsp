<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
 <jsp:param name="modelName" value="VIEW_TYPE_17"/>
 <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
 <title>
  <dict:lang value="VOID-产品包装-当日已处理"/>
 </title>
 <%@ include file="/plf/common/pub_meta.jsp" %>
 <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
  <jsp:param name="popDivWinFp" value="1"/>
  <jsp:param name="datePicker" value="1"/>
  <jsp:param name="chosen" value="1"/>
  <jsp:param name="msData" value="1"/>
 </jsp:include>
 <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
 <%@ include file="/plf/page/common/buss/listCommJs.jsp" %>
 <bu:header formId="ca01f1e21e824c8b94fc899f340bee0e"/>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
  <jsp:param name="modelName" value="VIEW_TYPE_17"/>
  <jsp:param name="location" value="inHead"/>
 </jsp:include>
</head>

<body scroll="auto" style="overflow: auto;">
<div class="content-in">
 <div class="dlist">
  <div class="hd">
   <bu:func viewId="dcc1df179ebf407f8b3bac1ae5250035"/>
  </div>
  <div class="bd">
   <div class="search-box">
    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_17"/>
      <jsp:param name="location" value="searchForm"/>
     </jsp:include>

     <bu:search viewId="dcc1df179ebf407f8b3bac1ae5250035"/>

    </form>
    <a href="javascript:void(0);" class="more"></a>
   </div>
   <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17"/>
     <jsp:param name="location" value="listForm"/>
    </jsp:include>

    <input type="hidden" name="formPageca01f1e21e824c8b94fc899f340bee0e" id="formPageca01f1e21e824c8b94fc899f340bee0e" value="${formPageca01f1e21e824c8b94fc899f340bee0e}"/>
    <input type="hidden" name="formId" id="formId1" value='ca01f1e21e824c8b94fc899f340bee0e'/>

    <input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>

    <input type="hidden" id="subRelColIds" name="subRelColIds" value='97c27cbea7204ba08029f339a015bd8a'/>
    <input type="hidden" id="subFormIds" name="subFormIds" value='fbe85506ea9d4a32b0cf78996898c620'/>
    <div class="panel-ajax datagrid datagrid-div1" id="ca01f1e21e824c8b94fc899f340bee0e">
     <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxca01f1e21e824c8b94fc899f340bee0e" style="">
      <div class="datagrid-header">
       <div class="datagrid-header-inner" id="datagrid-header-innerca01f1e21e824c8b94fc899f340bee0e">
        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableca01f1e21e824c8b94fc899f340bee0e">
         <s:set name="_$type" value="'view'"/>
         <tbody class="isParentsTitle">
         <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
          
           <td class="datagrid-cell" style="width:30px; text-align:center;">
           <bu:thSeq formId="ca01f1e21e824c8b94fc899f340bee0e" i18n="1"/></td>
          <td class="datagrid-cell" style="width:30px; text-align:center;display:none;">
           <span><input type="checkbox" id="selectAll_ca01f1e21e824c8b94fc899f340bee0e" onclick="_selectAjaxTableAllData(this,'ca01f1e21e824c8b94fc899f340bee0e')" style="cursor: pointer;" title="全选"/></span>
          </td>
          <td class="datagrid-cell" style="width:200px;display:none;">
           <bu:uitn colNo="DATA_AUTH" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="PROJECT_ID" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="PROJECT_STATUS" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
         
           <!--<td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="IS_REL" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>-->
          <!--
           <td class="datagrid-cell" style="width:150px;">
           <bu:uitn colNo="PRODUCT_MATERIAL" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>-->
           
           <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="LOT_NUMBER" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
           
           <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="PRODUCT_MATERIAL" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
           
           <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="PRODUCT_NAME" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
           
           
          <!--
            <bu:uitn colNo="PRODUCT_STANDARD" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="width:70px;">-->
           <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="PRODUCT_COUNT" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
           <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="FINISH_COUNT" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
           
          
          <!--
          <td class="datagrid-cell" style="width:110px;">
              <bu:uitn colNo="FAI_NUM" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="width:70px;">
              <bu:uitn colNo="FQC_COUNT" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="width:70px;">
              <bu:uitn colNo="FINISH_COUNT" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="width:140px;">
              <bu:uitn colNo="PROLEPSIS_START_DATE" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="width:140px;">
              <bu:uitn colNo="PROLEPSIS_END_DATE" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="width:150px;">
              <bu:uitn colNo="CUST_CODE" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <td class="datagrid-cell" style="width:150px;">
              <bu:uitn colNo="DESTROY_NO" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          -->
          <!--<td class="datagrid-cell" style="width:90px;">
           <bu:uitn colNo="CREATE_USER" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>-->
           <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="EDIT_USER" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
          <!--<td class="datagrid-cell" style="width:140px;">
           <bu:uitn colNo="CREATE_TIME" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>-->
          <td class="datagrid-cell" style="text-align:center;width:140px;">
           <bu:uitn colNo="EDIT_TIME" formId="ca01f1e21e824c8b94fc899f340bee0e"/></td>
         </bu:tr>
         </tbody>
        </bu:table>
       </div>
      </div>
      <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivca01f1e21e824c8b94fc899f340bee0e" onscroll="ajaxTableScroll(this,'ca01f1e21e824c8b94fc899f340bee0e')">
       <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajaxca01f1e21e824c8b94fc899f340bee0e" >
        <tbody id="tbody_ca01f1e21e824c8b94fc899f340bee0e" class="isParents"></tbody>
       </table>
      </div>
     </div>
    </div>
    <c:if test="${formPageca01f1e21e824c8b94fc899f340bee0e==1}">
    <div class="center">
     <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ca01f1e21e824c8b94fc899f340bee0e&showLoading=0"/>
    </div>
    </c:if>
  </div>


  <input type="hidden" id="relColVals" name="relColVals" value='PROJECT_ID'/>
  <input type="hidden" name="tableCount" id="tableCount" value='1'/>

  </form>
 </div>
</div>
</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
 <jsp:param name="modelName" value="VIEW_TYPE_17"/>
 <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>

<bu:submit viewId="dcc1df179ebf407f8b3bac1ae5250035"/>

<bu:script viewId="dcc1df179ebf407f8b3bac1ae5250035"/>
      <!-- 修改组织机构的width-->
<script type="text/javascript">
     $(function (){
      
       editDadtAuthStyle();
    });
  
function editDadtAuthStyle(){
     $("#DATA_AUTH").width("150px");
}  
</script>
<script type="text/javascript">
    // 主列表
    function listAjaxTable(formId) {
        var currentPage = "";
        var pageRecord = "";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw=" + "{\"" + formId + "\":\"PROJECT_STATUS,PROJECT_OFONESELF,PRODUCT_CONFIGURE\"}";

        var searchParams = $("#searchForm").serialize() + "&" + $("#searchFormTop").serialize();
        if (isPage(formId)) {
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        //util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: searchParams + "&page.currentPage=" + currentPage + "&page.pageRecord=" + pageRecord,
            success: function (data) {
                if (data.RES) {
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms, formId);
                    if (isPage(formId)) {
                        initPage(page, formId);
                    }
                    clearChildTable();
                } else {
                    utilsFp.confirmIcon(3, "", "", "", data.RES_MSG, "", "260", "145");
                }
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
    }

    // 判断是否分页
    function isPage(formId) {
        var isPageVal = $("#formPage" + formId).val();
        if (isPageVal == "1") {
            return true;
        }
        return false;
    }

    // 查询
    function query(thisObj) {
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }

    // 清空表格
    function clearChildTable() {
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }

    // 当出现滚动条时动态设置表格宽度
    function setTableWidth(formId) {
        /**
         *var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
         var height = $("#tableDiv"+formId).height();
         var datagridHeaderWidth = $("#datagrid-view-ajax"+formId+" .datagrid-header").width();
         if(scrollHeight-height>0){
          $("#datagrid-htable"+formId).css("width",datagridHeaderWidth-20+'px');
          $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth-20+'px');
        }else{
          $("#datagrid-htable"+formId).css("width",datagridHeaderWidth+'px');
          $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth+'px');
        }
         *
         */
    }


    // 清空全选
    function clearAllSelect() {
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked", false);
    }


    function reloadPg(msg, title, width, height, time, isCloseWin) {
        msgPop(msg, reloadPgExe, title, width, height, time, isCloseWin);
    }

    function reloadPgExe(isCloseWin) {
        query("formId1");
        if ("0" == isCloseWin || undefined == isCloseWin) {
            top.$(".dialog-close").click();
        }
        checkboxAll("joblist");
    }

    // 子列表
    function listChildAjaxTable(formId, paramList){

    }
    /*function listChildAjaxTable(formId, paramList) {
        var data = {
            "paraMap.formidFirstId": _GLO_FORM_PAGE_MAP[formId].formidFirstId,
            "paraMap.subFormId": _GLO_FORM_PAGE_MAP[formId].subFormId,
            "paraMap.subRelColId": _GLO_FORM_PAGE_MAP[formId].subRelColId,
            "paraMap.relColVal": _GLO_FORM_PAGE_MAP[formId].relColVal,
            "paraMap.subSortCol": _GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
            "paraMap.subSortColOrder": _GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
        };
        if (isPage(formId)) {
            data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
            data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        if (paramList != null && paramList != "") {
            data["paramList"] = paramList;
        }
        var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}&<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />";
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: data,
            success: function (data) {
                if (data.RES) {
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms, formId);
                    if (isPage(formId)) {
                        initPage(page, formId);
                    }
                } else {
                    utilsFp.confirmIcon(3, "", "", "", data.RES_MSG, "", "260", "145");
                }
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
    }
*/
    // 数据为空时设置横向滚动条
    function setCrossWiseScroll(formId, arrHtml) {
        if (arrHtml.length == 0) {
            var tableWidth = $("#datagrid-btable-ajax" + formId).width();
            var tableHeight =
                arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth + "px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'");
            $("#tableDiv" + formId).css({"overflow-y": "hidden", "overflow-x": "auto"});
        } else {
            $("#tableDiv" + formId).css({"overflow-y": "auto", "overflow-x": "auto"});
        }
    }


    // 初始化子分页
    function initChildPage(formId) {
        var ajaxPage = {};
        ajaxPage.currentPage = 1;
        ajaxPage.pageRecord = 20;
        ajaxPage.totalRecord = 0;
        ajaxPage.totalPage = 1;
        ajaxPage.first = true;
        ajaxPage.last = true;
        pageFun(ajaxPage, formId);
    }


    // 初始化分页插件
    function initPage(page, formId) {
        var ajaxPage = {};
        ajaxPage.currentPage = parseInt(page.currentPage);
        ajaxPage.pageRecord = parseInt(page.pageRecord);
        ajaxPage.totalPage = parseInt(page.totalPage);
        ajaxPage.totalRecord = parseInt(page.totalRecord);
        ajaxPage.first = page.first;
        ajaxPage.last = page.last;
        pageFun(ajaxPage, formId);
    }
    // 判断是否首次异步访问
    function firstLoadThisPage(formId) {
        if (typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) == "undefined") {
            return true;
        }
        return false;
    }

    // 初始化子表单
    function getFormIdInitChildPage() {
        var tableCount = $("#tableCount").val();
        for (var i = 2; i <= tableCount; i++) {
            var formId = $("#formId" + i).val();
            if (isPage(formId)) {
                initChildPage(formId);
            }
        }
    }

    function init() {
        if ($(".leftTable-ajax").length > 0) {
            $(".leftTable-ajax").show();
        }
        var jumpId = $("#jumpId").val();
        if (jumpId != "") {
            $("#PROJECT_ID_SHOW").val(jumpId);
            $("#PROJECT_ID").val(jumpId);
        }
        getFormIdInitChildPage();
        listAjaxTable($("#formId1").val());
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();
        </s:if>
    }

    $(function () {
        var colNo = $("#relColVals").val();
        var subRelColIds = $("#subRelColIds").val();
        var subFormIds = $("#subFormIds").val();
        if (subRelColIds != "null") {
            var formId1 = $("#formId1").val();
            $(".isParents tr").live("click", function () {
                var _this = $(this);
                var relColVals = "";
                var abbr = _this.attr("abbr");
                var arrColNo = colNo.split(",");
                $(arrColNo).each(function (i, v) {
                    var childVal = $("tr[abbr='" + abbr + "']").find("input[type='hidden']").val();
                    relColVals += childVal + ",";
                });
                setSubData(formId1, subFormIds, subRelColIds, relColVals, "", "", true);
            });
        }
    });

    //帮助
    function help_mc(exeid) {
        //alert(exeid);
        top.window.open("${path}sys/BussModelAction_showHelp.ms?paraMap.VIEW_ID=" + exeid, "_blank");

    }


</script>
<script>
    var isFirstSetScroll = 0;
    function chgCheckTr(e) {
        var trId = $(e).attr('id');
        if ($("#check_" + trId).attr('checked')) {
            $("#check_" + trId).attr("checked", false);
        } else {
            $("#check_" + trId).attr("checked", true);
        }
     
   
    }
    //生成异步表格
    function createTableModel(ms, formId) {
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId) == null ? [] : ms.uiTxt(formId);
        var uiRaw = ms.uiRaw(formId) == null ? [] : ms.uiRaw(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        if (formId == 'ca01f1e21e824c8b94fc899f340bee0e') {<%--工单信息--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr onclick='chgCheckTr(this)' class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                if ($("#" + formId).find(".left-datagrid-title-ajax").length > 0) {
                    arrLeftHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                    arrLeftHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;display:none;' ><span class='_noedit'>");
                    arrLeftHtml.push("<input type='checkbox' id ='check_" + v.ID + "'  name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrLeftHtml.push("</td>");
                } else {
                    arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;display:none;' ><span class='_noedit'>");
                    arrHtml.push("<input type='checkbox' id ='check_" + v.ID + "' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrHtml.push("</td>");
                }
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH" + ms.tdClass(formId, 'DATA_AUTH') + "' style='width:100px;text-align:center;display:none;" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">");
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + v['DATA_AUTH'] + "' >" + v['DATA_AUTH'] + "</span>");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v['ID'] + "' value='" + v['DATA_AUTH_ID'] + "' /> ");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='width:100px;text-align:center;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + v['PROJECT_ID'] + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("<input type='hidden' id='PROJECT_OFONESELF" + v.ID + "' name='PROJECT_OFONESELF' value='" + uiRaw[i].PROJECT_OFONESELF + "' /></td>");

                arrHtml.push("<td colno='PROJECT_STATUS' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='width:100px;text-align:center;" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='PROJECT_STATUS'  class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " >" + v['PROJECT_STATUS'] + "</span>");
                arrHtml.push("<input type='hidden' id='PROJECT_STATUS_" + v.ID + "' value='" + uiRaw[i].PROJECT_STATUS + "' />");
                arrHtml.push("</td>");
                
          		//arrHtml.push("<td colno='IS_REL' class='datagrid-cell " + ms.tdClass(formId, 'IS_REL') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'IS_REL') + "' " + ms.tdEvent(formId, 'IS_REL') + ">")
               // arrHtml.push("<span colno='IS_REL'  class='" + ms.uiClass(formId, 'IS_REL') + "' style='" + ms.uiStyle(formId, 'IS_REL') + "' " + ms.uiEvent(formId, 'IS_REL') + " >" + v['IS_REL'] + "</span>")
                //arrHtml.push("<input type='hidden' id='IS_REL" + v.ID + "' value='" + uiRaw[i].IS_REL + "' />");
               // arrHtml.push("</td>");
                
                
          		arrHtml.push("<td colno='LOT_NUMBER'  class='datagrid-cell " + ms.tdClass(formId, 'LOT_NUMBER') + "' style='width:100px;text-align:center;" + ms.tdStyle(formId, 'LOT_NUMBER') + "' " + ms.tdEvent(formId, 'LOT_NUMBER') + ">");
                arrHtml.push("<span colno='LOT_NUMBER' class='" + ms.uiClass(formId, 'LOT_NUMBER') + "' onclick='itemJump1(\"" + v['LOT_NUMBER'] + "\")' style='' " + ms.uiEvent(formId, 'LOT_NUMBER') + " title='" + v['LOT_NUMBER'] + "' >" + v['LOT_NUMBER'] + "</span>");
                arrHtml.push("<input type='hidden' id='PRODUCT_CONFIGURE_" + v.ID + "' value='" + uiRaw[i].PRODUCT_CONFIGURE + "' /></td>");
          		
          		arrHtml.push("<td colno='PRODUCT_MATERIAL'  class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='width:100px;text-align:center;" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' onclick='itemJump1(\"" + v['PRODUCT_MATERIAL'] + "\")' style='' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + v['PRODUCT_MATERIAL'] + "' >" + v['PRODUCT_MATERIAL'] + "</span>");
                arrHtml.push("<input type='hidden' id='PRODUCT_CONFIGURE_" + v.ID + "' value='" + uiRaw[i].PRODUCT_CONFIGURE + "' /></td>");
          		
                arrHtml.push("<td colno='PRODUCT_NAME' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='width:100px;text-align:center;" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + v['PRODUCT_NAME'] + "' >" + v['PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");
                //arrHtml.push("<td colno='PRODUCT_STANDARD' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_STANDARD') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.tdEvent(formId, 'PRODUCT_STANDARD') + ">")
                //arrHtml.push("<span colno='PRODUCT_STANDARD' class='" + ms.uiClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.uiStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.uiEvent(formId, 'PRODUCT_STANDARD') + " title='" + v['PRODUCT_STANDARD'] + "' >" + v['PRODUCT_STANDARD'] + "</span>")
                //arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='width:100px;text-align:center;" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " >" + v['PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='FINISH_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'FINISH_COUNT') + "' style='width:100px;text-align:center;" + ms.tdStyle(formId, 'FINISH_COUNT') + "' " + ms.tdEvent(formId, 'FINISH_COUNT') + ">");
                arrHtml.push("<span colno='FINISH_COUNT' class='" + ms.uiClass(formId, 'FINISH_COUNT') + "' style='" + ms.uiStyle(formId, 'FINISH_COUNT') + "' " + ms.uiEvent(formId, 'FINISH_COUNT') + " >" + v['FINISH_COUNT'] + "</span>");
                arrHtml.push("</td>");
          
                /*
                arrHtml.push("<td colno='FAI_NUM' class='datagrid-cell " + ms.tdClass(formId, 'FAI_NUM') + "' style='width:110px;text-align:right;" + ms.tdStyle(formId, 'FAI_NUM') + "' " + ms.tdEvent(formId, 'FAI_NUM') + ">")
                arrHtml.push("<span colno='FAI_NUM' class='" + ms.uiClass(formId, 'FAI_NUM') + "' style='" + ms.uiStyle(formId, 'FAI_NUM') + "' " + ms.uiEvent(formId, 'FAI_NUM') + " >" + v['FAI_NUM'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FQC_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'FQC_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'FQC_COUNT') + "' " + ms.tdEvent(formId, 'FQC_COUNT') + ">")
                arrHtml.push("<span colno='FQC_COUNT' class='" + ms.uiClass(formId, 'FQC_COUNT') + "' style='" + ms.uiStyle(formId, 'FQC_COUNT') + "' " + ms.uiEvent(formId, 'FQC_COUNT') + " >" + v['FQC_COUNT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FINISH_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'FINISH_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'FINISH_COUNT') + "' " + ms.tdEvent(formId, 'FINISH_COUNT') + ">")
                arrHtml.push("<span colno='FINISH_COUNT' class='" + ms.uiClass(formId, 'FINISH_COUNT') + "' style='" + ms.uiStyle(formId, 'FINISH_COUNT') + "' " + ms.uiEvent(formId, 'FINISH_COUNT') + " >" + v['FINISH_COUNT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROLEPSIS_START_DATE' class='datagrid-cell " + ms.tdClass(formId, 'PROLEPSIS_START_DATE') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'PROLEPSIS_START_DATE') + "' " + ms.tdEvent(formId, 'PROLEPSIS_START_DATE') + ">")
                arrHtml.push("<span colno='PROLEPSIS_START_DATE' class='" + ms.uiClass(formId, 'PROLEPSIS_START_DATE') + "' style='" + ms.uiStyle(formId, 'PROLEPSIS_START_DATE') + "' " + ms.uiEvent(formId, 'PROLEPSIS_START_DATE') + " >" + v['PROLEPSIS_START_DATE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROLEPSIS_END_DATE' class='datagrid-cell " + ms.tdClass(formId, 'PROLEPSIS_END_DATE') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'PROLEPSIS_END_DATE') + "' " + ms.tdEvent(formId, 'PROLEPSIS_END_DATE') + ">")
                arrHtml.push("<span colno='PROLEPSIS_END_DATE' class='" + ms.uiClass(formId, 'PROLEPSIS_END_DATE') + "' style='" + ms.uiStyle(formId, 'PROLEPSIS_END_DATE') + "' " + ms.uiEvent(formId, 'PROLEPSIS_END_DATE') + " >" + v['PROLEPSIS_END_DATE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CUST_CODE' class='datagrid-cell " + ms.tdClass(formId, 'CUST_CODE') + "' style='width:150px;" + ms.tdStyle(formId, 'CUST_CODE') + "' " + ms.tdEvent(formId, 'CUST_CODE') + ">")
                arrHtml.push("<span colno='CUST_CODE' class='" + ms.uiClass(formId, 'CUST_CODE') + "' style='" + ms.uiStyle(formId, 'CUST_CODE') + "' " + ms.uiEvent(formId, 'CUST_CODE') + " title='" + v['CUST_CODE'] + "' >" + v['CUST_CODE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DESTROY_NO' class='datagrid-cell " + ms.tdClass(formId, 'DESTROY_NO') + "' style='width:150px;" + ms.tdStyle(formId, 'DESTROY_NO') + "' " + ms.tdEvent(formId, 'DESTROY_NO') + ">")
                arrHtml.push("<span colno='DESTROY_NO' class='" + ms.uiClass(formId, 'DESTROY_NO') + "' style='" + ms.uiStyle(formId, 'DESTROY_NO') + "' " + ms.uiEvent(formId, 'DESTROY_NO') + " >" + v['DESTROY_NO'] + "</span>")
                arrHtml.push("</td>");
                */
                //arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell " + ms.tdClass(formId, 'CREATE_USER') + "' style='width:90px;text-align:center;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">")
                //arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " >" + v['CREATE_USER'] + "</span>")
                //arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='EDIT_USER' class='datagrid-cell " + ms.tdClass(formId, 'EDIT_USER') + "' style='width:100px;text-align:center;" + ms.tdStyle(formId, 'EDIT_USER') + "' " + ms.tdEvent(formId, 'EDIT_USER') + ">");
                arrHtml.push("<span colno='EDIT_USER' class='" + ms.uiClass(formId, 'EDIT_USER') + "' style='" + ms.uiStyle(formId, 'EDIT_USER') + "' " + ms.uiEvent(formId, 'EDIT_USER') + " >" + v['EDIT_USER'] + "</span>");
                arrHtml.push("</td>");
                
          		//arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell " + ms.tdClass(formId, 'CREATE_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">")
                //arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " >" + v['CREATE_TIME'] + "</span>")
                //arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell " + ms.tdClass(formId, 'EDIT_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " >" + v['EDIT_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_" + formId).html(arrHtml.join(""));
        }
        setNumColWidth(formId);
        clearAllSelect();
        if (isFirstSetScroll == 0) {
            isFirstSetScroll = 1;
            setScroll();
        }
    }

    function getOrderBom(key) {

    }
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

    //BOM管理
   /* function itemJump1(obj) {
        winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae", "F3811", "jumpId", obj);
    }*/


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp" %>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
 <jsp:param name="modelName" value="VIEW_TYPE_17"/>
 <jsp:param name="location" value="pageOver"/>
</jsp:include>