<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
     </jsp:include>
<head>
    <title>
		<dict:lang value="异步制令单信息" />
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
		<bu:header formId ="9b18994844b049f2ad90204b77793334"/>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="7d0349f7a60b405299af347205b1d92f" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>                    
		<bu:search viewId="7d0349f7a60b405299af347205b1d92f" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage9b18994844b049f2ad90204b77793334" id="formPage9b18994844b049f2ad90204b77793334" value="${formPage9b18994844b049f2ad90204b77793334}"/>
		<input type="hidden" name="formId" id="formId1" value='9b18994844b049f2ad90204b77793334'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9b18994844b049f2ad90204b77793334">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9b18994844b049f2ad90204b77793334" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9b18994844b049f2ad90204b77793334">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9b18994844b049f2ad90204b77793334" style="min-width:1890px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9b18994844b049f2ad90204b77793334" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" name="selectAll" id="selectAll_9b18994844b049f2ad90204b77793334" onclick="_selectAjaxTableAllData(this,'9b18994844b049f2ad90204b77793334')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PM_STATUS" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PM_FINISH_COUNT" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PM_SCRAP_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PM_CUST_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" /></td> 
	
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9b18994844b049f2ad90204b77793334" onscroll="ajaxTableScroll(this,'9b18994844b049f2ad90204b77793334')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9b18994844b049f2ad90204b77793334" style="min-width:1890px;">
		<tbody id="tbody_9b18994844b049f2ad90204b77793334" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9b18994844b049f2ad90204b77793334==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9b18994844b049f2ad90204b77793334&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="7d0349f7a60b405299af347205b1d92f" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="7d0349f7a60b405299af347205b1d92f" />	
    <script type="text/javascript">
    
    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"PM_STATUS\"}";
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
            data:searchParams +"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
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
            //XMLHttpRequest, textStatus, errorThrown
                  util.closeLoading();
                /*  var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                  console.log("sessionstatus==>",sessionstatus);
                  if (null != sessionstatus && sessionstatus == "noAuthority") {
                  }else{
                    console.log("errorThrown==>",errorThrown);
                    util.alert("error:"+errorThrown);
                  }
         }*/
                console.log("msg.readyState==>",msg.readyState);
                if(msg.readyState!=0){
                     util.closeLoading();
                     utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                  }
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
        var jumpId = $("#jumpId").val();  
              if(jumpId!=""){
                  $("#PM_MO_NUMBER_SHOW").val(jumpId);
                   $("#PM_MO_NUMBER").val(jumpId);
                  
                  }   
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
      //checkboxAll("joblist");
}
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
    if(formId=='9b18994844b049f2ad90204b77793334'){<%--制令单信息--%>
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
               arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v['DATA_AUTH']+"' >"+v['DATA_AUTH']+"</span>")
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PM_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'PM_MO_NUMBER')+"' "+ms.tdEvent(formId, 'PM_MO_NUMBER')+">")
                arrHtml.push("<span colno='PM_MO_NUMBER' class='"+ms.uiClass(formId, 'PM_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'PM_MO_NUMBER')+"' "+ms.uiEvent(formId, 'PM_MO_NUMBER')+" title='"+v['PM_MO_NUMBER']+"' >"+v['PM_MO_NUMBER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_PROJECT_ID'  class='datagrid-cell "+ms.tdClass(formId, 'PM_PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'PM_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PM_PROJECT_ID')+">")
                arrHtml.push("<span colno='PM_PROJECT_ID' class='"+ms.uiClass(formId, 'PM_PROJECT_ID')+"' onclick='itemJump1(\""+v['PM_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PM_PROJECT_ID')+" title='"+v['PM_PROJECT_ID']+"' >"+v['PM_PROJECT_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'PM_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'PM_STATUS')+"' "+ms.tdEvent(formId, 'PM_STATUS')+">")
                arrHtml.push("<span colno='PM_STATUS' class='"+ms.uiClass(formId, 'PM_STATUS')+"' style='"+ms.uiStyle(formId, 'PM_STATUS')+"' "+ms.uiEvent(formId, 'PM_STATUS')+" >"+v['PM_STATUS']+"</span>")
                arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].PM_STATUS+"' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PM_AREA_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'PM_AREA_SN')+"' "+ms.tdEvent(formId, 'PM_AREA_SN')+">")
                arrHtml.push("<span colno='PM_AREA_SN' class='"+ms.uiClass(formId, 'PM_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PM_AREA_SN')+"' "+ms.uiEvent(formId, 'PM_AREA_SN')+" title='"+v['PM_AREA_SN']+"' >"+v['PM_AREA_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_MODEL_CODE'  class='datagrid-cell "+ms.tdClass(formId, 'PM_MODEL_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'PM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PM_MODEL_CODE')+">")
                arrHtml.push("<span colno='PM_MODEL_CODE' class='"+ms.uiClass(formId, 'PM_MODEL_CODE')+"' onclick='itemJump2(\""+v['PM_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PM_MODEL_CODE')+" title='"+v['PM_MODEL_CODE']+"' >"+v['PM_MODEL_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'PRODUCT_NAME')+">")
                arrHtml.push("<span colno='PRODUCT_NAME' class='"+ms.uiClass(formId, 'PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'PRODUCT_NAME')+" title='"+v['PRODUCT_NAME']+"' >"+v['PRODUCT_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_STANDARD')+"' style='width:120px;"+ms.tdStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.tdEvent(formId, 'PRODUCT_STANDARD')+">")
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='"+ms.uiClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.uiStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.uiEvent(formId, 'PRODUCT_STANDARD')+" title='"+v['PRODUCT_STANDARD']+"' >"+v['PRODUCT_STANDARD']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'PM_PRODUCT_STEP')+"' style='width:120px;"+ms.tdStyle(formId, 'PM_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'PM_PRODUCT_STEP')+">")
                arrHtml.push("<span colno='PM_PRODUCT_STEP' class='"+ms.uiClass(formId, 'PM_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'PM_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'PM_PRODUCT_STEP')+" title='"+v['PM_PRODUCT_STEP']+"' >"+v['PM_PRODUCT_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'PM_PROCESS_FACE')+"' style='width:70px;;"+ms.tdStyle(formId, 'PM_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'PM_PROCESS_FACE')+">")
                arrHtml.push("<span colno='PM_PROCESS_FACE' class='"+ms.uiClass(formId, 'PM_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'PM_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'PM_PROCESS_FACE')+" title='"+v['PM_PROCESS_FACE']+"' >"+v['PM_PROCESS_FACE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_TARGET_QTY' class='datagrid-cell "+ms.tdClass(formId, 'PM_TARGET_QTY')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'PM_TARGET_QTY')+"' "+ms.tdEvent(formId, 'PM_TARGET_QTY')+">")
                arrHtml.push("<span colno='PM_TARGET_QTY' class='"+ms.uiClass(formId, 'PM_TARGET_QTY')+"' style='"+ms.uiStyle(formId, 'PM_TARGET_QTY')+"' "+ms.uiEvent(formId, 'PM_TARGET_QTY')+" title='"+v['PM_TARGET_QTY']+"' >"+v['PM_TARGET_QTY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_FINISH_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'PM_FINISH_COUNT')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'PM_FINISH_COUNT')+"' "+ms.tdEvent(formId, 'PM_FINISH_COUNT')+">")
                arrHtml.push("<span colno='PM_FINISH_COUNT' class='"+ms.uiClass(formId, 'PM_FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'PM_FINISH_COUNT')+"' "+ms.uiEvent(formId, 'PM_FINISH_COUNT')+" title='"+v['PM_FINISH_COUNT']+"' >"+v['PM_FINISH_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_SCRAP_QTY' class='datagrid-cell "+ms.tdClass(formId, 'PM_SCRAP_QTY')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'PM_SCRAP_QTY')+"' "+ms.tdEvent(formId, 'PM_SCRAP_QTY')+">")
                arrHtml.push("<span colno='PM_SCRAP_QTY' class='"+ms.uiClass(formId, 'PM_SCRAP_QTY')+"' style='"+ms.uiStyle(formId, 'PM_SCRAP_QTY')+"' "+ms.uiEvent(formId, 'PM_SCRAP_QTY')+" title='"+v['PM_SCRAP_QTY']+"' >"+v['PM_SCRAP_QTY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PM_CUST_CODE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'PM_CUST_CODE')+"' "+ms.tdEvent(formId, 'PM_CUST_CODE')+">")
                arrHtml.push("<span colno='PM_CUST_CODE' class='"+ms.uiClass(formId, 'PM_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'PM_CUST_CODE')+"' "+ms.uiEvent(formId, 'PM_CUST_CODE')+" title='"+v['PM_CUST_CODE']+"' >"+v['PM_CUST_CODE']+"</span>")
                arrHtml.push("</td>");                
                arrHtml.push("<td colno='PM_SCHEDULE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PM_SCHEDULE_DATE')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'PM_SCHEDULE_DATE')+"' "+ms.tdEvent(formId, 'PM_SCHEDULE_DATE')+">")
                arrHtml.push("<span colno='PM_SCHEDULE_DATE' class='"+ms.uiClass(formId, 'PM_SCHEDULE_DATE')+"' style='"+ms.uiStyle(formId, 'PM_SCHEDULE_DATE')+"' "+ms.uiEvent(formId, 'PM_SCHEDULE_DATE')+" title='"+v['PM_SCHEDULE_DATE']+"' >"+v['PM_SCHEDULE_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_ISSUED_EMP' class='datagrid-cell "+ms.tdClass(formId, 'PM_ISSUED_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'PM_ISSUED_EMP')+"' "+ms.tdEvent(formId, 'PM_ISSUED_EMP')+">")
                arrHtml.push("<span colno='PM_ISSUED_EMP' class='"+ms.uiClass(formId, 'PM_ISSUED_EMP')+"' style='"+ms.uiStyle(formId, 'PM_ISSUED_EMP')+"' "+ms.uiEvent(formId, 'PM_ISSUED_EMP')+" title='"+v['PM_ISSUED_EMP']+"' >"+v['PM_ISSUED_EMP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_ISSUED_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PM_ISSUED_DATE')+"' style='text-align:center;"+ms.tdStyle(formId, 'PM_ISSUED_DATE')+"' "+ms.tdEvent(formId, 'PM_ISSUED_DATE')+">")
                arrHtml.push("<span colno='PM_ISSUED_DATE' class='"+ms.uiClass(formId, 'PM_ISSUED_DATE')+"' style='"+ms.uiStyle(formId, 'PM_ISSUED_DATE')+"' "+ms.uiEvent(formId, 'PM_ISSUED_DATE')+" >"+v['PM_ISSUED_DATE']+"</span>")
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
function ajaxEdit(){
    var selCount = getNewSelectedCount();
    if(selCount==1){
     
      var dataId = _selectedEditTr.attr("id");
      
      var pmStatus= $("#state_"+dataId).val();
      console.log("pmStatus==>",pmStatus);
      if(pmStatus==5 || pmStatus==4){
	    utilsFp.confirmIcon(3,"","","", "关结状态的制令单无法修改",0,"","");
         return false;
     }
     getInfo(dataId);
     
      
  }else{
      return false;
  }
}
function getInfo(dataId){
               
	    	    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=e63a8ffa8dfd4eba9203fce3f268da2f"; 
	    	    $.ajax({
	    	        type:"post",
	    	        dataType:"json",
	    	        data:{
	    	         "dataId":dataId   
	    	        },
	    	        url:loadItemUrl,
	    	        success:function(date){
	    	            if(null==date){
	    	                return;
	    	            }
	    	            
	    	            if(null!=date.ajaxString){
	    	                
	    	                	var  comp=eval(date.ajaxString);
	    	                
	    	                 if(comp==1){
	    	                    
	    	                     var formId = $("#formId1").val();
	    	                    // {path}buss/bussModel_listMsCasData.ms?exeid=f32ef503b16a4cb78f9a526b367b9249
	    	                     //var url = "${path}buss/bussModel.ms?exeid=69fe2024e89444a8a67ed6e64203e245&formId="+formId+"&dataId="+_selectedEditTr.attr("id")+"&iframeId="+_currentFrame;
                                var url = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F12790&funcMId=7f0203f463494e4692db2af73e94b7e2&formId="+formId+"&dataId="+_selectedEditTr.attr("id")+"&iframeId="+_currentFrame;
                                showPopWinFp(url, 1000,470,null,"修改");
	    	                 }else if(comp==2){
	    	                    
                        	    utilsFp.confirmIcon(3,"","","", "上线的制令单无法修改",0,"","");
                                 return false;
     
	    	                 }
	    	                 
	    	            }
	    	            
	    	        },
	    	        error:function(msg){
	    	            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	    	        }
	    	        
	    	    });
	    	    
	    	    
	    	} 
	    	
    function getCompDevice(dataId){
        var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=28c67769884844188411e56eb61c8e94";
        $.ajax({
            type:"post",
            dataType:"json",
            data:{
                "dataId":dataId
            },
            url:loadItemUrl,
            success:function(data){
                if(null==data){
                    return;
                }
                if(null!=data.ajaxString){
                    
                    var com= eval(data.ajaxString);
                    if(com==2){
                          var formId = $("#formId1").val();
                         var url = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F3456&funcMId=52ea430bd7ba4b278bed0cf33b920478&formId="+formId+"&iframeId="+_currentFrame+"&dataId="+_selectedEditTr.attr("id");
                        //  var url = "@{funcUrl}&formId="+formId+"&dataId="+_selectedEditTr.attr("id");
                        //  showPopWinFp(url, 663, 300,null,"%{getText("关结")}");
                          showPopWinFp(url, 663, 300,null,"关结");
                    }else{
                          utilsFp.confirmIcon(3,"","","", "请先对制令单下线",0,"","");
                         return false;
                    }
                    
                }
            },
            error:function(msg){
                 utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
            }
                
            
        })
        
    }

function closePm(){
    var isDataAuth = dataAuthentication();
if(!isDataAuth){return false;};
    var selCount = getNewSelectedCount();
    console.log("oooo:"+selCount);
    if(selCount==1){
      var formId = _selectedEditTr.parents(".datagrid").attr("id");
      var dataId = _selectedEditTr.attr("id");
       console.log("dataId==>",dataId);
       var pmStatus= $("#state_"+dataId).val();
       console.log("pmStatus==>",pmStatus);
    //  var pmStatus= $("#PM_STATUS_"+dataId).val();
    
      if(pmStatus==0){
           utilsFp.confirmIcon(3,"","","", "状态为开立的制令单不能关结！",0,"","");
         return false;
     }
      if(pmStatus==4){
           utilsFp.confirmIcon(3,"","","", "状态为关结的制令单不能关结！",0,"","");
         return false;
     }
     getCompDevice(dataId);
  
  }else{
      return false;
  }
}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//工单信息
function itemJump1(obj){
      winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
}  


//BOM管理
function itemJump2(obj){
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