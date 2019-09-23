<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="公用列表" />UI <dict:lang value="配置" />
	</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		
		<script>
		  function getGoUrl(){
		    var str=location.href;
		    var num=str.indexOf("?");
		    str=str.substr(num+1);
		    var arr=str.split("&");
		    var url="";
		     for(var i=0;i<arr.length;i++){
		      num=arr[i].indexOf("=");
		      if(num>0)   
		         if("paraMap.UI_MODEL_ID"!=arr[i].substring(0,num)) 
		         url+="&"+arr[i].substring(0,num)+"="+arr[i].substr(num+1); 
		    }
		    
		    
		      str=location.href;
		      num=str.indexOf("?");
		     str=str.substring(0,num);
		     url=str+"?paraMap.UI_MODEL_ID=ui28"+url;
		    location.href=url;
		  
		  }//function getGoUrl(){
		
		</script>
		
</head>
	
<body>
		<div class="all">
			<div class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<table class="add_table element_table">

				 <tr style="text-align: left">
						<td colspan="2" style="text-align: left" class="mc-database-radio-td"> 
						 
						     
						     <input style="width:20px;vertical-align:middle;" type="radio" name="selectItem"
						     lay-filter="getGoUrl" value="1" title="自定义">
							
							 <input
							 style="width:20px;vertical-align:middle;"
							  type="radio" name="selectItem"  checked value="2" title="公用列表">
							 
						</td>
					</tr>
					<tr id="UI_DATA_4">
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="公用页面" />
						</td>
						<td >
						<input type="hidden" id="paraMap_UI_DATA_VALUE_1"  name="paraMap.UI_DATA_VALUE_1" value="<s:property value="dataMap.UI_DATA_VALUE_1"/>" />
							<input type="text" id="paraMap_UI_DATA_TEXT_1" lay-verify="paraMap_UI_DATA_TEXT_1_verify" name="paraMap.UI_DATA_TEXT_1"  class="not_null"
								value="<s:property value="dataMap.UI_DATA_TEXT_1"/>"  maxlength="300" />
						</td>
					</tr>						
					<tr>
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="执行类" />
							
						</td>
						<td >
								<input type="hidden" id="paraMap_UI_DATA_VALUE_2" name="paraMap.UI_DATA_VALUE_2" value="<s:property value="dataMap.UI_DATA_VALUE_2"/>" />
								<input type="text" id="paraMap_UI_DATA_TEXT_2" lay-verify="paraMap_UI_DATA_TEXT_2_verify" name="paraMap.UI_DATA_TEXT_2"  class="not_null"
								value="<s:property value="dataMap.UI_DATA_TEXT_2"/>"  maxlength="300" />
						</td>
					</tr>
					<tr id="IS_OPEN_DATA_AUTH">
						<td  class="tr1 title" >
							<dict:lang value="是否关联组织机构" />
						</td>
						<td >
						<dict:selectDict dictCode="IS_OPEN_DATA_AUTH" dictValue="%{dataMap.IS_OPEN_DATA_AUTH}" custom_option="<option value=''>%{getText('--请选择--')}</option>"  name="paraMap.IS_OPEN_DATA_AUTH"  />
						</td>
					</tr><%--
					 <tr id="IS_OPEN_DATA_AUTH_PROMPT">
						<td  class="tr1 title" >
							<dict:lang value="是否开启组织机构提示" />
						</td>
						<td >
						<dict:selectDict dictCode="IS_OPEN_DATA_AUTH_PROMPT" dictValue="%{dataMap.IS_OPEN_DATA_AUTH_PROMPT}" custom_option="<option value=''>%{getText('--请选择--')}</option>"  name="paraMap.IS_OPEN_DATA_AUTH_PROMPT"  />
						</td>
		 			 </tr>		
					
					--%>
					
					<%@ include file="inc_save_mark_att.jsp"%>
					
					<tr id="UI_DATA_3">
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="回填值函数" />
							<br>
							<i class="editCode" style="float: right;margin-right:30px;" id="editCode" onclick="editJsValFun('paraMap_UI_DATA_3');"></i>
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_3" name="paraMap.UI_DATA_3" lay-verify="paraMap_UI_DATA_3_verify" rows="8"  class="not_null"
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_3"/></textarea>
						</td>
					</tr>
					<tr id="UI_DATA_5">
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="清空值函数" />
							<br>
			<i class="editCode" style="float: right;margin-right:30px;" id="editCode" onclick="editJsValFun('paraMap_UI_DATA_4');"></i>
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_4" name="paraMap.UI_DATA_4" lay-verify="paraMap_UI_DATA_4_verify" rows="8"  class="not_null"
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_4"/></textarea>
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
	
		var curJsFunObj;
	
	function editJsValFun(thisObj){
		curJsFunObj = $("#"+thisObj);
		var url = "${path}sys/BussModelAction_forEditJsValFun.ms?funcFlag=control&mcIframeName="+parent.frameElement.name;
		showPopWin(url, '99%', '99%',null,"修改 "); 
	}
	function getJsFunCode(){
		return curJsFunObj.val();//curJsFunObj.value;
	}
	
	function setJsFunCode(code){
		curJsFunObj.val(code) ;
	}
	
	function setJsFunObjFoucue(){
		//curJsFunObj.focus();
	}
	
	function validateInput(input){
		var input_value = input.value;
	   	if(input_value != "" && input_value != null)
	   	{
	   		if(input_value.indexOf("\"") != -1  || input_value.indexOf("\'") != -1  || input_value.indexOf("<") != -1 || input_value.indexOf(">") != -1 
				|| input_value.indexOf("{") != -1 || input_value.indexOf("}") != -1  || input_value.indexOf("[") != -1  || input_value.indexOf("]") != -1 
				|| input_value.indexOf("(") != -1 || input_value.indexOf(")") != -1 )
			{
				_alertValMsg(input,"<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />");
		   		return false;	   		
		   	}
	   	}
	   	return true;
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
		var promptText = {
				"paraMap_UI_DATA_TEXT_1":"公用列表不能为空",
				"paraMap_UI_DATA_TEXT_2":"执行函数不能为空",
				"paraMap_UI_DATA_3":"回填值函数不能为空",
				"paraMap_UI_DATA_4":"清空值函数不能为空"
		};
		var flag = true;
		$(".not_null").each(function(i) {
			var _this = $(this);
			if(val.isBlank(_this.val())){
				var _thisId = _this.attr("id");
		   		_alertValMsg(_this,"<dict:lang value='"+promptText[_thisId]+"' /> -- <dict:lang value="不能为空" />");
		   		flag = false;
		   		return false;
		   	}
		});
		
		return flag;
	}

	$(function(){
		$("#paraMap_UI_DATA_TEXT_1").on("click",function(){
			var url = "${path}sys/UserCustomAction_showAddCommPageTree.ms?paraMap.source=commTable"+"&mcIframeName="+window.parent.name;
			showPopWin(url, 400, 490,null,"<dict:lang value="公用页面选择"/>");
		});
		
		$("#paraMap_UI_DATA_TEXT_2").on("click",function(){
			var url = "${path}sys/UserCustomAction_showAddCommClassTree.ms?paraMap.source=commTable"+"&mcIframeName="+window.parent.name;
			showPopWin(url, 400, 490,null,"<dict:lang value="公用类选择"/>");
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
		 	
		 	form.on('radio(getGoUrl)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				if(data.value=='1'){
					getGoUrl();
				}
			
		 	});
		 	
		 	form.verify({
		   		 paraMap_UI_DATA_TEXT_1_verify: function(value,item){
						var paraMap_UI_DATA_TEXT_1 = document.getElementById("paraMap_UI_DATA_TEXT_1");
					   	if(val.isBlank(paraMap_UI_DATA_TEXT_1)){
					   		return "公用列表不能为空";
					    }
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_TEXT_2_verify: function(value,item){
						var paraMap_UI_DATA_TEXT_2 = document.getElementById("paraMap_UI_DATA_TEXT_2");
					   	if(val.isBlank(paraMap_UI_DATA_TEXT_2)){
					   		return "执行函数不能为空";
					    }
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_3_verify: function(value,item){
						var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
					   	if(val.isBlank(paraMap_UI_DATA_3)){
					   		return "回填值函数不能为空";
					    }
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_verify: function(value,item){
						var paraMap_UI_DATA_4 = document.getElementById("paraMap_UI_DATA_4");
					   	if(val.isBlank(paraMap_UI_DATA_4)){
					   		return "清空值函数不能为空";
					    }
		   		 		
				 }
		     });
		 	
	
	    });
	    
})

</script>

<script src="${path}plf/page/js_files/comm/chk.form.ui.control.vals.js?_mc_res_version=<%=PlfStaticRes.ChkFormUiControlVals %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>