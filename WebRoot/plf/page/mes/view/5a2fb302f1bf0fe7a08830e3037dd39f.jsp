<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="客户档案" />
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
		<bu:header formId ="4d5275f6a24f44119737918a3136a935"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="8e626a877f5146cc805c32066d5300f5" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="8e626a877f5146cc805c32066d5300f5" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage4d5275f6a24f44119737918a3136a935" id="formPage4d5275f6a24f44119737918a3136a935" value="${formPage4d5275f6a24f44119737918a3136a935}"/>
		<input type="hidden" name="formId" id="formId1" value='4d5275f6a24f44119737918a3136a935'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4d5275f6a24f44119737918a3136a935">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4d5275f6a24f44119737918a3136a935" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4d5275f6a24f44119737918a3136a935">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4d5275f6a24f44119737918a3136a935" style="min-width:1070px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4d5275f6a24f44119737918a3136a935" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4d5275f6a24f44119737918a3136a935" onclick="_selectAjaxTableAllData(this,'4d5275f6a24f44119737918a3136a935')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CUST_CODE" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CUSTOMER" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="STATUS" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CUST_ABBREVIATION" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CUST_BOM" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CUST_GROUP" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CUSTOMER_GRADE" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MEMO" formId="4d5275f6a24f44119737918a3136a935" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4d5275f6a24f44119737918a3136a935" onscroll="ajaxTableScroll(this,'4d5275f6a24f44119737918a3136a935')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4d5275f6a24f44119737918a3136a935" style="min-width:1050px;">
		<tbody id="tbody_4d5275f6a24f44119737918a3136a935" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4d5275f6a24f44119737918a3136a935==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4d5275f6a24f44119737918a3136a935&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="8e626a877f5146cc805c32066d5300f5" />
		<bu:script viewId="8e626a877f5146cc805c32066d5300f5" />
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
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='4d5275f6a24f44119737918a3136a935'){<%--客户档案--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CUST_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CUST_CODE')+"' "+ms.tdEvent(formId, 'CUST_CODE')+">")
            arrHtml.push("<span colno='CUST_CODE' class='"+ms.uiClass(formId, 'CUST_CODE')+"' style='"+ms.uiStyle(formId, 'CUST_CODE')+"' "+ms.uiEvent(formId, 'CUST_CODE')+" >"+v['CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUSTOMER' class='datagrid-cell "+ms.tdClass(formId, 'CUSTOMER')+"' style='width:150px;"+ms.tdStyle(formId, 'CUSTOMER')+"' "+ms.tdEvent(formId, 'CUSTOMER')+">")
            arrHtml.push("<span colno='CUSTOMER' class='"+ms.uiClass(formId, 'CUSTOMER')+"' style='"+ms.uiStyle(formId, 'CUSTOMER')+"' "+ms.uiEvent(formId, 'CUSTOMER')+" >"+v['CUSTOMER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='STATUS' class='datagrid-cell "+ms.tdClass(formId, 'STATUS')+"' style='width:70px;"+ms.tdStyle(formId, 'STATUS')+"' "+ms.tdEvent(formId, 'STATUS')+">")
            arrHtml.push("<span colno='STATUS' class='"+ms.uiClass(formId, 'STATUS')+"' style='"+ms.uiStyle(formId, 'STATUS')+"' "+ms.uiEvent(formId, 'STATUS')+" >"+v['STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUST_ABBREVIATION' class='datagrid-cell "+ms.tdClass(formId, 'CUST_ABBREVIATION')+"' style='width:110px;"+ms.tdStyle(formId, 'CUST_ABBREVIATION')+"' "+ms.tdEvent(formId, 'CUST_ABBREVIATION')+">")
            arrHtml.push("<span colno='CUST_ABBREVIATION' class='"+ms.uiClass(formId, 'CUST_ABBREVIATION')+"' style='"+ms.uiStyle(formId, 'CUST_ABBREVIATION')+"' "+ms.uiEvent(formId, 'CUST_ABBREVIATION')+" >"+v['CUST_ABBREVIATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUST_BOM' class='datagrid-cell "+ms.tdClass(formId, 'CUST_BOM')+"' style='width:110px;"+ms.tdStyle(formId, 'CUST_BOM')+"' "+ms.tdEvent(formId, 'CUST_BOM')+">")
            arrHtml.push("<span colno='CUST_BOM' class='"+ms.uiClass(formId, 'CUST_BOM')+"' style='"+ms.uiStyle(formId, 'CUST_BOM')+"' "+ms.uiEvent(formId, 'CUST_BOM')+" >"+v['CUST_BOM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUST_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'CUST_GROUP')+"' style='width:110px;"+ms.tdStyle(formId, 'CUST_GROUP')+"' "+ms.tdEvent(formId, 'CUST_GROUP')+">")
            arrHtml.push("<span colno='CUST_GROUP' class='"+ms.uiClass(formId, 'CUST_GROUP')+"' style='"+ms.uiStyle(formId, 'CUST_GROUP')+"' "+ms.uiEvent(formId, 'CUST_GROUP')+" >"+v['CUST_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUSTOMER_GRADE' class='datagrid-cell "+ms.tdClass(formId, 'CUSTOMER_GRADE')+"' style='width:90px;"+ms.tdStyle(formId, 'CUSTOMER_GRADE')+"' "+ms.tdEvent(formId, 'CUSTOMER_GRADE')+">")
            arrHtml.push("<span colno='CUSTOMER_GRADE' class='"+ms.uiClass(formId, 'CUSTOMER_GRADE')+"' style='"+ms.uiStyle(formId, 'CUSTOMER_GRADE')+"' "+ms.uiEvent(formId, 'CUSTOMER_GRADE')+" >"+v['CUSTOMER_GRADE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MEMO' class='datagrid-cell "+ms.tdClass(formId, 'MEMO')+"' style='"+ms.tdStyle(formId, 'MEMO')+"' "+ms.tdEvent(formId, 'MEMO')+">")
            arrHtml.push("<span colno='MEMO' class='"+ms.uiClass(formId, 'MEMO')+"' style='"+ms.uiStyle(formId, 'MEMO')+"' "+ms.uiEvent(formId, 'MEMO')+" >"+v['MEMO']+"</span>")
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
    
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
