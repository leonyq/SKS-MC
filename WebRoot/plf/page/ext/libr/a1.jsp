<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="音频主页" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
    <table class="table_list" >
			<tr>
				<td>
				<s:iterator value="page.dataList" status="index">
					<div class="div_auto_wrap_single" style="width: 200px;border:1px solid white;" onmouseover="showBorder(this);" onmouseout="showBorderOut(this);">
						<div class="search_auto_wrap" style="width: 198px;height: 220px;">
						<div><img src="${path }images/ext/libr/pinyin.png" height="141" width="196" style="cursor: pointer;" onclick="showVidoChild(this,'<s:property value="ID"/>');" /></div>
						<div style="cursor: pointer;" onclick="showVidoChild(this,'<s:property value="ID"/>');" ><s:property value="NAME"/></div>
						<div style="text-align: left;background-color: #cf3937;"><dict:lang value="浏览" />:<s:property value="VIEW_NUM"/></div>
						<div style="text-align: left;"><dict:lang value="来源" />:<s:property value="SOURCE"/></div>
						</div>
					</div>
				</s:iterator>
				</td>
			</tr>
		</table>
		</form>
		</div>
	</div>
	
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=listForm&resetSearchVal=resetSearchVal" />
	</div>
	
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function showBorder(thisObj){
		$(thisObj).css("border"," 1px solid blue");
	}
	function showBorderOut(thisObj){
		$(thisObj).css("border"," 1px solid white");
	}
	function showVidoChild(thisObj,id){
		var url = "${path}buss/bussModel.ms?exeid=b27ddd6b3c8944caa6fe247498d5258c&paraMap.ID="+id;
		window.open(url);
	}
	
	
	function init(){
		
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
