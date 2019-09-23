<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="vvvvccccvv" />
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
		<bu:header formId ="46a69fb9850f4b81909589215ac5053a"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="84d9a90d636f476c9b5c1c3ca4f84d99" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="84d9a90d636f476c9b5c1c3ca4f84d99" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage46a69fb9850f4b81909589215ac5053a" id="formPage46a69fb9850f4b81909589215ac5053a" value="${formPage46a69fb9850f4b81909589215ac5053a}"/>
		<input type="hidden" name="formId" id="formId1" value='46a69fb9850f4b81909589215ac5053a'/>
		<div class="datagrid-div6 tableContainer-ajax"  id="tableContainer46a69fb9850f4b81909589215ac5053a">
		<div class="datagrid-div5 leftTable-ajax" id="leftTable-ajax46a69fb9850f4b81909589215ac5053a">
		<div class="panel-ajax datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
		<div class="datagrid-div2 datagrid-div6 left-datagrid-view-ajax" id="left-datagrid-view-ajax46a69fb9850f4b81909589215ac5053a" style="">
		<div class="datagrid-header left-datagrid-header-ajax datagrid-div6">
		<div class="datagrid-header-inner" id="left-datagrid-header-inner46a69fb9850f4b81909589215ac5053a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 left-datagrid-htable-ajax" id="left-datagrid-htable46a69fb9850f4b81909589215ac5053a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row left-datagrid-title-ajax" id="left-datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center" ><bu:thSeq formId="46a69fb9850f4b81909589215ac5053a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_46a69fb9850f4b81909589215ac5053a" onclick="_selectAjaxTableAllData(this,'46a69fb9850f4b81909589215ac5053a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAME" formId="46a69fb9850f4b81909589215ac5053a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div4 left-datagrid-body-ajax datagrid-div6" id="leftTableDiv46a69fb9850f4b81909589215ac5053a" >
		<table class="datagrid-btable fixedTable "  id="left-datagrid-btable-ajax46a69fb9850f4b81909589215ac5053a">
			<tbody id="left-tbody_46a69fb9850f4b81909589215ac5053a" class="isParents">
			</tbody>		</table>		</div>
		</div>
		</div>
		</div>
		<div class="datagrid-div7 contentTable"  id="contentTable46a69fb9850f4b81909589215ac5053a">
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='838ca5844aa648d193678e96bd870742,8c6a9b933e49400aaf2134d7ba44cbc3'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='677346fc6b47486ba7a9164f03017738,612afe7157ae46479b87fdd32cb77485'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax46a69fb9850f4b81909589215ac5053a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner46a69fb9850f4b81909589215ac5053a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable46a69fb9850f4b81909589215ac5053a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell"><bu:uitn colNo="SEX" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="QQ" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="AGE" formId="46a69fb9850f4b81909589215ac5053a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv46a69fb9850f4b81909589215ac5053a" onscroll="ajaxTableScroll(this,'46a69fb9850f4b81909589215ac5053a')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax46a69fb9850f4b81909589215ac5053a">
		<tbody id="tbody_46a69fb9850f4b81909589215ac5053a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		</div>
		</div>
		<c:if test="${formPage46a69fb9850f4b81909589215ac5053a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=46a69fb9850f4b81909589215ac5053a&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPage677346fc6b47486ba7a9164f03017738" id="formPage677346fc6b47486ba7a9164f03017738" value="${formPage677346fc6b47486ba7a9164f03017738}"/>
		<input type="hidden" name="formId" id="formId2" value='677346fc6b47486ba7a9164f03017738'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="677346fc6b47486ba7a9164f03017738">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax677346fc6b47486ba7a9164f03017738" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner677346fc6b47486ba7a9164f03017738">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable677346fc6b47486ba7a9164f03017738">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="677346fc6b47486ba7a9164f03017738" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_677346fc6b47486ba7a9164f03017738" onclick="_selectAjaxTableAllData(this,'677346fc6b47486ba7a9164f03017738')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="A" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="B" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="C" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="D" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="E" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PID" formId="677346fc6b47486ba7a9164f03017738" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv677346fc6b47486ba7a9164f03017738" onscroll="ajaxTableScroll(this,'677346fc6b47486ba7a9164f03017738')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax677346fc6b47486ba7a9164f03017738">
		<tbody id="tbody_677346fc6b47486ba7a9164f03017738" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage677346fc6b47486ba7a9164f03017738==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=677346fc6b47486ba7a9164f03017738&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPage612afe7157ae46479b87fdd32cb77485" id="formPage612afe7157ae46479b87fdd32cb77485" value="${formPage612afe7157ae46479b87fdd32cb77485}"/>
		<input type="hidden" name="formId" id="formId3" value='612afe7157ae46479b87fdd32cb77485'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="612afe7157ae46479b87fdd32cb77485">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax612afe7157ae46479b87fdd32cb77485" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner612afe7157ae46479b87fdd32cb77485">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable612afe7157ae46479b87fdd32cb77485">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="612afe7157ae46479b87fdd32cb77485" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_612afe7157ae46479b87fdd32cb77485" onclick="_selectAjaxTableAllData(this,'612afe7157ae46479b87fdd32cb77485')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TYPENAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TESTNAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PID" formId="612afe7157ae46479b87fdd32cb77485" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv612afe7157ae46479b87fdd32cb77485" onscroll="ajaxTableScroll(this,'612afe7157ae46479b87fdd32cb77485')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax612afe7157ae46479b87fdd32cb77485">
		<tbody id="tbody_612afe7157ae46479b87fdd32cb77485" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage612afe7157ae46479b87fdd32cb77485==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=612afe7157ae46479b87fdd32cb77485&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='ID,ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='3' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="84d9a90d636f476c9b5c1c3ca4f84d99" />
		<bu:script viewId="84d9a90d636f476c9b5c1c3ca4f84d99" />
    <script type="text/javascript">
    
    <%--主列表--%>
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
   
   var document = $(document);
   $(window).scroll(function(){
	  var $this = $(this);
	  scrollLeft = $this.scrollLeft();
	  scrollWidth = document.width();
	  winWidth = $this.width();
	  if(scrollLeft+winHeight>=scrollWidth){
		  alert("到底了");
	  }
   });

    
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
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='46a69fb9850f4b81909589215ac5053a'){<%--测试异步--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
          <%--左边固定列--%>
          arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
          arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
          arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
          arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
          arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
          arrLeftHtml.push("</td>");
            arrLeftHtml.push("<td colno='NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrLeftHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" >"+v['NAME']+"</span>")
            arrLeftHtml.push("</td>");
            arrHtml.push("<td colno='SEX' class='datagrid-cell "+ms.tdClass(formId, 'SEX')+"' style='"+ms.tdStyle(formId, 'SEX')+"' "+ms.tdEvent(formId, 'SEX')+">")
            arrHtml.push("<span colno='SEX' class='"+ms.uiClass(formId, 'SEX')+"' style='"+ms.uiStyle(formId, 'SEX')+"' "+ms.uiEvent(formId, 'SEX')+" >"+v['SEX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QQ' class='datagrid-cell "+ms.tdClass(formId, 'QQ')+"' style='"+ms.tdStyle(formId, 'QQ')+"' "+ms.tdEvent(formId, 'QQ')+">")
            arrHtml.push("<span colno='QQ' class='"+ms.uiClass(formId, 'QQ')+"' style='"+ms.uiStyle(formId, 'QQ')+"' "+ms.uiEvent(formId, 'QQ')+" >"+v['QQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='612afe7157ae46479b87fdd32cb77485'){<%--子表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
          arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
          arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
          arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
          arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
          arrHtml.push("</td>");
            arrHtml.push("<td colno='NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" >"+v['NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TYPENAME' class='datagrid-cell "+ms.tdClass(formId, 'TYPENAME')+"' style='"+ms.tdStyle(formId, 'TYPENAME')+"' "+ms.tdEvent(formId, 'TYPENAME')+">")
            arrHtml.push("<span colno='TYPENAME' class='"+ms.uiClass(formId, 'TYPENAME')+"' style='"+ms.uiStyle(formId, 'TYPENAME')+"' "+ms.uiEvent(formId, 'TYPENAME')+" >"+v['TYPENAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TESTNAME' class='datagrid-cell "+ms.tdClass(formId, 'TESTNAME')+"' style='"+ms.tdStyle(formId, 'TESTNAME')+"' "+ms.tdEvent(formId, 'TESTNAME')+">")
            arrHtml.push("<span colno='TESTNAME' class='"+ms.uiClass(formId, 'TESTNAME')+"' style='"+ms.uiStyle(formId, 'TESTNAME')+"' "+ms.uiEvent(formId, 'TESTNAME')+" >"+v['TESTNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PID' class='datagrid-cell "+ms.tdClass(formId, 'PID')+"' style='"+ms.tdStyle(formId, 'PID')+"' "+ms.tdEvent(formId, 'PID')+">")
            arrHtml.push("<span colno='PID' class='"+ms.uiClass(formId, 'PID')+"' style='"+ms.uiStyle(formId, 'PID')+"' "+ms.uiEvent(formId, 'PID')+" >"+v['PID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='677346fc6b47486ba7a9164f03017738'){<%--子表2--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
          arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
          arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
          arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
          arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
          arrHtml.push("</td>");
            arrHtml.push("<td colno='A' class='datagrid-cell "+ms.tdClass(formId, 'A')+"' style='"+ms.tdStyle(formId, 'A')+"' "+ms.tdEvent(formId, 'A')+">")
            arrHtml.push("<span colno='A' class='"+ms.uiClass(formId, 'A')+"' style='"+ms.uiStyle(formId, 'A')+"' "+ms.uiEvent(formId, 'A')+" >"+v['A']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='B' class='datagrid-cell "+ms.tdClass(formId, 'B')+"' style='"+ms.tdStyle(formId, 'B')+"' "+ms.tdEvent(formId, 'B')+">")
            arrHtml.push("<span colno='B' class='"+ms.uiClass(formId, 'B')+"' style='"+ms.uiStyle(formId, 'B')+"' "+ms.uiEvent(formId, 'B')+" >"+v['B']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='C' class='datagrid-cell "+ms.tdClass(formId, 'C')+"' style='"+ms.tdStyle(formId, 'C')+"' "+ms.tdEvent(formId, 'C')+">")
            arrHtml.push("<span colno='C' class='"+ms.uiClass(formId, 'C')+"' style='"+ms.uiStyle(formId, 'C')+"' "+ms.uiEvent(formId, 'C')+" >"+v['C']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='D' class='datagrid-cell "+ms.tdClass(formId, 'D')+"' style='"+ms.tdStyle(formId, 'D')+"' "+ms.tdEvent(formId, 'D')+">")
            arrHtml.push("<span colno='D' class='"+ms.uiClass(formId, 'D')+"' style='"+ms.uiStyle(formId, 'D')+"' "+ms.uiEvent(formId, 'D')+" >"+v['D']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='E' class='datagrid-cell "+ms.tdClass(formId, 'E')+"' style='"+ms.tdStyle(formId, 'E')+"' "+ms.tdEvent(formId, 'E')+">")
            arrHtml.push("<span colno='E' class='"+ms.uiClass(formId, 'E')+"' style='"+ms.uiStyle(formId, 'E')+"' "+ms.uiEvent(formId, 'E')+" >"+v['E']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PID' class='datagrid-cell "+ms.tdClass(formId, 'PID')+"' style='"+ms.tdStyle(formId, 'PID')+"' "+ms.tdEvent(formId, 'PID')+">")
            arrHtml.push("<span colno='PID' class='"+ms.uiClass(formId, 'PID')+"' style='"+ms.uiStyle(formId, 'PID')+"' "+ms.uiEvent(formId, 'PID')+" >"+v['PID']+"</span>")
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
