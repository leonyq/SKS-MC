<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="查看1111111" /></title>
	<style>
		.chosen-container{
			width:200px !important;
		}
		td input[type="text"]{
			width:200px !important;
		}
	</style>
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
	
	var loaded = 1;
	var tab_len = 5;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content,url) {
			if(currentTag == tag){
				return false;
			}
			document.getElementById("content2").style.display="";
			document.getElementById("content3").style.display="";
			document.getElementById("content4").style.display="";
			document.getElementById("content5").style.display="";
			for (i = 1; i < (tab_len+1); i++) {
				if ("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
				}
			$("#" + tag).addClass("current").siblings().removeClass("current");
				if ("content" + i == content) {
					currentTag = tag;
					document.getElementById(content).className = "";
				} else {
					document.getElementById("content" + i).className = "hidecontent";
				}
				document.getElementById("content").className = content;
			}
			$('.chosen-container').css("width","230px");
		}
	</script>
</head>
<body style="background-color:#fff">
	<div class="edit">
			<div class="bd" style="border-top:0; border-bottom:0;height:420px;">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="013c4606017841b6b4e7f01e2a32d0a6" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="013c4606017841b6b4e7f01e2a32d0a6" />
	<input type="hidden" name="013c4606017841b6b4e7f01e2a32d0a6" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'01cf3d0f4eb34080a6aaf1e128a6c3db'" />
		<s:set name="_$formId_1" value="'013c4606017841b6b4e7f01e2a32d0a6'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:52px"><span class="dot">*</span><bu:uitn colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" style="width:52px"><bu:uitn colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" style="width:52px"><bu:uitn colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		</tr>
		<tr>
			<td class="name"><bu:uitn colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
			<td class="name"><bu:uitn colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
			<td class="name"><bu:uitn colNo="CI_ITEM_SOURCE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_SOURCE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_SOURCE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
		</tr>
		<tr>
			<td class="name" style="width: 82px;"><bu:uitn colNo="CI_SN_RULE" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
			<bu:td cssClass="dec" colNo="CI_SN_RULE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_SN_RULE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:180px"/></bu:td>
			<td class="name"><bu:uitn colNo="CI_CUST_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" colNo="CI_CUST_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_CUST_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
			<td class="name"><bu:uitn colNo="CI_SUPPLIER_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" colNo="CI_SUPPLIER_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_SUPPLIER_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
		</tr>
		<tr>
			<td class="name"><bu:uitn colNo="CI_MEMO" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<td class="dec" colspan="5" height="80px;"><bu:ui colNo="CI_MEMO" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width: 100%;height: 100%;"/></td>
			
		</tr>
				</table>
