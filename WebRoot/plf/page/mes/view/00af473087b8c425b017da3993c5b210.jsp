<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
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
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
				<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
			<input type="hidden" name="exeid" value="${exeid}">
			<input type="hidden" name="definedMsg" value="${definedMsg}">
			<input type="hidden" name="trId" value="${param.trId}">
			<input type="hidden" name="data" value="${param.data}">
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
			<s:token />
			<!-- <table class="basic-table">
							<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
										</tr>
									</table>-->
		<bu:set name="paraMapObj" value="${dataId}" formId="cdbf4e637fb14cd2abca8771c28268d8" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cdbf4e637fb14cd2abca8771c28268d8" />
	<input type="hidden" name="cdbf4e637fb14cd2abca8771c28268d8" value="paraMap0@" />
	<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
	<input type="hidden" name="relcol" value="0ef8b50df2ec49e9b4384d1d3fbc7447" />		<s:set name="_$viewId" value="'419ddfa7896f4de0a41b720ee5481d17'" />
		<s:set name="_$formId_0" value="'cdbf4e637fb14cd2abca8771c28268d8'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="UUID" formId="cdbf4e637fb14cd2abca8771c28268d8" /></td>
			<bu:td cssClass="dec-self" colNo="UUID" formId="cdbf4e637fb14cd2abca8771c28268d8" ><bu:ui colNo="UUID" formId="cdbf4e637fb14cd2abca8771c28268d8" type="add" dataId="${dataId}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="UUNAME" formId="cdbf4e637fb14cd2abca8771c28268d8" /></td>
			<bu:td cssClass="dec-self" colNo="UUNAME" formId="cdbf4e637fb14cd2abca8771c28268d8" ><bu:ui colNo="UUNAME" formId="cdbf4e637fb14cd2abca8771c28268d8" type="add" dataId="${dataId}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="TEST" formId="cdbf4e637fb14cd2abca8771c28268d8" /></td>
			<bu:td cssClass="dec-self" colNo="TEST" formId="cdbf4e637fb14cd2abca8771c28268d8" ><bu:ui colNo="TEST" formId="cdbf4e637fb14cd2abca8771c28268d8" type="add" dataId="${dataId}" formIndex="0" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="cdbf4e637fb14cd2abca8771c28268d8" formIndex="0" />		<div style="padding:1px;"></div>


<bu:addcpwin formid="cdbf4e637fb14cd2abca8771c28268d8"  viewid="8a318e122f6b4ce0a165044d42511529"/>
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
				url = "/mes/buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&relcol=" + relcol + "&viewid=" + viewid + "&formid=" + formid + "&trid=" + trid;
			}
			showPopWinFp(url, 800, 400,"","test","新增","");
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
			if(viewid != null)
			{
				url = "/mes/buss/bussModel.ms?exeid=" + viewid + "&piframeId=" + piframeId + "&data=" + data + "&relcol=" + relcol+"&trId=" + trid + "&col=" +  col;
			}
			else
			{	
				url = "/mes/buss/bussModel_forEditCommPop.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&data=" + data +"&trId=" + trid + "&relcol=" + relcol ;
			}
			showPopWinFp(url, 800, 400,"","test","新增","");
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
			var tr = document.getElementsByName(trId);
			return $(tr).clone(1) ;
		}
		
		function addData(data,exeid,viewid){
			var colParams = "";
			return addRowPop(exeid,'1', colParams,data,'add',viewid);
			//$("table tbody").append(data);
		}
		
		function editData(data,trId,colno)
		{
			var colId = trId.substring('addTableTr'.length,trId.indexOf('_'));
			if(document.getElementsByName('td_'+trId+'#'+ colno)[0] != null)
			{
				$(document.getElementsByName('td_'+trId+'#'+ colno)[0]).empty();
				$(document.getElementsByName('td_'+trId+'#'+ colno)[0]).append(data);	
			}
			
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
