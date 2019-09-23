<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="套件管理导出" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
				<jsp:param name="zTree" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/moduleMagAction_queryListModules.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							 <div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="套件名称" /></div>
								<div class ="search_value">
								<s:textfield id="nameShs" name="paraMap.nameShs" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="queryDate(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
			<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
			</form>
    <table id="listTable" style="table-layout: fixed;"  width="1000px" class="table_list">
		<thead>
		<tr class="tdcolor">
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="110px"><dict:lang value="套件名称" /></th>
			<th width="110px"><dict:lang value="套件展示名" /></th>
			<th width="110px"><dict:lang value="套件版本号" /></th>
			<th width="110px"><dict:lang value="套件说明" /></th>
			<th width="80px"><dict:lang value="操作" />
				<a href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF%>" /></a>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="modulesDtoList" id="configPage" status="index">
		<tr id="<s:property value="ID"/>">
			<td><s:property value="#index.count"/></td>
			
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="name"/>><s:property value="name"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="showName"/>><s:property value="showName"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="version"/>><s:property value="version"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="memo"/>><s:property value="memo"/></td>
			<td>
				<a href="javascript:modify('<s:property value="id"/>')" title="<dict:lang value="修改" />"><img src="${IMG_PATH}/m_modify.gif?_mc_res_version=<%=PlfStaticRes.M_MODIFY_GIF%>" /></a>
				||
				<a href="javascript:exportMod('<s:property value="id"/>');"  title="<dict:lang value="下载" />"><img src="${IMG_PATH}/ico-download.png?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>
				||
				<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" prefix="&nbsp;" >
				<img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>" />
				</a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	<input type="hidden" id="name" value="<s:property value="ajaxMap.name"/>">
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
		<form id="exportForm" action="${path}sys/moduleMagAction_exportMod.ms" method="post" target="submitFrame">
		</form>
			<div style="display: none;">
			<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
		</div>
</div>
<script type="text/javascript">
	function add()
	{
		var url = "${path}sys/moduleMagAction_toAddModules.ms";
		showPopWin(url, 1200, 800,null,"<dict:lang value="套件管理新增" />");
	}
	function modify(id){
		alert(id);
	var url = "${path}sys/moduleMagAction_toModifyModules.ms?paraMap.id="+id;
	showPopWin(url,  1200, 800,null,"<dict:lang value="套件管理修改" />");
	}
	function exportMod(id){
			document.getElementById("exportForm").action="${path}sys/moduleMagAction_exportMods.ms?paraMap.id="+id
			document.forms.exportForm.submit();
	}
	function flashPage(){
		query(document.getElementById("searchButtonId"));
	}
	function alertInfo(msg){
		util.alert(msg);
	}
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	//删除
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	function delConfirm(){
       	 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}sys/moduleMagAction_delModules.ms",
    		    data: "paraMap.id="+delId,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								util.alert("<dict:lang value="删除成功！" />");
    								reloadPgExe();
    							}else{
    								util.alert("<dict:lang value="操作失败" />:"+data.ajaxMap.msg);
    							}
         				}
    				},
    			error: function(msg){
    					if(msg!=null && msg!=''){
			                top.util.alert("error:"+msg);
			              }
    			  }
    			});		
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchFormDel.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	function queryDate(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>