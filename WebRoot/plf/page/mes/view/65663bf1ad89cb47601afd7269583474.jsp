<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title>${title}</title>

<style>
	
</style>

<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
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
	var loaded = 1;
	var tab_len = 2;

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
		switchTag('tag2', 'content2', '');
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
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="saveObj(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>

				<div class="js-tab">
					<DIV id="container" style="padding:0 20px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								<LI id="tag1"><A class="selectli1"
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="工单信息2" /></SPAN>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="工单BOM" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
					<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame" style="margin-top: 20px;">
						
						<DIV class="content1" id="content">
							<DIV id="content1">
								
									<input type="hidden" name="exeid" value="${exeid}"> 
									  <input type="hidden" name="iframeId" value="${iframeId}">
									 <input type="hidden" name="definedMsg" value="${definedMsg}">
									<s:hidden
										name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}"
										value="%{FUNC_CODE_2}" />
									<s:token />
									<table class="func_table">
										<tr>
											<td width="100%" align="right"></td>
										</tr>
									</table>
									<bu:set name="paraMapObj" value="${dataId}"
										formId="d34c8f48bead40d88c24a153c731de82" type="add" />
									<table class="basic-table">
										<input type="hidden" name="formIds"
											value="d34c8f48bead40d88c24a153c731de82" />
										<input type="hidden" name="d34c8f48bead40d88c24a153c731de82"
											value="paraMap0@" />
										<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
										<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
										<s:set name="_$viewId"
											value="'a3f3c9d67b644b8d82e09b543ed22218'" />
										<s:set name="_$formId_1"
											value="'d34c8f48bead40d88c24a153c731de82'" />
										<s:set name="_$type" value="'add'" />
										<tr>
											<td class="name" style="width:89px;"/>
											<span class="dot">*</span><bu:uitn colNo="PROJECT_ID"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_ID"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_ID"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PROJECT_ID}" formIndex="0" />
											</bu:td>
											<td class="name" style="width:89px;"/>
											<bu:uitn colNo="PRODUCT_LINE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_LINE" style="width:230px;"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_LINE"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PRODUCT_LINE}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="CUST_CODE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="CUST_CODE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="CUST_CODE"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{CUST_CODE}" formIndex="0" />
											</bu:td>
											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_MATERIAL"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_MATERIAL"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_MATERIAL"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PRODUCT_MATERIAL}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="PRODUCT_NAME"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_NAME"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_NAME"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PRODUCT_NAME}" formIndex="0" />
											</bu:td>
											<td class="name" />
											<bu:uitn colNo="PRODUCT_STANDARD"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_STANDARD"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_STANDARD"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PRODUCT_STANDARD}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="PROJECT_TYPE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_TYPE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_TYPE"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PROJECT_TYPE}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<bu:uitn colNo="PROJECT_STATUS"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_STATUS"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_STATUS"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PROJECT_STATUS}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="PROJECT_STEP"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_STEP"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_STEP"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PROJECT_STEP}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_COUNT"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_COUNT"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_COUNT"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PRODUCT_COUNT}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PROLEPSIS_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROLEPSIS_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROLEPSIS_START_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PROLEPSIS_START_DATE}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PROLEPSIS_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROLEPSIS_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROLEPSIS_END_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PROLEPSIS_END_DATE}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="ACTUAL_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="ACTUAL_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="ACTUAL_START_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{ACTUAL_START_DATE}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<bu:uitn colNo="ACTUAL_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="ACTUAL_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="ACTUAL_END_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{ACTUAL_END_DATE}" formIndex="0" />
											</bu:td>
										</tr>

										<tr>
											<td class="name" />
											<bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="TPPB_PLAN_DELIVERY_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="TPPB_PLAN_DELIVERY_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{TPPB_PLAN_DELIVERY_DATE}" formIndex="0" />
											</bu:td>
											<td class="name" />
											<bu:uitn colNo="DESTROY_NO"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="DESTROY_NO"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="DESTROY_NO"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{DESTROY_NO}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="PM_MEMO"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" style="height:80px;" colNo="PM_MEMO"
												formId="d34c8f48bead40d88c24a153c731de82" colspan="3">
												<bu:ui colNo="PM_MEMO"
													formId="d34c8f48bead40d88c24a153c731de82"
													value="%{PM_MEMO}" formIndex="0" style="width:100%;height:100%"/>
											</bu:td>
										</tr>
									</table>
									<bu:jsVal formId="d34c8f48bead40d88c24a153c731de82"
										formIndex="0" />
										
								
							</DIV>
							<DIV id="content2">  <%-- <bu:addcp exeid="%{exeid}" />   --%>
									
										<!-- <iframe id="iframe2" name="iframe2" frameBorder="0"
												src='' width="100%" scrolling="auto" height="400"
												onload="dynIframesize('iframe2');"></iframe> -->
											
									<div class="mod">
