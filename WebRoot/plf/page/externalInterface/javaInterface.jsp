<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="对外接口java" /><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
		<%-- 
		  <table class="func_table">
	    	<tr>
	      <td width="100%" align="right">
					<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="botton_img_add">
	      </td>
	      </tr>
			</table>--%>
			<form id="editForm" class="layui-form" name="editForm" action="${path}exInterface/externalInterfaceAction_addJava.ms" method="post" target="submitFrame">
				<input id="ID" name="paraMap.ID" type="hidden" value="<s:property value='dataMap.ID' />" readonly="readonly" class="readonly"  style="width:80%" />	
				<table class="add_table">
					<%-- 
					<tr>
						<td colspan="6">
							<span class="Point"><span class="Eng">*</span><dict:lang value="为必填项" />
							</span>
						</td>
					</tr>
					
					<blockquote class="layui-elem-quote">
						<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
					</blockquote>--%>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="类源码" />
						</td>
						<td >
							<div id="paraMap_SEARCH_UI_div" style="width:80%" class="layui-input-inline">
							<input id="className1" name="paraMap.className" lay-verify="required" type="text" value="<s:property value='dataMap.CLASS_NAME' />" readonly="readonly" class="readonly input_indent"  style="width:100%" />
							<i class="layui-icon layui-icon-search" onclick="showEditCode();" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
							<input id="codeType" name="paraMap.codeType" type="hidden" value="<s:property value='dataMap.codeType' />"/>
							<input id="classId" name="paraMap.classId" type="hidden" value="<s:property value='dataMap.classId' />"/>
							<input id="classCode" name="paraMap.classCode" type="hidden" value="<s:property value='dataMap.classCode' />"/>
							<a href="javascript:void(0);" onclick="showEditCode()" style="display: none;">
							<s:if test="null ==dataMap || @com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.classId)">
								<dict:lang value="新增" />
							</s:if>
							<s:else>
								<dict:lang value="编辑" />
							</s:else>
							</a>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="类说明" />
						</td>
						<td width="270px;">
							<s:textarea name="paraMap.CLASS_DESC" value="%{dataMap.CLASS_DESC}" id="paraMap_CLASS_DESC"  rows="4" cssStyle="width:80%" />
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="保存" />" lay-submit="" lay-filter="*" onclick="/*edit(this);*/" class="layui-btn">
					<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<input type="hidden" id="MWNM_ID" name="paraMap.MWNM_ID" value="<s:property value="paraMap.id"/>"/>
				<input type="hidden" name="paraMap.MC_ID_MYSQL" value="<s:property value="dataMap.MC_ID_MYSQL" />" />
				<input type="hidden" name="paraMap.MC_ID_SQLSERVER" value="<s:property value="dataMap.MC_ID_SQLSERVER" />" />
				<input type="hidden" name="paraMap.MC_ID_ORACLE" value="<s:property value="dataMap.MC_ID_ORACLE" />" />
				<input type="hidden" name="paraMap.MC_ID_BASE" value="<s:property value="dataMap.MC_ID_BASE" />" />
				<input type="hidden" name="paraMap.MC_ID_PG" value="<s:property value="dataMap.MC_ID_PG" />" />
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
	$(function(){
		$("#paraMap_CLASS_DESC").attr("lay-verify","required|checkSi");
	});
	layui.use('form', function(){
	 	  var form = layui.form;
	 	  //监听提交
	 	 form.verify({
	 		checkSi: function(value,item){
				   if (value.length>200) {
		                return '类说明:字数不得多于200个字符';
		            }
			    }
	    });
	 	form.on('submit(*)', function(data){
	 		edit();
	 	});
	 });
	function edit(thisObj){
		var len = $("#paraMap_CLASS_DESC").val();
		if(len.length>200){
			util.alert("<dict:lang value="类说明:字数不得多于200个字符" />...");
			return ;
		}
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		var classCode = $("#classCode").val();
		var paraMap_CLASS_DESC = $("#paraMap_CLASS_DESC").val();
		if(classCode==""){
			util.alert("<dict:lang value="请写类" />...");
			return ;
		}
		if(paraMap_CLASS_DESC ==""){
			util.alert("<dict:lang value="类说明不能为空" />...");
			return ;
		}
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function showEditCode(){
		var classId = $("#classId").val();
		var piframeName = window.frameElement.name;
		var url = "${path}exInterface/externalInterfaceAction_toCommClass.ms?paraMap.tableName=MS_JCLZ_MODEL&paraMap.colName=MS_CLASS_CODE_ID&paraMap.tpl=jclz&paraMap.CODE_ID="+classId+"&paraMap.piframeName="+piframeName+"&paraMap.toFlag=interface";
		showPopWin(url, '99%', '99%',null,"<dict:lang value="修改类源码"/>");
	}
	function updateCodeData(codeType,className,classCode) {
		$("#codeType").val(codeType);
		$("#className1").val(className);
		$("#classCode").val(classCode);
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>