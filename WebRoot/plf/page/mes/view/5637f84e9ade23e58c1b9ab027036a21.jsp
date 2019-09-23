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
            		<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			</div>
			<div class="bd" style="padding-left:20px;">
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="iframeId" value="${iframeId}">
				<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2afde634fbc5470d96dd81dbc7d251ac" />
	<input type="hidden" name="2afde634fbc5470d96dd81dbc7d251ac" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cd43d25f51e5432aa1eb256b64fbda8d'" />
		<s:set name="_$formId_1" value="'2afde634fbc5470d96dd81dbc7d251ac'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name " style="width:119px;"><span class="dot">*</span><bu:uitn colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="dec" ><bu:ui colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PROJECT_NO}" formIndex="1" style="width:300px;"/></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="dec" ><bu:ui colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PROJECT_NAME}" formIndex="1" style="width:300px;"/></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="dec" ><bu:ui colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PERSON_LIABLE}" formIndex="1" cssClass="_VAL_NULL input isSubmit" style="width:300px;"/></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="dec"><bu:ui colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{BEG_DATE}" formIndex="1" style="width:300px;"/></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="dec"><bu:ui colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{END_DATE}" formIndex="1" style="width:300px;"/></td>
		</tr>
		<tr>
			<td class="name "><span class="dot"></span><bu:uitn colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<td class="dec"><bu:ui colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{SPEED_PROGRESS}" formIndex="1" style="width:300px;"/></td>
		</tr>
		
		
	</table>
			<bu:jsVal formId="2afde634fbc5470d96dd81dbc7d251ac" formIndex="1" />
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

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
