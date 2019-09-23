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
		
	function wuchan(thisObj){
		if(thisObj=="2"){
			document.getElementById("content1").style.display="none";
			document.getElementById("content2").style.display="";
			$("#table2 .a").attr("disabled","disabled");
			$("#table3 .b").removeAttr("disabled");
		}else{
			document.getElementById("content2").style.display="none";
			document.getElementById("content1").style.display="";
			$("#table2 .a").removeAttr("disabled");
			$("#table3 .b").attr("disabled","disabled");
		}
		$('.chosen-container').css("width","230px");
	}
	
	//送检
	function autoFqc(){
		if (document.getElementById("paraMap1_CIG_AUTO_FQC_1").checked) {
			$("#paraMap1_CIG_FQC_NUM").attr("disabled",false);
		}else{
			$("#paraMap1_CIG_FQC_NUM").attr("disabled",true);
			$("#paraMap1_CIG_FQC_NUM").val("0");
		}
	};	
	
	$(function(){
	    	$("#paraMap1_CIG_MSD_FLAG_1").attr("onchange","changeInfo();");
	    
	})
	function changeInfo(){
	    if($("#paraMap1_CIG_MSD_FLAG_1").attr("checked") == "checked"){
	        $("#paraMap1_CIG_MSD_RULE").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select");
	    }else{
	        $("#paraMap1_CIG_MSD_RULE").attr("class","input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select");
	    }
	}
	</script>
	<style type="text/css">
		.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body>
  <div class="edit" ><!--mod style="margin-top: 47px;height:450px;"-->
  <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                                         <jsp:param name="modelName" value="VIEW_TYPE_10" />
                                         <jsp:param name="location" value="addForm" />
                                 		</jsp:include>
	                     <div class="hd">
	                    <div style="margin-left:10px;">
                           <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                           	<s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
					id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                		<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
					listKey="id" listValue="name"  name="_DATA_AUTH"
					id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   		</s:else>
                		</s:if>	
                	</div>
			    <div class="optn" ><!--style="top:5px"-->
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			    </div>
			<div class="bd" style="height:434px;"><!--style="padding:0 20px;margin-top: -30px; height:450px;"
						    			
										<input type="hidden" name="exeid" value="${exeid}">
											<input type="hidden" name="definedMsg" value="${definedMsg}">-->
										<input type="hidden" name="iframeId" value="${iframeId}">
										<input type="hidden" name="formId" value="4e26051dfc65446098d440a56f1c41f8" />
									
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="4e26051dfc65446098d440a56f1c41f8" type="add" />
<div class="mod">		
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
</div>	
	<table class="basic-table" id="table1" name="table1">
	<input type="hidden" name="formIds" value="4e26051dfc65446098d440a56f1c41f8" />
	<input type="hidden" name="4e26051dfc65446098d440a56f1c41f8" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a75bee8d9d084a96ac7f5ae98faafa83'" />
		<s:set name="_$formId_1" value="'4e26051dfc65446098d440a56f1c41f8'" />
		<input type="hidden" name="type" value="add" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:83px;"/><span class="dot">*</span><bu:uitn colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec"  colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SN}" formIndex="1" /></bu:td>
			<td class="name" style="width:98px;"/><span class="dot">*</span><bu:uitn colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_NAME}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_TYPE}" formIndex="1" /></bu:td>
		</tr>
	</table>
	</fieldset>

	<DIV id="content1">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="物料信息" /></h3>	
</div>	
	<table class="basic-table" id="table2" name="table2">
		<tr>
			<td class="name"  style="width:83px;"/><bu:uitn colNo="CIG_PRINT_TEMPLATE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_PRINT_TEMPLATE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_PRINT_TEMPLATE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_PRINT_TEMPLATE}" formIndex="1" /></bu:td>
			<td class="name"  style="width:98px;"/><bu:uitn colNo="CIG_ITEM_RULE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="CIG_ITEM_RULE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_ITEM_RULE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_ITEM_RULE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_STORE_MIN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_STORE_MIN" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_STORE_MIN" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_STORE_MIN}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_STORE_MAX" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_STORE_MAX" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_STORE_MAX" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_STORE_MAX}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_GUARANTEE_PERIOD" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_GUARANTEE_PERIOD" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_GUARANTEE_PERIOD" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_GUARANTEE_PERIOD}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_WARM_NUM" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_WARM_NUM" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_WARM_NUM" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_WARM_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_MSD_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_MSD_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_MSD_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_MSD_FLAG}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_MSD_RULE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_MSD_RULE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_MSD_RULE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_MSD_RULE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui cssClass="a" colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_RECHECK_DAYS}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui cssClass="a" colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_REMIND_DAYS}" formIndex="1" /></bu:td>		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui cssClass="a" colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SLUGGISH_CYCLE}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui cssClass="a" colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SIZE}" formIndex="1" /></bu:td>		
		</tr>
	</table>
	</div>
	
	
	<DIV id="content2" style="display:none">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="产品信息" /></h3>	
</div>	
	<table class="basic-table" id="table3" name="table3">
		<tr>
			<td class="name"   style="width:83px;"/><bu:uitn colNo="CIG_TEC_ID" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_TEC_ID" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_TEC_ID" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_TEC_ID}" formIndex="1" /></bu:td>
			<td class="name"  style="width:78px;"/><bu:uitn colNo="CIG_PROCESS_FACE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="CIG_PROCESS_FACE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_PROCESS_FACE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_PROCESS_FACE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_REJ_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_REJ_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" >
				<bu:ui colNo="CIG_REJ_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_REJ_FLAG}" formIndex="1" />
				&#x3000;&#x3000;&#x3000;
				<bu:uitn colNo="CIG_AUTO_FQC" formId="4e26051dfc65446098d440a56f1c41f8" />
				<bu:ui colNo="CIG_AUTO_FQC" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_AUTO_FQC}" formIndex="1" />
			</bu:td>
			<td class="name" /><bu:uitn colNo="CIG_FQC_NUM" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_FQC_NUM" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_FQC_NUM" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_FQC_NUM}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_REPAIR_MAX" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_REPAIR_MAX" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_REPAIR_MAX" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_REPAIR_MAX}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_CONTRAL_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_CONTRAL_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_CONTRAL_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_CONTRAL_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_SN_RULE_B" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SN_RULE_B" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN_RULE_B" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SN_RULE_B}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_SN_RULE_S" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SN_RULE_S" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN_RULE_S" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SN_RULE_S}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_LINK_NUM" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_LINK_NUM" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_LINK_NUM" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_LINK_NUM}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_SN_NUM" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SN_NUM" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN_NUM" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SN_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui cssClass="b" colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_RECHECK_DAYS}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui cssClass="b" colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_REMIND_DAYS}" formIndex="1" /></bu:td>		
		</tr>	
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_AGING_TIME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_AGING_TIME" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_AGING_TIME" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_AGING_TIME}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui cssClass="b" colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SLUGGISH_CYCLE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SIZE" cssClass="b" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SIZE}" formIndex="1" /></bu:td>
		</tr>
	</table>
	</div>
	
			<bu:jsVal formId="4e26051dfc65446098d440a56f1c41f8" formIndex="1" />
									</form>
			</div>
		
	</div>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	</div>

<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	$('#paraMap1_CIG_AGING_TIME').bind('keyup', function () {
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMap1_CIG_AGING_TIME'),"<dict:lang value="该项只能为数字" />");
             }
         });
         
         $('#paraMap1_CIG_SIZE').bind('keyup', function () {
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMap1_CIG_SIZE'),"<dict:lang value="该项只能为数字" />");
             }
         });
     
	
	
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
