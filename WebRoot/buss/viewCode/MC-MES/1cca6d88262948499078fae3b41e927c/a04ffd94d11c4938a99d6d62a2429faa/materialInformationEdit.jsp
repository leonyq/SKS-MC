<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
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
	var loaded1 = 1;
		var loaded2 = 1;
		var loaded3 = 1;
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
			if(tag=="tag2"&&loaded==1){
    		    setChosen();//设置下拉框样式
    		    loaded++;
		    }
		    if(tag=="tag3"&&loaded1==1){
    		    setChosen();//设置下拉框样式
    		    loaded1++;
		    }
		    if(tag=="tag4"&&loaded2==1){
    		    setChosen();//设置下拉框样式
    		    loaded2++;
		    }
		    if(tag=="tag5"&&loaded3==1){
    		    setChosen();//设置下拉框样式
    		    loaded3++;
		    }
		}
	</script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 	
</head>
<body>
	<div class="edit">
	    <form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
<jsp:param name="modelName" value="VIEW_TYPE_11" />
   <jsp:param name="location" value="editForm" />
		</jsp:include>

            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>

			    	<div class="optn">
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i>取消</button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:600px;">
					

								<input type="hidden" name="formId" value="013c4606017841b6b4e7f01e2a32d0a6">
								<input type="hidden" name="iframeId" value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
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
	<table class="basic-table">
	<input type="hidden" name="formIds" value="013c4606017841b6b4e7f01e2a32d0a6" />
	<input type="hidden" name="013c4606017841b6b4e7f01e2a32d0a6" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'079bbdbcdec8491a83eab63ae4c67bd0'" />
		<s:set name="_$formId_1" value="'013c4606017841b6b4e7f01e2a32d0a6'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:52px"><span class="dot">*</span><bu:uitn colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" style="width:52px"><bu:uitn colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" style="width:52px"><bu:uitn colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width:180px" colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		</tr>
		<tr>
			<td class="name"><span class="dot">*</span><bu:uitn colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width: 180px;" colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
			<td class="name"><bu:uitn colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width: 180px;" colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
			<td class="name"><bu:uitn colNo="CI_ITEM_SOURCE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width: 180px;" colNo="CI_ITEM_SOURCE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_SOURCE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
		</tr>
		<tr>
			<td class="name" style="width: 82px;"><bu:uitn colNo="CI_SN_RULE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<bu:td cssClass="dec" style="width: 180px;" colNo="CI_SN_RULE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_SN_RULE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"  style="width:200px"/></bu:td>
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
		<DIV >
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
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_LINK_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_LINK_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_LINK_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_JIGSAW_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_JIGSAW_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_JIGSAW_NUM" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
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
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_FEEDER_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;"  colNo="CI_FEEDER_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_FEEDER_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_PACK_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_PACK_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_PACK_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
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
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_STOCK_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_STOCK_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_STOCK_CYCLE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_CYCLE_REMIND" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_CYCLE_REMIND" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_CYCLE_REMIND" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
					<!--	<td class="name" /><bu:uitn colNo="CI_IQC_FREE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_IQC_FREE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<bu:uitn colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" />
							<bu:ui colNo="CI_AUTO_FQC" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" /></bu:td>-->
							
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
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_MIN_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_MIN_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MIN_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_MAX_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_MAX_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MAX_STOCK" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
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
						<td class="name" /><bu:uitn colNo="CI_EXCESS_RECEIVE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_EXCESS_RECEIVE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_EXCESS_RECEIVE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<bu:uitn colNo="CI_EXCESS_PICK" formId="013c4606017841b6b4e7f01e2a32d0a6" />
							<bu:ui colNo="CI_EXCESS_PICK" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" /></bu:td>
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
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1"/></bu:td>
						-->
						
						<td class="name" /><bu:uitn colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MSD_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" />
    					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    					<bu:uitn colNo="CI_ROHS_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" />
    					<bu:ui colNo="CI_ROHS_FLAG" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" /></bu:td>
						
						
						<td class="name" style="width:15%;"/><bu:uitn colNo="CI_MSD_ID" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" style="width:35%;" colNo="CI_MSD_ID" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_MSD_ID" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
					</tr>
					<tr>
						<td class="name" /><bu:uitn colNo="CI_CUST_ITEM" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_CUST_ITEM" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_CUST_ITEM" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
						<td class="name" /><bu:uitn colNo="CI_ITEM_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
						<bu:td cssClass="dec" colNo="CI_ITEM_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" ><bu:ui colNo="CI_ITEM_SIZE" formId="013c4606017841b6b4e7f01e2a32d0a6" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
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
    
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<script type="text/javascript">
	    
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;	
				 $("#deptLs_data_auth").attr("disabled","disabled");
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
			emptyValToHide('N');
			$("#deptLs_data_auth").removeAttr("disabled");
			document.forms.editForm.submit();
			isQuery = true;
		}
		

		//送检
	function autoFqc(){
		if (document.getElementById("paraMap1_CI_AUTO_FQC_1").checked) {
			$("#paraMap1_CI_FQC_QTY").attr("disabled",false);
		}else{
			$("#paraMap1_CI_FQC_QTY").attr("disabled",true);
			$("#paraMap1_CI_FQC_QTY").val("0");
		}
	};
		
			function autoFqc(){
				if (document.getElementById("paraMapObj_CI_AUTO_FQC_1").checked) {
					$("#paraMapObj_CI_FQC_QTY").attr("disabled",false);
				}else{
					$("#paraMapObj_CI_FQC_QTY").attr("disabled",true);
				}
			};

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$(".dept_select").trigger("chosen:updated");
		}
				
		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function init(){
		console.log("${mcIsOpenAuth}");
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
