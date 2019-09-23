<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<style>
		.dialog-bd{
			background-color: #fff;
		}
		input[type='text']{
			width:200px !important;
		}
	</style>
		<style type="text/css">
	.x-fieldset{border:1px solid #00bfff;padding:10px;margin-botton:10px;display:block;height: 100%}
	.devicetable { table-layout: fixed;}
	.devicetd {
    overflow:hidden;
    white-space:nowrap;
    text-overflow:ellipsis;
    -o-text-overflow:ellipsis;
    -moz-text-overflow: ellipsis;
    -webkit-text-overflow: ellipsis;
    }
    #block2 td,#block3 td,#block4 td,#block5 td{
    border:1px solid #ccc;
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
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
	<script src="${path}plf/js/jsPlumb/newWorkflowchart.js"></script>   
    <script type ="text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <script src="${path}plf/js/jsPlumb/flow/topo.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/businessTopo.js"></script>
	<script type="text/javascript" src="${path}plf/js/jsPlumb/flow/jtopo-min.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/jscolor.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/toHex.js"></script>
	<script>
	    
	
		
		$(function(){
		initContext();//初始化内容
		scene.mousedrag(function(event) {
			scene.translateX=0;
			scene.translateY=0;
			
		})
		billingButton();//绑定按钮事件
	});
		
		
		
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
			   // alert(i);
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
		//alert(tag);
		if(tag=="tag2"){
		    	var caId = $("#paraMapObj_PM_TECH_SN").val();
		        
		    	if(null!=caId ||　caId!=""){
		    	    queryRoute(caId);
		    	}
			
		}
		if(tag=="tag3"){
		    	showBow();
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
	
	var blockIcon;
    var blackConn;
    var paraMapModel = "view";
	function queryRoute(key){
	    var routeUrl2="${path}buss/bussModel_exeFunc.ms?funcMId=88a6967c694e4efa874202a13a75c87b&formId=%{formId}";
	    //var dataAuthId =$("#dataAuthId").val();
	    var dataAuthId ='${param.dataAuthId}';
	    var dataId ='${dataId}';
	    console.log(dataAuthId);
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: routeUrl2,
 	    	data:{
 	    	    "ctId":key,
 	    	    "dataAuthId":dataAuthId,
 	    	    "dataId":dataId
 	    	},
 			success: function(data){
 				var pList=data.ajaxList;
 				
 				$("#paraMapObj_PM_START_GROUP").val("");
 				$("#paraMapObj_PM_END_GROUP").val("");
 				cleanScene();
 				if(pList!=null&&pList.length>0){
 				  
 				  $("#paraMapObj_PM_START_GROUP").val(pList[0].CR_MO_INPUT);
 				  $("#paraMapObj_PM_END_GROUP").val(pList[0].CR_MO_OUTPUT);
		          $("#INPUT_CODE").val(pList[0].INPUT_CODE);
 				  $("#OUTPUT_CODE").val(pList[0].OUTPUT_CODE); 				  
 				  //switchTag('tag2','content2','');
 				  var blockIcon = JSON.parse(pList[0].CR_BLOCKS_MSG);
 				  if(blockIcon!=""&&blockIcon!=undefined){
 				   stage.mode="drag";//场景模式
 				  blockIcon=JSON.stringify(blockIcon);
 				   showTopoData(blockIcon);
 				  }
 				 blackConn = JSON.parse(pList[0].CR_CONN_MSG);
        		  initJsPlumb();
        		  showCon();
 				}
 				//alert(utilsFp.jsonToString(pList));
 				
 				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				
 		   }
 		});
	}
		
	</script>
