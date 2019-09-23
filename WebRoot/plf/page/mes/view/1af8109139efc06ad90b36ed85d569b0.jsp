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
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="a468d3796b1341468bf5e876eeb31ddf" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="a468d3796b1341468bf5e876eeb31ddf" />
	<input type="hidden" name="a468d3796b1341468bf5e876eeb31ddf" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'fb1c49d2e9924a81863f2b3151d37ffb'" />
		<s:set name="_$formId_1" value="'a468d3796b1341468bf5e876eeb31ddf'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-four" /><bu:uitn colNo="FIELD7" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD7" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD7" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD7}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD8" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD8" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD8" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD8}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD9" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD9" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD9" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD9}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="FIELD10" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD10" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD10" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD10}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD11" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD11" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD11" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD11}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD12" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD12" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD12" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD12}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="FIELD13" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD13" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD13" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD13}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD14" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD14" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD14" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD14}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD15" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD15" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD15" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD15}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="FIELD16" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD16" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD16" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD16}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD17" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD17" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD17" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD17}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD5" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD5" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD5" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD5}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="FIELD4" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD4" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD4" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD4}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD3" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD3" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD3" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD3}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="FIELD2" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD2" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD2" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD2}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="FIELD1" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD1" formId="a468d3796b1341468bf5e876eeb31ddf"  ><bu:ui colNo="FIELD1" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD1}" formIndex="1" /></bu:td>
			<td class="name-three" /><bu:uitn colNo="FIELD6" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD6" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD6" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD6}" formIndex="1" /></bu:td>
			<td class="name-three" /><bu:uitn colNo="FIELD1_EXTEND_1" formId="a468d3796b1341468bf5e876eeb31ddf" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD1_EXTEND_1" formId="a468d3796b1341468bf5e876eeb31ddf" ><bu:ui colNo="FIELD1_EXTEND_1" formId="a468d3796b1341468bf5e876eeb31ddf" value="%{FIELD1_EXTEND_1}" formIndex="1" /></bu:td>			
		</tr>
	</table>
			<bu:jsVal formId="a468d3796b1341468bf5e876eeb31ddf" formIndex="1" />
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
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
