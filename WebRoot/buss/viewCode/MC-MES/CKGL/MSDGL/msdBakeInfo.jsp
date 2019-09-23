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
		<dict:lang value="VM-MSD烘烤信息" />
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
		<bu:header formId ="74f6e7381e4847469baae8ee6646cde1"/>
    
    
     
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		        <div class="group"><span class="txt" title="等于">烘烤时间</span><div class="dec">
					<input id="WMI_BAKE_TIME_BEGIN" name="searchParaList[0]._PAGE_SEARCH_VALUE" value="" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly"></div><span class="txt">~</span><div class="dec">
					<input id="WMI_BAKE_TIME_END" name="searchParaList[0]._PAGE_SEARCH_VALUE" value="" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly"></div>     <input type="hidden" name="searchParaList[0].ID" value="0fa74a91639c4ae4a6eea14bf0a6b700">
				</div>
				<div class="optn"> <button type="button" onclick="SearchDetailFun('formId4');"><i class="ico ico-search-new"></i>查询</button></div>
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="e547cef17dcc4ee08dead02b0ea8fc0d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage74f6e7381e4847469baae8ee6646cde1" id="formPage74f6e7381e4847469baae8ee6646cde1" value="${formPage74f6e7381e4847469baae8ee6646cde1}"/>
		<input type="hidden" name="formId" id="formId1" value='74f6e7381e4847469baae8ee6646cde1'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="74f6e7381e4847469baae8ee6646cde1">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax74f6e7381e4847469baae8ee6646cde1" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner74f6e7381e4847469baae8ee6646cde1">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable74f6e7381e4847469baae8ee6646cde1" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="74f6e7381e4847469baae8ee6646cde1" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_74f6e7381e4847469baae8ee6646cde1" onclick="_selectAjaxTableAllData(this,'74f6e7381e4847469baae8ee6646cde1')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_ITEM_SN" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_BAKE_STATE" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_ITEM_CODE" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CI_ITEM_NAME" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CI_ITEM_SPEC" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSR_RULE_NAME" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_WORK_AREA" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSRD_BAKE_TEMP" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSR_BAKE_LIMIT" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_BAKE_TOTAL" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_BAKE_LENGTH" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSRD_BAKE_MAX" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_BAKE_BAKETIMES" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_BAKE_TIME" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_BAKE_EXPECTENDDATA" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_BAKE_MAX" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			
			
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSR_BAKE_TIMES" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_BAKE_TIMES" formId="74f6e7381e4847469baae8ee6646cde1" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv74f6e7381e4847469baae8ee6646cde1" onscroll="ajaxTableScroll(this,'74f6e7381e4847469baae8ee6646cde1')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax74f6e7381e4847469baae8ee6646cde1" >
		<tbody id="tbody_74f6e7381e4847469baae8ee6646cde1" class="isParents" >
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage74f6e7381e4847469baae8ee6646cde1==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchDetailFun&formId=formId4&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="e547cef17dcc4ee08dead02b0ea8fc0d" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="e547cef17dcc4ee08dead02b0ea8fc0d" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
$(function(){
    init();
    getTable();
    //SearchDetailFun('formId4');
	
})
function init(){
                   
        $(document.getElementById('WMI_BAKE_TIME_BEGIN')).val(timeBeginString());
        $(document.getElementById('WMI_BAKE_TIME_END')).val(timeEndString());
        //SearchDetailFun('formId4');
        
        
                
 }
           function timeBeginString(){
    			var datetime = new Date();
    			datetime.setDate(datetime.getDate()-30);
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			return year + "-" + month + "-" + date+" 00:00:00";
    		}
    
    		function timeEndString(){
    			var datetime = new Date();
    			
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			
    			return year + "-" + month + "-" + date+" 23:59:59";
    		}
		function getEndDay(date1){
             //构造当前日期对象
           var date = new Date();
           var year = date.getFullYear();
            //获取当前月份
           var mouth = date.getMonth();
           var days;
           if (mouth == 2) {
               days = year %4 == 0 ? 29: 28;
           }else if(mouth == 1 || mouth == 3 || mouth == 5 || mouth == 7 ||mouth == 8 ||mouth == 8 ||mouth == 12){
               days = 31;
           }else{
               days = 30;
           }
           return Number(days)+Number(date1)-30;
        }
