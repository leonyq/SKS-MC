<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="FEEDER保养与维修信息" />
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
		<bu:header formId ="9fe40c6681484bbdaeeee44cc7fe3c2a"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="e7762c0eb62d4894b75db048d6bc8a48" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="e7762c0eb62d4894b75db048d6bc8a48" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage9fe40c6681484bbdaeeee44cc7fe3c2a" id="formPage9fe40c6681484bbdaeeee44cc7fe3c2a" value="${formPage9fe40c6681484bbdaeeee44cc7fe3c2a}"/>
		<input type="hidden" name="formId" id="formId1" value='9fe40c6681484bbdaeeee44cc7fe3c2a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9fe40c6681484bbdaeeee44cc7fe3c2a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9fe40c6681484bbdaeeee44cc7fe3c2a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9fe40c6681484bbdaeeee44cc7fe3c2a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9fe40c6681484bbdaeeee44cc7fe3c2a" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9fe40c6681484bbdaeeee44cc7fe3c2a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a" onclick="_selectAjaxTableAllData(this,'9fe40c6681484bbdaeeee44cc7fe3c2a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="TCF_FEEDER_SN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" ><bu:uitn colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" ><bu:uitn colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" ><bu:uitn colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:250px;"><bu:uitn colNo="TCFM_DATETIME" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" style="width:300px;"><bu:uitn colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<td class="datagrid-cell" ><bu:uitn colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9fe40c6681484bbdaeeee44cc7fe3c2a" onscroll="ajaxTableScroll(this,'9fe40c6681484bbdaeeee44cc7fe3c2a')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax9fe40c6681484bbdaeeee44cc7fe3c2a" >
		<tbody id="tbody_9fe40c6681484bbdaeeee44cc7fe3c2a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9fe40c6681484bbdaeeee44cc7fe3c2a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9fe40c6681484bbdaeeee44cc7fe3c2a&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="e7762c0eb62d4894b75db048d6bc8a48" />
		<bu:script viewId="e7762c0eb62d4894b75db048d6bc8a48" />
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
    if(formId=='9fe40c6681484bbdaeeee44cc7fe3c2a'){<%--FEEDER保养维修信息--%>
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
                arrHtml.push("<td colno='TCF_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'TCF_FEEDER_SN')+"' style='width:180px;"+ms.tdStyle(formId, 'TCF_FEEDER_SN')+"' "+ms.tdEvent(formId, 'TCF_FEEDER_SN')+">")
                arrHtml.push("<span colno='TCF_FEEDER_SN' class='"+ms.uiClass(formId, 'TCF_FEEDER_SN')+"' style='"+ms.uiStyle(formId, 'TCF_FEEDER_SN')+"' "+ms.uiEvent(formId, 'TCF_FEEDER_SN')+" >"+v['TCF_FEEDER_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_TYPE')+"' style='"+ms.tdStyle(formId, 'TCFM_TYPE')+"' "+ms.tdEvent(formId, 'TCFM_TYPE')+">")
                arrHtml.push("<span colno='TCFM_TYPE' class='"+ms.uiClass(formId, 'TCFM_TYPE')+"' style='"+ms.uiStyle(formId, 'TCFM_TYPE')+"' "+ms.uiEvent(formId, 'TCFM_TYPE')+" >"+v['TCFM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_MT_MAN' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_MT_MAN')+"' style='"+ms.tdStyle(formId, 'TCFM_MT_MAN')+"' "+ms.tdEvent(formId, 'TCFM_MT_MAN')+">")
                arrHtml.push("<span colno='TCFM_MT_MAN' class='"+ms.uiClass(formId, 'TCFM_MT_MAN')+"' style='"+ms.uiStyle(formId, 'TCFM_MT_MAN')+"' "+ms.uiEvent(formId, 'TCFM_MT_MAN')+" >"+v['TCFM_MT_MAN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_REPORTER' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_REPORTER')+"' style='"+ms.tdStyle(formId, 'TCFM_REPORTER')+"' "+ms.tdEvent(formId, 'TCFM_REPORTER')+">")
                arrHtml.push("<span colno='TCFM_REPORTER' class='"+ms.uiClass(formId, 'TCFM_REPORTER')+"' style='"+ms.uiStyle(formId, 'TCFM_REPORTER')+"' "+ms.uiEvent(formId, 'TCFM_REPORTER')+" >"+v['TCFM_REPORTER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_DATETIME' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_DATETIME')+"' style='width:250px;"+ms.tdStyle(formId, 'TCFM_DATETIME')+"' "+ms.tdEvent(formId, 'TCFM_DATETIME')+">")
                arrHtml.push("<span colno='TCFM_DATETIME' class='"+ms.uiClass(formId, 'TCFM_DATETIME')+"' style='"+ms.uiStyle(formId, 'TCFM_DATETIME')+"' "+ms.uiEvent(formId, 'TCFM_DATETIME')+" >"+v['TCFM_DATETIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_DEFECT_REMARK' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_DEFECT_REMARK')+"' style='width:300px;"+ms.tdStyle(formId, 'TCFM_DEFECT_REMARK')+"' "+ms.tdEvent(formId, 'TCFM_DEFECT_REMARK')+">")
                arrHtml.push("<span colno='TCFM_DEFECT_REMARK' class='"+ms.uiClass(formId, 'TCFM_DEFECT_REMARK')+"' style='"+ms.uiStyle(formId, 'TCFM_DEFECT_REMARK')+"' "+ms.uiEvent(formId, 'TCFM_DEFECT_REMARK')+" >"+v['TCFM_DEFECT_REMARK']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TCFM_AUDIT' class='datagrid-cell "+ms.tdClass(formId, 'TCFM_AUDIT')+"' style='"+ms.tdStyle(formId, 'TCFM_AUDIT')+"' "+ms.tdEvent(formId, 'TCFM_AUDIT')+">")
                arrHtml.push("<span colno='TCFM_AUDIT' class='"+ms.uiClass(formId, 'TCFM_AUDIT')+"' style='"+ms.uiStyle(formId, 'TCFM_AUDIT')+"' "+ms.uiEvent(formId, 'TCFM_AUDIT')+" >"+v['TCFM_AUDIT']+"</span>")
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
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
