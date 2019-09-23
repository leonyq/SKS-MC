<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="工单信息-查看详情" />
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
		<bu:header formId ="d34c8f48bead40d88c24a153c731de82"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="3f0369cbd85f47bea2907538e60df237" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="3f0369cbd85f47bea2907538e60df237" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPaged34c8f48bead40d88c24a153c731de82" id="formPaged34c8f48bead40d88c24a153c731de82" value="${formPaged34c8f48bead40d88c24a153c731de82}"/>
		<input type="hidden" name="formId" id="formId1" value='d34c8f48bead40d88c24a153c731de82'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='97c27cbea7204ba08029f339a015bd8a'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='fbe85506ea9d4a32b0cf78996898c620'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="d34c8f48bead40d88c24a153c731de82">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxd34c8f48bead40d88c24a153c731de82" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerd34c8f48bead40d88c24a153c731de82">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabled34c8f48bead40d88c24a153c731de82">
		<s:set name="_$type" value="'detail'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d34c8f48bead40d88c24a153c731de82" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_d34c8f48bead40d88c24a153c731de82" onclick="_selectAjaxTableAllData(this,'d34c8f48bead40d88c24a153c731de82')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PM_CLOSE_REASON" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WORKING_SC" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="SCRAPPED_QTY" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ID" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivd34c8f48bead40d88c24a153c731de82" onscroll="ajaxTableScroll(this,'d34c8f48bead40d88c24a153c731de82')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajaxd34c8f48bead40d88c24a153c731de82">
		<tbody id="tbody_d34c8f48bead40d88c24a153c731de82" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPaged34c8f48bead40d88c24a153c731de82==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=d34c8f48bead40d88c24a153c731de82&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPagefbe85506ea9d4a32b0cf78996898c620" id="formPagefbe85506ea9d4a32b0cf78996898c620" value="${formPagefbe85506ea9d4a32b0cf78996898c620}"/>
		<input type="hidden" name="formId" id="formId2" value='fbe85506ea9d4a32b0cf78996898c620'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="fbe85506ea9d4a32b0cf78996898c620">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxfbe85506ea9d4a32b0cf78996898c620" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerfbe85506ea9d4a32b0cf78996898c620">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablefbe85506ea9d4a32b0cf78996898c620">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="fbe85506ea9d4a32b0cf78996898c620" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_fbe85506ea9d4a32b0cf78996898c620" onclick="_selectAjaxTableAllData(this,'fbe85506ea9d4a32b0cf78996898c620')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="CBD_SEQUENCE" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CBD_ITEM_CODE" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CBD_ITEM_NAME" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CBD_ITEM_SPEC" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CBD_UNITS" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CBD_POINT" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CBD_ITEM_NUM" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CBD_ITEM_TYPE" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_ID" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ID" formId="fbe85506ea9d4a32b0cf78996898c620" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivfbe85506ea9d4a32b0cf78996898c620" onscroll="ajaxTableScroll(this,'fbe85506ea9d4a32b0cf78996898c620')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajaxfbe85506ea9d4a32b0cf78996898c620">
		<tbody id="tbody_fbe85506ea9d4a32b0cf78996898c620" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagefbe85506ea9d4a32b0cf78996898c620==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=fbe85506ea9d4a32b0cf78996898c620&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='PROJECT_ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3f0369cbd85f47bea2907538e60df237" />
		<bu:script viewId="3f0369cbd85f47bea2907538e60df237" />
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
    if(formId=='d34c8f48bead40d88c24a153c731de82'){<%--工单信息--%>
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
                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">")
                arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" >"+v['PROJECT_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DESTROY_NO' class='datagrid-cell "+ms.tdClass(formId, 'DESTROY_NO')+"' style='"+ms.tdStyle(formId, 'DESTROY_NO')+"' "+ms.tdEvent(formId, 'DESTROY_NO')+">")
                arrHtml.push("<span colno='DESTROY_NO' class='"+ms.uiClass(formId, 'DESTROY_NO')+"' style='"+ms.uiStyle(formId, 'DESTROY_NO')+"' "+ms.uiEvent(formId, 'DESTROY_NO')+" >"+v['DESTROY_NO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CUST_CODE')+"' style='"+ms.tdStyle(formId, 'CUST_CODE')+"' "+ms.tdEvent(formId, 'CUST_CODE')+">")
                arrHtml.push("<span colno='CUST_CODE' class='"+ms.uiClass(formId, 'CUST_CODE')+"' style='"+ms.uiStyle(formId, 'CUST_CODE')+"' "+ms.uiEvent(formId, 'CUST_CODE')+" >"+v['CUST_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'PRODUCT_MATERIAL')+">")
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'PRODUCT_MATERIAL')+" >"+v['PRODUCT_MATERIAL']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_NAME')+"' style='"+ms.tdStyle(formId, 'PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'PRODUCT_NAME')+">")
                arrHtml.push("<span colno='PRODUCT_NAME' class='"+ms.uiClass(formId, 'PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'PRODUCT_NAME')+" >"+v['PRODUCT_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.tdStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.tdEvent(formId, 'PRODUCT_STANDARD')+">")
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='"+ms.uiClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.uiStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.uiEvent(formId, 'PRODUCT_STANDARD')+" >"+v['PRODUCT_STANDARD']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'PRODUCT_COUNT')+">")
                arrHtml.push("<span colno='PRODUCT_COUNT' class='"+ms.uiClass(formId, 'PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'PRODUCT_COUNT')+" >"+v['PRODUCT_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_STATUS')+"' style='"+ms.tdStyle(formId, 'PROJECT_STATUS')+"' "+ms.tdEvent(formId, 'PROJECT_STATUS')+">")
                arrHtml.push("<span colno='PROJECT_STATUS' class='"+ms.uiClass(formId, 'PROJECT_STATUS')+"' style='"+ms.uiStyle(formId, 'PROJECT_STATUS')+"' "+ms.uiEvent(formId, 'PROJECT_STATUS')+" >"+v['PROJECT_STATUS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_TYPE')+"' style='"+ms.tdStyle(formId, 'PROJECT_TYPE')+"' "+ms.tdEvent(formId, 'PROJECT_TYPE')+">")
                arrHtml.push("<span colno='PROJECT_TYPE' class='"+ms.uiClass(formId, 'PROJECT_TYPE')+"' style='"+ms.uiStyle(formId, 'PROJECT_TYPE')+"' "+ms.uiEvent(formId, 'PROJECT_TYPE')+" >"+v['PROJECT_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_LINE' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_LINE')+"' style='"+ms.tdStyle(formId, 'PRODUCT_LINE')+"' "+ms.tdEvent(formId, 'PRODUCT_LINE')+">")
                arrHtml.push("<span colno='PRODUCT_LINE' class='"+ms.uiClass(formId, 'PRODUCT_LINE')+"' style='"+ms.uiStyle(formId, 'PRODUCT_LINE')+"' "+ms.uiEvent(formId, 'PRODUCT_LINE')+" >"+v['PRODUCT_LINE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_STEP')+"' style='"+ms.tdStyle(formId, 'PROJECT_STEP')+"' "+ms.tdEvent(formId, 'PROJECT_STEP')+">")
                arrHtml.push("<span colno='PROJECT_STEP' class='"+ms.uiClass(formId, 'PROJECT_STEP')+"' style='"+ms.uiStyle(formId, 'PROJECT_STEP')+"' "+ms.uiEvent(formId, 'PROJECT_STEP')+" >"+v['PROJECT_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROLEPSIS_START_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PROLEPSIS_START_DATE')+"' style='"+ms.tdStyle(formId, 'PROLEPSIS_START_DATE')+"' "+ms.tdEvent(formId, 'PROLEPSIS_START_DATE')+">")
                arrHtml.push("<span colno='PROLEPSIS_START_DATE' class='"+ms.uiClass(formId, 'PROLEPSIS_START_DATE')+"' style='"+ms.uiStyle(formId, 'PROLEPSIS_START_DATE')+"' "+ms.uiEvent(formId, 'PROLEPSIS_START_DATE')+" >"+v['PROLEPSIS_START_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROLEPSIS_END_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PROLEPSIS_END_DATE')+"' style='"+ms.tdStyle(formId, 'PROLEPSIS_END_DATE')+"' "+ms.tdEvent(formId, 'PROLEPSIS_END_DATE')+">")
                arrHtml.push("<span colno='PROLEPSIS_END_DATE' class='"+ms.uiClass(formId, 'PROLEPSIS_END_DATE')+"' style='"+ms.uiStyle(formId, 'PROLEPSIS_END_DATE')+"' "+ms.uiEvent(formId, 'PROLEPSIS_END_DATE')+" >"+v['PROLEPSIS_END_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TPPB_PLAN_DELIVERY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' style='"+ms.tdStyle(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' "+ms.tdEvent(formId, 'TPPB_PLAN_DELIVERY_DATE')+">")
                arrHtml.push("<span colno='TPPB_PLAN_DELIVERY_DATE' class='"+ms.uiClass(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' style='"+ms.uiStyle(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' "+ms.uiEvent(formId, 'TPPB_PLAN_DELIVERY_DATE')+" >"+v['TPPB_PLAN_DELIVERY_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ACTUAL_START_DATE' class='datagrid-cell "+ms.tdClass(formId, 'ACTUAL_START_DATE')+"' style='"+ms.tdStyle(formId, 'ACTUAL_START_DATE')+"' "+ms.tdEvent(formId, 'ACTUAL_START_DATE')+">")
                arrHtml.push("<span colno='ACTUAL_START_DATE' class='"+ms.uiClass(formId, 'ACTUAL_START_DATE')+"' style='"+ms.uiStyle(formId, 'ACTUAL_START_DATE')+"' "+ms.uiEvent(formId, 'ACTUAL_START_DATE')+" >"+v['ACTUAL_START_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ACTUAL_END_DATE' class='datagrid-cell "+ms.tdClass(formId, 'ACTUAL_END_DATE')+"' style='"+ms.tdStyle(formId, 'ACTUAL_END_DATE')+"' "+ms.tdEvent(formId, 'ACTUAL_END_DATE')+">")
                arrHtml.push("<span colno='ACTUAL_END_DATE' class='"+ms.uiClass(formId, 'ACTUAL_END_DATE')+"' style='"+ms.uiStyle(formId, 'ACTUAL_END_DATE')+"' "+ms.uiEvent(formId, 'ACTUAL_END_DATE')+" >"+v['ACTUAL_END_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'PM_MEMO')+"' style='"+ms.tdStyle(formId, 'PM_MEMO')+"' "+ms.tdEvent(formId, 'PM_MEMO')+">")
                arrHtml.push("<span colno='PM_MEMO' class='"+ms.uiClass(formId, 'PM_MEMO')+"' style='"+ms.uiStyle(formId, 'PM_MEMO')+"' "+ms.uiEvent(formId, 'PM_MEMO')+" >"+v['PM_MEMO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_CLOSE_REASON' class='datagrid-cell "+ms.tdClass(formId, 'PM_CLOSE_REASON')+"' style='"+ms.tdStyle(formId, 'PM_CLOSE_REASON')+"' "+ms.tdEvent(formId, 'PM_CLOSE_REASON')+">")
                arrHtml.push("<span colno='PM_CLOSE_REASON' class='"+ms.uiClass(formId, 'PM_CLOSE_REASON')+"' style='"+ms.uiStyle(formId, 'PM_CLOSE_REASON')+"' "+ms.uiEvent(formId, 'PM_CLOSE_REASON')+" >"+v['PM_CLOSE_REASON']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WORKING_SC' class='datagrid-cell "+ms.tdClass(formId, 'WORKING_SC')+"' style='"+ms.tdStyle(formId, 'WORKING_SC')+"' "+ms.tdEvent(formId, 'WORKING_SC')+">")
                arrHtml.push("<span colno='WORKING_SC' class='"+ms.uiClass(formId, 'WORKING_SC')+"' style='"+ms.uiStyle(formId, 'WORKING_SC')+"' "+ms.uiEvent(formId, 'WORKING_SC')+" >"+v['WORKING_SC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FINISH_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'FINISH_COUNT')+"' style='"+ms.tdStyle(formId, 'FINISH_COUNT')+"' "+ms.tdEvent(formId, 'FINISH_COUNT')+">")
                arrHtml.push("<span colno='FINISH_COUNT' class='"+ms.uiClass(formId, 'FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'FINISH_COUNT')+"' "+ms.uiEvent(formId, 'FINISH_COUNT')+" >"+v['FINISH_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SCRAPPED_QTY' class='datagrid-cell "+ms.tdClass(formId, 'SCRAPPED_QTY')+"' style='"+ms.tdStyle(formId, 'SCRAPPED_QTY')+"' "+ms.tdEvent(formId, 'SCRAPPED_QTY')+">")
                arrHtml.push("<span colno='SCRAPPED_QTY' class='"+ms.uiClass(formId, 'SCRAPPED_QTY')+"' style='"+ms.uiStyle(formId, 'SCRAPPED_QTY')+"' "+ms.uiEvent(formId, 'SCRAPPED_QTY')+" >"+v['SCRAPPED_QTY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ID' class='datagrid-cell "+ms.tdClass(formId, 'ID')+"' style='"+ms.tdStyle(formId, 'ID')+"' "+ms.tdEvent(formId, 'ID')+">")
                arrHtml.push("<span colno='ID' class='"+ms.uiClass(formId, 'ID')+"' style='"+ms.uiStyle(formId, 'ID')+"' "+ms.uiEvent(formId, 'ID')+" >"+v['ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FQC_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'FQC_COUNT')+"' style='"+ms.tdStyle(formId, 'FQC_COUNT')+"' "+ms.tdEvent(formId, 'FQC_COUNT')+">")
                arrHtml.push("<span colno='FQC_COUNT' class='"+ms.uiClass(formId, 'FQC_COUNT')+"' style='"+ms.uiStyle(formId, 'FQC_COUNT')+"' "+ms.uiEvent(formId, 'FQC_COUNT')+" >"+v['FQC_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='fbe85506ea9d4a32b0cf78996898c620'){<%--工单明细表--%>
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
                arrHtml.push("<td colno='CBD_SEQUENCE' class='datagrid-cell "+ms.tdClass(formId, 'CBD_SEQUENCE')+"' style='"+ms.tdStyle(formId, 'CBD_SEQUENCE')+"' "+ms.tdEvent(formId, 'CBD_SEQUENCE')+">")
                arrHtml.push("<span colno='CBD_SEQUENCE' class='"+ms.uiClass(formId, 'CBD_SEQUENCE')+"' style='"+ms.uiStyle(formId, 'CBD_SEQUENCE')+"' "+ms.uiEvent(formId, 'CBD_SEQUENCE')+" >"+v['CBD_SEQUENCE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CBD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CBD_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'CBD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CBD_ITEM_CODE')+">")
                arrHtml.push("<span colno='CBD_ITEM_CODE' class='"+ms.uiClass(formId, 'CBD_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CBD_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CBD_ITEM_CODE')+" >"+v['CBD_ITEM_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CBD_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CBD_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'CBD_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CBD_ITEM_NAME')+">")
                arrHtml.push("<span colno='CBD_ITEM_NAME' class='"+ms.uiClass(formId, 'CBD_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CBD_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CBD_ITEM_NAME')+" >"+v['CBD_ITEM_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CBD_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CBD_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'CBD_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CBD_ITEM_SPEC')+">")
                arrHtml.push("<span colno='CBD_ITEM_SPEC' class='"+ms.uiClass(formId, 'CBD_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CBD_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CBD_ITEM_SPEC')+" >"+v['CBD_ITEM_SPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CBD_UNITS' class='datagrid-cell "+ms.tdClass(formId, 'CBD_UNITS')+"' style='"+ms.tdStyle(formId, 'CBD_UNITS')+"' "+ms.tdEvent(formId, 'CBD_UNITS')+">")
                arrHtml.push("<span colno='CBD_UNITS' class='"+ms.uiClass(formId, 'CBD_UNITS')+"' style='"+ms.uiStyle(formId, 'CBD_UNITS')+"' "+ms.uiEvent(formId, 'CBD_UNITS')+" >"+v['CBD_UNITS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CBD_POINT' class='datagrid-cell "+ms.tdClass(formId, 'CBD_POINT')+"' style='"+ms.tdStyle(formId, 'CBD_POINT')+"' "+ms.tdEvent(formId, 'CBD_POINT')+">")
                arrHtml.push("<span colno='CBD_POINT' class='"+ms.uiClass(formId, 'CBD_POINT')+"' style='"+ms.uiStyle(formId, 'CBD_POINT')+"' "+ms.uiEvent(formId, 'CBD_POINT')+" >"+v['CBD_POINT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CBD_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'CBD_ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'CBD_ITEM_NUM')+"' "+ms.tdEvent(formId, 'CBD_ITEM_NUM')+">")
                arrHtml.push("<span colno='CBD_ITEM_NUM' class='"+ms.uiClass(formId, 'CBD_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'CBD_ITEM_NUM')+"' "+ms.uiEvent(formId, 'CBD_ITEM_NUM')+" >"+v['CBD_ITEM_NUM']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CBD_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CBD_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'CBD_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CBD_ITEM_TYPE')+">")
                arrHtml.push("<span colno='CBD_ITEM_TYPE' class='"+ms.uiClass(formId, 'CBD_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CBD_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CBD_ITEM_TYPE')+" >"+v['CBD_ITEM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">")
                arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" >"+v['PROJECT_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ID' class='datagrid-cell "+ms.tdClass(formId, 'ID')+"' style='"+ms.tdStyle(formId, 'ID')+"' "+ms.tdEvent(formId, 'ID')+">")
                arrHtml.push("<span colno='ID' class='"+ms.uiClass(formId, 'ID')+"' style='"+ms.uiStyle(formId, 'ID')+"' "+ms.uiEvent(formId, 'ID')+" >"+v['ID']+"</span>")
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
