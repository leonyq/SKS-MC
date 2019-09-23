<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="服务配置" /> <dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}webservice/ClientMgrAction_editConfig.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="服务器类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict id="type" name="config.type" dictCode="WS_CLIENT_TYPE" cssClass="_VAL_NULL"/>
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口包路径" />
						</td>
						<td style="width: 270px;">
							<s:textfield  id="packagePath" name="config.packagePath" cssClass="_VAL_NULL" disabled="true"/>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口描述文件地址" />
						</td>
						<td colspan='4'>
							<s:textfield  id="serverAddress" name="config.serverAddress" cssClass="_VAL_NULL" cssStyle="width:100%" />
						</td>
					</tr>
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口说明" />
						</td>
						<td colspan='4'>
							<s:textfield id="memo" maxlength="65" name="config.memo"   cssStyle="width:100%" />
						</td>
					</tr> 
					<tr>
						<td colspan="5">
							
							<blockquote class="layui-elem-quote">
							<span class="Point"><dict:lang value="点击“生成类源码”按钮，填充" /> </span>
							</blockquote>
						</td>
					</tr>
					<tr>
						<td  style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口名称" />
						</td>
						<td style="width: 270px;">
							<s:textfield id="name" name="config.name" cssClass="_VAL_NULL" disabled="true"/>
						</td>
						<td>&nbsp;</td>
						<td  style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="类源码" />
						</td>
						<td style="width: 270px;">
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
							<s:textfield  id="stubFullName" name="config.stubFullName" cssClass="_VAL_NULL input_indent"  disabled="true"/>
							<i class="layui-icon layui-icon-search" onclick="viewCode();" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
							<s:textarea  id="stubCode" name="config.stubCode" cssStyle="display:none" disabled="true"></s:textarea>
							<%-- 
							<a href="javascript:void(0);" onclick="viewCode();">
								<dict:lang value="查看" />
							</a>--%>
						</td>
					</tr> 
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="*" onclick="/*add(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<s:hidden name="config.id"></s:hidden>
				<s:hidden  name="config.moduleId" ></s:hidden>
				<s:hidden name="config.createUserId"></s:hidden>
				<s:hidden name="config.createTime"></s:hidden>
				<s:hidden name="config.deptId"></s:hidden>
				<s:hidden name="config.classId"></s:hidden>
				<input type="hidden" id="MWNM_ID" name="config.MWNM_ID" value="<s:property value="paraMap.id"/>"/>
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
	$(function(){
		$("#packagePath").attr("lay-verify","required");
		$("#serverAddress").attr("lay-verify","required");
		$("#name").attr("lay-verify","required");
	});
	layui.use('form', function(){
		  var form = layui.form;
		  form.render("select");
		  form.on('submit(*)', function(data){
	  			add();
	  	 	});
	});
	function viewCode(){
		var piframeName = window.frameElement.name;
		var url = "${path}webservice/ClientMgrAction_toViewCode.ms?paraMap.piframeName="+piframeName;
		showPopWin(url, '99%', '99%',null,"<dict:lang value="查看源码"/>");
	}
	
	
	var isSubmit = false;
	function reloadPg(msg){//alert(1);
		isSubmit = false;
		var obj = {};
		obj.isFramesetMethod=true;
		obj.methodName="reloadPg";
		obj.frameName="mainFrame";
		obj.methodParames=msg;
		runMethod(obj);
		//window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){//alert(2);
		isSubmit = false;
		util.alert(msg);
	}
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		document.forms.addForm.submit();
		isSubmit = true;
	}
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>