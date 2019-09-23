<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="VM-工艺物料管控" />
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
		<bu:header formId ="99c3f63c8b62498589698545e9de3b18"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="5f0fd7ce5693490fb4d1822fd285f47e" />
            </div>
            <div class="bd" id="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="5f0fd7ce5693490fb4d1822fd285f47e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage99c3f63c8b62498589698545e9de3b18" id="formPage99c3f63c8b62498589698545e9de3b18" value="${formPage99c3f63c8b62498589698545e9de3b18}"/>
		<input type="hidden" name="formId" id="formId1" value='99c3f63c8b62498589698545e9de3b18'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="99c3f63c8b62498589698545e9de3b18">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax99c3f63c8b62498589698545e9de3b18" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner99c3f63c8b62498589698545e9de3b18">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable99c3f63c8b62498589698545e9de3b18" style="min-width:1660px">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="99c3f63c8b62498589698545e9de3b18" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_99c3f63c8b62498589698545e9de3b18" onclick="_selectAjaxTableAllData(this,'99c3f63c8b62498589698545e9de3b18')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CTI_MODEL_NAME" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CTI_MODEL_SPET" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_ITEM_NAME" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_ITEM_SPEC" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CREATE_USER" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="99c3f63c8b62498589698545e9de3b18" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv99c3f63c8b62498589698545e9de3b18" onscroll="ajaxTableScroll(this,'99c3f63c8b62498589698545e9de3b18')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax99c3f63c8b62498589698545e9de3b18"  style="min-width:1640px">
		<tbody id="tbody_99c3f63c8b62498589698545e9de3b18" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage99c3f63c8b62498589698545e9de3b18==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=99c3f63c8b62498589698545e9de3b18&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="5f0fd7ce5693490fb4d1822fd285f47e" />
		<bu:script viewId="5f0fd7ce5693490fb4d1822fd285f47e" />
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
    if(formId=='99c3f63c8b62498589698545e9de3b18'){<%--工艺物料管控--%>
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
                arrHtml.push("<td colno='CTI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_MODEL_CODE')+"' style='width:110px;"+ms.tdStyle(formId, 'CTI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CTI_MODEL_CODE')+">")
                arrHtml.push("<span colno='CTI_MODEL_CODE' class='"+ms.uiClass(formId, 'CTI_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'CTI_MODEL_CODE')+"' "+ms.uiEvent(formId, 'CTI_MODEL_CODE')+" >"+v['CTI_MODEL_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CTI_MODEL_NAME')+"' style='width:110px;"+ms.tdStyle(formId, 'CTI_MODEL_NAME')+"' "+ms.tdEvent(formId, 'CTI_MODEL_NAME')+">")
                arrHtml.push("<span colno='CTI_MODEL_NAME' class='"+ms.uiClass(formId, 'CTI_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'CTI_MODEL_NAME')+"' "+ms.uiEvent(formId, 'CTI_MODEL_NAME')+" >"+v['CTI_MODEL_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_MODEL_SPET' class='datagrid-cell "+ms.tdClass(formId, 'CTI_MODEL_SPET')+"' style='width:110px;"+ms.tdStyle(formId, 'CTI_MODEL_SPET')+"' "+ms.tdEvent(formId, 'CTI_MODEL_SPET')+">")
                arrHtml.push("<span colno='CTI_MODEL_SPET' class='"+ms.uiClass(formId, 'CTI_MODEL_SPET')+"' style='"+ms.uiStyle(formId, 'CTI_MODEL_SPET')+"' "+ms.uiEvent(formId, 'CTI_MODEL_SPET')+" >"+v['CTI_MODEL_SPET']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CTI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CTI_ITEM_TYPE')+">")
                arrHtml.push("<span colno='CTI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CTI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CTI_ITEM_TYPE')+" >"+v['CTI_ITEM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CTI_ITEM_CODE')+">")
                arrHtml.push("<span colno='CTI_ITEM_CODE' class='"+ms.uiClass(formId, 'CTI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CTI_ITEM_CODE')+" >"+v['CTI_ITEM_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CTI_ITEM_NAME')+">")
                arrHtml.push("<span colno='CTI_ITEM_NAME' class='"+ms.uiClass(formId, 'CTI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CTI_ITEM_NAME')+" >"+v['CTI_ITEM_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CTI_ITEM_SPEC')+">")
                arrHtml.push("<span colno='CTI_ITEM_SPEC' class='"+ms.uiClass(formId, 'CTI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CTI_ITEM_SPEC')+" >"+v['CTI_ITEM_SPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CTI_PRODUCT_STEP')+"' style='width:90px;"+ms.tdStyle(formId, 'CTI_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CTI_PRODUCT_STEP')+">")
                arrHtml.push("<span colno='CTI_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CTI_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CTI_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CTI_PRODUCT_STEP')+" >"+v['CTI_PRODUCT_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'CTI_GROUP')+"' style='width:110px;"+ms.tdStyle(formId, 'CTI_GROUP')+"' "+ms.tdEvent(formId, 'CTI_GROUP')+">")
                arrHtml.push("<span colno='CTI_GROUP' class='"+ms.uiClass(formId, 'CTI_GROUP')+"' style='"+ms.uiStyle(formId, 'CTI_GROUP')+"' "+ms.uiEvent(formId, 'CTI_GROUP')+" >"+v['CTI_GROUP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ASSB_QTY' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ASSB_QTY')+"' style='width:70px;"+ms.tdStyle(formId, 'CTI_ASSB_QTY')+"' "+ms.tdEvent(formId, 'CTI_ASSB_QTY')+">")
                arrHtml.push("<span colno='CTI_ASSB_QTY' class='"+ms.uiClass(formId, 'CTI_ASSB_QTY')+"' style='"+ms.uiStyle(formId, 'CTI_ASSB_QTY')+"' "+ms.uiEvent(formId, 'CTI_ASSB_QTY')+" >"+v['CTI_ASSB_QTY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_CONTROL_MODE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_CONTROL_MODE')+"' style='width:70px;"+ms.tdStyle(formId, 'CTI_CONTROL_MODE')+"' "+ms.tdEvent(formId, 'CTI_CONTROL_MODE')+">")
                arrHtml.push("<span colno='CTI_CONTROL_MODE' class='"+ms.uiClass(formId, 'CTI_CONTROL_MODE')+"' style='"+ms.uiStyle(formId, 'CTI_CONTROL_MODE')+"' "+ms.uiEvent(formId, 'CTI_CONTROL_MODE')+" >"+v['CTI_CONTROL_MODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_SOURCE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_SOURCE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_SOURCE')+"' "+ms.tdEvent(formId, 'CTI_ITEM_SOURCE')+">")
                arrHtml.push("<span colno='CTI_ITEM_SOURCE' class='"+ms.uiClass(formId, 'CTI_ITEM_SOURCE')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_SOURCE')+"' "+ms.uiEvent(formId, 'CTI_ITEM_SOURCE')+" >"+v['CTI_ITEM_SOURCE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:90px;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
                arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" >"+v['CREATE_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
                arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" >"+v['CREATE_TIME']+"</span>")
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
