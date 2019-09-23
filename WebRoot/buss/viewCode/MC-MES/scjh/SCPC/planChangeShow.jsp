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
		<dict:lang value="计划稳定率" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="454cc1d04a9240f4868ccffb52793896"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="1c19908e7c694fcab833399a18af6382" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="1c19908e7c694fcab833399a18af6382" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage454cc1d04a9240f4868ccffb52793896" id="formPage454cc1d04a9240f4868ccffb52793896" value="${formPage454cc1d04a9240f4868ccffb52793896}"/>
		<input type="hidden" name="formId" id="formId1" value='454cc1d04a9240f4868ccffb52793896'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="454cc1d04a9240f4868ccffb52793896">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax454cc1d04a9240f4868ccffb52793896" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner454cc1d04a9240f4868ccffb52793896">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable454cc1d04a9240f4868ccffb52793896">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax"> 
            <td style="width:30px;text-align: center;"></td>
            <td style="width:200px;text-align: center;"><dict:lang value="组织机构"/></td>
            <td style="width:100px;text-align: center;"><dict:lang value="工单号"/></td>
            <td style="width:150px;text-align: center;"><dict:lang value="机种"/></td>
            <td style="width:150px;text-align: center;"><dict:lang value="名称"/></td>
            <td style="width:150px;text-align: center;"><dict:lang value="规格"/></td>
            <td style="width:70px;text-align: center;"><dict:lang value="状态"/></td>
            <td style="width:100px;text-align: center;"><dict:lang value="变动次数"/></td>
            <td style="width:100px;text-align: center;"><dict:lang value="计划数量"/></td>
            <td style="width:100px;text-align: center;"><dict:lang value="投入数量"/></td>
            <td style="width:100px;text-align: center;"><dict:lang value="完工数量"/></td>
            <td style="width:140px;text-align: center;"><dict:lang value="预计开工时间"/></td>
            <td style="width:140px;text-align: center;"><dict:lang value="预计完工时间"/></td>
            <td style="width:140px;text-align: center;"><dict:lang value="计划交货日期"/></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv454cc1d04a9240f4868ccffb52793896" onscroll="ajaxTableScroll(this,'454cc1d04a9240f4868ccffb52793896')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax454cc1d04a9240f4868ccffb52793896">
		<tbody id="tbody_454cc1d04a9240f4868ccffb52793896" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage454cc1d04a9240f4868ccffb52793896==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('454cc1d04a9240f4868ccffb52793896','1');">打印</button>
 </div>
 </div>
 <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
 <table id="printset_tab" class="basic-table" style="text-align: center;margin-top:10px;">
 <tr>
 <td style="width: 100px;text-align: right;">列字段</td>
 <td style="padding-left: 5px;">是否打印</td>
 <td style="padding-left: 5px;">打印列宽</td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>序号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SEQ" value="30" title_name="序号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>排程单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_DOC_NO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_DOC_NO" value="" title_name="排程单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_PROJECT_ID" value="" title_name="工单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>计划数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_TARGET_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_TARGET_NUM" value="" title_name="计划数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>已排产数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_PLAN_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_PLAN_NUM" value="" title_name="已排产数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>当前排产数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_NOW_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_NOW_NUM" value="" title_name="当前排产数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>预计开工日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_START_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_START_DATE" value="" title_name="预计开工日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>预计完工日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_END_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_END_DATE" value="" title_name="预计完工日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?产能时间范围</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_DELIVERY_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_DELIVERY_DATE" value="" title_name="?产能时间范围" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>前置任务</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_PRE_TASK" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_PRE_TASK" value="" title_name="前置任务" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>计划组</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_GROUP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_GROUP" value="" title_name="计划组" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产阶别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPW_STEP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPW_STEP" value="" title_name="生产阶别" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="1c19908e7c694fcab833399a18af6382" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="1c19908e7c694fcab833399a18af6382" />

