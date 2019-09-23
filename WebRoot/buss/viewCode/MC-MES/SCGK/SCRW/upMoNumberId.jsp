<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title>${title}</title>
<style>
	.input{
		width:200px !important;
	}
</style>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param name="html5" value="1" />
		<jsp:param name="workFlow" value="1" />
		<jsp:param name="spectrum" value="1" />
</jsp:include>
<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 


<script src="${path}plf/js/jsPlumb/newWorkflowchart.js"></script>   
<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<style type="text/css">
	.x-fieldset{border:1px solid #00bfff;padding:10px;margin-botton:10px;display:block;height: 100%}
	</style>
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
	var loaded = 1;
	var tab_len = 5;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
				/* if ("" != url) {
						currentIframe = document.getElementById("iframe" + i).contentWindow;
						if (typeof (currentIframe.loadedState) == "undefined"
								&& currentIframe.loadedState != false
								&& tabs.indexOf(tag) == -1) {//第一次点击才加载
							//document.getElementById("iframe" + i).src = url;
							tabs += tag + ";";
							if (document.getElementById("iframe" + i).contentWindow.query) {
								document.getElementById("iframe" + i).contentWindow
										.query(this);
							} else {
								document.getElementById("iframe" + i).src = url;
							}
						}
					}  */
				dynIframesize("iframe" + i);
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}

	var iframehide = "yes";
	function dynIframesize(frameId) {
		if (document.getElementById) {
			dyniframe = document.getElementById(frameId);
			if (dyniframe && !window.opera) {
				dyniframe.style.display = "block";
				if (dyniframe.contentDocument
						&& dyniframe.contentDocument.body.offsetHeight) {
					//dyniframe.height = dyniframe.contentDocument.body.offsetHeight+10;//全显示
					dyniframe.height = getViewportHeight() - 38;
				} else {
					if (dyniframe.Document
							&& dyniframe.Document.body.scrollHeight) {
						//dyniframe.height = dyniframe.Document.body.scrollHeight;//全显示
						dyniframe.height = getViewportHeight() - 38;
					}
				}
			}
		}
		if ((document.all || document.getElementById) && iframehide == "no") {
			var tempobj = document.all ? document.all[iframeids[i]] : document
					.getElementById(iframeids[i]);
			tempobj.style.display = "block";
		}

	}

	function _dynIframesize() {
		var tabIndex = 1;
		if (null != currentTag && "" != currentTag) {
			tabIndex = currentTag.substr(3, currentTag.length);
		}
		dynIframesize("iframe" + tabIndex);
	}

	if (window.addEventListener) {
		window.addEventListener("resize", _dynIframesize, false);
	} else {
		if (window.attachEvent) {
			window.attachEvent("onresize", _dynIframesize);
		} else {
			window.onresize = _dynIframesize;
		}
	}

	function query() {
		if (iframe1.window.query != undefined) {
			iframe1.window.query(this);
		}
		if (iframe2.window.query != undefined) {
			iframe2.window.query(this);
		}

	}

	//初始化iframe
	function intIframe() {
		//switchTag('tag2', 'content2', '');
		switchTag('tag1', 'content1', '');

	}

	$(function() {
		intIframe();

	});
</script>

</head>
<body scroll="no" style="background-color: #fff;">
	<DIV class="multilist comwrap content-in">
		<div class="edit">
       <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			    <div class="optn">
			        <button type="button" onclick="editSave(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>

				<div class="js-tab">
					<DIV id="container" style="padding:0 20px;box-sizing: border-box;height:550px;">
						<DIV class="hd">
							<UL class="tab-list tab">
								<LI id="tag1"><A class="selectli1"
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="基本信息" /></SPAN>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="流程" /></SPAN> </A>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="BOM" /></SPAN> </A>
								</LI>
								<LI id="tag4"><A class=""
									onclick="switchTag('tag4','content4','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="料站表" /></SPAN> </A>
								</LI>
								<LI id="tag5"><A class=""
									onclick="switchTag('tag5','content5','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="管控物料" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
					
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
					<DIV class="content1" id="content" style="margin-top:10px;">
					
							<DIV id="content1" >
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name=iframeId value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
										
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="9b18994844b049f2ad90204b77793334" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9b18994844b049f2ad90204b77793334" />
	<input type="hidden" name="9b18994844b049f2ad90204b77793334" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c84ec01e33324970914ec1974ab19c7f'" />
		<s:set name="_$formId_1" value="'9b18994844b049f2ad90204b77793334'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:96px;"/><bu:uitn colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" /></td>
                        			<bu:td cssClass="dec"  style="width:220px;" colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>

		
			<td class="name"  style="width:96px;"/><bu:uitn colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec"  style="width:220px;" colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:84px;"/><bu:uitn colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec"  style="width:200px;" colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_AREA_SN" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROCESS_FACE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_PCB_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PCB_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PCB_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
		
		
		</tr>
		
		<tr>
		    <td class="name" /><bu:uitn colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MODEL_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PRODUCT_NAME" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="2" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PRODUCT_STANDARD" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="2" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
		    
			<td class="name" /><bu:uitn colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" formIndex="1" /></bu:td>
		
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
	        <td class="name" /><bu:uitn colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
	
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334"  formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334"  formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334"  formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" />
				<bu:uitn colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" />
			</td>
			<bu:td cssClass="dec" colNo="PM_AUTO_FQC" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" />
				
				&#x3000;&#x3000;&#x3000;&#x3000;
				<bu:uitn colNo="PM_AUTO_FQC" formId="9b18994844b049f2ad90204b77793334" />
				<bu:ui colNo="PM_AUTO_FQC" formId="9b18994844b049f2ad90204b77793334" onclick="fqcChange(this)" dataId="${dataId}" formIndex="1" />
				
				
				
			</bu:td>
			
			
			
			
		    <td class="name" /><bu:uitn colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		
		
		<tr>
		
			<td class="name" /><bu:uitn colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" colspan="5"><bu:ui colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" style="width:100%" rows="4" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		
	</table>
			<bu:jsVal formId="9b18994844b049f2ad90204b77793334" formIndex="1" />
	</DIV>
	
