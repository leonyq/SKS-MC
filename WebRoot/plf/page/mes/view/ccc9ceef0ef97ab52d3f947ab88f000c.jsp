<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="test_ldg2" />
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
		<bu:header formId ="b3b00ad970894885bd60a59ca296580c"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="2a99975fe4dc46d58874659938857d89" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="2a99975fe4dc46d58874659938857d89" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPageb3b00ad970894885bd60a59ca296580c" id="formPageb3b00ad970894885bd60a59ca296580c" value="${formPageb3b00ad970894885bd60a59ca296580c}"/>
		<input type="hidden" name="formId" id="formId1" value='b3b00ad970894885bd60a59ca296580c'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b3b00ad970894885bd60a59ca296580c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb3b00ad970894885bd60a59ca296580c" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb3b00ad970894885bd60a59ca296580c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb3b00ad970894885bd60a59ca296580c">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="b3b00ad970894885bd60a59ca296580c" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b3b00ad970894885bd60a59ca296580c" onclick="_selectAjaxTableAllData(this,'b3b00ad970894885bd60a59ca296580c')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="WORK_TYPE" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_ID" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CUSTOMER_ID" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WORK_TIME" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WORK_HOURS" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WORK_EXTRA_HOURS" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="STAFF_NAME" formId="b3b00ad970894885bd60a59ca296580c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb3b00ad970894885bd60a59ca296580c" onscroll="ajaxTableScroll(this,'b3b00ad970894885bd60a59ca296580c')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb3b00ad970894885bd60a59ca296580c">
		<tbody id="tbody_b3b00ad970894885bd60a59ca296580c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb3b00ad970894885bd60a59ca296580c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b3b00ad970894885bd60a59ca296580c&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="2a99975fe4dc46d58874659938857d89" />
		<bu:script viewId="2a99975fe4dc46d58874659938857d89" />
    <script type="text/javascript">
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
        var url = "${path}buss/bussModel_listMsData.ms";
        var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
        if(isPage(formId)){
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
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
    
    <%--判断是否分页--%>
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){    
           return true;
        }
        return false;
    }
    
    <%--查询--%>
    function query(thisObj){
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }
    
    <%--清空表格--%>
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
   <%--当出现滚动条时动态设置表格宽度 --%>
   function setTableWidth(formId){
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

    
    function alertInfo(msg){
        utilsFp.alert(msg);
    }
    
    <%--清空全选 --%>
    function clearAllSelect(){
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
    function reloadPg(msg,title,width,height,time){
        msgPop(msg,"",title,width,height,time);
    }
    
    <%--子列表 --%>
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
    <%-- 数据为空时设置横向滚动条 --%>
    function setCrossWiseScroll(formId,arrHtml){
        if(arrHtml.length==0){
            var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
            arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth+"px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'");
            $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
       }else{
            $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});    
       }
   }
    
    <%-- 初始化子分页 --%>
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
    
    
    <%-- 初始化分页插件 --%>
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
    
    <%-- 判断是否首次异步访问 --%>
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }
    
    <%-- 初始化子表单 --%>
    function getFormIdInitChildPage(){
        var tableCount = $("#tableCount").val();
        for ( var i = 2; i <= tableCount; i++) {
            var formId = $("#formId"+i).val();
            if(isPage(formId)){
               initChildPage(formId);
            }
        }
    }
    
    <%-- 初始化表格宽度 --%>
    function initTableWidth(){
        var width = $(window).width() - 2;
        $(".datagrid-htable,.datagrid-btable").width(width);
    }
    
    
    
    function init(){
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
        initTableWidth();
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
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='b3b00ad970894885bd60a59ca296580c'){<%--工时报备--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WORK_TYPE')+"' style='"+ms.tdStyle(formId, 'WORK_TYPE')+"' "+ms.tdEvent(formId, 'WORK_TYPE')+">")
            arrHtml.push("<span colno='WORK_TYPE' class='"+ms.uiClass(formId, 'WORK_TYPE')+"' style='"+ms.uiStyle(formId, 'WORK_TYPE')+"' "+ms.uiEvent(formId, 'WORK_TYPE')+" >"+v['WORK_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">")
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" >"+v['PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUSTOMER_ID' class='datagrid-cell "+ms.tdClass(formId, 'CUSTOMER_ID')+"' style='"+ms.tdStyle(formId, 'CUSTOMER_ID')+"' "+ms.tdEvent(formId, 'CUSTOMER_ID')+">")
            arrHtml.push("<span colno='CUSTOMER_ID' class='"+ms.uiClass(formId, 'CUSTOMER_ID')+"' style='"+ms.uiStyle(formId, 'CUSTOMER_ID')+"' "+ms.uiEvent(formId, 'CUSTOMER_ID')+" >"+v['CUSTOMER_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WORK_TIME')+"' style='"+ms.tdStyle(formId, 'WORK_TIME')+"' "+ms.tdEvent(formId, 'WORK_TIME')+">")
            arrHtml.push("<span colno='WORK_TIME' class='"+ms.uiClass(formId, 'WORK_TIME')+"' style='"+ms.uiStyle(formId, 'WORK_TIME')+"' "+ms.uiEvent(formId, 'WORK_TIME')+" >"+v['WORK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_HOURS' class='datagrid-cell "+ms.tdClass(formId, 'WORK_HOURS')+"' style='"+ms.tdStyle(formId, 'WORK_HOURS')+"' "+ms.tdEvent(formId, 'WORK_HOURS')+">")
            arrHtml.push("<span colno='WORK_HOURS' class='"+ms.uiClass(formId, 'WORK_HOURS')+"' style='"+ms.uiStyle(formId, 'WORK_HOURS')+"' "+ms.uiEvent(formId, 'WORK_HOURS')+" >"+v['WORK_HOURS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_EXTRA_HOURS' class='datagrid-cell "+ms.tdClass(formId, 'WORK_EXTRA_HOURS')+"' style='"+ms.tdStyle(formId, 'WORK_EXTRA_HOURS')+"' "+ms.tdEvent(formId, 'WORK_EXTRA_HOURS')+">")
            arrHtml.push("<span colno='WORK_EXTRA_HOURS' class='"+ms.uiClass(formId, 'WORK_EXTRA_HOURS')+"' style='"+ms.uiStyle(formId, 'WORK_EXTRA_HOURS')+"' "+ms.uiEvent(formId, 'WORK_EXTRA_HOURS')+" >"+v['WORK_EXTRA_HOURS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='STAFF_NAME' class='datagrid-cell "+ms.tdClass(formId, 'STAFF_NAME')+"' style='"+ms.tdStyle(formId, 'STAFF_NAME')+"' "+ms.tdEvent(formId, 'STAFF_NAME')+">")
            arrHtml.push("<span colno='STAFF_NAME' class='"+ms.uiClass(formId, 'STAFF_NAME')+"' style='"+ms.uiStyle(formId, 'STAFF_NAME')+"' "+ms.uiEvent(formId, 'STAFF_NAME')+" >"+v['STAFF_NAME']+"</span>")
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
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
