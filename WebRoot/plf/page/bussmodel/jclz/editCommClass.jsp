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
</head>
<style>
.widget .layui-form-select{
width:725px;
}
</style>
<body>
<input type="hidden" value='<dict:lang value="编辑" />' id="hrefShowActionInfo"/>
<input type="hidden" value='' id="preAceCode"/>


 

	<div class="all">
		<div class="add_table_div">
			<form id="editForm" class="layui-form" name="editForm" action="${path}sys/JClzAction_editCommClass.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.ID" />
				<s:hidden name="paraMap.clsCode" />
				<s:hidden name="paraMap.CLASS_NAME" />
				
				<s:hidden name="paraMap.codeType" />
		          <input type="hidden"  value='<s:property value='dataMap.MS_CLASS_CODE_ID' />' 
           name="paraMap.MS_CLASS_CODE_ID" id="paraMap_MS_CLASS_CODE_ID"/>
				
				<table class="add_table">
					<s:if test="${isOpenAuth==0}">
						<s:hidden name="paraMap.USER_DATA_AUTH" value="${dataAuthTop}"></s:hidden>
					</s:if>
					<s:else>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="组织机构" />
						</td>
						<td colspan="4"  class="widget">
							  <select name="paraMap.USER_DATA_AUTH"  lay-verify="required"  id="userDataAuth" lay-search>
							       <c:forEach items="${dataAuthMap}" var="listData">
							       <s:if test="${dataAuthTop== listData.ID}">
							       		<option value="${listData.ID}" selected="selected"><dict:lang value="${listData.NAME}" /></option>
							       </s:if>
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
							<span class="Eng">*</span><dict:lang value="类源码" />
						</td>
						<td colspan="4">
							<div id="paraMap_SEARCH_UI_div" style="width:100%" class="layui-input-inline">
							
							<input id="MS_CLASS_CODE_ID" lay-verify="required" type="text" style="width:100%" value="<s:property value='dataMap.CLASS_NAME' />"
							 readonly="readonly" class="readonly input_indent"  />
							 <i class="layui-icon layui-icon-search" onclick="showEditCode();" style="position: absolute;top:11px;right: 8px;"></i>
							 </div>
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
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="类说明" />
						</td>
						<td colspan="4">
							<s:textarea name="paraMap.CLASS_DESC" value="%{dataMap.CLASS_DESC}" id="paraMap_CLASS_DESC" rows="4"  cssStyle="width:100%" />
						</td>
					</tr>
					
				</table>
				<div class="ptop_10 txac">
					<input id="saveButton" type="button" lay-submit lay-filter="*" value="<dict:lang value="提交" />" onclick="/*edit(this);*/" class="layui-btn">
					
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
				<s:hidden id="upId" name="paraMap.UP_ID" />
			<s:hidden id="workType" name="paraMap.FLAG"/>
			<s:hidden id="modelMemo" name="paraMap.MODEL_MEMO"/>
			<s:hidden id="modelName" name="paraMap.MODEL_NAME"/>
			<s:hidden id="type" name="paraMap.TYPE"/>
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
			util.alert("类说明超过最大字符长度300");
			return
		}
		
		document.forms.editForm.submit();
		isSubmit = true;
	}
	var url_deal="";
	function showEditCode(){
	
	var codeId='<s:property value="dataMap.MS_CLASS_CODE_ID"/>';
	var OWNER_ID='<s:property value="dataMap.ID"/>';
	var CLASS_NAME_TEXT_ID='MS_CLASS_CODE_ID';
	var colName='MS_CLASS_CODE_ID';
	var OWNER_TYPE='<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>';
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_JCLZ_MODEL}"/>";
	   url_deal = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID
				+"&paraMap.colName="+colName+"&paraMap.tableName="+tableName+"&paraMap.TrigNo=TrigNo"+
				"&paraMap.piframeName="+window.frameElement.name+"&paraMap.toFlag=classManage";
		
	 
			url_deal = url_deal +"&paraMap.ifunc=JCLZ.new&paraMap.tpl=jclz";
	 
		if($("#preAceCode").val()!="")
	      url_deal = url_deal +"&paraMap.EditState=20" ;
	 
		showPopWin(url_deal, '99%', '99%',null,"<dict:lang value="修改类源码"/>");
		//window.open(url);900 595
	}
	
	function updateCLASS_NAME_TEXT(id,txt){
		if(flag){
			$("#"+id).val("");
		}else{
		$("#"+id).val(txt);}
		window.parent.isModify=true;
		closePopWin();
		window.location.href = "${path}sys/JClzAction_showEditCommClass.ms?paraMap.ID=<s:property value='paraMap.ID' />";
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
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>