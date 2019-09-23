<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="视图模型" /> <dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<style>
	html,body{
              height: 99%;
         }
    .all{
    	margin:0px;
    	height:100%
    }
  
	.textarea-wrap {
		height:calc(100% - 400px)
	}
	.textarea-wrap table, 
	.textarea-wrap table tr,
	.textarea-wrap table tr textarea
	{
		height: 100%;
	}


</style>
<body>
	<div class="all">
	<%--
		<table class="func_table">
			<tr>
				<td width="100%" align="right">
					<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="">
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
				</td>
			</tr>
		</table>--%>
		<div  class="add_table_div" style="height: 100%;padding: 0 11%!important">
			<form id="add_form" class="layui-form"  name="addForm" action="${path}sys/BussModelAction_editView.ms" method="post" target="submitFrame" style="height: 100%">
				<s:hidden name="paraMap.ID" />
				<s:hidden name="paraMap.MID" />
				<table class="add_table" >
					<tr style="height:53px;">
						<td class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="视图模型名称" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.VIEW_NAME" value="%{dataMap.VIEW_NAME}" id="paraMap_VIEW_NAME" maxlength="60" onkeyup="javascript:util.replaceLikeVal(this)"/>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<dict:lang value="视图类型" />
						</td>
						<td class="widget">
							<dict:viewDict dictCode="VIEW_TYPE" dictValue="%{dataMap.VIEW_TYPE}" />
						</td>
					</tr>
					<tr style="height:35px;">
						<td class="tr1 title">
							<dict:lang value="自定义类名" />
						</td>
						<td class="widget" id="CLASS_NAME_TEXT">
							<s:property value="dataMap.CLASS_NAME"/>
						</td>
						<td>&nbsp;</td>
						<td class="tr1 title">
							<dict:lang value="关联表单" />
						</td>
						<td class="widget">
							<s:iterator value="listData">
								[<s:property value="FORM_NAME" />]
							</s:iterator>
						</td>
					</tr>
					<tr style="height:55px;">
						<td class="tr1 title">
							<dict:lang value="自定义视图类" />
						</td>
						<td class="widget" >
							<a href="javascript:void(0);" class='layui-btn layui-btn-xs' onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>');">
							<s:if test="@com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID)">
								<dict:lang value="新增" />
							</s:if>
							<s:else>
								<dict:lang value="编辑" />
							</s:else>
							</a>
						</td>
						<td>&nbsp;</td>
						<td class="tr1 title">
							<dict:lang value="视图/数据显示前执行类" />
						</td>
						<td class="widget"><s:property value="dataMap.CLASS_NAME_BF"/>
							<a href="javascript:void(0);" class='layui-btn layui-btn-xs' onclick="showEditCodeBf('<s:property value="dataMap.MS_CLASS_CODE_ID_BF"/>','<s:property value="dataMap.ID"/>');">
							<s:if test="@com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID_BF)">
								<dict:lang value="新增" />
							</s:if>
							<s:else>
								<dict:lang value="编辑" />
							</s:else>
							</a>
						</td>
					</tr>
					<tr style="height:53px;">
						<td  class="tr1 title">
							<dict:lang value="视图公用父类" />
						</td>
						<td class="widget">
							<a href="javascript:void(0);" class='layui-btn layui-btn-xs' onclick="showEditSuperCode('<s:property value="dataMap.MS_SUPERCLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>');">
							<s:if test="@com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_SUPERCLASS_CODE_ID)">
								<dict:lang value="新增" />
							</s:if>
							<s:else>
								<dict:lang value="编辑" />
							</s:else>
							</a>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="视图编码" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.VIEW_MODEL_CODE" value="%{dataMap.VIEW_MODEL_CODE}" id="paraMap_VIEW_MODEL_CODE" />
							<s:hidden name="paraMap2.VIEW_MODEL_CODE_OLD" value="%{dataMap.VIEW_MODEL_CODE}" />
						</td>
					</tr>
					<tr style="height:55px;"><%--
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="数据权限控制" />
						</td>
						<td class="widget">
							<dict:selectDict dictCode="IS_DATA_AUTH" dictValue="%{dataMap.IS_DATA_AUTH}" name="paraMap.IS_DATA_AUTH"  />
						</td>
						<td>&nbsp;</td>--%>
						<td  class="tr1 title">
							<dict:lang value="组织机构是否启用新联动" />
						</td>
						<td class="widget" >
							<dict:selectDict dictCode="AUTH_IS_GANGED" dictValue="%{dataMap.AUTH_IS_GANGED}" name="paraMap.AUTH_IS_GANGED"  />
						</td>
						<td>&nbsp;</td>
						<td   class="tr1 title">
							<dict:lang value="默认分页记录数" />
						</td>
						<td class="widget">
							<dict:selectDict dictCode="PAGE_SHOW"  dictValue="%{dataMap.DEF_PAGE_NUM}" cssClass="dept_select" style="width:153px;" onchange="deptChange(this)" name="paraMap.DEF_PAGE_NUM" id="paraMap_DEF_PAGE_NUM"/>
						</td>	
						
					</tr>
					<tr style="height:53px;">
					<c:if test="${mcIsOpenAuth=='0' && isOldAuthDataPattern=='1'}">
					 
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="数据权限控制" />
						</td>
						<td class="widget">
							<dict:selectDict dictCode="IS_DATA_AUTH" dictValue="%{dataMap.IS_DATA_AUTH}" name="paraMap.IS_DATA_AUTH"  />
						</td>
					    <td>&nbsp;</td>
					</c:if>
					
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="是否工作流表单" />
						</td>
						<td class="widget">
							<dict:selectDict dictCode="IS_FLOW_FORM" dictValue="%{dataMap.IS_FLOW_FORM}" name="paraMap.IS_FLOW_FORM"  />
						</td>
					</tr>
				</table>
				<div class="textarea-wrap">
					<table class="add_table">
						<tr id="sql_code">
						<td class="tr1 title"><dict:lang value="sql过滤条件" /></td>
						<td colspan="4"><span style="position: relative;top: 4px;">数据库适配</span>
							<input type="radio" lay-filter="codeRadio" id="codeType_comm" title='通用语句'
							name="codeType" value="comm" onclick="showSql(this)"
							style="width: 20px;"> 
							<input type="radio" lay-filter="codeRadio" id="codeType_oracle" title='ORACLE' name="codeType"
							value="oracle" onclick="showSql(this)" style="width: 20px;">
							<input type="radio" lay-filter="codeRadio" id="codeType_sqlserver" title='SQLSERVER'
							name="codeType" value="sqlserver" onclick="showSql(this)"
							style="width: 20px;"> 
							<input type="radio" lay-filter="codeRadio" id="codeType_mysql" title='MYSQL' name="codeType" value="mysql"
							onclick="showSql(this)" style="width: 20px;"> 
							<input type="radio" lay-filter="codeRadio" id="codeType_pg" title='PG' name="codeType"
							value="pg" onclick="showSql(this)" style="width: 20px;">

