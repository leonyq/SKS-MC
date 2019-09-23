<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<script type="text/javascript">
	//加载父ifream中的js\css文件
		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
		var addTableTrMap;


	</script>
	<!-- 产品静态资源 -->
	#{view.dist.static.resources}#
</head>
<body>
	<div class="edit">
            <div class="hd">
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" style="margin-right:5px;height:14px;" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
				<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
			<input type="hidden" name="exeid" value="<c:out value='${exeid}' />">
			<input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
			<input type="hidden" name="trId" value=""<c:out value='${param.trId}' />">
			<input type="hidden" name="data" value="<c:out value='${param.data}' />">
			<s:token />
			<!-- <table class="basic-table">
							<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
										</tr>
									</table>-->
			#{view.dist.addPopWin}#
				<table class="func_table">
				<tr>
					<td width="100%" align="right">
						
					</td>
				</tr>
				</table>
			</form>
		</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
		var parentWindow;
		var hidecol="";
		$(function(){
			parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
		});
		var isQuery = false;
		
		function showAddPopWin(viewid,exeid)
		{
			var piframeId = window.frameElement.id;
			var relcol = $("input[type='hidden'][name='relcol']").val();
			var url;
			var trid = getCurRow();
			var formid = 1;
			{
				url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&relcol=" + relcol + "&viewid=" + viewid + "&formid=" + formid + "&trid=" + trid;
			}
			showPopWinFp(url, 800, 400,"","<dict:lang value="新增"/>","add","");
		}
		function showEditPopWin(e ,viewid ,trid, col)
		{
			var piframeId = window.frameElement.id;
			var id = $(e).parent().parent()[0].id;
			var inputs = $(e).parent().siblings().find("input");
			var data = "{";
			for(var i = 0,len = inputs.length; i < len; i++)
			{
				if(i == len - 1)
				{
					data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\"";
				}				
				else
				{
					data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\",";
				}
			}
			data = data + "}";
			var relcol = $("input[type='hidden'][name='relcol']").val();
			var url ;
			var formid = 1;
			var trnum = col.substring(col.indexOf('@')+1);
			
			if(viewid != null)
			{
				url = "${path}buss/bussModel.ms?exeid=" + viewid + "&piframeId=" + piframeId + "&data=" + data + "&relcol=" + relcol+"&trId=" + trid + "&col=" +  col + "&formid=" + formid + "&trid=" + trnum ;
			}
			else
			{	
				url = "${path}buss/bussModel_forEditCommPop.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&data=" + data +"&trId=" + trid + "&relcol=" + relcol ;
			}
			showPopWinFp(url, 800, 400,"","<dict:lang value="修改"/>","edit","");
		}
		
		function findData(trId){
			var tr = document.getElementById(trId);
			var inputs = tr.getElementsByTagName("input");
			var data = "{";
			var map = "\"" + trId + "_key\":" + "[";
			for(var i = 0,len = inputs.length; i < len; i++)
			{
				data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\",";
				if(i == len - 1)
				{
					map += "\"" + inputs[i].id + "\"";
				}				
				else
				{
					map += "\"" + inputs[i].id + "\",";
				}
			}
			map += "]";
			data += map;
			data = data + "}";
			var result = data;
			return result;
		}
		
		function findTr(trId){
			var backVal;
			$("table tr").find("td").each(function(i,item){
				if(trId == $(item).attr("name")){
					backVal = $(item).clone();
					return ;
				}
			});
			return backVal;
		}
		
		function addData(data,exeid,viewid){
			var colParams = "";
			return addRowPop(exeid,'1', colParams,data,'add',viewid,hidecol);
			//$("table tbody").append(data);
		}
		
		function editData(data,trId,colno)
		{
			if(colno == undefined || colno == null || colno == ""){
				return;
			}
			var colId = trId.substring('addTableTr'.length,trId.indexOf('_'));
			$(".glxb-table tr").find("td").each(function(i,item){
				if('td_'+trId+'#'+ colno == $(item).attr("name")){
					$(item).empty();
					$(item).append(data.children());
					$(".glxb-table .chosen-container").css("width","100%");
					return ;
				}
			});
		}
	
		function init(){
			$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		}//初始化方法
	
		function closeCurrentWindow()
		{
			closeTopPopWinFp(window.frameElement.id + "pop");
		}
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>