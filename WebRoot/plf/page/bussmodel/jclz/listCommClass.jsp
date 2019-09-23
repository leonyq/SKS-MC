<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用类列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/JClzAction_listCommClass.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<s:hidden name="paraMap.UP_ID" />
			<s:hidden name="paraMap.checkId" id="checkId"/>
			<s:hidden name="paraMap.workDec" id="workDec"/>
			<s:hidden name="paraMap.tri" id="tri"/>
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="编号" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_ID" name="paraMap.ID" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="类名称" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_CLASS_NAME" name="paraMap.CLASS_NAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="类说明" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_CLASS_DESC" name="paraMap.CLASS_DESC" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" class="table_list table-left" >
		<thead>
		<tr class="tdcolor">
			<s:if test="1==paraMap.tri">
				<th width="8%"><dict:lang value="单选按钮" /></th>
			</s:if>
			<th><dict:lang value="序号" /></th>
			<th style="display:none;width:5%"><dict:lang value="编号" /></th>
			<th><dict:lang value="类名称" /></th>
			<th><dict:lang value="类说明" /></th>
			<th style="display:none"><dict:lang value="类编号" /></th>
			<!--
			<th><dict:lang value="上级类" /></th>
			<th><dict:lang value="类型" /></th>
			-->
			<s:if test="1!=paraMap.tri">
			<th><dict:lang value="操作" />
			    <bu:funOper funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
			</th>
			</s:if>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index" id="x">
		<tr>
		
			<s:if test="1==paraMap.tri">
				<s:if test="#x.ID==paraMap.checkId">
					<td><input type="radio" name="button"  checked="checked"  onClick="check('<s:property value="ID"/>','<s:property value="CLASS_DESC"/>');"/></td>
				</s:if>
				<s:else>
					<td><input type="radio" name="button" onClick="check('<s:property value="ID"/>','<s:property value="CLASS_DESC"/>');"/></td>
				</s:else>
			</s:if>
			
			<td><div style="width:30px;" class="nowrap_ellipsis" ><s:property value="#index.count"/></div></td>
			<td style="display:none"><div  class="nowrap_ellipsis" title=<s:property value="ID"/>><s:property value="ID"/></div></td>
			<td><div  class="nowrap_ellipsis" title=<s:property value="CLASS_NAME"/>><s:property value="CLASS_NAME"/></div></td>
			<td><div style="width:200px;"  class="nowrap_ellipsis" title=<s:property value="CLASS_DESC"/>><s:property value="CLASS_DESC"/></div></td>
			<td style="display:none"><div  class="nowrap_ellipsis" title=<s:property value="MS_CLASS_CODE_ID"/>><s:property value="MS_CLASS_CODE_ID"/></div></td>
			<!--
			<td><div style="width:80px;" class="nowrap_ellipsis" ><s:property value="UP_DESC"/></div></td>
			<td><div style="width:50px;" class="nowrap_ellipsis" ><s:property value="MS_CLASS_TYPE_NAME"/></div></td>
			-->
			<s:if test="1!=paraMap.tri">
			<td>
				<a href="javascript:view('<s:property value="MS_CLASS_CODE_ID"/>')" title="<dict:lang value="查看" />"><img src="${IMG_PATH}/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>||
				<a href="javascript:update('<s:property value="ID"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
			</td>
			</s:if>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	<%--<s:hidden name="paraMap.checkId" id="checkId"/>
	<s:hidden name="paraMap.workDec" id="workDec"/>
	--%><div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm&paraMap.tri=1" />
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
		/* <s:if test="1==paraMap.tri">
			document.forms.searchForm.action="${path}sys/JClzAction_listCommClass.ms?paraMap.tri=1";
		</s:if> */
		document.forms.searchForm.action="${path}sys/JClzAction_listCommClass.ms";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);};
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		if(null !=msg){
			util.alert(msg,reloadPgExe);
		}
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(url){
		url = "${path}sys/JClzAction_showAddCommClass.ms?paraMap.UP_ID=<s:property value='paraMap.UP_ID' />";
		showPopWin(url, 800, 400,null,"<dict:lang value="公用类" /> <dict:lang value="新增" />");
	}
	var isModify=false;
	function closePopCbFun(){
		if(isModify){
			reloadPg();
		}
		return true;
	}
	
	function update(id){
		var url = "${path}sys/JClzAction_showEditCommClass.ms?paraMap.ID="+id;
		//window.top.showPopWin(url, "95%", "100%",closePopCbFun,"<dict:lang value="自定义类" /> <dict:lang value="修改" />");
		showPopWin(url, "95%", "100%",closePopCbFun,"<dict:lang value="自定义类" /> <dict:lang value="修改" />");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/JClzAction_delCommClass.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}

	function view(id){
		if(null==id||""==id){
			util.alert("类编号为空不能查看！");
			return;
		}
		var url = "${path}sys/JClzAction_showView.ms?paraMap.CODE_ID="+id;
		showPopWin(url, "95%", "100%",closePopCbFun,"<dict:lang value="自定义类" /> <dict:lang value="" />");
	}
	
	//
	function check(checkId,workDec){
		parent.checkData(checkId,workDec);
	}
	$(function(){
		var checkId=$("#checkId").val();
		var workDec=$("#workDec").val();
		if(checkId!=""){
			check(checkId,workDec)
		}
		
	})
	
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>