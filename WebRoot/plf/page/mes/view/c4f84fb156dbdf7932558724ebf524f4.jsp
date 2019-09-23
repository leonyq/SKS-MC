<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="VM-制具-列表" />
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
		<bu:header formId ="c3a183e393ea4dfabb15712f9dba1873"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="5624fca2e39c49f7bea95e1614c232da" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="5624fca2e39c49f7bea95e1614c232da" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPagec3a183e393ea4dfabb15712f9dba1873" id="formPagec3a183e393ea4dfabb15712f9dba1873" value="${formPagec3a183e393ea4dfabb15712f9dba1873}"/>
		<input type="hidden" name="formId" id="formId1" value='c3a183e393ea4dfabb15712f9dba1873'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="c3a183e393ea4dfabb15712f9dba1873">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc3a183e393ea4dfabb15712f9dba1873" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc3a183e393ea4dfabb15712f9dba1873">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec3a183e393ea4dfabb15712f9dba1873" style="min-width: 1565px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c3a183e393ea4dfabb15712f9dba1873" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c3a183e393ea4dfabb15712f9dba1873" onclick="_selectAjaxTableAllData(this,'c3a183e393ea4dfabb15712f9dba1873')" style="cursor: pointer;"title="全选"/></span></td>
			
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_FIX_STATUS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_MT_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_MT_VAULE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_MT_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_INSTOCK_TIME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFI_INSTOCK_MAN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			
			
		<!--	<td class="datagrid-cell"><bu:uitn colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_NOW_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_MT_DATE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_MT_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			
			<td class="datagrid-cell"><bu:uitn colNo="CFI_CLCLE_UNIT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			
			<td class="datagrid-cell"><bu:uitn colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_WH_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			
			
			<td class="datagrid-cell"><bu:uitn colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CFI_SUPPLIER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			
			
			
			
			<td class="datagrid-cell"><bu:uitn colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			
			-->
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivc3a183e393ea4dfabb15712f9dba1873" onscroll="ajaxTableScroll(this,'c3a183e393ea4dfabb15712f9dba1873')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajaxc3a183e393ea4dfabb15712f9dba1873">
		<tbody id="tbody_c3a183e393ea4dfabb15712f9dba1873" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec3a183e393ea4dfabb15712f9dba1873==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=c3a183e393ea4dfabb15712f9dba1873&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="5624fca2e39c49f7bea95e1614c232da" />
		<bu:script viewId="5624fca2e39c49f7bea95e1614c232da" />
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
    
    // 判断是否分页
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){    
           return true;
        }
        return false;
    }
    
    // 查询
    function query(thisObj){
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }
    
    // 清空表格
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
    // 当出现滚动条时动态设置表格宽度
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
    // 数据为空时设置横向滚动条
    function setCrossWiseScroll(formId,arrHtml){
        if(arrHtml.length==0){
            var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
            var tableHeight =
            arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth+"px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'");
            $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
       }else{
            $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});	
       }
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
    if(formId=='c3a183e393ea4dfabb15712f9dba1873'){<%--FM-制具信息--%>
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
                arrHtml.push("<td colno='CFI_INSTOCK_DOC' class='datagrid-cell "+ms.tdClass(formId, 'CFI_INSTOCK_DOC')+"' style='"+ms.tdStyle(formId, 'CFI_INSTOCK_DOC')+"' "+ms.tdEvent(formId, 'CFI_INSTOCK_DOC')+">")
                arrHtml.push("<span colno='CFI_INSTOCK_DOC' class='"+ms.uiClass(formId, 'CFI_INSTOCK_DOC')+"' style='"+ms.uiStyle(formId, 'CFI_INSTOCK_DOC')+"' "+ms.uiEvent(formId, 'CFI_INSTOCK_DOC')+" >"+v['CFI_INSTOCK_DOC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ROHS_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ROHS_FLAG')+"' style='"+ms.tdStyle(formId, 'CFI_ROHS_FLAG')+"' "+ms.tdEvent(formId, 'CFI_ROHS_FLAG')+">")
                arrHtml.push("<span colno='CFI_ROHS_FLAG' class='"+ms.uiClass(formId, 'CFI_ROHS_FLAG')+"' style='"+ms.uiStyle(formId, 'CFI_ROHS_FLAG')+"' "+ms.uiEvent(formId, 'CFI_ROHS_FLAG')+" >"+v['CFI_ROHS_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_MAX_USAGE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MAX_USAGE')+"' style='"+ms.tdStyle(formId, 'CFI_MAX_USAGE')+"' "+ms.tdEvent(formId, 'CFI_MAX_USAGE')+">")
                arrHtml.push("<span colno='CFI_MAX_USAGE' class='"+ms.uiClass(formId, 'CFI_MAX_USAGE')+"' style='"+ms.uiStyle(formId, 'CFI_MAX_USAGE')+"' "+ms.uiEvent(formId, 'CFI_MAX_USAGE')+" >"+v['CFI_MAX_USAGE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_NOW_USAGE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_NOW_USAGE')+"' style='"+ms.tdStyle(formId, 'CFI_NOW_USAGE')+"' "+ms.tdEvent(formId, 'CFI_NOW_USAGE')+">")
                arrHtml.push("<span colno='CFI_NOW_USAGE' class='"+ms.uiClass(formId, 'CFI_NOW_USAGE')+"' style='"+ms.uiStyle(formId, 'CFI_NOW_USAGE')+"' "+ms.uiEvent(formId, 'CFI_NOW_USAGE')+" >"+v['CFI_NOW_USAGE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_TOTAL_USAGE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_TOTAL_USAGE')+"' style='"+ms.tdStyle(formId, 'CFI_TOTAL_USAGE')+"' "+ms.tdEvent(formId, 'CFI_TOTAL_USAGE')+">")
                arrHtml.push("<span colno='CFI_TOTAL_USAGE' class='"+ms.uiClass(formId, 'CFI_TOTAL_USAGE')+"' style='"+ms.uiStyle(formId, 'CFI_TOTAL_USAGE')+"' "+ms.uiEvent(formId, 'CFI_TOTAL_USAGE')+" >"+v['CFI_TOTAL_USAGE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_MT_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MT_DATE')+"' style='"+ms.tdStyle(formId, 'CFI_MT_DATE')+"' "+ms.tdEvent(formId, 'CFI_MT_DATE')+">")
                arrHtml.push("<span colno='CFI_MT_DATE' class='"+ms.uiClass(formId, 'CFI_MT_DATE')+"' style='"+ms.uiStyle(formId, 'CFI_MT_DATE')+"' "+ms.uiEvent(formId, 'CFI_MT_DATE')+" >"+v['CFI_MT_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ADDWAY' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ADDWAY')+"' style='"+ms.tdStyle(formId, 'CFI_ADDWAY')+"' "+ms.tdEvent(formId, 'CFI_ADDWAY')+">")
                arrHtml.push("<span colno='CFI_ADDWAY' class='"+ms.uiClass(formId, 'CFI_ADDWAY')+"' style='"+ms.uiStyle(formId, 'CFI_ADDWAY')+"' "+ms.uiEvent(formId, 'CFI_ADDWAY')+" >"+v['CFI_ADDWAY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_MT_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MT_CYCLE')+"' style='"+ms.tdStyle(formId, 'CFI_MT_CYCLE')+"' "+ms.tdEvent(formId, 'CFI_MT_CYCLE')+">")
                arrHtml.push("<span colno='CFI_MT_CYCLE' class='"+ms.uiClass(formId, 'CFI_MT_CYCLE')+"' style='"+ms.uiStyle(formId, 'CFI_MT_CYCLE')+"' "+ms.uiEvent(formId, 'CFI_MT_CYCLE')+" >"+v['CFI_MT_CYCLE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_MT_VAULE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MT_VAULE')+"' style='"+ms.tdStyle(formId, 'CFI_MT_VAULE')+"' "+ms.tdEvent(formId, 'CFI_MT_VAULE')+">")
                arrHtml.push("<span colno='CFI_MT_VAULE' class='"+ms.uiClass(formId, 'CFI_MT_VAULE')+"' style='"+ms.uiStyle(formId, 'CFI_MT_VAULE')+"' "+ms.uiEvent(formId, 'CFI_MT_VAULE')+" >"+v['CFI_MT_VAULE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_CLCLE_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'CFI_CLCLE_UNIT')+"' style='"+ms.tdStyle(formId, 'CFI_CLCLE_UNIT')+"' "+ms.tdEvent(formId, 'CFI_CLCLE_UNIT')+">")
                arrHtml.push("<span colno='CFI_CLCLE_UNIT' class='"+ms.uiClass(formId, 'CFI_CLCLE_UNIT')+"' style='"+ms.uiStyle(formId, 'CFI_CLCLE_UNIT')+"' "+ms.uiEvent(formId, 'CFI_CLCLE_UNIT')+" >"+v['CFI_CLCLE_UNIT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_MT_REMIND' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MT_REMIND')+"' style='"+ms.tdStyle(formId, 'CFI_MT_REMIND')+"' "+ms.tdEvent(formId, 'CFI_MT_REMIND')+">")
                arrHtml.push("<span colno='CFI_MT_REMIND' class='"+ms.uiClass(formId, 'CFI_MT_REMIND')+"' style='"+ms.uiStyle(formId, 'CFI_MT_REMIND')+"' "+ms.uiEvent(formId, 'CFI_MT_REMIND')+" >"+v['CFI_MT_REMIND']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_STOCK_SN' class='datagrid-cell "+ms.tdClass(formId, 'CFI_STOCK_SN')+"' style='"+ms.tdStyle(formId, 'CFI_STOCK_SN')+"' "+ms.tdEvent(formId, 'CFI_STOCK_SN')+">")
                arrHtml.push("<span colno='CFI_STOCK_SN' class='"+ms.uiClass(formId, 'CFI_STOCK_SN')+"' style='"+ms.uiStyle(formId, 'CFI_STOCK_SN')+"' "+ms.uiEvent(formId, 'CFI_STOCK_SN')+" >"+v['CFI_STOCK_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_WH_CODE')+"' style='"+ms.tdStyle(formId, 'CFI_WH_CODE')+"' "+ms.tdEvent(formId, 'CFI_WH_CODE')+">")
                arrHtml.push("<span colno='CFI_WH_CODE' class='"+ms.uiClass(formId, 'CFI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'CFI_WH_CODE')+"' "+ms.uiEvent(formId, 'CFI_WH_CODE')+" >"+v['CFI_WH_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_LEFT_TOP' class='datagrid-cell "+ms.tdClass(formId, 'CFI_LEFT_TOP')+"' style='"+ms.tdStyle(formId, 'CFI_LEFT_TOP')+"' "+ms.tdEvent(formId, 'CFI_LEFT_TOP')+">")
                arrHtml.push("<span colno='CFI_LEFT_TOP' class='"+ms.uiClass(formId, 'CFI_LEFT_TOP')+"' style='"+ms.uiStyle(formId, 'CFI_LEFT_TOP')+"' "+ms.uiEvent(formId, 'CFI_LEFT_TOP')+" >"+v['CFI_LEFT_TOP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_LEFT_LOWER' class='datagrid-cell "+ms.tdClass(formId, 'CFI_LEFT_LOWER')+"' style='"+ms.tdStyle(formId, 'CFI_LEFT_LOWER')+"' "+ms.tdEvent(formId, 'CFI_LEFT_LOWER')+">")
                arrHtml.push("<span colno='CFI_LEFT_LOWER' class='"+ms.uiClass(formId, 'CFI_LEFT_LOWER')+"' style='"+ms.uiStyle(formId, 'CFI_LEFT_LOWER')+"' "+ms.uiEvent(formId, 'CFI_LEFT_LOWER')+" >"+v['CFI_LEFT_LOWER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_RIGHT_TOP' class='datagrid-cell "+ms.tdClass(formId, 'CFI_RIGHT_TOP')+"' style='"+ms.tdStyle(formId, 'CFI_RIGHT_TOP')+"' "+ms.tdEvent(formId, 'CFI_RIGHT_TOP')+">")
                arrHtml.push("<span colno='CFI_RIGHT_TOP' class='"+ms.uiClass(formId, 'CFI_RIGHT_TOP')+"' style='"+ms.uiStyle(formId, 'CFI_RIGHT_TOP')+"' "+ms.uiEvent(formId, 'CFI_RIGHT_TOP')+" >"+v['CFI_RIGHT_TOP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_RIGHT_LOWER' class='datagrid-cell "+ms.tdClass(formId, 'CFI_RIGHT_LOWER')+"' style='"+ms.tdStyle(formId, 'CFI_RIGHT_LOWER')+"' "+ms.tdEvent(formId, 'CFI_RIGHT_LOWER')+">")
                arrHtml.push("<span colno='CFI_RIGHT_LOWER' class='"+ms.uiClass(formId, 'CFI_RIGHT_LOWER')+"' style='"+ms.uiStyle(formId, 'CFI_RIGHT_LOWER')+"' "+ms.uiEvent(formId, 'CFI_RIGHT_LOWER')+" >"+v['CFI_RIGHT_LOWER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MEMO')+"' style='"+ms.tdStyle(formId, 'CFI_MEMO')+"' "+ms.tdEvent(formId, 'CFI_MEMO')+">")
                arrHtml.push("<span colno='CFI_MEMO' class='"+ms.uiClass(formId, 'CFI_MEMO')+"' style='"+ms.uiStyle(formId, 'CFI_MEMO')+"' "+ms.uiEvent(formId, 'CFI_MEMO')+" >"+v['CFI_MEMO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'CFI_COUNT')+"' style='"+ms.tdStyle(formId, 'CFI_COUNT')+"' "+ms.tdEvent(formId, 'CFI_COUNT')+">")
                arrHtml.push("<span colno='CFI_COUNT' class='"+ms.uiClass(formId, 'CFI_COUNT')+"' style='"+ms.uiStyle(formId, 'CFI_COUNT')+"' "+ms.uiEvent(formId, 'CFI_COUNT')+" >"+v['CFI_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ASSISTANTTOOLNAME' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ASSISTANTTOOLNAME')+"' style='"+ms.tdStyle(formId, 'CFI_ASSISTANTTOOLNAME')+"' "+ms.tdEvent(formId, 'CFI_ASSISTANTTOOLNAME')+">")
                arrHtml.push("<span colno='CFI_ASSISTANTTOOLNAME' class='"+ms.uiClass(formId, 'CFI_ASSISTANTTOOLNAME')+"' style='"+ms.uiStyle(formId, 'CFI_ASSISTANTTOOLNAME')+"' "+ms.uiEvent(formId, 'CFI_ASSISTANTTOOLNAME')+" >"+v['CFI_ASSISTANTTOOLNAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ASSISTANTTOOLSPEC' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ASSISTANTTOOLSPEC')+"' style='"+ms.tdStyle(formId, 'CFI_ASSISTANTTOOLSPEC')+"' "+ms.tdEvent(formId, 'CFI_ASSISTANTTOOLSPEC')+">")
                arrHtml.push("<span colno='CFI_ASSISTANTTOOLSPEC' class='"+ms.uiClass(formId, 'CFI_ASSISTANTTOOLSPEC')+"' style='"+ms.uiStyle(formId, 'CFI_ASSISTANTTOOLSPEC')+"' "+ms.uiEvent(formId, 'CFI_ASSISTANTTOOLSPEC')+" >"+v['CFI_ASSISTANTTOOLSPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_MIDDLE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MIDDLE')+"' style='"+ms.tdStyle(formId, 'CFI_MIDDLE')+"' "+ms.tdEvent(formId, 'CFI_MIDDLE')+">")
                arrHtml.push("<span colno='CFI_MIDDLE' class='"+ms.uiClass(formId, 'CFI_MIDDLE')+"' style='"+ms.uiStyle(formId, 'CFI_MIDDLE')+"' "+ms.uiEvent(formId, 'CFI_MIDDLE')+" >"+v['CFI_MIDDLE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_SUPPLIER' class='datagrid-cell "+ms.tdClass(formId, 'CFI_SUPPLIER')+"' style='"+ms.tdStyle(formId, 'CFI_SUPPLIER')+"' "+ms.tdEvent(formId, 'CFI_SUPPLIER')+">")
                arrHtml.push("<span colno='CFI_SUPPLIER' class='"+ms.uiClass(formId, 'CFI_SUPPLIER')+"' style='"+ms.uiStyle(formId, 'CFI_SUPPLIER')+"' "+ms.uiEvent(formId, 'CFI_SUPPLIER')+" >"+v['CFI_SUPPLIER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'CFI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CFI_ITEM_CODE')+">")
                arrHtml.push("<span colno='CFI_ITEM_CODE' class='"+ms.uiClass(formId, 'CFI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CFI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CFI_ITEM_CODE')+" >"+v['CFI_ITEM_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_INSTOCK_MAN' class='datagrid-cell "+ms.tdClass(formId, 'CFI_INSTOCK_MAN')+"' style='"+ms.tdStyle(formId, 'CFI_INSTOCK_MAN')+"' "+ms.tdEvent(formId, 'CFI_INSTOCK_MAN')+">")
                arrHtml.push("<span colno='CFI_INSTOCK_MAN' class='"+ms.uiClass(formId, 'CFI_INSTOCK_MAN')+"' style='"+ms.uiStyle(formId, 'CFI_INSTOCK_MAN')+"' "+ms.uiEvent(formId, 'CFI_INSTOCK_MAN')+" >"+v['CFI_INSTOCK_MAN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_INSTOCK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CFI_INSTOCK_TIME')+"' style='"+ms.tdStyle(formId, 'CFI_INSTOCK_TIME')+"' "+ms.tdEvent(formId, 'CFI_INSTOCK_TIME')+">")
                arrHtml.push("<span colno='CFI_INSTOCK_TIME' class='"+ms.uiClass(formId, 'CFI_INSTOCK_TIME')+"' style='"+ms.uiStyle(formId, 'CFI_INSTOCK_TIME')+"' "+ms.uiEvent(formId, 'CFI_INSTOCK_TIME')+" >"+v['CFI_INSTOCK_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_FIX_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FIX_STATUS')+"' style='"+ms.tdStyle(formId, 'CFI_FIX_STATUS')+"' "+ms.tdEvent(formId, 'CFI_FIX_STATUS')+">")
                arrHtml.push("<span colno='CFI_FIX_STATUS' class='"+ms.uiClass(formId, 'CFI_FIX_STATUS')+"' style='"+ms.uiStyle(formId, 'CFI_FIX_STATUS')+"' "+ms.uiEvent(formId, 'CFI_FIX_STATUS')+" >"+v['CFI_FIX_STATUS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_SUPPLIER_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_SUPPLIER_CODE')+"' style='"+ms.tdStyle(formId, 'CFI_SUPPLIER_CODE')+"' "+ms.tdEvent(formId, 'CFI_SUPPLIER_CODE')+">")
                arrHtml.push("<span colno='CFI_SUPPLIER_CODE' class='"+ms.uiClass(formId, 'CFI_SUPPLIER_CODE')+"' style='"+ms.uiStyle(formId, 'CFI_SUPPLIER_CODE')+"' "+ms.uiEvent(formId, 'CFI_SUPPLIER_CODE')+" >"+v['CFI_SUPPLIER_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'CFI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CFI_ITEM_TYPE')+">")
                arrHtml.push("<span colno='CFI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CFI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CFI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CFI_ITEM_TYPE')+" >"+v['CFI_ITEM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_FIX_SN' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FIX_SN')+"' style='"+ms.tdStyle(formId, 'CFI_FIX_SN')+"' "+ms.tdEvent(formId, 'CFI_FIX_SN')+">")
                arrHtml.push("<span colno='CFI_FIX_SN' class='"+ms.uiClass(formId, 'CFI_FIX_SN')+"' style='"+ms.uiStyle(formId, 'CFI_FIX_SN')+"' "+ms.uiEvent(formId, 'CFI_FIX_SN')+" >"+v['CFI_FIX_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_MT_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MT_TYPE')+"' style='"+ms.tdStyle(formId, 'CFI_MT_TYPE')+"' "+ms.tdEvent(formId, 'CFI_MT_TYPE')+">")
                arrHtml.push("<span colno='CFI_MT_TYPE' class='"+ms.uiClass(formId, 'CFI_MT_TYPE')+"' style='"+ms.uiStyle(formId, 'CFI_MT_TYPE')+"' "+ms.uiEvent(formId, 'CFI_MT_TYPE')+" >"+v['CFI_MT_TYPE']+"</span>")
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
