<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
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
	<div class="all">
		<div>
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
							<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
						</td>
					</tr>
				</table>
				<table class="add_table">
					<tr>
						<th colspan="4">
							<span class="Eng">*</span>
							<dict:lang value="为必填项" />
						</th>
					</tr>
				</table>
	<table class="add_table" >
	<input type="hidden" name="formIds" value="e1fb7172daf54a508eefd419a286c509" />
	<input type="hidden" name="e1fb7172daf54a508eefd419a286c509" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d6cdaa2292944d59b661566bdc436ea9'" />
		<s:set name="_$formId_1" value="'e1fb7172daf54a508eefd419a286c509'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<bu:td colNo="BIRTH" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="BIRTH" formId="e1fb7172daf54a508eefd419a286c509" value="%{BIRTH}" formIndex="1" /></td>
			<bu:td colNo="HOBBY" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="HOBBY" formId="e1fb7172daf54a508eefd419a286c509" value="%{HOBBY}" formIndex="1" /></td>
		</tr>
		<tr>
			<bu:td colNo="AGE" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="AGE" formId="e1fb7172daf54a508eefd419a286c509" value="%{AGE}" formIndex="1" /></td>
			<bu:td colNo="UPLOAD" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="UPLOAD" formId="e1fb7172daf54a508eefd419a286c509" value="%{UPLOAD}" formIndex="1" /></td>
		</tr>
		<tr>
			<bu:td colNo="SEX" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="SEX" formId="e1fb7172daf54a508eefd419a286c509" value="%{SEX}" formIndex="1" /></td>
			<bu:td colNo="NAME" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /><span>*</span></td>
			<td><bu:ui colNo="NAME" formId="e1fb7172daf54a508eefd419a286c509" value="%{NAME}" formIndex="1" /></td>
		</tr>
		<tr>
			<bu:td colNo="CURTAIN" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="CURTAIN" formId="e1fb7172daf54a508eefd419a286c509" value="%{CURTAIN}" formIndex="1" /></td>
			<bu:td colNo="COUNTY" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="COUNTY" formId="e1fb7172daf54a508eefd419a286c509" value="%{COUNTY}" formIndex="1" /></td>
		</tr>
		<tr>
			<bu:td colNo="CITY" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="CITY" formId="e1fb7172daf54a508eefd419a286c509" value="%{CITY}" formIndex="1" /></td>
			<bu:td colNo="JD" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td><bu:ui colNo="JD" formId="e1fb7172daf54a508eefd419a286c509" value="%{JD}" formIndex="1" /></td>
		</tr>
		<tr>
			<bu:td colNo="PROVINCE" formId="e1fb7172daf54a508eefd419a286c509" cssClass="tr1" /></td>
			<td colspan="3"><bu:ui colNo="PROVINCE" formId="e1fb7172daf54a508eefd419a286c509" value="%{PROVINCE}" formIndex="1" /></td>
		</tr>
	</table>
			<bu:jsVal formId="e1fb7172daf54a508eefd419a286c509" formIndex="1" />
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
