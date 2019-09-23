<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="辅料回温列表2" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="776a9d93290b4cef813dc66f100cbe1e"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="4e84e4f2f5304be293e8c56c44cfed49" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="4e84e4f2f5304be293e8c56c44cfed49" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='776a9d93290b4cef813dc66f100cbe1e'/>
 <div class="panel datagrid datagrid-div1"  id="776a9d93290b4cef813dc66f100cbe1e">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6"  style="min-width: 1650px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="776a9d93290b4cef813dc66f100cbe1e" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="THA_TIN_STATUS" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="THA_TIME_TOTAL" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="THA_TIME_MAX" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="THA_CYCLE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CTT_END_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CTT_OPERATOR" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz"  style="min-width: 1630px;">
		<tbody id="tbody_776a9d93290b4cef813dc66f100cbe1e">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
		    <td style="display:none;" name="${ID}">${CTT_EXPECT_TIME}</td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="776a9d93290b4cef813dc66f100cbe1e" /></td>
            <bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e"  style="width:150px;" >
				<bu:ui colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{CTT_TIN_SN}" seq="%{#seq}"/>
				 
			</bu:td>
            <bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="THA_TIN_STATUS" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:70px;text-align: center;">
		 
			 
			<span colno="THA_TIN_STATUS" id="span_${ID}"  style="color:#FFFFFF;width:50px;display: inline-block;" class="state fixedTable dlist-table"></span>
			</bu:td>
            <bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" style="text-align: center;width:70px;">
				<bu:ui colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{CTT_ITEM_TYPE}" seq="%{#seq}" />
			</bu:td>
            <bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:120px;">
				<bu:ui colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{CTT_ITEM_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:120px;">
				<bu:ui colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{THA_TOOL_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-12" colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:120px;">
				<bu:ui colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{THA_TOOLSPEC}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="THA_TIME_TOTAL" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:120px;">
				<bu:ui colNo="THA_TIME_TOTAL" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{THA_TIME_TOTAL}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="THA_TIME_MAX" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:150px;">
				<bu:ui colNo="THA_TIME_MAX" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{THA_TIME_MAX}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="THA_CYCLE" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:130px;">
				<bu:ui colNo="THA_CYCLE" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{THA_CYCLE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:130px;">
				<bu:ui colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{CTT_BEGIN_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:130px;">
				<bu:ui colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{CTT_EXPECT_TIME}" seq="%{#seq}" />
			</bu:td>
            <bu:td cssClass="datagrid-cell datagrid-cell-10" colNo="CTT_END_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" style="width:130px;">
				<bu:ui colNo="CTT_END_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{CTT_END_TIME}" seq="%{#seq}" />
			</bu:td>
            <bu:td cssClass="datagrid-cell datagrid-cell-13" colNo="CTT_OPERATOR" formId="776a9d93290b4cef813dc66f100cbe1e" style="text-align: center;">
				<bu:ui colNo="CTT_OPERATOR" formId="776a9d93290b4cef813dc66f100cbe1e" value="%{CTT_OPERATOR}" seq="%{#seq}" />
			</bu:td>	
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
  </div>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="4e84e4f2f5304be293e8c56c44cfed49" />
		<bu:script viewId="4e84e4f2f5304be293e8c56c44cfed49" />
	<script type="text/javascript">
        $(function(){
      //  $("#11c2a14530484b2783834cfee77f73b5").css('display','none');
         	var table_length=$("#datagrid-htable-kz").find("tr").length;
        	for(var i=0;i<table_length;i++){
        		var j=3*1+i;
       	     	var tr_text= $("table tr:eq("+j+") td");
       		    var expect_time=tr_text.eq(0).text();   
       		    var expect_time_name="#span_"+tr_text.eq(0).attr("name");
       		   // alert("expect_time_name: "+expect_time_name);
       	        var ctt_expect_time=expect_time.substring(0,expect_time.length-2);
       		    var nowDate=new Date();
       		    var ctt_expect_time_todate=new Date(ctt_expect_time);
       		//    alert(nowDate.getTime+" ："+ctt_expect_time_todate);
       		 //   alert("比较："++nowDate.getTime()<ctt_expect_time_todate.getDate())
       		    if(nowDate.getTime()<ctt_expect_time_todate.getTime()){
       		   	       $(expect_time_name).css("background-color","#ff0000");
       	               $(expect_time_name).text('回温中');
       		    }else{
       		           $(expect_time_name).css("background-color","#980000");
       	               $(expect_time_name).text('回温结束');
       		   }
       	}
        
        
        
        
        });
        
	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
		}
		if($("#isClearOrder").val()==1){
    		clearSelectOrder();
    	}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg,title,width,height,time){
		//utilsFp.alert(msg,reloadPgExe);
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		//document.forms.searchForm.submit();
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
 	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
