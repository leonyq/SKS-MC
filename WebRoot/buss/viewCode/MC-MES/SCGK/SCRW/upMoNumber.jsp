<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="制令单上线" />
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
		<bu:header formId ="dab546190c604b8b9ff1e67e1d20ab72"/>
		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
<script type="text/javascript">
 // 
function downLine2(){
      $.ajax({
type: "POST",
dataType: "json",
url:downLineUrl,
data:{
    "dataId":dataId,
    "dev_sn":dev_sn,
    "modelCode":modelCode,
    "areaSn":areaSn,
    "proFace":proFace,
    "devSeq":devSeq,
    "pmCode":pmCode,
    "track":track,
  "projectId":projectId
},

success: function(data){
if(data.ajaxMap.code=="error"){
    utilsFp.confirmIcon(3, "", "", "", "error:" + data.ajaxMap.msg, 0, "300", "");
    return;
}
util.closeLoading();msgPop("下线成功","","摩尔提示",200,150,3000);var formId = $("#formId1").val();  listAjaxTable(formId);	
},
error: function(XMLHttpRequest, textStatus, errorThrown){
                  util.closeLoading();
                  var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                  if (null != sessionstatus && sessionstatus == "noAuthority") {
                  }else{
                    utilsFp.confirmIcon(3, "", "", "", "error:" + errorThrown, 0, "300", "");
                  }
         }
});
}
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</script>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="5b6a283ebd6c45f799fedeae93e7b4c8" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>                      
		<bu:search viewId="5b6a283ebd6c45f799fedeae93e7b4c8" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagedab546190c604b8b9ff1e67e1d20ab72" id="formPagedab546190c604b8b9ff1e67e1d20ab72" value="${formPagedab546190c604b8b9ff1e67e1d20ab72}"/>
		<input type="hidden" name="formId" id="formId1" value='dab546190c604b8b9ff1e67e1d20ab72'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="dab546190c604b8b9ff1e67e1d20ab72">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxdab546190c604b8b9ff1e67e1d20ab72" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerdab546190c604b8b9ff1e67e1d20ab72">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabledab546190c604b8b9ff1e67e1d20ab72" style="min-width:1590px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="dab546190c604b8b9ff1e67e1d20ab72" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_dab546190c604b8b9ff1e67e1d20ab72" onclick="_selectAjaxTableAllData(this,'dab546190c604b8b9ff1e67e1d20ab72')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PDO_AREA_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PDO_DEVICE_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PDO_DEVICE_NAME" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="PDO_TRACK" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="PDO_TYPE" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PDO_DEVICE_SEQ" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PDO_NUMBER" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="PDO_PROCESS_FACE" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PDO_MODEL_CODE" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PDO_ITEM_NAME" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PDO_ITEM_SPEC" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="PDO_ITEM_NUMBER" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="PDO_EMP" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<td class="datagrid-cell" style="width:140px;" ><bu:uitn colNo="PDO_TIME" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivdab546190c604b8b9ff1e67e1d20ab72" onscroll="ajaxTableScroll(this,'dab546190c604b8b9ff1e67e1d20ab72')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxdab546190c604b8b9ff1e67e1d20ab72" style="min-width:1590px;">
		<tbody id="tbody_dab546190c604b8b9ff1e67e1d20ab72" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagedab546190c604b8b9ff1e67e1d20ab72==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=dab546190c604b8b9ff1e67e1d20ab72&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="5b6a283ebd6c45f799fedeae93e7b4c8" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>		
		<bu:script viewId="5b6a283ebd6c45f799fedeae93e7b4c8" />
    <script type="text/javascript">
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"PDO_DEVICE_SN,PDO_NUMBER,PDO_PROJECT_ID,PDO_PROCESS_FACE,PDO_MODEL_CODE,PDO_AREA_SN,PDO_DEVICE_SN,PDO_DEVICE_SEQ,PDO_TRACK\"}";
        //var url = "${path}buss/bussModel_listMsData.ms";
        var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
        if(isPage(formId)){
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        util.showLoading("处理中...");
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
        //alert(msg+","+title+","+width+","+height+","+time);
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
    
    <%-- 初始化表格宽度 --%>
    function initTableWidth(){
        var width = $(window).width() - 2;
        $(".datagrid-htable,.datagrid-btable").width(width);
    }
    
    
    
    function init(){
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
      //  initTableWidth();
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
    if(formId=='dab546190c604b8b9ff1e67e1d20ab72'){<%--制令单上线设备--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='PDO_DEVICE_SN_"+v.ID+"' value='"+uiRaw[i].PDO_DEVICE_SN+"' />");
            arrHtml.push("<input type='hidden' id='PDO_NUMBER_"+v.ID+"' value='"+uiRaw[i].PDO_NUMBER+"' />");
            arrHtml.push("<input type='hidden' id='PROJECT_ID_"+v.ID+"' value='"+uiRaw[i].PDO_PROJECT_ID+"' />");
            arrHtml.push("<input type='hidden' id='PDO_PROCESS_FACE_"+v.ID+"' value='"+uiRaw[i].PDO_PROCESS_FACE+"' />");
            arrHtml.push("<input type='hidden' id='PDO_MODEL_CODE_"+v.ID+"' value='"+uiRaw[i].PDO_MODEL_CODE+"' />");
            arrHtml.push("<input type='hidden' id='PDO_AREA_SN_"+v.ID+"' value='"+uiRaw[i].PDO_AREA_SN+"' />");
            arrHtml.push("<input type='hidden' id='PDO_DEVICE_SEQ_"+v.ID+"' value='"+uiRaw[i].PDO_DEVICE_SEQ+"' />");
            arrHtml.push("<input type='hidden' id='PDO_TRACK_"+v.ID+"' value='"+uiRaw[i].PDO_TRACK+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
             arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v['DATA_AUTH']+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PDO_AREA_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'PDO_AREA_SN')+"' "+ms.tdEvent(formId, 'PDO_AREA_SN')+">")
            arrHtml.push("<span colno='PDO_AREA_SN' class='"+ms.uiClass(formId, 'PDO_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PDO_AREA_SN')+"' "+ms.uiEvent(formId, 'PDO_AREA_SN')+" title='"+v['PDO_AREA_SN']+"' >"+v['PDO_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_DEVICE_SN' onclick='itemJump1(\""+v['PDO_DEVICE_SN']+"\")' class='datagrid-cell "+ms.tdClass(formId, 'PDO_DEVICE_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'PDO_DEVICE_SN')+"' "+ms.tdEvent(formId, 'PDO_DEVICE_SN')+">")
            arrHtml.push("<span colno='PDO_DEVICE_SN' class='"+ms.uiClass(formId, 'PDO_DEVICE_SN')+"' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PDO_DEVICE_SN')+" title='"+v['PDO_DEVICE_SN']+"' >"+v['PDO_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PDO_DEVICE_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'PDO_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'PDO_DEVICE_NAME')+">")
            arrHtml.push("<span colno='PDO_DEVICE_NAME' class='"+ms.uiClass(formId, 'PDO_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'PDO_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'PDO_DEVICE_NAME')+" title='"+v['PDO_DEVICE_NAME']+"' >"+v['PDO_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_TRACK' class='datagrid-cell "+ms.tdClass(formId, 'PDO_TRACK')+"' style='width:90px;"+ms.tdStyle(formId, 'PDO_TRACK')+"' "+ms.tdEvent(formId, 'PDO_TRACK')+">")
            arrHtml.push("<span colno='PDO_TRACK' class='"+ms.uiClass(formId, 'PDO_TRACK')+"' style='"+ms.uiStyle(formId, 'PDO_TRACK')+"' "+ms.uiEvent(formId, 'PDO_TRACK')+"  >"+v['PDO_TRACK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'PDO_TYPE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'PDO_TYPE')+"' "+ms.tdEvent(formId, 'PDO_TYPE')+">")
            arrHtml.push("<span colno='PDO_TYPE' class='"+ms.uiClass(formId, 'PDO_TYPE')+"' style='"+ms.uiStyle(formId, 'PDO_TYPE')+"' "+ms.uiEvent(formId, 'PDO_TYPE')+"  >"+v['PDO_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_DEVICE_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'PDO_DEVICE_SEQ')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'PDO_DEVICE_SEQ')+"' "+ms.tdEvent(formId, 'PDO_DEVICE_SEQ')+">")
            arrHtml.push("<span colno='PDO_DEVICE_SEQ' class='"+ms.uiClass(formId, 'PDO_DEVICE_SEQ')+"' style='"+ms.uiStyle(formId, 'PDO_DEVICE_SEQ')+"' "+ms.uiEvent(formId, 'PDO_DEVICE_SEQ')+" title='"+v['PDO_DEVICE_SEQ']+"' >"+v['PDO_DEVICE_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_NUMBER' onclick='itemJump2(\""+v['PDO_NUMBER']+"\")' class='datagrid-cell "+ms.tdClass(formId, 'PDO_NUMBER')+"' style='width:120px;"+ms.tdStyle(formId, 'PDO_NUMBER')+"' "+ms.tdEvent(formId, 'PDO_NUMBER')+">")
            arrHtml.push("<span colno='PDO_NUMBER' class='"+ms.uiClass(formId, 'PDO_NUMBER')+"' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PDO_NUMBER')+" title='"+v['PDO_NUMBER']+"' >"+v['PDO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'PDO_PROCESS_FACE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'PDO_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'PDO_PROCESS_FACE')+">")
            arrHtml.push("<span colno='PDO_PROCESS_FACE' class='"+ms.uiClass(formId, 'PDO_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'PDO_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'PDO_PROCESS_FACE')+" title='"+v['PDO_PROCESS_FACE']+"' >"+v['PDO_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_MODEL_CODE' onclick='itemJump3(\""+v['PDO_MODEL_CODE']+"\")' class='datagrid-cell "+ms.tdClass(formId, 'PDO_MODEL_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'PDO_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PDO_MODEL_CODE')+">")
            arrHtml.push("<span colno='PDO_MODEL_CODE' class='"+ms.uiClass(formId, 'PDO_MODEL_CODE')+"' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PDO_MODEL_CODE')+" title='"+v['PDO_MODEL_CODE']+"' >"+v['PDO_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PDO_ITEM_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'PDO_ITEM_NAME')+"' "+ms.tdEvent(formId, 'PDO_ITEM_NAME')+">")
            arrHtml.push("<span colno='PDO_ITEM_NAME' class='"+ms.uiClass(formId, 'PDO_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'PDO_ITEM_NAME')+"' "+ms.uiEvent(formId, 'PDO_ITEM_NAME')+" title='"+v['PDO_ITEM_NAME']+"' >"+v['PDO_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'PDO_ITEM_SPEC')+"' style='width:120px;"+ms.tdStyle(formId, 'PDO_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'PDO_ITEM_SPEC')+">")
            arrHtml.push("<span colno='PDO_ITEM_SPEC' class='"+ms.uiClass(formId, 'PDO_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'PDO_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'PDO_ITEM_SPEC')+" title='"+v['PDO_ITEM_SPEC']+"' >"+v['PDO_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_ITEM_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PDO_ITEM_NUMBER')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'PDO_ITEM_NUMBER')+"' "+ms.tdEvent(formId, 'PDO_ITEM_NUMBER')+">")
            arrHtml.push("<span colno='PDO_ITEM_NUMBER' class='"+ms.uiClass(formId, 'PDO_ITEM_NUMBER')+"' style='"+ms.uiStyle(formId, 'PDO_ITEM_NUMBER')+"' "+ms.uiEvent(formId, 'PDO_ITEM_NUMBER')+" title='"+v['PDO_ITEM_NUMBER']+"' >"+v['PDO_ITEM_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_EMP' class='datagrid-cell "+ms.tdClass(formId, 'PDO_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'PDO_EMP')+"' "+ms.tdEvent(formId, 'PDO_EMP')+">")
            arrHtml.push("<span colno='PDO_EMP' class='"+ms.uiClass(formId, 'PDO_EMP')+"' style='"+ms.uiStyle(formId, 'PDO_EMP')+"' "+ms.uiEvent(formId, 'PDO_EMP')+" >"+v['PDO_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PDO_TIME' class='datagrid-cell "+ms.tdClass(formId, 'PDO_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'PDO_TIME')+"' "+ms.tdEvent(formId, 'PDO_TIME')+">")
            arrHtml.push("<span colno='PDO_TIME' class='"+ms.uiClass(formId, 'PDO_TIME')+"' style='"+ms.uiStyle(formId, 'PDO_TIME')+"' "+ms.uiEvent(formId, 'PDO_TIME')+" >"+v['PDO_TIME']+"</span>")
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
   // setTableWidth(formId);
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