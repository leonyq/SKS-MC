<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<style>
		.chosen-container{
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
<body scroll="no">
	<div class="edit">
            		<div class="hd">
            		<div style="margin-left:10px;">
            		<div class="save-close" title="保存并关闭窗口" onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
            		</div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}"> <input type="hidden" name="iframeId" value="${iframeId}">
 <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
				<input type="hidden" name="formIds" value="013c4606017841b6b4e7f01e2a32d0a6" />
				<input type="hidden" name="013c4606017841b6b4e7f01e2a32d0a6" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<input type="hidden" name="formId" value="013c4606017841b6b4e7f01e2a32d0a6" />
				<input type="hidden" name="iframeId" value="${iframeId}">
				<s:set name="_$viewId" value="'5df194099e0249dcbf5cf316b2eb6de0'" />
				<s:set name="_$formId_1" value="'013c4606017841b6b4e7f01e2a32d0a6'" />
				<s:set name="_$type" value="'add'" />
				<input type="hidden" name="paraMap2.type" value="add" />
				<table class="basic-table" width="100%">
					<tr>
						<td class="name" style="width: 52px;"><span class="dot">*</span><bu:uitn colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"  style="width: 220px;"><bu:ui colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_ITEM_CODE}" formIndex="1" style="width: 200px;"/></td>
						<td class="name" style="width: 52px;"><bu:uitn colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"  style="width: 220px;"><bu:ui colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_ITEM_NAME}" formIndex="1" style="width: 200px;"/></td>
						<td class="name" style="width: 52px;"><bu:uitn colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"  style="width: 200px;"><bu:ui colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_ITEM_SPEC}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"><bu:ui colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_ITEM_GENRE}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"><bu:ui colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_ITEM_TYPE}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_ITEM_SOURCE" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"><bu:ui colNo="CI_ITEM_SOURCE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_ITEM_SOURCE}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_ROHS_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"><bu:ui colNo="CI_ROHS_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_ROHS_FLAG}" formIndex="1"/></td>
						<td class="name"><bu:uitn colNo="CI_CUST_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"><bu:ui colNo="CI_CUST_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_CUST_CODE}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_SUPPLIER_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
						<td class="dec"><bu:ui colNo="CI_SUPPLIER_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_SUPPLIER_CODE}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr >
					<td class="name" ><bu:uitn colNo="CI_MEMO" formId="013c4606017841b6b4e7f01e2a32d0a6" cssClass="tr1" /></td>
					<td class="dec" colspan="5" height="80px;"><bu:ui colNo="CI_MEMO" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_MEMO}" formIndex="1"  style="width: 100%;height: 100%;"/></td>
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
		<DIV class="content1" id="content" style="margin-top: 15px;">
			
				<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
				
				
				<table class="basic-table" width="100%">
					<tr>
						<td class="name"><bu:uitn colNo="CI_LINK_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6"/></td>
						<td class="dec"><bu:ui colNo="CI_LINK_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_LINK_NUM}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_JIGSAW_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6"/></td>
						<td class="dec"><bu:ui colNo="CI_JIGSAW_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_JIGSAW_NUM}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_SN_RULE_B" formId="013c4606017841b6b4e7f01e2a32d0a6"/></td>
						<td class="dec"><bu:ui colNo="CI_SN_RULE_B" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_SN_RULE_B}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_SN_RULE_S" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_SN_RULE_S" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_SN_RULE_S}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_PCB_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_PCB_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_PCB_FLAG}" formIndex="1"/></td>
					</tr>
				</table>
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
				<table class="basic-table" width="100%">
					<tr>
						<td class="name"><bu:uitn colNo="CI_FEEDER_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6"/></td>
						<td class="dec"><bu:ui colNo="CI_FEEDER_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_FEEDER_SIZE}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_PACK_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6"/></td>
						<td class="dec"><bu:ui colNo="CI_PACK_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_PACK_TYPE}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_FEED_ANGLE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_FEED_ANGLE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_FEED_ANGLE}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_PRINT_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_PRINT_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_PRINT_TIME}" formIndex="1" style="width: 200px;"/></td>
					</tr>
				</table>
			</DIV>
			<DIV id="content3" style="display:none" data-tab="tag3">
				<table class="basic-table" width="100%">
					<tr>
						<td class="name"><bu:uitn colNo="CI_STOCK_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_STOCK_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_STOCK_CYCLE}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_CYCLE_REMIND" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_CYCLE_REMIND" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_CYCLE_REMIND}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_IQC_FREE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_IQC_FREE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_IQC_FREE}" formIndex="1" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<bu:uitn colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" />
										<bu:ui colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_AUTO_FQC}" formIndex="1"/></td>
						<td class="name"><bu:uitn colNo="CI_FQC_QTY" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_FQC_QTY" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_FQC_QTY}" formIndex="1" disabled="disabled" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_SCRAP_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_SCRAP_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_SCRAP_FLAG}" formIndex="1" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<bu:uitn colNo="CI_TEST_FALG" formId="013c4606017841b6b4e7f01e2a32d0a6" />
										<bu:ui colNo="CI_TEST_FALG" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_TEST_FALG}" formIndex="1" /></td>
						<td class="name"><bu:uitn colNo="CI_REPAIR_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_REPAIR_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_REPAIR_MAX}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_TEST_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_TEST_MAX" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_TEST_MAX}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_TEST_MIN" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_TEST_MIN" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_TEST_MIN}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr><td class="name"><bu:uitn colNo="CI_TEST_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_TEST_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_TEST_UNIT}" formIndex="1" style="width: 200px;"/></td>
					</tr>
				</table>
			</DIV>
			<DIV id="content4" style="display:none" data-tab="tag4">
				<table class="basic-table" width="100%">
					<tr>
						<td class="name"><bu:uitn colNo="CI_MIN_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_MIN_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_MIN_STOCK}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_MAX_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_MAX_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_MAX_STOCK}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_STANDARD_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_STANDARD_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_STANDARD_WEIGHTS}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_FULL_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_FULL_WEIGHTS" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_FULL_WEIGHTS}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_MIN_PACK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_MIN_PACK" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_MIN_PACK}" formIndex="1" style="width: 200px;"/></td>
						<td class="name"><bu:uitn colNo="CI_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_UNIT}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_SIZE}" formIndex="1" style="width: 200px;"/></td>
					</tr>
				</table>
			</DIV>
			<DIV id="content5" style="display:none" data-tab="tag5">
				<table class="basic-table" width="100%">
					<tr>
						<td class="name"><bu:uitn colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_MSD_FLAG}" formIndex="1"/></td>
						<td class="name"><bu:uitn colNo="CI_MSD_ID" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_MSD_ID" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_MSD_ID}" formIndex="1" style="width: 200px;"/></td>
					</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CI_CUST_ITEM" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<td class="dec"><bu:ui colNo="CI_CUST_ITEM" formId="013c4606017841b6b4e7f01e2a32d0a6" value="%{CI_CUST_ITEM}" formIndex="1" style="width: 200px;"/></td>
					</tr>
				</table>
			</DIV>
			<bu:jsVal formId="013c4606017841b6b4e7f01e2a32d0a6" formIndex="1" />
			</form>
		</DIV>
		<div class="center">
			<s:include
				value="/plf/common/paginationAx.jsp?listDataFn=listAx&formId=formId1&showLoading=0" />
		</div>
	</DIV>
		</DIV>
		</DIV>
	<bu:submit viewId="5df194099e0249dcbf5cf316b2eb6de0" />
	<bu:script viewId="5df194099e0249dcbf5cf316b2eb6de0" />

<script type="text/javascript">
	function init(){
		$("#tag1").addClass("current");
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	//送检
	function autoFqc(){
		if (document.getElementById("paraMap1_CI_AUTO_FQC_1").checked) {
			$("#paraMap1_CI_FQC_QTY").attr("disabled",false);
		}else{
			$("#paraMap1_CI_FQC_QTY").attr("disabled",true);
			$("#paraMap1_CI_FQC_QTY").val("0");
		}
	};
</script>
		

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
