<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VM-辅料信息-列表" />
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
		<bu:header formId ="6c64c25e45214328b6adbec0abc8f34f"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="f8de3c8160954ee7a90cacbd34498720" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="f8de3c8160954ee7a90cacbd34498720" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6c64c25e45214328b6adbec0abc8f34f" id="formPage6c64c25e45214328b6adbec0abc8f34f" value="${formPage6c64c25e45214328b6adbec0abc8f34f}"/>
		<input type="hidden" name="formId" id="formId1" value='6c64c25e45214328b6adbec0abc8f34f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='639181149fc2483f8d42c7da2656cb0e,798167734dcc45dba6f9df1f4fc4a884,5552b344309244d7811d832216537f33'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='62aabb92147842e1983bcfcda04f9a1d,536730f0f221402c8ddc9bb284b26acc,776a9d93290b4cef813dc66f100cbe1e'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6c64c25e45214328b6adbec0abc8f34f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6c64c25e45214328b6adbec0abc8f34f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6c64c25e45214328b6adbec0abc8f34f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6c64c25e45214328b6adbec0abc8f34f" style="min-width:2000px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6c64c25e45214328b6adbec0abc8f34f" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6c64c25e45214328b6adbec0abc8f34f" onclick="_selectAjaxTableAllData(this,'6c64c25e45214328b6adbec0abc8f34f')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px"><bu:uitn colNo="DATA_AUTH" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:210px"><bu:uitn colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:120px"><bu:uitn colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:100px"><bu:uitn colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:100px"><bu:uitn colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:180px"><bu:uitn colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:140px"><bu:uitn colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:140px"><bu:uitn colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:140px"><bu:uitn colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="CTI_THAWING_MAX_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="CTI_MIX_MAX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6c64c25e45214328b6adbec0abc8f34f" onscroll="ajaxTableScroll(this,'6c64c25e45214328b6adbec0abc8f34f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6c64c25e45214328b6adbec0abc8f34f" style="min-width:2000px;">
		<tbody id="tbody_6c64c25e45214328b6adbec0abc8f34f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6c64c25e45214328b6adbec0abc8f34f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6c64c25e45214328b6adbec0abc8f34f&showLoading=0" />
			</div>
		</c:if>
		</div>

		
		<input type="hidden" id="relColVals" name="relColVals" value='ID,ID,ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
        </jsp:include>
		<bu:submit viewId="f8de3c8160954ee7a90cacbd34498720" />
		<bu:script viewId="f8de3c8160954ee7a90cacbd34498720" />
    <script>
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CTI_TIN_SN,CTI_TIN_STATUS\"}";
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CTI_TIN_SN,CTI_TIN_STATUS\"}";
        var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
        console.log(searchParams);
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
           // data: {
          //  "searchParams" : searchParams
		  //  "page.currentPage" : _GLO_FORM_PAGE_MAP[formId].currentPage,		
          //  "page.pageRecord" : _GLO_FORM_PAGE_MAP[formId].pageRecord
          //  },
            data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            //searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
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
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG+"77777","","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg+"1","","260","145");
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
    if ("0" == isCloseWin || undefined == isCloseWin) {
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
                utilsFp.confirmIcon(3,"","","", msg+"2","","260","145");
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
        //alert($("#formId1").val());
        var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#CTI_TIN_SN").val(jumpId);
                  
                  }    
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
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    //console.log(trEvent);
    if(formId=='6c64c25e45214328b6adbec0abc8f34f'){<%--FM-辅料信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit' >"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'  >");

            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
           // arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("</td>");
           // arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
           // arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
          //  arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_TIN_SN' class='datagrid-cell "+ms.tdClass(formId, 'CTI_TIN_SN')+"' style='width:210px;"+ms.tdStyle(formId, 'CTI_TIN_SN')+"' "+ms.tdEvent(formId, 'CTI_TIN_SN')+">")
            arrHtml.push("<span colno='CTI_TIN_SN' class='"+ms.uiClass(formId, 'CTI_TIN_SN')+"' onclick='itemJump1(\""+v['CTI_TIN_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTI_TIN_SN')+" title='"+ms.titleAttr(formId,'CTI_TIN_SN','IS_TITLE_ATTR',v)+"' >"+v['CTI_TIN_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_TIN_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CTI_TIN_STATUS')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CTI_TIN_STATUS')+"' "+ms.tdEvent(formId, 'CTI_TIN_STATUS')+">")
            arrHtml.push("<span colno='CTI_TIN_STATUS' class='"+ms.uiClass(formId, 'CTI_TIN_STATUS')+"' style='"+ms.uiStyle(formId, 'CTI_TIN_STATUS')+"' "+ms.uiEvent(formId, 'CTI_TIN_STATUS')+" title='"+ms.titleAttr(formId,'CTI_TIN_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CTI_TIN_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].CTI_TIN_STATUS+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CTI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CTI_ITEM_TYPE')+">")
            if(v['CTI_ITEM_TYPE']==0){
            arrHtml.push("<span colno='CTI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CTI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CTI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CTI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >锡膏</span>")    
            }else if(v['CTI_ITEM_TYPE']==1){
            arrHtml.push("<span colno='CTI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CTI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CTI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CTI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >胶水</span>")     
            }
            
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CTI_ITEM_CODE')+">")
            arrHtml.push("<span colno='CTI_ITEM_CODE' class='"+ms.uiClass(formId, 'CTI_ITEM_CODE')+"' onclick='itemJump2(\""+v['CTI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CTI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CTI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_ASSISTANTTOOLNAME' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ASSISTANTTOOLNAME')+"' style='width:120px;"+ms.tdStyle(formId, 'CTI_ASSISTANTTOOLNAME')+"' "+ms.tdEvent(formId, 'CTI_ASSISTANTTOOLNAME')+">")
            arrHtml.push("<span colno='CTI_ASSISTANTTOOLNAME' class='"+ms.uiClass(formId, 'CTI_ASSISTANTTOOLNAME')+"' style='"+ms.uiStyle(formId, 'CTI_ASSISTANTTOOLNAME')+"' "+ms.uiEvent(formId, 'CTI_ASSISTANTTOOLNAME')+" title='"+ms.titleAttr(formId,'CTI_ASSISTANTTOOLNAME','IS_TITLE_ATTR',v)+"' >"+v['CTI_ASSISTANTTOOLNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_ASSISTANTTOOLSPEC' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ASSISTANTTOOLSPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ASSISTANTTOOLSPEC')+"' "+ms.tdEvent(formId, 'CTI_ASSISTANTTOOLSPEC')+">")
            arrHtml.push("<span colno='CTI_ASSISTANTTOOLSPEC' class='"+ms.uiClass(formId, 'CTI_ASSISTANTTOOLSPEC')+"' style='"+ms.uiStyle(formId, 'CTI_ASSISTANTTOOLSPEC')+"' "+ms.uiEvent(formId, 'CTI_ASSISTANTTOOLSPEC')+" title='"+ms.titleAttr(formId,'CTI_ASSISTANTTOOLSPEC','IS_TITLE_ATTR',v)+"' >"+v['CTI_ASSISTANTTOOLSPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_LOT' class='datagrid-cell "+ms.tdClass(formId, 'CTI_LOT')+"' style='width:100px;"+ms.tdStyle(formId, 'CTI_LOT')+"' "+ms.tdEvent(formId, 'CTI_LOT')+">")
            arrHtml.push("<span colno='CTI_LOT' class='"+ms.uiClass(formId, 'CTI_LOT')+"' style='"+ms.uiStyle(formId, 'CTI_LOT')+"' "+ms.uiEvent(formId, 'CTI_LOT')+" title='"+ms.titleAttr(formId,'CTI_LOT','IS_TITLE_ATTR',v)+"' >"+v['CTI_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_THAWING_TIME_TOTAL' class='datagrid-cell "+ms.tdClass(formId, 'CTI_THAWING_TIME_TOTAL')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'CTI_THAWING_TIME_TOTAL')+"' "+ms.tdEvent(formId, 'CTI_THAWING_TIME_TOTAL')+">")
            arrHtml.push("<span colno='CTI_THAWING_TIME_TOTAL' class='"+ms.uiClass(formId, 'CTI_THAWING_TIME_TOTAL')+"' style='"+ms.uiStyle(formId, 'CTI_THAWING_TIME_TOTAL')+"' "+ms.uiEvent(formId, 'CTI_THAWING_TIME_TOTAL')+" title='"+ms.titleAttr(formId,'CTI_THAWING_TIME_TOTAL','IS_TITLE_ATTR',v)+"' >"+v['CTI_THAWING_TIME_TOTAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_THAWING_TIME_MAX' class='datagrid-cell "+ms.tdClass(formId, 'CTI_THAWING_TIME_MAX')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CTI_THAWING_TIME_MAX')+"' "+ms.tdEvent(formId, 'CTI_THAWING_TIME_MAX')+">")
            arrHtml.push("<span colno='CTI_THAWING_TIME_MAX' class='"+ms.uiClass(formId, 'CTI_THAWING_TIME_MAX')+"' style='"+ms.uiStyle(formId, 'CTI_THAWING_TIME_MAX')+"' "+ms.uiEvent(formId, 'CTI_THAWING_TIME_MAX')+" title='"+ms.titleAttr(formId,'CTI_THAWING_TIME_MAX','IS_TITLE_ATTR',v)+"' >"+v['CTI_THAWING_TIME_MAX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_SUPPLIER' class='datagrid-cell "+ms.tdClass(formId, 'CTI_SUPPLIER')+"' style='width:180px;"+ms.tdStyle(formId, 'CTI_SUPPLIER')+"' "+ms.tdEvent(formId, 'CTI_SUPPLIER')+">")
            arrHtml.push("<span colno='CTI_SUPPLIER' class='"+ms.uiClass(formId, 'CTI_SUPPLIER')+"' style='"+ms.uiStyle(formId, 'CTI_SUPPLIER')+"' "+ms.uiEvent(formId, 'CTI_SUPPLIER')+" title='"+ms.titleAttr(formId,'CTI_SUPPLIER','IS_TITLE_ATTR',v)+"' >"+v['CTI_SUPPLIER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_INSTOCK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTI_INSTOCK_TIME')+"' style='width:130px;"+ms.tdStyle(formId, 'CTI_INSTOCK_TIME')+"' "+ms.tdEvent(formId, 'CTI_INSTOCK_TIME')+">")
            arrHtml.push("<span colno='CTI_INSTOCK_TIME' class='"+ms.uiClass(formId, 'CTI_INSTOCK_TIME')+"' style='"+ms.uiStyle(formId, 'CTI_INSTOCK_TIME')+"' "+ms.uiEvent(formId, 'CTI_INSTOCK_TIME')+" title='"+ms.titleAttr(formId,'CTI_INSTOCK_TIME','IS_TITLE_ATTR',v)+"' >"+v['CTI_INSTOCK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_QULITY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_QULITY_DATE')+"' style='width:140px;text-align:right;"+ms.tdStyle(formId, 'CTI_QULITY_DATE')+"' "+ms.tdEvent(formId, 'CTI_QULITY_DATE')+">")
            arrHtml.push("<span colno='CTI_QULITY_DATE' class='"+ms.uiClass(formId, 'CTI_QULITY_DATE')+"' style='"+ms.uiStyle(formId, 'CTI_QULITY_DATE')+"' "+ms.uiEvent(formId, 'CTI_QULITY_DATE')+" title='"+ms.titleAttr(formId,'CTI_QULITY_DATE','IS_TITLE_ATTR',v)+"' >"+v['CTI_QULITY_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_EXPIRE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_EXPIRE_DATE')+"' style='width:140px;"+ms.tdStyle(formId, 'CTI_EXPIRE_DATE')+"' "+ms.tdEvent(formId, 'CTI_EXPIRE_DATE')+">")
            arrHtml.push("<span colno='CTI_EXPIRE_DATE' class='"+ms.uiClass(formId, 'CTI_EXPIRE_DATE')+"' style='"+ms.uiStyle(formId, 'CTI_EXPIRE_DATE')+"' "+ms.uiEvent(formId, 'CTI_EXPIRE_DATE')+" title='"+ms.titleAttr(formId,'CTI_EXPIRE_DATE','IS_TITLE_ATTR',v)+"' >"+v['CTI_EXPIRE_DATE']+"</span>")
            arrHtml.push("</td>");
            <!-- add -->
            arrHtml.push("<td colno='CTI_THAWING_MAX_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_THAWING_MAX_CYCLE')+"' style='width:140px;text-align:right;"+ms.tdStyle(formId, 'CTI_THAWING_MAX_CYCLE')+"' "+ms.tdEvent(formId, 'CTI_THAWING_MAX_CYCLE')+">")
            arrHtml.push("<span colno='CTI_THAWING_MAX_CYCLE' class='"+ms.uiClass(formId, 'CTI_THAWING_MAX_CYCLE')+"' style='"+ms.uiStyle(formId, 'CTI_THAWING_MAX_CYCLE')+"' "+ms.uiEvent(formId, 'CTI_THAWING_MAX_CYCLE')+" title='"+ms.titleAttr(formId,'CTI_THAWING_MAX_CYCLE','IS_TITLE_ATTR',v)+"' >"+v['CTI_THAWING_MAX_CYCLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTI_MIX_MAX_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTI_MIX_MAX_TIME')+"' style='width:140px;"+ms.tdStyle(formId, 'CTI_MIX_MAX_TIME')+"' "+ms.tdEvent(formId, 'CTI_MIX_MAX_TIME')+">")
            arrHtml.push("<span colno='CTI_MIX_MAX_TIME' class='"+ms.uiClass(formId, 'CTI_MIX_MAX_TIME')+"' style='"+ms.uiStyle(formId, 'CTI_MIX_MAX_TIME')+"' "+ms.uiEvent(formId, 'CTI_MIX_MAX_TIME')+" title='"+ms.titleAttr(formId,'CTI_MIX_MAX_TIME','IS_TITLE_ATTR',v)+"' >"+v['CTI_MIX_MAX_TIME']+"</span>")
            arrHtml.push("</td>");
             <!-- end -->
            arrHtml.push("<td colno='CTI_INSTOCK_MAN' class='datagrid-cell "+ms.tdClass(formId, 'CTI_INSTOCK_MAN')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CTI_INSTOCK_MAN')+"' "+ms.tdEvent(formId, 'CTI_INSTOCK_MAN')+">")
            arrHtml.push("<span colno='CTI_INSTOCK_MAN' class='"+ms.uiClass(formId, 'CTI_INSTOCK_MAN')+"' style='"+ms.uiStyle(formId, 'CTI_INSTOCK_MAN')+"' "+ms.uiEvent(formId, 'CTI_ASSISTANTTOOLTYPE')+" title='"+ms.titleAttr(formId,'CTI_INSTOCK_MAN','IS_TITLE_ATTR',v)+"' >"+v['CTI_INSTOCK_MAN']+"</span>")
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
$("tr").removeAttr("onclick");
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//辅料履历
function itemJump1(obj){
      winOptMethod.jump("c4d83196ce8d43b59a659770faab3b00","F3830","jumpId",obj);
}  


//辅料制具料号
function itemJump2(obj){
    winOptMethod.jump("8d8dfef2f0e140e88073f6cdad4b431d","F3722","jumpId",obj);
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