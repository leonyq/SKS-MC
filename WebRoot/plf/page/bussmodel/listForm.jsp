<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="表单模型列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
	</head>
<body>

<div>	
	<div>
	
		<form id="search_form" name="searchForm"
				action="${path}sys/BussModelAction_listForm.ms" method="post">
				<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>" />
				
				<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		        <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
				
				<!--  
				<div class="search_div">
					<div
						style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"
						class="search_text">
						<dict:lang value="表单ID" />
					</div>
					<div class="search_value">
						<s:textfield id="shMap_ID" name="paraMap.ID" cssClass="input_sh _VAL_DATABASE"
							maxlength="33" cssStyle="width:132px;" onkeyup="javascript:util.replaceLikeVal(this)" />
					</div>
				</div>
				<div class="search_div">
					<div
						style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"
						class="search_text">
						<dict:lang value="表单模型名称" />
					</div>
					<div class="search_value">
						<s:textfield id="shMap_PAGE_NAME" name="paraMap.FORM_NAME"
							cssClass="input_sh _VAL_DATABASE" maxlength="60" cssStyle="width:132px;" onkeyup="javascript:util.replaceLikeVal(this)" />
					</div>
				</div>
				<input type="button" value="<dict:lang value="查询" />"
					onclick="query(this)" class="botton_img_add" />
				-->
				
				<table class="search_table">
					<tr>
						<td>

					  	<div class="search_table_wrap">
				         <span><dict:lang value="表单ID" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="shMap_ID" name="paraMap.ID" 
							maxlength="33"  cssClass="input_sh" onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         <span><dict:lang value="表单模型名称" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="shMap_PAGE_NAME" name="paraMap.FORM_NAME"
							 maxlength="60"  cssClass="input_sh" onkeyup="javascript:util.replaceLikeVal(this)" />
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
				
			</form>
			
	<div class="table_div mc-table-container">
	<!-- left start -->
			<div class="mc-table-left" style="padding-right: 140px;">
				<!-- left content start -->
				<div class="mc-table-left-content">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width:40px;"><dict:lang value="序号" /></th>
			<th style="width:150px;"><dict:lang value="表单ID" /></th>
			<th style="width:200px;"><dict:lang value="表单模型名称" /></th>
			<th style="width:100px;"><dict:lang value="表单样式属性" /></th>
			<th ><dict:lang value="表单样式表" /></th>
			<th ><dict:lang value="行样式属性" /></th>
			<th ><dict:lang value="行样式表" /></th>
			<th ><dict:lang value="显示类型" /></th>
			<th ><dict:lang value="表单事件" /></th>
			<th ><dict:lang value="行事件" /></th>
			<!--  <th style="width:90px;"><dict:lang value="操作" />
				
				<a href="javascript:add();" title="<dict:lang value="新增" />" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></a>
				
			</th>-->
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="ID" />">
				<s:property value="ID" />
			</td>
			<td title='<s:property value="FORM_NAME"/>'><s:property value="FORM_NAME"/></td>
			<td><s:property value="FORM_CSS_STYLE"/></td>
			<td><s:property value="FORM_CSS_CLASS"/></td>
			<td title="<s:property value="ROW_CSS_STYLE"/>">
				<div style="width:80px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" >
					<s:property value="ROW_CSS_STYLE"/>
				</div></td>
			<td title="<s:property value="ROW_CSS_CLASS"/>">
				<div style="width:80px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" >
					<s:property value="ROW_CSS_CLASS"/>
				</div></td>
			<td><s:property value="SHOW_TYPE"/></td>
			<td><s:property value="FORM_FUN"/></td>
			<td><s:property value="ROW_FUN"/></td>
			<%-- 
			<td>
			
				<!--  
				<a href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
				-->
				
				<a class="layui-btn layui-btn-xs" href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" >修改
				</a>
				
				<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" >删除
				</a>
				
			</td>--%>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
				<!-- left content end -->
				
			</div>
			<!-- left end -->
			<!-- right start -->
			<div class="mc-table-right" style="width: 140px;">
				<table  class="table_list">
					<thead>
						<tr>
							<th style="width: 170px;"><dict:lang value="操作" />
								<!--  
								<a href="javascript:add();" title="<dict:lang value="新增" />" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></a>
								-->
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="page.dataList" status="index">
						<tr>
							<td>
			
								<!--  
								<a href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
								||<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
								-->
								
								<a class="layui-btn layui-btn-xs" href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" >修改
								</a>
								
								<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" >删除
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
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>
	--%>
	
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	
	function query(thisObj){
	if(!val.valDataBaseSetData()){
			
			return ;
		}
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		top.util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
    
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function closePopWin(){
		hidePopWin(false);
	}
	
	function add(){
		var mcIframeName = window.parent.name; //外层iframe的name
		var url = "${path}sys/BussModelAction_forAddForm.ms?paraMap.MID=<s:property value="paraMap.MID"/>&mcIframeName="+mcIframeName;
		showPopWin(url, 900, 430,null,"表单模型 新增");
	}
	
	function update(id){
		var mcIframeName = window.parent.name; //外层iframe的name
		var url = "${path}sys/BussModelAction_showFormTab.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ID="+id+"&mcIframeName"+mcIframeName;
		window.open(url);
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
		var mcIframeName = window.parent.name; //外层iframe的name
    	document.forms.submitForm.action="${path}sys/BussModelAction_delForm.ms?mcIframeName="+mcIframeName;
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);<%-- 设置table点击行颜色 --%>
		_tongLineColor(tableTrJs);<%-- 设置table隔行换颜色 --%>
	}
	
	$(function(){
		setTableStyle('listTable'); 
	    
	})

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>