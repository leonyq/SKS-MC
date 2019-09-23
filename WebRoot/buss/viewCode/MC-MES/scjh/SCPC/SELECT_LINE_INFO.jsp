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
		<dict:lang value="选择线别" />
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
		<bu:header formId ="334ae8dac2684a3289964a13b26049cd"/>

    
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
                <div class="optn">
			        <button type="button" onclick="returnLine();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
			        <button type="button" onclick="query('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			    </div>
            </div>
            <div class="bd">
                <div class="search-box">
                    <table classs="search_table">
                        <tbody>
                        <tr>
                            <td> 
                                <div class="group">
                                    <div class="name" title="<dict:lang value='等于'/>"><dict:lang value="阶别"/></div>
                                    <div class="dec">
                                        <select id="q_step" name="q_step" class="dept_select"></select>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage334ae8dac2684a3289964a13b26049cd" id="formPage334ae8dac2684a3289964a13b26049cd" value="${formPage334ae8dac2684a3289964a13b26049cd}"/>
		<input type="hidden" name="formId" id="formId1" value='334ae8dac2684a3289964a13b26049cd'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="334ae8dac2684a3289964a13b26049cd">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax334ae8dac2684a3289964a13b26049cd" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner334ae8dac2684a3289964a13b26049cd">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable334ae8dac2684a3289964a13b26049cd">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            <td style="width:30px;text-align: center;"></td>
            <td style="width:30px;text-align: center;"><input id="allcheck" type="checkbox" style='height:14px;width:14px;' onchange="selectall('allcheck','tbody_334ae8dac2684a3289964a13b26049cd');"></td>
            <td style="width:150px;text-align: center;"><dict:lang value="线别代码"/></td>
            <td style="width:150px;text-align: center;"><dict:lang value="线别名称"/></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv334ae8dac2684a3289964a13b26049cd" onscroll="ajaxTableScroll(this,'334ae8dac2684a3289964a13b26049cd')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax334ae8dac2684a3289964a13b26049cd">
		<tbody id="tbody_334ae8dac2684a3289964a13b26049cd" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage334ae8dac2684a3289964a13b26049cd==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('334ae8dac2684a3289964a13b26049cd','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>生产阶别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPQ_PRODUCT_STEP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPQ_PRODUCT_STEP" value="" title_name="生产阶别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>线别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPQ_AREA_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPQ_AREA_SN" value="" title_name="线别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>设备系数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPQ_DEVICE_QUOTIETY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPQ_DEVICE_QUOTIETY" value="" title_name="设备系数" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>人力系数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPQ_MANPOWER_QUOTIETY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPQ_MANPOWER_QUOTIETY" value="" title_name="人力系数" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>效率系数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPQ_EFFICIENCY_QUOTIETY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPQ_EFFICIENCY_QUOTIETY" value="" title_name="效率系数" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>品质系数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPQ_QUALITY_QUOTIETY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPQ_QUALITY_QUOTIETY" value="" title_name="品质系数" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>SMT双轨系数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PPQ_DUAL_QUOTIETY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PPQ_DUAL_QUOTIETY" value="" title_name="SMT双轨系数" />px
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
		<bu:submit viewId="1d63aee639fc44bfbc61f62026031b7c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
        <bu:script viewId="1d63aee639fc44bfbc61f62026031b7c" />
<script>
//变量
var dataUrl;
var exceptionnotexist='${param.exceptionnotexist}';
var exceptLine='${param.except}';
//界面加载函数
$(function(){
    //获取数据访问类URL
    dataUrl=getUrl();
    //绑定阶别
    bindStep();
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
        //获取查询条件
        var step=$("#q_step").val();
        //获取线体信息
        showLoading(true);
        $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            data:{
                opt:"getLineInfo",
                step:step,
                exceptionnotexist:exceptionnotexist,
                exceptLine:exceptLine,
                currentPage:currentPage,
                pageRecord:pageRecord
            },
            success:function(data){
                //清空数据列表
                $("#tbody_334ae8dac2684a3289964a13b26049cd").empty();
                if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
                    var dataHtml=[];
                    data.ajaxList.forEach(function(item,index,array){
                        dataHtml.push("<tr id='"+item.CA_ID+"' class='datagrid-row'>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center; text-overflow: ellipsis;' name='index'>"+(index+1)+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;text-overflow: ellipsis;' name='id'><input id='"+item.CA_ID+"' type='checkbox' name='lineInfo' linesn='"+item.CA_ID+"' linename='"+item.CA_NAME+"' style='height:14px;width:14px;'></td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='CI_ITEM_NAME'>"+item.CA_ID+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='CI_ITEM_SPEC'>"+item.CA_NAME+"</td>");
                        dataHtml.push("</tr>");
                    });
                    $("#tbody_334ae8dac2684a3289964a13b26049cd").html(dataHtml.join(""));
                }
                pageFun(data.ajaxPage,"formId1");
                selectRow("datagrid-btable-ajax334ae8dac2684a3289964a13b26049cd");
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
//选中所有记录
function selectall(checkboxid,tbodyid){
	 try{
		 var isChecked=$("#"+checkboxid).attr("checked")=="checked"?true:false;
		 $("#"+tbodyid+" :checkbox").each(function(){
			$(this).attr("checked",isChecked);
		});
	 }
	 catch(error){
       console.error(error);
	 }
 }
//获取数据访问类URL
function getUrl(){
    try{
        return "${path}buss/bussModel_exeFunc.ms?funcMId=7129b4c6175647f69c782eff96cb926c"; 
    }
    catch(error){
        console.error(error);
    }
}
//绑定阶别
function bindStep(){
    try{
        $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            async:false,
            data:{
                opt:"getStep"
            },
            success:function(data){
                $("#q_step").empty();
                $("#q_step").append("<option value='' class='select_name'>--请选择--</option>");
                if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
                    data.ajaxList.forEach(function(item,index,array){
                        $("#q_step").append("<option value='"+item.STEP_CODE+"' class='select_name'>"+item.STEP_NAME+"</option>");
                    });
                }
                $("#q_step").find("option[value='']").attr("selected",true);
                $("#q_step").trigger("chosen:updated");
                resetDropSearch("q_step");
            },
            error:function(error){}
        });
    }
    catch(error){
        console.error(error);
    }
}
//重置下达中线体下拉框搜索功能
function resetDropSearch(id){
    //下达中的下拉框搜索
    $("#"+id).chosen("destroy");
    if($("#"+id+" option").size()>15){
        $("#"+id).chosen({search_contains: true});
            $("#"+id+"_chosen .chosen-search").css("display","block");
    }else{
        $("#"+id).chosen();
    }
}
//确认选中线体
function returnLine(){
    try{
        if($("#tbody_334ae8dac2684a3289964a13b26049cd :checkbox[checked='checked']").length<=0){
            utilsFp.confirmIcon(1,"","","","<dict:lang value='请选择一条记录！'/>",0,"260","");
            return;
        }
        //收集线体信息
        var lineInfo=[];
        var checkBox=$("#tbody_334ae8dac2684a3289964a13b26049cd :checkbox[checked='checked']");
        for(var i=0,len=checkBox.length;i<len;i++){
            lineInfo.push({
                lineSn:$(checkBox[i]).attr("linesn"),
                lineName:$(checkBox[i]).attr("linename")
            });
        }
        //回填
        top.$("#"+window.frameElement.name)[0].contentWindow.$("#linelist").val(JSON.stringify(lineInfo));
	    top.$("#"+window.frameElement.name)[0].contentWindow.returnLineDeal();
        //关闭窗体
        closeTopPopWinFp(window.frameElement.id + "pop");
    }
    catch(error){
        console.error(error);
    }
}
//点击行的时候，选中整行
function selectRow(tableId){
    $("#"+tableId+" tr").unbind("click");
    $("#"+tableId+" tr input[type=checkbox]").unbind("click");
    $("#"+tableId+" tr").on("click",function(e){
        var trId = $(this).attr("id");
        if ($("#"+trId+" :checkbox").attr("checked")) {
            $("#"+trId+" :checkbox").prop("checked",false);
            $("#"+trId).css("background-color","");
        }else{
            $("#"+tableId+" input[type='checkbox']").each(function(){
                if ($(this).attr("checked")) {
                    $(this).prop("checked",false);
                    $(this).parents("tr").css("background-color","");
                }
            });
            $("#"+trId+" :checkbox").prop("checked",true);
            $("#"+trId).css("background-color","#d3eafc");
        }
    });

    $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
        e.stopPropagation();
        var style = $(this).parents("tr").attr("style");
        if(style && style.indexOf("background-color") > -1){
            $(this).parents("tr").css("background-color","");
        }else{
            $(this).parents("tr").css("background-color","#d3eafc");
        }
    });
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
