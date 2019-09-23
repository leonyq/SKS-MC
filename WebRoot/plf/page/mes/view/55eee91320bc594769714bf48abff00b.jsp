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
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
			    	        <button type="button" id="saveInfo" onclick="editVal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="99338dfb95df4eec8d5714a4e773b127" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="99338dfb95df4eec8d5714a4e773b127" />
	<input type="hidden" name="99338dfb95df4eec8d5714a4e773b127" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e038776ba4c444bdbb33c4d32b715380'" />
		<s:set name="_$formId_1" value="'99338dfb95df4eec8d5714a4e773b127'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name-four" /><bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec-self" colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec-self" colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" readonly="readonly" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec-self" colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec-self" colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec-self" colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name"><span>维护内容<span></span></span></td>
			<td class="dec" style="height:80px;" colspan="3"><textarea id="CDM_MT_CONTENT" name="CDM_MT_CONTENT" class="isSubmit " style="width: 166%;height: 100%;"></textarea></td>
		</tr>
	</table>
			<bu:jsVal formId="99338dfb95df4eec8d5714a4e773b127" formIndex="1" />		<div style="padding:1px;"></div>
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
<bu:script viewId="e038776ba4c444bdbb33c4d32b715380" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
		
		var trCount1 = 0;
	var trCount2 = 0;
	var trCount3 = 0;
	var trCount4 = 0;
	var url = "buss/bussModel_exeFunc.ms?FUNC_CODE=F3595&funcMId=a66c0c5a0b5c4c24be618f9b93c61838&formId=undefined";
		function init(){
		$("#paraMapObj_CD_USE_DEP_SHOW_BUTTON").hide();
		$("#paraMapObj_CD_CHARGE_MAN_SHOW_BUTTON").hide();
		var deviceType = $("#paraMapObj_CD_DEVICE_TYPE").val();
		var tempItemClass;
		$.ajax({
						url:url,
						type:"post",
						data:{"deviceType":deviceType},
						success:function(data){
							var itemList=data.ajaxList;
							if(itemList!=""){
								for(var i=0;i<itemList.length;i++){
									if(itemList[i].CDI_ITEM_MAXVALUE==null||itemList[i].CDI_ITEM_MAXVALUE=='undefined'){
										itemList[i].CDI_ITEM_MAXVALUE="";
									}
									if(itemList[i].CDI_ITEM_MINVALUE==null||itemList[i].CDI_ITEM_MINVALUE=='undefined'){
										itemList[i].CDI_ITEM_MINVALUE="";
									}
									if(itemList[i].CDI_ITEM_CYCLE==null||itemList[i].CDI_ITEM_CYCLE=='undefined'){
										itemList[i].CDI_ITEM_CYCLE="";
									}
									if(itemList[i].CDI_ITEM_CLASS==0){
										tempItemClass="范围值";
									}
									if(itemList[i].CDI_ITEM_CLASS==1){
										tempItemClass="固定值";
									}
									if(itemList[i].CDI_ITEM_CLASS==2){
										tempItemClass="状态值";
									}
									if(itemList[i].CDI_ITEM_TYPE=="设备参数"){
										trCount1++;
										var deviceItemCode1="deviceItemCode1_"+trCount1;
										var deviceItemName1="deviceItemName1_"+trCount1;
										var deviceItemClass1="deviceItemClass1_"+trCount1;
										var deviceitemMaxvalue1="deviceitemMaxvalue1_"+trCount1;
										var deviceitemMinvalue1="deviceitemMinvalue1_"+trCount1;
										var deviceItemUnit1_="deviceItemUnit1_"+trCount1;
										var divN="<div id='hidDiv_"+trCount1+"' style='display: none;'>"+
												"<input name='"+deviceItemCode1+"' type='hidden' id='"+deviceItemCode1+"' value='"+itemList[i].CDI_ITEM_CODE+"'>"+
												"<input name='"+deviceItemName1+"' type='hidden' id='"+deviceItemName1+"' value='"+itemList[i].CDI_ITEM_NAME+"'>"+
												"<input name='"+deviceItemClass1+"' type='hidden' id='"+deviceItemClass1+"' value='"+itemList[i].CDI_ITEM_CLASS+"'>"+
												"<input name='"+deviceitemMaxvalue1+"' type='hidden' id='"+deviceitemMaxvalue1+"' value='"+itemList[i].CDI_ITEM_MAXVALUE+"'>"+
												"<input name='"+deviceitemMinvalue1+"' type='hidden' id='"+deviceitemMinvalue1+"' value='"+itemList[i].CDI_ITEM_MINVALUE+"'>"+
												"<input name='"+deviceItemUnit1_+"' type='hidden' id='"+deviceItemUnit1_+"' value='"+itemList[i].CDI_ITEM_UNIT+"'>"+
												"<input name='deviceType' type='hidden' value='"+deviceType+"'>"+
												"</div>";
												
										$("#deviceItem_1 tbody:last").append(divN);
										$("#deviceItem_1 tbody:last").append("<tr id='tr1_"+trCount1+"' ></tr>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode1_"+trCount1+"'>"+itemList[i].CDI_ITEM_CODE+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName1_"+trCount1+"'>"+itemList[i].CDI_ITEM_NAME+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;' name='deviceItemClass1_"+trCount1+"'>"+tempItemClass+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;' name='deviceitemMaxvalue1_"+trCount1+"'>"+itemList[i].CDI_ITEM_MAXVALUE+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;' name='deviceitemMinvalue1_"+trCount1+"'>"+itemList[i].CDI_ITEM_MINVALUE+"</td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceItemReal1_"+trCount1+"' name='deviceItemReal1_"+trCount1+"' value=''/></td>");
										$("#deviceItem_1 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;' name='deviceItemUnit1_"+trCount1+"'>"+itemList[i].CDI_ITEM_UNIT+"</td>");
										
									}
									if(itemList[i].CDI_ITEM_TYPE=="保养项目"){
										trCount2++;
										var deviceItemCode2="deviceItemCode2_"+trCount2;
										var deviceItemName2="deviceItemName2_"+trCount2;
										var deviceItemClass2="deviceItemClass2_"+trCount2;
										var deviceitemMaxvalue2="deviceitemMaxvalue2_"+trCount2;
										var deviceitemMinvalue2="deviceitemMinvalue2_"+trCount2;
										var deviceItemUnit2_="deviceItemUnit2_"+trCount2;
										var deviceItemCycle2="deviceItemCycle2_"+trCount2;
										var divN="<div id='hidDiv_"+trCount2+"' style='display: none;'>"+
												"<input name='"+deviceItemCode2+"' type='hidden' id='"+deviceItemCode2+"' value='"+itemList[i].CDI_ITEM_CODE+"'>"+
												"<input name='"+deviceItemName2+"' type='hidden' id='"+deviceItemName2+"' value='"+itemList[i].CDI_ITEM_NAME+"'>"+
												"<input name='"+deviceItemClass2+"' type='hidden' id='"+deviceItemClass2+"' value='"+itemList[i].CDI_ITEM_CLASS+"'>"+
												"<input name='"+deviceitemMaxvalue2+"' type='hidden' id='"+deviceitemMaxvalue2+"' value='"+itemList[i].CDI_ITEM_MAXVALUE+"'>"+
												"<input name='"+deviceitemMinvalue2+"' type='hidden' id='"+deviceitemMinvalue2+"' value='"+itemList[i].CDI_ITEM_MINVALUE+"'>"+
												"<input name='"+deviceItemUnit2_+"' type='hidden' id='"+deviceItemUnit2_+"' value='"+itemList[i].CDI_ITEM_UNIT+"'>"+
												"<input name='"+deviceItemCycle2+"' type='hidden' id='"+deviceItemCycle2+"' value='"+itemList[i].CDI_ITEM_CYCLE+"'>"+
												"<input name='deviceType' type='hidden' value='"+deviceType+"'>"+
												"</div>";
												
										$("#deviceItem_2 tbody:last").append(divN);
										$("#deviceItem_2 tbody:last").append("<tr id='tr2_"+trCount2+"' ></tr>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode2_"+trCount2+"'>"+itemList[i].CDI_ITEM_CODE+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName2_"+trCount2+"'>"+itemList[i].CDI_ITEM_NAME+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;' name='deviceItemClass2_"+trCount2+"'>"+tempItemClass+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;' name='deviceitemMaxvalue2_"+trCount2+"'>"+itemList[i].CDI_ITEM_MAXVALUE+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;' name='deviceitemMinvalue2_"+trCount2+"'>"+itemList[i].CDI_ITEM_MINVALUE+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceItemReal2_"+trCount2+"' name='deviceItemReal2_"+trCount2+"' value=''/></td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align: center;' name='deviceItemUnit2_"+trCount2+"'>"+itemList[i].CDI_ITEM_UNIT+"</td>");
										$("#deviceItem_2 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;' name='deviceItemCycle2_"+trCount2+"'>"+itemList[i].CDI_ITEM_CYCLE+"</td>");
										
									}
									if(itemList[i].CDI_ITEM_TYPE=="点检项目"){
										trCount3++;
										var deviceItemCode3="deviceItemCode3_"+trCount3;
										var deviceItemName3="deviceItemName3_"+trCount3;
										var deviceItemClass3="deviceItemClass3_"+trCount3;
										var deviceitemMaxvalue3="deviceitemMaxvalue3_"+trCount3;
										var deviceitemMinvalue3="deviceitemMinvalue3_"+trCount3;
										var deviceItemUnit3_="deviceItemUnit3_"+trCount3;
										var divN="<div id='hidDiv_"+trCount3+"' style='display: none;'>"+
												"<input name='"+deviceItemCode3+"' type='hidden' id='"+deviceItemCode3+"' value='"+itemList[i].CDI_ITEM_CODE+"'>"+
												"<input name='"+deviceItemName3+"' type='hidden' id='"+deviceItemName3+"' value='"+itemList[i].CDI_ITEM_NAME+"'>"+
												"<input name='"+deviceItemClass3+"' type='hidden' id='"+deviceItemClass3+"' value='"+itemList[i].CDI_ITEM_CLASS+"'>"+
												"<input name='"+deviceitemMaxvalue3+"' type='hidden' id='"+deviceitemMaxvalue3+"' value='"+itemList[i].CDI_ITEM_MAXVALUE+"'>"+
												"<input name='"+deviceitemMinvalue3+"' type='hidden' id='"+deviceitemMinvalue3+"' value='"+itemList[i].CDI_ITEM_MINVALUE+"'>"+
												"<input name='"+deviceItemUnit3_+"' type='hidden' id='"+deviceItemUnit3_+"' value='"+itemList[i].CDI_ITEM_UNIT+"'>"+
												"<input name='deviceType' type='hidden' value='"+deviceType+"'>"+
												"</div>";
												
										$("#deviceItem_3 tbody:last").append(divN);
										$("#deviceItem_3 tbody:last").append("<tr id='tr3_"+trCount3+"' ></tr>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode3_"+trCount3+"'>"+itemList[i].CDI_ITEM_CODE+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName3_"+trCount3+"'>"+itemList[i].CDI_ITEM_NAME+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;' name='deviceItemClass3_"+trCount3+"'>"+tempItemClass+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;' name='deviceitemMaxvalue3_"+trCount3+"'>"+itemList[i].CDI_ITEM_MAXVALUE+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;' name='deviceitemMinvalue3_"+trCount3+"'>"+itemList[i].CDI_ITEM_MINVALUE+"</td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceItemReal3_"+trCount3+"' name='deviceItemReal3_"+trCount3+"' value=''/></td>");
										$("#deviceItem_3 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;' name='deviceItemUnit3_"+trCount3+"'>"+itemList[i].CDI_ITEM_UNIT+"</td>");
										
									}
									if(itemList[i].CDI_ITEM_TYPE=="校验项目"){
										trCount4++;
										var deviceItemCode4="deviceItemCode4_"+trCount4;
										var deviceItemName4="deviceItemName4_"+trCount4;
										var deviceItemClass4="deviceItemClass4_"+trCount4;
										var deviceitemMaxvalue4="deviceitemMaxvalue4_"+trCount4;
										var deviceitemMinvalue4="deviceitemMinvalue4_"+trCount4;
										var deviceItemUnit4_="deviceItemUnit4_"+trCount4;
										var deviceItemCycle4="deviceItemCycle4_"+trCount4;
										var divN="<div id='hidDiv_"+trCount4+"' style='display: none;'>"+
												"<input name='"+deviceItemCode4+"' type='hidden' id='"+deviceItemCode4+"' value='"+itemList[i].CDI_ITEM_CODE+"'>"+
												"<input name='"+deviceItemName4+"' type='hidden' id='"+deviceItemName4+"' value='"+itemList[i].CDI_ITEM_NAME+"'>"+
												"<input name='"+deviceItemClass4+"' type='hidden' id='"+deviceItemClass4+"' value='"+itemList[i].CDI_ITEM_CLASS+"'>"+
												"<input name='"+deviceitemMaxvalue4+"' type='hidden' id='"+deviceitemMaxvalue4+"' value='"+itemList[i].CDI_ITEM_MAXVALUE+"'>"+
												"<input name='"+deviceitemMinvalue4+"' type='hidden' id='"+deviceitemMinvalue4+"' value='"+itemList[i].CDI_ITEM_MINVALUE+"'>"+
												"<input name='"+deviceItemUnit4_+"' type='hidden' id='"+deviceItemUnit4_+"' value='"+itemList[i].CDI_ITEM_UNIT+"'>"+
												"<input name='"+deviceItemCycle4+"' type='hidden' id='"+deviceItemCycle4+"' value='"+itemList[i].CDI_ITEM_CYCLE+"'>"+
												"<input name='deviceType' type='hidden' value='"+deviceType+"'>"+
												"</div>";
										
										$("#deviceItem_4 tbody:last").append(divN);
										$("#deviceItem_4 tbody:last").append("<tr id='tr4_"+trCount4+"' ></tr>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode4_"+trCount4+"'>"+itemList[i].CDI_ITEM_CODE+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName4_"+trCount4+"'>"+itemList[i].CDI_ITEM_NAME+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;' name='deviceItemClass4_"+trCount4+"'>"+tempItemClass+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;' name='deviceitemMaxvalue4_"+trCount4+"'>"+itemList[i].CDI_ITEM_MAXVALUE+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: center;' name='deviceitemMinvalue4_"+trCount4+"'>"+itemList[i].CDI_ITEM_MINVALUE+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'><input type='text' id='deviceItemReal4_"+trCount4+"' name='deviceItemReal4_"+trCount4+"' value=''/></td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align: center;' name='deviceItemUnit4_"+trCount4+"'>"+itemList[i].CDI_ITEM_UNIT+"</td>");
										$("#deviceItem_4 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;' name='deviceItemCycle4_"+trCount4+"'>"+itemList[i].CDI_ITEM_CYCLE+"</td>");
										
									}
								}
								
							$('#saveInfo').attr("onclick","editVal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')");
							}
							
							
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
		$('#saveInfo').attr("onclick","editVal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')");
		
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
		}

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
