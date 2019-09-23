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
		<dict:lang value="VM-物料中间表信息" />
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
		<bu:header formId ="a5c2d366015d4387b20efc4bb2d30f81"/>

    

    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		       <bu:func viewId="546b8ab659c744348ef01f03a1d02795" />
		    <!-- <div class="optn"> 
		    <button type="button" id="68bb93a6481e4a03bb049a05215e6d58" value="" onclick="commExcelImport()" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>导入</button>
		    <button type="button" onclick="SearchDetailFun(this);"><i class="ico ico-search-new"></i>查询</button>
		    
		    </div>-->
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="546b8ab659c744348ef01f03a1d02795" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagea5c2d366015d4387b20efc4bb2d30f81" id="formPagea5c2d366015d4387b20efc4bb2d30f81" value="${formPagea5c2d366015d4387b20efc4bb2d30f81}"/>
		<input type="hidden" name="formId" id="formId1" value='a5c2d366015d4387b20efc4bb2d30f81'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="a5c2d366015d4387b20efc4bb2d30f81">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxa5c2d366015d4387b20efc4bb2d30f81" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innera5c2d366015d4387b20efc4bb2d30f81">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablea5c2d366015d4387b20efc4bb2d30f81" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="a5c2d366015d4387b20efc4bb2d30f81" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_a5c2d366015d4387b20efc4bb2d30f81" onclick="_selectAjaxTableAllData(this,'a5c2d366015d4387b20efc4bb2d30f81')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
		    <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WMI_ITEM_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_DOC_NO" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_MO_NUMBER" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_ITEM_CODE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_ITEM_NAME" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_ITEM_SPCE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WMI_ITEM_TYPE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell"  style="width:200px;"><bu:uitn colNo="WMI_PROJECT_ID" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_PO" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WMI_SN_NUM" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WMI_ITEM_SEQ" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_QUALITY_STATUS" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_LOT_NO" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_CUSTOMER" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="SUPPLIER_NAME" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_MANUFACTURER" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_SUP_LOT" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WMI_PRODUCE_DATE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WMI_CREATE_DATE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_FIRST_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_SECOND_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_THIRD_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WMI_FOURTH_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			
		
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDiva5c2d366015d4387b20efc4bb2d30f81" onscroll="ajaxTableScroll(this,'a5c2d366015d4387b20efc4bb2d30f81')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxa5c2d366015d4387b20efc4bb2d30f81" >
		<tbody id="tbody_a5c2d366015d4387b20efc4bb2d30f81" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagea5c2d366015d4387b20efc4bb2d30f81==1}">			<div class="center">
			
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchDetailFun&formId=a5c2d366015d4387b20efc4bb2d30f81&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="546b8ab659c744348ef01f03a1d02795" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="546b8ab659c744348ef01f03a1d02795" />
    
    
    
<script>
function commExcelImport(){ 
  var url='${path}sys/excel/ExcelAction_ImportPage.ms?exeid=546b8ab659c744348ef01f03a1d02795&iframeId='+_currentFrame; 
  showPopWinFp(url, 1200, 600,null,'<dict:lang value="导入Excel电子文件" />'); 
}   

function query(thisObj){
        SearchDetailFun('a5c2d366015d4387b20efc4bb2d30f81');
       // listAjaxTable('formId4');
}
function init(){
    getInfo();
}

