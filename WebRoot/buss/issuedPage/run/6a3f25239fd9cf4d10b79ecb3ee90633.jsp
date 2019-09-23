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
		<dict:lang value="FEEDER信息" />
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
		<bu:header formId ="90caa73200734f6c938d5aa280a9664a"/>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="cc2ddbed4a104e41af37781fea378239" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
						<bu:search viewId="cc2ddbed4a104e41af37781fea378239" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage90caa73200734f6c938d5aa280a9664a" id="formPage90caa73200734f6c938d5aa280a9664a" value="${formPage90caa73200734f6c938d5aa280a9664a}"/>
		<input type="hidden" name="formId" id="formId1" value='90caa73200734f6c938d5aa280a9664a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="90caa73200734f6c938d5aa280a9664a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax90caa73200734f6c938d5aa280a9664a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner90caa73200734f6c938d5aa280a9664a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable90caa73200734f6c938d5aa280a9664a" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="90caa73200734f6c938d5aa280a9664a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_90caa73200734f6c938d5aa280a9664a" onclick="_selectAjaxTableAllData(this,'90caa73200734f6c938d5aa280a9664a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="TCF_STATUS" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TCF_MO_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="TCF_PROCESS_FACE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TCF_LOADKPPOINT_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="TCS_USE_TIME" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="TCS_REMIND_NUM" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="TCF_TOTAL_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="TCS_MAX_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="TCS_MT_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="TCS_REMIND_DAY" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell"  style="width:150px;"><bu:uitn colNo="TCF_MT_LASTTIME" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CREATE_TIME" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CREATE_USER" formId="90caa73200734f6c938d5aa280a9664a" /></td>
		
			
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv90caa73200734f6c938d5aa280a9664a" onscroll="ajaxTableScroll(this,'90caa73200734f6c938d5aa280a9664a')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax90caa73200734f6c938d5aa280a9664a" >
		<tbody id="tbody_90caa73200734f6c938d5aa280a9664a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage90caa73200734f6c938d5aa280a9664a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=90caa73200734f6c938d5aa280a9664a&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="cc2ddbed4a104e41af37781fea378239" />
		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
        </jsp:include>
		<bu:script viewId="cc2ddbed4a104e41af37781fea378239" />
    <script type="text/javascript">
    
    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,TCF_STATUS\"}";
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
    
    function reloadPg(msg,title,width,height,time,isCloseWin){
    	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    }
    function reloadPgExe(isCloseWin){//alert(isCloseWin);
    	/* document.forms.search_form.submit();
    	util.showTopLoading(); */
    	query("formId1");
    	if ("0" == isCloseWin || typeof(isCloseWin) == "undefined" ) {
      		top.$(".dialog-close").click();
    	}
    	checkboxAll("joblist");
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
    if(formId=='90caa73200734f6c938d5aa280a9664a'){<%--FEEDER信息--%>
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
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
                arrHtml.push("</td>");            
                arrHtml.push("<td colno='TCF_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'TCF_FEEDER_SN')+"' style='width:140px;"+ms.tdStyle(formId, 'TCF_FEEDER_SN')+"' "+ms.tdEvent(formId, 'TCF_FEEDER_SN')+">")
                arrHtml.push("<span colno='TCF_FEEDER_SN' class='"+ms.uiClass(formId, 'TCF_FEEDER_SN')+"' style='"+ms.uiStyle(formId, 'TCF_FEEDER_SN')+"' "+ms.uiEvent(formId, 'TCF_FEEDER_SN')+" >"+v['TCF_FEEDER_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'TCF_STATUS')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'TCF_STATUS')+"' "+ms.tdEvent(formId, 'TCF_STATUS')+">")
                arrHtml.push("<span colno='TCF_STATUS' class='"+ms.uiClass(formId, 'TCF_STATUS')+"' style='"+ms.uiStyle(formId, 'TCF_STATUS')+"' "+ms.uiEvent(formId, 'TCF_STATUS')+" >"+v['TCF_STATUS']+"</span>")
                arrHtml.push("<input type='hidden' id='TCF_STATUS"+v.ID+"' value='"+uiRaw[i].TCF_STATUS+"' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCS_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'TCS_SPEC')+"' style='width:100px;"+ms.tdStyle(formId, 'TCS_SPEC')+"' "+ms.tdEvent(formId, 'TCS_SPEC')+">")
                arrHtml.push("<span colno='TCS_SPEC' class='"+ms.uiClass(formId, 'TCS_SPEC')+"' style='"+ms.uiStyle(formId, 'TCS_SPEC')+"' "+ms.uiEvent(formId, 'TCS_SPEC')+" >"+v['TCS_SPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCT_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TCT_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'TCT_TYPE')+"' "+ms.tdEvent(formId, 'TCT_TYPE')+">")
                arrHtml.push("<span colno='TCT_TYPE' class='"+ms.uiClass(formId, 'TCT_TYPE')+"' style='"+ms.uiStyle(formId, 'TCT_TYPE')+"' "+ms.uiEvent(formId, 'TCT_TYPE')+" >"+v['TCT_TYPE']+"</span>")
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='TCF_LEFT_CHANNEL_SN' class='datagrid-cell "+ms.tdClass(formId, 'TCF_LEFT_CHANNEL_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'TCF_LEFT_CHANNEL_SN')+"' "+ms.tdEvent(formId, 'TCF_LEFT_CHANNEL_SN')+">")
                arrHtml.push("<span colno='TCF_LEFT_CHANNEL_SN' class='"+ms.uiClass(formId, 'TCF_LEFT_CHANNEL_SN')+"' style='"+ms.uiStyle(formId, 'TCF_LEFT_CHANNEL_SN')+"' "+ms.uiEvent(formId, 'TCF_LEFT_CHANNEL_SN')+" >"+v['TCF_LEFT_CHANNEL_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_RIGHT_CHANNEL_SN' class='datagrid-cell "+ms.tdClass(formId, 'TCF_RIGHT_CHANNEL_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'TCF_RIGHT_CHANNEL_SN')+"' "+ms.tdEvent(formId, 'TCF_RIGHT_CHANNEL_SN')+">")
                arrHtml.push("<span colno='TCF_RIGHT_CHANNEL_SN' class='"+ms.uiClass(formId, 'TCF_RIGHT_CHANNEL_SN')+"' style='"+ms.uiStyle(formId, 'TCF_RIGHT_CHANNEL_SN')+"' "+ms.uiEvent(formId, 'TCF_RIGHT_CHANNEL_SN')+" >"+v['TCF_RIGHT_CHANNEL_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_MIDDLE_CHANNEL_SN' class='datagrid-cell "+ms.tdClass(formId, 'TCF_MIDDLE_CHANNEL_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'TCF_MIDDLE_CHANNEL_SN')+"' "+ms.tdEvent(formId, 'TCF_MIDDLE_CHANNEL_SN')+">")
                arrHtml.push("<span colno='TCF_MIDDLE_CHANNEL_SN' class='"+ms.uiClass(formId, 'TCF_MIDDLE_CHANNEL_SN')+"' style='"+ms.uiStyle(formId, 'TCF_MIDDLE_CHANNEL_SN')+"' "+ms.uiEvent(formId, 'TCF_MIDDLE_CHANNEL_SN')+" >"+v['TCF_MIDDLE_CHANNEL_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'TCF_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'TCF_MO_NUMBER')+"' "+ms.tdEvent(formId, 'TCF_MO_NUMBER')+">")
                arrHtml.push("<span colno='TCF_MO_NUMBER' class='"+ms.uiClass(formId, 'TCF_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'TCF_MO_NUMBER')+"' "+ms.uiEvent(formId, 'TCF_MO_NUMBER')+" >"+v['TCF_MO_NUMBER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'TCF_PROCESS_FACE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'TCF_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'TCF_PROCESS_FACE')+">")
                arrHtml.push("<span colno='TCF_PROCESS_FACE' class='"+ms.uiClass(formId, 'TCF_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'TCF_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'TCF_PROCESS_FACE')+" >"+v['TCF_PROCESS_FACE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_LOADKPPOINT_SN' class='datagrid-cell "+ms.tdClass(formId, 'TCF_LOADKPPOINT_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'TCF_LOADKPPOINT_SN')+"' "+ms.tdEvent(formId, 'TCF_LOADKPPOINT_SN')+">")
                arrHtml.push("<span colno='TCF_LOADKPPOINT_SN' class='"+ms.uiClass(formId, 'TCF_LOADKPPOINT_SN')+"' style='"+ms.uiStyle(formId, 'TCF_LOADKPPOINT_SN')+"' "+ms.uiEvent(formId, 'TCF_LOADKPPOINT_SN')+" >"+v['TCF_LOADKPPOINT_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCT_MAX_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'TCT_MAX_COUNT')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'TCT_MAX_COUNT')+"' "+ms.tdEvent(formId, 'TCT_MAX_COUNT')+">")
                arrHtml.push("<span colno='TCT_MAX_COUNT' class='"+ms.uiClass(formId, 'TCT_MAX_COUNT')+"' style='"+ms.uiStyle(formId, 'TCT_MAX_COUNT')+"' "+ms.uiEvent(formId, 'TCT_MAX_COUNT')+" >"+v['TCT_MAX_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCS_USE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TCS_USE_TIME')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'TCS_USE_TIME')+"' "+ms.tdEvent(formId, 'TCS_USE_TIME')+">")
                arrHtml.push("<span colno='TCS_USE_TIME' class='"+ms.uiClass(formId, 'TCS_USE_TIME')+"' style='"+ms.uiStyle(formId, 'TCS_USE_TIME')+"' "+ms.uiEvent(formId, 'TCS_USE_TIME')+" >"+v['TCS_USE_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCS_REMIND_NUM' class='datagrid-cell "+ms.tdClass(formId, 'TCS_REMIND_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'TCS_REMIND_NUM')+"' "+ms.tdEvent(formId, 'TCS_REMIND_NUM')+">")
                arrHtml.push("<span colno='TCS_REMIND_NUM' class='"+ms.uiClass(formId, 'TCS_REMIND_NUM')+"' style='"+ms.uiStyle(formId, 'TCS_REMIND_NUM')+"' "+ms.uiEvent(formId, 'TCS_REMIND_NUM')+" >"+v['TCS_REMIND_NUM']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_TOTAL_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'TCF_TOTAL_COUNT')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'TCF_TOTAL_COUNT')+"' "+ms.tdEvent(formId, 'TCF_TOTAL_COUNT')+">")
                arrHtml.push("<span colno='TCF_TOTAL_COUNT' class='"+ms.uiClass(formId, 'TCF_TOTAL_COUNT')+"' style='"+ms.uiStyle(formId, 'TCF_TOTAL_COUNT')+"' "+ms.uiEvent(formId, 'TCF_TOTAL_COUNT')+" >"+v['TCF_TOTAL_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCS_MAX_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'TCS_MAX_CYCLE')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'TCS_MAX_CYCLE')+"' "+ms.tdEvent(formId, 'TCS_MAX_CYCLE')+">")
                arrHtml.push("<span colno='TCS_MAX_CYCLE' class='"+ms.uiClass(formId, 'TCS_MAX_CYCLE')+"' style='"+ms.uiStyle(formId, 'TCS_MAX_CYCLE')+"' "+ms.uiEvent(formId, 'TCS_MAX_CYCLE')+" >"+v['TCS_MAX_CYCLE']+"</span>")
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='TCS_MT_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'TCS_MT_CYCLE')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'TCS_MT_CYCLE')+"' "+ms.tdEvent(formId, 'TCS_MT_CYCLE')+">")
                arrHtml.push("<span colno='TCS_MT_CYCLE' class='"+ms.uiClass(formId, 'TCS_MT_CYCLE')+"' style='"+ms.uiStyle(formId, 'TCS_MT_CYCLE')+"' "+ms.uiEvent(formId, 'TCS_MT_CYCLE')+" >"+v['TCS_MT_CYCLE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCS_REMIND_DAY' class='datagrid-cell "+ms.tdClass(formId, 'TCS_REMIND_DAY')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'TCS_REMIND_DAY')+"' "+ms.tdEvent(formId, 'TCS_REMIND_DAY')+">")
                arrHtml.push("<span colno='TCS_REMIND_DAY' class='"+ms.uiClass(formId, 'TCS_REMIND_DAY')+"' style='"+ms.uiStyle(formId, 'TCS_REMIND_DAY')+"' "+ms.uiEvent(formId, 'TCS_REMIND_DAY')+" >"+v['TCS_REMIND_DAY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCF_MT_LASTTIME' class='datagrid-cell "+ms.tdClass(formId, 'TCF_MT_LASTTIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'TCF_MT_LASTTIME')+"' "+ms.tdEvent(formId, 'TCF_MT_LASTTIME')+">")
                arrHtml.push("<span colno='TCF_MT_LASTTIME' class='"+ms.uiClass(formId, 'TCF_MT_LASTTIME')+"' style='"+ms.uiStyle(formId, 'TCF_MT_LASTTIME')+"' "+ms.uiEvent(formId, 'TCF_MT_LASTTIME')+" >"+v['TCF_MT_LASTTIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:right;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
                arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" >"+v['CREATE_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
                arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" >"+v['CREATE_USER']+"</span>")
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
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>