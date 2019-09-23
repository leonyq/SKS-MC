<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="自定义类" /><dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<style>
html,body{
	height:99%;
}
.all{

	height:85%;
}
.add_table_div{
	height:100%;
}
.layui-form{
	height:100%;
}
.add_table{
	height:100%;
	}
.widget .layui-form-select{
width:725px;
}
</style>
<body>
<input type="hidden" value='<dict:lang value="编辑" />' id="hrefShowActionInfo"/>
<input type="hidden" value='' id="preAceCode"/>


 

	<div class="all">
		<div class="add_table_div">
			<form id="editForm" class="layui-form" name="editForm" action="${path}sys/JClzAction_updateCommClass.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.ID" />
				<s:hidden name="paraMap.clsCode" id="paraMap_clsCode"/>
				<s:hidden name="paraMap.CLASS_NAME" id="paraMap_CLASS_NAME" />
				
				<s:hidden name="paraMap.codeType" />
				<input type="hidden" id="codetype" value='<s:property value='dataMap.codetype' />' /> 
		          <input type="hidden"  value='<s:property value='dataMap.MS_CLASS_CODE_ID' />' 
           name="paraMap.MS_CLASS_CODE_ID" id="paraMap_MS_CLASS_CODE_ID"/>
				<table class="add_table">
					<s:if test="${isOpenAuth==0}">
						<s:hidden name="paraMap.USER_DATA_AUTH"></s:hidden>
					</s:if>
					<s:else>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="组织机构" />
						</td>
						<td style="width: 270px;"  class="widget">
							
							  <select name="paraMap.USER_DATA_AUTH"  lay-verify="required"  id="userDataAuth" lay-search>
							  
							       <c:forEach items="${dataAuthMap}" var="listData">
							         <s:if test="${paraMap.USER_DATA_AUTH==null&&dataAuthTop== listData.ID}">
							       		<option value="${listData.ID}" selected="selected"><dict:lang value="${listData.NAME}" /></option>
							       </s:if>
							       <s:elseif  test="${listData.ID==paraMap.USER_DATA_AUTH}">
							       	<option value="${listData.ID}" selected="selected"><dict:lang value="${listData.NAME}" /></option>
							       </s:elseif>
							       <s:else>
	       							   <option value="${listData.ID}"><dict:lang value="${listData.NAME}" /></option>
	       							</s:else>
	  							   </c:forEach>
							   </select>
						</td>
					</tr>
					</s:else>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口名称" />
						</td>
						<td colspan="4">
							<s:textfield  id="MODEL_NAME" cssStyle="width:100%" maxlength="100" name="paraMap.MODEL_NAME"  cssClass="_VAL_NULL _VAL_DATABASE" />
						</td>
					</tr>
					<tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口说明" />
						</td>
						<td colspan="4">
							<s:textfield  maxlength="300" cssStyle="width:100%" id="MODEL_MEMO" name="paraMap.MODEL_MEMO" cssClass="_VAL_NULL _VAL_DATABASE"  />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="类源码" />
						</td>
						<td colspan="4">
							<div id="paraMap_SEARCH_UI_div" style="width:100%" class="layui-input-inline">
							
							<input id="MS_CLASS_CODE_ID" type="text" lay-verify="required" value="<s:property value='dataMap.CLASS_NAME' />"
							 readonly="readonly" class="readonly input_indent"  style="width:100%" class="_VAL_NULL" />
							<i class="layui-icon layui-icon-search" onclick="showEditCode();" style="position: absolute;top:11px;right: 8px;"></i>
							
							<a href="javascript:void(0);"  id="hrefShowAction"
							onclick="showEditCode();" style="display: none;">
							<s:if test="null ==dataMap || @com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID)">
								<dict:lang value="新增" />
							</s:if>
							<s:else>
								<dict:lang value="编辑" />
							</s:else>
							</a>
						</td>
					</tr>
					<tr style="height:63%">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="类说明" />
						</td>
						<td colspan="4">
							<s:textarea name="paraMap.CLASS_DESC" value="%{dataMap.CLASS_DESC}" id="paraMap_CLASS_DESC" rows="4" cssStyle="width:100%;height:100%;" />
						</td>
					</tr>
					
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="*" onclick="/*edit(this);*/" class="layui-btn">
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<%--<div id="div_userArgs">
				<div>参数键值对:</div>
				<div>
					<textarea id="userArgs" name="paraMap.userArgs" class="tabIndent"
						wrap="off"	style="word-wrap: normal; width: 50%;height: 200px;"></textarea>
				</div>
				</div>
				--%>
			<s:hidden id="moduleId" name="paraMap.moduleId"/>
			<input
					type="hidden" name="paraMap.MC_ID_MYSQL"
					value="<s:property value="dataMap.MC_ID_MYSQL" />" /><input
					type="hidden" name="paraMap.MC_ID_SQLSERVER"
					value="<s:property value="dataMap.MC_ID_SQLSERVER" />" /><input
					type="hidden" name="paraMap.MC_ID_ORACLE"
					value="<s:property value="dataMap.MC_ID_ORACLE" />" /><input
					type="hidden" name="paraMap.MC_ID_BASE"
					value="<s:property value="dataMap.MC_ID_BASE" />" />	
					
					<input
					type="hidden" name="paraMap.MC_ID_PG"
					value="<s:property value="dataMap.MC_ID_PG" />" />	
							
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
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	$(function(){
		$("#MODEL_NAME").attr("lay-verify","required");
		$("#MODEL_MEMO").attr("lay-verify","required");
		$("#paraMap_CLASS_DESC").attr("lay-verify","required|checkN");
	});
	layui.use('form', function(){
	 	  var form = layui.form;
	 	  //监听提交
	 	 form.verify({
	 		checkN: function(value,item){
		 			if(value.length>300){
		 				return "类说明超过最大字符长度300";
		 			}
			    }
	    });
	 	form.on('submit(*)', function(data){
	 		edit();
	 	});
	 });
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		
		if(isBlankClsCode()) return;
		$("#paraMap_clsCode").val($("#preAceCode").val());
		$("#paraMap_CLASS_NAME").val($("#MS_CLASS_CODE_ID").val());
		var paraMap_CLASS_DESC=$("#paraMap_CLASS_DESC").val();
		if(paraMap_CLASS_DESC.length>300){
			util.alert("类说明超过最大字符长度")
			return
		}
		document.forms.editForm.submit();
		isSubmit = true;
	}
	var url_deal="";
	function showEditCode(){
	
	var codeId=$("#paraMap_MS_CLASS_CODE_ID").val();
	var OWNER_ID='<s:property value="dataMap.ID"/>';
	var CLASS_NAME_TEXT_ID='MS_CLASS_CODE_ID';
	var colName='MS_CLASS_CODE_ID';
	var codetype = $("#codetype").val();
	var OWNER_TYPE='<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>';
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_JCLZ_MODEL}"/>";
	   url_deal = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID
				+"&paraMap.colName="+colName+"&paraMap.tableName="+tableName+"&paraMap.TrigNo=TrigNo"+
				"&paraMap.piframeName="+window.frameElement.name+"&paraMap.toFlag=classManage";
			url_deal = url_deal +"&paraMap.ifunc=JCLZ.new&paraMap.tpl=jclz&paraMap.codeType="+codetype;
		if($("#preAceCode").val()!="")
	      url_deal = url_deal +"&paraMap.EditState=20" ;
		showPopWin(url_deal, '99%', '99%',null,"<dict:lang value="修改类源码"/>");
	}
	function updateCLASS_NAME_TEXT(id,txt,flag){
		if(flag){
			$("#"+id).val("");
			$("#paraMap_CLASS_NAME").val("");
			$("#paraMap_MS_CLASS_CODE_ID").val("");
			$("#paraMap_clsCode").val("");
		}else{
		$("#"+id).val(txt);}
		window.parent.isModify=true;
		closePopWin();
	}
        
    //MS_CLASS_CODE_ID
    function isBlankClsCode(){
    	var clsCode = document.getElementById("MS_CLASS_CODE_ID");
   		if(val.isBlank(clsCode)){
   			_alertValMsg(clsCode,"<dict:lang value="类源码" /> -- <dict:lang value="不能为空" />");
   			return true;
   		}
    
		return false;
    }
        
	function valData(){
		if(!val.valNullData()){
			return false;
		}
		if(!val.valOjbsData()){
			return false;
		}
		if(!val.valDataBaseSetData()){
			return false;
		}
		var paraMap_CLASS_DESC = document.getElementById("paraMap_CLASS_DESC");
   	if(val.isBlank(paraMap_CLASS_DESC)){
   		_alertValMsg(paraMap_CLASS_DESC,"<dict:lang value="类说明" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}
	
	//Z20171024
	function writebackClassName(className){
		$("#MS_CLASS_CODE_ID").val(className);
	}
	function writebackClassCode(_preAceCode,mark){
	  $("#hrefShowAction").text($("#hrefShowActionInfo").val());
	  $("#preAceCode").val(_preAceCode);
	  JavaBuildCodeMark=mark;//20 为成功build java code
	}
	function updateCLASS_NAME_TEXT(id,txt){	
		var	FLAG = '<s:property value="%{@com.more.fw.core.common.method.ConstantsMc@WORK_JAVA}"/>';																	
		window.location.href ="${path}sys/workMagAction_toModify.ms?paraMap.id="+$("#moduleId").val()+"&paraMap.FLAG="+FLAG;
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>