var trcount=0;
function getTable(){
 
 var begin= $(document.getElementById('WMI_BAKE_TIME_BEGIN')).val();
 var end = $(document.getElementById('WMI_BAKE_TIME_END')).val();

 var GetBakeMessageUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=b2c38824650a40faa636c4466fd29218";
    $.ajax({
        type:"post",
        dataTye:"json",
        url:GetBakeMessageUrl,
        data: {
            "begin" : begin,
            "end" : end
        },
        //data:"begin="+begin+"&end="+end,
        success:function(data){
           
            $("#tbody_74f6e7381e4847469baae8ee6646cde1").empty();
            if(null==data){
                return;
            }
            if(null!=data.ajaxPage.dataList){
                
                var list = eval(data.ajaxPage.dataList);
                
                for(var i=0;i<list.length;i++){
                    if(list[i].DATA_AUTH  ==null) list[i].DATA_AUTH ="";
                    if(list[i].WMI_ITEM_SN  ==null) list[i].WMI_ITEM_SN ="";
                    if(list[i].WMI_BAKE_STATE  ==null) list[i].WMI_BAKE_STATE ="";
                    if(list[i].WMI_ITEM_CODE  ==null) list[i].WMI_ITEM_CODE ="";
                    if(list[i].CI_ITEM_NAME  ==null) list[i].CI_ITEM_NAME ="";
                    if(list[i].CI_ITEM_SPEC  ==null) list[i].CI_ITEM_SPEC ="";
                    if(list[i].WSR_RULE_NAME  ==null) list[i].WSR_RULE_NAME ="";
                    if(list[i].WMI_WORK_AREA  ==null) list[i].WMI_WORK_AREA ="";
                    if(list[i].WMI_BAKE_TEMP  ==null) list[i].WMI_BAKE_TEMP ="";
                    if(list[i].WMI_BAKE_LENGTH  ==null) list[i].WMI_BAKE_LENGTH ="";
                    if(list[i].WSRD_BAKE_MAX  ==null) list[i].WSRD_BAKE_MAX ="";
                    if(list[i].WMI_BAKE_BAKETIMES  ==null) list[i].WMI_BAKE_BAKETIMES ="";
                    if(list[i].WMI_BAKE_TIME  ==null) list[i].WMI_BAKE_TIME ="";
                    if(list[i].WMI_BAKE_EXPECTENDDATA  ==null) list[i].WMI_BAKE_EXPECTENDDATA ="";
                    if(list[i].WMI_BAKE_MAX  ==null) list[i].WMI_BAKE_MAX ="";
                    if(list[i].WSR_BAKE_LIMIT  ==null) list[i].WSR_BAKE_LIMIT ="";
                    if(list[i].WMI_BAKE_TOTAL  ==null) list[i].WMI_BAKE_TOTAL ="";
                    if(list[i].WSR_BAKE_TIMES  ==null) list[i].WSR_BAKE_TIMES ="";
                    if(list[i].WMI_BAKE_TIMES  ==null) list[i].WMI_BAKE_TIMES ="";   
                      if(list[i].WMI_BAKE_LIMIT  ==null) list[i].WMI_BAKE_LIMIT ="";  
                        if(list[i].TIME_MAX  ==null) list[i].TIME_MAX ="";
                    if(list[i].NAME  ==null) list[i].NAME ="";
                     if(list[i].WA_AREA_NAME  ==null) list[i].WA_AREA_NAME ="";		

                    $("#tbody_74f6e7381e4847469baae8ee6646cde1" ).append("<tr id='tr"+list[i].ID+"'></tr>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+trcount+"' type='checkbox' name='isSelect' class='_selectdata'  /></td>");
                   	$("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-3 TD_DATA_AUTH ' style='width:200px;text-align: center;' title='"+list[i].NAME+"' >"+list[i].NAME+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].DATA_AUTH+"' /></td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+list[i].WMI_ITEM_SN+"' ><span onclick='itemJump1(\""+list[i].WMI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].WMI_ITEM_SN+"</span></td>");
                    if(list[i].WMI_BAKE_STATE=="烘烤超时"){
                         $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:120px;text-align:center' title='"+list[i].WMI_BAKE_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:80px;text-align:center;'>"+list[i].WMI_BAKE_STATE+"</span></td>");
                    }else if(list[i].WMI_BAKE_STATE=="烘烤中"){
                         $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-5' style='width:120px;text-align:center' title='"+list[i].WMI_BAKE_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#ff00ff;color:#FFFFFF;width:80px;text-align:center;'>"+list[i].WMI_BAKE_STATE+"</span></td>");
                    }else{
                        $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-5' style='width:120px;text-align:center' title='"+list[i].WMI_BAKE_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:80px;text-align:center;'>"+list[i].WMI_BAKE_STATE+"</span></td>");
                    }
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+list[i].WMI_ITEM_CODE+"' ><span onclick='itemJump2(\""+list[i].WMI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].WMI_ITEM_CODE+"</span></td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:100px;text-align: left;' title='"+list[i].WSR_RULE_NAME+"' ><span onclick='itemJump3(\""+list[i].WSR_RULE_NAME+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].WSR_RULE_NAME+"</span></td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: left;' title='"+list[i].WA_AREA_NAME+"' >"+list[i].WA_AREA_NAME+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_TEMP+"' >"+list[i].WMI_BAKE_TEMP+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_LIMIT+"' >"+list[i].WMI_BAKE_LIMIT+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_TOTAL+"' >"+list[i].WMI_BAKE_TOTAL+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_LENGTH+"' >"+list[i].WMI_BAKE_LENGTH+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:80px;text-align: right;' title='"+list[i].TIME_MAX+"' >"+list[i].TIME_MAX+"</td>");
                    
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_BAKETIMES+"' >"+list[i].WMI_BAKE_BAKETIMES+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:150px;text-align: center;' title='"+list[i].WMI_BAKE_TIME+"' >"+list[i].WMI_BAKE_TIME+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:150px;text-align: center;' title='"+list[i].WMI_BAKE_EXPECTENDDATA+"' >"+list[i].WMI_BAKE_EXPECTENDDATA+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:150px;text-align: right;' title='"+list[i].WMI_BAKE_MAX+"'>"+list[i].WMI_BAKE_MAX+"</td>");
                    
                    
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:80px;text-align: right;' title='"+list[i].WSR_BAKE_TIMES+"' >"+list[i].WSR_BAKE_TIMES+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:120px;text-align: right;' title='"+list[i].WMI_BAKE_TIMES+"'>"+list[i].WMI_BAKE_TIMES+"</td>");
                    trcount++;
                }
                pageFun(data.ajaxPage,"formId4");
				var tableTrJs = $("#datagrid-btable-ajax74f6e7381e4847469baae8ee6646cde1 tbody tr");
				_tongLineColor(tableTrJs);
				clickTr('datagrid-btable-ajax74f6e7381e4847469baae8ee6646cde1');
				defTableWidthRewrite('74f6e7381e4847469baae8ee6646cde1');
				
            }
        },
    	error:function(msg){
    			  util.closeLoading();
    			utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    			    	    
    	}
 
    });
    
     
}
//查询分页
    	var paginationImpl={};
		function  SearchDetailFun(paginationImpl,url){
		       
		    	util.showLoading("处理中...");
		    	
		    	var isFirstLoad = firstLoadThisPage(paginationImpl);
    			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    			
    			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    			var DATA_AUTH = $(document.getElementById('DATA_AUTH')).val();
    			var WMI_ITEM_SN = $(document.getElementById('WMI_ITEM_SN')).val();
    			var WMI_ITEM_CODE = $(document.getElementById('WMI_ITEM_CODE_SHOW')).val();
    			var CI_ITEM_NAME = $(document.getElementById('CI_ITEM_NAME')).val();
    			var begin= $(document.getElementById('WMI_BAKE_TIME_BEGIN')).val();
    			var end = $(document.getElementById('WMI_BAKE_TIME_END')).val();
    		
			var GetBakePageUrl="${path}buss/bussModel_exeFunc.ms?funcMId=80ee45c7202d4824b4a35857461b2eb0";
			$.ajax({
				    type: "POST",
			    	dataType: "json",
			    	url: GetBakePageUrl,
			    	data:
			    	{
			    	    "DATA_AUTH" : DATA_AUTH,
			    	    "begin" : begin,
			    	    "end" : end,
			    	    "WMI_ITEM_SN" : WMI_ITEM_SN,
			    	    "WMI_ITEM_CODE" : WMI_ITEM_CODE,
			    	    "CI_ITEM_NAME" : CI_ITEM_NAME,
			    	    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    	},
			  success:function(data){
            	
                  $("#tbody_74f6e7381e4847469baae8ee6646cde1").empty();
                if(null==data){
                    return;
                }
                if(null!=data.ajaxPage.dataList){
                    
                      var list = eval(data.ajaxPage.dataList);
                    for(var i=0;i<list.length;i++){
                    if(list[i].DATA_AUTH  ==null) list[i].DATA_AUTH ="";
                    if(list[i].WMI_ITEM_SN  ==null) list[i].WMI_ITEM_SN ="";
                    if(list[i].WMI_BAKE_STATE  ==null) list[i].WMI_BAKE_STATE ="";
                    if(list[i].WMI_ITEM_CODE  ==null) list[i].WMI_ITEM_CODE ="";
                    if(list[i].CI_ITEM_NAME  ==null) list[i].CI_ITEM_NAME ="";
                    if(list[i].CI_ITEM_SPEC  ==null) list[i].CI_ITEM_SPEC ="";
                    if(list[i].WSR_RULE_NAME  ==null) list[i].WSR_RULE_NAME ="";
                    if(list[i].WMI_WORK_AREA  ==null) list[i].WMI_WORK_AREA ="";
                    if(list[i].WMI_BAKE_TEMP  ==null) list[i].WMI_BAKE_TEMP ="";
                    if(list[i].WMI_BAKE_LENGTH  ==null) list[i].WMI_BAKE_LENGTH ="";
                    if(list[i].WSRD_BAKE_MAX  ==null) list[i].WSRD_BAKE_MAX ="";
                    if(list[i].WMI_BAKE_BAKETIMES  ==null) list[i].WMI_BAKE_BAKETIMES ="";
                    if(list[i].WMI_BAKE_TIME  ==null) list[i].WMI_BAKE_TIME ="";
                    if(list[i].WMI_BAKE_EXPECTENDDATA  ==null) list[i].WMI_BAKE_EXPECTENDDATA ="";
                    if(list[i].WMI_BAKE_MAX  ==null) list[i].WMI_BAKE_MAX ="";
                    if(list[i].WSR_BAKE_LIMIT  ==null) list[i].WSR_BAKE_LIMIT ="";
                    if(list[i].WMI_BAKE_TOTAL  ==null) list[i].WMI_BAKE_TOTAL ="";
                    if(list[i].WSR_BAKE_TIMES  ==null) list[i].WSR_BAKE_TIMES ="";
                    if(list[i].WMI_BAKE_TIMES  ==null) list[i].WMI_BAKE_TIMES ="";   
                    if(list[i].WMI_BAKE_LIMIT  ==null) list[i].WMI_BAKE_LIMIT ="";   
                    if(list[i].TIME_MAX  ==null) list[i].TIME_MAX =""; 
                    if(list[i].NAME  ==null) list[i].NAME ="";
                    if(list[i].WA_AREA_NAME  ==null) list[i].WA_AREA_NAME ="";
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1" ).append("<tr id='tr"+((currentPage-1)*pageRecord+(i+1))+"'></tr>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+trcount+"' type='checkbox' name='isSelect' class='_selectdata'  /></td>");
                   	$("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-3 TD_DATA_AUTH ' style='width:200px;text-align: center;' title='"+list[i].NAME+"'  >"+list[i].NAME+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].DATA_AUTH+"' /></td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+list[i].WMI_ITEM_SN+"' ><span onclick='itemJump1(\""+list[i].WMI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].WMI_ITEM_SN+"</span></td>");
                    if(list[i].WMI_BAKE_STATE=="烘烤超时"){
                         $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:120px;text-align:center' title='"+list[i].WMI_BAKE_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:80px;text-align:center;'>"+list[i].WMI_BAKE_STATE+"</span></td>");
                    }else if(list[i].WMI_BAKE_STATE=="烘烤中"){
                         $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-5' style='width:120px;text-align:center' title='"+list[i].WMI_BAKE_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#ff00ff;color:#FFFFFF;width:80px;text-align:center;'>"+list[i].WMI_BAKE_STATE+"</span></td>");
                    }else{
                        $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-5' style='width:120px;text-align:center' title='"+list[i].WMI_BAKE_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:80px;text-align:center;'>"+list[i].WMI_BAKE_STATE+"</span></td>");
                    }
                     $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+list[i].WMI_ITEM_CODE+"' ><span onclick='itemJump2(\""+list[i].WMI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].WMI_ITEM_CODE+"</span></td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:100px;text-align: left;' title='"+list[i].WSR_RULE_NAME+"' ><span onclick='itemJump3(\""+list[i].WSR_RULE_NAME+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].WSR_RULE_NAME+"</span></td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: left;' title='"+list[i].WA_AREA_NAME+"' >"+list[i].WA_AREA_NAME+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_TEMP+"' >"+list[i].WMI_BAKE_TEMP+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_LIMIT+"' >"+list[i].WMI_BAKE_LIMIT+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:80px;text-align: right;'title='"+list[i].WMI_BAKE_TOTAL+"' >"+list[i].WMI_BAKE_TOTAL+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_LENGTH+"' >"+list[i].WMI_BAKE_LENGTH+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:80px;text-align: right;' title='"+list[i].TIME_MAX+"' >"+list[i].TIME_MAX+"</td>");
                    
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:80px;text-align: right;' title='"+list[i].WMI_BAKE_BAKETIMES+"' >"+list[i].WMI_BAKE_BAKETIMES+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:150px;text-align: center;'title='"+list[i].WMI_BAKE_TIME+"' >"+list[i].WMI_BAKE_TIME+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:150px;text-align: center;' title='"+list[i].WMI_BAKE_EXPECTENDDATA+"' >"+list[i].WMI_BAKE_EXPECTENDDATA+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:150px;text-align: right;' title='"+list[i].WMI_BAKE_MAX+"' >"+list[i].WMI_BAKE_MAX+"</td>");
                    
                    
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:80px;text-align: right;' title='"+list[i].WSR_BAKE_TIMES+"'>"+list[i].WSR_BAKE_TIMES+"</td>");
                    $("#tbody_74f6e7381e4847469baae8ee6646cde1 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:120px;text-align: right;' title='"+list[i].WMI_BAKE_TIMES+"' >"+list[i].WMI_BAKE_TIMES+"</td>");
                    trcount++;
                }
                      pageFun(data.ajaxPage,"formId4");
			    	var tableTrJs = $("#datagrid-btable-ajax74f6e7381e4847469baae8ee6646cde1 tbody tr");
				    _tongLineColor(tableTrJs);
				    clickTr('datagrid-btable-ajax74f6e7381e4847469baae8ee6646cde1');
				    defTableWidthRewrite('74f6e7381e4847469baae8ee6646cde1');
                }
                },
    			    	error:function(msg){
    			    	    util.closeLoading();
    						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    			    	    
    			    	}
                });
    	}
    	function clickTr(tableId){
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
<%--生成异步表格--%>
function createTableModel(ms,formId){
    
}


</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//MSD作业日志
function itemJump1(obj){
      winOptMethod.jump("9d08f2000ba34d05bcc700706532326a","F7151","jumpId",obj);
}  


//物料信息
function itemJump2(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//MSD管控规则
function itemJump3(obj){
    winOptMethod.jump("8eaf6497a2404891945f03d179bcb062","F7028","jumpId",obj);
} 


</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>

<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<bu:submit viewId="e547cef17dcc4ee08dead02b0ea8fc0d" />
<bu:script viewId="e547cef17dcc4ee08dead02b0ea8fc0d" />
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
