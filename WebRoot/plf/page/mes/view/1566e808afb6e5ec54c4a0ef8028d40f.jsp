<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="vv" />
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
		<bu:header formId ="023e50e6146648b4a5950f10108d1048"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="ee920ed030494de5bd59cf56a3577a18" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="ee920ed030494de5bd59cf56a3577a18" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage023e50e6146648b4a5950f10108d1048" id="formPage023e50e6146648b4a5950f10108d1048" value="${formPage023e50e6146648b4a5950f10108d1048}"/>
		<input type="hidden" name="formId" id="formId1" value='023e50e6146648b4a5950f10108d1048'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='b355819ef7664410a9d2ee7c2ca81fcb'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='b8940f2372da43f3b00e50534f392e08'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="023e50e6146648b4a5950f10108d1048">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax023e50e6146648b4a5950f10108d1048" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner023e50e6146648b4a5950f10108d1048">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable023e50e6146648b4a5950f10108d1048">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="023e50e6146648b4a5950f10108d1048" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_023e50e6146648b4a5950f10108d1048" onclick="_selectAjaxTableAllData(this,'023e50e6146648b4a5950f10108d1048')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIELD_2" formId="023e50e6146648b4a5950f10108d1048" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIELD_1" formId="023e50e6146648b4a5950f10108d1048" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIELD_3" formId="023e50e6146648b4a5950f10108d1048" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIELD_4" formId="023e50e6146648b4a5950f10108d1048" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv023e50e6146648b4a5950f10108d1048" onscroll="ajaxTableScroll(this,'023e50e6146648b4a5950f10108d1048')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax023e50e6146648b4a5950f10108d1048">
		<tbody id="tbody_023e50e6146648b4a5950f10108d1048" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage023e50e6146648b4a5950f10108d1048==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=023e50e6146648b4a5950f10108d1048&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPageb8940f2372da43f3b00e50534f392e08" id="formPageb8940f2372da43f3b00e50534f392e08" value="${formPageb8940f2372da43f3b00e50534f392e08}"/>
		<input type="hidden" name="formId" id="formId2" value='b8940f2372da43f3b00e50534f392e08'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b8940f2372da43f3b00e50534f392e08">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb8940f2372da43f3b00e50534f392e08" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb8940f2372da43f3b00e50534f392e08">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb8940f2372da43f3b00e50534f392e08">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="b8940f2372da43f3b00e50534f392e08" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b8940f2372da43f3b00e50534f392e08" onclick="_selectAjaxTableAllData(this,'b8940f2372da43f3b00e50534f392e08')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIELD_1" formId="b8940f2372da43f3b00e50534f392e08" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIELD_2" formId="b8940f2372da43f3b00e50534f392e08" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIELD_3" formId="b8940f2372da43f3b00e50534f392e08" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="LEVEL1_ID" formId="b8940f2372da43f3b00e50534f392e08" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb8940f2372da43f3b00e50534f392e08" onscroll="ajaxTableScroll(this,'b8940f2372da43f3b00e50534f392e08')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajaxb8940f2372da43f3b00e50534f392e08">
		<tbody id="tbody_b8940f2372da43f3b00e50534f392e08" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb8940f2372da43f3b00e50534f392e08==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=b8940f2372da43f3b00e50534f392e08&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="ee920ed030494de5bd59cf56a3577a18" />
		<bu:script viewId="ee920ed030494de5bd59cf56a3577a18" />
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
    if(formId=='023e50e6146648b4a5950f10108d1048'){<%--主表--%>
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
                arrHtml.push("<td colno='FIELD_2' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_2')+"' style='"+ms.tdStyle(formId, 'FIELD_2')+"' "+ms.tdEvent(formId, 'FIELD_2')+">")
                arrHtml.push("<span colno='FIELD_2' class='"+ms.uiClass(formId, 'FIELD_2')+"' style='"+ms.uiStyle(formId, 'FIELD_2')+"' "+ms.uiEvent(formId, 'FIELD_2')+" >"+v['FIELD_2']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FIELD_1' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_1')+"' style='"+ms.tdStyle(formId, 'FIELD_1')+"' "+ms.tdEvent(formId, 'FIELD_1')+">")
                arrHtml.push("<span colno='FIELD_1' class='"+ms.uiClass(formId, 'FIELD_1')+"' style='"+ms.uiStyle(formId, 'FIELD_1')+"' "+ms.uiEvent(formId, 'FIELD_1')+" >"+v['FIELD_1']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FIELD_3' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_3')+"' style='"+ms.tdStyle(formId, 'FIELD_3')+"' "+ms.tdEvent(formId, 'FIELD_3')+">")
                arrHtml.push("<span colno='FIELD_3' class='"+ms.uiClass(formId, 'FIELD_3')+"' style='"+ms.uiStyle(formId, 'FIELD_3')+"' "+ms.uiEvent(formId, 'FIELD_3')+" >"+v['FIELD_3']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FIELD_4' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_4')+"' style='"+ms.tdStyle(formId, 'FIELD_4')+"' "+ms.tdEvent(formId, 'FIELD_4')+">")
                arrHtml.push("<span colno='FIELD_4' class='"+ms.uiClass(formId, 'FIELD_4')+"' style='"+ms.uiStyle(formId, 'FIELD_4')+"' "+ms.uiEvent(formId, 'FIELD_4')+" >"+v['FIELD_4']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='b8940f2372da43f3b00e50534f392e08'){<%--二级表--%>
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
                arrHtml.push("<td colno='FIELD_1' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_1')+"' style='"+ms.tdStyle(formId, 'FIELD_1')+"' "+ms.tdEvent(formId, 'FIELD_1')+">")
                arrHtml.push("<span colno='FIELD_1' class='"+ms.uiClass(formId, 'FIELD_1')+"' style='"+ms.uiStyle(formId, 'FIELD_1')+"' "+ms.uiEvent(formId, 'FIELD_1')+" >"+v['FIELD_1']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FIELD_2' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_2')+"' style='"+ms.tdStyle(formId, 'FIELD_2')+"' "+ms.tdEvent(formId, 'FIELD_2')+">")
                arrHtml.push("<span colno='FIELD_2' class='"+ms.uiClass(formId, 'FIELD_2')+"' style='"+ms.uiStyle(formId, 'FIELD_2')+"' "+ms.uiEvent(formId, 'FIELD_2')+" >"+v['FIELD_2']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FIELD_3' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_3')+"' style='"+ms.tdStyle(formId, 'FIELD_3')+"' "+ms.tdEvent(formId, 'FIELD_3')+">")
                arrHtml.push("<span colno='FIELD_3' class='"+ms.uiClass(formId, 'FIELD_3')+"' style='"+ms.uiStyle(formId, 'FIELD_3')+"' "+ms.uiEvent(formId, 'FIELD_3')+" >"+v['FIELD_3']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LEVEL1_ID' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL1_ID')+"' style='"+ms.tdStyle(formId, 'LEVEL1_ID')+"' "+ms.tdEvent(formId, 'LEVEL1_ID')+">")
                arrHtml.push("<span colno='LEVEL1_ID' class='"+ms.uiClass(formId, 'LEVEL1_ID')+"' style='"+ms.uiStyle(formId, 'LEVEL1_ID')+"' "+ms.uiEvent(formId, 'LEVEL1_ID')+" >"+v['LEVEL1_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='3c79d68f72194aa3b69ed1a4a3b2aadb'){<%--三级表--%>
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
                arrHtml.push("<td colno='LEVEL2_FIELD_1' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL2_FIELD_1')+"' style='"+ms.tdStyle(formId, 'LEVEL2_FIELD_1')+"' "+ms.tdEvent(formId, 'LEVEL2_FIELD_1')+">")
                arrHtml.push("<span colno='LEVEL2_FIELD_1' class='"+ms.uiClass(formId, 'LEVEL2_FIELD_1')+"' style='"+ms.uiStyle(formId, 'LEVEL2_FIELD_1')+"' "+ms.uiEvent(formId, 'LEVEL2_FIELD_1')+" >"+v['LEVEL2_FIELD_1']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FIELD_1' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_1')+"' style='"+ms.tdStyle(formId, 'FIELD_1')+"' "+ms.tdEvent(formId, 'FIELD_1')+">")
                arrHtml.push("<span colno='FIELD_1' class='"+ms.uiClass(formId, 'FIELD_1')+"' style='"+ms.uiStyle(formId, 'FIELD_1')+"' "+ms.uiEvent(formId, 'FIELD_1')+" >"+v['FIELD_1']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FIELD_2' class='datagrid-cell "+ms.tdClass(formId, 'FIELD_2')+"' style='"+ms.tdStyle(formId, 'FIELD_2')+"' "+ms.tdEvent(formId, 'FIELD_2')+">")
                arrHtml.push("<span colno='FIELD_2' class='"+ms.uiClass(formId, 'FIELD_2')+"' style='"+ms.uiStyle(formId, 'FIELD_2')+"' "+ms.uiEvent(formId, 'FIELD_2')+" >"+v['FIELD_2']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LEVEL2_ID' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL2_ID')+"' style='"+ms.tdStyle(formId, 'LEVEL2_ID')+"' "+ms.tdEvent(formId, 'LEVEL2_ID')+">")
                arrHtml.push("<span colno='LEVEL2_ID' class='"+ms.uiClass(formId, 'LEVEL2_ID')+"' style='"+ms.uiStyle(formId, 'LEVEL2_ID')+"' "+ms.uiEvent(formId, 'LEVEL2_ID')+" >"+v['LEVEL2_ID']+"</span>")
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
