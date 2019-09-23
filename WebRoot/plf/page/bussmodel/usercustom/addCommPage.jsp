<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="公用页面" /><dict:lang value="新增" />
	</title>
	
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
		<div>
			<div  class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}sys/UserCustomAction_addCommPage.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				 <input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				 <s:hidden id="paraMap_treeTid" name="treeTid" value="%{paraMap.treeTid}"/>
				<table class="add_table">
					<!--  
					<tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					-->
					
					<tr>
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="页面名称" />
						</td>
						<td  class="widget">
							<!--  
							<s:textfield name="paraMap.PAGE_NAME" id="paraMap_PAGE_NAME" 
							onkeyup="javascript:util.replaceLikeVal(this)"
							maxlength="15" />
							-->
							
							<input type="text" lay-verify="PAGE_NAME_verify" name="paraMap.PAGE_NAME" id="paraMap_PAGE_NAME"  maxlength="15"/>
							
						</td>
						
					</tr> 
					
					<tr>
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="页面类型" />
						</td>
						<td class="widget">
							<dict:selectDict id="COMM_PAGE_TYPE" verify="comm_page_type_val" dictCode="COMM_PAGE_TYPE" dictValue="%{COMM_PAGE_TYPE}" name="paraMap.COMM_PAGE_TYPE" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
						</td>
					</tr> 
					
				</table>
				
				<div class="ptop_10 txac" >
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
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
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		document.forms.addForm.submit();
		isSubmit = true;
	}
        
	function valData(){
		var paraMap_PAGE_NAME = document.getElementById("paraMap_PAGE_NAME");
   	if(val.isBlank(paraMap_PAGE_NAME)){
   		_alertValMsg(paraMap_PAGE_NAME,"<dict:lang value="页面名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}
	
	function replaceLikeVal2(comp){  
        if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1||comp.value.indexOf("/") != -1) {  
            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"").replace(/\//g,"");
            return "不能输入单引号双引号<>{}()[]/";
        }else{
        	return "";
        }
          
    } 
	
	$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
			  form.verify({
    		    comm_page_type_val: function(value,item){
    			  var val=document.getElementById("COMM_PAGE_TYPE").value;
    		      if(val==null || val==''){
    		        return '页面类型不能为空！';
    		      }
    		    }
           });
           
           form.on('submit(filterSubmit)', function (data) {
			 document.getElementById("curIframeName").value=window.frameElement.name;
		       return true;
				       
			})
			
			form.verify({
		   		 PAGE_NAME_verify: function(value,item){
		   		 		if(val.isBlank(value)){
							return "<dict:lang value="页面名称" /> -- <dict:lang value="不能为空" />";
						}else{
							return replaceLikeVal2(item);
						}
				 }
		     });
           
	    });
	    
	})
	

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>