var trcount=0;
function getInfo(){
    var dataAuth = $("#DATA_AUTH").val();
    
   // if(DATA_AUTH!=null){
    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=84d82372e10847b48066026cf3218930";
    util.showLoading("处理中...");
    $.ajax({
        type:"post",
        dataType:"json",
        url:getInfoUrl,
        data:{
            "dataAuth" : dataAuth
        },
        success:function(data){
            	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81").empty();
            if(null==data){
                return;
            }
            if(null!=data.ajaxPage.dataList){
                
                var list = eval(data.ajaxPage.dataList);
                	
                for(var i=0;i<list.length;i++){
                    if(list[i].WMI_ITEM_SN  ==null) list[i].WMI_ITEM_SN ="";
                    if(list[i].WMI_DOC_NO  ==null) list[i].WMI_DOC_NO ="";
                    if(list[i].WMI_MO_NUMBER  ==null) list[i].WMI_MO_NUMBER ="";
                    if(list[i].WMI_ITEM_CODE  ==null) list[i].WMI_ITEM_CODE ="";
                    if(list[i].CI_ITEM_NAME  ==null) list[i].CI_ITEM_NAME ="";
                    if(list[i].CI_ITEM_SPEC  ==null) list[i].CI_ITEM_SPEC ="";
                    if(list[i].WMI_ITEM_TYPE  ==null) list[i].WMI_ITEM_TYPE ="";
                    if(list[i].WMI_PROJECT_ID  ==null) list[i].WMI_PROJECT_ID ="";
                    if(list[i].WMI_PO  ==null) list[i].WMI_PO ="";
                    if(list[i].WMI_ITEM_SEQ  ==null) list[i].WMI_ITEM_SEQ ="";
                    if(list[i].WMI_QUALITY_STATUS  ==null) list[i].WMI_QUALITY_STATUS ="";
                    if(list[i].WMI_LOT_NO  ==null) list[i].WMI_LOT_NO ="";
                    if(list[i].WMI_CUST_CODE  ==null) list[i].WMI_CUST_CODE ="";
                    if(list[i].WMI_SUP_CODE  ==null) list[i].WMI_SUP_CODE ="";
                    if(list[i].WMI_MANUFACTURER  ==null) list[i].WMI_MANUFACTURER ="";
                    if(list[i].WMI_SUP_LOT  ==null) list[i].WMI_SUP_LOT ="";
                    if(list[i].WMI_PRODUCE_DATE  ==null) list[i].WMI_PRODUCE_DATE ="";   
                    if(list[i].WMI_CREATE_DATE  ==null) list[i].WMI_CREATE_DATE ="";
                    if(list[i].WMI_FIRST_SN  ==null) list[i].WMI_FIRST_SN ="";
                    if(list[i].WMI_SECOND_SN  ==null) list[i].WMI_SECOND_SN ="";   
                    if(list[i].WMI_THIRD_SN  ==null) list[i].WMI_THIRD_SN ="";
                    if(list[i].WMI_FOURTH_SN  ==null) list[i].WMI_FOURTH_SN ="";
                    if(list[i].WMI_SN_NUM  ==null) list[i].WMI_SN_NUM ="";
                    if(list[i].CUSTOMER  ==null) list[i].CUSTOMER ="";
                    if(list[i].SUPPLIER_NAME  ==null) list[i].SUPPLIER_NAME ="";
                    if(list[i].DEPT_NAME  ==null) list[i].DEPT_NAME ="";
                    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81" ).append("<tr id='tr"+trcount+"'></tr>");
                    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+trcount+"' type='checkbox' name='isSelect' class='_selectdata'  /></td>");
                    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+list[i].DEPT_NAME+"'>"+list[i].DEPT_NAME+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: left;' title='"+list[i].WMI_ITEM_SN+"'>"+list[i].WMI_ITEM_SN+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;' title='"+list[i].WMI_DOC_NO+"'>"+list[i].WMI_DOC_NO+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;' title='"+list[i].WMI_MO_NUMBER+"'>"+list[i].WMI_MO_NUMBER+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;text-align: left;' title='"+list[i].WMI_ITEM_CODE+"'>"+list[i].WMI_ITEM_CODE+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: left;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: left;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>");
                   	if(list[i].WMI_ITEM_TYPE=="1"){
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;'>"+"正常"+"</td>");
                   	}else if(list[i].WMI_ITEM_TYPE=="2"){
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;'>"+"赠品"+"</td>");
                   	}else{
                   	     $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;'>"+list[i].WMI_ITEM_TYPE+"</td>");
                   	}
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:200px;text-align: left;' title='"+list[i].WMI_PROJECT_ID+"'>"+list[i].WMI_PROJECT_ID+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;text-align: left;' title='"+list[i].WMI_PO+"'>"+list[i].WMI_PO+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:80px;text-align: right;' title='"+list[i].WMI_SN_NUM+"'>"+list[i].WMI_SN_NUM+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:70px;text-align: right;' title='"+list[i].WMI_ITEM_SEQ+"'>"+list[i].WMI_ITEM_SEQ+"</td>");
                   	if(list[i].WMI_QUALITY_STATUS=="0"){
                   	   // $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:121.82px;text-align: center;'>"+"未检验"+"</td>");
                   	     $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-14' style='width:100px;text-align:center'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:70px;text-align:center;'>"+"未检验"+"</span></td>");
                   	}else if(list[i].WMI_QUALITY_STATUS=="1"){
                   	    //$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:121.82px;text-align: center;'>"+"检验合格"+"</td>");
                   	     $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-14' style='width:100px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#ff00ff;color:#FFFFFF;width:70px;text-align:center;'>"+"检验合格"+"</span></td>");
                   	}else if(list[i].WMI_QUALITY_STATUS=="2"){
                   	   // $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:121.82px;text-align: center;'>"+"检验不合格"+"</td>");
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-14' style='width:100px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:70px;text-align:center;'>"+"检验不合格"+"</span></td>");
                   	}else if(list[i].WMI_QUALITY_STATUS==""){
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-14' style='width:70;text-align: center;'>"+""+"</td>");
                   	    
                   	}else {
                   	    //$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:121.82px;text-align: center;'>"+list[i].WMI_QUALITY_STATUS+"</td>");
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-14' style='width:70px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:80px;text-align:center;'>"+list[i].WMI_QUALITY_STATUS+"</span></td>");
                   	}
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:120px;text-align: left;' title='"+list[i].WMI_LOT_NO+"'>"+list[i].WMI_LOT_NO+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:120px;text-align: center;' title='"+list[i].CUSTOMER+"'>"+list[i].CUSTOMER+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:120px;text-align: left;' title='"+list[i].SUPPLIER_NAME+"'>"+list[i].SUPPLIER_NAME+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:120px;text-align: center;' title='"+list[i].WMI_MANUFACTURER+"'>"+list[i].WMI_MANUFACTURER+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:120px;text-align: left;' title='"+list[i].WMI_SUP_LOT+"'>"+list[i].WMI_SUP_LOT+"</td>");
                   	
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:140px;text-align: center;' title='"+list[i].WMI_PRODUCE_DATE+"'>"+list[i].WMI_PRODUCE_DATE+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:140px;text-align: center;' title='"+list[i].WMI_CREATE_DATE+"'>"+list[i].WMI_CREATE_DATE+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-22' style='width:120px;text-align: left;' title='"+list[i].WMI_FIRST_SN+"'>"+list[i].WMI_FIRST_SN+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-23' style='width:120px;text-align: left;' title='"+list[i].WMI_SECOND_SN+"'>"+list[i].WMI_SECOND_SN+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-24' style='width:120px;text-align: left;' title='"+list[i].WMI_THIRD_SN+"'>"+list[i].WMI_THIRD_SN+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-25' style='width:120px;text-align: left;' title='"+list[i].WMI_FOURTH_SN+"'>"+list[i].WMI_FOURTH_SN+"</td>");
                   	trcount++;
                }
                
				var tableTrJs = $("#datagrid-btable-ajaxa5c2d366015d4387b20efc4bb2d30f81 tbody tr");
				_tongLineColor(tableTrJs);
				clickTr('datagrid-btable-ajaxa5c2d366015d4387b20efc4bb2d30f81');
				
            }
            defTableWidthRewrite('a5c2d366015d4387b20efc4bb2d30f81');
            pageFun(data.ajaxPage,"a5c2d366015d4387b20efc4bb2d30f81");
        },
        error:function(msg){
             utilsFp.confirmIcon(3,"","","", msg,"","260","145");
        }
        
    })
    //}
}

        //分页
        var paginationImpl={};
		function  SearchDetailFun(paginationImpl){
		       
		    	util.showLoading("处理中...");
		    	
		    	var isFirstLoad = firstLoadThisPage(paginationImpl);
            	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
            	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    			var dataAuth = $("#DATA_AUTH").val();
    			var WMI_ITEM_SN = $(document.getElementById('WMI_ITEM_SN')).val();
    			var WMI_PO = $(document.getElementById('WMI_PO')).val();
    			var WMI_PROJECT_ID = $(document.getElementById('WMI_PROJECT_ID')).val();
    			var SUPPLIER_NAME= $(document.getElementById('SUPPLIER_NAME')).val();
    			var WMI_ITEM_CODE = $(document.getElementById('WMI_ITEM_CODE_SHOW')).val();
    			
        var getInfoUrl11="${path}buss/bussModel_exeFunc.ms?funcMId=c613919360f94ac88fd851f98e291a33";
        
    $.ajax({
        type: "post",
        dataType: "json",
        url: getInfoUrl11,
        data: {
            "dataAuth" : dataAuth,
            "WMI_ITEM_SN" : WMI_ITEM_SN,
            "WMI_PO" : WMI_PO,
            "WMI_PROJECT_ID" : WMI_PROJECT_ID,
            "SUPPLIER_NAME" : SUPPLIER_NAME,
            "WMI_ITEM_CODE" : WMI_ITEM_CODE,
            "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
            "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
        },
        //data: "DATA_AUTH="+DATA_AUTH+"&WMI_ITEM_SN="+WMI_ITEM_SN+"&WMI_PO="+WMI_PO+"&WMI_PROJECT_ID="+WMI_PROJECT_ID+"&SUPPLIER_NAME="+SUPPLIER_NAME+"&WMI_ITEM_CODE="+WMI_ITEM_CODE+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
        success:function(data){
            	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81").empty();
            if(null==data){
                return;
            }
            if(null!=data.ajaxPage.dataList){
                var list = eval(data.ajaxPage.dataList);
                
                for(var i=0;i<list.length;i++){
                    if(list[i].WMI_ITEM_SN  ==null) list[i].WMI_ITEM_SN ="";
                    if(list[i].WMI_DOC_NO  ==null) list[i].WMI_DOC_NO ="";
                    if(list[i].WMI_MO_NUMBER  ==null) list[i].WMI_MO_NUMBER ="";
                    if(list[i].WMI_ITEM_CODE  ==null) list[i].WMI_ITEM_CODE ="";
                    if(list[i].CI_ITEM_NAME  ==null) list[i].CI_ITEM_NAME ="";
                    if(list[i].CI_ITEM_SPEC  ==null) list[i].CI_ITEM_SPEC ="";
                    if(list[i].WMI_ITEM_TYPE  ==null) list[i].WMI_ITEM_TYPE ="";
                    if(list[i].WMI_PROJECT_ID  ==null) list[i].WMI_PROJECT_ID ="";
                    if(list[i].WMI_PO  ==null) list[i].WMI_PO ="";
                    if(list[i].WMI_ITEM_SEQ  ==null) list[i].WMI_ITEM_SEQ ="";
                    if(list[i].WMI_QUALITY_STATUS  ==null) list[i].WMI_QUALITY_STATUS ="";
                    if(list[i].WMI_LOT_NO  ==null) list[i].WMI_LOT_NO ="";
                    if(list[i].WMI_CUST_CODE  ==null) list[i].WMI_CUST_CODE ="";
                    if(list[i].WMI_SUP_CODE  ==null) list[i].WMI_SUP_CODE ="";
                    if(list[i].WMI_MANUFACTURER  ==null) list[i].WMI_MANUFACTURER ="";
                    if(list[i].WMI_SUP_LOT  ==null) list[i].WMI_SUP_LOT ="";
                    if(list[i].WMI_PRODUCE_DATE  ==null) list[i].WMI_PRODUCE_DATE ="";   
                    if(list[i].WMI_CREATE_DATE  ==null) list[i].WMI_CREATE_DATE ="";
                    if(list[i].WMI_FIRST_SN  ==null) list[i].WMI_FIRST_SN ="";
                    if(list[i].WMI_SECOND_SN  ==null) list[i].WMI_SECOND_SN ="";   
                    if(list[i].WMI_THIRD_SN  ==null) list[i].WMI_THIRD_SN ="";
                    if(list[i].WMI_FOURTH_SN  ==null) list[i].WMI_FOURTH_SN ="";
                     if(list[i].WMI_SN_NUM  ==null) list[i].WMI_SN_NUM ="";
                     if(list[i].CUSTOMER  ==null) list[i].CUSTOMER ="";
                     if(list[i].SUPPLIER_NAME  ==null) list[i].SUPPLIER_NAME ="";
                     if(list[i].DEPT_NAME  ==null) list[i].DEPT_NAME ="";
                   $("#tbody_a5c2d366015d4387b20efc4bb2d30f81" ).append("<tr id='tr"+((currentPage-1)*pageRecord+(i+1))+"'></tr>");
                    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
                    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+trcount+"' type='checkbox' name='isSelect' class='_selectdata'  /></td>");
                    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+list[i].DEPT_NAME+"'>"+list[i].DEPT_NAME+"</td>");
                   		$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: left;' title='"+list[i].WMI_ITEM_SN+"'>"+list[i].WMI_ITEM_SN+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;' title='"+list[i].WMI_DOC_NO+"'>"+list[i].WMI_DOC_NO+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;' title='"+list[i].WMI_MO_NUMBER+"'>"+list[i].WMI_MO_NUMBER+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;text-align: left;' title='"+list[i].WMI_ITEM_CODE+"'>"+list[i].WMI_ITEM_CODE+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: left;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: left;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>");
                   	if(list[i].WMI_ITEM_TYPE=="1"){
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;'>"+"正常"+"</td>");
                   	}else if(list[i].WMI_ITEM_TYPE=="2"){
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;'>"+"赠品"+"</td>");
                   	}else{
                   	     $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;'>"+list[i].WMI_ITEM_TYPE+"</td>");
                   	}
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:200px;text-align: left;' title='"+list[i].WMI_PROJECT_ID+"'>"+list[i].WMI_PROJECT_ID+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;text-align: left;' title='"+list[i].WMI_PO+"'>"+list[i].WMI_PO+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:80px;text-align: right;' title='"+list[i].WMI_SN_NUM+"'>"+list[i].WMI_SN_NUM+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:70px;text-align: right;' title='"+list[i].WMI_ITEM_SEQ+"'>"+list[i].WMI_ITEM_SEQ+"</td>");
                   	if(list[i].WMI_QUALITY_STATUS=="0"){
                   	   // $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:121.82px;text-align: center;'>"+"未检验"+"</td>");
                   	     $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS'  class='datagrid-cell datagrid-cell-14' style='width:100px;text-align:center'><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:70px;text-align:center;'>"+"未检验"+"</span></td>");
                   	}else if(list[i].WMI_QUALITY_STATUS=="1"){
                   	    //$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:121.82px;text-align: center;'>"+"检验合格"+"</td>");
                   	     $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-14' style='width:100px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#ff00ff;color:#FFFFFF;width:70px;text-align:center;'>"+"检验合格"+"</span></td>");
                   	}else if(list[i].WMI_QUALITY_STATUS=="2"){
                   	   // $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:121.82px;text-align: center;'>"+"检验不合格"+"</td>");
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-14' style='width:100px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:70px;text-align:center;'>"+"检验不合格"+"</span></td>");
                   	}else if(list[i].WMI_QUALITY_STATUS==""){
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-14' style='width:70;text-align: center;'>"+""+"</td>");
                   	    
                   	}else {
                   	    //$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:121.82px;text-align: center;'>"+list[i].WMI_QUALITY_STATUS+"</td>");
                   	    $("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td colno='WMI_STATUS' class='datagrid-cell datagrid-cell-14' style='width:70px;text-align:center' ><span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:80px;text-align:center;'>"+list[i].WMI_QUALITY_STATUS+"</span></td>");
                   	}
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:120px;text-align: left;' title='"+list[i].WMI_LOT_NO+"'>"+list[i].WMI_LOT_NO+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:120px;text-align: center;' title='"+list[i].CUSTOMER+"'>"+list[i].CUSTOMER+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:120px;text-align: left;' title='"+list[i].SUPPLIER_NAME+"'>"+list[i].SUPPLIER_NAME+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:120px;text-align: center;' title='"+list[i].WMI_MANUFACTURER+"'>"+list[i].WMI_MANUFACTURER+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:120px;text-align: left;' title='"+list[i].WMI_SUP_LOT+"'>"+list[i].WMI_SUP_LOT+"</td>");
                   	
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:140px;text-align: center;' title='"+list[i].WMI_PRODUCE_DATE+"'>"+list[i].WMI_PRODUCE_DATE+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:140px;text-align: center;' title='"+list[i].WMI_CREATE_DATE+"'>"+list[i].WMI_CREATE_DATE+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-22' style='width:120px;text-align: left;' title='"+list[i].WMI_FIRST_SN+"'>"+list[i].WMI_FIRST_SN+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-23' style='width:120px;text-align: left;' title='"+list[i].WMI_SECOND_SN+"'>"+list[i].WMI_SECOND_SN+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-24' style='width:120px;text-align: left;' title='"+list[i].WMI_THIRD_SN+"'>"+list[i].WMI_THIRD_SN+"</td>");
                   	$("#tbody_a5c2d366015d4387b20efc4bb2d30f81 tr:last").append("<td class='datagrid-cell datagrid-cell-25' style='width:120px;text-align: left;' title='"+list[i].WMI_FOURTH_SN+"'>"+list[i].WMI_FOURTH_SN+"</td>");
                    trcount++;
                }
                
              
            }
              pageFun(data.ajaxPage,"a5c2d366015d4387b20efc4bb2d30f81");
				var tableTrJs = $("#datagrid-btable-ajaxa5c2d366015d4387b20efc4bb2d30f81 tbody tr");
				_tongLineColor(tableTrJs);
				clickTr('datagrid-btable-ajaxa5c2d366015d4387b20efc4bb2d30f81');
				 defTableWidthRewrite('a5c2d366015d4387b20efc4bb2d30f81');
        },
        error:function(msg){
            utilsFp.confirmIcon(3,"","","", msg,"","260","145");
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

</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
<bu:submit viewId="546b8ab659c744348ef01f03a1d02795" />
<bu:script viewId="546b8ab659c744348ef01f03a1d02795" />
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
