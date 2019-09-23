<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="VM-设备维护信息" />
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
		<bu:header formId ="4b6c04e8e1384717a4be814862e502a1"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="3b171627545e4c53a27561c07fb322b7" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="3b171627545e4c53a27561c07fb322b7" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage4b6c04e8e1384717a4be814862e502a1" id="formPage4b6c04e8e1384717a4be814862e502a1" value="${formPage4b6c04e8e1384717a4be814862e502a1}"/>
		<input type="hidden" name="formId" id="formId1" value='4b6c04e8e1384717a4be814862e502a1'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4b6c04e8e1384717a4be814862e502a1">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4b6c04e8e1384717a4be814862e502a1" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4b6c04e8e1384717a4be814862e502a1">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4b6c04e8e1384717a4be814862e502a1" style="min-width:1600px">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4b6c04e8e1384717a4be814862e502a1" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4b6c04e8e1384717a4be814862e502a1" onclick="_selectAjaxTableAllData(this,'4b6c04e8e1384717a4be814862e502a1')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="B#CD_DEVICE_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="B#CD_DEVICE_SN" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="B#CD_DEVICE_NAME" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDM_ITEM_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="B#CD_DEVICE_CLASS" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CDM_ITEM_CODE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CDM_ITEM_NAME" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CDM_ITEM_CLASS" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CDM_ITEM_MAXVALUE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CDM_ITEM_MINVALUE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CDM_ITEM_REAL" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CDM_ITEM_UNIT" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDM_MT_EMP" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CDM_MT_TIME" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4b6c04e8e1384717a4be814862e502a1" onscroll="ajaxTableScroll(this,'4b6c04e8e1384717a4be814862e502a1')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4b6c04e8e1384717a4be814862e502a1" style="min-width:1600px">
		<tbody id="tbody_4b6c04e8e1384717a4be814862e502a1" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4b6c04e8e1384717a4be814862e502a1==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4b6c04e8e1384717a4be814862e502a1&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3b171627545e4c53a27561c07fb322b7" />
		<bu:script viewId="3b171627545e4c53a27561c07fb322b7" />
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
    
    function reloadPg(msg,title,width,height,time,isCloseWin){
    	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    }
    function reloadPgExe(isCloseWin){
     /* document.forms.search_form.submit();
     util.showTopLoading(); */
     query("formId1");
     if ("1" != isCloseWin) {
       top.$(".dialog-close").click();
     }
      checkboxAll("joblist");
    
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
    if(formId=='4b6c04e8e1384717a4be814862e502a1'){<%--FM-设备维护信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var deviceType=v['B#CD_DEVICE_TYPE'];
            var deviceSN=v['B#CD_DEVICE_SN'];
            var deviceName=v['B#CD_DEVICE_NAME'];
            var itemCode=v['CDM_ITEM_CODE'];
            var itemName=v['CDM_ITEM_NAME'];
            
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='B#CD_DEVICE_TYPE' title='"+deviceType+"' class='datagrid-cell "+ms.tdClass(formId, 'B#CD_DEVICE_TYPE')+"' style='width:130px;"+ms.tdStyle(formId, 'B#CD_DEVICE_TYPE')+"' "+ms.tdEvent(formId, 'B#CD_DEVICE_TYPE')+">")
            arrHtml.push("<span colno='B#CD_DEVICE_TYPE' class='"+ms.uiClass(formId, 'B#CD_DEVICE_TYPE')+"' style='"+ms.uiStyle(formId, 'B#CD_DEVICE_TYPE')+"' "+ms.uiEvent(formId, 'B#CD_DEVICE_TYPE')+" >"+v['B#CD_DEVICE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='B#CD_DEVICE_SN' title='"+deviceSN+"' class='datagrid-cell "+ms.tdClass(formId, 'B#CD_DEVICE_SN')+"' style=width:130px;'"+ms.tdStyle(formId, 'B#CD_DEVICE_SN')+"' "+ms.tdEvent(formId, 'B#CD_DEVICE_SN')+">")
            arrHtml.push("<span colno='B#CD_DEVICE_SN' class='"+ms.uiClass(formId, 'B#CD_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'B#CD_DEVICE_SN')+"' "+ms.uiEvent(formId, 'B#CD_DEVICE_SN')+" >"+v['B#CD_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='B#CD_DEVICE_NAME' title='"+deviceName+"' class='datagrid-cell "+ms.tdClass(formId, 'B#CD_DEVICE_NAME')+"' style='width:130px;"+ms.tdStyle(formId, 'B#CD_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'B#CD_DEVICE_NAME')+">")
            arrHtml.push("<span colno='B#CD_DEVICE_NAME' class='"+ms.uiClass(formId, 'B#CD_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'B#CD_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'B#CD_DEVICE_NAME')+" >"+v['B#CD_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CDM_ITEM_TYPE')+"' style='width:100px;text-align: center;"+ms.tdStyle(formId, 'CDM_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CDM_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CDM_ITEM_TYPE' class='"+ms.uiClass(formId, 'CDM_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CDM_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CDM_ITEM_TYPE')+" >"+v['CDM_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='B#CD_DEVICE_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'B#CD_DEVICE_CLASS')+"' style='width:130px;"+ms.tdStyle(formId, 'B#CD_DEVICE_CLASS')+"' "+ms.tdEvent(formId, 'B#CD_DEVICE_CLASS')+">")
            arrHtml.push("<span colno='B#CD_DEVICE_CLASS' class='"+ms.uiClass(formId, 'B#CD_DEVICE_CLASS')+"' style='"+ms.uiStyle(formId, 'B#CD_DEVICE_CLASS')+"' "+ms.uiEvent(formId, 'B#CD_DEVICE_CLASS')+" >"+v['B#CD_DEVICE_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_ITEM_CODE' title='"+itemCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CDM_ITEM_CODE')+"' style='width:130px;"+ms.tdStyle(formId, 'CDM_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CDM_ITEM_CODE')+">")
            arrHtml.push("<span colno='CDM_ITEM_CODE' class='"+ms.uiClass(formId, 'CDM_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CDM_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CDM_ITEM_CODE')+" >"+v['CDM_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_ITEM_NAME' title='"+itemName+"' class='datagrid-cell "+ms.tdClass(formId, 'CDM_ITEM_NAME')+"' style='width:130px;"+ms.tdStyle(formId, 'CDM_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CDM_ITEM_NAME')+">")
            arrHtml.push("<span colno='CDM_ITEM_NAME' class='"+ms.uiClass(formId, 'CDM_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CDM_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CDM_ITEM_NAME')+" >"+v['CDM_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_ITEM_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CDM_ITEM_CLASS')+"' style='width:80px;text-align: center;"+ms.tdStyle(formId, 'CDM_ITEM_CLASS')+"' "+ms.tdEvent(formId, 'CDM_ITEM_CLASS')+">")
            arrHtml.push("<span colno='CDM_ITEM_CLASS' class='"+ms.uiClass(formId, 'CDM_ITEM_CLASS')+"' style='"+ms.uiStyle(formId, 'CDM_ITEM_CLASS')+"' "+ms.uiEvent(formId, 'CDM_ITEM_CLASS')+" >"+v['CDM_ITEM_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_ITEM_MAXVALUE' class='datagrid-cell "+ms.tdClass(formId, 'CDM_ITEM_MAXVALUE')+"' style='width:70px;text-align: right;"+ms.tdStyle(formId, 'CDM_ITEM_MAXVALUE')+"' "+ms.tdEvent(formId, 'CDM_ITEM_MAXVALUE')+">")
            arrHtml.push("<span colno='CDM_ITEM_MAXVALUE' class='"+ms.uiClass(formId, 'CDM_ITEM_MAXVALUE')+"' style='"+ms.uiStyle(formId, 'CDM_ITEM_MAXVALUE')+"' "+ms.uiEvent(formId, 'CDM_ITEM_MAXVALUE')+" >"+v['CDM_ITEM_MAXVALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_ITEM_MINVALUE' class='datagrid-cell "+ms.tdClass(formId, 'CDM_ITEM_MINVALUE')+"' style='width:70px;text-align: right;"+ms.tdStyle(formId, 'CDM_ITEM_MINVALUE')+"' "+ms.tdEvent(formId, 'CDM_ITEM_MINVALUE')+">")
            arrHtml.push("<span colno='CDM_ITEM_MINVALUE' class='"+ms.uiClass(formId, 'CDM_ITEM_MINVALUE')+"' style='"+ms.uiStyle(formId, 'CDM_ITEM_MINVALUE')+"' "+ms.uiEvent(formId, 'CDM_ITEM_MINVALUE')+" >"+v['CDM_ITEM_MINVALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_ITEM_REAL' class='datagrid-cell "+ms.tdClass(formId, 'CDM_ITEM_REAL')+"' style='width:70px;text-align: right;"+ms.tdStyle(formId, 'CDM_ITEM_REAL')+"' "+ms.tdEvent(formId, 'CDM_ITEM_REAL')+">")
            arrHtml.push("<span colno='CDM_ITEM_REAL' class='"+ms.uiClass(formId, 'CDM_ITEM_REAL')+"' style='"+ms.uiStyle(formId, 'CDM_ITEM_REAL')+"' "+ms.uiEvent(formId, 'CDM_ITEM_REAL')+" >"+v['CDM_ITEM_REAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_ITEM_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'CDM_ITEM_UNIT')+"' style='width:70px;"+ms.tdStyle(formId, 'CDM_ITEM_UNIT')+"' "+ms.tdEvent(formId, 'CDM_ITEM_UNIT')+">")
            arrHtml.push("<span colno='CDM_ITEM_UNIT' class='"+ms.uiClass(formId, 'CDM_ITEM_UNIT')+"' style='"+ms.uiStyle(formId, 'CDM_ITEM_UNIT')+"' "+ms.uiEvent(formId, 'CDM_ITEM_UNIT')+" >"+v['CDM_ITEM_UNIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_MT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CDM_MT_EMP')+"' style='width:100px;text-align: center;"+ms.tdStyle(formId, 'CDM_MT_EMP')+"' "+ms.tdEvent(formId, 'CDM_MT_EMP')+">")
            arrHtml.push("<span colno='CDM_MT_EMP' class='"+ms.uiClass(formId, 'CDM_MT_EMP')+"' style='"+ms.uiStyle(formId, 'CDM_MT_EMP')+"' "+ms.uiEvent(formId, 'CDM_MT_EMP')+" >"+v['CDM_MT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_MT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDM_MT_TIME')+"' style='text-align: center;"+ms.tdStyle(formId, 'CDM_MT_TIME')+"' "+ms.tdEvent(formId, 'CDM_MT_TIME')+">")
            arrHtml.push("<span colno='CDM_MT_TIME' class='"+ms.uiClass(formId, 'CDM_MT_TIME')+"' style='"+ms.uiStyle(formId, 'CDM_MT_TIME')+"' "+ms.uiEvent(formId, 'CDM_MT_TIME')+" >"+v['CDM_MT_TIME']+"</span>")
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
