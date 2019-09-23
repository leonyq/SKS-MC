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
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
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
	<style type="text/css">
		.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
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
            <div style="margin-left:10px;">
				<s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
			</div>
			    	<div class="optn">
			    	        <button type="button" onclick="edititem();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i>取消</button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 420px;">
					

								<input type="hidden" name="formId" value="<c:out value='${formId}' />">
								<input type="hidden" name="iframeId" value="<c:out value='${iframeId}' />">
								<input type="hidden" name="dataId" value="<c:out value='${dataId}' />">
								
		<bu:set name="paraMapObj" value="${dataId}" formId="e09e1f47e824490d80ba2717d25498d3" type="edit" />
		
	<div class="mod">		
  <div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:130px;border:none;">
	<table class="basic-table" id="table1" name="table1">
	<input type="hidden" name="formIds" value="e09e1f47e824490d80ba2717d25498d3" />
	<input type="hidden" name="e09e1f47e824490d80ba2717d25498d3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'8ff9003b20644c9a95d3bf531ce8b9a9'" />
		<s:set name="_$formId_1" value="'e09e1f47e824490d80ba2717d25498d3'" />
		<s:set name="_$type" value="'edit'" />
		<input type="hidden" name="paraMap2.type" value="edit" />
		<tr>
			<td class="name" style="width:93px;"/><bu:uitn colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" >   
				<bu:ui colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"/></bu:td>
			
			<td class="name" style="width:100px;"/><bu:uitn colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TIN_CREATE_RULE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_CREATE_RULE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_CREATE_RULE" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	</div>

	<DIV id="content1">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="红胶/锡膏" /></h3>	
        </div>
        <div class="mod-hd" style="height:130px;border:none;">	
	<table class="basic-table" id="table2" name="table2">
		<tr>
			<td class="name"  /><span class="dot">*</span><bu:uitn colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BACK_TIME}" formIndex="1" /></bu:td>
	        <td class="name" /><span class="dot">*</span><bu:uitn colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"   colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BACK_MAX_TIME}" formIndex="1" /></bu:td>
	        </tr>
		<tr>
        	<td class="name" /><span class="dot">*</span><bu:uitn colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_MIX_TIME}" formIndex="1" /></bu:td>		

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"   colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_MIX_MAX_TIME}" formIndex="1" /></bu:td>
	        </tr>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_USE_TIME}" formIndex="1" /></bu:td>		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_DURING_TIME}" formIndex="1" /></bu:td>			

		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"   colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_DISCARD_TIME}" formIndex="1" /></bu:td>
	        <td class="name" /><span class="dot">*</span><bu:uitn colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_OPEN_DISCARD_TIME}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
	    	<td class="name" /><span class="dot">*</span><bu:uitn colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_THAWING_DECAY}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" value="%{LEAD_FLAG}" formIndex="1" /></bu:td>
		</tr>
	</table>
	</div>
	</div>
	
	
	<DIV id="content2" style="display:none">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="钢网/刮刀" /></h3>	
 	</div>
  	<div class="mod-hd" style="height:130px;border:none;">
	<table class="basic-table" id="table3" name="table3">
		<tr>
			<td class="name"  style="width:93px;"/><bu:uitn colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{MAX_USE_COUNT}" formIndex="1" /></bu:td>
			<td class="name"  style="width:100px;"/><bu:uitn colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{MAX_PERIOD_LIMIT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_CYCLE}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_PERIOD}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_REMIND_CYCLE}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_REMIND_DAY}" formIndex="1" /></bu:td>
		</tr>
	</table>
	</div>
	</div>
		
	
			<bu:jsVal formId="e09e1f47e824490d80ba2717d25498d3" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<script type="text/javascript">
			var parentWindow;
			var select_id;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 //select_id = $("#paraMapObj_ASSISTANTTOOLTYPE option:selected").val();
				 select_id = ${paraMapObj.ASSISTANTTOOLTYPE};
				 if(select_id=="2"||select_id=="3"){
				 	document.getElementById("content1").style.display="none";
				 	document.getElementById("content2").style.display="";
				 }else{
					document.getElementById("content2").style.display="none";
					document.getElementById("content1").style.display="";
				 }
			});
		var isQuery = false;
		function edititem(){
			// 校验开始    
        
var TIN_BACK = $("#paraMapObj_TIN_BACK_TIME").val(); 
//回温时间(分钟)
var TIN_MIX  = $("#paraMapObj_TIN_MIX_TIME").val();  
//搅拌时间(分钟)
		
var BACK = $("#paraMapObj_TIN_BACK_MAX_TIME").val(); 
//回温上限
		
var MIX  = $("#paraMapObj_TIN_MIX_MAX_TIME").val();  
//搅拌上限
		
if(parseInt(BACK) <= 0){
     
 $("#paraMapObj_TIN_BACK_MAX_TIME").val(TIN_BACK);
	
	}
		
if(parseInt(MIX) <= 0){
     
    $("#paraMapObj_TIN_MIX_MAX_TIME").val(TIN_MIX);
	
	}
   
if(parseInt(TIN_BACK) > parseInt(BACK)){
                _alertValMsg($('#paraMapObj_TIN_BACK_MAX_TIME'),"<dict:lang value="回温上限时间不能小于回温时间" />");
       //  alert("回温上限时间不能小于回温时间");
     
       return false;
        }
    
if(parseInt(TIN_MIX) > parseInt(MIX)){
        _alertValMsg($('#paraMapObj_TIN_MIX_TIME'),"<dict:lang value="搅拌时间应小于等于搅拌上限时间" />");
     //   alert("搅拌上限时间不能小于搅拌时间");
     
       return false;
  
      }
           // if($("#paraMapObj_TIN_USE_TIME").val()==""){
            //    _alertValMsg($('#paraMapObj_TIN_USE_TIME'),"<dict:lang value="该项不能为空" />");
            //    return false;
            //}
      
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//	if(!val.valNullData()){
		//		return ;
		//	}
		//	if(!valData()){
		//		return ;
		//	}
		//	if(!val.valOjbsData()){
		//		return ;
		//	}
		            if($("#paraMapObj_ASSISTANTTOOLTYPE").val()=="2" || $("#paraMapObj_ASSISTANTTOOLTYPE").val()=="3"){
           
                if($("#paraMapObj_MAX_USE_COUNT").val()==""){
                _alertValMsg($('#paraMapObj_MAX_USE_COUNT'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_MAX_PERIOD_LIMIT").val()==""){
                _alertValMsg($('#paraMapObj_MAX_PERIOD_LIMIT'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_FIX_CYCLE").val()==""){
                _alertValMsg($('#paraMapObj_FIX_CYCLE'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_FIX_PERIOD").val()==""){
                _alertValMsg($('#paraMapObj_FIX_PERIOD'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_FIX_REMIND_CYCLE").val()==""){
                _alertValMsg($('#paraMapObj_FIX_REMIND_CYCLE'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_FIX_REMIND_DAY").val()==""){
                _alertValMsg($('#paraMapObj_FIX_REMIND_DAY'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_ASSISTANTLEASTCOUNT").val()==""){
                _alertValMsg($('#paraMapObj_ASSISTANTLEASTCOUNT'),"<dict:lang value="该项不能为空" />");
            }else{
           //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide('N');
			document.forms.editForm.submit();
			isQuery = true;
            }
            }else if($("#paraMapObj_ASSISTANTTOOLTYPE").val()=="0" || $("#paraMapObj_ASSISTANTTOOLTYPE").val()=="1"){
            if($("#paraMapObj_ASSISTANTLEASTCOUNT").val()==""){
                _alertValMsg($('#paraMapObj_ASSISTANTLEASTCOUNT'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_BACK_TIME").val()==""){
                _alertValMsg($('#paraMapObj_TIN_BACK_TIME'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_BACK_MAX_TIME").val()==""){
                _alertValMsg($('#paraMapObj_TIN_BACK_MAX_TIME'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_MIX_TIME").val()==""){
                _alertValMsg($('#paraMapObj_TIN_MIX_TIME'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_MIX_MAX_TIME").val()==""){
                _alertValMsg($('#paraMapObj_TIN_MIX_MAX_TIME'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_USE_TIME").val()==""){
                _alertValMsg($('#paraMapObj_TIN_USE_TIME'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_DURING_TIME").val()==""){
                _alertValMsg($('#paraMapObj_TIN_DURING_TIME'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_DISCARD_TIME").val()==""){
                _alertValMsg($('#paraMapObj_TIN_DISCARD_TIME'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_OPEN_DISCARD_TIME").val()==""){
                _alertValMsg($('#paraMapObj_TIN_OPEN_DISCARD_TIME'),"<dict:lang value="该项不能为空" />");
            }else if($("#paraMapObj_TIN_THAWING_DECAY").val()==""){
                _alertValMsg($('#paraMapObj_TIN_THAWING_DECAY'),"<dict:lang value="该项不能为空" />");
            }else{
                			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide('N');
			document.forms.editForm.submit();
			isQuery = true;
            }
            }else{
                			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide('N');
			document.forms.editForm.submit();
			isQuery = true;
            }

			
			
			
			
		}
		
	//	function alertInfo(msg){
	//		isQuery = false;
	//		utilsFp.alert(msg);
	//	}
		
	//	function reloadPg(msg){
	//		isQuery = false;
	//		parentWindow.reloadPg(msg);
	//	}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();

			$(".dept_select").trigger("chosen:updated");
		    getIngredients();
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
		    data:{'paraMap.FORMID':tableId,
		    'paraMap.formIndex':formIndex,
		    'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,
		    'paraMap.trIndex':curRowSeq,
		    'paraMap.formidFirstId':formidFirstId,
		    'paraMap.subFormId':subFormId,
		    'paraMap.subRelColId':subRelColId,
		    'paraMap.relColVal':relColVal},
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
	 $(function(){
	 
	       getIngredients();
	  
	     
	 });
    	function getIngredients(){
    	     var url="${path}buss/bussModel_exeFunc.ms?funcMId=1f2d8bffc1d2458e83ad9658a08ecd57"; 
	            var dataId="<c:out value='${dataId}' />";
	            
	   //alert(dataId);
	    // var no=$("#paraMapObj_ASSISTANTTOOLNO").val();
	     //alert(no);
	     $.ajax({
	         type:"POST",
	         dataType:"json",
	         data:{
	             'dataId':dataId
	         },
	         url:url,
	         success:function(data){
	             if(null==data){
	                 return;
	             }
	             if(null!=data.ajaxList){
	                 var list=eval(data.ajaxList);
	               //  console.log("list==>",list);
	                 if(list[0].ASSISTANTTOOLTYPE=="0" || list[0].ASSISTANTTOOLTYPE=="1"){
	                     $("#paraMapObj_TIN_BACK_TIME").val(list[0].TIN_BACK_TIME);
	                     $("#paraMapObj_TIN_DISCARD_TIME").val(list[0].TIN_DISCARD_TIME);
	                     $("#paraMapObj_TIN_USE_TIME").val(list[0].TIN_USE_TIME);
	                     $("#paraMapObj_TIN_OPEN_DISCARD_TIME").val(list[0].TIN_OPEN_DISCARD_TIME);
	                     $("#paraMapObj_TIN_DURING_TIME").val(list[0].TIN_DURING_TIME);
	                     $("#paraMapObj_TIN_MIX_TIME").val(list[0].TIN_MIX_TIME);
	                     $("#paraMapObj_TIN_THAWING_DECAY").val(list[0].TIN_THAWING_DECAY);
	                     $("#paraMapObj_TIN_BACK_MAX_TIME").val(list[0].TIN_BACK_MAX_TIME);
	                     $("#paraMapObj_TIN_MIX_MAX_TIME").val(list[0].TIN_MIX_MAX_TIME);
	                     if(list[0].LEAD_FLAG=="Y"){
	                         
	                         $("#paraMapObj_LEAD_FLAG_1").attr("checked","true");
	                     }else{
	                         $("#paraMapObj_LEAD_FLAG_1").attr("checked",false);
	                         // $("#paraMapObj_LEAD_FLAG_1").attr("checked");
	                     }
	                     
	                     
	                 }else if(list[0].ASSISTANTTOOLTYPE=="3" || list[0].ASSISTANTTOOLTYPE=="2"){

	                     $("#paraMapObj_MAX_USE_COUNT").val(list[0].MAX_USE_COUNT);
	                     $("#paraMapObj_MAX_PERIOD_LIMIT").val(list[0].MAX_PERIOD_LIMIT);
	                     $("#paraMapObj_FIX_CYCLE").val(list[0].FIX_CYCLE);
	                     $("#paraMapObj_FIX_PERIOD").val(list[0].FIX_PERIOD);
	                     $("#paraMapObj_FIX_REMIND_CYCLE").val(list[0].FIX_REMIND_CYCLE);
	                     $("#paraMapObj_FIX_REMIND_DAY").val(list[0].FIX_REMIND_DAY);
	                     
	                     
	                 }
	             }
	         },
	         error:function(){
	         }
	         
	     });
    	    
    	    
    	    
    	}
    	
    	$('#paraMapObj_TIN_MIX_TIME').bind('keyup', function () {
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMapObj_TIN_MIX_TIME'),"<dict:lang value="该项只能为正数" />");
             }
         });
         $('#paraMapObj_TIN_BACK_TIME').bind('keyup', function () {
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMapObj_TIN_BACK_TIME'),"<dict:lang value="该项只能为正数" />");
             }
         });
         $('#paraMapObj_TIN_DISCARD_TIME').bind('keyup', function () {
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMapObj_TIN_DISCARD_TIME'),"<dict:lang value="该项只能为正数" />");
             }
         });
         $('#paraMapObj_TIN_USE_TIME').bind('keyup', function () {
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMapObj_TIN_USE_TIME'),"<dict:lang value="该项只能为正数" />");
             }
         });
         $('#paraMapObj_TIN_OPEN_DISCARD_TIME').bind('keyup', function () {
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMapObj_TIN_OPEN_DISCARD_TIME'),"<dict:lang value="该项只能为正数" />");
             }
         });
         $('#paraMapObj_TIN_DURING_TIME').bind('keyup', function () {
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMapObj_TIN_DURING_TIME'),"<dict:lang value="该项只能为正数" />");
             }
         });
         $('#paraMapObj_TIN_THAWING_DECAY').bind('keyup', function () {
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMapObj_TIN_THAWING_DECAY'),"<dict:lang value="该项只能为正数" />");
             }
         });
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
