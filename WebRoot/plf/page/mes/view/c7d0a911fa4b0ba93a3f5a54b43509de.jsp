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
<div id="_alertValMsgDiv2" style="color: rgb(255, 0, 0); background-color: rgb(254, 224, 178); left: 100px; position: absolute; top: 150px; z-index: 10; display: none;">该项只能为数字</div>
<div id="_alertValMsgDiv3" style="color: rgb(255, 0, 0); background-color: rgb(254, 224, 178); left: 732px; position: absolute; top: 80px; z-index: 10; display: none;">该项只能为不大于100的数字</div>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="addGloble_s2();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="iframeId" value="${iframeId}">
										<input type="hidden" name="formId" value="6c64c25e45214328b6adbec0abc8f34f" />
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="6c64c25e45214328b6adbec0abc8f34f" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6c64c25e45214328b6adbec0abc8f34f" />
	<input type="hidden" name="6c64c25e45214328b6adbec0abc8f34f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />  
	
	
	<input type="hidden" name="CTI_EXPIRE_DATE" id="CTI_EXPIRE_DATE" />  
	<input type="hidden" name="CTI_INSTOCK_MAN" id="CTI_INSTOCK_MAN" /> 
	<input type="hidden" name="CTI_INSTOCK_TIME" id="CTI_INSTOCK_TIME" />  
	<input type="hidden" name="CTI_ASSISTANTTOOLTYPE" id="CTI_ASSISTANTTOOLTYPE" />  
	<input type="hidden" name="CTI_QULITY_DATE" id="CTI_QULITY_DATE" />
	<input type="hidden" name="CTI_QULITY_DATE_OPEN" id="CTI_QULITY_DATE_OPEN" /> 
	<input type="hidden" name="CTI_REFLOW_TIME" id="CTI_REFLOW_TIME" /> 
	<input type="hidden" name="CTI_THAWING_CYCLE" id="CTI_THAWING_CYCLE" /> 
	<input type="hidden" name="CTI_THAWING_TIME_MAX" id="CTI_THAWING_TIME_MAX" />
	<input type="hidden" name="ctiItemType" id="ctiItemType"/>
	<input type="hidden" name="CTI_THAWING_TIME_TOTAL" id="CTI_THAWING_TIME_TOTAL"/>
	
		<s:set name="_$viewId" value="'006e02231a364177aa013ef88490b35e'" />
		<s:set name="_$formId_1" value="'6c64c25e45214328b6adbec0abc8f34f'" />
		<s:set name="_$type" value="'add'" />
 
		
		
		
		<!--1-->
		<tr>
			<td class="name" style="width:87px;"/><span class="dot">*</span><bu:uitn colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:225px;" colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ADDWAY}" formIndex="1"  style="width:200px;"/></bu:td>
			<input type="hidden" name="CTI_ITEM_TYPE" id="CTI_ITEM_TYPE"/>
		    
		    <td class="name"  style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:225px;" colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TIN_SN}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name"  style="width:87px;" /><span class="dot">*</span><bu:uitn colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:205px;"  colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" >
			<bu:ui colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_COUNT}"  formIndex="1"  style="width:200px;"/></bu:td>
			 
		 
		</tr>
		
		 
		
		<!--2-->
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ITEM_CODE}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f"><bu:ui colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_SUPPLIER}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_LOT}" formIndex="1"  style="width:200px;"/></bu:td> 
		</tr>
		<!--3-->
		<tr>
                 <!--  <td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
		   <bu:td cssClass="dec" colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_WEIGHT}" formIndex="1"  style="width:200px;"/></bu:td>
		    -->   
		 
		 <td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_WEIGHT}" formIndex="1"  style="width:200px;"/></bu:td>
		
 
		   <td class="name" /><bu:uitn colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
		   <bu:td cssClass="dec" colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_DOC}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		   <td class="name" /><bu:uitn colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
		   <bu:td cssClass="dec" colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ROHS_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<!--4-->
		<tr>
            <td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLTYPE}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		    <td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLNAME}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLSPEC}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<!--5-->
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE}" formIndex="1"  style="width:200px;"/></bu:td>
		    
		    <td class="name" /><bu:uitn colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_EXPIRE_DATE}" formIndex="1"  style="width:200px;"/></bu:td>
		  
		    <td class="name" /><bu:uitn colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_REFLOW_TIME}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<!--6-->
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_CYCLE}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		 	<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE_OPEN}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_TIME_MAX}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<!--7-->
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_TIME}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_MAN}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		
		
		<!--8-->
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" colspan="7">
			<bu:ui colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_MEMO}" formIndex="1" style="height:80px;"/>
			</bu:td>
		</tr>
	<!--	<tr>
			<td class="name" /><bu:uitn colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_STOCK_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ROHS_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_REFLOW_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_TIME_TOTAL}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_TIME_MAX}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_CYCLE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TOTAL_OPEN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_EXPIRE_DATE_OPEN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE_OPEN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_EXPIRE_DATE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_MAN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TIN_STATUS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_WEIGHT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_LOT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_SUPPLIER_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TIN_SN}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ADDWAY}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLSPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLNAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLTYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_WH_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_DOC}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_COUNT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_SUPPLIER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_MEMO}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ITEM_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_DECIDE}" formIndex="1" /></bu:td>
		</tr>-->
	</table>
			 


									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<bu:submit viewId="c76d3a1541e946ce8c42be814215dbee" />
	<bu:script viewId="c76d3a1541e946ce8c42be814215dbee" />
	
		

		  <script type="text/javascript">
    function valData(){
    var checkRes = true;
    return checkRes;    }
  </script>
  
  
