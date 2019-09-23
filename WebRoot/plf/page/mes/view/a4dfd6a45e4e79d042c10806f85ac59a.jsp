<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="VM-禁用物料-列表" />
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
		<bu:header formId ="09206fb514ca4b258beb531bc903334b"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="176de10501914dd4baa0730679545b2d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="176de10501914dd4baa0730679545b2d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage09206fb514ca4b258beb531bc903334b" id="formPage09206fb514ca4b258beb531bc903334b" value="${formPage09206fb514ca4b258beb531bc903334b}"/>
		<input type="hidden" name="formId" id="formId1" value='09206fb514ca4b258beb531bc903334b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="09206fb514ca4b258beb531bc903334b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax09206fb514ca4b258beb531bc903334b" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner09206fb514ca4b258beb531bc903334b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable09206fb514ca4b258beb531bc903334b" style="min-width:1120px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="09206fb514ca4b258beb531bc903334b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_09206fb514ca4b258beb531bc903334b" onclick="_selectAjaxTableAllData(this,'09206fb514ca4b258beb531bc903334b')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv09206fb514ca4b258beb531bc903334b" onscroll="ajaxTableScroll(this,'09206fb514ca4b258beb531bc903334b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax09206fb514ca4b258beb531bc903334b" style="min-width:1100px;">
		<tbody id="tbody_09206fb514ca4b258beb531bc903334b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage09206fb514ca4b258beb531bc903334b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=09206fb514ca4b258beb531bc903334b&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="176de10501914dd4baa0730679545b2d" />
		<bu:script viewId="176de10501914dd4baa0730679545b2d" />
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
        //util.showLoading("处理中...");
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
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='09206fb514ca4b258beb531bc903334b'){<%--禁用物料--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CF_TYPE')+"' style='width:90px;"+ms.tdStyle(formId, 'CF_TYPE')+"' "+ms.tdEvent(formId, 'CF_TYPE')+">")
            arrHtml.push("<span colno='CF_TYPE' class='"+ms.uiClass(formId, 'CF_TYPE')+"' style='"+ms.uiStyle(formId, 'CF_TYPE')+"' "+ms.uiEvent(formId, 'CF_TYPE')+" >"+v['CF_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'CF_PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'CF_PROJECT_ID')+"' "+ms.tdEvent(formId, 'CF_PROJECT_ID')+">")
            arrHtml.push("<span colno='CF_PROJECT_ID' class='"+ms.uiClass(formId, 'CF_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'CF_PROJECT_ID')+"' "+ms.uiEvent(formId, 'CF_PROJECT_ID')+" >"+v['CF_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CF_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CF_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CF_MODEL_CODE')+">")
            arrHtml.push("<span colno='CF_MODEL_CODE' class='"+ms.uiClass(formId, 'CF_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'CF_MODEL_CODE')+"' "+ms.uiEvent(formId, 'CF_MODEL_CODE')+" >"+v['CF_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CF_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CF_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CF_ITEM_CODE')+">")
            arrHtml.push("<span colno='CF_ITEM_CODE' class='"+ms.uiClass(formId, 'CF_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CF_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CF_ITEM_CODE')+" >"+v['CF_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CF_ITEM_NAME')+"' style='width:110px;"+ms.tdStyle(formId, 'CF_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CF_ITEM_NAME')+">")
            arrHtml.push("<span colno='CF_ITEM_NAME' class='"+ms.uiClass(formId, 'CF_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CF_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CF_ITEM_NAME')+" >"+v['CF_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_ITEM_DESC' class='datagrid-cell "+ms.tdClass(formId, 'CF_ITEM_DESC')+"' style='width:110px;"+ms.tdStyle(formId, 'CF_ITEM_DESC')+"' "+ms.tdEvent(formId, 'CF_ITEM_DESC')+">")
            arrHtml.push("<span colno='CF_ITEM_DESC' class='"+ms.uiClass(formId, 'CF_ITEM_DESC')+"' style='"+ms.uiStyle(formId, 'CF_ITEM_DESC')+"' "+ms.uiEvent(formId, 'CF_ITEM_DESC')+" >"+v['CF_ITEM_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CF_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CF_STATUS')+"' "+ms.tdEvent(formId, 'CF_STATUS')+">")
            arrHtml.push("<span colno='CF_STATUS' class='"+ms.uiClass(formId, 'CF_STATUS')+"' style='"+ms.uiStyle(formId, 'CF_STATUS')+"' "+ms.uiEvent(formId, 'CF_STATUS')+" >"+v['CF_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CF_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CF_MEMO')+"' style='"+ms.tdStyle(formId, 'CF_MEMO')+"' "+ms.tdEvent(formId, 'CF_MEMO')+">")
            arrHtml.push("<span colno='CF_MEMO' class='"+ms.uiClass(formId, 'CF_MEMO')+"' style='"+ms.uiStyle(formId, 'CF_MEMO')+"' "+ms.uiEvent(formId, 'CF_MEMO')+" >"+v['CF_MEMO']+"</span>")
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
