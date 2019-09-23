<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="音频子页" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
    <table class="add_table" >
			<tr >
				<td rowspan="7" width="230px;" style="padding: 0px;margin: 0px;">
				<img src="${path }images/ext/libr/pinyin.png" width="230" height="268" />
				</td>
			</tr>
			<tr>
				<td height="30px;" colspan="2">
				<SPAN style="font-size:20px"><s:property value="dataMap.NAME" /></SPAN>
				</td>
			</tr>
			<tr>
				<td width="60%">
				<dict:lang value="艺术家" />：<s:property value="dataMap.ARTIST" />
				</td>
				<td width="40%">
				<dict:lang value="热度" />：<s:property value="dataMap.HOT_NUM" />
				</td>
			</tr>
			<tr>
				<td>
				<dict:lang value="分类" />：<s:property value="dataMap.B_TYPE" />
				</td>
				<td>
				<dict:lang value="集数" />：<s:property value="dataMap.EPISODE" />
				</td>
			</tr>
			<tr>
				<td>
				<dict:lang value="浏览" />：<s:property value="dataMap.VIEW_NUM" />
				</td>
				<td>
				<dict:lang value="收藏" />：<s:property value="dataMap.FAVO_NUM" />
				</td>
			</tr>
			<tr>
				<td height="120px;" colspan="2">
				<dict:lang value="剧集介绍" />：<s:property value="dataMap.VIDO_PRES" />
				</td>
			</tr>
			<tr>
				<td height="44px;" colspan="2" valign="bottom">
				<input type="button" onclick="playVido('<s:property value="page.dataList[0].ID"/>');" style="cursor: pointer;border:none;background:url('${path }images/ext/libr/play.png') left top no-repeat;width:131px; height:41px;" />
				</td>
			</tr>
			<tr>
				<td height="40px;" colspan="3" valign="bottom">
				<SPAN style="font-size:18px"><dict:lang value="音频曲目" />(<s:if test="null==page.dataList">0</s:if><s:property value="page.dataList.size()" />)</SPAN>
				</td>
			</tr>
			<tr>
				<td height="44px;" colspan="3" valign="bottom">
				<s:iterator value="page.dataList" status="index">
				<a href="javascript:void(0);" onclick="playVido('<s:property value="ID"/>');">
				[<s:property value="VIDO_NO"/>]
				<s:property value="SHOW_NAME"/>
				</a>
				&nbsp;&nbsp;
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
	var openObj;
	function playVido(id){
		if(id == null || ""==id){util.alert("<dict:lang value='剧集列表为空，未找到相关音频' />");return;}
		var url = "${path}buss/bussModel.ms?exeid=4b57c26beca84ecdac917941d353e3cf&paraMap.ID="+id;
		if(null !=openObj){
			openObj.close();
		}
		openObj = window.open(url,"vidoWin");
	}
	
	
	function init(){
		
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
