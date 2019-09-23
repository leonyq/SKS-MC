<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="表单模型" />-<dict:lang value="基本信息" /> <dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		
	</jsp:include>
</head>
<body>
		<div>
		
		<!--  
		  <table class="func_table">
	    	<tr>
	      <td width="100%" align="right">
					<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="botton_img_add">
	      </td>
	      </tr>
			</table>
			-->


			<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_editForm.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.MID" />
				<s:hidden name="paraMap.ID" />
				<table class="add_table">
					<!--  
					<tr>
						<td colspan="6">
							<span class="Point"><span class="Eng">*</span><dict:lang value="为必填项" />
							</span>
						</td>
					</tr>
					-->
					
					<tr>
						<td width="20%" class="tr1">
							<span class="Eng">*</span><dict:lang value="表单模型名称" />
						</td>
						<td width="30%">
							<input type="text" name="paraMap.FORM_NAME" lay-verify="FORM_NAME_Verify"  onkeyup="javascript:util.replaceLikeVal(this)" value="${dataMap.FORM_NAME}" id="paraMap_FORM_NAME" maxlength="50" />
							
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="是否分页" />
						</td>
						<td width="30%" colspan="3">
							<dict:radioDict dictCode="YESNO" dictValue="%{dataMap.IS_PAGE}" id="paraMap_IS_PAGE" name="paraMap.IS_PAGE" style="width:30px;" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="表单事件" />
						</td>
						<td width="30%">
							<s:textfield name="paraMap.FORM_FUN" value="%{dataMap.FORM_FUN}" id="paraMap_FORM_FUN" maxlength="300" />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="数据行事件" />
						</td>
						<td width="30%">
							<s:textfield name="paraMap.ROW_FUN" value="%{dataMap.ROW_FUN}" id="paraMap_ROW_FUN" maxlength="300" />
						</td>
					</tr>
					<tr>
						<td class="tr1">
							<dict:lang value="自定义单元格样式" />
						</td>
						<td >
							<!--  
							<input id="MS_CLASS_CODE_ID_UI" type="text" value="<s:property value='dataMap.CLASS_NAME_UI' />" readonly="readonly" class="readonly" />
							<a href="javascript:void(0);" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID_UI"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID_UI','MS_CLASS_CODE_ID_UI','<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUN_REL_FORM_UI"/>');">
							<s:if test="@com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID_UI)">
								<dict:lang value="新增" />
							</s:if>
							<s:else>
								<dict:lang value="编辑" />
							</s:else>
							</a>
							-->
							
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
                			<input id="MS_CLASS_CODE_ID_UI" type="text" value="<s:property value='dataMap.CLASS_NAME_UI' />" readonly="readonly" class="readonly p_r_30" />
                            <i class="layui-icon layui-icon-search" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID_UI"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID_UI','MS_CLASS_CODE_ID_UI','<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUN_REL_FORM_UI"/>');" style="position: absolute;top:11px;right: 8px;"></i>
                      		</div>
							
						</td>
						<td class="tr1">
							<dict:lang value="自定义输出内容" />
						</td>
						<td >
							<!--  
							<input id="MS_CLASS_CODE_ID_VAL" type="text" value="<s:property value='dataMap.CLASS_NAME_VAL' />" readonly="readonly" class="readonly" />
							<a href="javascript:void(0);" onclick="showEditCodeContext('<s:property value="dataMap.MS_CLASS_CODE_ID_VAL"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID_VAL','MS_CLASS_CODE_ID_VAL','<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUN_REL_FORM_VAL"/>');">
							<s:if test="null ==dataMap || @com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID_VAL)">
								<dict:lang value="新增" />
							</s:if>
							<s:else>
								<dict:lang value="编辑" />
							</s:else>
							</a>
							-->
							
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
                			<input id="MS_CLASS_CODE_ID_VAL" type="text" value="<s:property value='dataMap.CLASS_NAME_VAL' />" readonly="readonly" class="readonly p_r_30" />
                            <i class="layui-icon layui-icon-search" onclick="showEditCodeContext('<s:property value="dataMap.MS_CLASS_CODE_ID_VAL"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID_VAL','MS_CLASS_CODE_ID_VAL','<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUN_REL_FORM_VAL"/>');" style="position: absolute;top:11px;right: 8px;"></i>
                      		</div>
                      		
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="是否清除排序" />
						</td>
						<td width="30%">
							<dict:radioDict dictCode="YESNO" dictValue="%{dataMap.IS_CLEAR_ORDER}" id="paraMap_IS_CLEAR_ORDER" name="paraMap.IS_CLEAR_ORDER" style="width:30px;" />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="是否删除关联" />
						</td>
						<td width="30%" >
							<dict:radioDict dictCode="YESNO" dictValue="%{dataMap.IS_DEL_REL}" id="paraMap_IS_DEL_REL" name="paraMap.IS_DEL_REL" style="width:30px;" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="是否设置表格边框线" />
						</td>
						<td width="30%" colspan="3">
							<dict:selectDict id="paraMap_IS_BORDER" name="paraMap.IS_BORDER"  dictCode="IS_BORDER" dictValue="%{dataMap.IS_BORDER}" 
								custom_option="%{getText('-请选择-')}" style="width:153px;" onchange="changeVT(this.value);" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="表单样式属性" />
						</td>
						<td width="30%">
							<s:textfield name="paraMap.FORM_CSS_STYLE" value="%{dataMap.FORM_CSS_STYLE}" id="paraMap_FORM_CSS_STYLE" 
								maxlength="300"  />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="表单样式表" />
						</td>
						<td width="30%">
							<s:textfield name="paraMap.FORMROW_CSS_CLASS" value="%{dataMap.FORMROW_CSS_CLASS}" id="paraMap_FORMROW_CSS_CLASS"
								maxlength="300" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="行样式属性" />
						</td>
						<td width="30%">
							<s:textfield name="paraMap.ROW_CSS_STYLE" value="%{dataMap.ROW_CSS_STYLE}" id="paraMap_ROW_CSS_STYLE" 
								maxlength="300"  />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="行样式表" />
						</td>
						<td width="30%">
							<s:textfield name="paraMap.ROW_CSS_CLASS" value="%{dataMap.ROW_CSS_CLASS}" id="paraMap_ROW_CSS_CLASS" 
								maxlength="300" />
						</td>
					</tr>
				</table>
				
				 <div class="ptop_10 txac">
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					<input type="reset" value="<dict:lang value="重置" />" onclick="reset();" class="layui-btn layui-btn-primary" />
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
	var form;
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reloadPg(msg){
		isSubmit = false;
		//alert(msg);
		top.util.alert(msg);
		window.location.href = "${path}sys/BussModelAction_forEditForm.ms?paraMap.MID=<s:property value="paraMap.MID" />&paraMap.ID=<s:property value="paraMap.ID" />";
	}
	
	function edit(thisObj){
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
		
	}
        
	function valData(){
		var paraMapFORMNAME = document.getElementById("paraMap_FORM_NAME");
   	if(val.isBlank(paraMapFORMNAME)){
   		_alertValMsg(paraMapFORMNAME,"<dict:lang value="表单模型名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}
	
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
	  var mcIframeName = window.frameElement.name; //外层iframe的name
		var tableName = "MS_FORM_MODEL";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName+"&paraMap.tpl=customStyle"+"&mcIframeName="+mcIframeName+"&paraMap.toFlag=form";
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
	}
	
	function showEditCodeContext(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
	var mcIframeName = window.frameElement.name; //外层iframe的name
		var tableName = "MS_FORM_MODEL";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName+"&paraMap.tpl=customContext"+"&mcIframeName="+mcIframeName+"&paraMap.toFlag=form";
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
	}
	
	function updateCLASS_NAME_TEXT(id,txt){
		//$("#"+id).val(txt);
		window.location.href = "${path}sys/BussModelAction_forEditForm.ms?paraMap.MID=<s:property value="paraMap.MID" />&paraMap.ID=<s:property value="paraMap.ID" />";
	}
	
	function init(){
	}
	
	function reset() {
		document.forms.addForm.reset();
	}
	
	init();
	
	$(function(){
		layui.use('form', function(){
	    	 form = layui.form;
			 form.render();
			 
			 form.on('submit(filterSubmit)', function (data) {
			 /*
		       var flag=edit(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
		     */
		       return true;
				       
			}) 
			
			 form.verify({
		   		FORM_NAME_Verify: function(value,item){
			            var paraMapFORMNAME = document.getElementById("paraMap_FORM_NAME");
					   	if(val.isBlank(paraMapFORMNAME)){
					   		return '表单模型名称不能为空';
					   	}
   	
				    }
		     });
		
	    });
		    
	})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>