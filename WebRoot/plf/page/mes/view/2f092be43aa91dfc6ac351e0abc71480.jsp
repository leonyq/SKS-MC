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
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="addDiscarde();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<input type="hidden" name="formId" value="637eae7df1284e708d361ddbc63c542d" />
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="637eae7df1284e708d361ddbc63c542d" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="637eae7df1284e708d361ddbc63c542d" />
	<input type="hidden" name="637eae7df1284e708d361ddbc63c542d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden"  id="ID" name="ID"/>
        <input type="hidden"  id="CTS_SUPPLIER_CODE" name="CTS_SUPPLIER_CODE"/>
	<input type="hidden"  id="CTS_LOT" name="CTS_LOT"/>
	<input type="hidden" id="CTI_ITEM_TYPE" name="CTI_ITEM_TYPE"/>
	<input type="hidden" id="noCount" name="noCount"/>
	
	<input type="hidden" id="CTS_TIN_SN2" name="CTS_TIN_SN2"/>
	<input type="hidden" id="CTS_ITEM_CODE2" name="CTS_ITEM_CODE2"/>
	<input type="hidden" id="CTS_SCARP_REASON" name="CTS_SCARP_REASON"/>
	<input type="hidden" id="CTS_SCARP_TYPE" name="CTS_SCARP_TYPE"/>
	 
	
	
		<s:set name="_$viewId" value="'06e504bb277847a0b7ea4ad0d09939de'" />
		<s:set name="_$formId_1" value="'637eae7df1284e708d361ddbc63c542d'" />
		<s:set name="_$type" value="'add'" />
		
		<!--<tr>
			<td>
				Id:${dataList[0].ID}
				供应商代码：${dataList[0].CTS_SUPPLIER_CODE}   
				生产批次：${dataList[0].CTS_LOT}  </td> 
				
		</tr>-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTS_TIN_SN" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_TIN_SN" formId="637eae7df1284e708d361ddbc63c542d" >
			<bu:ui colNo="CTS_TIN_SN" formId="637eae7df1284e708d361ddbc63c542d" value="%{CTS_TIN_SN}"  formIndex="1" />
			</bu:td>
		</tr>
		
		<tr>
		    <td class="name-six" /><bu:uitn colNo="CTS_ITEM_CODE" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_ITEM_CODE" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_ITEM_CODE" formId="637eae7df1284e708d361ddbc63c542d" value="%{CTS_ITEM_CODE}" formIndex="1" /></bu:td>	
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTTOOLNAME" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLNAME" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="ASSISTANTTOOLNAME" formId="637eae7df1284e708d361ddbc63c542d" value="%{ASSISTANTTOOLNAME}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLSPEC" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="ASSISTANTTOOLSPEC" formId="637eae7df1284e708d361ddbc63c542d" value="%{ASSISTANTTOOLSPEC}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="SUPPLIER_NAME" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="SUPPLIER_NAME" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="SUPPLIER_NAME" formId="637eae7df1284e708d361ddbc63c542d" value="%{SUPPLIER_NAME}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTS_SCARP_TYPE" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SCARP_TYPE" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SCARP_TYPE" formId="637eae7df1284e708d361ddbc63c542d" value="%{CTS_SCARP_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CTS_SCARP_REASON" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SCARP_REASON" formId="637eae7df1284e708d361ddbc63c542d" >
			<bu:ui colNo="CTS_SCARP_REASON" formId="637eae7df1284e708d361ddbc63c542d" value="%{CTS_SCARP_REASON}" formIndex="1" style="width:229px;height:80px;"/>
			</bu:td>
		</tr>
		
		
		<!--<tr>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CTS_SUPPLIER_CODE" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SUPPLIER_CODE" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SUPPLIER_CODE" formId="637eae7df1284e708d361ddbc63c542d" value="%{CTS_SUPPLIER_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTS_LOT" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_LOT" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_LOT" formId="637eae7df1284e708d361ddbc63c542d" value="%{CTS_LOT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CTS_SCARP_TIME" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SCARP_TIME" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SCARP_TIME" formId="637eae7df1284e708d361ddbc63c542d" value="%{CTS_SCARP_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTS_SCARP_MAN" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SCARP_MAN" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SCARP_MAN" formId="637eae7df1284e708d361ddbc63c542d" value="%{CTS_SCARP_MAN}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="ASSISTANTTOOLTYPE" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLTYPE" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="ASSISTANTTOOLTYPE" formId="637eae7df1284e708d361ddbc63c542d" value="%{ASSISTANTTOOLTYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>-->
	</table>
			<bu:jsVal formId="637eae7df1284e708d361ddbc63c542d" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
        <bu:submit viewId="06e504bb277847a0b7ea4ad0d09939de" />
	<bu:script viewId="06e504bb277847a0b7ea4ad0d09939de" />
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		 
		
		
		
	 	if($('#paraMap1_CTS_SCARP_TYPE option:selected').text()=='--请选择--'){
		//alert($('#paraMap1_CTS_SCARP_TYPE option:selected').text()=='--请选择--');
                  $('#paraMap1_CTS_SCARP_TYPE').addClass('_VAL_NULL');
                   _alertValMsg($('#paraMap1_CTS_SCARP_TYPE'),"<dict:lang value="该项为必选项" />");
                 $('#paraMap1_CTS_SCARP_TYPE option:selected') .val('a');
                   }
		 
		
		$("#paraMap1_CTS_SCARP_REASON").addClass('_VAL_NULL');
		
		$("#paraMap1_CTS_TIN_SN").attr("readonly","readonly"); 	  
		$("#paraMap1_CTS_TIN_SN").addClass("readonly"); 
		
		$("#paraMap1_CTS_ITEM_CODE").attr("readonly","readonly"); 	  
		$("#paraMap1_CTS_ITEM_CODE").addClass("readonly"); 
		
		$("#paraMap1_ASSISTANTTOOLNAME").attr("readonly","readonly"); 	  
		$("#paraMap1_ASSISTANTTOOLNAME").addClass("readonly"); 
		
		$("#paraMap1_ASSISTANTTOOLSPEC").attr("readonly","readonly"); 	  
		$("#paraMap1_ASSISTANTTOOLSPEC").addClass("readonly"); 
		
		$("#paraMap1_SUPPLIER_NAME").attr("readonly","readonly"); 	  
		$("#paraMap1_SUPPLIER_NAME").addClass("readonly"); 
		
		
		
	 	$("#paraMap1_ASSISTANTTOOLNAME").attr("disabled",false);
	 	$("#paraMap1_ASSISTANTTOOLSPEC").attr("disabled",false);
	 	$("#paraMap1_SUPPLIER_NAME").attr("disabled",false);
		
		$("#paraMap1_CTS_TIN_SN").val('${dataList[0].CTS_TIN_SN}');
		$("#paraMap1_CTS_ITEM_CODE").val('${dataList[0].CTS_ITEM_CODE}');
		$("#paraMap1_ASSISTANTTOOLNAME").val('${dataList[0].ASSISTANTTOOLNAME}');
		$("#paraMap1_ASSISTANTTOOLSPEC").val('${dataList[0].ASSISTANTTOOLSPEC}');
		$("#paraMap1_SUPPLIER_NAME").val('${dataList[0].SUPPLIER_NAME}');
		$("#paraMap1_CTS_SCARP_TYPE").val('${dataMap.CTS_SCARP_TYPE}');
		$("#paraMap1_CTS_SCARP_REASON").val('${dataMap.CTS_SCARP_REASON}');
		$("#CTI_ITEM_TYPE").val('${dataList[0].CTI_ITEM_TYPE}');
		
		 $("#ID").val('${dataList[0].ID}');
		 $("#CTS_SUPPLIER_CODE").val('${dataList[0].CTS_SUPPLIER_CODE}');
		 $("#CTS_LOT").val('${dataList[0].CTS_LOT}');
		 
		 
		 
		 $('#CTS_TIN_SN').attr("disabled",true); 
$('#CTS_ITEM_CODE').attr("disabled",true);  
 $('#paraMap1_ASSISTANTTOOLNAME ').attr("disabled",true); 
 $('#paraMap1_ASSISTANTTOOLSPEC ').attr("disabled",true); 
 $('#paraMap1_SUPPLIER_NAME').attr("disabled",true); 
		 
		 
		 
		 
               //  alert(${dataMap.noCount==1});
                 if(${dataMap.noCount==1}){
                 $("#noCount").val(1);
                 $('#paraMap1_CTS_SCARP_TYPE').attr("disabled",true); 
                 $("#paraMap1_CTS_SCARP_REASON").attr("readonly","readonly"); 
                 $('#paraMap1_CTS_SCARP_REASON').addClass("readonly");
                 $('#paraMap1_CTS_SCARP_REASON').attr("disabled",true); 
                 }else{
                 $("#noCount").val(0);
                 $('#paraMap1_CTS_SCARP_TYPE').removeAttr("disabled"); 
                 $("#paraMap1_CTS_SCARP_REASON").removeAttr("readonly"); 
                 $('#paraMap1_CTS_SCARP_REASON').removeClass("readonly");
                 }
               // alert('noCount: '+$("#noCount").val()+"=====: "+$("#noCount").val()==1);
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
		function scarptype(){
	
	var scarptype=$('#paraMap1_CTS_SCARP_TYPE').val();
 
if(scarptype=='-1'){
_alertValMsg($('#paraMap1_CTS_SCARP_TYPE'),"<dict:lang value="该项为必选项" />");}
return 1;
}
	 

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
