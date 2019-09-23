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
		$(function(){
        		$("#paraMap1_WORK_TIME").val('${dataMap.nowDate}');
        		$("#paraMap1_WORK_HOURS").val('7.5');
        		$("#paraMap1_WORK_EXTRA_HOURS").val('0');
        		});
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
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
            		<div class="hd">
            		<div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />：
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="paraMap1@0#DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="paraMap1@0#DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                
                </div>

            		
            		   
            		    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="formId" value="b3b00ad970894885bd60a59ca296580c" />
				<input type="hidden" name=iframeId value="${iframeId}">
				<input type="hidden" id="isOpener" value="1" />
				<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
				
	<table class="basic-table" width="90%">
	<input type="hidden" name="formIds" value="b3b00ad970894885bd60a59ca296580c" />
	<input type="hidden" name="b3b00ad970894885bd60a59ca296580c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="paraMap1@0#CREATE_USER" id="paraMap1_CREATE_USER" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}" />">
	<input type="hidden" name="paraMap1@0#STAFF_NAME" id="paraMap1_STAFF_NAME" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}" />">
		<s:set name="_$viewId" value="'4bfe0ad145584d2aaed1a020ed3b2bfd'" />
		<s:set name="_$formId_1" value="'b3b00ad970894885bd60a59ca296580c'" />
		<s:set name="_$type" value="'add'" />
		<tr >
		        
			<td style="width: 70px;text-align: right;"><bu:uitn colNo="STAFF_NAME" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><input type="text" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}" />" disabled="disabled" class="input" /></td>
			<td style="text-align: right;"><span class="dot"></span><bu:uitn colNo="WORK_TYPE" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec" style="width: 230px;"><bu:ui colNo="WORK_TYPE" formId="b3b00ad970894885bd60a59ca296580c" value="%{WORK_TYPE}" formIndex="1" /></td>
			
		</tr>
		<tr>
			<td style="text-align: right;"><bu:uitn colNo="CUSTOMER_ID" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="CUSTOMER_ID" formId="b3b00ad970894885bd60a59ca296580c" value="%{CUSTOMER_ID}" formIndex="1" /></td>
			<td style="text-align: right;"><span class="dot"></span><bu:uitn colNo="PROJECT_ID" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="PROJECT_ID" formId="b3b00ad970894885bd60a59ca296580c" value="%{PROJECT_ID}" formIndex="1" /></td>
		</tr>
		<tr>
			<td style="text-align: right;"><bu:uitn colNo="TASK_ARRANGE_PEOPLE" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="TASK_ARRANGE_PEOPLE" formId="b3b00ad970894885bd60a59ca296580c" value="%{TASK_ARRANGE_PEOPLE}" formIndex="1" /></td>
			<td style="text-align: right;"><span class="dot"></span><bu:uitn colNo="WORK_TIME" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="WORK_TIME" formId="b3b00ad970894885bd60a59ca296580c" value="%{WORK_TIME}" formIndex="1" /></td>
		</tr>
		<tr>
			<td style="text-align: right;"><bu:uitn colNo="WORK_HOURS" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="WORK_HOURS" formId="b3b00ad970894885bd60a59ca296580c" value="%{WORK_HOURS}" formIndex="1" /></td>
			<td style="text-align: right;"><span class="dot"></span><bu:uitn colNo="WORK_EXTRA_HOURS" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec" width="30%"><bu:ui colNo="WORK_EXTRA_HOURS" formId="b3b00ad970894885bd60a59ca296580c" value="%{WORK_EXTRA_HOURS}" formIndex="1" /></td>
		</tr>
		<tr>
			<td style="text-align: right;vertical-align: top;padding-top: 8px;"><bu:uitn colNo="REMARK"  formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td colspan="3" height="80px" style="padding-left: 5px;"><bu:ui colNo="REMARK" formId="b3b00ad970894885bd60a59ca296580c" value="%{REMARK}" formIndex="1" /></td>
		</tr>
		<tr>
			<td align="left" style="text-align: right;"></td>
			<td colspan="3" style="padding-left: 5px;">注：1、工作时长为扣除中午休息的实际工作时长 <br />
					&#x3000;&#x3000;2、一天工作时长超过7.5小时即为加班时长 <br />
					&#x3000;&#x3000;3、工作时长和加班时长允许保留一位小数</td>
		</tr>
	</table>
			<bu:jsVal formId="b3b00ad970894885bd60a59ca296580c" formIndex="1" />
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
