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
	<script>
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
	</script>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="addCg();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d3dfc61ad4a44887a913f3ebd4aad0a4" />
	<input type="hidden" name="d3dfc61ad4a44887a913f3ebd4aad0a4" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cd8ddc4b5c0c48bbb90f7e5cd2c31d4e'" />
		<s:set name="_$formId_1" value="'d3dfc61ad4a44887a913f3ebd4aad0a4'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="NAME" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" /></td>
			<bu:td cssClass="dec-self" colNo="NAME" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" ><bu:ui colNo="NAME" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" value="%{NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="WORK" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" /></td>
			<bu:td cssClass="dec-self" colNo="WORK" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" ><bu:ui colNo="WORK" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" value="%{WORK}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="HOBBY" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" /></td>
			<bu:td cssClass="dec-self" colNo="HOBBY" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" ><bu:ui colNo="HOBBY" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" value="%{HOBBY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="SEX" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" /></td>
			<bu:td cssClass="dec-self" colNo="SEX" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" ><bu:ui colNo="SEX" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" value="%{SEX}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="AGE" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" /></td>
			<bu:td cssClass="dec-self" colNo="AGE" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" ><bu:ui colNo="AGE" formId="d3dfc61ad4a44887a913f3ebd4aad0a4" value="%{AGE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="d3dfc61ad4a44887a913f3ebd4aad0a4" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
<bu:submit viewId="cd8ddc4b5c0c48bbb90f7e5cd2c31d4e" />
		<bu:script viewId="cd8ddc4b5c0c48bbb90f7e5cd2c31d4e" />
		
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
