<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="事物http" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}eventHttp/eventHttpManageAction_listEventHttp.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="名称" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_name" name="paraMap.name" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="请求类型" /></div>
								<div class ="search_value">
								<dict:selectDict name="paraMap.method" dictCode="RQ_TYPE" dictValue="%{paraMap.method}"/>				
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" style="table-layout: fixed;"  width="1000px" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="50px"><dict:lang value="序号" /></th>
			<th width="100px"><dict:lang value="名称" /></th>
			<th width="50px"><dict:lang value="请求方式" /></th>
			<th width="200px"><dict:lang value="详细" /></th>
			<th width="300px"><dict:lang value="url" /></th>
			<th width="5%"><dict:lang value="操作" />
				<bu:funOper funcNo="F625" type="a" href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF%>" /></bu:funOper>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr id="<s:property value="id"/>">
			<td><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="name"/>><s:property value="name"/></td>
			<td><dict:viewDict dictCode="RQ_TYPE" dictValue="%{method}" /></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="detail"/>><s:property value="detail"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="url"/>><s:property value="url"/></td>
			<td>
				<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" onclick="modify('%{id}');" title="%{getText('修改')}" >
					<img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF%>" />
				</bu:funOper>
				||
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="del('%{id}');" title="%{getText('删除')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>" />
				</bu:funOper>
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="link('%{id}');" title="%{getText('连接')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/m_view-.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF%>" />
				</bu:funOper>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>

</div>
<script type="text/javascript">
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
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
	
	function add(){
		var url = "${path}eventHttp/eventHttpManageAction_addUpdate.ms";
		showPopWin(url, 900, 500,null,"<dict:lang value="事物管理http" /> <dict:lang value="新增" />");
	}
	
	function modify(id){
		var url = "${path}eventHttp/eventHttpManageAction_addUpdate.ms?paraMap.id="+id;
		showPopWin(url, 900, 500,null,"<dict:lang value="事物管理http" /> <dict:lang value="修改" />");
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
    		    url: "${path}eventHttp/eventHttpManageAction_del.ms",
    		    data: "paraMap.id="+delId,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								util.alert("<dict:lang value="操作成功！" />");
    								query(document.getElementById("searchButtonId"));
    							}else{
    								util.alert("<dict:lang value="操作失败：" />:"+data.ajaxMap.msg);
    							}
         				}
    				},
    			error: function(msg){
    					util.closeLoading();
    					util.alert("error:"+msg);
    			  }
    			});		
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	function link(id){
		var url = "${path}eventHttp/eventHttpManageAction_link.ms?paraMap.id="+id;
		showPopWin(url, 900, 500,null,"<dict:lang value="事物管理http" /> <dict:lang value="连接" />");
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>