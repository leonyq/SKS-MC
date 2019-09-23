<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="超链接" />UI <dict:lang value="配置" />
	</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
</head>
<body>
		<div class="all">
			<div class="add_table_div">
			<form id="add_form" name="addForm"  class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<table class="add_table element_table">

					<tr id="UI_DATA_4">
						<td  class="tr1 title" >
							<span class="Eng">*</span>
							<dict:lang value="链接地址" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_4" lay-verify="paraMap_UI_DATA_4_verify" name="paraMap.UI_DATA_4" 
								value="<s:property value="dataMap.UI_DATA_4"/>" maxlength="300" onkeyup="javascript:replaceLikeVal1(this)"/>
						</td>
					</tr>						
					<tr>
						<td  class="tr1 title" >
							<span class="Eng">*</span>
							<dict:lang value="打开方式" />
							
						</td>
						<td >
							<select id="paraMap_UI_DATA_5" name="paraMap.UI_DATA_5" lay-filter="me_change">
								<option value="1"><dict:lang value="当前页" /></option>
								<option value="2"><dict:lang value="新窗口" /></option>
							</select>
						</td>
					</tr>
					
					<tr id="paraMap_UI_DATA_6_tr" style="display:none;">
						<td  class="tr1 title" >
							<dict:lang value="标题" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_6" name="paraMap.UI_DATA_6" 
								value="<s:property value="dataMap.UI_DATA_6"/>" maxlength="50"onkeyup="javascript:replaceLikeVal(this)" />
						</td>
					</tr>
					<tr id="paraMap_UI_DATA_7_tr" style="display:none;">
						<td  class="tr1 title" >
							<dict:lang value="宽" />
						</td>
						<td >
						<input type="text" id="paraMap_UI_DATA_7" name="paraMap.UI_DATA_7" 
								value="<s:property value="dataMap.UI_DATA_7"/>"  maxlength="4" onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>	
					<tr id="paraMap_UI_DATA_8_tr" style="display:none;">
						<td  class="tr1 title" >
							<dict:lang value="高" />
						</td>
						<td >
						<input type="text" id="paraMap_UI_DATA_8" name="paraMap.UI_DATA_8" 
								value="<s:property value="dataMap.UI_DATA_8"/>"  maxlength="4" onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>
				
					<tr id="UI_DATA_2">
						<td  class="tr1 title" >
							<dict:lang value="执行函数名称" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_2" name="paraMap.UI_DATA_2" 
								value="<s:property value="dataMap.UI_DATA_2"/>" maxlength="120" onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>			
					<tr id="UI_DATA_3">
						<td  class="tr1 title" >
							<dict:lang value="函数内容" />
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_3" name="paraMap.UI_DATA_3" rows="6" 
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_3"/></textarea>
						</td>
					</tr>
					</table>
					
					 <div class="ptop_10 txac">
					<!--  
					<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
					-->
					
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin_ui();" class="layui-btn layui-btn-danger">
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
	function replaceLikeVal1(comp){
		  if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
	        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
	        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1) {  
	            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
	            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"");
	            util.alert("不能输入单引号双引号<>{}()[]");
	        }  
} 
	function replaceLikeVal(comp){
		 util.replaceLikeVal(comp);
} 
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		//window.parent.parent.reloadPg(msg);
		window.parent.parent.add();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(thisObj){
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
		
	}
        
	function valData(){
		/*var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
   	if(val.isBlank(paraMap_UI_DATA_2)){
   		_alertValMsg(paraMap_UI_DATA_2,"<dict:lang value="执行函数名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
		var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
   	if(val.isBlank(paraMap_UI_DATA_3)){
   		_alertValMsg(paraMap_UI_DATA_3,"<dict:lang value="执行函数内容" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	*/
	var paraMap_UI_DATA_4 = document.getElementById("paraMap_UI_DATA_4");
   	if(val.isBlank(paraMap_UI_DATA_4)){
   		_alertValMsg(paraMap_UI_DATA_4,"<dict:lang value="链接地址" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}

		return true;
	}

	$(function(){
		$("#paraMap_UI_DATA_5").val("<c:out value='${dataMap.UI_DATA_5}' />");
		if("<c:out value='${dataMap.UI_DATA_5}' />" == "2"){
			$("#paraMap_UI_DATA_6_tr").show();
			$("#paraMap_UI_DATA_7_tr").show();
			$("#paraMap_UI_DATA_8_tr").show();
		}
		
		$("#paraMap_UI_DATA_5").change(function(){
			if(this.value == "2"){
				$("#paraMap_UI_DATA_6_tr").show();
				$("#paraMap_UI_DATA_7_tr").show();
				$("#paraMap_UI_DATA_8_tr").show();				
			}else{
				$("#paraMap_UI_DATA_6_tr").hide();
				$("#paraMap_UI_DATA_7_tr").hide();
				$("#paraMap_UI_DATA_8_tr").hide();				
			}
		});
	});
	
var form;
$(function(){
	layui.use('form', function(){
	    	 form = layui.form;
	          
			 form.on('submit(filterSubmit)', function (data) {
			 document.getElementById("mcIframeName").value=window.parent.location.href;
			 document.getElementById("curIframeName").value=window.parent.name;
			 /*
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
		       */
		       return true;
				       
			}) 
			
			form.on('select(setUiData)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				setUiData(data.elem);
			
		 	});
		 	
		 	form.on('select(me_change)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				if(data.value == "2"){
					$("#paraMap_UI_DATA_6_tr").show();
					$("#paraMap_UI_DATA_7_tr").show();
					$("#paraMap_UI_DATA_8_tr").show();				
				}else{
					$("#paraMap_UI_DATA_6_tr").hide();
					$("#paraMap_UI_DATA_7_tr").hide();
					$("#paraMap_UI_DATA_8_tr").hide();				
				}
			
		 	});
		 	
		 	form.verify({
		   		 paraMap_UI_DATA_4_verify: function(value,item){
		   		 		var paraMap_UI_DATA_4 = document.getElementById("paraMap_UI_DATA_4");
					   	if(val.isBlank(paraMap_UI_DATA_4)){
					   		return "<dict:lang value="链接地址" /> -- <dict:lang value="不能为空" />";
					   	}
		   		 		
				 }
		     });
		 
	
	    });
	    
})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>