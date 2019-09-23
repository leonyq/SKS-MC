<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="条码规则" />
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
		<bu:header formId ="05b39a22c63b4544be3294a59d5dd767"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="85806e0f4e2349a882db89e353a239ce" />
            </div>
            <div class="bd" >
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="85806e0f4e2349a882db89e353a239ce" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage05b39a22c63b4544be3294a59d5dd767" id="formPage05b39a22c63b4544be3294a59d5dd767" value="${formPage05b39a22c63b4544be3294a59d5dd767}"/>
		<input type="hidden" name="formId" id="formId1" value='05b39a22c63b4544be3294a59d5dd767'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="05b39a22c63b4544be3294a59d5dd767">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax05b39a22c63b4544be3294a59d5dd767" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner05b39a22c63b4544be3294a59d5dd767">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable05b39a22c63b4544be3294a59d5dd767"  style="min-width:1110px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="05b39a22c63b4544be3294a59d5dd767" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_05b39a22c63b4544be3294a59d5dd767" onclick="_selectAjaxTableAllData(this,'05b39a22c63b4544be3294a59d5dd767')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width: 200px;"><bu:uitn colNo="DATA_AUTH" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 140px;"><bu:uitn colNo="TBR_NAME" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 90px;"><bu:uitn colNo="TBR_ANALYTIC_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			
			<td class="datagrid-cell" style="width: 70px;"><bu:uitn colNo="TBR_DEFAULT" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 90px;"><bu:uitn colNo="TBR_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 80px;"><bu:uitn colNo="CREATE_USER" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 140px;"><bu:uitn colNo="CREATE_TIME" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 140px;"><bu:uitn colNo="EDIT_TIME" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 200px;"><bu:uitn colNo="TBR_MEMO" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv05b39a22c63b4544be3294a59d5dd767" onscroll="ajaxTableScroll(this,'05b39a22c63b4544be3294a59d5dd767')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax05b39a22c63b4544be3294a59d5dd767"  style="min-width:1110px;">
		<tbody id="tbody_05b39a22c63b4544be3294a59d5dd767" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage05b39a22c63b4544be3294a59d5dd767==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=05b39a22c63b4544be3294a59d5dd767&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="85806e0f4e2349a882db89e353a239ce" />
		<bu:script viewId="85806e0f4e2349a882db89e353a239ce" />
    <script type="text/javascript">
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
var isFirstSetScroll=0;
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='05b39a22c63b4544be3294a59d5dd767'){<%--条码规则--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"'>"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />  ")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='TBR_NAME' class='datagrid-cell "+ms.tdClass(formId, 'TBR_NAME')+"' style='width:140px;"+ms.tdStyle(formId, 'TBR_NAME')+"' "+ms.tdEvent(formId, 'TBR_NAME')+">")
            arrHtml.push("<span colno='TBR_NAME' class='"+ms.uiClass(formId, 'TBR_NAME')+"' style='"+ms.uiStyle(formId, 'TBR_NAME')+"' "+ms.uiEvent(formId, 'TBR_NAME')+" title='"+ms.titleAttr(formId,'TBR_NAME','IS_TITLE_ATTR',v)+"'>"+v['TBR_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TBR_ANALYTIC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TBR_ANALYTIC_TYPE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'TBR_ANALYTIC_TYPE')+"' "+ms.tdEvent(formId, 'TBR_ANALYTIC_TYPE')+">")
            arrHtml.push("<span colno='TBR_ANALYTIC_TYPE' class='"+ms.uiClass(formId, 'TBR_ANALYTIC_TYPE')+"' style='"+ms.uiStyle(formId, 'TBR_ANALYTIC_TYPE')+"' "+ms.uiEvent(formId, 'TBR_ANALYTIC_TYPE')+" title='"+ms.titleAttr(formId,'TBR_ANALYTIC_TYPE','IS_TITLE_ATTR',v)+"'>"+v['TBR_ANALYTIC_TYPE']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='TBR_DEFAULT' class='datagrid-cell "+ms.tdClass(formId, 'TBR_DEFAULT')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'TBR_DEFAULT')+"' "+ms.tdEvent(formId, 'TBR_DEFAULT')+">")
            arrHtml.push("<span colno='TBR_DEFAULT' class='"+ms.uiClass(formId, 'TBR_DEFAULT')+"' style='"+ms.uiStyle(formId, 'TBR_DEFAULT')+"' "+ms.uiEvent(formId, 'TBR_DEFAULT')+" title='"+ms.titleAttr(formId,'TBR_DEFAULT','IS_TITLE_ATTR',v)+"'>"+v['TBR_DEFAULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TBR_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TBR_TYPE')+"' style='width:90px;"+ms.tdStyle(formId, 'TBR_TYPE')+"' "+ms.tdEvent(formId, 'TBR_TYPE')+">")
            arrHtml.push("<span colno='TBR_TYPE' class='"+ms.uiClass(formId, 'TBR_TYPE')+"' style='"+ms.uiStyle(formId, 'TBR_TYPE')+"' "+ms.uiEvent(formId, 'TBR_TYPE')+" title='"+ms.titleAttr(formId,'TBR_TYPE','IS_TITLE_ATTR',v)+"'>"+v['TBR_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"'>"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
            arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"'>"+v['EDIT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TBR_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'TBR_MEMO')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'TBR_MEMO')+"' "+ms.tdEvent(formId, 'TBR_MEMO')+">")
            arrHtml.push("<span colno='TBR_MEMO' class='"+ms.uiClass(formId, 'TBR_MEMO')+"' style='"+ms.uiStyle(formId, 'TBR_MEMO')+"' "+ms.uiEvent(formId, 'TBR_MEMO')+" title='"+ms.titleAttr(formId,'TBR_MEMO','IS_TITLE_ATTR',v)+"' >"+v['TBR_MEMO']+"</span>")
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
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
