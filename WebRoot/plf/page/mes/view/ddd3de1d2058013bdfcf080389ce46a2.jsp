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
			    	        <button type="button" onclick="editCfiSub();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="c3a183e393ea4dfabb15712f9dba1873" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c3a183e393ea4dfabb15712f9dba1873" />
	<input type="hidden" name="c3a183e393ea4dfabb15712f9dba1873" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'af68f348e5df4d9a843f7f3b2bf07d00'" />
		<s:set name="_$formId_1" value="'c3a183e393ea4dfabb15712f9dba1873'" />
		<s:set name="_$type" value="'edit'" />
		
		
		<!--1-->
		<tr>
			
		</tr>
		
		
		<!--1-->
		<tr>
		   <td class="name-six" /><bu:uitn colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		   <td>&nbsp;</td>
		   <td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<!--2-->
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    	<td class="name-six" /><bu:uitn colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<!--3-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--4-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_MT_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
	     	<td>&nbsp;</td>
	     	<td class="name-six" /><bu:uitn colNo="CFI_MT_VAULE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_VAULE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_VAULE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
	    	<td>&nbsp;</td>
	    	<td class="name-six" /><bu:uitn colNo="CFI_MT_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--5-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-three" /><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873"  colspan="7"><bu:ui colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--6-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
	     	<td>&nbsp;</td>
	     	<td class="name-six" /><bu:uitn colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--7-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--8-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
	    </tr>
		
		<!--
		
		
		<tr>
			
			
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_WH_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_WH_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_WH_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_CLCLE_UNIT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CLCLE_UNIT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_CLCLE_UNIT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
			<td class="name-six" /><bu:uitn colNo="CFI_MT_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
			<td class="name-six" /><bu:uitn colNo="CFI_MT_DATE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_DATE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_DATE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_NOW_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_NOW_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_NOW_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
			
		</tr>
		<tr>
			
			<td class="name-six" /><bu:uitn colNo="CFI_INSTOCK_MAN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_INSTOCK_MAN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_MAN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_INSTOCK_TIME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_INSTOCK_TIME" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_TIME" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_FIX_STATUS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_FIX_STATUS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FIX_STATUS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
			
		
		</tr>
		<tr>
			
			
			
		</tr>
		<tr>
			
			
			
		</tr>
		<tr>
			
		</tr>-->
	</table>
			<bu:jsVal formId="c3a183e393ea4dfabb15712f9dba1873" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:submit viewId="af68f348e5df4d9a843f7f3b2bf07d00" />
	<bu:script viewId="af68f348e5df4d9a843f7f3b2bf07d00" />
	
	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
			$("#paraMapObj_CFI_ADDWAY").attr("disabled",true);
			
			$("#paraMapObj_CFI_ASSISTANTTOOLNAME").removeAttr("disabled"); 
			$("#paraMapObj_CFI_ASSISTANTTOOLSPEC").removeAttr("disabled"); 
			
		 
			$("#paraMapObj_CFI_ITEM_TYPE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_ITEM_TYPE").addClass("readonly");
			
			$("#paraMapObj_CFI_ASSISTANTTOOLNAME").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_ASSISTANTTOOLNAME").addClass("readonly");
			
			
			$("#paraMapObj_CFI_ASSISTANTTOOLSPEC").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_ASSISTANTTOOLSPEC").addClass("readonly"); 
 
      
                        $("#paraMapObj_CFI_MT_VAULE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MT_VAULE").addClass("readonly");  
			
			$("#paraMapObj_CFI_MT_REMIND").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MT_REMIND").addClass("readonly");   
			
			
			$("#paraMapObj_CFI_MAX_USAGE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MAX_USAGE").addClass("readonly"); 
			
			$("#paraMapObj_CFI_MT_TYPE").attr("disabled",true);
			/*$("#paraMapObj_CFI_MAX_USAGE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MAX_USAGE").addClass("readonly");
			
			$("#paraMapObj_CFI_MT_TYPE").addAttr("disabled");
			 
			
			$("#paraMapObj_CFI_MT_VAULE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MT_VAULE").addClass("readonly");
			
			$("#paraMapObj_CFI_MT_REMIND").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MT_REMIND").addClass("readonly");   */
			
		 
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
