<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="服务配置" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>
	<style type="text/css">
         html,body{
             height: 99%;
         }
         .add_table_div{
         	height:100%;
         }
         .layui-form{
         	height:100%;
         }
         .add_table{
         	height:85%;
         }
         .all{
         	height:100%;
         	margin-bottom:0px;
         }
     </style>
<body>

	<div class="all" >
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}httpService/httpMgrAction_addConfig.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				<table class="add_table">
					<%--<tr>
						<td colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr> 
					<blockquote class="layui-elem-quote"><span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span></blockquote>
							--%>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口模块名" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required|checkMod" maxlength="30" id="portModuleName" name="config.portModuleName" value="<s:property value="config.portModuleName"/>" class="_VAL_NULL" />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口方法名" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required|checkMet" maxlength="30" id="portMethodName" name="config.portMethodName"  value="<s:property value="config.portMethodName"/>" class="_VAL_NULL" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="服务类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict name="config.serverType" dictCode="PORT_TYPE" dictValue="${fn:escapeXml(paramMap.serverType)}" />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="请求方法类型" />
						</td>
						<td style="width: 270px;">
						<dict:selectDict name="config.portMethodType"  dictCode="RQ_TYPE" dictValue="${fn:escapeXml(paramMap.portMethodType)}" onchange="changeReType()" id="portMethodTypeChange"/>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="请求报文类型" />
						</td>
						<td style="width: 270px;" >
						<dict:selectDict name="config.requestType" dictCode="RQF_TYPE" dictValue="${fn:escapeXml(paramMap.requestType)}" id="reqTypeDisable" />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="返回报文类型" />
						</td>
						<td style="width: 270px;">
						<dict:selectDict name="config.returnType" dictCode="RS_TYPE" dictValue="${fn:escapeXml(paramMap.returnType)}" />
						</td>		
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口实现类" />
						</td>
						<td colspan="4">
							<div id="paraMap_SEARCH_UI_div" style="width:100%" class="layui-input-inline">
							<input type="text" id="className1" name="config.className" lay-verify="required" style="width:100%" value="<s:property value="config.className"/>" class="_VAL_NULL input_indent" readonly="readonly"/>
							<i class="layui-icon layui-icon-search" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');" style="position: absolute;top:11px;right: 8px;"></i>
							<input type="hidden" id="codeType" name="config.codeType" value="<s:property value="config.codeType"/>"/>
							<textarea type="hidden" id="classCode" name="config.classCode" style="display:none"><s:property value="config.classCode"/></textarea>
							<%-- <a href="javascript:void(0);" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');">
								<dict:lang value="编辑" />
							</a>--%>
						</td>
						
					</tr> 
					<tr style="height:45%;">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口说明" />
						</td>
						<td colspan="4">
							<textarea id="portDetail" lay-verify="required" maxlength="1000" name="config.portDetail" rows="4" style="width:100%;height:100%;" class="_VAL_NULL _VAL_DATABASE" ><s:property value="config.portDetail"/></textarea>
						</td>
					</tr> 
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="*" onclick="/*add(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<input type="hidden" id="portParentModuleID" name="config.portParentModuleID"  value="<s:property value="config.portParentModuleID"/>"/>
				<input type="hidden" id="hdReturnType"  value="<s:property value="config.returnType"/>"/>
				<input type="hidden" id="hdRequestType"  value="<s:property value="config.requestType"/>"/>
				<input type="hidden" id="hdPortMethodType"  value="<s:property value="config.portMethodType"/>"/>
				<input type="hidden" id="hdServerType"  value="<s:property value="config.serverType"/>"/>
				<input type="hidden" id="serverSourceId" name="config.serverSourceId" value="<s:property value="config.serverSourceId"/>"/>
				<input type="hidden" id="Id" name="config.Id"  value="<s:property value="config.Id"/>"/>
				<input type="hidden" id="portStatus" name="config.portStatus"  value="<s:property value="config.portStatus"/>"/>
				<input type="hidden" id="MWNM_ID" name="config.MWNM_ID" value="<s:property value="paraMap.id"/>"/>
				<input type="hidden" name="paraMap.MC_ID_MYSQL" value="<s:property value="paramMap.MC_ID_MYSQL" />" />
				<input type="hidden" name="paraMap.MC_ID_SQLSERVER" value="<s:property value="paramMap.MC_ID_SQLSERVER" />" />
				<input type="hidden" name="paraMap.MC_ID_ORACLE" value="<s:property value="paramMap.MC_ID_ORACLE" />" />
				<input type="hidden" name="paraMap.MC_ID_BASE" value="<s:property value="paramMap.MC_ID_BASE" />" />
				<input type="hidden" name="paraMap.MC_ID_PG" value="<s:property value="paramMap.MC_ID_PG" />" />
			</form>
		</div>
		<%--
		<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="layui-btn">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div> --%>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	function init(){
		var reqMethName=$("#portMethodTypeChange").val();
		if(reqMethName=="2"){
			$("#reqTypeDisable").val("1");
			$("#reqTypeDisable").attr("disabled",true);
		}
	}
	$(function(){
		$("#portMethodTypeChange").attr("lay-filter","changeReType");
	});
	layui.use('form', function(){
	  	  var form = layui.form;
	  		form.on('select(changeReType)',function(data){   
	  		  var val=data.value;
		  		if(val=="2"){
					$("#reqTypeDisable").attr("disabled","disabled");
					$("#reqTypeDisable").val("1");
				}else{
					$("#reqTypeDisable").removeAttr("disabled");
				}
		  		form.render("select");
			});
	  		form.verify({
	  			checkMod: function(value,item){
	  				var myReg = /^[a-zA-Z0-9_]{0,}$/;
	  				if(!myReg.test(value)){
	  					return "接口模块名只能是字母、数字、_";
	  				}
	  			},
	  			checkMet: function(value,item){
	  				var myReg = /^[a-zA-Z0-9_]{0,}$/;
	  				if(!myReg.test(value)){
	  					return "接口方法名只能是字母、数字、_";
	  				}
	  			}
	  	    });
	  		form.on('submit(*)', function(data){
		 		add();
		 	});
	  		
		});
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var classId=$("#serverSourceId").val();
		var piframeName = window.frameElement.name;
		var url = "${path}httpService/httpMgrAction_toEditCode.ms?paraMap.tableName=MS_HTTP_SERVER_MANAGER&paraMap.colName=SERVER_SOURCE_ID&paraMap.tpl=httpImpl&paraMap.CODE_ID="+classId+"&paraMap.piframeName="+piframeName+"&paraMap.toFlag=interface";
		showPopWin(url, '99%', '99%',null,"<dict:lang value="修改类源码"/>");
	}
	
	function updateCodeData(codeType,className,classCode) {
		$("#codeType").val(codeType);
		$("#className1").val(className);
		$("#classCode").val(classCode);
	}
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
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
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		if(!val.valDataBaseSetData()){
			
			return ;
		}
		var portModuleName = $("#portModuleName").val();
		var portMethodName = $("#portMethodName").val();
		var myReg = /^[a-zA-Z0-9_]{0,}$/;
		if(!myReg.test(portModuleName)){
			util.alert("<dict:lang value="接口模块名只能是字母、数字、_" />");
			return ;
		}
		if(!myReg.test(portMethodName)){
			util.alert("<dict:lang value="接口方法名只能是字母、数字、_" />");
			return ;
		}
		document.forms.addForm.submit();
		isSubmit = true;
	}
	function changeReType(){
		var methodName=$("#portMethodTypeChange").val();
		if(methodName=="2"){
			$("#reqTypeDisable").attr("disabled",true);
			$("#reqTypeDisable").val("1");
		}else{
			$("#reqTypeDisable").attr("disabled",false);
		}
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>