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
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="23ff16a227574cfa806479501c0f6d7e" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="23ff16a227574cfa806479501c0f6d7e" />
	<input type="hidden" name="23ff16a227574cfa806479501c0f6d7e" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'2894b5ed19fb42d19c42853b126f615c'" />
		<s:set name="_$formId_1" value="'23ff16a227574cfa806479501c0f6d7e'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><bu:uitn colNo="CO_AGING_TIME" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_AGING_TIME" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_AGING_TIME" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_AGING_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CO_CUSTOMER_ITEM" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_CUSTOMER_ITEM" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_CUSTOMER_ITEM" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_CUSTOMER_ITEM}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CO_STOCK_CYCLE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_STOCK_CYCLE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_STOCK_CYCLE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_STOCK_CYCLE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CO_CYCLE_REMIND" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_CYCLE_REMIND" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_CYCLE_REMIND" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_CYCLE_REMIND}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_AUTO_FQC" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_AUTO_FQC" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_AUTO_FQC" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_AUTO_FQC}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_FQC_QTY" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_FQC_QTY" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_FQC_QTY" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_FQC_QTY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CO_NAMEPLATE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_NAMEPLATE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_NAMEPLATE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_NAMEPLATE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CO_REVIEW_TIME" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_REVIEW_TIME" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_REVIEW_TIME" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_REVIEW_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_SCRAP_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_SCRAP_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_SCRAP_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_SCRAP_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CO_ITEM_DESC" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_ITEM_DESC" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_ITEM_DESC" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_ITEM_DESC}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CO_WORKING_FLUID" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_WORKING_FLUID" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_WORKING_FLUID" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_WORKING_FLUID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QC_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="QC_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="QC_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" value="%{QC_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CO_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_UNIT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="DEFAULT_WAREHOUSE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="DEFAULT_WAREHOUSE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="DEFAULT_WAREHOUSE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{DEFAULT_WAREHOUSE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="DEFAULT_AREA" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="DEFAULT_AREA" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="DEFAULT_AREA" formId="23ff16a227574cfa806479501c0f6d7e" value="%{DEFAULT_AREA}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="OG_NAME" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="OG_NAME" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="OG_NAME" formId="23ff16a227574cfa806479501c0f6d7e" value="%{OG_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="GG_NAME" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="GG_NAME" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="GG_NAME" formId="23ff16a227574cfa806479501c0f6d7e" value="%{GG_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="SORT_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="SORT_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="SORT_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" value="%{SORT_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="THERMOSTATIC_HOURS" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="THERMOSTATIC_HOURS" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="THERMOSTATIC_HOURS" formId="23ff16a227574cfa806479501c0f6d7e" value="%{THERMOSTATIC_HOURS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="COLOR_VALID_DAYS" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="COLOR_VALID_DAYS" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="COLOR_VALID_DAYS" formId="23ff16a227574cfa806479501c0f6d7e" value="%{COLOR_VALID_DAYS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FORBID_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="FORBID_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="FORBID_FLAG" formId="23ff16a227574cfa806479501c0f6d7e" value="%{FORBID_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="SK_VMI" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="SK_VMI" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="SK_VMI" formId="23ff16a227574cfa806479501c0f6d7e" value="%{SK_VMI}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="MG_TYPE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="MG_TYPE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="MG_TYPE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{MG_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="O_CODE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="O_CODE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="O_CODE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{O_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_STANDARD_WEIGHTS" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_STANDARD_WEIGHTS" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_STANDARD_WEIGHTS" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_STANDARD_WEIGHTS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CUST_CODE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CUST_CODE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CUST_CODE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CUST_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="SUPPLIER_CODE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="SUPPLIER_CODE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="SUPPLIER_CODE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{SUPPLIER_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CU_DID" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CU_DID" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CU_DID" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CU_DID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CODE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CODE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="PM_CODE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{PM_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TR_CODE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="TR_CODE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="TR_CODE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{TR_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_BULK" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_BULK" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_BULK" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_BULK}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_BULK_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_BULK_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_BULK_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_BULK_UNIT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_WEIGH" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_WEIGH" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_WEIGH" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_WEIGH}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_WEIGH_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_WEIGH_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_WEIGH_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_WEIGH_UNIT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_MIN_STOCK" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_MIN_STOCK" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_MIN_STOCK" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_MIN_STOCK}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_MAX_STOCK" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_MAX_STOCK" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_MAX_STOCK" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_MAX_STOCK}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_BASE_PRICE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_BASE_PRICE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_BASE_PRICE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_BASE_PRICE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_AVAIL" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_AVAIL" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_AVAIL" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_AVAIL}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_AVAIL_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_AVAIL_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_AVAIL_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_AVAIL_UNIT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_MIN_PACK" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_MIN_PACK" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_MIN_PACK" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_MIN_PACK}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CONNECT_PLANK_NUM" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CONNECT_PLANK_NUM" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CONNECT_PLANK_NUM" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CONNECT_PLANK_NUM}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CREATE_NAME" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CREATE_NAME" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CREATE_NAME" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CREATE_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CREATE_DATE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CREATE_DATE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CREATE_DATE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CREATE_DATE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="MODIFY_NAME" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="MODIFY_NAME" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="MODIFY_NAME" formId="23ff16a227574cfa806479501c0f6d7e" value="%{MODIFY_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="MODIFY_DATE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="MODIFY_DATE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="MODIFY_DATE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{MODIFY_DATE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_STOCK_BIT_LAST" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_STOCK_BIT_LAST" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_STOCK_BIT_LAST" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_STOCK_BIT_LAST}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_C_LOT" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_C_LOT" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_C_LOT" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_C_LOT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_MORE_CONTROL" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_MORE_CONTROL" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_MORE_CONTROL" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_MORE_CONTROL}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="ITEM_VALUE_B" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="ITEM_VALUE_B" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="ITEM_VALUE_B" formId="23ff16a227574cfa806479501c0f6d7e" value="%{ITEM_VALUE_B}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ITEM_VALUE_T" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="ITEM_VALUE_T" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="ITEM_VALUE_T" formId="23ff16a227574cfa806479501c0f6d7e" value="%{ITEM_VALUE_T}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ITEM_VALUE_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="ITEM_VALUE_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="ITEM_VALUE_UNIT" formId="23ff16a227574cfa806479501c0f6d7e" value="%{ITEM_VALUE_UNIT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_C_BCODE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_C_BCODE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_C_BCODE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_C_BCODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_AMOUNT" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_AMOUNT" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_AMOUNT" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_AMOUNT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_MATERIAL_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_MATERIAL_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_MATERIAL_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_MATERIAL_RATIO}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_SMT_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_SMT_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_SMT_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_SMT_RATIO}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_PTH_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_PTH_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_PTH_RATIO" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_PTH_RATIO}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_LOT_RULE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_LOT_RULE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_LOT_RULE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_LOT_RULE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_SINGLE_RULE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_SINGLE_RULE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_SINGLE_RULE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_SINGLE_RULE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_ITEM_SOURCE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_ITEM_SOURCE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_ITEM_SOURCE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_ITEM_SOURCE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="L_PALLET_CAPACITY" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="L_PALLET_CAPACITY" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="L_PALLET_CAPACITY" formId="23ff16a227574cfa806479501c0f6d7e" value="%{L_PALLET_CAPACITY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="ITEM_JIGSAW_NUMBER" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="ITEM_JIGSAW_NUMBER" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="ITEM_JIGSAW_NUMBER" formId="23ff16a227574cfa806479501c0f6d7e" value="%{ITEM_JIGSAW_NUMBER}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ITEM_PACKAGING_RULE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="ITEM_PACKAGING_RULE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="ITEM_PACKAGING_RULE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{ITEM_PACKAGING_RULE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ITEM_REMARK" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="ITEM_REMARK" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="ITEM_REMARK" formId="23ff16a227574cfa806479501c0f6d7e" value="%{ITEM_REMARK}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_LABEL_ABBREVIATION" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_LABEL_ABBREVIATION" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_LABEL_ABBREVIATION" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_LABEL_ABBREVIATION}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WAVE_SOLDER_JOINTS" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="WAVE_SOLDER_JOINTS" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="WAVE_SOLDER_JOINTS" formId="23ff16a227574cfa806479501c0f6d7e" value="%{WAVE_SOLDER_JOINTS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="HS_SOLDER_JOINTS" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="HS_SOLDER_JOINTS" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="HS_SOLDER_JOINTS" formId="23ff16a227574cfa806479501c0f6d7e" value="%{HS_SOLDER_JOINTS}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="I_MAJOR_CATEGORIES" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_MAJOR_CATEGORIES" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_MAJOR_CATEGORIES" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_MAJOR_CATEGORIES}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_SMALL_SINGLE_RULE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_SMALL_SINGLE_RULE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_SMALL_SINGLE_RULE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_SMALL_SINGLE_RULE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="I_BURNIN_NAME" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_BURNIN_NAME" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="I_BURNIN_NAME" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_BURNIN_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CO_ITEM_CODE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_ITEM_CODE" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_ITEM_CODE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_ITEM_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CO_ITEM_NAME" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_ITEM_NAME" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_ITEM_NAME" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_ITEM_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CO_ITEM_SPEC" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="CO_ITEM_SPEC" formId="23ff16a227574cfa806479501c0f6d7e" ><bu:ui colNo="CO_ITEM_SPEC" formId="23ff16a227574cfa806479501c0f6d7e" value="%{CO_ITEM_SPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="ITEM_SOURCECODE" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="ITEM_SOURCECODE" formId="23ff16a227574cfa806479501c0f6d7e"  ><bu:ui colNo="ITEM_SOURCECODE" formId="23ff16a227574cfa806479501c0f6d7e" value="%{ITEM_SOURCECODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-three" /><bu:uitn colNo="I_FULL_WEIGHTS" formId="23ff16a227574cfa806479501c0f6d7e" /></td>
			<bu:td cssClass="dec-self" colNo="I_FULL_WEIGHTS" formId="23ff16a227574cfa806479501c0f6d7e"  colspan="4"><bu:ui colNo="I_FULL_WEIGHTS" formId="23ff16a227574cfa806479501c0f6d7e" value="%{I_FULL_WEIGHTS}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="23ff16a227574cfa806479501c0f6d7e" formIndex="1" />
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
