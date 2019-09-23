<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="工单齐套查询" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="29d173bbeb2e407e98fbdeee2354c721"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="13eee668bb7345d1aa6b966ea73db9c4" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="13eee668bb7345d1aa6b966ea73db9c4" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage29d173bbeb2e407e98fbdeee2354c721" id="formPage29d173bbeb2e407e98fbdeee2354c721" value="${formPage29d173bbeb2e407e98fbdeee2354c721}"/>
		<input type="hidden" name="formId" id="formId1" value='29d173bbeb2e407e98fbdeee2354c721'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="29d173bbeb2e407e98fbdeee2354c721">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax29d173bbeb2e407e98fbdeee2354c721" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner29d173bbeb2e407e98fbdeee2354c721">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable29d173bbeb2e407e98fbdeee2354c721">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="29d173bbeb2e407e98fbdeee2354c721" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_29d173bbeb2e407e98fbdeee2354c721" onclick="_selectAjaxTableAllData(this,'29d173bbeb2e407e98fbdeee2354c721')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><dict:lang value="工单号" /></td>
            <td class="datagrid-cell" style="width:150px; text-align:center;"><dict:lang value="物料料号" /></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;"><dict:lang value="齐套状态" /></td>
            <td class="datagrid-cell" style="width:150px; text-align:center;"><dict:lang value="物料名称" /></td>
            <td class="datagrid-cell" style="width:150px; text-align:center;"><dict:lang value="物料规格" /></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="用量" /></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="总需求数量" /></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="仓库数量" /></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="可锁定数量" /></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;"><dict:lang value="齐套套数" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv29d173bbeb2e407e98fbdeee2354c721" onscroll="ajaxTableScroll(this,'29d173bbeb2e407e98fbdeee2354c721')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax29d173bbeb2e407e98fbdeee2354c721">
		<tbody id="tbody_29d173bbeb2e407e98fbdeee2354c721" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage29d173bbeb2e407e98fbdeee2354c721==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="13eee668bb7345d1aa6b966ea73db9c4" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="13eee668bb7345d1aa6b966ea73db9c4" />
    
