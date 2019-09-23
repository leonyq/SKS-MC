<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
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
</head>
<body>
	<div class="edit">
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>

			</div>
			<div class="bd">
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name=iframeId value="${iframeId}">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="46a69fb9850f4b81909589215ac5053a" type="detail" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="46a69fb9850f4b81909589215ac5053a" />
	<input type="hidden" name="46a69fb9850f4b81909589215ac5053a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'405bb18a945e4f84a9ffb55a7189936f'" />
		<s:set name="_$formId_1" value="'46a69fb9850f4b81909589215ac5053a'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-three" /><bu:uitn colNo="NAME" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<bu:td cssClass="dec-self" colNo="NAME" formId="46a69fb9850f4b81909589215ac5053a" ><bu:ui colNo="NAME" formId="46a69fb9850f4b81909589215ac5053a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="SEX" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<bu:td cssClass="dec-self" colNo="SEX" formId="46a69fb9850f4b81909589215ac5053a" ><bu:ui colNo="SEX" formId="46a69fb9850f4b81909589215ac5053a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="QQ" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<bu:td cssClass="dec-self" colNo="QQ" formId="46a69fb9850f4b81909589215ac5053a" ><bu:ui colNo="QQ" formId="46a69fb9850f4b81909589215ac5053a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="AGE" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<bu:td cssClass="dec-self" colNo="AGE" formId="46a69fb9850f4b81909589215ac5053a" ><bu:ui colNo="AGE" formId="46a69fb9850f4b81909589215ac5053a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="46a69fb9850f4b81909589215ac5053a" formIndex="1" />		<div style="padding:1px;"></div>

		<bu:form viewId="405bb18a945e4f84a9ffb55a7189936f" formId="612afe7157ae46479b87fdd32cb77485" isSubForm="1" list="dataListSub" formidFirstId="46a69fb9850f4b81909589215ac5053a" relColIds="" subFormIds="" subRelColIds="" />

		<div style="padding:1px;"></div>

		<bu:form viewId="405bb18a945e4f84a9ffb55a7189936f" formId="677346fc6b47486ba7a9164f03017738" isSubForm="1" list="dataListSub" formidFirstId="46a69fb9850f4b81909589215ac5053a" relColIds="" subFormIds="" subRelColIds="" />


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
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
