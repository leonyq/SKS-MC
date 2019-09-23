<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="任务和钉钉企业用户关联配置列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<form id="search_form" name="searchForm" action="${path}ding/dingAction_listTask.ms"  method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<table class="search_table">
		<tr>
				<td width="100%">
					<div class="search_div" style="margin-left: 0px;">
						<div  style="width: 65px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="任务类型" /></div>
						<div class ="search_value">
						<s:select name="paraMap.TASK_TYPE" list="#{-1:'-请选择-',0:'EMAIL任务',1:'HTTP任务',2:'WEBSERVICE任务'}" listKey="key" listValue="value"></s:select>
	
						</div>
					</div>
					
					<div class="search_div" style="margin-left: 30px;">
						<div  style="width: 65px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="任务描述" /></div>
						<div class ="search_value">
						<s:textfield id="TASK_NAME" name="paraMap.TASK_NAME" cssClass="input" maxlength="100"/>
	
						</div>
					</div>


 					<input style="margin-left: 30px;" type="button" value="<dict:lang value="查询" />" onclick="queryding();" class="botton_img_search">
 					
				</td>
			
			 	
	
		    </td>
	    </tr>
	</table>
	</form>
	
	<div>

    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="10%"><dict:lang value="任务类型" /></th>
			<th width="10%"><dict:lang value="任务描述" /></th>
			
			<th width="8%"><dict:lang value="操作" />
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			
			<td>
				<s:if test="TYPE == \"0\" ">
					EMAIL任务
				</s:if>
				<s:if test="TYPE == \"1\" ">
					HTTP任务
				</s:if>
				<s:if test="TYPE == \"2\" ">
					WEBSERVICE任务
				</s:if>
				
			</td>
			
			<td><s:property value="TITLE"/></td>
			
			<td>

				<a href="javascript:void(0);" onclick="configding('<s:property value="ID"/>','<s:property value="TYPE"/>');" title="<dict:lang value="" />" >
				<img src="${IMG_PATH}/m_set.gif?_mc_res_version=<%=PlfStaticRes.M_SET_GIF %>" /></a>

			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	function queryding(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function configding(id,type){
		var url = "${path}ding/dingAction_showAddTaskDing.ms?paraMap.TYPE="+type+"&paraMap.TASK_ID="+id;
		showPopWin(url, 950, 590,null,"任务和钉钉企业用户关联配置");
		
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg,reloadPgCf);
	}
	
	function reloadPgCf(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(url){
		showPopWin(url, 800, 400,null,"新增");
	}
	
	function update(id){
		var url = "${path}sys/BussModelAction_showEditAccount.ms?paraMap.ID="+id;
		showPopWin(url, 800, 400,null,"修改");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/BussModelAction_delAccount.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);<%-- 设置table点击行颜色 --%>
		_tongLineColor(tableTrJs);<%-- 设置table隔行换颜色 --%>
	}

</script>

<%@ include file="/plf/common/pub_dom.jsp" %>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>