<script>
//变量
var lang=[];//多语言
//生成异步表格
function createTableModel(ms,formId){
    /*var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='29d173bbeb2e407e98fbdeee2354c721'){//齐套库存锁定信息
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_LOCK_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WLD_LOCK_DOC')+"' style='"+ms.tdStyle(formId, 'WLD_LOCK_DOC')+"' "+ms.tdEvent(formId, 'WLD_LOCK_DOC')+">")
            arrHtml.push("<span colno='WLD_LOCK_DOC' class='"+ms.uiClass(formId, 'WLD_LOCK_DOC')+"' style='"+ms.uiStyle(formId, 'WLD_LOCK_DOC')+"' "+ms.uiEvent(formId, 'WLD_LOCK_DOC')+" title='"+ms.titleAttr(formId,'WLD_LOCK_DOC','IS_TITLE_ATTR',v)+"' >"+v['WLD_LOCK_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WLD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WLD_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'T2#WLD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'T2#WLD_ITEM_CODE')+">")
            arrHtml.push("<span colno='T2#WLD_ITEM_CODE' class='"+ms.uiClass(formId, 'T2#WLD_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'T2#WLD_ITEM_CODE')+"' "+ms.uiEvent(formId, 'T2#WLD_ITEM_CODE')+" title='"+ms.titleAttr(formId,'T2#WLD_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['T2#WLD_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_LOCK_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WLD_LOCK_STATUS')+"' style='"+ms.tdStyle(formId, 'WLD_LOCK_STATUS')+"' "+ms.tdEvent(formId, 'WLD_LOCK_STATUS')+">")
            arrHtml.push("<span colno='WLD_LOCK_STATUS' class='"+ms.uiClass(formId, 'WLD_LOCK_STATUS')+"' style='"+ms.uiStyle(formId, 'WLD_LOCK_STATUS')+"' "+ms.uiEvent(formId, 'WLD_LOCK_STATUS')+" title='"+ms.titleAttr(formId,'WLD_LOCK_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WLD_LOCK_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'WLD_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'WLD_PROJECT_ID')+"' "+ms.tdEvent(formId, 'WLD_PROJECT_ID')+">")
            arrHtml.push("<span colno='WLD_PROJECT_ID' class='"+ms.uiClass(formId, 'WLD_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'WLD_PROJECT_ID')+"' "+ms.uiEvent(formId, 'WLD_PROJECT_ID')+" title='"+ms.titleAttr(formId,'WLD_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['WLD_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WLD_LOCK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'T2#WLD_LOCK_NUM')+"' style='"+ms.tdStyle(formId, 'T2#WLD_LOCK_NUM')+"' "+ms.tdEvent(formId, 'T2#WLD_LOCK_NUM')+">")
            arrHtml.push("<span colno='T2#WLD_LOCK_NUM' class='"+ms.uiClass(formId, 'T2#WLD_LOCK_NUM')+"' style='"+ms.uiStyle(formId, 'T2#WLD_LOCK_NUM')+"' "+ms.uiEvent(formId, 'T2#WLD_LOCK_NUM')+" title='"+ms.titleAttr(formId,'T2#WLD_LOCK_NUM','IS_TITLE_ATTR',v)+"' >"+v['T2#WLD_LOCK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_CREATE_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WLD_CREATE_MAN')+"' style='"+ms.tdStyle(formId, 'WLD_CREATE_MAN')+"' "+ms.tdEvent(formId, 'WLD_CREATE_MAN')+">")
            arrHtml.push("<span colno='WLD_CREATE_MAN' class='"+ms.uiClass(formId, 'WLD_CREATE_MAN')+"' style='"+ms.uiStyle(formId, 'WLD_CREATE_MAN')+"' "+ms.uiEvent(formId, 'WLD_CREATE_MAN')+" title='"+ms.titleAttr(formId,'WLD_CREATE_MAN','IS_TITLE_ATTR',v)+"' >"+v['WLD_CREATE_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WLD_CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'WLD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'WLD_CREATE_TIME')+">")
            arrHtml.push("<span colno='WLD_CREATE_TIME' class='"+ms.uiClass(formId, 'WLD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'WLD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'WLD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'WLD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WLD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_LOCK_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WLD_LOCK_MAN')+"' style='"+ms.tdStyle(formId, 'WLD_LOCK_MAN')+"' "+ms.tdEvent(formId, 'WLD_LOCK_MAN')+">")
            arrHtml.push("<span colno='WLD_LOCK_MAN' class='"+ms.uiClass(formId, 'WLD_LOCK_MAN')+"' style='"+ms.uiStyle(formId, 'WLD_LOCK_MAN')+"' "+ms.uiEvent(formId, 'WLD_LOCK_MAN')+" title='"+ms.titleAttr(formId,'WLD_LOCK_MAN','IS_TITLE_ATTR',v)+"' >"+v['WLD_LOCK_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_LOCK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WLD_LOCK_TIME')+"' style='"+ms.tdStyle(formId, 'WLD_LOCK_TIME')+"' "+ms.tdEvent(formId, 'WLD_LOCK_TIME')+">")
            arrHtml.push("<span colno='WLD_LOCK_TIME' class='"+ms.uiClass(formId, 'WLD_LOCK_TIME')+"' style='"+ms.uiStyle(formId, 'WLD_LOCK_TIME')+"' "+ms.uiEvent(formId, 'WLD_LOCK_TIME')+" title='"+ms.titleAttr(formId,'WLD_LOCK_TIME','IS_TITLE_ATTR',v)+"' >"+v['WLD_LOCK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_UNLOCK_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WLD_UNLOCK_MAN')+"' style='"+ms.tdStyle(formId, 'WLD_UNLOCK_MAN')+"' "+ms.tdEvent(formId, 'WLD_UNLOCK_MAN')+">")
            arrHtml.push("<span colno='WLD_UNLOCK_MAN' class='"+ms.uiClass(formId, 'WLD_UNLOCK_MAN')+"' style='"+ms.uiStyle(formId, 'WLD_UNLOCK_MAN')+"' "+ms.uiEvent(formId, 'WLD_UNLOCK_MAN')+" title='"+ms.titleAttr(formId,'WLD_UNLOCK_MAN','IS_TITLE_ATTR',v)+"' >"+v['WLD_UNLOCK_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_UNLOCK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WLD_UNLOCK_TIME')+"' style='"+ms.tdStyle(formId, 'WLD_UNLOCK_TIME')+"' "+ms.tdEvent(formId, 'WLD_UNLOCK_TIME')+">")
            arrHtml.push("<span colno='WLD_UNLOCK_TIME' class='"+ms.uiClass(formId, 'WLD_UNLOCK_TIME')+"' style='"+ms.uiStyle(formId, 'WLD_UNLOCK_TIME')+"' "+ms.uiEvent(formId, 'WLD_UNLOCK_TIME')+" title='"+ms.titleAttr(formId,'WLD_UNLOCK_TIME','IS_TITLE_ATTR',v)+"' >"+v['WLD_UNLOCK_TIME']+"</span>")
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
    setScroll(formId);
    */
}
//获取数据URL
function getDataUrl(){
    try{
        return "${path}buss/bussModel_exeFunc.ms?funcMId=e5bfd04b3a7248188c2833a4987fc4ae";
    }
    catch(error){
        console.error(error);
    }
}
//界面多语言
function initLang(){
    try{
        lang["查询失败"]="<dict:lang value='查询失败'/>";
    }
    catch(error){
        console.error(error);
    }
}
//查询
function query(paginationImpl){
    try{
        //参数变量
        var paramData={};
        //分页变量
        try{
            
            paramData.currentPage=_GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
            paramData.pageRecord=_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        }
        catch(error){}
        //执行查询
        paramData.opt="query";
        paramData.projectId=$("#EX_PROJECT_ID_SHOW").val();
        paramData.isKitting=$("#WLD_STOCK_STATUS").val();
        paramData.dataauth=$("DATA_AUTH").val();
        
        showLoading(true);
        $.ajax({
            type:"post",
            dataType:"json",
            url:getDataUrl(),
            data:paramData,
            success:function(data){
                $("#tbody_29d173bbeb2e407e98fbdeee2354c721").empty();//清空数据
                var dataHtml=[];
                var kittingStatus;
                if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                    data.ajaxList.forEach(function(item,index,array){
                        dataHtml.push("<tr id='"+item.ID+"' class='datagrid-row'>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center; text-overflow: ellipsis;' name='index'>"+(index+1)+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center; text-overflow: ellipsis;' name='ID'><input id='"+item.PROJECT_ID+"' type='checkbox'/></td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center; text-overflow: ellipsis;' name='PROJECT_ID'>"+item.PROJECT_ID+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center; text-overflow: ellipsis;' name='CBD_ITEM_CODE'>"+item.CBD_ITEM_CODE+"</td>");
                        if(item.IS_KITTING=="1"){
                            kittingStatus="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'><dict:lang value='齐套' /></span>";
                        } 
					    else if(item.IS_KITTING=="2"){
                            kittingStatus="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'><dict:lang value='未齐套' /></span>";
                        } 
                        dataHtml.push("<td class='datagrid-cell' style='width:80px; text-align:center; text-overflow: ellipsis;' name='ITEM_STATUS'>"+kittingStatus+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center; text-overflow: ellipsis;' name='CI_ITEM_NAME'>"+item.CI_ITEM_NAME+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center; text-overflow: ellipsis;' name='CI_ITEM_SPEC'>"+item.CI_ITEM_SPEC+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px; text-align:center; text-overflow: ellipsis;' name='CBD_ITEM_NUM'>"+item.CBD_ITEM_NUM+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px; text-align:center; text-overflow: ellipsis;' name='TOTAL_NEED_NUM'>"+item.TOTAL_NEED_NUM+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px; text-align:center; text-overflow: ellipsis;' name='STOCK_NUM'>"+item.STOCK_NUM+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px; text-align:center; text-overflow: ellipsis;' name='CAN_LOCK'>"+item.CAN_LOCK+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px; text-align:center; text-overflow: ellipsis;' name='KITTING_NUM'>"+item.KITTING+"</td>");
                        dataHtml.push("</tr>");
                    });
                    $("#tbody_29d173bbeb2e407e98fbdeee2354c721").html(dataHtml.join(""));
                }
                pageFun(data.ajaxPage,"formId1");
                defTableWidthRewrite("29d173bbeb2e407e98fbdeee2354c721");
            },
            error:function(error){
                showMessage(3,lang["查询失败"]);
                showLoading(false);
            }
        });
        showLoading(false);
    }
    catch(error){
        console.error(error);
        showLoading(false);
    }
}
//消息提示
    //** type 1：警告；2：成功；3：失败；4：疑问；5：锁定
    //** msg 消息
    function showMessage(type,msg){
        utilsFp.confirmIcon(type,"","","", msg,0,"260","");
    }
//显示进度条
function showLoading(isShow){
    if(isShow){
        util.showLoading("处理中...");
    }
    else {
        util.closeLoading();
    }
}
$(function(){
    //初始化界面多语言
    initLang();
    //首次查询
    query("formId1");
});
</script>
<script>
(function($){
    $(window).on('load',function(){
        setPopScroll('.datagrid-body','.datagrid-header-inner');
        setPopScroll('.scroll');
    })
})(jQuery);
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
