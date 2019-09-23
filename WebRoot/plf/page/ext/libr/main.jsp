<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="主页面" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<div>

		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post"  >
			<input type="hidden" name="exeid" value="${exeid}" />
			
			<table class="table_list">
					<tr>
						<th width="30px;" style="cursor: pointer;" onclick="show('/mes/buss/bussModel.ms?exeid=7a8314e75d964c89ad63b2770440b430&FUNC_CODE=F242')" ><dict:lang value="视频" /></th>
						<th width="30px;" style="cursor: pointer;" onclick="show('/mes/buss/bussModel.ms?exeid=924fda8282a74fe7adb0cf80cbae9eb7&FUNC_CODE=F251')" ><dict:lang value="音频" /></th>
						<th width="30px;" style="cursor: pointer;" onclick="show('/mes/buss/bussModel.ms?exeid=b8ef1ef736a74fa5b9385a6576124640&FUNC_CODE=F257')" ><dict:lang value="文档" /></th>
						<th width="30px;" style="cursor: pointer;" onclick="" ><dict:lang value="图库" /></th>
						<th width="30px;" style="cursor: pointer;" onclick="show('/mes/buss/bussModel.ms?exeid=d4532be96ef8482c87fbdddf34c55881&FUNC_CODE=F263');" ><dict:lang value="全文检索" /></th>
						<th></th>
					</tr>
					<tr>
						<td colspan="5" width="100%">
							<iframe id="conIframe" src="" width="100%;" height="580px;"></iframe>
						</td>
					</tr>
			</table>

		</form>
		</div>
	</div>


	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function showRes(RES_TYPE,OPEN_URL){
			window.open(OPEN_URL);
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function show(url){
		$("#conIframe").attr("src",url);
	}

	
	function init(){
		{
		var mainheight = $("#conIframe").contents().find("body").height();
		//alert(mainheight);
		$("#conIframe").height(mainheight);
		}
	}
	

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