<div class="js-tab">
	<DIV id="container">
		<DIV class="hd">
			<UL class="tab-list tab">
				<LI id="tag1"><A class="selectli1"
					onclick="switchTag('tag1','content1','','');this.blur();"
					href="javascript:void(0);"> <SPAN class="selectspan1">PCB</SPAN>
				</A></LI>
				<LI id="tag2"><A class=""
					onclick="switchTag('tag2','content2','','');this.blur();"
					href="javascript:void(0);"> <SPAN>生产</SPAN> </A></LI>
				<LI id="tag3"><A class=""
					onclick="switchTag('tag3','content3','','');this.blur();"
					href="javascript:void(0);"> <SPAN>品质</SPAN> </A></LI>
				<LI id="tag4"><A class=""
					onclick="switchTag('tag4','content4','','');this.blur();"
					href="javascript:void(0);"> <SPAN>仓储</SPAN> </A></LI>
				<LI id="tag5"><A class=""
					onclick="switchTag('tag5','content5','','');this.blur();"
					href="javascript:void(0);"> <SPAN>其他</SPAN> </A></LI>

			</UL>
		</DIV>
		<DIV class="content1" id="content"  style="margin-top: 15px;">
			
				<DIV id="content1" style="margin-top:4px;">
				
				
				<table class="basic-table" width="100%">
					<tr>
						<td class="name" /><bu:uitn colNo="CI_LINK_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_LINK_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_LINK_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_JIGSAW_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_JIGSAW_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_JIGSAW_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_SN_RULE_B" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_SN_RULE_B" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_SN_RULE_B" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_SN_RULE_S" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_SN_RULE_S" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_SN_RULE_S" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_PCB_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_PCB_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_PCB_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"/></bu:td>
					
					</tr>
				</table>
			</DIV>
			<DIV id="content2" style="display:none">
				<table class="basic-table" width="100%">
					<tr>
						<td class="name" /><bu:uitn colNo="CI_FEEDER_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_FEEDER_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_FEEDER_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_PACK_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_PACK_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_PACK_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_FEED_ANGLE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_FEED_ANGLE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_FEED_ANGLE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_PRINT_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_PRINT_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_PRINT_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_CONTRAL_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_CONTRAL_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_CONTRAL_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_AGING_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_AGING_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_AGING_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
				</table>
			</DIV>
			<DIV id="content3" style="display:none">
				<table class="basic-table" width="100%">
					<tr>
						<td class="name" /><bu:uitn colNo="CI_STOCK_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_STOCK_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_STOCK_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_CYCLE_REMIND" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_CYCLE_REMIND" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_CYCLE_REMIND" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
					<!--
						<td class="name" /><bu:uitn colNo="CI_IQC_FREE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_IQC_FREE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<bu:uitn colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" />
							<bu:ui colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" />
							</bu:td>
							-->
									
						<td class="name"><bu:uitn colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6"  dataId="${dataId}" formIndex="1"/></td>	
					
							
						<td class="name" /><bu:uitn colNo="CI_FQC_QTY" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_FQC_QTY" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_FQC_QTY" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_SCRAP_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_SCRAP_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_SCRAP_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" />
																												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																												<bu:uitn colNo="CI_TEST_FALG" formId="013c4606017841b6b4e7f01e2a32d0a6" />
																												<bu:ui colNo="CI_TEST_FALG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" /></bu:td>
						<td class="name" /><bu:uitn colNo="CI_REPAIR_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_REPAIR_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_REPAIR_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_TEST_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_TEST_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_TEST_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_TEST_MIN" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_TEST_MIN" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_TEST_MIN" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_TEST_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_TEST_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_TEST_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_RECHECK_DAYS" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_RECHECK_DAYS" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_RECHECK_DAYS" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>						
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_REMIND_DAYS" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_REMIND_DAYS" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_REMIND_DAYS" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>					
					</tr>
				</table>
			</DIV>
			<DIV id="content4" style="display:none">
				<table class="basic-table" width="100%">
					<tr>
						<td class="name" /><bu:uitn colNo="CI_MIN_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_MIN_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MIN_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_MAX_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_MAX_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MAX_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_STANDARD_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_STANDARD_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_STANDARD_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_FULL_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_FULL_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_FULL_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_MIN_PACK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_MIN_PACK" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MIN_PACK" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
						<tr>
						<td class="name" /><bu:uitn colNo="CI_SLUGGISH_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_SLUGGISH_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_SLUGGISH_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						
					</tr>
				</table>
			</DIV>
			<DIV id="content5" style="display:none">
				<table class="basic-table" width="100%">
					<tr>
					<!--
						<td class="name" /><bu:uitn colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"/></bu:td>
																												-->
						<td class="name" /><bu:uitn colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<bu:uitn colNo="CI_ROHS_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" />
						<bu:ui colNo="CI_ROHS_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" /></bu:td>

						<td class="name" /><bu:uitn colNo="CI_MSD_ID" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_MSD_ID" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MSD_ID" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_CUST_ITEM" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_CUST_ITEM" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_CUST_ITEM" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
				</table>
			</DIV>
			<bu:jsVal formId="013c4606017841b6b4e7f01e2a32d0a6" formIndex="1" />
			</div>
		
	</div>
	</div>
	</div>

	<script type="text/javascript">
		$(function(){
			$('.dialog-bd',parent.document).css('background-color','#fff')
		})
		
		function init(){
		$("#tag1").addClass("current");
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
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
