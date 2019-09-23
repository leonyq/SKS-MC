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
		<dict:lang value="工序完工报告" />
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
		<bu:header formId ="9b18994844b049f2ad90204b77793334"/>

    
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
		<bu:func viewId="eab78263acd14071ac0cb7fcb9d30147" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="eab78263acd14071ac0cb7fcb9d30147" /> 

  </table>

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
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9b18994844b049f2ad90204b77793334">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9b18994844b049f2ad90204b77793334" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9b18994844b049f2ad90204b77793334">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9b18994844b049f2ad90204b77793334">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            <td style="width:30px;text-align: center;"></td>
            <td style="width:30px;text-align: center;"></td>
            <td style="width:100px;text-align: center;"><dict:lang value="制令单号"/></td>
            <td style="width:150px;text-align: center;"><dict:lang value="机种"/></td>
            <td style="width:150px;text-align: center;"><dict:lang value="机种名称"/></td>
            <td style="width:150px;text-align: center;"><dict:lang value="机种规格"/></td>
            <td style="width:70px;text-align: center;"><dict:lang value="状态"/></td>
            <td style="width:100px;text-align: center;"><dict:lang value="计划数量"/></td>
            <td style="width:100px;text-align: center;"><dict:lang value="投入数量"/></td>
            <td style="width:100px;text-align: center;"><dict:lang value="完工数量"/></td>
            <td style="width:130px;text-align: center;"><dict:lang value="预计开工时间"/></td>
            <td style="width:130px;text-align: center;"><dict:lang value="预计完工时间"/></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 scroll1 datagrid-body-ajax" id="tableDiv9b18994844b049f2ad90204b77793334" onscroll="ajaxTableScroll(this,'9b18994844b049f2ad90204b77793334')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9b18994844b049f2ad90204b77793334">
		<tbody id="tbody_9b18994844b049f2ad90204b77793334" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9b18994844b049f2ad90204b77793334==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('9b18994844b049f2ad90204b77793334','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>制令单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PM_MO_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PM_MO_NUMBER" value="" title_name="制令单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产阶别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PM_PRODUCT_STEP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PM_PRODUCT_STEP" value="" title_name="生产阶别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>SMT轨道</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PM_TRACK" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PM_TRACK" value="" title_name="SMT轨道" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>PCB料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PM_PCB_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PM_PCB_CODE" value="" title_name="PCB料号" />px
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
		<bu:submit viewId="eab78263acd14071ac0cb7fcb9d30147" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="eab78263acd14071ac0cb7fcb9d30147" />
<script>
    //变量
    var dataUrl;
    $(function(){
        initial();
        query("formId1");
    });
    //初始化函数
    function initial(){
        try{
            //初始化数据URL
            dataUrl=getDataUrl();
        }
        catch(error){
            console.error(error);
        }
    }
    //数据交互类URL
    function getDataUrl(){
        return "${path}buss/bussModel_exeFunc.ms?funcMId=0a55ece729dd4e39b29eee961b8ad495";
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
            //查询条件
            paramData.startTime=$("#PM_SCHEDULE_DATE_BEGIN").val();
            paramData.endTime=$("#PM_SCHEDULE_DATE_END").val();
            paramData.dataAuth=$("#DATA_AUTH").val();
            paramData.moNumber=$("#PM_MO_NUMBER_SHOW").val();
            paramData.itemCode=$("#PM_MODEL_CODE_SHOW").val();
            //执行查询
            paramData.opt="getMoNumberInfo";
            showLoading(true);
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                data:paramData,
                success:function(data){
                    $("#tbody_9b18994844b049f2ad90204b77793334").empty();
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        var dataHtml=[];
                        data.ajaxList.forEach(function(item,index,array){
                            dataHtml.push("<tr id='"+item.ID+"' class='datagrid-row'>");
                            dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center; text-overflow: ellipsis;' name='index'>"+(index+1)+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;text-overflow: ellipsis;' name='id'><input id='"+item.ID+"' type='radio' monumber='"+item.PM_MO_NUMBER+"' style='height:14px;width:14px;' onclick='radioClick(this);'></td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: left;text-overflow: ellipsis;' name='PM_MO_NUMBER'>"+item.PM_MO_NUMBER+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='PM_MODEL_CODE'>"+item.PM_MODEL_CODE+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='CI_ITEM_NAME'>"+item.CI_ITEM_NAME+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='CI_ITEM_SPEC'>"+item.CI_ITEM_SPEC+"</td>");

                            var status=item.PM_STATUS;
                            var colorSpan="";
                            if(status=="0"){
                                colorSpan="<span class='state' style='background-color:rgb(78, 157, 15);color:#FFFFFF;width:50px;text-overflow: ellipsis;'>"+item.STATUS_TEXT+"</span>";
                            }
                            else if(status=="1"){
                                colorSpan="<span class='state' style='background-color:rgb(0, 160, 233);color:#FFFFFF;width:50px;text-overflow: ellipsis;'>"+item.STATUS_TEXT+"</span>";
                            }
                            else if(status=="2"){
                                colorSpan="<span class='state' style='background-color:rgb(174, 174, 174);color:#FFFFFF;width:50px;text-overflow: ellipsis;'>"+item.STATUS_TEXT+"</span>";
                            }

                            dataHtml.push("<td class='datagrid-cell' style='width:70px;text-align: center;text-overflow: ellipsis;' name='STATUS_TEXT'>"+colorSpan+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: left;text-overflow: ellipsis;' name='PM_TARGET_QTY'>"+item.PM_TARGET_QTY+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: left;text-overflow: ellipsis;' name='PM_INPUT_COUNT'>"+item.PM_INPUT_COUNT+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='PM_FINISH_COUNT'>"+item.PM_FINISH_COUNT+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:130px;text-align: right;text-overflow: ellipsis;' name='PROLEPSIS_START_DATE'>"+item.PM_SCHEDULE_DATE+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:130px;text-align: right;text-overflow: ellipsis;' name='PROLEPSIS_END_DATE'>"+item.PM_DUE_DATE+"</td>");
                            dataHtml.push("</tr>");
                        });
                        $("#tbody_9b18994844b049f2ad90204b77793334").html(dataHtml.join(""));
                    }
                    pageFun(data.ajaxPage,"formId1");
                    selectRow("datagrid-btable-ajax9b18994844b049f2ad90204b77793334");
                    showLoading(false);
                    	defTableWidthRewrite("9b18994844b049f2ad90204b77793334");
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
    //单选框点击事件
    function radioClick(radio){
        try{
            //清除所有选中radio
            $("#datagrid-btable-ajax9b18994844b049f2ad90204b77793334 input[type='radio']").each(function(){
                if ($(this).attr("checked")) {
                    $(this).prop("checked",false);
                    $(this).parents("tr").css("background-color","");
                }
            });
            $(radio).prop("checked",true);
            $(radio).css("background-color","#d3eafc");
        }
        catch(error){
            console.error(error);
        }
    }
    //点击行的时候，选中整行
    function selectRow(tableId){
        $("#"+tableId+" tr").unbind("click");
        $("#"+tableId+" tr input[type=radio]").unbind("click");
        $("#"+tableId+" tr").on("click",function(e){
            var trId = $(this).attr("id");
            if ($("#"+trId+" :radio").attr("checked")) {
                $("#"+trId+" :radio").prop("checked",false);
                $("#"+trId).css("background-color","");
            }else{
                $("#"+tableId+" input[type='radio']").each(function(){
                    if ($(this).attr("checked")) {
                        $(this).prop("checked",false);
                        $(this).parents("tr").css("background-color","");
                    }
                });
                $("#"+trId+" :radio").prop("checked",true);
                $("#"+trId).css("background-color","#d3eafc");
            }
        });

        $("#"+tableId+" tr input[type=radio]").click(function(e) {
            e.stopPropagation();
            var style = $(this).parents("tr").attr("style");
            if(style && style.indexOf("background-color") > -1){
                $(this).parents("tr").css("background-color","");
            }else{
                $(this).parents("tr").css("background-color","#d3eafc");
            }
        });
    }
    //报工
    function report(){
        try{
            //获取选中的制令单号
            var radioBox=$("#datagrid-btable-ajax9b18994844b049f2ad90204b77793334 :radio[checked='checked']");
            if(radioBox.length<=0){
                utilsFp.confirmIcon(1,"","","","<dict:lang value='请选择一条记录！'/>",0,"260","");
                return;
            }
            var moNumber=$(radioBox[0]).attr("monumber");
            var urlDetail = "${path}buss/bussModel.ms?exeid=137c003477bb4cfa9e179a7e6d631d10&formId=9b18994844b049f2ad90204b77793334&monumber="+moNumber;
            showPopWinFp(urlDetail , 700, 270,null,"<dict:lang value='工序报工'/>","");
        }
        catch(error){
            console.error(error);
        }
    }	
    //刷新数据
    function refershList(){
        setTimeout(() => {
            query("formId1");
        }, 0);
    }
</script>
<script>
(function($){
    $(window).on('load',function(){
        setPopScroll('.scroll1','.datagrid-header-inner');
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
