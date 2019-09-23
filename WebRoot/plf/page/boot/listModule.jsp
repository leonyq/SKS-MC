<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模块管理" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
				<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div >	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/moduleMagAction_queryListModule.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		        <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		        
				<table class="search_table">
					<tr>
						<td>
						<!--  
						<td width="100%">
							 <div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="模块名称" /></div>
								<div class ="search_value">
								<s:textfield id="nameSh" name="paraMap.nameSh" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="queryDate(this)"  class="botton_img_add" />
						</td>
						-->
						
					  	<div class="search_table_wrap">
				         <span><dict:lang value="模块名称" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="nameSh" name="paraMap.nameSh"
							cssClass="input_sh" maxlength="300"  onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         
				          <div class="layui-input-inline">
				             <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
						     						     
						     <bu:funOper cssClass="layui-btn" funcNo="F143" type="a" href="javascript:add();" >新增</bu:funOper>
				          </div>
				        </div>
					  
					    </td>	
					</tr>
				</table>
			<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
			</form>
			
	<div class="table_div mc-table-container">
			<!-- left start -->
			<div class="mc-table-left">
				<!-- left content start -->
				<div class="mc-table-left-content">
    <table id="listTable"  class="table_list">
		<thead>
		<tr class="tdcolor">
			<th width="16px;"><dict:lang value="序号" /></th>
			<th width="110px"><dict:lang value="模块名称" /></th>
			<th width="160px"><dict:lang value="模块展示名" /></th>
			<th width="60px"><dict:lang value="模块版本号" /></th>
			<th width="110px"><dict:lang value="模块说明" /></th>
			
		</tr>
		</thead>
		<tbody>
	<s:iterator value="moduleDtoList" id="configPage" status="index">
		<tr id="<s:property value="ID"/>">
			<td><s:property value="#index.count"/></td>
			
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="name"/>><s:property value="name"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="showName"/>><s:property value="showName"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="version"/>><s:property value="version"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="memo"/>><s:property value="memo"/></td>
			
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	
	<!-- right start -->
			<div class="mc-table-right">
				<table  class="table_list">
					<thead>
						<tr>
							<th width="80px"><dict:lang value="操作" />
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="moduleDtoList" id="configPage" status="index">
						<tr ><td>
								<a class="layui-btn layui-btn-xs" href="javascript:modify('<s:property value="id"/>')" title="<dict:lang value="修改" />">修改</a>
								<a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:exportMod('<s:property value="id"/>');"  title="<dict:lang value="下载" />">下载</a>
								<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" prefix="&nbsp;" >删除</a>
							</td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
			</div>
			<!-- right end -->
	
	</div>
	<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	<input type="hidden" id="name" value="<s:property value="ajaxMap.name"/>">
	
	<%--
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
	--%>
	
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
	
	</div>
	
		<form id="exportForm" action="${path}sys/moduleMagAction_exportMod.ms" method="post" target="submitFrame">
		</form>
			<div style="display: none;">
			<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
		</div>
</div>
<script type="text/javascript">
	var page_order=null;
	function add()
	{
		var mcIframeName =  window.frameElement.name; //外层iframe的name
		var url = "${path}sys/moduleMagAction_moduleName.ms?mcIframeName="+mcIframeName;
		page_order="";
		showPopWin(url, 1100, 630,null,"<dict:lang value="模块管理" /> <dict:lang value="新增" />");
	}
	function modify(id){
		var mcIframeName =  window.frameElement.name; //外层iframe的name
		page_order="1,2,3,4,5,6,7,8,9,10,11";
		var url = "${path}sys/moduleMagAction_toModifyModule.ms?paraMap.id="+id+"&paraMap.PAGE_ORDER="+page_order+"&mcIframeName="+mcIframeName;
		showPopWin(url,  1100, 630,null,"<dict:lang value="模块管理" /> <dict:lang value="修改" />");
	}
	function exportMod(id){
			document.getElementById("exportForm").action="${path}sys/moduleMagAction_exportMod.ms?paraMap.id="+id
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
    		    url: "${path}sys/moduleMagAction_delModule.ms",
    		    data: "paraMap.id="+delId,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								top.util.alert("<dict:lang value="删除成功" />");
    								reloadPgExe();
    							}else{
    								top.util.alert("<dict:lang value="操作失败" />:"+data.ajaxMap.msg);
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
		/*
		_pageCurrentPageObj.value="1";
		document.forms.searchFormDel.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
		*/
		
		queryDate(thisObj);
	}
	function view(id){
		 $.ajax({
 			type: "POST",
 		    dataType: "json",
 		    url: "${path}sys/workMagAction_findClass.ms",
 		    data: "paraMap.id="+id,
 			success: function(data){
      				if(data.ajaxMap != null && data.ajaxMap != ""){
 							if(data.ajaxMap.status == "true"){
 								var id=data.ajaxMap.msg;
 								var url = "${path}sys/JClzAction_showView.ms?paraMap.CODE_ID="+id;
 								showPopWin(url, "95%", "100%",null,"<dict:lang value="自定义类" /> <dict:lang value="查看" />");
 							}else{
 								util.alert(data.ajaxMap.msg);
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
	function queryDate(thisObj){
		//_pageCurrentPageObj.value="1";
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