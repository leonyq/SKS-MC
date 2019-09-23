<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>    
    <title>
		<dict:lang value="容器信息" />
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
		<bu:header formId ="279c5856e1534dd0a77caf1eda21aec8"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="176ef453e033492080bd682ea4321a1d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="176ef453e033492080bd682ea4321a1d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage279c5856e1534dd0a77caf1eda21aec8" id="formPage279c5856e1534dd0a77caf1eda21aec8" value="${formPage279c5856e1534dd0a77caf1eda21aec8}"/>
		<input type="hidden" name="formId" id="formId1" value='279c5856e1534dd0a77caf1eda21aec8'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="279c5856e1534dd0a77caf1eda21aec8">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax279c5856e1534dd0a77caf1eda21aec8" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner279c5856e1534dd0a77caf1eda21aec8">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable279c5856e1534dd0a77caf1eda21aec8" style="min-width:1180px">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="279c5856e1534dd0a77caf1eda21aec8" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_279c5856e1534dd0a77caf1eda21aec8" onclick="_selectAjaxTableAllData(this,'279c5856e1534dd0a77caf1eda21aec8')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CONTAINER_SN" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CONTAINER_TYPE" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="ENABLE_FLAG" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CONTAINER_CAPACITY" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CONTAINER_SPEC" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="STATE_FLAG" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="MO_NUMBER" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="AREA_ID" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="EDIT_TIME" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDIT_USER" formId="279c5856e1534dd0a77caf1eda21aec8" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv279c5856e1534dd0a77caf1eda21aec8" onscroll="ajaxTableScroll(this,'279c5856e1534dd0a77caf1eda21aec8')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax279c5856e1534dd0a77caf1eda21aec8" style="min-width:1160px">
		<tbody id="tbody_279c5856e1534dd0a77caf1eda21aec8" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage279c5856e1534dd0a77caf1eda21aec8==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=279c5856e1534dd0a77caf1eda21aec8&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="176ef453e033492080bd682ea4321a1d" />
		<bu:script viewId="176ef453e033492080bd682ea4321a1d" />
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
    
    function reloadPgExe(){
	document.forms.searchForm.submit();
	util.showTopLoading();
	top.$(".dialog-close").click();
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
    if(formId=='279c5856e1534dd0a77caf1eda21aec8'){<%--容器信息--%>
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
                arrHtml.push("<td colno='CONTAINER_SN' class='datagrid-cell "+ms.tdClass(formId, 'CONTAINER_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CONTAINER_SN')+"' "+ms.tdEvent(formId, 'CONTAINER_SN')+">")
                arrHtml.push("<span colno='CONTAINER_SN' class='"+ms.uiClass(formId, 'CONTAINER_SN')+"' style='"+ms.uiStyle(formId, 'CONTAINER_SN')+"' "+ms.uiEvent(formId, 'CONTAINER_SN')+" >"+v['CONTAINER_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CONTAINER_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CONTAINER_TYPE')+"' style='width:90px;"+ms.tdStyle(formId, 'CONTAINER_TYPE')+"' "+ms.tdEvent(formId, 'CONTAINER_TYPE')+">")
                arrHtml.push("<span colno='CONTAINER_TYPE' class='"+ms.uiClass(formId, 'CONTAINER_TYPE')+"' style='"+ms.uiStyle(formId, 'CONTAINER_TYPE')+"' "+ms.uiEvent(formId, 'CONTAINER_TYPE')+" >"+v['CONTAINER_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ENABLE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'ENABLE_FLAG')+"' style='width:70px;"+ms.tdStyle(formId, 'ENABLE_FLAG')+"' "+ms.tdEvent(formId, 'ENABLE_FLAG')+">")
                arrHtml.push("<span colno='ENABLE_FLAG' class='"+ms.uiClass(formId, 'ENABLE_FLAG')+"' style='"+ms.uiStyle(formId, 'ENABLE_FLAG')+"' "+ms.uiEvent(formId, 'ENABLE_FLAG')+" >"+v['ENABLE_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CONTAINER_CAPACITY' class='datagrid-cell "+ms.tdClass(formId, 'CONTAINER_CAPACITY')+"' style='width:70px;"+ms.tdStyle(formId, 'CONTAINER_CAPACITY')+"' "+ms.tdEvent(formId, 'CONTAINER_CAPACITY')+">")
                arrHtml.push("<span colno='CONTAINER_CAPACITY' class='"+ms.uiClass(formId, 'CONTAINER_CAPACITY')+"' style='"+ms.uiStyle(formId, 'CONTAINER_CAPACITY')+"' "+ms.uiEvent(formId, 'CONTAINER_CAPACITY')+" >"+v['CONTAINER_CAPACITY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CONTAINER_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CONTAINER_SPEC')+"' style='width:70px;"+ms.tdStyle(formId, 'CONTAINER_SPEC')+"' "+ms.tdEvent(formId, 'CONTAINER_SPEC')+">")
                arrHtml.push("<span colno='CONTAINER_SPEC' class='"+ms.uiClass(formId, 'CONTAINER_SPEC')+"' style='"+ms.uiStyle(formId, 'CONTAINER_SPEC')+"' "+ms.uiEvent(formId, 'CONTAINER_SPEC')+" >"+v['CONTAINER_SPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='STATE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'STATE_FLAG')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'STATE_FLAG')+"' "+ms.tdEvent(formId, 'STATE_FLAG')+">")
                arrHtml.push("<span colno='STATE_FLAG' class='"+ms.uiClass(formId, 'STATE_FLAG')+"' style='"+ms.uiStyle(formId, 'STATE_FLAG')+"' "+ms.uiEvent(formId, 'STATE_FLAG')+" >"+v['STATE_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
                arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'MO_NUMBER')+"' "+ms.uiEvent(formId, 'MO_NUMBER')+" >"+v['MO_NUMBER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='AREA_ID' class='datagrid-cell "+ms.tdClass(formId, 'AREA_ID')+"' style='width:110px;"+ms.tdStyle(formId, 'AREA_ID')+"' "+ms.tdEvent(formId, 'AREA_ID')+">")
                arrHtml.push("<span colno='AREA_ID' class='"+ms.uiClass(formId, 'AREA_ID')+"' style='"+ms.uiStyle(formId, 'AREA_ID')+"' "+ms.uiEvent(formId, 'AREA_ID')+" >"+v['AREA_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='width:150px;"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
                arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" >"+v['EDIT_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_USER')+"' style='"+ms.tdStyle(formId, 'EDIT_USER')+"' "+ms.tdEvent(formId, 'EDIT_USER')+">")
                arrHtml.push("<span colno='EDIT_USER' class='"+ms.uiClass(formId, 'EDIT_USER')+"' style='"+ms.uiStyle(formId, 'EDIT_USER')+"' "+ms.uiEvent(formId, 'EDIT_USER')+" >"+v['EDIT_USER']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