<DIV id="content2" style="margin-top:4px;" >  
<div class="mod">
<div class="mod-bd">

<div id="right" style="height: 300px;width: 100%;left: 0;">
		<!-- <fieldset class="x-fieldset">
						<legend></legend>
							<p style="color:#ccc;"></p>
						</fieldset>	 -->			
</div>
</div>
</div>	
									
</DIV>
	
<DIV id="content3" style="margin-top:4px;" >  
<div class="mod">
<div class="mod-hd" style="height:15px">
<h3 class="tit"></h3>
</div>
<div class="mod-bd">	
<table id="addTable_fbe85506ea9d4a32b0cf78996898c620" width="100%" class="glxb-table table-line">
	
		<thead>
		<tr>
		    <th class=""></th>
			<th class="tr1 "><dict:lang value="阶别" /></th>
			<th class="tr1 "><dict:lang value="料号" /></th>
			<th class="tr1 "><dict:lang value="料号名称" /></th>
			<th class="tr1 "><dict:lang value="料号规格" /></th>
			<th class="tr1 "><dict:lang value="单位" /></th>
			<th class="tr1 "><dict:lang value="点位" /></th>
			<th class="tr1 "><dict:lang value="用量" /></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${dataList}" varStatus="status">
		<tr>
		    <td style="width:30px;text-align:center">${status.index + 1}</td>
			<td style="width:120px;">${item.CBD_SEQUENCE}</td>
		
		   	<td style="width:120px;">${item.CBD_ITEM_CODE}</td>
			<td style="width:120px;">${item.CBD_ITEM_NAME}</td>
			<td style="width:120px;">${item.CBD_ITEM_SPEC}</td>
			<td style="width:60px;">${item.CBD_UNITS}</td>
			<td style="width:120px;">${item.CBD_POINT}</td>
			<td style="width:100px;">${item.CBD_ITEM_NUM}</td>
			
		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</div>									
</DIV>