</head>
<body style="background-color: #fff;">
	<div class="edit">
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
									onclick="switchTag('tag3','content3','');this.blur();showBow();"
									href="javascript:void(0);"> <SPAN><dict:lang value="BOM" /></SPAN> </A>
								</LI>
								<LI id="tag4"><A class=""
									onclick="switchTag('tag4','content4','');this.blur();showMaterial();"
									href="javascript:void(0);"> <SPAN><dict:lang value="料站表" /></SPAN> </A>
								</LI>
								<LI id="tag5"><A class=""
									onclick="switchTag('tag5','content5','');this.blur();showItem();"
									href="javascript:void(0);"> <SPAN><dict:lang value="管控物料" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
           <DIV class="content2" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<DIV class="bd" style="border-bottom: none;border-top: none;">
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" id="dataAuthId" name="dataAuthId" value="${dataAuthId}">
								<input type="hidden" name=iframeId value="${iframeId}">
								<input type="hidden" name="projectId" id="projectId" />
                            	<input type="hidden" name="pmId" id="pmId" />
                            	<input type="hidden" name="areaStep" id="areaStep" />
                            	<input type="hidden" name="trackFlag" id="trackFlag" />
                            	<input type="hidden" name="step" id="step" value=''/>
                            	<input type="hidden" name="TARGET_QTY" id="TARGET_QTY" value=''/>
                            	<input type="hidden" name="INPUT_CODE" id="INPUT_CODE" value=''/>
                            	<input type="hidden" name="OUTPUT_CODE" id="OUTPUT_CODE" value=''/>	
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
		<bu:set name="paraMapObj" value="${dataId}" formId="9b18994844b049f2ad90204b77793334" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9b18994844b049f2ad90204b77793334" />
	<input type="hidden" name="9b18994844b049f2ad90204b77793334" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	
		<s:set name="_$viewId" value="'ec823fed1ac84f8f9578bbba6c7d40a1'" />
		<s:set name="_$formId_1" value="'9b18994844b049f2ad90204b77793334'" />
		<s:set name="_$type" value="'detail'"/>

		
		<tr>
			<td class="name" style="width:96px"/><bu:uitn colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
			<td class="name" style="width:96px"/><bu:uitn colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
			<td class="name" style="width:84px"/><bu:uitn colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_AREA_SN" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}"  style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROCESS_FACE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_PCB_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PCB_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PCB_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
		</tr>
		
		<tr>
		    	<td class="name" /><bu:uitn colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MODEL_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PRODUCT_NAME" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="2" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PRODUCT_STANDARD" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="2" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TECH_SN" disabled="disabled" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		         &#x3000;&#x3000;
			<td class="name" /><bu:uitn colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
	                <td class="name" /><bu:uitn colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
	
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
		    <td class="name"><bu:uitn colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" /></td>
		<td class="dec" colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334"><bu:ui colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}"  formIndex="1"/></td>
		    <!--
			<td class="name" /><bu:uitn colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" />   </td>
			<bu:td cssClass="dec" colNo="PM_AUTO_FQC" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" formIndex="1" />
				
				<bu:uitn colNo="PM_AUTO_FQC"  formId="9b18994844b049f2ad90204b77793334" />
				<bu:ui colNo="PM_AUTO_FQC" formId="9b18994844b049f2ad90204b77793334" onclick="fqcChange(this)" disabled="disabled" dataId="${dataId}" formIndex="1" />
				
			</bu:td>-->
			
			<!--
		    <td class="name" /><bu:uitn colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			-->
			<td class="name" /><bu:uitn colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" disabled="disabled" style="width:200px;" formIndex="1" /></bu:td>

		</tr>
		
		<tr>
		        <td class="name" /><bu:uitn colNo="PM_TRANSFER_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TRANSFER_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TRANSFER_RULE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_CUST_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_CUST_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_CUST_CODE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>
		   
		   <!--     <td class="name" /><bu:uitn colNo="PM_TRACK" formId="9b18994844b049f2ad90204b77793334" /></td> 
			<bu:td cssClass="dec" colNo="PM_TRACK" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TRACK" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>-->
		</tr>
		<tr>
		
			<td class="name" /><bu:uitn colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" colspan="5"><bu:ui colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:100%;height:80px;"  formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="9b18994844b049f2ad90204b77793334" formIndex="1" />
			</div>
		   </DIV>
		  </DIV> 
		    <DIV id="content2" style="margin-top:4px;" >  
                <div class="mod">
                
                <div class="mod-bd">
                
                <div id="right" style="height: 300px;width: 100%;left: 0;">
                		<canvas style="border: 1px solid #E4E4E4;margin-left:10px;box-sizing:border-box;" id="canvas" ondrop="drop(event)" ondragover="allowDrop(event)" width='940px' height='436'></canvas>	
                </div>
                </div>
                </div>	
                									
            </DIV>
            <input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1232'/>
		    <DIV id="content3" style="margin-top:4px;" >  
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1232">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="阶别" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="料号" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="料号名称" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="料号规格" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="单位" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="点位" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="用量" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:450px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1232" >
								<tbody id="bombody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>									
