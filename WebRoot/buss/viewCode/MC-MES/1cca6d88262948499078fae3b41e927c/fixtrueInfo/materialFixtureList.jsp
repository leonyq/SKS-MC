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
		<dict:lang value="VM-制具-列表" />
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
		<bu:header formId ="c3a183e393ea4dfabb15712f9dba1873"/>
	<style>
	    .datagrid-btable tr:nth-of-type(2n){
	        background-color:#f0f4fd;
	    }
	    
	    #tbody_c3a183e393ea4dfabb15712f9dba1873 .datagrid-selected{
	        background-color: #d3eafc;
	    }
	</style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
                <bu:func viewId="5624fca2e39c49f7bea95e1614c232da" />    	
                <!--
                    <form id="searchFormTop" name="searchFormTop" action="#" method="post">
                    	<div id="timeBucketId">
                    	<div class="group">
                    	<span class="txt" title="等于">入库时间</span>
                    	<div class="dec">
                    		<input id="CFI_INSTOCK_TIME_BEGIN" name="searchParaList[0]._PAGE_SEARCH_VALUE" value="" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly">
                    		</div>
                    		<span class="txt">~</span>
                    		<div class="dec">	
                    			<input id="CFI_INSTOCK_TIME_END" name="searchParaList[0]._PAGE_SEARCH_VALUE" value="" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly">
                    		</div> 
                    			<input type="hidden" name="searchParaList[0].ID" value="fe239fa2d8304330a4cb1b2a7d502a8f">
                          </div>
                    </div></form>
                    <div class="optn">  <form id="funForm" name="funForm" action="/mes/buss/bussModel.ms" method="post" target="submitFrame">
                      <input type="hidden" name="exeid" value="5624fca2e39c49f7bea95e1614c232da">
                      <table class="func_table">
                        <tbody><tr>
                          <td width="100%" align="right">
                    <button type="button" id="dbb2400ed6be4125b7b5bbcab259ba2e" value="" onclick="addAjax_s()" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>新增</button>
                    <button type="button" id="2a6945b2eea644f8aae7bdc9f30d08d6" value="" onclick="ajaxEdit()" sytle="" class="botton_img_add"><i class="ico ico-xg "></i>修改</button>
                    <button type="button" id="3f7073e10419434cae1a1455350bbcfd" value="" onclick="_operate_use()" sytle="" class="botton_img_add"><i class="ico ico-recerve "></i>领用</button>
                    <button type="button" id="5109ef84dd0548109e4485f4152ba542" value="" onclick="cfiBack()" sytle="" class="botton_img_add"><i class="ico ico-return "></i>归还</button>
                    <button type="button" id="91c0e5a68caf4082925a00ea7a853b50" value="" onclick="ajaxDel()" sytle="" class="botton_img_add"><i class="ico ico-sc "></i>删除</button>
                    <button type="button" id="74af1a1a69804deb8b370533a68a1741" value="" onclick="_operate_broken()" sytle="" class="botton_img_add"><i class="ico ico-scrap "></i>报废</button>
                    <button type="button" id="74af1a1a69804deb8b370533a68a1741" value="" onclick="disableTin();" sytle="" class="botton_img_add"><i class="ico ico-dj "></i>禁用</button>
                    <button type="button" id="74af1a1a69804deb8b370533a68a1741" value="" onclick="removeDisqble();" sytle="" class="botton_img_add"><i class="ico ico-jd "></i>解禁</button>
                    <button type="button" id="f5558e2f678943fc8f02376e5637d72b" value="" onclick="showDetail()" sytle="" class="botton_img_add"><i class="ico ico-view "></i>查看</button>
                    <button type="button" class="botton_img_add" onclick="SearchDetailFun('c3a183e393ea4dfabb15712f9dba1873');"><i class="ico ico-search-new"></i>查询</button>  
                    
                    </td>
                          </tr>
                      </tbody></table>
                      </form>
                    </div>
                    -->
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		                <bu:search viewId="5624fca2e39c49f7bea95e1614c232da" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagec3a183e393ea4dfabb15712f9dba1873" id="formPagec3a183e393ea4dfabb15712f9dba1873" value="${formPagec3a183e393ea4dfabb15712f9dba1873}"/>
		<input type="hidden" name="formId" id="formId1" value='c3a183e393ea4dfabb15712f9dba1873'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="c3a183e393ea4dfabb15712f9dba1873">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc3a183e393ea4dfabb15712f9dba1873" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc3a183e393ea4dfabb15712f9dba1873">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec3a183e393ea4dfabb15712f9dba1873">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row thcolor" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c3a183e393ea4dfabb15712f9dba1873" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c3a183e393ea4dfabb15712f9dba1873" onclick="_selectAjaxTableAllData(this,'c3a183e393ea4dfabb15712f9dba1873')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:205px;"><bu:uitn colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:95px;"><bu:uitn colNo="CFI_FIX_STATUS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:95px;"><bu:uitn colNo="CFI_FIX_STATE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:80px;" ><bu:uitn colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:155px;"><bu:uitn colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:125px;"><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:125px;" ><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CFI_MT_DATE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:95px;"><bu:uitn colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:115px;" ><bu:uitn colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:95px;"><bu:uitn colNo="CFI_CYCLE_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:115px;" ><bu:uitn colNo="CFI_NOW_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:115px;"><bu:uitn colNo="CFI_REMIND_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
            <td class="datagrid-cell"  style="width:115px;"><bu:uitn colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:115px;"><bu:uitn colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:95px;"><bu:uitn colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:95px;"><bu:uitn colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell"  style="width:80px;"><bu:uitn colNo="CFI_INSTOCK_MAN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CFI_INSTOCK_TIME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			
			
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 scroll" id="tableDivc3a183e393ea4dfabb15712f9dba1873" onscroll="ajaxTableScroll(this,'c3a183e393ea4dfabb15712f9dba1873')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxc3a183e393ea4dfabb15712f9dba1873">
		<tbody id="tbody_c3a183e393ea4dfabb15712f9dba1873" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec3a183e393ea4dfabb15712f9dba1873==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchDetailFun&formId=c3a183e393ea4dfabb15712f9dba1873&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
    	
    	
		<bu:submit viewId="5624fca2e39c49f7bea95e1614c232da" />
		<bu:script viewId="5624fca2e39c49f7bea95e1614c232da" />
	<script type="text/javascript">
	
	$(function(){
    
  // getInfo();
    
    });
