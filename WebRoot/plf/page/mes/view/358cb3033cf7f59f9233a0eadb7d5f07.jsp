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
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="2afde634fbc5470d96dd81dbc7d251ac" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2afde634fbc5470d96dd81dbc7d251ac" />
	<input type="hidden" name="2afde634fbc5470d96dd81dbc7d251ac" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'3d14bca11cc14e4a95ccc362c9d2a440'" />
		<s:set name="_$formId_1" value="'2afde634fbc5470d96dd81dbc7d251ac'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="PROJECT_NO" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PROJECT_NO}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="PROJECT_NAME" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PROJECT_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="PERSON_LIABLE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{PERSON_LIABLE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="BEG_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{BEG_DATE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="END_DATE" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{END_DATE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="SPEED_PROGRESS" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{SPEED_PROGRESS}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CREATE_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="CREATE_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="CREATE_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{CREATE_USER}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CREATE_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="CREATE_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="CREATE_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{CREATE_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="EDIT_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="EDIT_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="EDIT_TIME" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{EDIT_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ID" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="ID" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="ID" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{ID}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="DEPT_ID" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="DEPT_ID" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="DEPT_ID" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{DEPT_ID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="EDIT_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" /></td>
			<bu:td cssClass="dec-self" colNo="EDIT_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" ><bu:ui colNo="EDIT_USER" formId="2afde634fbc5470d96dd81dbc7d251ac" value="%{EDIT_USER}" formIndex="1" /></bu:td>
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
