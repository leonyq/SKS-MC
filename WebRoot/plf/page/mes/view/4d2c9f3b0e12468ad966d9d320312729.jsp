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
	
		$(function(){
			$('.dialog-bd',parent.document).css('background-color','#fff')
		})
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
		
		var tab_len = 2;
		var currentTag;
		var tabs = "";
		function switchTag(tag, content,url) {
		
				if(currentTag == tag){
					return false;
				}
				document.getElementById("content2").style.display="";
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
			}
	</script>
</head>
<body style="background-color: #fff;">
	<div class="edit">
	<div class="bd" style="border:0">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="881411561f8f4940ac22575c4b8f02ef">
								<input type="hidden" name="dataId" value="${dataId}">
									
	<bu:set name="paraMapObj" value="${dataId}" formId="881411561f8f4940ac22575c4b8f02ef" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="881411561f8f4940ac22575c4b8f02ef" />
	<input type="hidden" name="881411561f8f4940ac22575c4b8f02ef" value="paraMap2@" />
	<input type="hidden" name="paraMap2@__LEVEL__" value="2" />
	<input type="hidden" name="paraMap2@__DATA_COUNT__" value="2" />
		<s:set name="_$viewId" value="'1bd1af247a9348aea22a29b250206ac0'" />
		<s:set name="_$formId_1" value="'881411561f8f4940ac22575c4b8f02ef'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" /><span class="dot"></span><bu:uitn colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot"></span><bu:uitn colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot"></span><bu:uitn colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></td>
		</tr>
	</table>
	<div class="js-tab">
	<DIV id="container">
		<DIV class="hd">
			<UL class="tab-list tab">
				<LI id="tag1" class="current"><A class="selectli1"
					onclick="switchTag('tag1','content1','','');this.blur();"
					href="javascript:void(0);"> <SPAN class="selectspan1">BOM明细</SPAN>
				</A></LI>
				<LI id="tag2"><A class=""
					onclick="switchTag('tag2','content2','','');this.blur();"
					href="javascript:void(0);"> <SPAN>替代料</SPAN> </A></LI>
			</UL>
		</DIV>
		<DIV class="content1" id="content">
			
				<DIV id="content1" style="margin-top:4px;margin-left:4px;margin-right:4px;">
				
	<div style="padding:1px;" ></div>
<table  width="100%" class="glxb-table table-line" >
		<thead>
		<tr>
			<th style="width:120px;" align="center">料号</th>
			<th style="width:120px;">料号名称</th>
			<th style="width:120px;">料号规格</th>
			<th style="width:120px;">单位</th>
			<th style="width:120px;">点位</th>
			<th style="width:120px;">用量</th>
			<th style="width:120px;">物料阶别</th>
			<th style="width:120px;">物料类型</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${dataList}">
		<tr>
		   	<td style="width:120px;">${item.CBD_ITEM_CODE}</td>
			<td style="width:120px;">${item.CBD_ITEM_NAME}</td>
			<td style="width:120px;">${item.CBD_ITEM_SPEC}</td>
			<td style="width:120px;">${item.CBD_UNITS}</td>
			<td style="width:120px;">${item.CBD_POINT}</td>
			<td style="width:120px;">${item.CBD_ITEM_NUM}</td>
			<td style="width:120px;">${item.CBD_ITEM_SECTION}</td>
			<td style="width:120px;">
			<c:choose>
			 <c:when test="${item.CBD_ITEM_TYPE==1}">PCB</c:when>
			 <c:otherwise>物料</c:otherwise>
			</c:choose>
			</td>
		</tr>
		</c:forEach>

		</tbody>
	</table>
			</DIV>
			<DIV id="content2" style="display:none;"margin-top:4px;margin-left:4px;margin-right:4px;"">
				<div style="padding:1px;" ></div>
<table id="addTable_b9f80468a9fe4b74ada4fceff23db738" width="100%" class="table-line" >
		<thead>
		<tr class="tdcolor">
			<th style="width:120px;" align="center">主料料号</th>
			<th style="width:120px;">主料名称</th>
			<th style="width:120px;">替代料号</th>
			<th style="width:120px;">替代料名称</th>
			<th style="width:120px;">规格</th>
			<th style="width:120px;">状态</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${dataList}">
		<tr>
		   	<td style="width:120px;">${item.CR_ITEM_MIAN}</td>
			<td style="width:120px;">${item.CI_ITEM_NAME}</td>
			<td style="width:120px;">${item.CR_ITEM_REPLACE}</td>
			<td style="width:120px;">${item.CR_ITEM_REPLACE_NAME}</td>
			<td style="width:120px;">${item.CR_ITEM_REPLACE_SPEC}</td>
			<td style="width:120px;">
			<c:choose>
			 <c:when test="${item.CR_STATUS==1}">有效</c:when>
			 <c:otherwise>无效</c:otherwise>
			</c:choose>
			</td>
		</tr>
		</c:forEach>

		</tbody>
	</table>
</DIV>
</DIV>
</div>
<bu:script viewId="1bd1af247a9348aea22a29b250206ac0" />
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

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
