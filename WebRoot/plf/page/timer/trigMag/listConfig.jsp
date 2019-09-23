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
		 table#listTable tr td:nth-child(2){
		 	white-space: nowrap;overflow:hidden;text-overflow: ellipsis;
		 	
		 }
		  table#listTable tr td:nth-child(5){
		 	white-space: nowrap;overflow:hidden;text-overflow: ellipsis;
		 }
		</style>
	</head>
<body>

<div>	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/trigMagAction_queryListConfig.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		        <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		        
				<table class="search_table">
					<tr>
						<!--  
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="触发器名称" /></div>
								<div class ="search_value">
								<s:textfield id="triggerName" name="trigsh.triggerName" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="描述信息" /></div>
								<div class ="search_value">
								<s:textfield id="dec" name="trigsh.dec" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<s:hidden name="moduleId"></s:hidden>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
						-->
						<td >
						
					  	<div class="search_table_wrap">
				         <span><dict:lang value="触发器名称" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="triggerName" name="trigsh.triggerName" cssClass="input_sh"
							 maxlength="33"  onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         <span><dict:lang value="描述信息" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="dec" name="trigsh.dec"
							cssClass="input_sh" maxlength="300"  onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				          <s:hidden name="moduleId"></s:hidden>		
				          <div class="layui-input-inline">
				             <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
						     						     
						     <bu:funOper cssClass="layui-btn" funcNo="F143" type="a" href="javascript:add();" >新增</bu:funOper>
				          </div>
				        </div>
					  	
					  	</td>
					</tr>
				</table>
	</form>
	
	<div class="table_div mc-table-container">
			<!-- left start -->
			<div class="mc-table-left" style="padding-right: 250px;">
				<!-- left content start -->
				<div class="mc-table-left-content">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width:40px;"><dict:lang value="序号" /></th>
			<th style="width:150px;"><dict:lang value="触发器名称" /></th>
			<th style="width:150px;"><dict:lang value="执行频率" /></th>
			<th style="width:120px;"><dict:lang value="描述信息" /></th>
			<th style="width:45px;"><dict:lang value="日志" /></th>
			
		</tr>
		</thead>
		<tbody>
		
	<s:iterator value="trigList" id="trigger" status="index">
		<tr id="<s:property value="#trigger.id"/>">
			<td ><s:property value="#index.count"/></td>
			<td title="<c:out value='${trigger.triggerName}'/>"/><c:out value='${trigger.triggerName}'/></td>
			<td title="<s:property value="#trigger.pageExp"/>"><s:property value="#trigger.pageExp"/></td>
			
			<td title="<s:property value="#trigger.dec"/>"><s:property value="#trigger.dec"/></td>
			<td><a href="javascript:void(0);" class="layui-btn layui-btn-normal layui-btn-xs" onclick="checkLog('<c:out value='${trigger.id}'/>','<c:out value='${trigger.triggerName}'/>')"><dict:lang value="查看" /></a></td>
			
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	
	<!-- right start -->
			<div class="mc-table-right" style="width: 250px;">
				<table  class="table_list">
					<thead>
						<tr class="tdcolor">
							<th ><dict:lang value="操作" />
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="trigList" id="trigger" status="index">
						<tr>
							<td>
								
								<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="edit('<s:property value="id"/>');" title="<dict:lang value="修改触发器" />"  prefix="&nbsp;" >
									修改
								</a>
								<a href="javascript:void(0);" class="layui-btn layui-btn-danger layui-btn-xs" onclick="force('<s:property value="id"/>');" title="<dict:lang value="强制关闭触发器" />" prefix="&nbsp;" >
									强制关闭
								</a>
								&nbsp;
								<s:hidden id= "status_%{#trigger.id}" value="%{#trigger.status}" />
								<s:if test="#trigger.status==@com.more.fw.core.common.method.ConstantsMc@TRIG_OPEN">
									<a href="javascript:void(0);" onclick="opera('<s:property value="id"/>');"  prefix="&nbsp;" class="layui-btn layui-btn-normal layui-btn-xs layui-bg-orange">
									<span id="trigGif_<c:out value='${trigger.id}'/>" title="关闭触发器">关闭</span>
									</a>
								</s:if>
								<s:else>
									<a href="javascript:void(0);" onclick="opera('<s:property value="id"/>');"  prefix="&nbsp;" class="layui-btn layui-btn-normal layui-btn-xs">
									<span id="trigGif_<c:out value='${trigger.id}'/>" title="开启触发器">开启</span>
									</a>
								</s:else>
								
								<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="id"/>')" title="<dict:lang value="删除" />"  >
									删除
								</a>
							</td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
			</div>
			<!-- right end -->
	
	</div>
	</div>
<%--
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
--%>

<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
	
</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">

function reloadPg(msg){
	util.alert(msg,reloadPgExe);
}

function reloadPgExe(msg){
	document.forms.searchForm.submit();
}

function add(){
	var mcIframeName = window.parent.name; //外层iframe的name
	var url = "${path}sys/trigMagAction_toAddTrig.ms?moduleId="+"<s:property value='moduleId'/>"+"&mcIframeName="+mcIframeName;
	showPopWin(url, 720, 640,null,"<dict:lang value="触发器" /> <dict:lang value="新增" />");
}

