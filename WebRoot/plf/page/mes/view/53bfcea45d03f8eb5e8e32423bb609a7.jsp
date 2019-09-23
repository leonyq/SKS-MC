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
		
		function wuchan(thisObj){
		if(thisObj=="2"||thisObj=="3"){
			document.getElementById("content1").style.display="none";
			document.getElementById("content2").style.display="";
			$($("#paraMap1_FIX_MT_TYPE").siblings()[0]).css("width","230");
		}else{
			document.getElementById("content2").style.display="none";
			document.getElementById("content1").style.display="";
		}
		
		}
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
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="iframeId" value="${iframeId}">
										<input type="hidden" name="formId" value="e09e1f47e824490d80ba2717d25498d3" />
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										
		<bu:set name="paraMapObj" value="${dataId}" formId="e09e1f47e824490d80ba2717d25498d3" type="add" />
	<div class="mod">		
  <div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:130px;border: none;">
	<table class="basic-table" id="table1" name="table1">
	<input type="hidden" name="formIds" value="e09e1f47e824490d80ba2717d25498d3" />
	<input type="hidden" name="e09e1f47e824490d80ba2717d25498d3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'52669fefcbc04a49beafdf8bd080f53f'" />
		<s:set name="_$formId_1" value="'e09e1f47e824490d80ba2717d25498d3'" />
		<s:set name="_$type" value="'add'" />
		<input type="hidden" name="paraMap2.type" value="add" />
		<tr>
			<td class="name" style="width:93px;"/><span class="dot">*</span><bu:uitn colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLNO}" formIndex="1" /></bu:td>
			<td class="name"  style="width:100px;"/><bu:uitn colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLNAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLSPEC}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLTYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTLEASTCOUNT}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BAR_RULE}" formIndex="1" /></bu:td>
		</tr>
	</table>
	</div>
	
	<DIV id="content1">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="红胶/锡膏" /></h3>	
        </div>
        <div class="mod-hd" style="height:130px;border: none;">	
	<table class="basic-table" id="table2" name="table2">
		<tr>
			<td class="name"  style="width:93px;"/><bu:uitn colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BACK_TIME}" formIndex="1" /></bu:td>
			<td class="name"  style="width:100px;"/><bu:uitn colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_DISCARD_TIME}" formIndex="1" /></bu:td>
	        </tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_USE_TIME}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_OPEN_DISCARD_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_DURING_TIME}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" value="%{LEAD_FLAG}" formIndex="1" /></bu:td>
		</tr>
	</table>
	</div>
	</div>
	<DIV id="content2" style="display:none">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="钢网/刮刀" /></h3>	
 	</div>
  	<div class="mod-hd" style="height:80px;border: none;">	
	<table class="basic-table" id="table3" name="table3">
		<tr>
			<td class="name"  style="width:93px;"/><bu:uitn colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{MAX_USE_COUNT}" formIndex="1" /></bu:td>
			<td class="name"  style="width:100px;"/><bu:uitn colNo="FIX_MT_TYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="FIX_MT_TYPE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_MT_TYPE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_MT_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FIX_MT_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_MT_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_MT_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_MT_CYCLE}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="FIX_MT_REMIND" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_MT_REMIND" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_MT_REMIND" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_MT_REMIND}" formIndex="1" /></bu:td>
		</tr>
	</table>
	</div>
	</div>
			<bu:jsVal formId="e09e1f47e824490d80ba2717d25498d3" formIndex="1" />
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
