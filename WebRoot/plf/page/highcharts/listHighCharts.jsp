<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp"/>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}comm/WorkFlowAction_listWorkFlowChart.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="流程名称" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_TITLE" name="paraMap.TITLE" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="备注" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_MEMO" name="paraMap.MEMO" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="15%"><dict:lang value="流程名称" /></th>
			<th width="10%"><dict:lang value="备注" /></th>
			<th width="8%"><dict:lang value="操作" />
				<bu:funOper funcNo="F625" type="a" href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr id="<s:property value="id"/>">
			<td><s:property value="#index.count"/></td>
			<td><s:property value="title"/></td>
			<td><s:property value="memo"/></td>
			<td><a title="<dict:lang value="查看 "/>" href="javascript:view('<s:property value="id"/>');"><img src="${IMG_PATH}/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>
				<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" onclick="modify('%{id}');" title="%{getText('修改')}" >
					<img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" />
				</bu:funOper>
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="del('%{id}');" title="%{getText('删除')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" />
				</bu:funOper>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>

	<div class="center">
		<s:include value="/common/pagination.jsp?formId=searchForm" />
	</div>

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
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
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(){
		var url = "${path}comm/WorkFlowAction_forEditWorkFlowChart.ms";
		//window.location.href = url;
		window.open(url);
		//openPostWindow(url,"","");
		//showPopWin(url, "100%", "100%",null,"<dict:lang value="公用页面" /> <dict:lang value="修改" />");
	}
	
	function modify(id){
		var url = "${path}comm/WorkFlowAction_forEditWorkFlowChart.ms?paraMap.id="+id;
		window.open(url);
		//openPostWindow(url,id,blocks,conn,"");
		//showPopWin(url, "100%", "100%",null,"<dict:lang value="公用页面" /> <dict:lang value="修改" />");
	}
	
	function view(id){
		var url = "${path}comm/WorkFlowAction_forEditWorkFlowChart.ms?paraMap.id="+id+"&paraMap.model=view";
		window.open(url);
		//openPostWindow(url,id,blocks,conn,"");
		//showPopWin(url, "100%", "100%",null,"<dict:lang value="公用页面" /> <dict:lang value="修改" />");
	}	
	
	//post方法打开window.open
	function openPostWindow(url,data,name){
		var tempForm = document.createElement("form");
		tempForm.id = "tempForm1";
		tempForm.method = "post";
		tempForm.action = url;
		tempForm.target = name;
		 
		var hideInput = document.createElement("input");
		hideInput.type = "hidden";
		hideInput.name = "paraMap.content";
		hideInput.value = data;
		
		/*var hideInput1 = document.createElement("input");
		hideInput1.type = "hidden";
		hideInput1.name = "paraMap.conn";
		hideInput1.value = conn;
		
		var hideInput2 = document.createElement("input");
		hideInput2.type = "hidden";
		hideInput2.name = "paraMap.id";
		hideInput2.value = id;*/
		
		tempForm.appendChild(hideInput);
		//tempForm.appendChild(hideInput1);
		//tempForm.appendChild(hideInput2);
		
		if(util.isIE()){
			tempForm.attachEvent("onsubmit",function(){
					openWindow(name);
				});
			
			document.body.appendChild(tempForm);
			
			tempForm.fireEvent("onsubmit");
		}else{
			tempForm.addEventListener("onsubmit",function(){
					openWindow(name);
				});
			
			document.body.appendChild(tempForm);
			
			//tempForm.dispatchEvent("onsubmit");			
		}
		tempForm.submit();
		document.body.removeChild(tempForm);
	}
	
	function openWindow(name){
		window.open("about:blank",name);
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
    		    url: "${path}comm/WorkFlowAction_delWorkFlowChartAx.ms",
    		    data: "paraMap.id="+delId,
    			success: function(data){
    					util.closeLoading();
    					if(data.ajaxMap != null && data.ajaxMap != ""){
         					if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								util.alert("<dict:lang value="操作成功！" />");
    							}else{
    								util.alert("<dict:lang value="操作失败：" />:"+msg);
    							}
    							
    							query(document.getElementById("searchButtonId"));
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

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>