<DIV id="content4" style="margin-top:4px;" >  
<div class="mod">
<div class="mod-hd" style="height:15px">
<h3 class="tit"></h3>
</div>
<div class="mod-bd">	
<table id="addTable_lz" width="100%" class="glxb-table table-line">
	
		<thead>
		<tr>
		    <th class=""></th>
			<th class="tr1 "><dict:lang value="贴片机型" /></th>
			<th class="tr1 "><dict:lang value="程式名称" /></th>
			<th class="tr1 "><dict:lang value="设备序号" /></th>
			<th class="tr1 "><dict:lang value="TABLE" /></th>
			<th class="tr1 "><dict:lang value="料站" /></th>
			<th class="tr1 "><dict:lang value="通道" /></th>
			<th class="tr1 "><dict:lang value="物料料号" /></th>
			<th class="tr1 "><dict:lang value="物料名称" /></th>
			<th class="tr1 "><dict:lang value="规格" /></th>
			<th class="tr1 "><dict:lang value="TRY盘物料" /></th>
			<th class="tr1 "><dict:lang value="跳过标志" /></th>
			<th class="tr1 "><dict:lang value="点数" /></th>
			<th class="tr1 "><dict:lang value="点位" /></th>
			<th class="tr1 "><dict:lang value="BOM范围" /></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${dataList1}" varStatus="status">
		<tr>  
			<td style="width:30px;text-align:center"> ${status.index + 1}</td>		
		   	<td style="width:120px;">${item.CMD_DEVICE_TYPE}
		   	<input type="hidden" name="paramList[${status.index+0}].CMD_ID"
										value="${item.ID}" />
		   	<input type="hidden" name="paramList[${status.index+0}].CMO_DEVICE_TYPE"
										value="${item.CMD_DEVICE_TYPE}" /></td>
		   	<td style="width:120px;">${item.CMD_PROGRAM_NAME}
		   	<input type="hidden" name="paramList[${status.index+0}].CMO_PROGRAM_NAME"
										value="${item.CMD_PROGRAM_NAME}" />
		   	</td>
		   	<td style="width:120px;">${item.CMD_DEVICE_SEQ}
		   	<input type="hidden" name="paramList[${status.index+0}].CMO_DEVICE_SEQ"
										value="${item.CMD_DEVICE_SEQ}" />
		   	</td>
		   	<td style="width:120px;">${item.CMD_TABLE_NO}
		   	<input type="hidden" name="paramList[${status.index+0}].CMO_TABLE_NO"
										value="${item.CMD_TABLE_NO}" />
		   	</td>
		   	<td style="width:120px;">${item.CMD_LOADPOINT}
		   	<input type="hidden" name="paramList[${status.index+0}].CMO_LOADPOINT"
										value="${item.CMD_LOADPOINT}" />
		   	</td>
			<td style="width:120px;">${item.CMD_CHANEL_SN}
			<input type="hidden" name="paramList[${status.index+0}].CMO_CHANEL_SN"
										value="${item.CMD_CHANEL_SN}" />
			</td>
			<td style="width:120px;">${item.CMD_ITEM_CODE}
			<input type="hidden" name="paramList[${status.index+0}].CMO_ITEM_CODE"
										value="${item.CMD_ITEM_CODE}" />
			</td>
			<td style="width:120px;">${item.CBD_ITEM_NAME}
			
			</td>
			<td style="width:120px;">${item.CBD_ITEM_SPEC}</td>
			
			<td style="width:120px;">${item.CMD_TRY_FLAG}
			<input type="hidden" name="paramList[${status.index+0}].CMO_TRY_FLAG"
										value="${item.CMD_TRY_FLAG}" />
			</td>
			
			<td style="width:120px;">${item.CMD_SHKIP_FLAG}
			<input type="hidden" name="paramList[${status.index+0}].CMO_SHKIP_FLAG"
										value="${item.CMD_SHKIP_FLAG}" />
			</td>
			
			<td style="width:120px;">${item.CMD_POINT_NUM}
			<input type="hidden" name="paramList[${status.index+0}].CMO_POINT_NUM"
										value="${item.CMD_POINT_NUM}" />
			</td>
			
			<td style="width:120px;">${item.CMD_POINT_LOCATION}
			<input type="hidden" name="paramList[${status.index+0}].CMO_POINT_LOCATION"
										value="${item.CMD_POINT_LOCATION}" /></td>
			<td style="width:120px;">${item.CMD_BOM_FLAG}
			<input type="hidden" name="paramList[${status.index+0}].CMO_BOM_FLAG"
										value="${item.CMD_BOM_FLAG}" />
			</td>
			
			
		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</div>	
									
</DIV>

<DIV id="content5" style="margin-top:4px;" >  
<div class="mod">
<div class="mod-hd" style="height:15px">
<h3 class="tit"></h3>
</div>
<div class="mod-bd">	
   <table id="addTable_gkwl" width="100%" class="glxb-table table-line">
	
		<thead>
		<tr>
		    <th class=""></th>
			<th class="tr1 "><dict:lang value="管控类型" /></th>
			<th class="tr1 "><dict:lang value="管控料号" /></th>
			<th class="tr1 "><dict:lang value="物料名称" /></th>
			<th class="tr1 "><dict:lang value="物料规格" /></th>
			<th class="tr1 "><dict:lang value="管控工序" /></th>
			<th class="tr1 "><dict:lang value="管控数量" /></th>
			<th class="tr1 "><dict:lang value="管控方式" /></th>
			<th class="tr1 "><dict:lang value="来源" /></th>
			<th class="tr1 "><dict:lang value="创建人" /></th>
			<th class="tr1 "><dict:lang value="创建时间" /></th>
			
		</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${dataList2}" varStatus="status">
		<tr>
			<td style="width:30px;text-align:center">${status.index + 1}</td>		
		   	<td style="width:80px;">
		   	<s:if test="${item.CTI_ITEM_TYPE==0}"><dict:lang value="物料" /></s:if>
		   	<s:if test="${item.CTI_ITEM_TYPE==1}"><dict:lang value="辅料" /></s:if>
		   	</td>
			<td style="width:120px;">${item.CTI_ITEM_CODE}</td>
			<td style="width:120px;">${item.CI_ITEM_NAME}</td>
			<td style="width:120px;">${item.CI_ITEM_SPEC}</td>
			<td style="width:120px;">${item.CTI_GROUP}</td>
			<td style="width:80px;">${item.CTI_ASSB_QTY}</td>
			<td style="width:80px;">
			<s:if test="${item.CTI_CONTROL_MODE=='0'}"><dict:lang value="个体" /></s:if>
			<s:if test="${item.CTI_CONTROL_MODE=='1'}"><dict:lang value="批次" /></s:if>
			</td>
			<td style="width:80px;">
			<s:if test="${item.CTI_ITEM_SOURCE=='0'}"><dict:lang value="自制" /></s:if>
			<s:if test="${item.CTI_ITEM_SOURCE=='1'}"><dict:lang value="外购" /></s:if>
			</td>
			<td style="width:120px;">${item.NAME}</td>
			<td style="width:120px;">
			<fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/>
			
			</td>			
		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</div>									