var trcount=0;
function getInfo(){
    var DATA_AUTH= $(document.getElementById('DATA_AUTH')).val();
    var getInfoUrl ="${path}buss/bussModel_exeFunc.ms?funcMId=fd42d1338f9f473195d29afda88175b0"; //VM-制具-列表 操作功能 获取制具信息
    $.ajax({
        type:"post",
        dataType:"json",
        data:{'DATA_AUTH':DATA_AUTH},
        url:getInfoUrl,
        success:function(data){
            $("#tbody_c3a183e393ea4dfabb15712f9dba1873").empty();
            if(null==data){
                return;
            }
            if(null!=data.ajaxPage.dataList){
                var list = eval(data.ajaxPage.dataList);
                for(var i=0;i<list.length;i++){
                    if(list[i].DATA_AUTH  ==null) list[i].DATA_AUTH ="";
                    if(list[i].CFI_CYCLE_REMIND  ==null) list[i].CFI_CYCLE_REMIND ="";
                    if(list[i].CFI_NOW_USAGE  ==null) list[i].CFI_NOW_USAGE ="";
                    if(list[i].CFI_REMIND_CYCLE  ==null) list[i].CFI_REMIND_CYCLE ="";
                    if(list[i].CFI_MAX_USAGE  ==null) list[i].CFI_MAX_USAGE ="";
                    if(list[i].CFI_TOTAL_USAGE  ==null) list[i].CFI_TOTAL_USAGE ="";
                    if(list[i].CFI_MT_DATE  ==null) list[i].CFI_MT_DATE ="";
                    if(list[i].CFI_MT_CYCLE  ==null) list[i].CFI_MT_CYCLE ="";
                    if(list[i].CFI_REMIND_DAY  ==null) list[i].CFI_REMIND_DAY ="";
                    if(list[i].CFI_FIX_SN  ==null) list[i].CFI_FIX_SN ="";
                    if(list[i].CFI_FIX_STATUS  ==null) list[i].CFI_FIX_STATUS ="";
                    if(list[i].CFI_ITEM_TYPE  ==null) list[i].CFI_ITEM_TYPE ="";
                    if(list[i].CFI_ITEM_CODE  ==null) list[i].CFI_ITEM_CODE ="";
                    if(list[i].CFI_INSTOCK_MAN  ==null) list[i].CFI_INSTOCK_MAN ="";
                    if(list[i].CFI_INSTOCK_TIME  ==null) list[i].CFI_INSTOCK_TIME ="";
                    if(list[i].ASSISTANTTOOLNAME  ==null) list[i].ASSISTANTTOOLNAME ="";
                    if(list[i].ASSISTANTTOOLSPEC  ==null) list[i].ASSISTANTTOOLSPEC ="";
                    if(list[i].CFI_UPKEEP_PERIOD  ==null) list[i].CFI_UPKEEP_PERIOD ="";
                    if(list[i].CFI_TINCKNESS  ==null) list[i].CFI_TINCKNESS ="";
                    if(list[i].CFI_FLATNESS  ==null) list[i].CFI_FLATNESS ="";
                   // $("#tbody_c3a183e393ea4dfabb15712f9dba1873 " ).append("<tr id='"+list[i].ID+"'  abbr='"+list[i].ID+"'></tr>");
                  // $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' name='ID' value='"+list[i].ID+"' /></td>");
                   $("#tbody_c3a183e393ea4dfabb15712f9dba1873 " ).append("<tr id='"+list[i].ID+"'  abbr='"+list[i].ID+"'></tr>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' name='ID' value='"+list[i].ID+"' /></td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+list[i].ID+"' type='checkbox' value='"+list[i].ID+"' name='c3a183e393ea4dfabb15712f9dba1873$ID' class='isSubmit _selectdata'  /></td>");
                   
                    //$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+list[i].ID+"' type='checkbox' value='"+list[i].ID+"' name='c3a183e393ea4dfabb15712f9dba1873$ID' class='isSubmit _selectdata' /></td>");
                   	 //$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:205px;text-align: center;'>"+list[i].DATA_AUTH+"</td>");
                   	   $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:200px;' title='"+list[i].DATA_AUTH+"'>"+list[i].DATA_AUTH2+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].DATA_AUTH1+"' /></td>");	
                   	$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:205px;text-align: left;'title='"+list[i].CFI_FIX_SN+"'><span onclick='itemJump1(\""+list[i].CFI_FIX_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].CFI_FIX_SN+"</span></td>");
                   	if(list[i].CFI_FIX_STATUS=="0"){
                   	    
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class=''  style='width:5px;' ></span><span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px;text-align:center;'>"+"在库"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="1"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px;text-align:center;'>"+"领用"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="2"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aace36;color:#FFFFFF;width:60px;text-align:center;'>"+"上线"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="3"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px;text-align:center;'>"+"报废"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="4"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px;text-align:center;'>"+"报废"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="5"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#abbad2;color:#FFFFFF;width:60px;text-align:center;'>"+"禁用"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}
                   	
                   	if(list[i].CFI_FIX_STATE=="过期"){
                         $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-6' style='width:95px;text-align:center' title='"+list[i].CFI_FIX_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:60px;text-align:center;'>"+list[i].CFI_FIX_STATE+"</span><input type='hidden' id='STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATE+"'/></td>");
                    }else if(list[i].CFI_FIX_STATE=="到期"){
                         $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-6' style='width:95px;text-align:center' title='"+list[i].CFI_FIX_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#ff00ff;color:#FFFFFF;width:60px;text-align:center;'>"+list[i].CFI_FIX_STATE+"</span><input type='hidden' id='STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATE+"'/></td>");
                    }else if(list[i].CFI_FIX_STATE=="正常"){
                        $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-6' style='width:95px;text-align:center' title='"+list[i].CFI_FIX_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px;text-align:center;'>"+list[i].CFI_FIX_STATE+"</span><input type='hidden' id='STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATE+"'/></td>");
                    }else{
                        $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-6' style='width:95px;text-align:center' title='"+list[i].CFI_FIX_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px;text-align:center;'>"+list[i].CFI_FIX_STATE+"</span><input type='hidden' id='STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATE+"'/></td>");
                    }
                   
                   if(list[i].CFI_ITEM_TYPE=="0"){
                       	$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>"+"锡膏"+"</td>");
                   }else if(list[i].CFI_ITEM_TYPE=="1"){
                       $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>"+"胶水"+"</td>");
                   }else if(list[i].CFI_ITEM_TYPE=="2"){
                       $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>"+"钢网"+"</td>");
                   }else if(list[i].CFI_ITEM_TYPE=="3"){
                       $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>"+"刮刀"+"</td>");
                   }
                   
                   	$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:155px;text-align: left;' title='"+list[i].CFI_ITEM_CODE+"'><span onclick='itemJump2(\""+list[i].CFI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].CFI_ITEM_CODE+"</span></td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:125px;text-align: center;'>"+list[i].ASSISTANTTOOLNAME+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:125px;text-align: left;'>"+list[i].ASSISTANTTOOLSPEC+"</td>");
                    
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: center;'>"+list[i].CFI_MT_DATE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:95px;text-align: right;'>"+list[i].CFI_UPKEEP_PERIOD+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:115px;text-align: right;'>"+list[i].CFI_REMIND_DAY+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:95px;text-align: right;'>"+list[i].CFI_CYCLE_REMIND+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:115px;text-align: right;'>"+list[i].CFI_NOW_USAGE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:115px;text-align: right;'>"+list[i].CFI_REMIND_CYCLE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:115px;text-align: right;'>"+list[i].CFI_MAX_USAGE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:115px;text-align: right;'>"+list[i].CFI_TOTAL_USAGE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:95px;text-align: right;'>"+list[i].CFI_TINCKNESS+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:95px;text-align: right;' title='"+list[i].CFI_FLATNESS+"'>"+list[i].CFI_FLATNESS+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:80px;text-align: center;'>"+list[i].CFI_INSTOCK_MAN+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-22' style='width:150px;text-align: center;'>"+list[i].CFI_INSTOCK_TIME+"</td>");
                    //$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-23' style='width:205px;text-align: center;'>"+list[i].DATA_AUTH+"</td>");
                    trcount++;
                }
                
			
            }
            pageFun(data.ajaxPage,"c3a183e393ea4dfabb15712f9dba1873");
				var tableTrJs = $("#datagrid-btable-ajaxc3a183e393ea4dfabb15712f9dba1873 tbody tr");
				_tongLineColor(tableTrJs);
				
				clickTr('datagrid-btable-ajaxc3a183e393ea4dfabb15712f9dba1873');	
				defTableWidthRewrite("c3a183e393ea4dfabb15712f9dba1873");
            
        },
        error:function(msg){
            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
        
    });
}
//查询分页
    	var paginationImpl={};
		function  SearchDetailFun(paginationImpl){
		       
		    	//util.showLoading("处理中...");
		    	
		    	var isFirstLoad = firstLoadThisPage(paginationImpl);
    			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    			
    			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    			var DATA_AUTH = $(document.getElementById('DATA_AUTH')).val();
    			var CFI_FIX_SN = $(document.getElementById('CFI_FIX_SN')).val();
    			var CFI_ITEM_CODE = $(document.getElementById('CFI_ITEM_CODE')).val();
    			var CFI_ITEM_TYPE = $(document.getElementById('CFI_ITEM_TYPE')).val();
    			var CFI_FIX_STATUS = $(document.getElementById('CFI_FIX_STATUS')).val();
    			var begin= $(document.getElementById('CFI_INSTOCK_TIME_BEGIN')).val();
    			var end = $(document.getElementById('CFI_INSTOCK_TIME_END')).val();
    			
			var GetBakePageUrl="${path}buss/bussModel_exeFunc.ms?funcMId=942a277410674b9b8962471f7e5a524e";//VM-制具-列表 操作功能 制具信息分页
			$.ajax({
				    type: "POST",
			    	dataType: "json",
			    	url: GetBakePageUrl,
			    	data:{
			    	'DATA_AUTH':DATA_AUTH,
			    	'begin':begin,
			    	'end':end,
			    	'CFI_FIX_SN':CFI_FIX_SN,
			    	'CFI_ITEM_CODE':CFI_ITEM_CODE,
			    	'CFI_ITEM_TYPE':CFI_ITEM_TYPE,
			    	'CFI_FIX_STATUS':CFI_FIX_STATUS,
			    	'page.currentPage':_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	'page.pageRecord':_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    	},
			  success:function(data){
            	
                $("#tbody_c3a183e393ea4dfabb15712f9dba1873").empty();
            if(null==data){
                return;
            }
            if(null!=data.ajaxPage.dataList){
                var list = eval(data.ajaxPage.dataList);
                for(var i=0;i<list.length;i++){
                    if(list[i].DATA_AUTH  ==null) list[i].DATA_AUTH ="";
                    if(list[i].CFI_CYCLE_REMIND  ==null) list[i].CFI_CYCLE_REMIND ="";
                    if(list[i].CFI_NOW_USAGE  ==null) list[i].CFI_NOW_USAGE ="";
                    if(list[i].CFI_REMIND_CYCLE  ==null) list[i].CFI_REMIND_CYCLE ="";
                    if(list[i].CFI_MAX_USAGE  ==null) list[i].CFI_MAX_USAGE ="";
                    if(list[i].CFI_TOTAL_USAGE  ==null) list[i].CFI_TOTAL_USAGE ="";
                    if(list[i].CFI_MT_DATE  ==null) list[i].CFI_MT_DATE ="";
                    if(list[i].CFI_MT_CYCLE  ==null) list[i].CFI_MT_CYCLE ="";
                    if(list[i].CFI_REMIND_DAY  ==null) list[i].CFI_REMIND_DAY ="";
                    if(list[i].CFI_FIX_SN  ==null) list[i].CFI_FIX_SN ="";
                    if(list[i].CFI_FIX_STATUS  ==null) list[i].CFI_FIX_STATUS ="";
                    if(list[i].CFI_ITEM_TYPE  ==null) list[i].CFI_ITEM_TYPE ="";
                    if(list[i].CFI_ITEM_CODE  ==null) list[i].CFI_ITEM_CODE ="";
                    if(list[i].CFI_INSTOCK_MAN  ==null) list[i].CFI_INSTOCK_MAN ="";
                    if(list[i].CFI_INSTOCK_TIME  ==null) list[i].CFI_INSTOCK_TIME ="";
                    if(list[i].ASSISTANTTOOLNAME  ==null) list[i].ASSISTANTTOOLNAME ="";
                    if(list[i].ASSISTANTTOOLSPEC  ==null) list[i].ASSISTANTTOOLSPEC ="";
                    if(list[i].CFI_UPKEEP_PERIOD  ==null) list[i].CFI_UPKEEP_PERIOD ="";
                    if(list[i].CFI_TINCKNESS  ==null) list[i].CFI_TINCKNESS ="";
                    if(list[i].CFI_FLATNESS  ==null) list[i].CFI_FLATNESS ="";
                   // $("#tbody_c3a183e393ea4dfabb15712f9dba1873 " ).append("<tr id='"+list[i].ID+"'  abbr='"+list[i].ID+"'></tr>");
                  // $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' name='ID' value='"+list[i].ID+"' /></td>");
                   $("#tbody_c3a183e393ea4dfabb15712f9dba1873 " ).append("<tr id='"+list[i].ID+"'  abbr='"+list[i].ID+"'></tr>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' name='ID' value='"+list[i].ID+"' /></td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+list[i].ID+"' type='checkbox' value='"+list[i].ID+"' name='c3a183e393ea4dfabb15712f9dba1873$ID' class='isSubmit _selectdata'  /></td>");
                   
                    //$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+list[i].ID+"' type='checkbox' value='"+list[i].ID+"' name='c3a183e393ea4dfabb15712f9dba1873$ID' class='isSubmit _selectdata' /></td>");
                   	 //$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:205px;text-align: center;'>"+list[i].DATA_AUTH+"</td>");
                   	   $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:200px;' title='"+list[i].DATA_AUTH+"'>"+list[i].DATA_AUTH2+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].DATA_AUTH1+"' /></td>");	
                   	$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:205px;text-align: left;'title='"+list[i].CFI_FIX_SN+"'><span onclick='itemJump1(\""+list[i].CFI_FIX_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].CFI_FIX_SN+"</span></td>");
                   	if(list[i].CFI_FIX_STATUS=="0"){
                   	    
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class=''  style='width:5px;' ></span><span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px;text-align:center;'>"+"在库"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="1"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px;text-align:center;'>"+"领用"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="2"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aace36;color:#FFFFFF;width:60px;text-align:center;'>"+"上线"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="3"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px;text-align:center;'>"+"报废"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="4"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px;text-align:center;'>"+"报废"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}else if(list[i].CFI_FIX_STATUS=="5"){
                   	    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-5' style='width:95px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#abbad2;color:#FFFFFF;width:60px;text-align:center;'>"+"禁用"+"</span><input type='hidden' id='PM_STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATUS+"'/></td>");
                   	}
                   	
                   	if(list[i].CFI_FIX_STATE=="过期"){
                         $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-6' style='width:95px;text-align:center' title='"+list[i].CFI_FIX_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:60px;text-align:center;'>"+list[i].CFI_FIX_STATE+"</span><input type='hidden' id='STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATE+"'/></td>");
                    }else if(list[i].CFI_FIX_STATE=="到期"){
                         $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-6' style='width:95px;text-align:center' title='"+list[i].CFI_FIX_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#ff00ff;color:#FFFFFF;width:60px;text-align:center;'>"+list[i].CFI_FIX_STATE+"</span><input type='hidden' id='STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATE+"'/></td>");
                    }else if(list[i].CFI_FIX_STATE=="正常"){
                        $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-6' style='width:95px;text-align:center' title='"+list[i].CFI_FIX_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px;text-align:center;'>"+list[i].CFI_FIX_STATE+"</span><input type='hidden' id='STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATE+"'/></td>");
                    }else{
                        $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-6' style='width:95px;text-align:center' title='"+list[i].CFI_FIX_STATE+"'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px;text-align:center;'>"+list[i].CFI_FIX_STATE+"</span><input type='hidden' id='STATUS_"+list[i].ID+"' value='"+list[i].CFI_FIX_STATE+"'/></td>");
                    }
                   
                   if(list[i].CFI_ITEM_TYPE=="0"){
                       	$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>"+"锡膏"+"</td>");
                   }else if(list[i].CFI_ITEM_TYPE=="1"){
                       $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>"+"胶水"+"</td>");
                   }else if(list[i].CFI_ITEM_TYPE=="2"){
                       $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>"+"钢网"+"</td>");
                   }else if(list[i].CFI_ITEM_TYPE=="3"){
                       $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>"+"刮刀"+"</td>");
                   }
                   
                   	$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:155px;text-align: left;' title='"+list[i].CFI_ITEM_CODE+"'><span onclick='itemJump2(\""+list[i].CFI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].CFI_ITEM_CODE+"</span></td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:125px;text-align: center;'>"+list[i].ASSISTANTTOOLNAME+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:125px;text-align: left;'>"+list[i].ASSISTANTTOOLSPEC+"</td>");
                    
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: center;'>"+list[i].CFI_MT_DATE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:95px;text-align: right;'>"+list[i].CFI_UPKEEP_PERIOD+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:115px;text-align: right;'>"+list[i].CFI_REMIND_DAY+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:95px;text-align: right;'>"+list[i].CFI_CYCLE_REMIND+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:115px;text-align: right;'>"+list[i].CFI_NOW_USAGE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:115px;text-align: right;'>"+list[i].CFI_REMIND_CYCLE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:115px;text-align: right;'>"+list[i].CFI_MAX_USAGE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:115px;text-align: right;'>"+list[i].CFI_TOTAL_USAGE+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:95px;text-align: right;'>"+list[i].CFI_TINCKNESS+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:95px;text-align: right;' title='"+list[i].CFI_FLATNESS+"'>"+list[i].CFI_FLATNESS+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:80px;text-align: center;'>"+list[i].CFI_INSTOCK_MAN+"</td>");
                    $("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-22' style='width:150px;text-align: center;'>"+list[i].CFI_INSTOCK_TIME+"</td>");
                    //$("#tbody_c3a183e393ea4dfabb15712f9dba1873 tr:last").append("<td class='datagrid-cell datagrid-cell-23' style='width:205px;text-align: center;'>"+list[i].DATA_AUTH+"</td>");
                    trcount++;
                }
               
            }
                 pageFun(data.ajaxPage,"c3a183e393ea4dfabb15712f9dba1873");
				var tableTrJs = $("#datagrid-btable-ajaxc3a183e393ea4dfabb15712f9dba1873 tbody tr");
				_tongLineColor(tableTrJs);
				
				clickTr('datagrid-btable-ajaxc3a183e393ea4dfabb15712f9dba1873');
				defTableWidthRewrite("c3a183e393ea4dfabb15712f9dba1873");
				
                },
    			    	error:function(msg){
    			    	    util.closeLoading();
    						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    			    	    
    			    	}
                });
    	}

	
    
    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
      // var url = "${path}buss/bussModel_listMsData.ms";
       var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CFI_FIX_SN,CFI_FIX_STATUS\"}";
        var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
        console.log(searchParams)
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
            data:searchParams +"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
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
    function query(){
        
        SearchDetailFun("c3a183e393ea4dfabb15712f9dba1873");
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
    
    function reloadPg(msg,title,width,height,time,isCloseWin){
    	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    }
    function reloadPgExe(isCloseWin){
     /* document.forms.search_form.submit();
     util.showTopLoading(); */
     SearchDetailFun("c3a183e393ea4dfabb15712f9dba1873");
     if ("0" == isCloseWin) {
       top.$(".dialog-close").click();
     }
      checkboxAll("joblist");
    
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
             var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#CFI_FIX_SN").val(jumpId);
                  } 
                  query();
        //listAjaxTable($("#formId1").val());
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
    
    function judgIsOpen(title,url){
    var flag = true;
    var timestamp = Date.parse(new Date());
     $(window.parent.document).find("#tag1").siblings().each(function(seq,item){
						//打开过的标签不再重复打开
						console.log(top);
						if(title == $(item).attr("title")){
							var count = item.id.substring(3);
						 $(window.parent.document).find("#iframe"+count).attr("src",url);
						 top.switchTag(item.id,"content"+count,url);
							flag = false;
							return;
						}
					});
					if(flag){
					showPopWinFp(url, 800, 400,null,title,timestamp,1);
					}
}

function itemJump1(obj){
      var title = "<dict:lang value="BOM管理" />";
      var formId = $("#formId1").val();
      var url = "${path}buss/bussModel.ms?&formId="+formId+"&exeid=64d40315e7ae489a8bb8e0d1871234ae&FUNC_CODE=F3811&frameId="+_currentFrame+"&jumpId="+obj;
      judgIsOpen(title,url);
    
}  



function itemJump2(obj){
    var title = "<dict:lang value="工序定义" />";
  var formId = $("#formId1").val();
  var url = "${path}buss/bussModel.ms?&formId="+formId+"&exeid=b074327f728643948b734bce9a5f7fc9&FUNC_CODE=F3158&frameId="+_currentFrame+"&jumpId="+obj;
    judgIsOpen(title,url);
} 
</script>
<script>
var isFirstSetScroll=0;


//生成异步表格
function createTableModel(ms,formId){
/*
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    
    if(formId=='c3a183e393ea4dfabb15712f9dba1873'){<%--FM-制具信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var fixSN=v['CFI_FIX_SN'];
            var itemCode=v['CFI_ITEM_CODE'];
            var assistanttoolName=v['CFI_ASSISTANTTOOLNAME'];
            var assistanttoolSpec=v['CFI_ASSISTANTTOOLSPEC'];
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
                
                arrHtml.push("<input type='hidden' id='PM_STATUS_"+v.ID+"' value='"+uiRaw[i].CFI_FIX_STATUS+"' />");
                
                arrHtml.push("<td colno='CFI_FIX_SN' title='"+fixSN+"' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FIX_SN')+"' style='width:205px;"+ms.tdStyle(formId, 'CFI_FIX_SN')+"' "+ms.tdEvent(formId, 'CFI_FIX_SN')+">")
                arrHtml.push("<span colno='CFI_FIX_SN' class='"+ms.uiClass(formId, 'CFI_FIX_SN')+"' style='"+ms.uiStyle(formId, 'CFI_FIX_SN')+"' "+ms.uiEvent(formId, 'CFI_FIX_SN')+" >"+v['CFI_FIX_SN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_FIX_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FIX_STATUS')+"' style='width:95px;text-align:center;"+ms.tdStyle(formId, 'CFI_FIX_STATUS')+"' "+ms.tdEvent(formId, 'CFI_FIX_STATUS')+">")
                arrHtml.push("<span colno='CFI_FIX_STATUS' class='"+ms.uiClass(formId, 'CFI_FIX_STATUS')+"' style='"+ms.uiStyle(formId, 'CFI_FIX_STATUS')+"' "+ms.uiEvent(formId, 'CFI_FIX_STATUS')+" >"+v['CFI_FIX_STATUS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CFI_ITEM_TYPE')+">")
                arrHtml.push("<span colno='CFI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CFI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CFI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CFI_ITEM_TYPE')+" >"+v['CFI_ITEM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ITEM_CODE' title='"+itemCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ITEM_CODE')+"' style='width:155px;"+ms.tdStyle(formId, 'CFI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CFI_ITEM_CODE')+">")
                arrHtml.push("<span colno='CFI_ITEM_CODE' class='"+ms.uiClass(formId, 'CFI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CFI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CFI_ITEM_CODE')+" >"+v['CFI_ITEM_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ASSISTANTTOOLNAME' title='"+assistanttoolName+"' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ASSISTANTTOOLNAME')+"' style='width:125px;"+ms.tdStyle(formId, 'CFI_ASSISTANTTOOLNAME')+"' "+ms.tdEvent(formId, 'CFI_ASSISTANTTOOLNAME')+">")
                arrHtml.push("<span colno='CFI_ASSISTANTTOOLNAME' class='"+ms.uiClass(formId, 'CFI_ASSISTANTTOOLNAME')+"' style='"+ms.uiStyle(formId, 'CFI_ASSISTANTTOOLNAME')+"' "+ms.uiEvent(formId, 'CFI_ASSISTANTTOOLNAME')+" >"+v['CFI_ASSISTANTTOOLNAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_ASSISTANTTOOLSPEC' title='"+assistanttoolSpec+"' class='datagrid-cell "+ms.tdClass(formId, 'CFI_ASSISTANTTOOLSPEC')+"' style='width:125px;text-align:center;"+ms.tdStyle(formId, 'CFI_ASSISTANTTOOLSPEC')+"' "+ms.tdEvent(formId, 'CFI_ASSISTANTTOOLSPEC')+">")
                arrHtml.push("<span colno='CFI_ASSISTANTTOOLSPEC' class='"+ms.uiClass(formId, 'CFI_ASSISTANTTOOLSPEC')+"' style='"+ms.uiStyle(formId, 'CFI_ASSISTANTTOOLSPEC')+"' "+ms.uiEvent(formId, 'CFI_ASSISTANTTOOLSPEC')+" >"+v['CFI_ASSISTANTTOOLSPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_UPKEEP_PERIOD' class='datagrid-cell "+ms.tdClass(formId, 'CFI_UPKEEP_PERIOD')+"' style='width:95px;text-align:right;"+ms.tdStyle(formId, 'CFI_UPKEEP_PERIOD')+"' "+ms.tdEvent(formId, 'CFI_UPKEEP_PERIOD')+">")
                arrHtml.push("<span colno='CFI_UPKEEP_PERIOD' class='"+ms.uiClass(formId, 'CFI_UPKEEP_PERIOD')+"' style='"+ms.uiStyle(formId, 'CFI_UPKEEP_PERIOD')+"' "+ms.uiEvent(formId, 'CFI_UPKEEP_PERIOD')+" >"+v['CFI_UPKEEP_PERIOD']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_CYCLE_REMIND' class='datagrid-cell "+ms.tdClass(formId, 'CFI_CYCLE_REMIND')+"' style='width:95px;text-align:right;"+ms.tdStyle(formId, 'CFI_CYCLE_REMIND')+"' "+ms.tdEvent(formId, 'CFI_CYCLE_REMIND')+">")
                arrHtml.push("<span colno='CFI_CYCLE_REMIND' class='"+ms.uiClass(formId, 'CFI_CYCLE_REMIND')+"' style='"+ms.uiStyle(formId, 'CFI_CYCLE_REMIND')+"' "+ms.uiEvent(formId, 'CFI_CYCLE_REMIND')+" >"+v['CFI_CYCLE_REMIND']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_REMIND_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'CFI_REMIND_CYCLE')+"' style='width:115px;text-align:right;"+ms.tdStyle(formId, 'CFI_REMIND_CYCLE')+"' "+ms.tdEvent(formId, 'CFI_REMIND_CYCLE')+">")
                arrHtml.push("<span colno='CFI_REMIND_CYCLE' class='"+ms.uiClass(formId, 'CFI_REMIND_CYCLE')+"' style='"+ms.uiStyle(formId, 'CFI_REMIND_CYCLE')+"' "+ms.uiEvent(formId, 'CFI_REMIND_CYCLE')+" >"+v['CFI_REMIND_CYCLE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_REMIND_DAY' class='datagrid-cell "+ms.tdClass(formId, 'CFI_REMIND_DAY')+"' style='width:115px;text-align:right;"+ms.tdStyle(formId, 'CFI_REMIND_DAY')+"' "+ms.tdEvent(formId, 'CFI_REMIND_DAY')+">")
                arrHtml.push("<span colno='CFI_REMIND_DAY' class='"+ms.uiClass(formId, 'CFI_REMIND_DAY')+"' style='"+ms.uiStyle(formId, 'CFI_REMIND_DAY')+"' "+ms.uiEvent(formId, 'CFI_REMIND_DAY')+" >"+v['CFI_REMIND_DAY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_TINCKNESS' class='datagrid-cell "+ms.tdClass(formId, 'CFI_TINCKNESS')+"' style='width:95px;text-align:right;"+ms.tdStyle(formId, 'CFI_TINCKNESS')+"' "+ms.tdEvent(formId, 'CFI_TINCKNESS')+">")
                arrHtml.push("<span colno='CFI_TINCKNESS' class='"+ms.uiClass(formId, 'CFI_TINCKNESS')+"' style='"+ms.uiStyle(formId, 'CFI_TINCKNESS')+"' "+ms.uiEvent(formId, 'CFI_TINCKNESS')+" >"+v['CFI_TINCKNESS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_FLATNESS' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FLATNESS')+"' style='width:95px;text-align:right;"+ms.tdStyle(formId, 'CFI_FLATNESS')+"' "+ms.tdEvent(formId, 'CFI_FLATNESS')+">")
                arrHtml.push("<span colno='CFI_FLATNESS' class='"+ms.uiClass(formId, 'CFI_FLATNESS')+"' style='"+ms.uiStyle(formId, 'CFI_FLATNESS')+"' "+ms.uiEvent(formId, 'CFI_FLATNESS')+" >"+v['CFI_FLATNESS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_INSTOCK_MAN' class='datagrid-cell "+ms.tdClass(formId, 'CFI_INSTOCK_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFI_INSTOCK_MAN')+"' "+ms.tdEvent(formId, 'CFI_INSTOCK_MAN')+">")
                arrHtml.push("<span colno='CFI_INSTOCK_MAN' class='"+ms.uiClass(formId, 'CFI_INSTOCK_MAN')+"' style='"+ms.uiStyle(formId, 'CFI_INSTOCK_MAN')+"' "+ms.uiEvent(formId, 'CFI_INSTOCK_MAN')+" >"+v['CFI_INSTOCK_MAN']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_INSTOCK_TIME' title='${CFI_INSTOCK_TIME}' class='datagrid-cell "+ms.tdClass(formId, 'CFI_INSTOCK_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'CFI_INSTOCK_TIME')+"' "+ms.tdEvent(formId, 'CFI_INSTOCK_TIME')+">")
                arrHtml.push("<span colno='CFI_INSTOCK_TIME' class='"+ms.uiClass(formId, 'CFI_INSTOCK_TIME')+"' style='"+ms.uiStyle(formId, 'CFI_INSTOCK_TIME')+"' "+ms.uiEvent(formId, 'CFI_INSTOCK_TIME')+" >"+v['CFI_INSTOCK_TIME']+"</span>")
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
    //setTableWidth(formId);
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
    */
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
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制具履历
function itemJump1(obj){
      winOptMethod.jump("68260cc1824b481693825d3f54658ad0","F8890","jumpId",obj);
}  
//辅料制具料号
function itemJump2(obj){
      winOptMethod.jump("8d8dfef2f0e140e88073f6cdad4b431d","F3722","jumpId",obj);
}  
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 


