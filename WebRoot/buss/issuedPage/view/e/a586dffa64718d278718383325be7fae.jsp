<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="VM-物料组-列表" />
    </title>
    <style type="text/css">
	.datagrid-header,.datagrid-body{
		width:100% !important;
	}
    </style>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="4e26051dfc65446098d440a56f1c41f8"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="4b5ee57b70894125b850ca5ca9bdbbef" />
            </div>
            <div class="bd" id="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="4b5ee57b70894125b850ca5ca9bdbbef" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
	<div class="block1" style="float:left;width:33%;overflow-y:auto;">
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage4e26051dfc65446098d440a56f1c41f8" id="formPage4e26051dfc65446098d440a56f1c41f8" value="${formPage4e26051dfc65446098d440a56f1c41f8}"/>
		<input type="hidden" name="formId" id="formId1" value='4e26051dfc65446098d440a56f1c41f8'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='521051b58d914ae0a5d1e67cf3f4cca1'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='134dbf5683354177987d15d34d0d3875'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4e26051dfc65446098d440a56f1c41f8">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4e26051dfc65446098d440a56f1c41f8" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4e26051dfc65446098d440a56f1c41f8">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4e26051dfc65446098d440a56f1c41f8">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4e26051dfc65446098d440a56f1c41f8" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4e26051dfc65446098d440a56f1c41f8" onclick="_selectAjaxTableAllData(this,'4e26051dfc65446098d440a56f1c41f8')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style=""><bu:uitn colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<td class="datagrid-cell" style=""><bu:uitn colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<td class="datagrid-cell" style=""><bu:uitn colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4e26051dfc65446098d440a56f1c41f8" onscroll="ajaxTableScroll(this,'4e26051dfc65446098d440a56f1c41f8')" style="overflow-x:hidden;">
		<table class="datagrid-btable datagrid-btable-left fixedTable dblClick"  id="datagrid-btable-ajax4e26051dfc65446098d440a56f1c41f8" >
		<tbody id="tbody_4e26051dfc65446098d440a56f1c41f8" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4e26051dfc65446098d440a56f1c41f8==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4e26051dfc65446098d440a56f1c41f8&showLoading=0" />
			</div>
		</c:if>
		</div>

		

		<input type="hidden" id="relColVals" name="relColVals" value='CIG_SN'/>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
               <div  style="width:65%;float:right;">
		<div>
	   		<iframe id="itemiframe" name="itemiframe" frameBorder="0" src="" scrolling="auto" style="border-right: 1px;width: 100%;" >
			</iframe>   
		</div>
	</div>
	</div>		
	
		
            </div>
        </div>
    </div>
		<bu:submit viewId="4b5ee57b70894125b850ca5ca9bdbbef" />
		<bu:script viewId="4b5ee57b70894125b850ca5ca9bdbbef" />
    <script type="text/javascript">
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CIG_SN\"}";
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CIG_SN\"}";
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
                    createTableModel(ms,formId);listAx1("listForm1",groupSn);
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
    var groupSn;
    function init(){
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
        listAjaxTable($("#formId1").val());
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
     	 //listAx1("listForm1",groupSn);
     }

    function initHeight(){
    	
    	$('.datagrid-btable-left').width($('.datagrid-body').width())
    	$('#itemiframe').height($('#bd').height() - 35 + 1) ;
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
        initHeight()
    });
      $(window).resize(function(){
                 initHeight()
		
		 
	});
</script>
<script>
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='4e26051dfc65446098d440a56f1c41f8'){<%--物料组信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick='showDetail(\""+uiRaw[i].CIG_SN+"\");' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            if(v._SEQ==1){
            	arrHtml.push("<input type='hidden' id='getNum' value='"+uiRaw[i].CIG_SN+"' />");
            }
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIG_SN' class='datagrid-cell "+ms.tdClass(formId, 'CIG_SN')+"' style='"+ms.tdStyle(formId, 'CIG_SN')+"' "+ms.tdEvent(formId, 'CIG_SN')+">")
            arrHtml.push("<span colno='CIG_SN' class='"+ms.uiClass(formId, 'CIG_SN')+"' style='"+ms.uiStyle(formId, 'CIG_SN')+"' "+ms.uiEvent(formId, 'CIG_SN')+" >"+v['CIG_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIG_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CIG_NAME')+"' style='"+ms.tdStyle(formId, 'CIG_NAME')+"' "+ms.tdEvent(formId, 'CIG_NAME')+">")
            arrHtml.push("<span colno='CIG_NAME' class='"+ms.uiClass(formId, 'CIG_NAME')+"' style='"+ms.uiStyle(formId, 'CIG_NAME')+"' "+ms.uiEvent(formId, 'CIG_NAME')+" >"+v['CIG_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIG_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CIG_TYPE')+"' style='"+ms.tdStyle(formId, 'CIG_TYPE')+"' "+ms.tdEvent(formId, 'CIG_TYPE')+">")
            arrHtml.push("<span colno='CIG_TYPE' class='"+ms.uiClass(formId, 'CIG_TYPE')+"' style='"+ms.uiStyle(formId, 'CIG_TYPE')+"' "+ms.uiEvent(formId, 'CIG_TYPE')+" >"+v['CIG_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        //setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    	groupSn = $("#getNum").val();
    }
   
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
}	
	function listAx1(paginationImpl,groupSns){
		var urls = urlDetail+"&type=0&pageRecord=20&groupSn="+groupSns;
		parentWindow = $("#itemiframe")[0].contentWindow;
		parentWindow.frameElement.src= urls;
		
	}
	function showDetail(thisSn){
    		listAx1("listForm1",thisSn);
	}
	window.onload=function(){
		if($("#getNum").val()!=null||$("#getNum").val()!=""){
			listAx1("listForm1",$("#getNum").val());
		}
	}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
