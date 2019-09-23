<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="流程信息" />
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
		<bu:header formId ="4930de89023b451385f973aed9882309"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="4c21aa974aa94edc9e79380f9f44abc6" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
		<bu:search viewId="4c21aa974aa94edc9e79380f9f44abc6" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
		<input type="hidden" name="formPage4930de89023b451385f973aed9882309" id="formPage4930de89023b451385f973aed9882309" value="${formPage4930de89023b451385f973aed9882309}"/>
		<input type="hidden" name="formId" id="formId1" value='4930de89023b451385f973aed9882309'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='372f5b0828754404b7448d11673925ad,01c2d85010eb4684a4704676c35d7c83'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='4d715c2ffaf74c388050bd8511ae91e3,9b92713a6cea4e6495e85319754073fc'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4930de89023b451385f973aed9882309">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4930de89023b451385f973aed9882309" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4930de89023b451385f973aed9882309">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4930de89023b451385f973aed9882309">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4930de89023b451385f973aed9882309" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4930de89023b451385f973aed9882309" onclick="_selectAjaxTableAllData(this,'4930de89023b451385f973aed9882309')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="CR_ROUTE_ID" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="CR_ROUTE_NAME" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="CR_ROUTE_FLAG" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="CREATE_USER" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="CREATE_TIME" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="EDIT_USER" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="datagrid-cell"style="width:140px; text-align:center" ><bu:uitn colNo="EDIT_TIME" formId="4930de89023b451385f973aed9882309" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4930de89023b451385f973aed9882309" onscroll="ajaxTableScroll(this,'4930de89023b451385f973aed9882309')" style="overflow-x:hidden;">
		<table class="datagrid-btable fixedTable query-list dblClick"  id="datagrid-btable-ajax4930de89023b451385f973aed9882309">
		<tbody id="tbody_4930de89023b451385f973aed9882309" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4930de89023b451385f973aed9882309==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4930de89023b451385f973aed9882309&showLoading=0" />
			</div>
		</c:if>
		</div>

		
		<input type="hidden" id="relColVals" name="relColVals" value='CR_ROUTE_ID,CR_ROUTE_ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="4c21aa974aa94edc9e79380f9f44abc6" />
		<bu:script viewId="4c21aa974aa94edc9e79380f9f44abc6" />
    <script type="text/javascript">
    
    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CR_ROUTE_ID,CR_ROUTE_NAME,CREATE_USER,CREATE_TIME\"}";
        //var url = "${path}buss/bussModel_listMsData.ms";
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
	//document.forms.searchForm.submit();
	query();
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
        var jumpId = $("#jumpId").val();  
              if(jumpId!=""){
                  $("#CR_ROUTE_NAME").val(jumpId);
                  
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
//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='4930de89023b451385f973aed9882309'){<%--流程信息--%>
        $.each(uiTxt,function(i,v){
            	console.log(uiRaw[i].CR_ROUTE_ID);
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
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+"title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
                arrHtml.push("<td colno='CR_ROUTE_ID' class='datagrid-cell "+ms.tdClass(formId, 'CR_ROUTE_ID')+"' style='width:120px;"+ms.tdStyle(formId, 'CR_ROUTE_ID')+"' "+ms.tdEvent(formId, 'CR_ROUTE_ID')+">")
                arrHtml.push("<span colno='CR_ROUTE_ID' class='"+ms.uiClass(formId, 'CR_ROUTE_ID')+"' style='"+ms.uiStyle(formId, 'CR_ROUTE_ID')+"' "+ms.uiEvent(formId, 'CR_ROUTE_ID')+"title='"+ms.titleAttr(formId,'CR_ROUTE_ID','IS_TITLE_ATTR',v)+"' >"+v['CR_ROUTE_ID']+"</span>")
                arrHtml.push("<input type='hidden' id=\"CR_ROUTE_ID_"+v.ID+"\" value=\""+uiRaw[i].CR_ROUTE_ID+"\">")
                arrHtml.push("<input type='hidden' id=\"CR_ROUTE_NAME_"+v.ID+"\" value=\""+uiRaw[i].CR_ROUTE_NAME+"\">")
                arrHtml.push("<input type='hidden' id=\"CREATE_USER_"+v.ID+"\" value=\""+uiRaw[i].CREATE_USER+"\">")
                arrHtml.push("<input type='hidden' id=\"CREATE_TIME_"+v.ID+"\" value=\""+uiRaw[i].CREATE_TIME+"\">")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CR_ROUTE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CR_ROUTE_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'CR_ROUTE_NAME')+"' "+ms.tdEvent(formId, 'CR_ROUTE_NAME')+">")
                arrHtml.push("<span colno='CR_ROUTE_NAME' class='"+ms.uiClass(formId, 'CR_ROUTE_NAME')+"' style='"+ms.uiStyle(formId, 'CR_ROUTE_NAME')+"' "+ms.uiEvent(formId, 'CR_ROUTE_NAME')+"title='"+ms.titleAttr(formId,'CR_ROUTE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CR_ROUTE_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CR_ROUTE_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CR_ROUTE_STEP')+"' style='width:120px;"+ms.tdStyle(formId, 'CR_ROUTE_STEP')+"' "+ms.tdEvent(formId, 'CR_ROUTE_STEP')+">")
                arrHtml.push("<span colno='CR_ROUTE_STEP' class='"+ms.uiClass(formId, 'CR_ROUTE_STEP')+"' style='"+ms.uiStyle(formId, 'CR_ROUTE_STEP')+"' "+ms.uiEvent(formId, 'CR_ROUTE_STEP')+" title='"+ms.titleAttr(formId,'CR_ROUTE_STEP','IS_TITLE_ATTR',v)+"'>"+v['CR_ROUTE_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CR_ROUTE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CR_ROUTE_FLAG')+"' style='width:120px;"+ms.tdStyle(formId, 'CR_ROUTE_FLAG')+"' "+ms.tdEvent(formId, 'CR_ROUTE_FLAG')+">")
                arrHtml.push("<span colno='CR_ROUTE_FLAG' class='"+ms.uiClass(formId, 'CR_ROUTE_FLAG')+"' style='"+ms.uiStyle(formId, 'CR_ROUTE_FLAG')+"' "+ms.uiEvent(formId, 'CR_ROUTE_FLAG')+" title='"+ms.titleAttr(formId,'CR_ROUTE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CR_ROUTE_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
                arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
                arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_USER')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'EDIT_USER')+"' "+ms.tdEvent(formId, 'EDIT_USER')+">")
                arrHtml.push("<span colno='EDIT_USER' class='"+ms.uiClass(formId, 'EDIT_USER')+"' style='"+ms.uiStyle(formId, 'EDIT_USER')+"' "+ms.uiEvent(formId, 'EDIT_USER')+" title='"+ms.titleAttr(formId,'EDIT_USER','IS_TITLE_ATTR',v)+"' >"+v['EDIT_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
                arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"' >"+v['EDIT_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    
  //  setNumColWidth(formId);
    clearAllSelect();
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