<div class="mod-hd">

<div class="more">
<a href="javascript:addRow('fbe85506ea9d4a32b0cf78996898c620','1');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
</div>
</div>
<div class="mod-bd">	<textarea id="_addTableTr_fbe85506ea9d4a32b0cf78996898c620" style="width:0px;height:0px;display:none;" disabled="disabled">		&lt;tr id="addTableTr0_fbe85506ea9d4a32b0cf78996898c620" &gt; 			&lt;td style="position:relative;padding-left:5px;padding-top:5px;" class="dec"&gt;				&lt;input type="text"  id="paraMap0_CBD_SEQUENCE" name="paraMap1@0#CBD_SEQUENCE" class=" input isSubmit " /&gt;
&lt;/td&gt;			&lt;td style="position:relative;padding-left:5px;padding-top:5px;" class="dec"&gt;				&lt;input type="hidden"  id="paraMap0_CBD_ITEM_CODE" name="paraMap1@0#CBD_ITEM_CODE" class=" input isSubmit  _VAL_OjbsData" /&gt;
				&lt;input editName="paraMap1@0#CBD_ITEM_CODE" type="text"  id="paraMap0_CBD_ITEM_CODE_SHOW" class="input  input isSubmit  _VAL_OjbsData" ondblclick="_showSelFkSql(this,'add%2Cfbe85506ea9d4a32b0cf78996898c620%2C7f472ed8d17041318305d00abb192b0c','料号','','%7B%22WP_WIDTH%22%3A%22600%22%2C%22WP_HEIGHT%22%3A%22600%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','737d2bcd-ad66-4019-96d0-076c9e8b2dee');"  readonly="readonly"   /&gt;&lt;button type="button" class="ico ico-search" onclick="_showSelFkSql_img(this,'paraMap1@0#CBD_ITEM_CODE');" title="点击选择 料号" &gt;&lt;/button&gt;
&lt;/nobr&gt;&lt;/div&gt;

&lt;script type="text/javascript"&gt;
function cbFun(key,val,obj){
	_thisSelObj.value = val;
	var editName=$(_thisSelObj).attr("editName");
	$("input[name='"+editName+"']").val(key);
	//var editObj = "input[type='hidden'][name='"+$(_thisSelObj).attr("editName")+"']";
	if(null!=obj){
		var indx = editName.indexOf("#");
		var CB_ITEM_NAME = editName.substring(0,indx)+"#"+"CBD_ITEM_NAME";
		$("input[name='"+CB_ITEM_NAME+"']").val(obj.eq(4).text());
		var CB_ITEM_SPEC = editName.substring(0,indx)+"#"+"CBD_ITEM_SPEC";
		$("input[name='"+CB_ITEM_SPEC+"']").val(obj.eq(5).text());
		var CB_ITEM_TYPE = editName.substring(0,indx)+"#"+"CBD_ITEM_TYPE";
		var str='';
		if(obj.eq(6).text()==1){
			str='PCB';
		}else{
			str=<dict:lang value="物料" />;
		}
		$("input[name='"+CB_ITEM_TYPE+"']").val(str);
	}
	_thisSelObj.focus();
}

