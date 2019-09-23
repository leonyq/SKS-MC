<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="自定义报表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/seq_mng/SeqAction_ListPage.ms" method="post">
			<s:hidden name="paraMap.MID" />
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"
								 class="search_text" ><dict:lang value="自定编号" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_DEF_ID" name="paraMap.DEF_ID" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" value="查询" onclick="query(this)"  class="botton_img_search" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="30%"><dict:lang value="自定编号" /></th>
			<th width="5%"><dict:lang value="初始步长" /></th>
			<th width="20%"><dict:lang value="最大值" /></th>
			<th width="5%"><dict:lang value="是否循环" /></th>
			<th width="10%"><dict:lang value="现在数量" /></th>
		 
			<th width="13%"><dict:lang value="操作" />
			    <bu:funOper funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td><s:property value="DEF_ID"/></td>
			<td><s:property value="INIT_STEP"/> </td>
			<td><s:property value="SEQ_MAX_VAL"/> </td>
			<td> 
			<s:if test="${IS_LOOP=='0'}"> <dict:lang value="是" /> </s:if> 
			<s:if test="${IS_LOOP=='1'}"> <dict:lang value="否" /> </s:if> 
			
			</td>
			<td 
			onclick="getSeqNowNum(this,'<s:property value="DEF_ID"/>','<s:property value="INIT_STEP"/>','<s:property value="SEQ_MAX_VAL"/>','<s:property value="IS_LOOP"/>')">
			
			<img  title="<dict:lang value="得现在数量值" />"
				src="${IMG_PATH}/ContImg25.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG25_GIF %>" />
			 </td>
		 
			<td>
				<a href="javascript:update('<s:property value="ID"/>')" 
				title="<dict:lang value="修改" />" ><img 
				src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
				 
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
	
	function add(url){
		url = "${path}sys/seq_mng/SeqAction_DataPage.ms";
		showPopWin(url, "50%", "20%",null,"<dict:lang value="数据表单" /> <dict:lang value="新增" />");
	}
	
	function update(id){
		var url = "${path}sys/seq_mng/SeqAction_DataPage.ms?paraMap.ID="+id;
		showPopWin(url, "50%", "20%",null,"<dict:lang value="数据表单" /> <dict:lang value="修改" />");
	}
	  
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
        document.forms.submitForm.action="${path}sys/seq_mng/SeqAction_Delete.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}

  var queSeqMark=false;
  function getSeqNowNum(tdObj,DEF_ID,INIT_STEP,SEQ_MAX_VAL,IS_LOOP ){
    if(queSeqMark){
      util.alert('<dict:lang value="正在查询数据中...请稍候....!" />');return;
    }
    var url="${path}sys/seq_mng/SeqAction_SeqNowNum.ms"
	 $.post(url, { 
	   "paraMap.DEF_ID": DEF_ID,
	    "paraMap.INIT_STEP": INIT_STEP,
	    "paraMap.SEQ_MAX_VAL": SEQ_MAX_VAL,
	    "paraMap.IS_LOOP":IS_LOOP 
	  },
   function(data){
       $(tdObj).text('<dict:lang value="当前数量" />:'+data);
       queSeqMark=false;
   }, "json");
   queSeqMark=true;
  }////function getSeqNowNum(DEF_ID,INIT_STEP,SEQ_MAX_VAL,IS_LOOP ){

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>