<script>
//变量
var dataUrl;
//界面加载函数
$(function(){
    dataUrl=getUrl();
    query("formId1");
});
//初始化界面数据   
function query(paginationImpl){
    try{
        //获取分页信息
        var currentPage;
        var pageRecord;
        try{
            currentPage=_GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
            pageRecord=_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        }
        catch(error){
            currentPage=_GLO_FORM_PAGE_MAP["formId1"].currentPage;
            pageRecord=_GLO_FORM_PAGE_MAP["formId1"].pageRecord;
        }
        //获取计划稳定率信息
        var startTime=$("#PPW_START_DATE_BEGIN").val();
        var endTime=$("#PPW_START_DATE_END").val();
        var dataAuth=$("#DATA_AUTH").val();
        var projectId=$("#PPW_PROJECT_ID_SHOW").val();
        showLoading(true);
        $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            data:{
                opt:"getPlanChangeRate",
                startTime:startTime,
                endTime:endTime,
                dataAuth:dataAuth,
                projectId:projectId,
                currentPage:currentPage,
                pageRecord:pageRecord
            },
            success:function(data){
                //清空数据列表
                $("#tbody_454cc1d04a9240f4868ccffb52793896").empty();
                if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
                    var dataHtml=[];
                    data.ajaxList.forEach(function(item,index,array){
                        dataHtml.push("<tr id='"+item.ID+"' class='datagrid-row'>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center; text-overflow: ellipsis;' name='index'>"+(index+1)+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:200px;text-align:center; text-overflow: ellipsis;' name='DATA_AUTH' title='"+(item.DATA_AUTH==null?"":item.DATA_AUTH)+"'>"+(item.DATA_AUTH==null?"":item.DATA_AUTH)+"</td>");
                        
                        dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: left;text-overflow: ellipsis;' name='PROJECT_ID' title='"+item.PROJECT_ID+"'>"+item.PROJECT_ID+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='PRODUCT_MATERIAL' title='"+item.PRODUCT_MATERIAL+"'>"+item.PRODUCT_MATERIAL+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='CI_ITEM_NAME' title='"+item.CI_ITEM_NAME+"'>"+item.CI_ITEM_NAME+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='CI_ITEM_SPEC' title='"+item.CI_ITEM_SPEC+"'>"+item.CI_ITEM_SPEC+"</td>");

                        var status=item.PROJECT_STATUS;
                        var colorSpan="";
                        if(status==0){
                            colorSpan="<span class='state' style='background-color:rgb(78, 157, 15);color:#FFFFFF;width:50px;text-overflow: ellipsis;' >"+item.PROJECT_STATUS_TEXT+"</span>";
                        }
                        else if(status==1){
                            colorSpan="<span class='state' style='background-color:rgb(0, 160, 233);color:#FFFFFF;width:50px;text-overflow: ellipsis;' >"+item.PROJECT_STATUS_TEXT+"</span>";
                        }
                        else if(status==2){
                            colorSpan="<span class='state' style='background-color:rgb(174, 174, 174);color:#FFFFFF;width:50px;text-overflow: ellipsis;' >"+item.PROJECT_STATUS_TEXT+"</span>";
                        }

                        dataHtml.push("<td class='datagrid-cell' style='width:70px;text-align: center;text-overflow: ellipsis;' name='PROJECT_STATUS_TEXT' >"+colorSpan+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='PM_CHANGE_TIMES' title='"+item.PM_CHANGE_TIMES+"'>"+item.PM_CHANGE_TIMES+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='PRODUCT_COUNT' title='"+item.PRODUCT_COUNT+"'>"+item.PRODUCT_COUNT+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='FQC_COUNT' title='"+item.FQC_COUNT+"'>"+item.FQC_COUNT+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='FINISH_COUNT' title='"+item.FINISH_COUNT+"'>"+item.FINISH_COUNT+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:140px;text-align: center;text-overflow: ellipsis;' name='PROLEPSIS_START_DATE' title='"+item.PROLEPSIS_START_DATE+"'>"+item.PROLEPSIS_START_DATE+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:140px;text-align: center;text-overflow: ellipsis;' name='PROLEPSIS_END_DATE' title='"+item.PROLEPSIS_END_DATE+"'>"+item.PROLEPSIS_END_DATE+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:140px;text-align: center;text-overflow: ellipsis;' name='TPPB_PLAN_DELIVERY_DATE' title='"+item.TPPB_PLAN_DELIVERY_DATE+"'>"+item.TPPB_PLAN_DELIVERY_DATE+"</td>");
                        dataHtml.push("</tr>");
                    });
                    $("#tbody_454cc1d04a9240f4868ccffb52793896").html(dataHtml.join(""));
                }
                pageFun(data.ajaxPage,"formId1");
                defTableWidthRewrite("454cc1d04a9240f4868ccffb52793896"); 
                showLoading(false);
            },
            error:function(error){
                showLoading(false);
            }
        });
    }
    catch(error){
        console.error(error);
    }
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
 //获取数据访问类URL
 function getUrl(){
        try{
            return "${path}buss/bussModel_exeFunc.ms?funcMId=8c1a02fed7ac404ca041c988b616b98d"; 
        }
        catch(error){
            console.error(error);
        }
    }
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
