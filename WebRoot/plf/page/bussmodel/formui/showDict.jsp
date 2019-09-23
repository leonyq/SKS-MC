<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="数据字典列表" /></title>
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
		  table#listTable tr td:nth-child(3){
		 	white-space: nowrap;overflow:hidden;text-overflow: ellipsis;
		 }
		 input[type='radio']{
		   height: 18px;
		 }
		</style>
	</head>
<body>

<div >	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/BussModelAction_showDict.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		    <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		        
				<table class="search_table">
					<tr>
						<td>
						<!--  
						<td width="100%">
							<div class="search_div"style="width: 165px" >
								<div  style="width: 25px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="编码" /></div>
								<div class ="search_value">
								<s:textfield id="dictDtoSearch_code" name="dictDtoSearch.code" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div" style="width: 190px">
								<div  style="width: 40px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="编码值" /></div>
								<div class ="search_value">
								<s:textfield id="dictDtoSearch_value" name="dictDtoSearch.value" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query()"  class="botton_img_add" />
							
							<input type="button" id="addButtonId" value="<dict:lang value="提交" />" onclick="add()"  class="botton_img_add" />
							<input type="button" id="cancelButtonId" value="<dict:lang value="取消" />" onclick="parent.closePopWin();"  class="botton_img_search" />
					
						</td>
						-->
						
					  	<div class="search_table_wrap">
				         <span><dict:lang value="编码" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="dictDtoSearch_code" name="dictDtoSearch.code" cssClass="input_sh" maxlength="33"  />
							
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         <span><dict:lang value="编码值" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="dictDtoSearch_value" name="dictDtoSearch.value" cssClass="input_sh" maxlength="300" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         
				          <div class="layui-input-inline">
				            <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
						     						     						     
						     <input type="button" id="addButtonId" value="<dict:lang value="提交" />" onclick="add()"  class="layui-btn" />
							 <input type="button" id="cancelButtonId" value="<dict:lang value="取消" />" onclick="closePopWin();"  class="layui-btn" />
						     
				          </div>
				        </div>
						
						</td>
					</tr>
				</table>
	</form>
	
	<div class="table_div">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width:40px;"></th>
			<th style="width:40px;"><dict:lang value="序号" /></th>
			
			<th style="width:200px;"><dict:lang value="编码" /></th>
			<th ><dict:lang value="编码值" /></th>
		</tr>
		</thead>
		<tbody>
			<s:iterator value="list" status="index" id="dict">
						<tr  onclick="setModify(this)">
							<td >
							<s:if test="${paraMap.UI_DATA_3==dict.code}">
											<input type="radio" name="radioId" value="<c:out value='${dict.dictId}'/>"  style="margin:0" checked="checked">
											</s:if>
											<s:else>
											<input type="radio" name="radioId" value="<c:out value='${dict.dictId}'/>"  style="margin:0"><!-- 复选框 -->
							</s:else>
							</td>
							<td ><s:property value="#index.count"/></td>
							<td  id="code_${index.index}" ><s:property value="code"/></td>
							<td ><s:property value="value"/></td>
						</tr>
					</s:iterator> 
	</tbody>
	</table>
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
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	var listTable = $("#listTable");
	function query(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}

	function reloadPgExe(msg){
		document.forms.searchForm.submit();
	}
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	function setModify(obj){
		$(obj).find("td").find("input[type='radio']").prop("checked",true);
		$(obj).addClass('selected').siblings().removeClass('selected');
	}
	function add(){
		var radioId=$('input[name="radioId"]:checked').val();
		if(radioId==undefined||radioId==null){
			util.alert("<dict:lang value="请至少选择一条记录" />");
			return false;
		}
		listTable.find("tbody tr").each(function(seq) {
			if($(this).find("td").eq(0).find("input[type='radio']").prop("checked")){
				var code=$("#code_"+seq).html();
				
				var mcIframeName="${mcIframeName}";
				var obj={"mcIframeName":mcIframeName,"type":"window"};	
				$("#paraMap_UI_DATA_3",getSrcByIframeName(obj).frames['mainFrame'].document).val(code);
			}
		})
		//parent.closePopWin();
		closePopWin();
	}
	
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>