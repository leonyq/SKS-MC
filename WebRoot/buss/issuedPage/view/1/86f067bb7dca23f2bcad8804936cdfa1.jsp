<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="任务中心" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
		
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script src="${path}/plf/js/ui/processbar/js/jquery.progress.js"></script>
	<link rel="stylesheet" href="${path}/plf/js/ui/processbar/css/progress.css"/>
       <script src="buss/taskCenter/treeform/js/jquery.treeTable.js" type="text/javascript"></script>
    
        <script type="text/javascript">
        
        
        $(window).resize(function(){
        	$('.dlist #bd').height($(parent.window).height() - 65 -36 - 15);
		$('.dlist #bd').width($(window).width() - 2);
        })
        
        $(function(){
            var option = {
                theme:'vsStyle',
                expandLevel : 2, /* 树形展开的级别 */
                column: 1,/* 第几列元素  点击展开*/
                beforeExpand : function($treeTable, id) {   
                   if ($('.' + id, $treeTable).length) { return; }
                   
                },
                onSelect : function($treeTable, id) {
                   
                    
                }

            };
            $('#table_846ed3470b134d86aa1c860acc4e442c').treeTable(option);

           
        });
        </script>
        <style>
		.tableHead th{
		background-color:#10a0e0;
		}
		.dlist-table td,.dlist-table th{
			overflow: hidden;
    			text-overflow: ellipsis;
    			white-space: nowrap;
		}
	</style>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
               <div class="hd">                 
		       <bu:func viewId="39f4af7375f945bd849b88b4053c8592" />                    
                  </div>
                  <div class="bd" id="bd" style="overflow:auto;">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
		                    <bu:search viewId="39f4af7375f945bd849b88b4053c8592" />
						</form>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value ='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=%{FUNC_CODE}" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
  <div id="846ed3470b134d86aa1c860acc4e442c">
  <input type="hidden" name="formId" value="846ed3470b134d86aa1c860acc4e442c" />
  <input type="hidden" name="userId" id="userId" value="<s:property value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}' />" />
  
		<bu:table id="table_846ed3470b134d86aa1c860acc4e442c" width="100%" cssClass="dlist-table table-line" viewId="39f4af7375f945bd849b88b4053c8592" formId="846ed3470b134d86aa1c860acc4e442c" list="dataList" formidFirstId="846ed3470b134d86aa1c860acc4e442c" relColIds="" subFormIds="" subRelColIds="">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<th style="width:30px;text-align: center;"<bu:thSBox formId="846ed3470b134d86aa1c860acc4e442c" style="width: 25px;text-align: center;"/></th>
			<th><bu:uitn colNo="TASK_NAME" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="TASK_STATE" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="SPEED_PROGRESS" formId="846ed3470b134d86aa1c860acc4e442c"/></th>
			<th><bu:uitn colNo="PRIORITY" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="PROJECT_ID" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="PUBLISHER" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="EXECUTOR" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="PRE_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="PLAN_OVER_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="FACT_BEG_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
			<th><bu:uitn colNo="FACT_END_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></th>
		</bu:thTr>
		</thead>
		<tbody id="tbody_846ed3470b134d86aa1c860acc4e442c">
		<bu:loop id="ls" value="dataList" status="seq" >
		<tr id="${ID}" pId="${PID}" onclick="selectCheck(event,this)" >
			<td style="width:30px;text-align: center;"><bu:tdSBox formidFirstId="846ed3470b134d86aa1c860acc4e442c"></bu:tdSBox>
			<s:property value="%{#seq.count}" />
			</td>
			<td nowrap="nowrap">
			<c:if test="${hasChild==1 }"><span controller="true">${TASK_NAME} </span></c:if>
			<c:if test="${hasChild!=1 }">${TASK_NAME} </c:if>
			<input type="hidden" id="TASK_STATE_${ID }" name="TASK_STATE" value="${TASK_STATE }"/>
			<input type="hidden" id="PUBLISHER_${ID}" name="PUBLISHER_${ID}" value="${PUBLISHER }" />
			<input type="hidden" id="EXECUTOR_${ID}" name="EXECUTOR_${ID}" value="${EXECUTOR}" />
			</td>
			<td style="text-align:center;">
				<bu:ui colNo="TASK_STATE" formId="846ed3470b134d86aa1c860acc4e442c" value="%{TASK_STATE}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="SPEED_PROGRESS" formId="846ed3470b134d86aa1c860acc4e442c" value="%{SPEED_PROGRESS}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="PRIORITY" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PRIORITY}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="PROJECT_ID" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PROJECT_ID}" seq="%{#seq}" />
			</td>
			<td style="text-align:center;">
				<bu:ui colNo="PUBLISHER" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PUBLISHER}" seq="%{#seq}" />
			</td>
			<td style="text-align:center;">
				<bu:ui colNo="EXECUTOR" formId="846ed3470b134d86aa1c860acc4e442c" value="%{EXECUTOR}" seq="%{#seq}" />
			</td>
			<td style="text-align:right;">
				<bu:ui colNo="PRE_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PRE_HOURS}" seq="%{#seq}" />
			</td>
			<td style="text-align:center;">
				<bu:ui colNo="PLAN_OVER_TIME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PLAN_OVER_TIME}" seq="%{#seq}" />
			</td>
			<td style="text-align:center;">
				<bu:ui colNo="FACT_BEG_TIME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{FACT_BEG_TIME}" seq="%{#seq}" />
			</td>
			<td style="text-align:center;">
				<bu:ui colNo="FACT_END_TIME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{FACT_END_TIME}" seq="%{#seq}" />
			</td>
			
		</tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
 </form>
  </div>
</div>
</div>
		<bu:submit viewId="39f4af7375f945bd849b88b4053c8592" />
		<bu:script viewId="39f4af7375f945bd849b88b4053c8592" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
	
    		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
    		}
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
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
		document.forms.searchForm.submit();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function selectCheck(e,thisObj){		    
		    if(e.target.type!='checkbox'){//非点击复选框单选
		           var trs=$(thisObj).parent('tbody').find('tr');  
		            $.each(trs,function(index,item){
		                 $(item).find('td:eq(0) input').prop('checked',false);
		             });
		            $(thisObj).find('td:eq(0) input').prop('checked',true);
		            
		     }
	}
	
	
	function init(){
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_tongLineColor(tableTrJs);
		});
		
		if($("#tbody_846ed3470b134d86aa1c860acc4e442c").find("tr").length == 0){
			$("#tbody_846ed3470b134d86aa1c860acc4e442c").height($(document).height() - 180);
		}

		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}
	
	<bu:funcsi viewId="39f4af7375f945bd849b88b4053c8592" funcId="8d984e0e4c3342de966b31741596e0a0"/>

</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
<script src="${path}plf/page/fp/js/iframe-design.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