<script type="text/javascript">

	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}	
		  
		  
		  
		  $("#paraMap1_CTI_ASSISTANTTOOLTYPE").attr("readonly","readonly"); 	  
		  $("#paraMap1_CTI_ASSISTANTTOOLNAME").attr("readonly","readonly"); 	  	
		  $("#paraMap1_CTI_ASSISTANTTOOLSPEC").attr("readonly","readonly");   	
		  $("#paraMap1_CTI_QULITY_DATE").attr("readonly","readonly"); 
		  $("#paraMap1_CTI_EXPIRE_DATE").attr("readonly","readonly"); 
		  $("#paraMap1_CTI_REFLOW_TIME").attr("readonly","readonly"); 
		  $("#paraMap1_CTI_THAWING_CYCLE").attr("readonly","readonly"); 
		  $("#paraMap1_CTI_QULITY_DATE_OPEN").attr("readonly","readonly"); 
		  $("#paraMap1_CTI_THAWING_TIME_MAX").attr("readonly","readonly"); 
		  $("#paraMap1_CTI_INSTOCK_TIME").attr("readonly","readonly"); 		  		  	
		  $("#paraMap1_CTI_INSTOCK_MAN").attr("readonly","readonly"); 		
		  	
		
		  $("#paraMap1_CTI_ASSISTANTTOOLNAME").addClass("readonly"); 
		  $("#paraMap1_CTI_ASSISTANTTOOLSPEC").addClass("readonly"); 
		  $("#paraMap1_CTI_QULITY_DATE").addClass("readonly"); 
		  $("#paraMap1_CTI_EXPIRE_DATE").addClass("readonly"); 		    
		  $("#paraMap1_CTI_REFLOW_TIME").addClass("readonly");
		  $("#paraMap1_CTI_THAWING_CYCLE").addClass("readonly");
		  $("#paraMap1_CTI_QULITY_DATE_OPEN").addClass("readonly");
		  $("#paraMap1_CTI_THAWING_TIME_MAX").addClass("readonly");
		  $("#paraMap1_CTI_INSTOCK_TIME").addClass("readonly");
		  $("#paraMap1_CTI_INSTOCK_MAN").addClass("readonly");
		 
                   $('#paraMap1_CTI_COUNT').attr("readonly","readonly"); 
              $('#paraMap1_CTI_COUNT').addClass("readonly");
		
		$("#paraMap1_CTI_INSTOCK_MAN").val('${dataMap.curUser}');   
			$("#paraMap1_CTI_COUNT").attr("disabled",false);   
		$("#paraMap1_CTI_ASSISTANTTOOLTYPE").attr("disabled",false);  
		$("#paraMap1_CTI_ASSISTANTTOOLNAME").attr("disabled",false);
		$("#paraMap1_CTI_ASSISTANTTOOLSPEC").attr("disabled",false);
		
		
		
		
		 
		  $("#paraMap1_CTI_ASSISTANTTOOLTYPE").attr("disabled",true); 
		  $("#paraMap1_CTI_ASSISTANTTOOLNAME").attr("disabled",true); 
		  $("#paraMap1_CTI_ASSISTANTTOOLSPEC").attr("disabled",true); 	
		  $("#paraMap1_CTI_QULITY_DATE").attr("disabled",true); 
		  $("#paraMap1_CTI_EXPIRE_DATE").attr("disabled",true); 
		  $("#paraMap1_CTI_REFLOW_TIME").attr("disabled",true); 
		  $("#paraMap1_CTI_THAWING_CYCLE").attr("disabled",true); 
		  $("#paraMap1_CTI_QULITY_DATE_OPEN").attr("disabled",true); 
		  $("#paraMap1_CTI_THAWING_TIME_MAX").attr("disabled",true); 
		  $("#paraMap1_CTI_INSTOCK_TIME").attr("disabled",true); 	   
		  $("#paraMap1_CTI_INSTOCK_MAN").attr("disabled",true); 		
		  	 $("#paraMapObj_CTI_INSTOCK_TIME").attr("disabled",true); 
		
		
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	  
 	
	 $("#paraMap1_CTI_ADDWAY").change(function(){
            if($(this).val()==1){
           
              $('#paraMap1_CTI_COUNT').val(""); 
              $('#paraMap1_CTI_COUNT').attr("readonly","readonly"); 
              $('#paraMap1_CTI_COUNT').addClass("readonly");
              $('#paraMap1_CTI_TIN_SN').removeAttr("readonly");  
              $('#paraMap1_CTI_TIN_SN').removeClass("readonly");
          //     $('#paraMap1_CTI_LOT').removeAttr("readonly"); 
          //     $('#paraMap1_CTI_LOT').removeClass("readonly");
              $('#_alertValMsgDiv3').css('display','none');
            }else{//为批次的时候
              $('#paraMap1_CTI_TIN_SN').val("");
              $('#paraMap1_CTI_COUNT').val(""); 
              $('#paraMap1_CTI_COUNT').removeAttr("readonly"); 
              $('#paraMap1_CTI_COUNT').removeClass("readonly");
              
              $("#paraMap1_CTI_TIN_SN").attr("readonly","readonly"); 
              $('#paraMap1_CTI_TIN_SN').addClass("readonly");
       
         //      $("#paraMap1_CTI_LOT").attr("readonly","readonly"); 
          //     $('#paraMap1_CTI_LOT').addClass("readonly");
              
              
              $('#_alertValMsgDiv3').css('display','none');
            }
    });
	
	
 
	
	
	$('#paraMap1_CTI_WEIGHT').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_WEIGHT");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_WEIGHT'),"<dict:lang value="该项只能为数字" />");
             }
         });
		
 
	
$('#paraMap1_CTI_COUNT').bind('keyup', function () {
 
  if( ! /^(1)$|^100$|^[1-9][0-9]?$/.test(this.value)){
 
             	this.value='';
             	//$('#_alertValMsgDiv3').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_COUNT'),"<dict:lang value="该项只能为不大于100的数字" />");
             }
 
         });
		
     /*  $('#paraMap1_CTI_COUNT').bind('keydown', function () {
             
             	$('#_alertValMsgDiv3').css('display','none');
             
         }); */
  
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
