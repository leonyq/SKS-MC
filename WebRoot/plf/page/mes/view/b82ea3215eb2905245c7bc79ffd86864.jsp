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
			        <button type="button" onclick="fixBack()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="33982c650c8d435aacffbd806ed0103d" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="33982c650c8d435aacffbd806ed0103d" />
	<input type="hidden" name="33982c650c8d435aacffbd806ed0103d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="cfo_id" id="cfo_id" value="" />
	<input type="hidden" name="assis_type" id="assis_type" value="" />
	
		<s:set name="_$viewId" value="'0678bf33e5264f339ba0eb3be93ca40f'" />
		<s:set name="_$formId_1" value="'33982c650c8d435aacffbd806ed0103d'" />
		<s:set name="_$type" value="'add'" />
		<!--1-->
		<tr> 
			<td class="name-six" /><bu:uitn colNo="CFO_FIX_SN" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_FIX_SN" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_FIX_SN" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_FIX_SN}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFO_ITEM_CODE" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_ITEM_CODE" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_ITEM_CODE" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		
		<!--2-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFO_ITEM_NAME" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_ITEM_NAME" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_ITEM_NAME" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_ITEM_NAME}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFO_ITEM_SPEC" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_ITEM_SPEC" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_ITEM_SPEC" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_ITEM_SPEC}" formIndex="1" /></bu:td>
		</tr>
		
		<!--3-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFO_LEFT_TOP" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_LEFT_TOP" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_LEFT_TOP" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_LEFT_TOP}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFO_RIGHT_TOP" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_RIGHT_TOP" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_RIGHT_TOP" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_RIGHT_TOP}" formIndex="1" /></bu:td>
		</tr>
		
		<!--4-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFO_LEFT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_LEFT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_LEFT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_LEFT_LOWER}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFO_RIGHT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_RIGHT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_RIGHT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_RIGHT_LOWER}" formIndex="1" /></bu:td>
		</tr>
		
		<!--5-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFO_MIDDLE" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_MIDDLE" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_MIDDLE" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_MIDDLE}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-three" /><bu:uitn colNo="CFO_ITEM_CURUSER" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_ITEM_CURUSER" formId="33982c650c8d435aacffbd806ed0103d"  colspan="4"><bu:ui colNo="CFO_ITEM_CURUSER" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_ITEM_CURUSER}" formIndex="1" /></bu:td>
		</tr>
		
		<!--6-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFO_OPEATOR" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_OPEATOR" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_OPEATOR" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_OPEATOR}" formIndex="1" /></bu:td>
		</tr>
		
		<!--6-->
		<tr>
	    	<td class="name-six" /><bu:uitn colNo="CFI_MEMO" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MEMO" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFI_MEMO" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFI_MEMO}" formIndex="1" /></bu:td>
		</tr>
		
	 
	</table>
			<bu:jsVal formId="33982c650c8d435aacffbd806ed0103d" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
                <bu:submit viewId="0678bf33e5264f339ba0eb3be93ca40f" />
		<bu:script viewId="0678bf33e5264f339ba0eb3be93ca40f" />
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
		$("#paraMap1_CFO_ITEM_NAME").attr("disabled",false);
		$("#paraMap1_CFO_ITEM_SPEC").attr("disabled",false);
		$("#paraMap1_CFO_LEFT_TOP").attr("disabled",false);
		$("#paraMap1_CFO_RIGHT_TOP").attr("disabled",false);
		$("#paraMap1_CFO_LEFT_LOWER").attr("disabled",false);
		$("#paraMap1_CFO_RIGHT_LOWER").attr("disabled",false);
		$("#paraMap1_CFO_MIDDLE").attr("disabled",false);
		
		
		
		$("#paraMap1_CFO_FIX_SN").attr("readonly","readonly");
		$("#paraMap1_CFO_FIX_SN").addClass("readonly");
		$("#paraMap1_CFO_ITEM_CODE").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_CODE").addClass("readonly");  
		$("#paraMap1_CFO_ITEM_NAME").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_NAME").addClass("readonly");  
		$("#paraMap1_CFO_ITEM_SPEC").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_SPEC").addClass("readonly"); 
		$("#paraMap1_CFO_ITEM_CURUSER").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_CURUSER").addClass("readonly"); 
        
        
        $("#paraMap1_CFO_FIX_SN").val('${dataMap.cfi_fix_sn}'); 
        $("#paraMap1_CFO_ITEM_CODE").val('${dataMap.cfi_item_code}');
        $("#paraMap1_CFO_ITEM_NAME").val('${dataMap.assistanttoolname}');
        $("#paraMap1_CFO_ITEM_SPEC").val('${dataMap.assistanttoolspec}');
        $("#paraMap1_CFO_LEFT_TOP").val('${dataMap.cfi_left_top}');
        $("#paraMap1_CFO_RIGHT_TOP").val('${dataMap.cfi_right_top}');
        $("#paraMap1_CFO_LEFT_LOWER").val('${dataMap.cfi_left_lower}');
        $("#paraMap1_CFO_RIGHT_LOWER").val('${dataMap.cfi_right_lower}');
        $("#paraMap1_CFO_MIDDLE").val('${dataMap.cfi_middle}');
        $("#paraMap1_CFO_ITEM_CURUSER").val('${dataMap.cfo_item_curuser}');
        
        $("#cfo_id").val('${dataMap.id}');
        $("#assis_type").val('${dataMap.assistanttooltype}');
        
        
        
        if($("#assis_type").val()!='2'){//为刮到不能修改这几个属性值
 
             	$("#paraMap1_CFO_LEFT_TOP").attr("readonly","readonly");
	         	$("#paraMap1_CFO_LEFT_TOP").addClass("readonly");
	         	
	         	$("#paraMap1_CFO_RIGHT_TOP").attr("readonly","readonly");
	         	$("#paraMap1_CFO_RIGHT_TOP").addClass("readonly");
	         	
	         	
	         	$("#paraMap1_CFO_LEFT_LOWER").attr("readonly","readonly");
	         	$("#paraMap1_CFO_LEFT_LOWER").addClass("readonly");
	         	
	         	
	         	$("#paraMap1_CFO_RIGHT_LOWER").attr("readonly","readonly");
	         	$("paraMap1_CFO_RIGHT_LOWER").addClass("readonly");
	         	
	         	$("#paraMap1_CFO_MIDDLE").attr("readonly","readonly");
	         	$("#paraMap1_CFO_MIDDLE").addClass("readonly");
        }
        
        
        
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
