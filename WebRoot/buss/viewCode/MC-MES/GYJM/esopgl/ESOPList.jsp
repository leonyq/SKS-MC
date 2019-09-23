<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="ESOP列表" />
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
		<bu:header formId ="62e5f8f76eab45ddbcf24c091ee691ce"/>
         <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="9f75d937d4eb4d8696380370b969e825" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
		<bu:search viewId="9f75d937d4eb4d8696380370b969e825" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage62e5f8f76eab45ddbcf24c091ee691ce" id="formPage62e5f8f76eab45ddbcf24c091ee691ce" value="${formPage62e5f8f76eab45ddbcf24c091ee691ce}"/>
		<input type="hidden" name="formId" id="formId1" value='62e5f8f76eab45ddbcf24c091ee691ce'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="62e5f8f76eab45ddbcf24c091ee691ce">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax62e5f8f76eab45ddbcf24c091ee691ce" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner62e5f8f76eab45ddbcf24c091ee691ce">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable62e5f8f76eab45ddbcf24c091ee691ce" style="min-width:1140px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="62e5f8f76eab45ddbcf24c091ee691ce" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_62e5f8f76eab45ddbcf24c091ee691ce" onclick="_selectAjaxTableAllData(this,'62e5f8f76eab45ddbcf24c091ee691ce')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
		<!--	<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>-->
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CREATE_USER" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CREATE_TIME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<!--
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="EDIT_USER" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDIT_TIME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			-->
			<td class="datagrid-cell" style="display:none"><bu:uitn colNo="EDIT_TIME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv62e5f8f76eab45ddbcf24c091ee691ce" onscroll="ajaxTableScroll(this,'62e5f8f76eab45ddbcf24c091ee691ce')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax62e5f8f76eab45ddbcf24c091ee691ce" style="min-width:1140px;">
		<tbody id="tbody_62e5f8f76eab45ddbcf24c091ee691ce" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage62e5f8f76eab45ddbcf24c091ee691ce==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=62e5f8f76eab45ddbcf24c091ee691ce&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="9f75d937d4eb4d8696380370b969e825" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>		
		<bu:script viewId="9f75d937d4eb4d8696380370b969e825" />
    <script type="text/javascript">
  // function reloadPg(msg,title,width,height,time,isCloseWin){
   //   msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
   // }
   function reloadPg(msg,title,width,height,time){
        msgPop(msg,"",title,width,height,time);
    }


  //function reloadPgExe(isCloseWin){
    /* document.forms.search_form.submit();
    util.showTopLoading(); */
  //  query("formId1");

  //  if ("1" != isCloseWin) {
  //  if ("undefined" != isCloseWin) {
   //   top.$(".dialog-close").click();
   // }
  //  checkboxAll("joblist");
    
 // }    
 
    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CSI_SYS_NAME\"}";
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
                    util.closeLoading();
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
    
   
    
    function alertInfo(msg){
        utilsFp.alert(msg);
    }
    
    // 清空全选
    function clearAllSelect(){
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
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
    if(formId=='62e5f8f76eab45ddbcf24c091ee691ce'){<%--ESOP信息--%>
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
               	// arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
               // arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v['DATA_AUTH']+"'>"+v['DATA_AUTH']+"</span>")
                //arrHtml.push("</td>");
            	arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CSI_SN' class='datagrid-cell "+ms.tdClass(formId, 'CSI_SN')+"' style='width:130px;"+ms.tdStyle(formId, 'CSI_SN')+"' "+ms.tdEvent(formId, 'CSI_SN')+">")
                arrHtml.push("<span colno='CSI_SN' class='"+ms.uiClass(formId, 'CSI_SN')+"' style='"+ms.uiStyle(formId, 'CSI_SN')+"' "+ms.uiEvent(formId, 'CSI_SN')+" title='"+v['CSI_SN']+"'>"+v['CSI_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CSI_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CSI_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'CSI_NAME')+"' "+ms.tdEvent(formId, 'CSI_NAME')+">")
                arrHtml.push("<span colno='CSI_NAME' class='"+ms.uiClass(formId, 'CSI_NAME')+"' style='"+ms.uiStyle(formId, 'CSI_NAME')+"' "+ms.uiEvent(formId, 'CSI_NAME')+"title='"+v['CSI_NAME']+"' >"+v['CSI_NAME']+"</span>")
                arrHtml.push("</td>");   
                arrHtml.push("<td colno='CSI_MODEL_CODE'    class='datagrid-cell "+ms.tdClass(formId, 'CSI_MODEL_CODE')+"' style='width:130px;"+ms.tdStyle(formId, 'CSI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CSI_MODEL_CODE')+">")
                arrHtml.push("<span colno='CSI_MODEL_CODE'   class='"+ms.uiClass(formId, 'CSI_MODEL_CODE')+"' onclick='itemJump1(\""+v['CSI_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CSI_MODEL_CODE')+" title='"+v['CSI_MODEL_CODE']+"' >"+v['CSI_MODEL_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CSI_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CSI_PRODUCT_STEP')+"' style='width:100px;"+ms.tdStyle(formId, 'CSI_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CSI_PRODUCT_STEP')+">")
                arrHtml.push("<span colno='CSI_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CSI_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CSI_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CSI_PRODUCT_STEP')+" title='"+v['CSI_PRODUCT_STEP']+"' >"+v['CSI_PRODUCT_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CSI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CSI_PROCESS_FACE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CSI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CSI_PROCESS_FACE')+">")
                arrHtml.push("<span colno='CSI_PROCESS_FACE' class='"+ms.uiClass(formId, 'CSI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CSI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CSI_PROCESS_FACE')+" title='"+v['CSI_PROCESS_FACE']+"' >"+v['CSI_PROCESS_FACE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CSI_GROUP'   class='datagrid-cell "+ms.tdClass(formId, 'CSI_GROUP')+"' style='width:100px;"+ms.tdStyle(formId, 'CSI_GROUP')+"' "+ms.tdEvent(formId, 'CSI_GROUP')+">")
                arrHtml.push("<span colno='CSI_GROUP' class='"+ms.uiClass(formId, 'CSI_GROUP')+"' onclick='itemJump2(\""+v['CSI_GROUP']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CSI_GROUP')+" title='"+v['CSI_GROUP']+"' >"+v['CSI_GROUP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CSI_VERSION' class='datagrid-cell "+ms.tdClass(formId, 'CSI_VERSION')+"' style='width:90px;"+ms.tdStyle(formId, 'CSI_VERSION')+"' "+ms.tdEvent(formId, 'CSI_VERSION')+">")
                arrHtml.push("<span colno='CSI_VERSION' class='"+ms.uiClass(formId, 'CSI_VERSION')+"' style='"+ms.uiStyle(formId, 'CSI_VERSION')+"' "+ms.uiEvent(formId, 'CSI_VERSION')+" title='"+v['CSI_VERSION']+"' >"+v['CSI_VERSION']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CSI_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CSI_DEFAULT_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CSI_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'CSI_DEFAULT_FLAG')+">")
                arrHtml.push("<span colno='CSI_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'CSI_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'CSI_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'CSI_DEFAULT_FLAG')+"  >"+v['CSI_DEFAULT_FLAG']+"</span>")
                arrHtml.push("</td>");
                /*arrHtml.push("<td colno='CSI_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CSI_VALID_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CSI_VALID_FLAG')+"' "+ms.tdEvent(formId, 'CSI_VALID_FLAG')+">")
                arrHtml.push("<span colno='CSI_VALID_FLAG' class='"+ms.uiClass(formId, 'CSI_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'CSI_VALID_FLAG')+"' "+ms.uiEvent(formId, 'CSI_VALID_FLAG')+"  >"+v['CSI_VALID_FLAG']+"</span>")
                arrHtml.push("</td>");*/
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
                arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+v['CREATE_USER']+"'>"+v['CREATE_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
                arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+v['CREATE_TIME']+"'>"+v['CREATE_TIME']+"</span>")
                arrHtml.push("</td>");
                /*
                arrHtml.push("<td colno='EDIT_USER' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_USER')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'EDIT_USER')+"' "+ms.tdEvent(formId, 'EDIT_USER')+">")
                arrHtml.push("<span colno='EDIT_USER' class='"+ms.uiClass(formId, 'EDIT_USER')+"' style='"+ms.uiStyle(formId, 'EDIT_USER')+"' "+ms.uiEvent(formId, 'EDIT_USER')+" title='"+ms.titleAttr(formId,'EDIT_USER','IS_TITLE_ATTR',v)+"'>"+v['EDIT_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
                arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"'  >"+v['EDIT_TIME']+"</span>")
                arrHtml.push("</td>");
                */
                arrHtml.push("<td style='display:none;'>")
                arrHtml.push("<span id='CSI_SYS_NAME_"+v.ID+"' colno='CSI_SYS_NAME' class='"+ms.uiClass(formId, 'CSI_SYS_NAME')+"' style='"+ms.uiStyle(formId, 'CSI_SYS_NAME')+"' "+ms.uiEvent(formId, 'CSI_SYS_NAME')+" >"+v['CSI_SYS_NAME']+"</span>")
                //arrHtml.push("<span id='CSI_SYS_NAME_"+v.ID+"' >"+uiRaw[i].CSI_SYS_NAME+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>");
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
    
}


</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//BOM管理
function itemJump1(obj){
      winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
}  


//工序定义
function itemJump2(obj){
    winOptMethod.jump("b074327f728643948b734bce9a5f7fc9","F3158","jumpId",obj);
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