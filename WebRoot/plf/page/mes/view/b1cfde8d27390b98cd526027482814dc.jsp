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
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="62e5f8f76eab45ddbcf24c091ee691ce" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="62e5f8f76eab45ddbcf24c091ee691ce" />
	<input type="hidden" name="62e5f8f76eab45ddbcf24c091ee691ce" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_CSI_ADDRESS" name="paraMap1@0#CSI_ADDRESS" value="esop">
		<s:set name="_$viewId" value="'6b46ff27500f401ab35cfad900791286'" />
		<s:set name="_$formId_1" value="'62e5f8f76eab45ddbcf24c091ee691ce'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:63px"/><span class="dot">*</span><bu:uitn colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_SN}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:63px"/><span class="dot">*</span><bu:uitn colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" style="width:230px" colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		     <td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_PRODUCT_STEP}" formIndex="1" /></bu:td>

            
             <td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_PROCESS_FACE}" formIndex="1" /></bu:td>

				
		</tr>
		<tr>
		        <td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_GROUP}" formIndex="1" /></bu:td>

			
		        <td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
		        <bu:td cssClass="dec" colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_MODEL_CODE}" formIndex="1" /></bu:td>
	
		</tr>
		
		<tr>
		    <td class="name" /><bu:uitn colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{PRODUCT_NAME}" formIndex="1" /></bu:td>
                      
			<td class="name" /><bu:uitn colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{PRODUCT_STANDARD}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
		        <td class="name" /><bu:uitn colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_VALID_FLAG}" formIndex="1" /></bu:td>
             
			<td class="name" /><bu:uitn colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
		       <td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_VERSION}" formIndex="1" /></bu:td>
         
			<td class="name" /><bu:uitn colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_ADDRESS}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
		        <td class="name" /><bu:uitn colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" colspan="3"><bu:ui colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_MEMO}" style="height:80px;width:100%;" formIndex="1" /></bu:td>

		
		</tr>
	</table>
			<bu:jsVal formId="62e5f8f76eab45ddbcf24c091ee691ce" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
        document.getElementById("paraMap1_CSI_VALID_FLAG_1").checked=true;
        
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
