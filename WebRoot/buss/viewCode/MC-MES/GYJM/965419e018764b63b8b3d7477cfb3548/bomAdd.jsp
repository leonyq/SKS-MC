<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<style type="text/css">
	#addTable_b9f80468a9fe4b74ada4fceff23db738 {width: 1000px;}
	</style>
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
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" style="margin-right:5px;height:14px;" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="saveBom(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
				<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
			<input type="hidden" name="exeid" value="${exeid}">
			<input type="hidden" name="definedMsg" value="${definedMsg}">
			<input type="hidden" name="iframeId" value="${iframeId}">
			<input type="hidden" name="formId" value="881411561f8f4940ac22575c4b8f02ef" />
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
		<bu:set name="paraMapObj" value="${dataId}" formId="881411561f8f4940ac22575c4b8f02ef" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="881411561f8f4940ac22575c4b8f02ef" />
	<input type="hidden" name="881411561f8f4940ac22575c4b8f02ef" value="paraMap0@" />
	<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
	<input type="hidden" name="relcol" value="3a6a195ea82c4ebbaaaacc3ee52c6438" />		<s:set name="_$viewId" value="'5ef2a5aae81342ef93ea5b9376dd08a6'" />
		<s:set name="_$formId_0" value="'881411561f8f4940ac22575c4b8f02ef'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" type="add" value="%{CB_ITEM_CODE}" formIndex="0" /></bu:td>
		
			<td class="name" style="width:100px"/><bu:uitn colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" type="add" value="%{T2#CI_ITEM_NAME}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" type="add" value="%{T2#CI_ITEM_SPEC}" formIndex="0" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" type="add" value="%{CB_VER}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" type="add" value="%{CB_DEFAULT}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" type="add" rows="3" value="%{CB_REMARK}" formIndex="0" /></bu:td>
		</tr>
	</table>
			<!--<bu:jsVal formId="881411561f8f4940ac22575c4b8f02ef" formIndex="0" /> -->		<div style="padding:1px;"></div>

                        <bu:addcpwin formid="881411561f8f4940ac22575c4b8f02ef" hidecol="" viewid="1da7e322a2744995a418936d029737db"/>
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
<bu:script viewId="5ef2a5aae81342ef93ea5b9376dd08a6" />
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
			showPopWinFp(url, 700, 350,"","<dict:lang value="新增"/>","add","");
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
			var tr = document.getElementsByName(trId);
			return $(tr).clone(1) ;
		}
		
		function addData(data,exeid,viewid){
			var colParams = "";
			return addRowPop(exeid,'1', colParams,data,'add',viewid,hidecol);
			//$("table tbody").append(data);
		}
		
		function editData(data,trId,colno)
		{
			var colId = trId.substring('addTableTr'.length,trId.indexOf('_'));
			if(document.getElementsByName('td_'+trId+'#'+ colno)[0] != null)
			{
				$(document.getElementsByName('td_'+trId+'#'+ colno)[0]).empty();
				$(document.getElementsByName('td_'+trId+'#'+ colno)[0]).append(data);
				$(".glxb-table .chosen-container").css("width","100%");
					
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
