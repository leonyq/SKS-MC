<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="设备信息" />
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
		<bu:header formId ="99338dfb95df4eec8d5714a4e773b127"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="574da5a0885547d58d4ea2db64af2158" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="574da5a0885547d58d4ea2db64af2158" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage99338dfb95df4eec8d5714a4e773b127" id="formPage99338dfb95df4eec8d5714a4e773b127" value="${formPage99338dfb95df4eec8d5714a4e773b127}"/>
		<input type="hidden" name="formId" id="formId1" value='99338dfb95df4eec8d5714a4e773b127'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='2eca2d7cb432432787511b896b69ac55'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='79b9927d25ac45349b521bb480966fbe'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="99338dfb95df4eec8d5714a4e773b127">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax99338dfb95df4eec8d5714a4e773b127">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner99338dfb95df4eec8d5714a4e773b127">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable99338dfb95df4eec8d5714a4e773b127" style="min-width:1400px">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="99338dfb95df4eec8d5714a4e773b127" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_99338dfb95df4eec8d5714a4e773b127" onclick="_selectAjaxTableAllData(this,'99338dfb95df4eec8d5714a4e773b127')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CD_DEVICE_NAME" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CD_STATUS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CD_VALID_FLAG" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CD_PRODECT_DATE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CD_BUY_DATE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CD_SUPPLIER_ID" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv99338dfb95df4eec8d5714a4e773b127" onscroll="ajaxTableScroll(this,'99338dfb95df4eec8d5714a4e773b127')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax99338dfb95df4eec8d5714a4e773b127" style="min-width:1380px">
		<tbody id="tbody_99338dfb95df4eec8d5714a4e773b127" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage99338dfb95df4eec8d5714a4e773b127==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=99338dfb95df4eec8d5714a4e773b127&showLoading=0" />
			</div>
		</c:if>
		</div>

		
		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="574da5a0885547d58d4ea2db64af2158" />
		<bu:script viewId="574da5a0885547d58d4ea2db64af2158" />
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
    
    // 当出现滚动条时动态设置表格宽度
    function setTableWidth(formId){
        var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
        var height = $("#tableDiv"+formId).height();
        if(scrollHeight-height>0){
          $("#datagrid-htable"+formId).css("width",$("#datagrid-view-ajax"+formId+" .datagrid-header").width()-20+'px');
          $("#datagrid-btable-ajax"+formId).css("width",$("#datagrid-view-ajax"+formId+" .datagrid-header").width()-20+'px');
        }else{
          $("#datagrid-htable"+formId).css("width",$("#datagrid-view-ajax"+formId+" .datagrid-header").width()+'px');
          $("#datagrid-btable-ajax"+formId).css("width",$("#datagrid-view-ajax"+formId+" .datagrid-header").width()+'px');    
        }
    }
    
    function alertInfo(msg){
        utilsFp.alert(msg);
    }
    
    // 清空全选
    function clearAllSelect(){
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
    function reloadPg(msg,title,width,height,time){
        msgPop(msg,reloadPgExe,title,width,height,time);
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
    if(formId=='99338dfb95df4eec8d5714a4e773b127'){<%--设备信息--%>
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
                arrHtml.push("<td colno='CD_DEVICE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_TYPE')+"' style='width:130px;"+ms.tdStyle(formId, 'CD_DEVICE_TYPE')+"' "+ms.tdEvent(formId, 'CD_DEVICE_TYPE')+">")
                arrHtml.push("<span colno='CD_DEVICE_TYPE' class='"+ms.uiClass(formId, 'CD_DEVICE_TYPE')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_TYPE')+"' "+ms.uiEvent(formId, 'CD_DEVICE_TYPE')+" >"+v['CD_DEVICE_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_SN')+"' style='width:130px;"+ms.tdStyle(formId, 'CD_DEVICE_SN')+"' "+ms.tdEvent(formId, 'CD_DEVICE_SN')+">")
                arrHtml.push("<span colno='CD_DEVICE_SN' class='"+ms.uiClass(formId, 'CD_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_SN')+"' "+ms.uiEvent(formId, 'CD_DEVICE_SN')+" >"+v['CD_DEVICE_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_NAME')+"' style='width:130px;"+ms.tdStyle(formId, 'CD_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'CD_DEVICE_NAME')+">")
                arrHtml.push("<span colno='CD_DEVICE_NAME' class='"+ms.uiClass(formId, 'CD_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'CD_DEVICE_NAME')+" >"+v['CD_DEVICE_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CD_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CD_STATUS')+"' "+ms.tdEvent(formId, 'CD_STATUS')+">")
                arrHtml.push("<span colno='CD_STATUS' class='"+ms.uiClass(formId, 'CD_STATUS')+"' style='"+ms.uiStyle(formId, 'CD_STATUS')+"' "+ms.uiEvent(formId, 'CD_STATUS')+" >"+v['CD_STATUS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CD_VALID_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CD_VALID_FLAG')+"' "+ms.tdEvent(formId, 'CD_VALID_FLAG')+">")
                arrHtml.push("<span colno='CD_VALID_FLAG' class='"+ms.uiClass(formId, 'CD_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'CD_VALID_FLAG')+"' "+ms.uiEvent(formId, 'CD_VALID_FLAG')+" >"+v['CD_VALID_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_DEVICE_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_CLASS')+"' style='width:110px;"+ms.tdStyle(formId, 'CD_DEVICE_CLASS')+"' "+ms.tdEvent(formId, 'CD_DEVICE_CLASS')+">")
                arrHtml.push("<span colno='CD_DEVICE_CLASS' class='"+ms.uiClass(formId, 'CD_DEVICE_CLASS')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_CLASS')+"' "+ms.uiEvent(formId, 'CD_DEVICE_CLASS')+" >"+v['CD_DEVICE_CLASS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_PRODECT_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CD_PRODECT_DATE')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'CD_PRODECT_DATE')+"' "+ms.tdEvent(formId, 'CD_PRODECT_DATE')+">")
                arrHtml.push("<span colno='CD_PRODECT_DATE' class='"+ms.uiClass(formId, 'CD_PRODECT_DATE')+"' style='"+ms.uiStyle(formId, 'CD_PRODECT_DATE')+"' "+ms.uiEvent(formId, 'CD_PRODECT_DATE')+" >"+v['CD_PRODECT_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_BUY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CD_BUY_DATE')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'CD_BUY_DATE')+"' "+ms.tdEvent(formId, 'CD_BUY_DATE')+">")
                arrHtml.push("<span colno='CD_BUY_DATE' class='"+ms.uiClass(formId, 'CD_BUY_DATE')+"' style='"+ms.uiStyle(formId, 'CD_BUY_DATE')+"' "+ms.uiEvent(formId, 'CD_BUY_DATE')+" >"+v['CD_BUY_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_USE_DEP' class='datagrid-cell "+ms.tdClass(formId, 'CD_USE_DEP')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'CD_USE_DEP')+"' "+ms.tdEvent(formId, 'CD_USE_DEP')+">")
                arrHtml.push("<span colno='CD_USE_DEP' class='"+ms.uiClass(formId, 'CD_USE_DEP')+"' style='"+ms.uiStyle(formId, 'CD_USE_DEP')+"' "+ms.uiEvent(formId, 'CD_USE_DEP')+" >"+v['CD_USE_DEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_CHARGE_MAN' class='datagrid-cell "+ms.tdClass(formId, 'CD_CHARGE_MAN')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CD_CHARGE_MAN')+"' "+ms.tdEvent(formId, 'CD_CHARGE_MAN')+">")
                arrHtml.push("<span colno='CD_CHARGE_MAN' class='"+ms.uiClass(formId, 'CD_CHARGE_MAN')+"' style='"+ms.uiStyle(formId, 'CD_CHARGE_MAN')+"' "+ms.uiEvent(formId, 'CD_CHARGE_MAN')+" >"+v['CD_CHARGE_MAN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CD_SUPPLIER_ID' class='datagrid-cell "+ms.tdClass(formId, 'CD_SUPPLIER_ID') +ms.tdStyle(formId, 'CD_SUPPLIER_ID')+"' "+ms.tdEvent(formId, 'CD_SUPPLIER_ID')+">")
                arrHtml.push("<span colno='CD_SUPPLIER_ID' class='"+ms.uiClass(formId, 'CD_SUPPLIER_ID')+"' style='"+ms.uiStyle(formId, 'CD_SUPPLIER_ID')+"' "+ms.uiEvent(formId, 'CD_SUPPLIER_ID')+" >"+v['CD_SUPPLIER_ID']+"</span>")
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
