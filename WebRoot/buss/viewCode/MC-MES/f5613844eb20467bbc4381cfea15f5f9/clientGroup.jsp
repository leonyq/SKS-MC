<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="VM-客户组-列表" />
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
		<bu:header formId ="31d0426b962d4a3cb90ede1e278a7fbd"/>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="334a12e791724034bbfe6a184cc97529" />
            </div>
            <div class="bd" style="height:500px;">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       
		<bu:search viewId="334a12e791724034bbfe6a184cc97529" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   
		<input type="hidden" name="formPage31d0426b962d4a3cb90ede1e278a7fbd" id="formPage31d0426b962d4a3cb90ede1e278a7fbd" value="${formPage31d0426b962d4a3cb90ede1e278a7fbd}"/>
		<input type="hidden" name="formId" id="formId1" value='31d0426b962d4a3cb90ede1e278a7fbd'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="31d0426b962d4a3cb90ede1e278a7fbd">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax31d0426b962d4a3cb90ede1e278a7fbd" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner31d0426b962d4a3cb90ede1e278a7fbd">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable31d0426b962d4a3cb90ede1e278a7fbd">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="31d0426b962d4a3cb90ede1e278a7fbd" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_31d0426b962d4a3cb90ede1e278a7fbd" onclick="_selectAjaxTableAllData(this,'31d0426b962d4a3cb90ede1e278a7fbd')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="CG_NAME" formId="31d0426b962d4a3cb90ede1e278a7fbd" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BARCODE_RULE" formId="31d0426b962d4a3cb90ede1e278a7fbd" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BARCODE_MODEL" formId="31d0426b962d4a3cb90ede1e278a7fbd" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BOM_MODEL" formId="31d0426b962d4a3cb90ede1e278a7fbd" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CHANGE_FLAG" formId="31d0426b962d4a3cb90ede1e278a7fbd" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv31d0426b962d4a3cb90ede1e278a7fbd" onscroll="ajaxTableScroll(this,'31d0426b962d4a3cb90ede1e278a7fbd')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax31d0426b962d4a3cb90ede1e278a7fbd">
		<tbody id="tbody_31d0426b962d4a3cb90ede1e278a7fbd" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage31d0426b962d4a3cb90ede1e278a7fbd==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=31d0426b962d4a3cb90ede1e278a7fbd&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="334a12e791724034bbfe6a184cc97529" />
		<bu:script viewId="334a12e791724034bbfe6a184cc97529" />
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
        
	$('.panel-ajax').css('height',$(window).height() -124 + 'px')

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
    if(formId=='31d0426b962d4a3cb90ede1e278a7fbd'){<%--客户组--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CG_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CG_NAME')+"' style='"+ms.tdStyle(formId, 'CG_NAME')+"' "+ms.tdEvent(formId, 'CG_NAME')+">")
            arrHtml.push("<span colno='CG_NAME' class='"+ms.uiClass(formId, 'CG_NAME')+"' style='"+ms.uiStyle(formId, 'CG_NAME')+"' "+ms.uiEvent(formId, 'CG_NAME')+" >"+v['CG_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BARCODE_RULE' class='datagrid-cell "+ms.tdClass(formId, 'BARCODE_RULE')+"' style='"+ms.tdStyle(formId, 'BARCODE_RULE')+"' "+ms.tdEvent(formId, 'BARCODE_RULE')+">")
            arrHtml.push("<span colno='BARCODE_RULE' class='"+ms.uiClass(formId, 'BARCODE_RULE')+"' style='"+ms.uiStyle(formId, 'BARCODE_RULE')+"' "+ms.uiEvent(formId, 'BARCODE_RULE')+" >"+v['BARCODE_RULE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BARCODE_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'BARCODE_MODEL')+"' style='"+ms.tdStyle(formId, 'BARCODE_MODEL')+"' "+ms.tdEvent(formId, 'BARCODE_MODEL')+">")
            arrHtml.push("<span colno='BARCODE_MODEL' class='"+ms.uiClass(formId, 'BARCODE_MODEL')+"' style='"+ms.uiStyle(formId, 'BARCODE_MODEL')+"' "+ms.uiEvent(formId, 'BARCODE_MODEL')+" >"+v['BARCODE_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BOM_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'BOM_MODEL')+"' style='"+ms.tdStyle(formId, 'BOM_MODEL')+"' "+ms.tdEvent(formId, 'BOM_MODEL')+">")
            arrHtml.push("<span colno='BOM_MODEL' class='"+ms.uiClass(formId, 'BOM_MODEL')+"' style='"+ms.uiStyle(formId, 'BOM_MODEL')+"' "+ms.uiEvent(formId, 'BOM_MODEL')+" >"+v['BOM_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CHANGE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CHANGE_FLAG')+"' style='"+ms.tdStyle(formId, 'CHANGE_FLAG')+"' "+ms.tdEvent(formId, 'CHANGE_FLAG')+">")
            arrHtml.push("<span colno='CHANGE_FLAG' class='"+ms.uiClass(formId, 'CHANGE_FLAG')+"' style='"+ms.uiStyle(formId, 'CHANGE_FLAG')+"' "+ms.uiEvent(formId, 'CHANGE_FLAG')+" >"+v['CHANGE_FLAG']+"</span>")
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
    setPopScroll('.datagrid-body')
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
