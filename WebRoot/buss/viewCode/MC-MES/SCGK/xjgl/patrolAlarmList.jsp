<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="巡检报警信息3" />
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
		<bu:header formId ="ec9ecb539af6461e98b5ccd5ec9b17ad"/>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>    
</head>

<body  >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="d1af331c29fa4053bb7a2deaa4e5ee69" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
		<bu:search viewId="d1af331c29fa4053bb7a2deaa4e5ee69" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPageec9ecb539af6461e98b5ccd5ec9b17ad" id="formPageec9ecb539af6461e98b5ccd5ec9b17ad" value="${formPageec9ecb539af6461e98b5ccd5ec9b17ad}"/>
		<input type="hidden" name="formId" id="formId1" value='ec9ecb539af6461e98b5ccd5ec9b17ad'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="OWL_STATUS" name="OWL_STATUS"/>
		<div class="panel-ajax datagrid datagrid-div1"  id="ec9ecb539af6461e98b5ccd5ec9b17ad">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxec9ecb539af6461e98b5ccd5ec9b17ad" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerec9ecb539af6461e98b5ccd5ec9b17ad">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableec9ecb539af6461e98b5ccd5ec9b17ad" style="min-width:2470px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" i18n="1"/></td>
			
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ec9ecb539af6461e98b5ccd5ec9b17ad" onclick="_selectAjaxTableAllData(this,'ec9ecb539af6461e98b5ccd5ec9b17ad')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QWL_EVENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QWL_STATUS" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QWL_TYPE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QWL_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QWL_AREA_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QWL_DEVICE_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QWL_DEVICE_NAME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QWL_MO_NUMBER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QWL_MODEL_CODE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QWL_MODEL_NAME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QWL_MODEL_SPEC" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="QWL_CONTENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="QWL_REASON" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="QWL_SOLUTION" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QWL_CLOSER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QWL_CLOSE_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="QWL_REMARK" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivec9ecb539af6461e98b5ccd5ec9b17ad" onscroll="ajaxTableScroll(this,'ec9ecb539af6461e98b5ccd5ec9b17ad')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxec9ecb539af6461e98b5ccd5ec9b17ad" style="min-width:2470px;">
		<tbody id="tbody_ec9ecb539af6461e98b5ccd5ec9b17ad" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageec9ecb539af6461e98b5ccd5ec9b17ad==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ec9ecb539af6461e98b5ccd5ec9b17ad&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="d1af331c29fa4053bb7a2deaa4e5ee69" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>		
		<bu:script viewId="d1af331c29fa4053bb7a2deaa4e5ee69" />
    <script type="text/javascript">
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,QWL_STATUS\"}";
        //var url = "${path}buss/bussModel_listMsData.ms";
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
    if(formId=='ec9ecb539af6461e98b5ccd5ec9b17ad'){<%--巡检报警信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px; text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            
            arrHtml.push("<td colno='QWL_EVENT' class='datagrid-cell "+ms.tdClass(formId, 'QWL_EVENT')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QWL_EVENT')+"' "+ms.tdEvent(formId, 'QWL_EVENT')+">")
            arrHtml.push("<span colno='QWL_EVENT' class='"+ms.uiClass(formId, 'QWL_EVENT')+"' style='"+ms.uiStyle(formId, 'QWL_EVENT')+"' "+ms.uiEvent(formId, 'QWL_EVENT')+" title='"+ms.titleAttr(formId,'QWL_EVENT','IS_TITLE_ATTR',v)+"'>"+v['QWL_EVENT']+"</span>")
            arrHtml.push("<input type='hidden' id='QWL_STATUS_"+v.ID+"' value='"+uiRaw[i].QWL_STATUS+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'QWL_STATUS')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QWL_STATUS')+"' "+ms.tdEvent(formId, 'QWL_STATUS')+">")
            arrHtml.push("<span colno='QWL_STATUS' class='"+ms.uiClass(formId, 'QWL_STATUS')+"' style='"+ms.uiStyle(formId, 'QWL_STATUS')+"' "+ms.uiEvent(formId, 'QWL_STATUS')+" title='"+ms.titleAttr(formId,'QWL_STATUS','IS_TITLE_ATTR',v)+"'>"+v['QWL_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QWL_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QWL_TYPE')+"' "+ms.tdEvent(formId, 'QWL_TYPE')+">")
            arrHtml.push("<span colno='QWL_TYPE' class='"+ms.uiClass(formId, 'QWL_TYPE')+"' style='"+ms.uiStyle(formId, 'QWL_TYPE')+"' "+ms.uiEvent(formId, 'QWL_TYPE')+" title='"+ms.titleAttr(formId,'QWL_TYPE','IS_TITLE_ATTR',v)+"'>"+v['QWL_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QWL_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QWL_TIME')+"' "+ms.tdEvent(formId, 'QWL_TIME')+">")
            arrHtml.push("<span colno='QWL_TIME' class='"+ms.uiClass(formId, 'QWL_TIME')+"' style='"+ms.uiStyle(formId, 'QWL_TIME')+"' "+ms.uiEvent(formId, 'QWL_TIME')+" title='"+ms.titleAttr(formId,'QWL_TIME','IS_TITLE_ATTR',v)+"'>"+v['QWL_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'QWL_AREA_SN')+"' style='width:80px;"+ms.tdStyle(formId, 'QWL_AREA_SN')+"' "+ms.tdEvent(formId, 'QWL_AREA_SN')+">")
            arrHtml.push("<span colno='QWL_AREA_SN' class='"+ms.uiClass(formId, 'QWL_AREA_SN')+"' style='"+ms.uiStyle(formId, 'QWL_AREA_SN')+"' "+ms.uiEvent(formId, 'QWL_AREA_SN')+" title='"+ms.titleAttr(formId,'QWL_AREA_SN','IS_TITLE_ATTR',v)+"'>"+v['QWL_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'QWL_DEVICE_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'QWL_DEVICE_SN')+"' "+ms.tdEvent(formId, 'QWL_DEVICE_SN')+">")
            arrHtml.push("<span colno='QWL_DEVICE_SN' class='"+ms.uiClass(formId, 'QWL_DEVICE_SN')+"' onclick='itemJump1(\""+v['QWL_DEVICE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QWL_DEVICE_SN')+" title='"+ms.titleAttr(formId,'QWL_DEVICE_SN','IS_TITLE_ATTR',v)+"'>"+v['QWL_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QWL_DEVICE_NAME')+"' style='width:100px;"+ms.tdStyle(formId, 'QWL_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'QWL_DEVICE_NAME')+">")
            arrHtml.push("<span colno='QWL_DEVICE_NAME' class='"+ms.uiClass(formId, 'QWL_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'QWL_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'QWL_DEVICE_SN')+" title='"+ms.titleAttr(formId,'QWL_DEVICE_NAME','IS_TITLE_ATTR',v)+"'>"+v['QWL_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'QWL_MO_NUMBER')+"' style='width:140px;"+ms.tdStyle(formId, 'QWL_MO_NUMBER')+"' "+ms.tdEvent(formId, 'QWL_MO_NUMBER')+">")
            arrHtml.push("<span colno='QWL_MO_NUMBER' class='"+ms.uiClass(formId, 'QWL_MO_NUMBER')+"' onclick='itemJump2(\""+v['QWL_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QWL_MO_NUMBER')+" title='"+ms.titleAttr(formId,'QWL_MO_NUMBER','IS_TITLE_ATTR',v)+"'>"+v['QWL_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QWL_MODEL_CODE')+"' style='width:140px;"+ms.tdStyle(formId, 'QWL_MODEL_CODE')+"' "+ms.tdEvent(formId, 'QWL_MODEL_CODE')+">")
            arrHtml.push("<span colno='QWL_MODEL_CODE' class='"+ms.uiClass(formId, 'QWL_MODEL_CODE')+"' onclick='itemJump3(\""+v['QWL_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QWL_MODEL_CODE')+" title='"+ms.titleAttr(formId,'QWL_MODEL_CODE','IS_TITLE_ATTR',v)+"'>"+v['QWL_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QWL_MODEL_NAME')+"' style='width:140px;"+ms.tdStyle(formId, 'QWL_MODEL_NAME')+"' "+ms.tdEvent(formId, 'QWL_MODEL_NAME')+">")
            arrHtml.push("<span colno='QWL_MODEL_NAME' class='"+ms.uiClass(formId, 'QWL_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'QWL_MODEL_NAME')+"' "+ms.uiEvent(formId, 'QWL_MODEL_NAME')+" title='"+ms.titleAttr(formId,'QWL_MODEL_NAME','IS_TITLE_ATTR',v)+"'>"+v['QWL_MODEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_MODEL_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QWL_MODEL_SPEC')+"' style='width:80px;"+ms.tdStyle(formId, 'QWL_MODEL_SPEC')+"' "+ms.tdEvent(formId, 'QWL_MODEL_SPEC')+">")
            arrHtml.push("<span colno='QWL_MODEL_SPEC' class='"+ms.uiClass(formId, 'QWL_MODEL_SPEC')+"' style='"+ms.uiStyle(formId, 'QWL_MODEL_SPEC')+"' "+ms.uiEvent(formId, 'QWL_MODEL_SPEC')+" title='"+ms.titleAttr(formId,'QWL_MODEL_SPEC','IS_TITLE_ATTR',v)+"'>"+v['QWL_MODEL_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'QWL_CONTENT')+"' style='width:200px;"+ms.tdStyle(formId, 'QWL_CONTENT')+"' "+ms.tdEvent(formId, 'QWL_CONTENT')+">")
            arrHtml.push("<span colno='QWL_CONTENT' class='"+ms.uiClass(formId, 'QWL_CONTENT')+"' style='"+ms.uiStyle(formId, 'QWL_CONTENT')+"' "+ms.uiEvent(formId, 'QWL_CONTENT')+" title='"+ms.titleAttr(formId,'QWL_CONTENT','IS_TITLE_ATTR',v)+"'>"+v['QWL_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_REASON' class='datagrid-cell "+ms.tdClass(formId, 'QWL_REASON')+"' style='width:200px;"+ms.tdStyle(formId, 'QWL_REASON')+"' "+ms.tdEvent(formId, 'QWL_REASON')+">")
            arrHtml.push("<span colno='QWL_REASON' class='"+ms.uiClass(formId, 'QWL_REASON')+"' style='"+ms.uiStyle(formId, 'QWL_REASON')+"' "+ms.uiEvent(formId, 'QWL_REASON')+" title='"+ms.titleAttr(formId,'QWL_REASON','IS_TITLE_ATTR',v)+"'>"+v['QWL_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_SOLUTION' class='datagrid-cell "+ms.tdClass(formId, 'QWL_SOLUTION')+"' style='width:200px;"+ms.tdStyle(formId, 'QWL_SOLUTION')+"' "+ms.tdEvent(formId, 'QWL_SOLUTION')+">")
            arrHtml.push("<span colno='QWL_SOLUTION' class='"+ms.uiClass(formId, 'QWL_SOLUTION')+"' style='"+ms.uiStyle(formId, 'QWL_SOLUTION')+"' "+ms.uiEvent(formId, 'QWL_SOLUTION')+" title='"+ms.titleAttr(formId,'QWL_SOLUTION','IS_TITLE_ATTR',v)+"'>"+v['QWL_SOLUTION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_CLOSER' class='datagrid-cell "+ms.tdClass(formId, 'QWL_CLOSER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QWL_CLOSER')+"' "+ms.tdEvent(formId, 'QWL_CLOSER')+">")
            arrHtml.push("<span colno='QWL_CLOSER' class='"+ms.uiClass(formId, 'QWL_CLOSER')+"' style='"+ms.uiStyle(formId, 'QWL_CLOSER')+"' "+ms.uiEvent(formId, 'QWL_CLOSER')+" title='"+ms.titleAttr(formId,'QWL_CLOSER','IS_TITLE_ATTR',v)+"'>"+v['QWL_CLOSER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_CLOSE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QWL_CLOSE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QWL_CLOSE_TIME')+"' "+ms.tdEvent(formId, 'QWL_CLOSE_TIME')+">")
            arrHtml.push("<span colno='QWL_CLOSE_TIME' class='"+ms.uiClass(formId, 'QWL_CLOSE_TIME')+"' style='"+ms.uiStyle(formId, 'QWL_CLOSE_TIME')+"' "+ms.uiEvent(formId, 'QWL_CLOSE_TIME')+" title='"+ms.titleAttr(formId,'QWL_CLOSE_TIME','IS_TITLE_ATTR',v)+"'>"+v['QWL_CLOSE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QWL_REMARK' class='datagrid-cell "+ms.tdClass(formId, 'QWL_REMARK')+"' style='width:200px;"+ms.tdStyle(formId, 'QWL_REMARK')+"' "+ms.tdEvent(formId, 'QWL_REMARK')+">")
            arrHtml.push("<span colno='QWL_REMARK' class='"+ms.uiClass(formId, 'QWL_REMARK')+"' style='"+ms.uiStyle(formId, 'QWL_REMARK')+"' "+ms.uiEvent(formId, 'QWL_REMARK')+" title='"+ms.titleAttr(formId,'QWL_REMARK','IS_TITLE_ATTR',v)+"'>"+v['QWL_REMARK']+"</span>")
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
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//设备建档
function itemJump1(obj){
      winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//BOM管理
function itemJump3(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
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