<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<style type="text/css">
		 table#listTable tr td input {
		 	border:none;
		 }
		</style>
	</head>
<body>

<div class="all">	
	<div>
	<div class="table_div">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width:40px;"><dict:lang value="序号" /></th>
			<th style="width:140px;"><dict:lang value="记录时间" /><span  ><img id="sortImage1" onclick="sortColumn('createDate')" style="vertical-align;middle;cursor:pointer"src="${IMG_PATH}/trig_log_order1.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER1_GIF%>" title="点击排序"/></span></th>
			<th style="width:60px;"><dict:lang value="日志类型" /><span ><img id="sortImage2"  onclick="sortColumn('logLevel')" style="vertical-align;middle;cursor:pointer" src="${IMG_PATH}/trig_log_order1.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER1_GIF%>" title="点击排序"/></span></th>
			<th ><dict:lang value="详细日志" /><span ><img id="sortImage3" onclick="sortColumn('logMsg')" style="vertical-align;middle;cursor:pointer"src="${IMG_PATH}/trig_log_order1.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER1_GIF%>" title="点击排序"/></span></th>
		</tr>
		</thead>
		<tbody id="listTbody">
	<s:iterator value="trigLogList" id="trigLog" status="index">
	<s:if test="${trigLog.logLevel==0}">
		<tr id="<s:property value="#trigLog.id"/>" >
		
			<td style="color:red;"><s:property value="#index.count"/></td>
			<td style="color:red;"><s:property value="#trigLog.createDate"/></td>
			<td style="color:red;">
			<dict:viewDict dictCode="ms_trigger_log_log_level" dictValue="${fn:escapeXml(trigLog.logLevel)}"/>
			<td style="color:red;"><div title="<s:property value="#trigLog.logMsg"/>" style="width:450px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"><s:property value="#trigLog.logMsg"/></div></td>
		</tr>
		
	</s:if>
	<s:else>
		<tr id="<s:property value="#trigLog.id"/>" >
		
			<td ><s:property value="#index.count"/></td>
			<td><s:property value="#trigLog.createDate"/></td>
			<td >
			<dict:viewDict dictCode="ms_trigger_log_log_level" dictValue="${fn:escapeXml(trigLog.logLevel)}"/>
			<td ><div title="<s:property value="#trigLog.logMsg"/>" style="width:450px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"><s:property value="#trigLog.logMsg"/></div></td>
		</tr>	
	</s:else>
	
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	<s:hidden id="createDateOrder" name="paraMap.createDateOrder"/>
	<s:hidden id="logLevelOrder" name="paraMap.logLevelOrder"/>
	<s:hidden id="logMsgOrder" name="paraMap.logMsgOrder"/>
	<s:hidden id="triggerId" name="paraMap.triggerId"/>
</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	var createDateOrder=$("#createDateOrder").val();
	var logLevelOrder=$("#logLevelOrder").val();
	var logMsgOrder=$("#logMsgOrder").val();
	var triggerId=$("#triggerId").val();
	function sortColumn(column){
		if(column=="createDate"){
			 orderAjax(column,createDateOrder,"createDateOrder")
		}
		if(column=="logLevel"){
			 orderAjax(column,logLevelOrder,"logLevelOrder")
		}
		if(column=="logMsg"){
			 orderAjax(column,logMsgOrder,"logMsgOrder")
		}
	}
	function orderAjax(column,order,type){
		$.ajax({
			type: "POST",
		    dataType: "json",
		    data: {
		    	"paraMap.column":column,
		    	"paraMap.triggerId":triggerId,
		    	"paraMap.order":order
		    },
		    url: "${path}sys/trigMagAction_orderColumn.ms",
			success: function(data){
				var trigLogList=data.ajaxMap.logList
				reList(trigLogList)
				if(type=="createDateOrder"){
					if(data.ajaxMap.createDateOrder=="0"){
						$("#sortImage1").attr("src","${IMG_PATH}/trig_log_order1.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER1_GIF%>");
					}else if(data.ajaxMap.createDateOrder=="1"){
						$("#sortImage1").attr("src","${IMG_PATH}/trig_log_order2.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER2_GIF%>");
					}else if(data.ajaxMap.createDateOrder=="2"){
						$("#sortImage1").attr("src","${IMG_PATH}/trig_log_order3.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER3_GIF%>");
					}
					createDateOrder=data.ajaxMap.createDateOrder;
				}
				if(type=="logLevelOrder"){
					if(data.ajaxMap.logLevelOrder=="0"){
						$("#sortImage2").attr("src","${IMG_PATH}/trig_log_order1.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER1_GIF%>");
					}else if(data.ajaxMap.logLevelOrder=="1"){
						$("#sortImage2").attr("src","${IMG_PATH}/trig_log_order2.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER2_GIF%>");
					}else if(data.ajaxMap.logLevelOrder=="2"){
						$("#sortImage2").attr("src","${IMG_PATH}/trig_log_order3.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER3_GIF%>");
					}
					logLevelOrder=data.ajaxMap.logLevelOrder;
				}
				if(type=="logMsgOrder"){
					if(data.ajaxMap.logMsgOrder=="0"){
						$("#sortImage3").attr("src","${IMG_PATH}/trig_log_order1.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER1_GIF%>");
					}else if(data.ajaxMap.logMsgOrder=="1"){
						$("#sortImage3").attr("src","${IMG_PATH}/trig_log_order2.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER2_GIF%>");
					}else if(data.ajaxMap.logMsgOrder=="2"){
						$("#sortImage3").attr("src","${IMG_PATH}/trig_log_order3.gif?_mc_res_version=<%=PlfStaticRes.TRIG_LOG_ORDER3_GIF%>");
					}
					logMsgOrder=data.ajaxMap.logMsgOrder;
				}
			},
			error: function(msg){
				util.closeLoading();
			}
		});
	}
	function reList(trigLogList){
		var listTbody=$("#listTbody");
		var context=null;
		var count=0;
		for(var i=0;i<trigLogList.length;i++){
			var date=trigLogList[i].createDate
			var date1=date.replace(/T/g,' ')
			count++
			if(i==0){
				if(trigLogList[i].logLevel==0){
					context="<tr id=\""+trigLogList[i].id+"\" style=\"background:red\">"
				}else{
					context="<tr id=\""+trigLogList[i].id+"\">"
				}
			}else{
				if(trigLogList[i].logLevel==0){
					context+="<tr id=\""+trigLogList[i].id+"\" style=\"background:red\">"
				}else{
					context+="<tr id=\""+trigLogList[i].id+"\">"
				}
			}
			context+="<td >"+count+"</td>"
			+"<td>"+date1+"</td>"
			if(trigLogList[i].logLevel==0){
				context+="<td>error</td>"
			}else{
				context+="<td>info</td>"
			}
			context+="<td><div style=\"width:450px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;\" title=\""+trigLogList[i].logMsg+"\">"+trigLogList[i].logMsg+"</div></td>"
			+"</tr>"
		}
		listTbody.html(context);
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>