</DIV>
			
			
	</DIV>
</form>
					
					</DIV>
					
				</div>
		</div>
	</DIV>
<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	var a='${dataMap.base.CIG_LINK_NUM}';
	if(a==null||a==''){
	  $("#paraMapObj_PM_UNIT_NUM").val(1);//联板数
	}
	else{
	  $("#paraMapObj_PM_UNIT_NUM").val(a);//联板数
	}
	a='${dataMap.base.CIG_SN_NUM}';
	if(a==null||a==''){
	  $("#paraMapObj_PM_JIGSAW_NUM").val(1);//联板数
	}
	else{
	  $("#paraMapObj_PM_JIGSAW_NUM").val(a);//条码拼板数
	}
	
	var num='${dataMap.base.CIG_FQC_NUM}';
	if(num>0){
	  $("#paraMapObj_PM_AUTO_FQC_1").attr('checked','checked');
	  $("#paraMapObj_PM_FQC_NUM").val('${dataMap.base.CIG_FQC_NUM}');//送检批量	
	}
	else{
	  $("#paraMapObj_PM_FQC_NUM").val(0);
	}
	
	$("#paraMapObj_PM_SN_RULE").val('${dataMap.base.CIG_SN_RULE_B}');//产品条码规则
	$("#paraMapObj_PM_SUB_RULE").val('${dataMap.base.CIG_SN_RULE_S}');//小板条码规则
	a='${dataMap.base.CIG_REPAIR_MAX}';//维修上线次数
	if(a==null||a==''){
	  $("#paraMapObj_PM_REPAIR_MAX").val(0);
	}
	else{
	  $("#paraMapObj_PM_REPAIR_MAX").val(a);
	}
	
	function fqcChange(obj){
	  //alert(obj.checked);
	  if(obj.checked==false){
	     $("#paraMapObj_PM_FQC_NUM").attr("class","isSubmit input input isSubmit  readonly isaddSubmit");
	     $("#paraMapObj_PM_FQC_NUM").attr("disabled","disabled");
	     $("#paraMapObj_PM_FQC_NUM").val(0);
	  }
	  else{
	     $("#paraMapObj_PM_FQC_NUM").attr("class","isSubmit input");
	     $("#paraMapObj_PM_FQC_NUM").removeAttr("disabled");
	  }
	}
	var blockIcon;
    var blackConn;
    var paraMapModel = "view";
	function queryRoute(key){

	    var routeUrl="${path}buss/bussModel_exeFunc.ms?funcMId=c82bb66d922f4852b43ac713da0507ea&formId=%{formId}";
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: routeUrl+"&ctId="+key,
 			success: function(data){
 			
 				var pList=data.ajaxList;
 				$("#paraMapObj_PM_START_GROUP").val('');
 				$("#paraMapObj_PM_END_GROUP").val('');
 				$("#right").html('');
 				if(pList!=null&&pList.length>0){
 				  $("#paraMapObj_PM_START_GROUP").val(pList[0].CR_MO_INPUT);
 				  $("#paraMapObj_PM_END_GROUP").val(pList[0].CR_MO_OUTPUT);
 				  switchTag('tag2','content2','');
 				  blockIcon = JSON.parse(pList[0].CR_BLOCKS_MSG);
        		  blackConn = JSON.parse(pList[0].CR_CONN_MSG);
        		  initJsPlumb();
        		  //showCon();
 				}
 				//alert(utilsFp.jsonToString(pList));
 				
 				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				
 		   }
 		});
	}
	function editSave(thisObj){console.log(12121);
                        isQuery = false;
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
        		return ;
        	}
			
			
                        $DisInput = $(":input[disabled='disabled'][class*='isSubmit']");
			$DisInput.attr("disabled", false); 
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=adad011c719044abab4f07b7217c3ec2&type=online";
       
			document.forms.editForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
}
		
	
</script>
<bu:script viewId="c84ec01e33324970914ec1974ab19c7f" />

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	

</body>


<%@ include file="/plf/common/pub_end.jsp"%>
