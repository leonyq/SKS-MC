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
	
	<style type="text/css">
		
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
	var tab_len = 4;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		document.getElementById("content3").style.display="";
		document.getElementById("content4").style.display="";
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
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}
	
	$(function() {
		$("#tag1").addClass("current");
	});
</script>
</head>
<body>
	<div class="edit">
            
			<div class="bd" id="Mybd" style="height:500px;">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="4b6c04e8e1384717a4be814862e502a1" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4b6c04e8e1384717a4be814862e502a1" />
	<input type="hidden" name="4b6c04e8e1384717a4be814862e502a1" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'98ba87947f18465283c249d1afd2ca3f'" />
		<s:set name="_$formId_1" value="'4b6c04e8e1384717a4be814862e502a1'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-four" /><bu:uitn colNo="B#CD_DEVICE_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="B#CD_DEVICE_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="B#CD_DEVICE_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="B#CD_DEVICE_NAME" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="B#CD_DEVICE_NAME" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="B#CD_DEVICE_NAME" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="B#CD_DEVICE_SN" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="B#CD_DEVICE_SN" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="B#CD_DEVICE_SN" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="B#CD_DEVICE_CLASS" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="B#CD_DEVICE_CLASS" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="B#CD_DEVICE_CLASS" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CDM_MT_EMP" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_MT_EMP" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_MT_EMP" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CDM_MT_TIME" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_MT_TIME" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_MT_TIME" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CDM_MT_CONTENT" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" style="height:80px;" colspan="4" colNo="CDM_MT_CONTENT" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_MT_CONTENT" style="width: 100%;height: 100%;" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tbody style="display:none;">
		<tr>
			<td class="name-four" /><bu:uitn colNo="CDM_ITEM_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_ITEM_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_ITEM_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CDM_ITEM_NAME" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_ITEM_NAME" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_ITEM_NAME" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CDM_ITEM_CLASS" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_ITEM_CLASS" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_ITEM_CLASS" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CDM_ITEM_MAXVALUE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_ITEM_MAXVALUE" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_ITEM_MAXVALUE" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CDM_ITEM_CODE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_ITEM_CODE" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_ITEM_CODE" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CDM_ITEM_MINVALUE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_ITEM_MINVALUE" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_ITEM_MINVALUE" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CDM_ITEM_REAL" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_ITEM_REAL" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_ITEM_REAL" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CDM_ITEM_UNIT" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_ITEM_UNIT" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_ITEM_UNIT" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
			<td class="name-four" /><bu:uitn colNo="CDM_DEVICE_SN" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_DEVICE_SN" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_DEVICE_SN" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CDM_DEVICE_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_DEVICE_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_DEVICE_TYPE" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CDM_CYCLE" formId="4b6c04e8e1384717a4be814862e502a1" /></td>
			<bu:td cssClass="dec-self" colNo="CDM_CYCLE" formId="4b6c04e8e1384717a4be814862e502a1" ><bu:ui colNo="CDM_CYCLE" formId="4b6c04e8e1384717a4be814862e502a1" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			</tr>
		</tbody>
	</table>
			<bu:jsVal formId="4b6c04e8e1384717a4be814862e502a1" formIndex="1" />
			<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								<LI id="tag1"><A class="selectli1"
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="设备参数" /></SPAN>
									<input type="hidden" name="type1" value="设备参数"/>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="保养项目" /></SPAN> </A>
									<input type="hidden" name="type2" value="保养项目"/>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="点检项目" /></SPAN> </A>
									<input type="hidden" name="type3" value="点检项目"/>
								</LI>
								<LI id="tag4"><A class=""
									onclick="switchTag('tag4','content4','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="校验项目" /></SPAN> </A>
									<input type="hidden" name="type4" value="校验项目"/>
								</LI>

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<div class="mod" >
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" style="max-width:100%">
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable  " id="deviceItem1_1">
									<tbody>
									<tr class="thcolor">
							
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></thd >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="实际值" /></td >
										<td class="datagrid-cell"><dict:lang value="单位" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:120px;max-width:100%">
							<table class="glxb-table fixedTable" style="width:100%"  id="deviceItem_1" >
								<tbody id="addDeviceItem_1" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
			<div class="mod" >
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable  " id="deviceItem1_2">
									<tbody>
									<tr class="thcolor">
										
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></thd >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="实际值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="单位" /></td >
										<td class="datagrid-cell"><dict:lang value="周期（天）" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:120px">
							<table class="glxb-table fixedTable" style="width:100%"  id="deviceItem_2" >
								<tbody id="addDeviceItem_2" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
		 				</DIV>
		 				<DIV id="content3" style="display:none" data-tab="tag3">
						<div class="mod" >
			
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" style="max-width:100%">
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable  " id="deviceItem1_3">
									<tbody>
									<tr class="thcolor">
										
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></thd >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="实际值" /></td >
										<td class="datagrid-cell"><dict:lang value="单位" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:120px;max-width:100%">
							<table class="glxb-table fixedTable" style="width:100%"  id="deviceItem_3" >
								<tbody id="addDeviceItem_3" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
						</DIV>
						<DIV id="content4" style="display:none" data-tab="tag4">
						<div class="mod" >
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header">
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable  " id="deviceItem1_4">
									<tbody>
									<tr class="thcolor">
										
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></thd >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="实际值" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="单位" /></td >
										<td class="datagrid-cell"><dict:lang value="周期（天）" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:120px;">
							<table class="glxb-table fixedTable" style="width:100%"  id="deviceItem_4" >
								<tbody id="addDeviceItem_4" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
						</DIV>

						</DIV>

			
									</form>
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
		var isQuery = false;
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		function init(){
				var tempItemClass;
				var CDM_ITEM_CLASS = $("#paraMapObj_CDM_ITEM_CLASS").val();
				var CDM_ITEM_TYPE = $("#paraMapObj_CDM_ITEM_TYPE").val();
				var CDM_ITEM_CODE = $("#paraMapObj_CDM_ITEM_CODE").val();
				var CDM_ITEM_NAME = $("#paraMapObj_CDM_ITEM_NAME").val();
				var CDM_ITEM_MAXVALUE = $("#paraMapObj_CDM_ITEM_MAXVALUE").val();
				var CDM_ITEM_MINVALUE = $("#paraMapObj_CDM_ITEM_MINVALUE").val();
				var CDM_ITEM_REAL = $("#paraMapObj_CDM_ITEM_REAL").val();
				var CDM_ITEM_UNIT = $("#paraMapObj_CDM_ITEM_UNIT").val();
				var CDM_CYCLE = $("#paraMapObj_CDM_CYCLE").val();
									if(CDM_ITEM_CLASS==0){
										tempItemClass="范围值";
									}
									if(CDM_ITEM_CLASS==1){
										tempItemClass="固定值";
									}
									if(CDM_ITEM_CLASS==2){
										tempItemClass="状态值";
									}
									
									if(CDM_ITEM_CODE=='null'||CDM_ITEM_CODE==null){
										CDM_ITEM_CODE="";
									}
									if(CDM_ITEM_NAME=='null'||CDM_ITEM_NAME==null){
										CDM_ITEM_NAME="";
									}
									if(CDM_ITEM_UNIT=='null'||CDM_ITEM_UNIT==null){
									
										CDM_ITEM_UNIT="";
									}
									
									if(CDM_ITEM_TYPE=="设备参数"){
										
										$("#deviceItem_1 tbody:last").append("<tr id='tr1' ></tr>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode1'>"+CDM_ITEM_CODE+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName1'>"+CDM_ITEM_NAME+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;' name='deviceItemClass1'>"+tempItemClass+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;' name='deviceitemMaxvalue1'>"+CDM_ITEM_MAXVALUE+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;' name='deviceitemMinvalue1'>"+CDM_ITEM_MINVALUE+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceItemReal1' name='deviceItemReal1' disabled='disabled' value='"+CDM_ITEM_REAL+"'/></td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;' name='deviceItemUnit1'>"+CDM_ITEM_UNIT+"</td>");
										
									}
									if(CDM_ITEM_TYPE=="保养项目"){
										
										$("#deviceItem_2 tbody:last").append("<tr id='tr2' ></tr>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode2'>"+CDM_ITEM_CODE+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName2'>"+CDM_ITEM_NAME+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;' name='deviceItemClass2'>"+tempItemClass+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;' name='deviceitemMaxvalue2'>"+CDM_ITEM_MAXVALUE+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;' name='deviceitemMinvalue2'>"+CDM_ITEM_MINVALUE+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceItemReal2' name='deviceItemReal2' disabled='disabled' value='"+CDM_ITEM_REAL+"'/></td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align: center;' name='deviceItemUnit2'>"+CDM_ITEM_UNIT+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;' name='deviceItemCycle2'>"+CDM_CYCLE+"</td>");
										
									}
									if(CDM_ITEM_TYPE=="点检项目"){
										
										$("#deviceItem_3 tbody:last").append("<tr id='tr3' ></tr>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode3'>"+CDM_ITEM_CODE+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName3'>"+CDM_ITEM_NAME+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;' name='deviceItemClass3'>"+tempItemClass+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;' name='deviceitemMaxvalue3'>"+CDM_ITEM_MAXVALUE+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;' name='deviceitemMinvalue3'>"+CDM_ITEM_MINVALUE+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceItemReal3' name='deviceItemReal3' disabled='disabled' value='"+CDM_ITEM_REAL+"'/></td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;' name='deviceItemUnit3'>"+CDM_ITEM_UNIT+"</td>");
										
									}
									if(CDM_ITEM_TYPE=="校验项目"){
										
										$("#deviceItem_4 tbody:last").append("<tr id='tr4' ></tr>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode4'>"+CDM_ITEM_CODE+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName4'>"+CDM_ITEM_NAME+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;' name='deviceItemClass4'>"+tempItemClass+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;' name='deviceitemMaxvalue4'>"+CDM_ITEM_MAXVALUE+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;' name='deviceitemMinvalue4'>"+CDM_ITEM_MINVALUE+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceItemReal4' name='deviceItemReal4' disabled='disabled' value='"+CDM_ITEM_REAL+"'/></td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align: center;' name='deviceItemUnit4'>"+CDM_ITEM_UNIT+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;' name='deviceItemCycle4'>"+CDM_CYCLE+"</td>");
										
									}
		
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			
		}
		
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
