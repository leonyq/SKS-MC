<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="cs发布版本" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>
<style>
.myButton {
	cursor: pointer;
	width: 66px;
	height: 24px;
	color: #da4901;
	font-size: 12px;
	line-height: 24px;
}
.layui-form-select{
        	width:180px !important ;
        }
</style>
<div class="" style="overflow-x: visible;">	
	<div>
	<form id="searchForm" class="layui-form" name="searchForm" action="${path}sys/CsUpdateAction_queryPage.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table" style="overflow: auto;">
					<tr>
						<td >
							<div class="search_table_wrap">
							<div class="layui-input-inline" style="width:180px;margin-right: 10px;clear:both">
							<dict:selectDict dictCode="MC_UPDATE_TYPE" dictValue="${fn:escapeXml(paraMap.TYPE)}" id="TYPE"  name="paraMap.TYPE"  onchange="queryType(this.value)"/>
							</div>
							<span style="width:120px;" title="系统当前版本号:<s:property value="paraMap.upjarVersion"/>">系统当前版本号:<s:property value="paraMap.upjarVersion"/></span>
						</div>
						<div class="search_table_wrap">	<!-- class="myButton" style="width:auto;align:right" -->
							<input type="button" value="<dict:lang value="上传文件" />" onclick="upload(this)"  class="layui-btn"/>
							<input type="button" value="<dict:lang value="发布版本" />" onclick="release(this)" class="layui-btn"/>
							<input type="button" value="<dict:lang value="自定义脚本" />" onclick="addscript(this)" class="layui-btn"/>
						</div>
						</td>
					</tr>
				</table>
	</form>
	<div class="table_div">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width:100px;"><dict:lang value="文件名" /></th>
			<th style="width:100px;"><dict:lang value="文件路径" /></th>
			<th style="width:100px;"><dict:lang value="说明" /></th>
			<th style="width:100px;"><dict:lang value="版本" /></th>
			<th style="width:100px;"><dict:lang value="状态" /></th>
			<th style="width:100px;"><dict:lang value="操作" />
			   <%--  <bu:funOper funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" >
			   		 <img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" />
			    </bu:funOper> --%>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td title=<s:property value="FILE_NAME"/>><s:property value="FILE_NAME"/></td>
			<td title=<s:property value="FILE_PATH"/>><s:property value="FILE_PATH"/></td>
			<td title=<s:property value="FILE_MEMO"/>><s:property value="FILE_MEMO"/></td>
			<td title=<s:property value="VERSION"/>><s:property value="VERSION"/></td>
			<td title=<s:property value="RELEASE_STATUS"/>><s:property value="RELEASE_STATUS"/>
			
			<!-- 已发布|未发布|未更新 -->
			</td>
			<td>				
				<a href="javascript:update('<s:property value="ID"/>')" title="" class="layui-btn layui-btn-xs">
				<dict:lang value="修改" /></a>
				<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" title="" class="layui-btn layui-btn-danger layui-btn-xs">
				<dict:lang value="删除" /></a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>

	<%-- <div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>--%>
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
	function queryType(vals){
		document.forms.searchForm.submit();
	}
	function query(thisObj){
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	$(function(){
		$("#TYPE").attr("lay-filter","queryType");
	});
	
	 layui.use('form', function(){
   	  var form = layui.form;
   	  //监听提交
   	  form.on('select(queryType)', function(data){
   		  var val = data.value;
   		document.forms.searchForm.submit();
         	form.render("select");
   	  });
   });
	
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
	
	function add(thisObj){
		var url = "${path}sys/UserCustomAction_showAddCommClass.ms?paraMap.UP_ID=<s:property value='paraMap.UP_ID' />&paraMap.TYPE="+TYPE;
		showPopWin(url, 800, 400,null,"<dict:lang value="公用类" /> <dict:lang value="新增" />");
	}
	
	function upload(thisObj){
		var TYPE=$("#TYPE").val();
		var url = "${path}sys/CsUpdateAction_uploadFile.ms?paraMap.TYPE="+TYPE+"&mcIframeName="+window.name;
		showPopWin(url, 450, 300,null,"<dict:lang value="上传文件" /> ");
	}
	
	function post(url,data, successFunc,errorFunc){
		jQuery.ajax({
		type: "POST",
	    dataType: "text",
	    url: url,
	    data:data,
		success: successFunc,
		error: errorFunc
		});
	}
	
	function release(thisObj){
		 var url = "${path}sys/CsUpdateAction_releaseVersion.ms";
		 var TYPE=$("#TYPE").val();
		 var data = {'paraMap.key':'oh key','paraMap.val':'values','paraMap.type':TYPE};
		 var sucfunc = function(data){
			 reloadPg(data);
			 };
		 var errfunc = function(msg){reloadPg(data);};
		 post(url,data,sucfunc,errfunc);
	}
	
	function addscript(thisObj){
		var url = "${path}sys/CsUpdateAction_customScript.ms?paraMap.TYPE="+TYPE+"&mcIframeName="+window.name;
		showPopWin(url, 800, 500,null,"<dict:lang value="自定义脚本" />");
	}
	
	var isModify=false;
	function closePopCbFun(){
		if(isModify){
			reloadPg();
		}
		return true;
	}
	
	function closePopWin(){
		hidePopWin(false);
	}
	
	function update(id){
		var url = "${path}sys/CsUpdateAction_update.ms?paraMap.ID="+id+"&mcIframeName="+window.name;
		//window.top.showPopWin(url, "95%", "100%",closePopCbFun,"<dict:lang value="自定义类" /> <dict:lang value="修改" />");
		showPopWin(url, 450, 300,closePopCbFun,"<dict:lang value="更新操作" /> ");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/CsUpdateAction_delete.ms";
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
		var url = "${path}sys/UserCustomAction_showView.ms?paraMap.CODE_ID="+id;
		showPopWin(url, "95%", "100%",closePopCbFun,"<dict:lang value="自定义类" /> ");
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>