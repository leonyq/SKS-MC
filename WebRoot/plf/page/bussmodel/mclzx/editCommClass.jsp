<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="自定义类" /><dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
		
	</jsp:include>
	 <link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
	
			<form id="editForm" name="editForm" class="layui-form" action="${path}sys/MClzMgrAction_editCommClass.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.ID" />
				<table class="add_table">
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="类说明" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required" name="paraMap.CLASS_DESC" maxlength="60" value=<s:property value='dataMap.CLASS_DESC' /> id="paraMap_CLASS_DESC">
							<%--<s:textfield  name="paraMap.CLASS_DESC" value="%{dataMap.CLASS_DESC}" id="paraMap_CLASS_DESC" maxlength="60" /> --%>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title">
							<dict:lang value="类源码" />
						</td>
						<td style="width: 270px;">
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
							<input id="MS_CLASS_CODE_ID" type="text" value="<s:property value='dataMap.CLASS_NAME' />" readonly="readonly" class="readonly input_indent" />
							<i class="layui-icon layui-icon-search" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
							<%-- 
							<s:if test="null ==dataMap || @com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID)">
								<a href="javascript:void(0);" class="layui-btn layui-btn-normal layui-btn-xs" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');"><dict:lang value="新增" /></a>
							</s:if>
							<s:else>
								<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');"><dict:lang value="编辑" /></a>
							</s:else>
							--%>
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
			 
					 <input type="button" value="提交" class="layui-btn" lay-submit lay-filter="*" onclick="/*edit(this)*/">
					<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
			</form>
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	
	var isSubmit = false;
	function reloadPg(msg){
		var obj = {};
		obj.isFramesetMethod=true;
		obj.methodName="reloadPg";
		obj.frameName="mainFrame";
		obj.methodParames=msg;
		runMethod(obj);
		//window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	layui.use('form', function(){
	 	  var form = layui.form;
	 	 
	 	form.on('submit(*)', function(data){
	 		document.forms.editForm.submit();
	 	});
	 });
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_COMM_CLASS}"/>";
		var piframeName = window.frameElement.name;
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName=MS_MCLZX_MODEL"
				/* +tableName */
				+"&paraMap.colName="+colName+"&paraMap.piframeName="+piframeName+"&paraMap.toFlag=classManage";
		showPopWin(url, '99%', '99%',null,"<dict:lang value="修改类源码"/>");
		//window.open(url);
	}
	
	function updateCLASS_NAME_TEXT(id,txt){
		$("#"+id).val(txt);
		var mcIframeName = $("#mcIframeName").val();
		window.parent.isModify=true;
		//closePopWin();
		window.location.href = "${path}sys/MClzMgrAction_showEditCommClass.ms?paraMap.ID=<s:property value='paraMap.ID' />&mcIframeName="+mcIframeName;
	}
        
	function valData(){
		var paraMap_CLASS_DESC = document.getElementById("paraMap_CLASS_DESC");
   	if(val.isBlank(paraMap_CLASS_DESC)){
   		_alertValMsg(paraMap_CLASS_DESC,"<dict:lang value="类说明" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}
	
	function init(){
	}
	
	init();

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>