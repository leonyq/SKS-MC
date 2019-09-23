<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<style>
		    .bd{
		    	height:360px !important;
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
		
		window.onload=function(){
		if($("#paraMapObj_CIG_TYPE").val()=="2"){
			document.getElementById("content1").style.display="none";
			document.getElementById("content2").style.display="";
		}else{
			document.getElementById("content2").style.display="none";
			document.getElementById("content1").style.display="";
		}
		
	}
	</script>
	<style type="text/css">
		.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
</head>
<body>
  <div class="mod" style="height:450px;">
	<div >
           
			<div class="bd" style="padding: 0 20px;margin-top: 20px;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="4e26051dfc65446098d440a56f1c41f8" type="edit" />
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
</div>	
	<table class="basic-table " id="table1" name="table1">
	<input type="hidden" name="formIds" value="4e26051dfc65446098d440a56f1c41f8" />
	<input type="hidden" name="4e26051dfc65446098d440a56f1c41f8" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'9f1f8245833e43e69f30b12493617f2b'" />
		<s:set name="_$formId_1" value="'4e26051dfc65446098d440a56f1c41f8'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:83px;"/><bu:uitn colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec"  colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly"  disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly"  disabled="disabled"/></bu:td>
		</tr>
	</table>

	<DIV id="content1">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="物料信息" /></h3>	
</div>
	<table class="basic-table" id="table2" name="table2">
		<tr>
			<td class="name" style="width:83px;"/><span>物料打印模板</span></td>
			<td cssClass="dec" />&nbsp;<input type="text" style="width:230px;height:25px;" id="paraMapObj_CIG_PRINT_TEMPLATE" class="isSubmit input _VAL_DATABASE readonly" readonly="readonly"></td>
			<td class="name" /><span>物料条码规则</span></td>
			<td cssClass="dec" />&nbsp;<input type="text" style="width:230px;height:25px;" id="paraMapObj_CIG_ITEM_RULE" class="isSubmit input _VAL_DATABASE readonly" readonly="readonly"></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_STORE_MIN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_STORE_MIN" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_STORE_MIN" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_STORE_MAX" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_STORE_MAX" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_STORE_MAX" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_GUARANTEE_PERIOD" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_GUARANTEE_PERIOD" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_GUARANTEE_PERIOD" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_WARM_NUM" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_WARM_NUM" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_WARM_NUM" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_MSD_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_MSD_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_MSD_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/></bu:td>
			<td class="name" /><span>MSD规则</span></td>
			<td cssClass="dec" />&nbsp;<input type="text" style="width:230px;height:25px;" id="paraMapObj_CIG_MSD_RULE" class="isSubmit input _VAL_DATABASE readonly" readonly="readonly"></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>	
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"/></bu:td>
			
		</tr>
	</table>
	</div>
	
	
	<DIV id="content2" style="display:none">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="产品信息" /></h3>	
</div>
	<table class="basic-table" id="table3" name="table3">
		<tr>
			<td class="name" style="width:83px;"/><bu:uitn colNo="CIG_TEC_ID" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_TEC_ID" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_TEC_ID" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/></bu:td>
			<td class="name" style="width:83px;"/><bu:uitn colNo="CIG_PROCESS_FACE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CIG_PROCESS_FACE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_PROCESS_FACE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_REJ_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_REJ_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" >
				<bu:ui colNo="CIG_REJ_FLAG" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/>
				&#x3000;&#x3000;&#x3000;
				<bu:uitn colNo="CIG_AUTO_FQC" formId="4e26051dfc65446098d440a56f1c41f8" />
				<bu:ui colNo="CIG_AUTO_FQC" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/>
			</bu:td>
			<td class="name" /><bu:uitn colNo="CIG_FQC_NUM" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_FQC_NUM" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_FQC_NUM" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" disabled="disabled"/></bu:td>
			
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_REPAIR_MAX" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_REPAIR_MAX" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_REPAIR_MAX" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" disabled="disabled"/></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_CONTRAL_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_CONTRAL_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_CONTRAL_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" disabled="disabled"/></bu:td>
			
		</tr>
		<tr>
			<!--<td class="name" /><bu:uitn colNo="CIG_SN_RULE_B" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SN_RULE_B" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN_RULE_B" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/></bu:td>-->
			<td class="name" /><span>产品条码规则</span></td>
			<td cssClass="dec" />&nbsp;<input type="text" style="width:230px;height:25px;" id="paraMapObj_CIG_SN_RULE_B" class="isSubmit input _VAL_DATABASE readonly" readonly="readonly"></td>
            <td class="name" /><span>小板条码规则</span></td>
			<td cssClass="dec" />&nbsp;<input type="text" style="width:230px;height:25px;" id="paraMapObj_CIG_SN_RULE_S" class="isSubmit input _VAL_DATABASE readonly" readonly="readonly"></td>			
			<!--<td class="name" /><bu:uitn colNo="CIG_SN_RULE_S" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SN_RULE_S" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN_RULE_S" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/></bu:td>-->
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_LINK_NUM" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_LINK_NUM" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_LINK_NUM" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_SN_NUM" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SN_NUM" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN_NUM" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_RECHECK_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly"  disabled="disabled"/></bu:td>
			<td class="name" /><bu:uitn colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_REMIND_DAYS" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIG_AGING_TIME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_AGING_TIME" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_AGING_TIME" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"/></bu:td>
				<td class="name" /><bu:uitn colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SLUGGISH_CYCLE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		 <tr>
            <td class="name" /><bu:uitn colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SIZE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"/></bu:td>
        </tr>
	</table>
	</div>
			<bu:jsVal formId="4e26051dfc65446098d440a56f1c41f8" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
			     getPrintTemplate();
			     getItemRule();
			     getMsdRule();
			     getPruductRuleB();
			     getPruductRuleS();
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $("#paraMapObj_CIG_TEC_ID_SHOW").attr("disabled",true);
			});
		var isQuery = false;
		function getPrintTemplate(){
    	    var CLAS = "${dataId}";
    	    var dataAuth="${param.dataAuthVal}";
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=c40ed2167547437ea8cd8e3d4f1b30f2";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {
                "CLAS" : CLAS,
                "dataAuth" : dataAuth,
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	        console.log("物料组打印");
    	        console.log(data);
    	            if(null==data){
    	                return;
    	            }
    	            if(null!=data.ajaxList){
    	                if(data.ajaxList.length>0){
    	                     var list = eval(data.ajaxList);
    	                     if(list[0].LABEL_NAME==null)list[0].LABEL_NAME="";
		                	$("#paraMapObj_CIG_PRINT_TEMPLATE").val(list[0].LABEL_NAME);
    	                }
    	                
    	            }
    	        },
    	        error:function(msg){
    	            alert(msg);
    	            
    	        }
    	    });
    	}
    	function getItemRule(){
    	    var CLAS = "${dataId}";
    	    var dataAuth="${param.dataAuthVal}";
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=f8a207d8a9c14a289c30ceba8966f725";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {
                "CLAS" : CLAS,
                "dataAuth" : dataAuth,
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	            if(null==data){
    	                return;
    	            }
    	            if(null!=data.ajaxList){
    	                if(data.ajaxList.length>0){
    	                     var list = eval(data.ajaxList);
    	                     if(list[0].TBR_NAME==null)list[0].TBR_NAME="";
		                	$("#paraMapObj_CIG_ITEM_RULE").val(list[0].TBR_NAME);
    	                }
    	                
    	            }
    	        },
    	        error:function(msg){
    	            alert(msg);
    	            
    	        }
    	    });
    	}
    	function getMsdRule(){
    	    var CLAS = "${dataId}";
    	    var dataAuth="${param.dataAuthVal}";
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=1ecf6f9a5f284968b9e31a7b30735a02";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {
                "CLAS" : CLAS,
                "dataAuth" : dataAuth,
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	            if(null==data){
    	                return;
    	            }
    	            if(null!=data.ajaxList){
    	                if(data.ajaxList.length>0){
    	                     var list = eval(data.ajaxList);
    	                     if(list[0].WSR_RULE_NAME==null)list[0].WSR_RULE_NAME="";
		                	$("#paraMapObj_CIG_MSD_RULE").val(list[0].WSR_RULE_NAME);
    	                }
    	                
    	            }
    	        },
    	        error:function(msg){
    	            alert(msg);
    	            
    	        }
    	    });
    	}
    	  function getPruductRuleB(){
    	    var CLAS = "${dataId}";
    	    var dataAuth="${param.dataAuthVal}";
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=52451360d8de48bdaffb1d88d64414e7";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {
                "CLAS" : CLAS,
                "dataAuth" : dataAuth,
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	            if(null==data){
    	                return;
    	            }
    	            if(null!=data.ajaxList){
    	                if(data.ajaxList.length>0){
    	                     var list = eval(data.ajaxList);
    	                     if(list[0].TBR_NAME==null)list[0].TBR_NAME="";
		                	$("#paraMapObj_CIG_SN_RULE_B").val(list[0].TBR_NAME);
    	                }
    	                
    	            }
    	        },
    	        error:function(msg){
    	            alert(msg);
    	            
    	        }
    	    });
    	}
    	 function getPruductRuleS(){
    	    var CLAS = "${dataId}";
    	    var dataAuth="${param.dataAuthVal}";
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=78201089d1bc41c7b43c3ffa680b3e55";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {
                "CLAS" : CLAS,
                "dataAuth" : dataAuth,
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	            if(null==data){
    	                return;
    	            }
    	            if(null!=data.ajaxList){
    	                if(data.ajaxList.length>0){
    	                     var list = eval(data.ajaxList);
    	                     if(list[0].TBR_NAME==null)list[0].TBR_NAME="";
		                	$("#paraMapObj_CIG_SN_RULE_S").val(list[0].TBR_NAME);
    	                }
    	                
    	            }
    	        },
    	        error:function(msg){
    	            alert(msg);
    	            
    	        }
    	    });
    	}
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
