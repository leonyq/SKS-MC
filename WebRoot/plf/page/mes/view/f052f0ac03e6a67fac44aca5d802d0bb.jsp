<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="异步-工艺信息" />
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
		<bu:header formId ="9ce89b8198274a25b7219ad226eda21e"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="883135130ace48bc9db3a1e91f57913b" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="883135130ace48bc9db3a1e91f57913b" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage9ce89b8198274a25b7219ad226eda21e" id="formPage9ce89b8198274a25b7219ad226eda21e" value="${formPage9ce89b8198274a25b7219ad226eda21e}"/>
		<input type="hidden" name="formId" id="formId1" value='9ce89b8198274a25b7219ad226eda21e'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9ce89b8198274a25b7219ad226eda21e">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9ce89b8198274a25b7219ad226eda21e" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9ce89b8198274a25b7219ad226eda21e">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9ce89b8198274a25b7219ad226eda21e" style="min-width:1130px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9ce89b8198274a25b7219ad226eda21e" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9ce89b8198274a25b7219ad226eda21e" onclick="_selectAjaxTableAllData(this,'9ce89b8198274a25b7219ad226eda21e')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CT_PROCESS_PRIOR" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CT_CREATE_EMP" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9ce89b8198274a25b7219ad226eda21e" onscroll="ajaxTableScroll(this,'9ce89b8198274a25b7219ad226eda21e')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e" style="min-width:1110px;">
		<tbody id="tbody_9ce89b8198274a25b7219ad226eda21e" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9ce89b8198274a25b7219ad226eda21e==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9ce89b8198274a25b7219ad226eda21e&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="883135130ace48bc9db3a1e91f57913b" />
		<bu:script viewId="883135130ace48bc9db3a1e91f57913b" />
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
                console.log(msg);
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
    if(formId=='9ce89b8198274a25b7219ad226eda21e'){<%--工艺信息--%>
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
                arrHtml.push("<td colno='CT_ID' class='datagrid-cell "+ms.tdClass(formId, 'CT_ID')+"' style='width:110px;"+ms.tdStyle(formId, 'CT_ID')+"' "+ms.tdEvent(formId, 'CT_ID')+">")
                arrHtml.push("<span colno='CT_ID' class='"+ms.uiClass(formId, 'CT_ID')+"' style='"+ms.uiStyle(formId, 'CT_ID')+"' "+ms.uiEvent(formId, 'CT_ID')+" >"+v['CT_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CT_NAME')+"' style='width:110px;"+ms.tdStyle(formId, 'CT_NAME')+"' "+ms.tdEvent(formId, 'CT_NAME')+">")
                arrHtml.push("<span colno='CT_NAME' class='"+ms.uiClass(formId, 'CT_NAME')+"' style='"+ms.uiStyle(formId, 'CT_NAME')+"' "+ms.uiEvent(formId, 'CT_NAME')+" >"+v['CT_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CT_PRODUCT_STEP')+"' style='width:90px;"+ms.tdStyle(formId, 'CT_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CT_PRODUCT_STEP')+">")
                arrHtml.push("<span colno='CT_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CT_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CT_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CT_PRODUCT_STEP')+" >"+v['CT_PRODUCT_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CT_PROCESS_FACE')+"' style='width:90px;"+ms.tdStyle(formId, 'CT_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CT_PROCESS_FACE')+">")
                arrHtml.push("<span colno='CT_PROCESS_FACE' class='"+ms.uiClass(formId, 'CT_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CT_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CT_PROCESS_FACE')+" >"+v['CT_PROCESS_FACE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_ROUTE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CT_ROUTE_CODE')+"' style='width:110px;"+ms.tdStyle(formId, 'CT_ROUTE_CODE')+"' "+ms.tdEvent(formId, 'CT_ROUTE_CODE')+">")
                arrHtml.push("<span colno='CT_ROUTE_CODE' class='"+ms.uiClass(formId, 'CT_ROUTE_CODE')+"' style='"+ms.uiStyle(formId, 'CT_ROUTE_CODE')+"' "+ms.uiEvent(formId, 'CT_ROUTE_CODE')+" >"+v['CT_ROUTE_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_PREPOSE_TECH' class='datagrid-cell "+ms.tdClass(formId, 'CT_PREPOSE_TECH')+"' style='width:110px;"+ms.tdStyle(formId, 'CT_PREPOSE_TECH')+"' "+ms.tdEvent(formId, 'CT_PREPOSE_TECH')+">")
                arrHtml.push("<span colno='CT_PREPOSE_TECH' class='"+ms.uiClass(formId, 'CT_PREPOSE_TECH')+"' style='"+ms.uiStyle(formId, 'CT_PREPOSE_TECH')+"' "+ms.uiEvent(formId, 'CT_PREPOSE_TECH')+" >"+v['CT_PREPOSE_TECH']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_PROCESS_PRIOR' class='datagrid-cell "+ms.tdClass(formId, 'CT_PROCESS_PRIOR')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CT_PROCESS_PRIOR')+"' "+ms.tdEvent(formId, 'CT_PROCESS_PRIOR')+">")
                arrHtml.push("<span colno='CT_PROCESS_PRIOR' class='"+ms.uiClass(formId, 'CT_PROCESS_PRIOR')+"' style='"+ms.uiStyle(formId, 'CT_PROCESS_PRIOR')+"' "+ms.uiEvent(formId, 'CT_PROCESS_PRIOR')+" >"+v['CT_PROCESS_PRIOR']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CT_DEFAULT_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CT_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'CT_DEFAULT_FLAG')+">")
                arrHtml.push("<span colno='CT_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'CT_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'CT_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'CT_DEFAULT_FLAG')+" >"+v['CT_DEFAULT_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CT_VALID_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CT_VALID_FLAG')+"' "+ms.tdEvent(formId, 'CT_VALID_FLAG')+">")
                arrHtml.push("<span colno='CT_VALID_FLAG' class='"+ms.uiClass(formId, 'CT_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'CT_VALID_FLAG')+"' "+ms.uiEvent(formId, 'CT_VALID_FLAG')+" >"+v['CT_VALID_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_CREATE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CT_CREATE_EMP')+"' style='width:90px;"+ms.tdStyle(formId, 'CT_CREATE_EMP')+"' "+ms.tdEvent(formId, 'CT_CREATE_EMP')+">")
                arrHtml.push("<span colno='CT_CREATE_EMP' class='"+ms.uiClass(formId, 'CT_CREATE_EMP')+"' style='"+ms.uiStyle(formId, 'CT_CREATE_EMP')+"' "+ms.uiEvent(formId, 'CT_CREATE_EMP')+" >"+v['CT_CREATE_EMP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
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