&lt;/script&gt;
&lt;/td&gt;			&lt;td style="position:relative;padding-left:5px;padding-top:5px;" class="dec"&gt;				&lt;input type="text"  id="paraMap0_CBD_ITEM_NAME" name="paraMap1@0#CBD_ITEM_NAME" class=" input isSubmit  readonly"  disabled="disabled"  disabled="disabled"  /&gt;
&lt;/td&gt;			&lt;td style="position:relative;padding-left:5px;padding-top:5px;" class="dec"&gt;				&lt;input type="text"  id="paraMap0_CBD_ITEM_SPEC" name="paraMap1@0#CBD_ITEM_SPEC" class=" input isSubmit  readonly"  disabled="disabled"  disabled="disabled"  /&gt;
&lt;/td&gt;			&lt;td style="position:relative;padding-left:5px;padding-top:5px;" class="dec"&gt;				&lt;input type="text"  id="paraMap0_CBD_UNITS" name="paraMap1@0#CBD_UNITS" class=" input isSubmit " /&gt;
&lt;/td&gt;			&lt;td style="position:relative;padding-left:5px;padding-top:5px;" class="dec"&gt;				&lt;input type="text"  id="paraMap0_CBD_POINT" name="paraMap1@0#CBD_POINT" class=" input isSubmit " /&gt;
&lt;/td&gt;			&lt;td style="position:relative;padding-left:5px;padding-top:5px;" class="dec"&gt;				&lt;input type="text"  id="paraMap0_CBD_ITEM_NUM" name="paraMap1@0#CBD_ITEM_NUM" class=" input isSubmit " /&gt;
&lt;/td&gt;			&lt;td style="position:relative;padding-left:5px;padding-top:5px;" class="dec"&gt;				&lt;select  id="paraMap0_CBD_ITEM_TYPE" name="paraMap1@0#CBD_ITEM_TYPE" class=" input isSubmit  _VAL_OjbsData dept_select" &gt;&lt;option value=""&gt;--请选择--&lt;/option&gt;&lt;option value="0" &gt;?物料&lt;/option&gt;
&lt;option value="1" &gt;?PCB&lt;/option&gt;
&lt;/select&gt;
&lt;/td&gt;			&lt;td&gt;&lt;a href="javascript:void(0);" onclick="delRow(this);" title="?移除行"&gt;&lt;img src="/mes/plf/style/css1/images/m_rm.gif" /&gt;&lt;/a&gt;&lt;/td&gt;		&lt;/tr&gt;		</textarea>
<table id="addTable_fbe85506ea9d4a32b0cf78996898c620" width="100%" class="glxb-table table-line">
	<input type="hidden" name="formIds" value="fbe85506ea9d4a32b0cf78996898c620">
	<input type="hidden" name="fbe85506ea9d4a32b0cf78996898c620" value="paraMap1@">
	<input type="hidden" name="paraMap1@__LEVEL__" value="1">
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1">
		<thead>
		<tr>
			<th class="tr1 " style="text-align:center;"><dict:lang value="阶别" /></th>
			<th class="tr1 " style="text-align:center;"><dict:lang value="料号" /></th>
			<th class="tr1 " style="text-align:center;"><dict:lang value="料号名称" /></th>
			<th class="tr1 " style="text-align:center;"><dict:lang value="料号规格" /></th>
			<th class="tr1 " style="text-align:center;"><dict:lang value="单位" /></th>
			<th class="tr1 " style="text-align:center;"><dict:lang value="点位" /></th>
			<th class="tr1 " style="text-align:center;"><dict:lang value="子件物料用量" /></th>
			<th class="tr1 " style="text-align:center;"><dict:lang value="物料类型" /></th>
			<th style="text-align:center;"><dict:lang value="操作" /></th>
		</tr>
		</thead>
		<tbody>
		<input type="hidden" id="addTable_FORM_COL_ID_Dfbe85506ea9d4a32b0cf78996898c620" value="97c27cbea7204ba08029f339a015bd8a"> 		

		</tbody>
	</table>
</div>
</div>	
									
							</DIV>

						</DIV>
						</form>
					</DIV>
					<%-- <bu:submit viewId="81c065ad475149b7b0c654189d089b71" />
					<bu:script viewId="81c065ad475149b7b0c654189d089b71" /> --%>
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
		function addRowBom(tableId,formIndex){
			//util.showLoading();
			var url ="${path}buss/bussModel_ajaxAddSubComm.ms?FUNC_CODE=F285";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				//curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    async:false,
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq},
				success: function(data){
					util.closeLoading();
					var row = $(data.ajaxString);
					if(row_count % 2 != 0){
						row.addClass("tr1");//<%-- 隔行着色 --%>
					}
					_toClickColor(row);//<%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq++;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						//utilsFp.alert("error:"+errorThrown);
						//utilsFp.alert("error:"+errorThrown);
						utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
					}
			   }
			});
		}
		
	function getOrderBom(key){
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: getBomUrl+"&dataId="+key,
 			success: function(data){
 				var pList=data.ajaxList;
 				//alert(utilsFp.jsonToString(pList));
 				
 				for(var i=0;i<pList.length;i++){
 				    if(i==0){
 				     	$("#addTable_fbe85506ea9d4a32b0cf78996898c620 tbody tr").html('');
 				        curRowSeq=1;			    
 				    }
 				 	addRowBom('fbe85506ea9d4a32b0cf78996898c620','1');
 				    var j=i+1;
 				    var pre="#paraMap"+j+"_";
 				    $(pre+"CBD_SEQUENCE").val(pList[i].CBD_ITEM_SECTION);
 				    $(pre+"CBD_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
 				    $(pre+"CBD_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
 				    $(pre+"CBD_ITEM_NAME").val(pList[i].CI_ITEM_NAME);
 				    $(pre+"CBD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
 				    $(pre+"CBD_UNITS").val(pList[i].CBD_UNITS);
 				    $(pre+"CBD_POINT").val(pList[i].CBD_POINT);
 				    $(pre+"CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
 				    $(pre+"CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE);
 				}
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					//utilsFp.alert("error:"+errorThrown);
						utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
 				}
 		   }
 		});
	}
</script>
<bu:script viewId="a3f3c9d67b644b8d82e09b543ed22218" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	

</body>


<%@ include file="/plf/common/pub_end.jsp"%>