function edit(id){
	var status =$("#status_"+id).val();
	var mcIframeName = window.parent.name; //外层iframe的name
	var url = "${path}sys/trigMagAction_toEditTrig.ms?moduleId="+"<s:property value='moduleId'/>&paraMap.id="+id+"&mcIframeName="+mcIframeName;
	showPopWin(url, 720, 640,null,"<dict:lang value="触发器" /> <dict:lang value="修改" />");
}
var operId
var closeType
function force(id) {
	operId=id
	var status=$("#status_"+id).val();
	if(status=="0"){
		util.alert("不能强制关闭已经关闭的触发器");
		return
	}
	closeType="force";
	util.confirm(forceClose,"是否强制关闭触发器（如果强制关闭定时器，会关闭其正在运行的任务）");
}
function forceClose(){
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"paraMap.id":operId
	    },
	    url: "${path}sys/trigMagAction_forceClose.ms",
		success: function(data){
			util.closeLoading();
			
			//$("#trigGif_"+operId).attr("src","${IMG_PATH}/trig_close.gif?_mc_res_version=<%=PlfStaticRes.TRIG_CLOSE_GIF%>");
			$("#trigGif_"+operId).html("开启");
			$("#trigGif_"+operId).attr("title","开启触发器");
			$("#trigGif_"+operId).parent().attr("class","layui-btn layui-btn-normal layui-btn-xs");
			
			$("#status_"+operId).val("0");
			util.alert("强制关闭成功");
		},
		error: function(msg){
			util.closeLoading();
			util.alert("强制关闭失败");
		}
	});
}
function checkSys(){
	$.ajax({
		type : "POST",
		dataType : "json",
		aysnc:true,
		url : "${path}sys/trigMagAction_checkSys.ms",
		data : {"paraMap.id":operId},
		success : function(data) {
			if(data.ajaxMap.status=="true"){
				if(closeType=="force"){
					forceClose()
				}else{
					closeTrig();
				}
			}else{
				util.closeLoading();
				util.alert(data.ajaxMap.info);
			}
		},
		error : function(msg) {
			util.closeLoading();
			util.alert("关闭失败");
		}
	});
}
function opera(id) {
	var status=$("#status_"+id).val();
	
	if(status=="0"){
		operId=id
		util.confirm(checkOpenTrig,"是否开启触发器");
	}
	if(status=="1"){
		operId=id;
		closeType="close";
		util.confirm(closeTrig,"是否关闭触发器");
	}
	
}
function checkOpenTrig(){
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"paraMap.id":operId
	    },
	    url: "${path}sys/trigMagAction_checkOpenTrig.ms",
		success: function(data){
			if(data.ajaxMap.status=="true"){
				openTrig();
			}else{
				util.closeLoading();
				util.alert(data.ajaxMap.info);
			}
		},
		error: function(msg){
			util.closeLoading();
			util.alert("开启失败");
		}
	});
}
function openTrig(){
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"paraMap.id":operId
	    },
	    url: "${path}sys/trigMagAction_openTrig.ms",
		success: function(data){
			util.closeLoading();
			//$("#trigGif_"+operId).attr("src","${IMG_PATH}/trig_open.gif?_mc_res_version=<%=PlfStaticRes.TRIG_OPEN_GIF%>");
			$("#trigGif_"+operId).html("关闭");
			$("#trigGif_"+operId).parent().attr("class","layui-btn layui-btn-normal layui-btn-xs layui-bg-orange");
			
			$("#trigGif_"+operId).attr("title","关闭触发器");
			$("#status_"+operId).val("1");
			util.alert("开启成功");
		},
		error: function(msg){
			util.closeLoading();
			util.alert("开启失败");
		}
	});
}
function closeTrig(){
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"paraMap.id":operId
	    },
	    url: "${path}sys/trigMagAction_closeTrig.ms",
		success: function(data){
			util.closeLoading();
			
			//$("#trigGif_"+operId).attr("src","${IMG_PATH}/trig_close.gif?_mc_res_version=<%=PlfStaticRes.TRIG_CLOSE_GIF%>");
			$("#trigGif_"+operId).html("开启");
			$("#trigGif_"+operId).parent().attr("class","layui-btn layui-btn-normal layui-btn-xs");
			
			$("#trigGif_"+operId).attr("title","开启触发器");
			$("#status_"+operId).val("0");
			util.alert("关闭成功");
			
		},
		error: function(msg){
			util.closeLoading();
			util.alert("关闭失败");
		}
	});
}
function query(thisObj){
	//_pageCurrentPageObj.value="1";
	document.forms.searchForm.submit();
	thisObj.onclick = function(){util.alert(util.submit_default_info);}
	util.showTopLoading();
}
function  checkLog(id,name){
	var url = "${path}sys/trigMagAction_toCheckLog.ms?paraMap.id="+id;
	showPopWin(url, 800, 450,null,"<dict:lang value='日志' /> <dict:lang value='查看' />" );
}

var delId;
function del(id) {
	delId = id;
	top.util.confirmall(checkDel,"确定是否删除");
}
function checkDel(){
	$.ajax({
		type : "POST",
		dataType : "json",
		aysnc:true,
		url : "${path}sys/trigMagAction_checkDel.ms",
		data : {"paraMap.id":delId},
		success : function(data) {
			
			if(data.ajaxMap.status=="true"){
				delConfirm();
			}else{
				util.closeLoading();
				util.alert(data.ajaxMap.info);
			}
		},
		error : function(msg) {
			util.closeLoading();
			util.alert("删除失败");
		}
	});
}
function alertInfo(msg){
	isSubmit = false;
	util.alert(msg);
}
function delConfirm() {
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "${path}sys/trigMagAction_deleteTrig.ms",
		data : {"paraMap.id":delId},
		success : function(data) {
			util.closeLoading();
			//util.alert("删除成功");
			window.document.location.reload();
		},
		error : function(msg) {
			util.closeLoading();
			//util.alert("删除失败");
		}
	});
}

function init() {
	var tableTrJs = $("#listTable tbody tr");
	_toClickColor(tableTrJs);
	_tongLineColor(tableTrJs);
}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>