</DIV>
<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a1233'/>
<DIV id="content4" style="margin-top:4px;" >  
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head3"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1233">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="贴片机型" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="程式名称" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="设备序号" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="TABLE" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="料站" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="通道" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="物料料号" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="物料名称" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="规格" /></td>
									<td style="width: 120px;" class="datagrid-cell "><dict:lang value="TRY盘物料" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="跳过标志" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="点数" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="点位" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="BOM范围" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll3" style="height:420px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1233" >
								<tbody id="materialbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>	
									
</DIV>
<input type="hidden" name="formId" id="formId4" value='831b2dbf0dfb494695b7ce66538a1234'/>
<DIV id="content5" style="margin-top:4px;" >  
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head4"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;" class=""></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控类型" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控料号" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="物料名称" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="物料规格" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控工序" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控数量" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控方式" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="来源" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="创建人" /></td>
									<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="创建时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll4" style="height:450px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="itembody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>									
            </DIV>
		</DIV>
	</div>
</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $('.dialog-bd',parent.document).css('background-color','#fff')
				 var kes=$("#paraMapObj_PM_TECH_SN").val();
				 queryRoute(kes);
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
		/*
			var blockIcon;
        var blackConn;
        var paraMapModel = "view";		
		var routeUrl="buss/bussModel_exeFunc.ms?funcMId=88a6967c694e4efa874202a13a75c87b&formId=9b18994844b049f2ad90204b77793334";
		function queryRoute(key){
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: routeUrl,
 	    	data:{
 	    	    "ctId":key
 	    	},
 			success: function(data){
 				var pList=data.ajaxList;		
                console.log(pList);
 				$("#paraMapObj_PM_START_GROUP").val('');
 				$("#paraMapObj_PM_END_GROUP").val('');
 				if(pList!=null&&pList.length>0){
 				  $("#paraMapObj_PM_START_GROUP").val(pList[0].CR_MO_INPUT);
 				  $("#paraMapObj_PM_END_GROUP").val(pList[0].CR_MO_OUTPUT);
 				  	$("#paraMapObj_PM_TECH_SN_SHOW").val(pList[0].CT_NAME);
 				  	
 				  blockIcon = JSON.parse(pList[0].CR_BLOCKS_MSG);
        		  blackConn = JSON.parse(pList[0].CR_CONN_MSG);
        		  //initJsPlumb();
 				} 				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				
 		   }
 		});
	}
	*/	

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
	 var bomObj="";
	function showBow(){
		util.showLoading("处理中...");
		var getbomurl="${path}buss/bussModel_exeFunc.ms?funcMId=e43d388e9d214f1ab7fe8a7641167831&formId=%{formId}";
	var projectId = $.trim($("#paraMapObj_PM_PROJECT_ID").val());
	var dataAuthId ='${param.dataAuthId}';
	if(projectId == null || projectId == ""){
		utilsFp.confirmIcon(1,"","","", "请先填写制令单号",0,"","");
						
				           
	}
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:getbomurl,
			    data: {
			       "projectId":projectId ,
			        "dataAuthId":dataAuthId
			    },
				success: function(data){
						util.closeLoading();

						if(null == data.ajaxList || data.ajaxList == ""){ 
				                $("#bombody").empty();
				               
				                return ;}
						if(null != data.ajaxList){
						       
							$("#bombody").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							     bomObj= data.ajaxList[i];
							     $("#bombody").append("<tr></tr>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CBD_SEQUENCE+"<input type='hidden' id='CBD_SEQUENCE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_SEQUENCE+"'/></td>"); 
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CBD_ITEM_CODE+"<input type='hidden' id='CBD_ITEM_CODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_ITEM_CODE+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+(data.ajaxList[i].CBD_ITEM_NAME==null?"":data.ajaxList[i].CBD_ITEM_NAME)+"<input type='hidden' id='CBD_ITEM_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_ITEM_NAME+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+(data.ajaxList[i].CBD_ITEM_SPEC==null?"":data.ajaxList[i].CBD_ITEM_SPEC)+"<input type='hidden' id='CBD_ITEM_SPEC"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_ITEM_SPEC+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CBD_UNITS+"<input type='hidden' id='CBD_UNITS"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_UNITS+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CBD_POINT+"<input type='hidden' id='CBD_POINT"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_POINT+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+(data.ajaxList[i].CBD_ITEM_NUM==null?0:data.ajaxList[i].CBD_ITEM_NUM)+"<input type='hidden' id='CBD_ITEM_NUM"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_ITEM_NUM+"'/></td>");
							      
							           
						
								
							}
							var tableTrJs = $("#bombody tr");_tongLineColor(tableTrJs);
						//	setPopScroll('.scroll2','.head2');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1232");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}
    var materialObj="";
	function showMaterial(){
	  
		util.showLoading("处理中...");
		var area = $("#paraMapObj_PM_AREA_SN").val();
		var face = $("#paraMapObj_PM_PROCESS_FACE").val();
		var track = $("#paraMapObj_PM_TRACK").val();//2018/06/12  增加轨道条件
		var pmId = "${dataId}";
	        var wkid = "";
		var devid = "";
		var seq = "";
		var flag = true;
		if(pmId == null || pmId == ""){
		flag = false;
		}
		
						if(pmId == null || pmId == ""){
						utilsFp.confirmIcon(1,"","","", "请先填写制令单号",0,"","");
						
				               
						}	
		//var getmaterialurl="${path}buss/bussModel_exeFunc.ms?funcMId=2eb082721934414cba6f70183a836e65&formId=%{formId}";
		var getmaterialurl="${path}buss/bussModel_exeFunc.ms?funcMId=d2bdfdbd63f3454d8a379bf19c53c94e&formId=%{formId}";
		var dataAuthId ='${param.dataAuthId}';
			var dataAuthIds ='${dataId}';
			console.log("dataAuthIds:"+dataAuthIds);
		var	dataId='${param.dataId}'
				console.log("dataId:"+dataId);
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:getmaterialurl,
			    data:{
			      "pmId":pmId,
			      "devid":"",
			      "area":area,
			      "face":face,
			      "wkid":"",
			      "seq":"",
			      "track":track,
			      "dataAuthId":dataAuthId,
			      "dataId":'${dataId}',
			    },
				success: function(data){
						util.closeLoading();

						if(null == data.ajaxList  || data.ajaxList == ""){ 
				                $("#materialbody").empty();//alert("未查询到料站数据");
				                //utilsFp.alert("未查询到料站数据");
				                return ;}
				             
						if(null != data.ajaxList){
							$("#materialbody").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							     materialObj= data.ajaxList[i];
							     $("#materialbody").append("<tr></tr>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"); 
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_DEVICE_TYPE+"<input type='hidden' name='CMD_DEVICE_TYPE' id='CMD_DEVICE_TYPE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_DEVICE_TYPE+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 80px;text-align: center;'>"+(data.ajaxList[i].CMD_PROGRAM_NAME==null?"":data.ajaxList[i].CMD_PROGRAM_NAME)+"<input type='hidden' name='CMD_PROGRAM_NAME' id='CMD_PROGRAM_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_PROGRAM_NAME+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_DEVICE_SEQ+"<input type='hidden' name='CMD_DEVICE_SEQ' id='CMD_DEVICE_SEQ"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_DEVICE_SEQ+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_TABLE_NO+"<input type='hidden' name='CMD_TABLE_NO' id='CMD_TABLE_NO"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_TABLE_NO+"'/><input type='hidden' name='CM_SN' id='CM_SN"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CM_SN+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_LOADPOINT+"<input type='hidden' name='CMD_LOADPOINT' id='CMD_LOADPOINT"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_LOADPOINT+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_CHANEL_SN+"<input type='hidden' name='CMD_CHANEL_SN' id='CMD_CHANEL_SN"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_CHANEL_SN+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_ITEM_CODE+"<input type='hidden' name='CMD_ITEM_CODE' id='CMD_ITEM_CODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_ITEM_CODE+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width: 80px;text-align: center;'>"+(data.ajaxList[i].CI_ITEM_NAME==null?"":data.ajaxList[i].CI_ITEM_NAME)+"<input type='hidden' name='CI_ITEM_NAME' id='CI_ITEM_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CI_ITEM_NAME+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width: 80px;text-align: center;'>"+(data.ajaxList[i].CI_ITEM_SPEC==null?"":data.ajaxList[i].CI_ITEM_SPEC)+"<input type='hidden' name='CI_ITEM_SPEC' id='CBD_ITEM_SPEC"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CI_ITEM_SPEC+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CMD_TRY_FLAG+"<input type='hidden' name='CMD_TRY_FLAG' id='CMD_TRY_FLAG"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_TRY_FLAG+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_SHKIP_FLAG+"<input type='hidden' name='CMD_SHKIP_FLAG' id='CMD_SHKIP_FLAG"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_SHKIP_FLAG+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_POINT_NUM+"<input type='hidden' name='CMD_POINT_NUM' id='CMD_POINT_NUM"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_POINT_NUM+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_POINT_LOCATION+"<input type='hidden' name='CMD_POINT_LOCATION' id='CMD_POINT_LOCATION"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_POINT_LOCATION+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width: 80px;text-align: center;'>"+(data.ajaxList[i].CMD_BOM_FLAG==null?"":data.ajaxList[i].CMD_BOM_FLAG)+"<input type='hidden' name='CMD_BOM_FLAG' id='CMD_BOM_FLAG"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_BOM_FLAG+"'/></td>");							     
	
							}
							var tableTrJs = $("#materialbody tr");_tongLineColor(tableTrJs);
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1233");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});
				return flag;

	}
	function showItem(){
		util.showLoading("处理中...");
	        var modelcode = $("#paraMapObj_PM_MODEL_CODE").val();
	        var maFace = $("#paraMapObj_PM_PROCESS_FACE").val();
	        var getitemurl="${path}buss/bussModel_exeFunc.ms?funcMId=a21692245970460bbc669bc136cf7828&formId=%{formId}";
	         var dataAuthId ='${param.dataAuthId}';
	         var dataId ='${dataId}';
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:getitemurl,
			    data:{
			       "modelcode":modelcode,
			       "maFace":maFace,
			       "dataAuthId":dataAuthId,
			       "dataId":dataId
			    },
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxList  || data.ajaxList == ""){ 
				                $("#itembody").empty();
				               
				                return ;}
						if(null != data.ajaxList){
							$("#itembody").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							     
							     $("#itembody").append("<tr></tr>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 30px;text-align: center;'>"+(i+1)+"</td>"); 
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_ITEM_TYPE+"<input type='hidden' id='CTI_ITEM_TYPE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_ITEM_TYPE+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_ITEM_CODE+"<input type='hidden' id='CTI_ITEM_CODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_ITEM_CODE+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+(data.ajaxList[i].CI_ITEM_NAME==null?"":data.ajaxList[i].CI_ITEM_NAME)+"<input type='hidden' id='CI_ITEM_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CI_ITEM_NAME+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+(data.ajaxList[i].CI_ITEM_SPEC==null?"":data.ajaxList[i].CI_ITEM_SPEC)+"<input type='hidden' id='CI_ITEM_SPEC"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CI_ITEM_SPEC+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_GROUP+"<input type='hidden' id='CTI_GROUP"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_GROUP+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_ASSB_QTY+"<input type='hidden' id='CTI_ASSB_QTY"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_ASSB_QTY+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_CONTROL_MODE+"<input type='hidden' id='CTI_CONTROL_MODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_CONTROL_MODE+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_ITEM_SOURCE+"<input type='hidden' id='CTI_ITEM_SOURCE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_ITEM_SOURCE+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].NAME+"<input type='hidden' id='NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].NAME+"'/></td>");
                                                            $("#itembody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CREATE_TIME+"<input type='hidden' id='CREATE_TIME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CREATE_TIME+"'/></td>");							    
							    
							      
							           
						
								
							}
						var tableTrJs = $("#itembody tr");_tongLineColor(tableTrJs);
						    // setPopScroll('.scroll4','.head4');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}
</script>

<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll3','.head3');
    setPopScroll('.scroll4','.head4');
  })
})(jQuery)</script>


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
