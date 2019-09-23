<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<html>
	<head>
		<title><dict:lang value="新建模型" /></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>

	<body >
	<div class="all">
		<div  class="add_table_div">
		<form id="addForm" class="layui-form" name="addForm" action="${path}sys/BussModelAction_addBussModel.ms" method="post" target="submitFrame">
		
		<s:hidden id="paraMap_UP_M_ID" name="paraMap.UP_M_ID" value="%{paraMap.UP_M_ID}"/>
		<s:hidden id="paraMap_path" name="paraMap.path" value="%{paraMap.path}"/>
		<s:hidden id="paraMap_treeTid" name="treeTid" value="%{paraMap.treeTid}"/>
			<s:token />
				
			<table class="add_table">
				</tr>
					<tr>
						<td  class="tr1 title">
						<span style="color:red">&nbsp;&nbsp;* <c:out value='${errors["paraMap.M_NAME"][0]}' /></span>
						<dict:lang value="模型名称" />
						</td>
						<td class="widget">
						 <input type="text" lay-verify="required" name="paraMap.M_NAME"  maxlength="40" id="paraMap_M_NAME"  />
						</td>
					</tr>
					<tr>
						<td class="tr1 title">
						<span style="color:red">&nbsp;&nbsp;* <c:out value='${errors["paraMap.MODEL_CODE"][0]}' /></span>
						<dict:lang value="模型编码" />
						</td>
						<td class="widget">
						    <input type="text" lay-verify="MODEL_CODE＿REG"  name="paraMap.MODEL_CODE"  maxlength="30" id="paraMap_MODEL_CODE"  />
						</td>
					</tr>					
					<tr>
						<td width="35%" class="tr1"><dict:lang value="是否显示模型" /></td>
						<td>
							<select id="paraMap_IF_SHOW_MODEL" name="paraMap.IF_SHOW_MODEL">
								<option value="Y"><dict:lang value="是" /></option>
								<option value="N"><dict:lang value="否" /></option>
							</select>
						</td>
					</tr>					
			</table>
			
		
		<div class="ptop_10 txac">
			 <button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			 <%--<input type="reset" value="<dict:lang value="重置" />" class="layui-btn layui-btn-primary" />
			--%><input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
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
		function submitForm(thisObj){
			if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");return;}
			if(!valData()){
				return ;
			}
			var MODEL_CODE=$("#paraMap_MODEL_CODE").val();
			var reg = /^[a-zA-Z0-9\\_]{0,}$/;
			if(!reg.test(MODEL_CODE)){
				util.alert("<dict:lang value="模型编码，只能由字母、数字、_组成请检查" />...");
				return ;
			}
			isSubmit = true;
			document.forms.addForm.submit();
		}

		function valData(){
			var paraMap_M_NAME = document.getElementById("paraMap_M_NAME");
			var paraMap_MODEL_CODE = document.getElementById("paraMap_MODEL_CODE");
	   	if(val.isBlank(paraMap_M_NAME)){
	   		_alertValMsg(paraMap_M_NAME,"<dict:lang value="模型名称" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}else if(val.isBlank(paraMap_MODEL_CODE)){
	   		_alertValMsg(paraMap_MODEL_CODE,"<dict:lang value="模型编码" /> -- <dict:lang value="不能为空" />");
	   		return false;	   		
	   	}
	    
			return true;
		}
	
		function alertInfo(msg){
			isSubmit = false;
			util.alert(msg);
		}
	
		function reloadPg(msg){
			isSubmit = false;
			if("1" == "<s:property value="#parameters.isSelf" />"){
				parent.reloadPg(msg);
			}else{
				parent.leftFrame.location.href= "${path}sys/BussModelAction_listBussModelTree.ms";
				util.alert(msg);
				goBack();
			}
		}
		
    function goBack(){
			if("1" == "<s:property value="#parameters.isSelf" />"){
				parent.closePopWin();
    	}else{
    		window.location.href = "<%=CommMethodMc.getMainFrameUrl(request)%>";
    	}
    }
    
    layui.use('form', function(){
     	  var form = layui.form;
     	  //监听提交
     	 form.verify({
     		MODEL_CODE＿REG: function(value,item){
     		   if(value==""){
     			  return '<dict:lang value="模型编码不能为空" />...';
     		   }
  			   if (!/^[a-zA-Z0-9\\_]{0,}$/.test(value)) {
  	                return '<dict:lang value="模型编码，只能由字母、数字、_组成请检查" />...';
  	            }
  		    }
        });
     });
	</script>

	</body>
<%@ include file="/plf/common/pub_end.jsp"%>
