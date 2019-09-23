<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="ldg_异步列表测试3" />
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
		<bu:header formId ="5878e0ec349a40f5805711444035fff6"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="b07c636f6dc14f8383424dd2a2e10ff1" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="b07c636f6dc14f8383424dd2a2e10ff1" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage5878e0ec349a40f5805711444035fff6" id="formPage5878e0ec349a40f5805711444035fff6" value="${formPage5878e0ec349a40f5805711444035fff6}"/>
		<input type="hidden" name="formId" id="formId1" value='5878e0ec349a40f5805711444035fff6'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='034c2cb15bb9441b848b9e05c7378c28,012e3b5614cf4af6969d88afc74ae640'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='ebdc1d04fc9b4685950f89bd348e7689,240e00fb449541a98541a619412c0a7a'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="5878e0ec349a40f5805711444035fff6">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax5878e0ec349a40f5805711444035fff6" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable5878e0ec349a40f5805711444035fff6">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="5878e0ec349a40f5805711444035fff6" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_5878e0ec349a40f5805711444035fff6" onclick="_selectAjaxTableAllData(this,'5878e0ec349a40f5805711444035fff6')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="BOM_SEPC" formId="5878e0ec349a40f5805711444035fff6" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BOM_NAME" formId="5878e0ec349a40f5805711444035fff6" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BOM_ID" formId="5878e0ec349a40f5805711444035fff6" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv5878e0ec349a40f5805711444035fff6" onscroll="ajaxTableScroll(this,'5878e0ec349a40f5805711444035fff6')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax5878e0ec349a40f5805711444035fff6">
		<tbody id="tbody_5878e0ec349a40f5805711444035fff6" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage5878e0ec349a40f5805711444035fff6==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=5878e0ec349a40f5805711444035fff6&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPageebdc1d04fc9b4685950f89bd348e7689" id="formPageebdc1d04fc9b4685950f89bd348e7689" value="${formPageebdc1d04fc9b4685950f89bd348e7689}"/>
		<input type="hidden" name="formId" id="formId2" value='ebdc1d04fc9b4685950f89bd348e7689'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="ebdc1d04fc9b4685950f89bd348e7689">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxebdc1d04fc9b4685950f89bd348e7689" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableebdc1d04fc9b4685950f89bd348e7689">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ebdc1d04fc9b4685950f89bd348e7689" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ebdc1d04fc9b4685950f89bd348e7689" onclick="_selectAjaxTableAllData(this,'ebdc1d04fc9b4685950f89bd348e7689')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROVINCE" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CITY" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="AREA" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TOWN" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CO_ITEM_SPEC" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CO_ITEM_ID" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CO_ITEM_NAME" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ORDER_ID" formId="ebdc1d04fc9b4685950f89bd348e7689" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivebdc1d04fc9b4685950f89bd348e7689" onscroll="ajaxTableScroll(this,'ebdc1d04fc9b4685950f89bd348e7689')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajaxebdc1d04fc9b4685950f89bd348e7689">
		<tbody id="tbody_ebdc1d04fc9b4685950f89bd348e7689" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageebdc1d04fc9b4685950f89bd348e7689==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=ebdc1d04fc9b4685950f89bd348e7689&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPage240e00fb449541a98541a619412c0a7a" id="formPage240e00fb449541a98541a619412c0a7a" value="${formPage240e00fb449541a98541a619412c0a7a}"/>
		<input type="hidden" name="formId" id="formId3" value='240e00fb449541a98541a619412c0a7a'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="240e00fb449541a98541a619412c0a7a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax240e00fb449541a98541a619412c0a7a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable240e00fb449541a98541a619412c0a7a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="240e00fb449541a98541a619412c0a7a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_240e00fb449541a98541a619412c0a7a" onclick="_selectAjaxTableAllData(this,'240e00fb449541a98541a619412c0a7a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="O_CODE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_DOC_NUM" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_PROVIDE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="DT_CODE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_IN_DATE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_STORE_CODE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_STATE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_INPUT_DATE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_INPUT_NO" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_SOURCE_DOC" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_CLIENT" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_DATE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_SHOPRESERVOIR_CODE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MIX_FLAG" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="RETURN_ERP_FLAG" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="URGENT_FLAG" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_RESERVOIR_CODE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_SEND_NO" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_SEND_DATE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_RECEIVE_NO" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_RECEIVE_DATE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_CLOSE_NO" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_CLOSE_DATE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_REMARK" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WR_TYPE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ERP_DOC" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ERP_DOC_TYPE" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_ID" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="SETTLE_ACCOUNTS" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ORDER_ID" formId="240e00fb449541a98541a619412c0a7a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="OQA_FLAG" formId="240e00fb449541a98541a619412c0a7a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv240e00fb449541a98541a619412c0a7a" onscroll="ajaxTableScroll(this,'240e00fb449541a98541a619412c0a7a')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax240e00fb449541a98541a619412c0a7a">
		<tbody id="tbody_240e00fb449541a98541a619412c0a7a" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage240e00fb449541a98541a619412c0a7a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=240e00fb449541a98541a619412c0a7a&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='ID,ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='3' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="b07c636f6dc14f8383424dd2a2e10ff1" />
		<bu:script viewId="b07c636f6dc14f8383424dd2a2e10ff1" />
    <script type="text/javascript">
    
    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms";
        if(isPage(formId)){
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        //util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:$("#searchForm").serialize()+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(currentPage>20){
                        setTableHeight(formId);
                    }
                    if(isPage(formId)){
                        initPage(page,formId);
                    }
                    clearChildTable();
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){    
           return true;
        }
        return false;
    }
    function query(thisObj){
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }
    
    // 清空表格
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
    function setTableHeight(){
        $(".datagrid-htable").css("width",$(".datagrid-header").width()-20+'px');
        $(".datagrid-btable").css("width",$(".datagrid-header").width()-20+'px');
    }
    
    function alertInfo(msg){
        utilsFp.alert(msg);
    }
    
    // 清空全选
    function clearAllSelect(){
    	$(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
    function reloadPg(msg,title,width,height,time){
        msgPop(msg,"",title,width,height,time);
    }
    
    // 子列表
    function listChildAjaxTable(formId,paramList){
        var data = {
            "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
            "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
            "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
            "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
            "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
            "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
        };
        if(isPage(formId)){
            data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
            data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        if(paramList != null && paramList != ""){
            data["paramList"] = paramList;
        }
        var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}";
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:data,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(isPage(formId)){
                        initPage(page,formId);    
                    }
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    
    // 初始化子分页
    function initChildPage(formId){
        var ajaxPage = new Object();
        ajaxPage.currentPage = 1;
        ajaxPage.pageRecord = 20;
        ajaxPage.totalRecord = 0;
        ajaxPage.totalPage = 1;
        ajaxPage.first = true;
        ajaxPage.last = true;
        pageFun(ajaxPage,formId);
    }
    
    
    // 初始化分页插件
    function initPage(page,formId){
        var ajaxPage = new Object();
        ajaxPage.currentPage = parseInt(page.currentPage);
        ajaxPage.pageRecord = parseInt(page.pageRecord);
        ajaxPage.totalPage = parseInt(page.totalPage);
        ajaxPage.totalRecord = parseInt(page.totalRecord);
        ajaxPage.first = page.first;
        ajaxPage.last = page.last;
        pageFun(ajaxPage,formId);
    };
    
    // 判断是否首次异步访问
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }
    
    // 初始化子表单
    function getFormIdInitChildPage(){
        var tableCount = $("#tableCount").val();
        for ( var i = 2; i <= tableCount; i++) {
            var formId = $("#formId"+i).val();
            if(isPage(formId)){
               initChildPage(formId);
            }
        }
    }
    
    function init(){
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
        listAjaxTable($("#formId1").val());
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
     }

    $(function(){
        var colNo = $("#relColVals").val();
        var subRelColIds = $("#subRelColIds").val();
        var subFormIds = $("#subFormIds").val();
        if(subRelColIds!="null"){
            var formId1 = $("#formId1").val();
            $(".isParents tr").live("click",function(){
                var _this = $(this);
                var relColVals = "";
                var abbr = _this.attr("abbr");
                var arrColNo = colNo.split(",");
                $(arrColNo).each(function(i,v){
                    var childVal = $("tr[abbr='"+abbr+"']").find("input[type='hidden']").val();
                    relColVals += childVal+",";
                });
                setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
            });
        };
    });
</script>
<script>
//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='5878e0ec349a40f5805711444035fff6'){<%--订单表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
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
                arrHtml.push("<td colno='BOM_SEPC' class='datagrid-cell "+ms.tdClass(formId, 'BOM_SEPC')+"' style='"+ms.tdStyle(formId, 'BOM_SEPC')+"' "+ms.tdEvent(formId, 'BOM_SEPC')+">")
                arrHtml.push("<span colno='BOM_SEPC' class='"+ms.uiClass(formId, 'BOM_SEPC')+"' style='"+ms.uiStyle(formId, 'BOM_SEPC')+"' "+ms.uiEvent(formId, 'BOM_SEPC')+" >"+v['BOM_SEPC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='BOM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'BOM_NAME')+"' style='"+ms.tdStyle(formId, 'BOM_NAME')+"' "+ms.tdEvent(formId, 'BOM_NAME')+">")
                arrHtml.push("<span colno='BOM_NAME' class='"+ms.uiClass(formId, 'BOM_NAME')+"' style='"+ms.uiStyle(formId, 'BOM_NAME')+"' "+ms.uiEvent(formId, 'BOM_NAME')+" >"+v['BOM_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='BOM_ID' class='datagrid-cell "+ms.tdClass(formId, 'BOM_ID')+"' style='"+ms.tdStyle(formId, 'BOM_ID')+"' "+ms.tdEvent(formId, 'BOM_ID')+">")
                arrHtml.push("<span colno='BOM_ID' class='"+ms.uiClass(formId, 'BOM_ID')+"' style='"+ms.uiStyle(formId, 'BOM_ID')+"' "+ms.uiEvent(formId, 'BOM_ID')+" >"+v['BOM_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='ebdc1d04fc9b4685950f89bd348e7689'){<%--订单明细表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
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
                arrHtml.push("<td colno='PROVINCE' class='datagrid-cell "+ms.tdClass(formId, 'PROVINCE')+"' style='"+ms.tdStyle(formId, 'PROVINCE')+"' "+ms.tdEvent(formId, 'PROVINCE')+">")
                arrHtml.push("<span colno='PROVINCE' class='"+ms.uiClass(formId, 'PROVINCE')+"' style='"+ms.uiStyle(formId, 'PROVINCE')+"' "+ms.uiEvent(formId, 'PROVINCE')+" >"+v['PROVINCE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CITY' class='datagrid-cell "+ms.tdClass(formId, 'CITY')+"' style='"+ms.tdStyle(formId, 'CITY')+"' "+ms.tdEvent(formId, 'CITY')+">")
                arrHtml.push("<span colno='CITY' class='"+ms.uiClass(formId, 'CITY')+"' style='"+ms.uiStyle(formId, 'CITY')+"' "+ms.uiEvent(formId, 'CITY')+" >"+v['CITY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='AREA' class='datagrid-cell "+ms.tdClass(formId, 'AREA')+"' style='"+ms.tdStyle(formId, 'AREA')+"' "+ms.tdEvent(formId, 'AREA')+">")
                arrHtml.push("<span colno='AREA' class='"+ms.uiClass(formId, 'AREA')+"' style='"+ms.uiStyle(formId, 'AREA')+"' "+ms.uiEvent(formId, 'AREA')+" >"+v['AREA']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TOWN' class='datagrid-cell "+ms.tdClass(formId, 'TOWN')+"' style='"+ms.tdStyle(formId, 'TOWN')+"' "+ms.tdEvent(formId, 'TOWN')+">")
                arrHtml.push("<span colno='TOWN' class='"+ms.uiClass(formId, 'TOWN')+"' style='"+ms.uiStyle(formId, 'TOWN')+"' "+ms.uiEvent(formId, 'TOWN')+" >"+v['TOWN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TEST1' class='datagrid-cell "+ms.tdClass(formId, 'TEST1')+"' style='"+ms.tdStyle(formId, 'TEST1')+"' "+ms.tdEvent(formId, 'TEST1')+">")
                arrHtml.push("<span colno='TEST1' class='"+ms.uiClass(formId, 'TEST1')+"' style='"+ms.uiStyle(formId, 'TEST1')+"' "+ms.uiEvent(formId, 'TEST1')+" >"+v['TEST1']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CO_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'CO_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CO_ITEM_SPEC')+">")
                arrHtml.push("<span colno='CO_ITEM_SPEC' class='"+ms.uiClass(formId, 'CO_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CO_ITEM_SPEC')+" >"+v['CO_ITEM_SPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CO_ITEM_ID' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_ID')+"' style='"+ms.tdStyle(formId, 'CO_ITEM_ID')+"' "+ms.tdEvent(formId, 'CO_ITEM_ID')+">")
                arrHtml.push("<span colno='CO_ITEM_ID' class='"+ms.uiClass(formId, 'CO_ITEM_ID')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_ID')+"' "+ms.uiEvent(formId, 'CO_ITEM_ID')+" >"+v['CO_ITEM_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CO_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'CO_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CO_ITEM_NAME')+">")
                arrHtml.push("<span colno='CO_ITEM_NAME' class='"+ms.uiClass(formId, 'CO_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CO_ITEM_NAME')+" >"+v['CO_ITEM_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ORDER_ID' class='datagrid-cell "+ms.tdClass(formId, 'ORDER_ID')+"' style='"+ms.tdStyle(formId, 'ORDER_ID')+"' "+ms.tdEvent(formId, 'ORDER_ID')+">")
                arrHtml.push("<span colno='ORDER_ID' class='"+ms.uiClass(formId, 'ORDER_ID')+"' style='"+ms.uiStyle(formId, 'ORDER_ID')+"' "+ms.uiEvent(formId, 'ORDER_ID')+" >"+v['ORDER_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='800b729ce4684d54ab5e1fadca80d042'){<%--订单操作日志--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
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
                arrHtml.push("<td colno='ORDER_DETAIL_ID' class='datagrid-cell "+ms.tdClass(formId, 'ORDER_DETAIL_ID')+"' style='"+ms.tdStyle(formId, 'ORDER_DETAIL_ID')+"' "+ms.tdEvent(formId, 'ORDER_DETAIL_ID')+">")
                arrHtml.push("<span colno='ORDER_DETAIL_ID' class='"+ms.uiClass(formId, 'ORDER_DETAIL_ID')+"' style='"+ms.uiStyle(formId, 'ORDER_DETAIL_ID')+"' "+ms.uiEvent(formId, 'ORDER_DETAIL_ID')+" >"+v['ORDER_DETAIL_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='OPER_USER' class='datagrid-cell "+ms.tdClass(formId, 'OPER_USER')+"' style='"+ms.tdStyle(formId, 'OPER_USER')+"' "+ms.tdEvent(formId, 'OPER_USER')+">")
                arrHtml.push("<span colno='OPER_USER' class='"+ms.uiClass(formId, 'OPER_USER')+"' style='"+ms.uiStyle(formId, 'OPER_USER')+"' "+ms.uiEvent(formId, 'OPER_USER')+" >"+v['OPER_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='OPER_COTENT' class='datagrid-cell "+ms.tdClass(formId, 'OPER_COTENT')+"' style='"+ms.tdStyle(formId, 'OPER_COTENT')+"' "+ms.tdEvent(formId, 'OPER_COTENT')+">")
                arrHtml.push("<span colno='OPER_COTENT' class='"+ms.uiClass(formId, 'OPER_COTENT')+"' style='"+ms.uiStyle(formId, 'OPER_COTENT')+"' "+ms.uiEvent(formId, 'OPER_COTENT')+" >"+v['OPER_COTENT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='240e00fb449541a98541a619412c0a7a'){<%--入库单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
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
                arrHtml.push("<td colno='O_CODE' class='datagrid-cell "+ms.tdClass(formId, 'O_CODE')+"' style='"+ms.tdStyle(formId, 'O_CODE')+"' "+ms.tdEvent(formId, 'O_CODE')+">")
                arrHtml.push("<span colno='O_CODE' class='"+ms.uiClass(formId, 'O_CODE')+"' style='"+ms.uiStyle(formId, 'O_CODE')+"' "+ms.uiEvent(formId, 'O_CODE')+" >"+v['O_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WR_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WR_DOC_NUM')+"' "+ms.tdEvent(formId, 'WR_DOC_NUM')+">")
                arrHtml.push("<span colno='WR_DOC_NUM' class='"+ms.uiClass(formId, 'WR_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WR_DOC_NUM')+"' "+ms.uiEvent(formId, 'WR_DOC_NUM')+" >"+v['WR_DOC_NUM']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_PROVIDE' class='datagrid-cell "+ms.tdClass(formId, 'WR_PROVIDE')+"' style='"+ms.tdStyle(formId, 'WR_PROVIDE')+"' "+ms.tdEvent(formId, 'WR_PROVIDE')+">")
                arrHtml.push("<span colno='WR_PROVIDE' class='"+ms.uiClass(formId, 'WR_PROVIDE')+"' style='"+ms.uiStyle(formId, 'WR_PROVIDE')+"' "+ms.uiEvent(formId, 'WR_PROVIDE')+" >"+v['WR_PROVIDE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'DT_CODE')+"' style='"+ms.tdStyle(formId, 'DT_CODE')+"' "+ms.tdEvent(formId, 'DT_CODE')+">")
                arrHtml.push("<span colno='DT_CODE' class='"+ms.uiClass(formId, 'DT_CODE')+"' style='"+ms.uiStyle(formId, 'DT_CODE')+"' "+ms.uiEvent(formId, 'DT_CODE')+" >"+v['DT_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_IN_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WR_IN_DATE')+"' style='"+ms.tdStyle(formId, 'WR_IN_DATE')+"' "+ms.tdEvent(formId, 'WR_IN_DATE')+">")
                arrHtml.push("<span colno='WR_IN_DATE' class='"+ms.uiClass(formId, 'WR_IN_DATE')+"' style='"+ms.uiStyle(formId, 'WR_IN_DATE')+"' "+ms.uiEvent(formId, 'WR_IN_DATE')+" >"+v['WR_IN_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_STORE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WR_STORE_CODE')+"' style='"+ms.tdStyle(formId, 'WR_STORE_CODE')+"' "+ms.tdEvent(formId, 'WR_STORE_CODE')+">")
                arrHtml.push("<span colno='WR_STORE_CODE' class='"+ms.uiClass(formId, 'WR_STORE_CODE')+"' style='"+ms.uiStyle(formId, 'WR_STORE_CODE')+"' "+ms.uiEvent(formId, 'WR_STORE_CODE')+" >"+v['WR_STORE_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_STATE' class='datagrid-cell "+ms.tdClass(formId, 'WR_STATE')+"' style='"+ms.tdStyle(formId, 'WR_STATE')+"' "+ms.tdEvent(formId, 'WR_STATE')+">")
                arrHtml.push("<span colno='WR_STATE' class='"+ms.uiClass(formId, 'WR_STATE')+"' style='"+ms.uiStyle(formId, 'WR_STATE')+"' "+ms.uiEvent(formId, 'WR_STATE')+" >"+v['WR_STATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_INPUT_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WR_INPUT_DATE')+"' style='"+ms.tdStyle(formId, 'WR_INPUT_DATE')+"' "+ms.tdEvent(formId, 'WR_INPUT_DATE')+">")
                arrHtml.push("<span colno='WR_INPUT_DATE' class='"+ms.uiClass(formId, 'WR_INPUT_DATE')+"' style='"+ms.uiStyle(formId, 'WR_INPUT_DATE')+"' "+ms.uiEvent(formId, 'WR_INPUT_DATE')+" >"+v['WR_INPUT_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_INPUT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WR_INPUT_NO')+"' style='"+ms.tdStyle(formId, 'WR_INPUT_NO')+"' "+ms.tdEvent(formId, 'WR_INPUT_NO')+">")
                arrHtml.push("<span colno='WR_INPUT_NO' class='"+ms.uiClass(formId, 'WR_INPUT_NO')+"' style='"+ms.uiStyle(formId, 'WR_INPUT_NO')+"' "+ms.uiEvent(formId, 'WR_INPUT_NO')+" >"+v['WR_INPUT_NO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_SOURCE_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WR_SOURCE_DOC')+"' style='"+ms.tdStyle(formId, 'WR_SOURCE_DOC')+"' "+ms.tdEvent(formId, 'WR_SOURCE_DOC')+">")
                arrHtml.push("<span colno='WR_SOURCE_DOC' class='"+ms.uiClass(formId, 'WR_SOURCE_DOC')+"' style='"+ms.uiStyle(formId, 'WR_SOURCE_DOC')+"' "+ms.uiEvent(formId, 'WR_SOURCE_DOC')+" >"+v['WR_SOURCE_DOC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_CLIENT' class='datagrid-cell "+ms.tdClass(formId, 'WR_CLIENT')+"' style='"+ms.tdStyle(formId, 'WR_CLIENT')+"' "+ms.tdEvent(formId, 'WR_CLIENT')+">")
                arrHtml.push("<span colno='WR_CLIENT' class='"+ms.uiClass(formId, 'WR_CLIENT')+"' style='"+ms.uiStyle(formId, 'WR_CLIENT')+"' "+ms.uiEvent(formId, 'WR_CLIENT')+" >"+v['WR_CLIENT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WR_DATE')+"' style='"+ms.tdStyle(formId, 'WR_DATE')+"' "+ms.tdEvent(formId, 'WR_DATE')+">")
                arrHtml.push("<span colno='WR_DATE' class='"+ms.uiClass(formId, 'WR_DATE')+"' style='"+ms.uiStyle(formId, 'WR_DATE')+"' "+ms.uiEvent(formId, 'WR_DATE')+" >"+v['WR_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_SHOPRESERVOIR_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WR_SHOPRESERVOIR_CODE')+"' style='"+ms.tdStyle(formId, 'WR_SHOPRESERVOIR_CODE')+"' "+ms.tdEvent(formId, 'WR_SHOPRESERVOIR_CODE')+">")
                arrHtml.push("<span colno='WR_SHOPRESERVOIR_CODE' class='"+ms.uiClass(formId, 'WR_SHOPRESERVOIR_CODE')+"' style='"+ms.uiStyle(formId, 'WR_SHOPRESERVOIR_CODE')+"' "+ms.uiEvent(formId, 'WR_SHOPRESERVOIR_CODE')+" >"+v['WR_SHOPRESERVOIR_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MIX_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'MIX_FLAG')+"' style='"+ms.tdStyle(formId, 'MIX_FLAG')+"' "+ms.tdEvent(formId, 'MIX_FLAG')+">")
                arrHtml.push("<span colno='MIX_FLAG' class='"+ms.uiClass(formId, 'MIX_FLAG')+"' style='"+ms.uiStyle(formId, 'MIX_FLAG')+"' "+ms.uiEvent(formId, 'MIX_FLAG')+" >"+v['MIX_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RETURN_ERP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'RETURN_ERP_FLAG')+"' style='"+ms.tdStyle(formId, 'RETURN_ERP_FLAG')+"' "+ms.tdEvent(formId, 'RETURN_ERP_FLAG')+">")
                arrHtml.push("<span colno='RETURN_ERP_FLAG' class='"+ms.uiClass(formId, 'RETURN_ERP_FLAG')+"' style='"+ms.uiStyle(formId, 'RETURN_ERP_FLAG')+"' "+ms.uiEvent(formId, 'RETURN_ERP_FLAG')+" >"+v['RETURN_ERP_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='URGENT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'URGENT_FLAG')+"' style='"+ms.tdStyle(formId, 'URGENT_FLAG')+"' "+ms.tdEvent(formId, 'URGENT_FLAG')+">")
                arrHtml.push("<span colno='URGENT_FLAG' class='"+ms.uiClass(formId, 'URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'URGENT_FLAG')+"' "+ms.uiEvent(formId, 'URGENT_FLAG')+" >"+v['URGENT_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_RESERVOIR_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WR_RESERVOIR_CODE')+"' style='"+ms.tdStyle(formId, 'WR_RESERVOIR_CODE')+"' "+ms.tdEvent(formId, 'WR_RESERVOIR_CODE')+">")
                arrHtml.push("<span colno='WR_RESERVOIR_CODE' class='"+ms.uiClass(formId, 'WR_RESERVOIR_CODE')+"' style='"+ms.uiStyle(formId, 'WR_RESERVOIR_CODE')+"' "+ms.uiEvent(formId, 'WR_RESERVOIR_CODE')+" >"+v['WR_RESERVOIR_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_SEND_NO' class='datagrid-cell "+ms.tdClass(formId, 'WR_SEND_NO')+"' style='"+ms.tdStyle(formId, 'WR_SEND_NO')+"' "+ms.tdEvent(formId, 'WR_SEND_NO')+">")
                arrHtml.push("<span colno='WR_SEND_NO' class='"+ms.uiClass(formId, 'WR_SEND_NO')+"' style='"+ms.uiStyle(formId, 'WR_SEND_NO')+"' "+ms.uiEvent(formId, 'WR_SEND_NO')+" >"+v['WR_SEND_NO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_SEND_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WR_SEND_DATE')+"' style='"+ms.tdStyle(formId, 'WR_SEND_DATE')+"' "+ms.tdEvent(formId, 'WR_SEND_DATE')+">")
                arrHtml.push("<span colno='WR_SEND_DATE' class='"+ms.uiClass(formId, 'WR_SEND_DATE')+"' style='"+ms.uiStyle(formId, 'WR_SEND_DATE')+"' "+ms.uiEvent(formId, 'WR_SEND_DATE')+" >"+v['WR_SEND_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_RECEIVE_NO' class='datagrid-cell "+ms.tdClass(formId, 'WR_RECEIVE_NO')+"' style='"+ms.tdStyle(formId, 'WR_RECEIVE_NO')+"' "+ms.tdEvent(formId, 'WR_RECEIVE_NO')+">")
                arrHtml.push("<span colno='WR_RECEIVE_NO' class='"+ms.uiClass(formId, 'WR_RECEIVE_NO')+"' style='"+ms.uiStyle(formId, 'WR_RECEIVE_NO')+"' "+ms.uiEvent(formId, 'WR_RECEIVE_NO')+" >"+v['WR_RECEIVE_NO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_RECEIVE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WR_RECEIVE_DATE')+"' style='"+ms.tdStyle(formId, 'WR_RECEIVE_DATE')+"' "+ms.tdEvent(formId, 'WR_RECEIVE_DATE')+">")
                arrHtml.push("<span colno='WR_RECEIVE_DATE' class='"+ms.uiClass(formId, 'WR_RECEIVE_DATE')+"' style='"+ms.uiStyle(formId, 'WR_RECEIVE_DATE')+"' "+ms.uiEvent(formId, 'WR_RECEIVE_DATE')+" >"+v['WR_RECEIVE_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_CLOSE_NO' class='datagrid-cell "+ms.tdClass(formId, 'WR_CLOSE_NO')+"' style='"+ms.tdStyle(formId, 'WR_CLOSE_NO')+"' "+ms.tdEvent(formId, 'WR_CLOSE_NO')+">")
                arrHtml.push("<span colno='WR_CLOSE_NO' class='"+ms.uiClass(formId, 'WR_CLOSE_NO')+"' style='"+ms.uiStyle(formId, 'WR_CLOSE_NO')+"' "+ms.uiEvent(formId, 'WR_CLOSE_NO')+" >"+v['WR_CLOSE_NO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_CLOSE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WR_CLOSE_DATE')+"' style='"+ms.tdStyle(formId, 'WR_CLOSE_DATE')+"' "+ms.tdEvent(formId, 'WR_CLOSE_DATE')+">")
                arrHtml.push("<span colno='WR_CLOSE_DATE' class='"+ms.uiClass(formId, 'WR_CLOSE_DATE')+"' style='"+ms.uiStyle(formId, 'WR_CLOSE_DATE')+"' "+ms.uiEvent(formId, 'WR_CLOSE_DATE')+" >"+v['WR_CLOSE_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_REMARK' class='datagrid-cell "+ms.tdClass(formId, 'WR_REMARK')+"' style='"+ms.tdStyle(formId, 'WR_REMARK')+"' "+ms.tdEvent(formId, 'WR_REMARK')+">")
                arrHtml.push("<span colno='WR_REMARK' class='"+ms.uiClass(formId, 'WR_REMARK')+"' style='"+ms.uiStyle(formId, 'WR_REMARK')+"' "+ms.uiEvent(formId, 'WR_REMARK')+" >"+v['WR_REMARK']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WR_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WR_TYPE')+"' style='"+ms.tdStyle(formId, 'WR_TYPE')+"' "+ms.tdEvent(formId, 'WR_TYPE')+">")
                arrHtml.push("<span colno='WR_TYPE' class='"+ms.uiClass(formId, 'WR_TYPE')+"' style='"+ms.uiStyle(formId, 'WR_TYPE')+"' "+ms.uiEvent(formId, 'WR_TYPE')+" >"+v['WR_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ERP_DOC' class='datagrid-cell "+ms.tdClass(formId, 'ERP_DOC')+"' style='"+ms.tdStyle(formId, 'ERP_DOC')+"' "+ms.tdEvent(formId, 'ERP_DOC')+">")
                arrHtml.push("<span colno='ERP_DOC' class='"+ms.uiClass(formId, 'ERP_DOC')+"' style='"+ms.uiStyle(formId, 'ERP_DOC')+"' "+ms.uiEvent(formId, 'ERP_DOC')+" >"+v['ERP_DOC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ERP_DOC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'ERP_DOC_TYPE')+"' style='"+ms.tdStyle(formId, 'ERP_DOC_TYPE')+"' "+ms.tdEvent(formId, 'ERP_DOC_TYPE')+">")
                arrHtml.push("<span colno='ERP_DOC_TYPE' class='"+ms.uiClass(formId, 'ERP_DOC_TYPE')+"' style='"+ms.uiStyle(formId, 'ERP_DOC_TYPE')+"' "+ms.uiEvent(formId, 'ERP_DOC_TYPE')+" >"+v['ERP_DOC_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">")
                arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" >"+v['PROJECT_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SETTLE_ACCOUNTS' class='datagrid-cell "+ms.tdClass(formId, 'SETTLE_ACCOUNTS')+"' style='"+ms.tdStyle(formId, 'SETTLE_ACCOUNTS')+"' "+ms.tdEvent(formId, 'SETTLE_ACCOUNTS')+">")
                arrHtml.push("<span colno='SETTLE_ACCOUNTS' class='"+ms.uiClass(formId, 'SETTLE_ACCOUNTS')+"' style='"+ms.uiStyle(formId, 'SETTLE_ACCOUNTS')+"' "+ms.uiEvent(formId, 'SETTLE_ACCOUNTS')+" >"+v['SETTLE_ACCOUNTS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ORDER_ID' class='datagrid-cell "+ms.tdClass(formId, 'ORDER_ID')+"' style='"+ms.tdStyle(formId, 'ORDER_ID')+"' "+ms.tdEvent(formId, 'ORDER_ID')+">")
                arrHtml.push("<span colno='ORDER_ID' class='"+ms.uiClass(formId, 'ORDER_ID')+"' style='"+ms.uiStyle(formId, 'ORDER_ID')+"' "+ms.uiEvent(formId, 'ORDER_ID')+" >"+v['ORDER_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='OQA_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'OQA_FLAG')+"' style='"+ms.tdStyle(formId, 'OQA_FLAG')+"' "+ms.tdEvent(formId, 'OQA_FLAG')+">")
                arrHtml.push("<span colno='OQA_FLAG' class='"+ms.uiClass(formId, 'OQA_FLAG')+"' style='"+ms.uiStyle(formId, 'OQA_FLAG')+"' "+ms.uiEvent(formId, 'OQA_FLAG')+" >"+v['OQA_FLAG']+"</span>")
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
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
