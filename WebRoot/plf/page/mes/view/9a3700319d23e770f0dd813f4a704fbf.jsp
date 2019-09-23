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
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
				<button type="button" onclick="resetForm();"><i class="ico ico-gk"></i>重置</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" target="submitFrame"
				                <bu:formet exeid="%{exeid}" />>
				                <input type="hidden" name="exeid" value="${exeid}">
				                <input type="hidden" name="formId" value="eb80ecea7f894fadab4d944dd970b7ad">
				                <input type="hidden" name="dataId" value="${dataId}">
				  
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="eb80ecea7f894fadab4d944dd970b7ad" />
	<input type="hidden" name="eb80ecea7f894fadab4d944dd970b7ad" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="paraMap1@0#CREATE_USER" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}" />" />
		<s:set name="_$viewId" value="'bc81398bf78442bca567446b626ba6c2'" />
		<s:set name="_$formId_1" value="'eb80ecea7f894fadab4d944dd970b7ad'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-four" /><bu:uitn colNo="STATE" formId="eb80ecea7f894fadab4d944dd970b7ad"  /></td>
			<bu:td cssClass="dec" colNo="STATE" formId="eb80ecea7f894fadab4d944dd970b7ad" ><bu:ui colNo="STATE" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{STATE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CREATE_TIME" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="CREATE_TIME" formId="eb80ecea7f894fadab4d944dd970b7ad" ><bu:ui colNo="CREATE_TIME" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{CREATE_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="PROJECT" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="PROJECT" formId="eb80ecea7f894fadab4d944dd970b7ad" ><bu:ui colNo="PROJECT" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{PROJECT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="MODNAME" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="MODNAME" formId="eb80ecea7f894fadab4d944dd970b7ad" ><bu:ui colNo="MODNAME" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{MODNAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="TYPE" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="TYPE" formId="eb80ecea7f894fadab4d944dd970b7ad" ><bu:ui colNo="TYPE" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CREATE_USER" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="CREATE_USER" formId="eb80ecea7f894fadab4d944dd970b7ad" ><input type="text" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}"/>" disabled="disabled" class="input"/></bu:td>
		</tr>
		
		
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="THEME" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="THEME" formId="eb80ecea7f894fadab4d944dd970b7ad"  colspan="3"><bu:ui colNo="THEME" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{THEME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="REASON" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="REASON" formId="eb80ecea7f894fadab4d944dd970b7ad"  colspan="3"><bu:ui colNo="REASON" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{REASON}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="DETAIL" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="DETAIL" formId="eb80ecea7f894fadab4d944dd970b7ad"  colspan="3"><bu:ui colNo="DETAIL" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{DETAIL}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="COUNTERMOVE" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="dec" colNo="COUNTERMOVE" formId="eb80ecea7f894fadab4d944dd970b7ad"  colspan="3"><bu:ui colNo="COUNTERMOVE" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{COUNTERMOVE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="eb80ecea7f894fadab4d944dd970b7ad" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$("#paraMap1_CREATE_TIME").val('${dataMap.nowDate}');
		$("#paraMap1_STATE").attr('disabled','true');
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