<textarea title="不用where 比如主表T1.NAME='XXX'" class="layui-textarea code" name="comm_sql" id="comm_sql" style="width:100%;display: none;"><s:property value="dataMap.COMM_SQL" /></textarea> 
<textarea title="不用where 比如主表T1.NAME='XXX'" class="layui-textarea code" name="oracle_sql" id="oracle_sql" style="width:100%;display: none;"><s:property value="dataMap.ORACLE_SQL" /></textarea> 
<textarea title="不用where 比如主表T1.NAME='XXX'" class="layui-textarea code" name="sqlserver_sql" id="sqlserver_sql" style="width:100%;display: none;"><s:property value="dataMap.SQLSERVER_SQL" /></textarea> 
<textarea title="不用where 比如主表T1.NAME='XXX'" class="layui-textarea code" name="mysql_sql" id="mysql_sql" style="width:100%;display: none;"><s:property value="dataMap.MYSQL_SQL" /></textarea> 
<textarea title="不用where 比如主表T1.NAME='XXX'" class="layui-textarea code" name="pg_sql" id="pg_sql" style="width:100%;display: none;"><s:property value="dataMap.PG_SQL" /></textarea>
							
							</td>


					</tr>
					</table>
				</div>
			<div class="ptop_10 txac">
			 	<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			</div>
			</form>
		</div>
	</div>
	<div><s:property value="dataMap.MYSQL_SQL" /></div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var db_dialect="<s:property value="@com.more.fw.core.common.method.CommMethodMc@getCUR_DB_DIALECT()"/>";
	var isSubmit = false;


	
	function init()
	{
		if($("#"+db_dialect+"_sql").val() != ""){
			$("#"+db_dialect+"_sql").show();
			$("#codeType_"+db_dialect).attr("checked",true);
		}else{
			$("#comm_sql").show();
			$("#codeType_comm").attr("checked",true);
		}
		
	}
		function showSql(thisObj){
		hiddenSql();
		$("#"+thisObj.value+"_sql").show();
	}
	
	function hiddenSql(){
		$("#comm_sql").hide();
		$("#oracle_sql").hide();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").hide();
		$("#pg_sql").hide();
	}
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reloadPg(msg){
		isSubmit = false;
		if("" != msg){
			util.alert(msg);
		}
		document.forms.addForm.target = "_self";
		document.forms.addForm.action = "${path}sys/BussModelAction_forEditView.ms";
		document.forms.addForm.submit();
	}
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		if(!valEnglish()){
			return ;
		}
		document.forms.addForm.submit();
		isSubmit = true;
	}
        
         //校验只允许输入英文且不能为空
    function valEnglish(){
    	var VIEWMODELCODE=document.getElementById("paraMap_VIEW_MODEL_CODE");
    	if(val.isBlank(VIEWMODELCODE)){
    		_alertValMsg(VIEWMODELCODE,"<dict:lang value="视图模型编码" /> -- <dict:lang value="不能为空" />");
   			return false;
    	}
    	var reg=/^[a-zA-Z\d_]+$/;
    	var VIEWMODELCODEVALUE=VIEWMODELCODE.value;
    	if(!reg.test(VIEWMODELCODEVALUE)){
    		_alertValMsg(VIEWMODELCODE,"<dict:lang value="视图模型编码" /> -- <dict:lang value="只能为英文、数字、下划线" />");
    		return false;
    	}
    	return true;
    }   
	function valData(){
		var paraMapVIEWNAME = document.getElementById("paraMap_VIEW_NAME");
   	if(val.isBlank(paraMapVIEWNAME)){
   		_alertValMsg(paraMapVIEWNAME,"<dict:lang value="视图模型名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	
   	//跨站脚本漏洞处理lth
   	if(paraMapVIEWNAME.value.indexOf("'")!=-1 || paraMapVIEWNAME.value.indexOf('"')!=-1 || paraMapVIEWNAME.value.indexOf('<')!=-1 || paraMapVIEWNAME.value.indexOf('>')!=-1){
   	 	paraMapVIEWNAME.value = paraMapVIEWNAME.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"");
   		_alertValMsg(paraMapVIEWNAME,"<dict:lang value="视图模型名称" /> -- <dict:lang value="不能输入单引号双引号<>" />");
   		return false;
   	}
   	
   	/*
   	var paraMapVIEWTYPE = document.getElementById("paraMap_VIEW_TYPE");
   	if(val.isBlank(paraMapVIEWTYPE)){
   		_alertValMsg(paraMapVIEWTYPE,"<dict:lang value="视图类型" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	*/
    
		return true;
	}
	
	function showEditCode(codeId,OWNER_ID){
		var OWNER_TYPE = "<s:property value='@com.more.fw.core.common.method.ConstantsMc@FUN_REL_CODE_VIEW' />";
		var tableName = "MS_VIEW_MODEL";
		var colName = "MS_CLASS_CODE_ID";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.tableName="+tableName+"&paraMap.colName="+colName;
		url += "&paraMap.tpl=editCode&mcIframeName="+window.frameElement.name+"&module=editView";
		showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
	}

	function showEditCodeBf(codeId,OWNER_ID){
		var OWNER_TYPE = "<s:property value='@com.more.fw.core.common.method.ConstantsMc@EXEC_VEIW_BEFORE_CODE' />";
		var tableName = "MS_VIEW_MODEL";
		var colName = "MS_CLASS_CODE_ID_BF";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.tableName="+tableName+"&paraMap.colName="+colName;
		url += "&paraMap.tpl=editCodeBf&mcIframeName="+window.frameElement.name+"&module=editView";;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
	}

	function showEditSuperCode(codeId,OWNER_ID){
		var OWNER_TYPE = "<s:property value='@com.more.fw.core.common.method.ConstantsMc@FUN_REL_CODE_VIEW' />";
		var tableName = "MS_VIEW_MODEL";
		var colName = "MS_SUPERCLASS_CODE_ID";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.tableName="+tableName+"&paraMap.colName="+colName;
		url = url + ("&paraMap.tpl=editSuperCode&mcIframeName="+window.frameElement.name+"&module=editView");
		showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
	}
	

	function updateCLASS_NAME_TEXT(id,txt){
		//$("#CLASS_NAME_TEXT").html(txt);
		reloadPg("");
	}

	layui.use('form', function(){
  	  var form = layui.form;
  	  form.on('radio(codeRadio)', function(data){
	 	 hiddenSql();
		$("#"+data.value+"_sql").show();
		});
  });
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>