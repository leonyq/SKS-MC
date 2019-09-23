<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="功能模型" /> <dict:lang value="新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
</head>
<body>
	<div class="all">
		<div  class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}sys/BussModelAction_addFunc.ms" method="post" target="submitFrame">
				<!-- s:token /  -->
				<input type="hidden" id="paraMap_VIEWID" name="paraMap.VIEWID" value="<s:property value="paraMap.ID"/>" />
				<input type="hidden" id="paraMap_IS_SHOW" name="paraMap.IS_SHOW" value="1" />
				<table class="add_table">
					<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="功能模型名称" />
						</td>
						<td class="widget">
						    <input type="text" lay-verify="required" name="paraMap.ACT_NAME" id="paraMap_ACT_NAME"  />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<dict:lang value="JS方法调用名称" />
						</td>
						<td  class="widget">
							<s:textfield name="paraMap.JS_NAME" id="paraMap_JS_NAME" maxlength="60" />
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="JS方法体" />
						</td>
						<td  colspan="4">
							<textarea name="paraMap.JS_FUNC" class="layui-textarea" style="width: 100%" id="paraMap_JS_FUNC" ></textarea>
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="按钮样式属性" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.CSS_STYLE" id="paraMap_CSS_STYLE" maxlength="300" />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<dict:lang value="按钮样式表" />
						</td>
						<td  class="widget">
							<s:textfield name="paraMap.CSS_CLASS" id="paraMap_CSS_CLASS" maxlength="150" />
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="自定义类" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.CLASS_NAME" id="paraMap_CLASS_NAME" maxlength="120"/>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="显示顺序" />
						</td>
						<td class="widget">
							 <input type="text" lay-verify="numVerify"  name="paraMap.SHOW_ORDER" id="paraMap_SHOW_ORDER"  />
						</td>
					</tr>
					<tr>
						<td  class="tr1 title" >
							<dict:lang value="按钮图标" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.ICO_CLASS" id="paraMap_ICO_CLASS" maxlength="60" value="ico-kl" 
							   title="%{getText('样式表')}"/>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title" >
							<span class="Eng">*</span>
							<dict:lang value="功能类型" />
						</td>
						<td class="widget">
								<dict:selectDict dictCode="FUNC_BUTTON_TYPE" dictValue="%{TYPE}" id="paraMap_TYPE" name="paraMap.TYPE"/>
							
						</td>						
					</tr>
				</table>
					<div class="ptop_10 txac">
			 <button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div>
			</form>
		</div>
		
	</div>

	<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>
	
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}

	function add(){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		document.forms.addForm.submit();
	}
        
	function valData(){
		var paraMapACTNAME = document.getElementById("paraMap_ACT_NAME");
   	if(val.isBlank(paraMapACTNAME)){
   		_alertValMsg(paraMapACTNAME,"<dict:lang value="功能模型名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	
   	if(paraMapACTNAME.value.indexOf("'")!=-1 || paraMapACTNAME.value.indexOf('"')!=-1 || paraMapACTNAME.value.indexOf('<')!=-1 || paraMapACTNAME.value.indexOf('>')!=-1 || paraMapACTNAME.value.indexOf('?')!=-1){
      paraMapACTNAME.value = paraMapACTNAME.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\?/g,"");
      _alertValMsg(paraMapACTNAME,"<dict:lang value="功能模型名称" /> -- <dict:lang value="不能输入单引号双引号<>?" />");
      return false;
    }
    
		var paraMap_SHOW_ORDER = document.getElementById("paraMap_SHOW_ORDER");
   	if(val.isBlank(paraMap_SHOW_ORDER)){
   		_alertValMsg(paraMap_SHOW_ORDER,"<dict:lang value="显示顺序" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	
	var paraMap_TYPE = document.getElementById("paraMap_TYPE");
   	if(val.isBlank(paraMap_TYPE)){
   		_alertValMsg(paraMap_TYPE,"<dict:lang value="功能类型" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}   	
    	
    	return true;
    }
	
	 layui.use('form', function(){
   	  var form = layui.form;
   	  //监听提交
   	 form.verify({
   		numVerify: function(value,item){
			   if (value==""||/[^0-9]/gi.test(value)) {
	                return '不能为空且只能填入数字';
	            }
		    }
      });
   });


</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>