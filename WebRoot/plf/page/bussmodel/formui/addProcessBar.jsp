<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="单行文本" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="zTree" value="1" />
			<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
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

					<tr>
						<s:if test="dataMap.COL_SCENE == \"1\"">
						<td  class="tr1 title" >
							<dict:lang value="扩展关联字段" />
						</td>
						<td >
							<select id="paraMap_COL_SCENE_FORM_COL_ID" name="paraMap.COL_SCENE_FORM_COL_ID" style="width: 100%">
								<option value=""><dict:lang value="--请选择--"/></option>
								<s:iterator value="listData">
								<option <s:if test="dataMap.COL_SCENE_FORM_COL_ID == ID ">selected="selected"</s:if> value="<s:property value="ID" />" ><s:property value="TITLE_NAME" /> <s:property value="COL_NO" /></option>
								</s:iterator>
							</select>
						</td>
						</s:if>
					</tr>
					<tr>
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="数据来源" />
						</td>
						<td >
							<dict:selectDict dictCode="UI_PROGRESS_DATA_TYPE" dictValue="%{dataMap.UI_PROGRESS_DATA_TYPE}"  id="paraMap_UI_PROGRESS_DATA_TYPE" 
							name="paraMap.UI_PROGRESS_DATA_TYPE"  bindEvent="setUiData" />
							
						</td>
					</tr>
					<tr>
						<td  class="tr1 title ver-mid" >
							<dict:lang value="展示内容"/>
						</td>
						<td  >
						<input type="radio" checked="checked" name="paraMap.select" id="percent" value = "percent" class="radio" style="width:15px;" title="<dict:lang value="百分比展示"/>"></input>
						<br/>
						<input type="radio" name="paraMap.select" id="number" value="number" class="radio" style="width:15px;" title="<dict:lang value="数值展示"/>"></input>
						<br/>
						<input type="radio" name="paraMap.select" id="all" value="all" class="radio" style="width:15px;" title="<dict:lang value="百分比与数值展示"/>"></input>
						<div class="m-t-10">
							<span class="m-b-5 display-block">
								<dict:lang value="进度条宽度"/>
							</span>
							<input type="text" name="paraMap.width" id="width"  lay-verify="width_verify" value="<s:property value="dataMap.UI_WIDTH"/>" >
						</div>
						<div class="m-t-10">
							<span class="m-b-5 display-block">
								<dict:lang value="进度条高度"/>
							</span>
							<input type="text" name="paraMap.height" id="height" lay-verify="height_verify" value="<s:property value="dataMap.UI_HEIGHT"/>" >
						</div>
						<div class="m-t-10">
							<span class="m-b-5 display-block">
								<dict:lang value="自定义样式"/>
							</span>
							
							<input type="text" name="paraMap.style" id="style" value="<s:property value="dataMap.UI_STYLE"/>" ></input>
						</div>
						
						</td>
					</tr>
					<tr id="UI_DATA_1" >
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="数据总量" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_1" lay-verify="paraMap_UI_DATA_1_verify" name="paraMap.UI_DATA_1"  value="<s:property value="dataMap.UI_DATA_1"/>"></input>
							
						</td>
					</tr>
					<tr id="UI_DATA_2" style="display: none;">
						<td  class="tr1 title ver-mid" >
							<dict:lang value="SQL语句" />
							<br>
			<i class="editCode" style="float: right;margin-right:20px;" id="editCode" onclick="editSqlValFun('comm_sql');"></i> 
						</td>
									 <td id ="msg" width="80%" class="mc-database-radio-td">
              &nbsp;&nbsp;<label for="codeType_comm" class="cursor_hand"><input
                type="radio" id="codeType_comm" name="paraMap.codeType"
                value="comm" onclick="showSql(this)" style="width: 20px;" title="通用语句"/></label>
              &nbsp;&nbsp;<label for="codeType_oracle" class="cursor_hand"><input
                type="radio" id="codeType_oracle" name="paraMap.codeType"
                value="oracle" onclick="showSql(this)" style="width: 20px;" title="ORACLE"/></label>
              &nbsp;&nbsp;<label for="codeType_sqlserver" class="cursor_hand"><input
                type="radio" id="codeType_sqlserver" name="paraMap.codeType"
                value="sqlserver" onclick="showSql(this)" style="width: 20px;" title="SQLSERVER"/></label>
              &nbsp;&nbsp;<label for="codeType_mysql" class="cursor_hand"><input
                type="radio" id="codeType_mysql" name="paraMap.codeType"
                value="mysql" onclick="showSql(this)" style="width: 20px;" title="MYSQL"/></label>
                <label for="codeType_pg" class="cursor_hand"><input
				type="radio" id="codeType_pg" name="paraMap.codeType"
				value="pg" onclick="showSql(this)" style="width: 20px;" title="PG"/></label>
              <%-- 如果新增了支持的数据库类型，则这里需要新增 --%></br>
              
              <textarea id="comm_sql" name="paraMap.UI_DATA_11" lay-verify="comm_verify" rows="4"
              style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_11"/></textarea>
              
              
              <textarea id="oracle_sql" name="paraMap.UI_DATA_8" lay-verify="oracle_verify" rows="4"
              style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_8"/></textarea>
              
              <textarea id="sqlserver_sql" name="paraMap.UI_DATA_9" lay-verify="sqlserver_verify" rows="4" 
              style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_9"/></textarea>
              
              <textarea id="mysql_sql" name="paraMap.UI_DATA_10" lay-verify="mysql_verify" rows="4" 
              style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_10"/></textarea>
              
              <textarea id="pg_sql" name="paraMap.UI_DATA_PG" lay-verify="pg_verify" rows="4" 
			  style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_PG"/></textarea>
            </td>
					</tr>

				</table>
				
				<div class="ptop_10 txac">			
			
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
	
	function editSqlValFun(thisObj){
		curJsFunObj = $("#"+thisObj);
		var checkedVal = $('input[name="paraMap.codeType"]:checked').val();
		var url = "${path}sys/BussModelAction_forControlEditCode.ms?funcFlag=sql&mcIframeName="+parent.frameElement.name+"&dbType="+checkedVal;
		showPopWin(url, '99%', '99%',null,"修改"); 
	}
	
	function getSqlFunCode(val){
	
		var sql;
	
		if("CODE_BASE" == val){
				sql =$("#comm_sql").val();
			}else if("CODE_ORACLE" == val){
				sql =$("#oracle_sql").val();
			}else if("CODE_SQLSERVER" == val){
				sql =$("#sqlserver_sql").val();
			}else if("CODE_MYSQL" == val){
				sql =$("#mysql_sql").val();
			}else if("CODE_PG" == val ){
				sql =$("#pg_sql").val();
			}
	
		return sql;
	}
	
	function getJsFunCode(){
		return curJsFunObj.val();//curJsFunObj.value;
	}
	
	function setSqlFunCode(id,code,checkedVal){
		$("#"+id).val(code);
		
			if("CODE_BASE" == checkedVal){
				$("#codeType_comm").click();
			}else if("CODE_ORACLE" == checkedVal){
			$("#codeType_oracle").click();
			}else if("CODE_SQLSERVER" == checkedVal){
			$("#codeType_sqlserver").click();
			}else if("CODE_MYSQL" == checkedVal){
			$("#codeType_mysql").click();
			}else if("CODE_PG" == checkedVal ){
			$("#codeType_pg").click();
			}
			layui.form.render('radio');
	}
	
	 var db_dialect="<s:property value="@com.more.fw.core.common.method.CommMethodMc@getCUR_DB_DIALECT()"/>";
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
			
			var typeVal = $("#paraMap_UI_PROGRESS_DATA_TYPE").val();
			if(typeVal == "2"){
				 var db_sql = document.getElementById(db_dialect+"_sql");
				 var msg=$("#msg");
				    var val2 = db_sql.value.toUpperCase();
				    if(val.isBlank(val2)){
				      var comm_sql = document.getElementById("comm_sql");
				      val2 = comm_sql.value.toUpperCase();
				     }
		   		  //验证sql语句的表是否存在
		          var url = "${path}sys/BussModelAction_validTableIs.ms";
			      $.ajax({
			          type: "POST",
			          dataType: "json",
			          url: url,
			          data: "paraMap.SQL="+val2,
			          success: function(data){
			            if(data.ajaxMap != null){
			                var valid_str =  data.ajaxMap.valid_str;
			                if(valid_str==null || valid_str==''){
			                 	//isSubmit = true;
			                 	//document.forms.add_form.submit();
			                 	return true;
			                }else{
			                  _alertValMsg(msg,valid_str);
			                  isSubmit = false;
			                   return false;
			                   
			                };
			              
			            };
			        },
			        error: function(msg){
			        	 isSubmit = false;
			             return false;
			        }
			      });
		   	
	   		}else{
	   			//document.forms.add_form.submit();
	   			return true;
	   		}
	   
			isSubmit = true;
			return true;
		}
			
		function valData()
		{			
				var typeVal = $("#paraMap_UI_PROGRESS_DATA_TYPE").val();
				if(typeVal == "1")
				{
					var paraMap_UI_DATA_1 = document.getElementById("paraMap_UI_DATA_1");
					if(val.isBlank(paraMap_UI_DATA_1))
					{
						_alertValMsg(paraMap_UI_DATA_1,"数据总量不能为空");
						return false;
					}	
				}
				if(typeVal == "2")
				{
					 var db_sql = document.getElementById(db_dialect+"_sql");
					 var msg=$("#msg");
					    var val2 = db_sql.value.toUpperCase();
					    if(val.isBlank(val2)){
					      var comm_sql = document.getElementById("comm_sql");
					      val2 = comm_sql.value.toUpperCase();
					     }
					if(val.isBlank(val2))
					{
						_alertValMsg(msg,"<dict:lang value="当前数据库类型SQL语句或者通用sql" /> -- <dict:lang value="不能为空" />");
						return false;
					}	
				}				
				
				var width = document.getElementById("width");
			   	if(!validateInput(width))
			   	{
			   		return false;
			   	}
    
		    	var height = document.getElementById("height");
			   	if(!validateInput(height))
			   	{
			   		return false;
			   	}
			   	
			   var wvalue=$("#width").val();
			   var temps=null
			   var temps1
			   if(wvalue!=""&&wvalue!=null){
			    temps=wvalue.substring(wvalue.length-2,wvalue.length);
			    temps1=wvalue.substring(wvalue.length-1,wvalue.length);
			   }
			   
			   	if("px"==temps)
			   	{
			   		var temp = wvalue.substring(0,wvalue.length -2);
				   	var num = parseInt(temp);
					if (isNaN(num))
					{
					 _alertValMsg(width,"<dict:lang value="格式必须是数字加px，或数字加%" />");
				   	 return false;
					}
			   	}
			   	else if(temps1=="%")
			   	{
				   	var temp = wvalue.substring(0,wvalue.length -1);
				   	var num = parseInt(temp);
					if (isNaN(num))
					{
					 _alertValMsg(width,"<dict:lang value="格式必须是数字加px，或数字加%" />");
				   	 return false;
					}
			   	}
			   	else
			   	{
			   		
			   		_alertValMsg(width,"<dict:lang value="格式必须是数字加px，或数字加%" />");
			   		return false;
			   	}
			    var hvalue=$("#height").val();
			    var temps=null;
			    var temps1=null;
			    if(hvalue!=""&&hvalue!=null){
				    temps=hvalue.substring(hvalue.length-2,hvalue.length);
				   	temps1=hvalue.substring(hvalue.length-1,hvalue.length);
				}
			   	if(height.value == "" || height.value == null)
			   	{
			   	}
			   	else if("px"==temps)
			   	{
			   	 var temp = hvalue.substring(0,hvalue.length -2);
			   	 var num = parseInt(temp);
				 if (isNaN(num))
				 {
					_alertValMsg(height,"<dict:lang value="格式必须是数字加px，或数字加%" />");
			   		return false;
				 }
			   	}
			   	else if(temps1=="%")
			   	{
			   	 var temp = hvalue.substring(0,hvalue.length -1);
			   	 var num = parseInt(temp);
				 if (isNaN(num))
				 {
					_alertValMsg(height,"<dict:lang value="格式必须是数字加px，或数字加%" />");
			   		return false;
				 }
			   	}
			   	else
			   	{
			   		_alertValMsg(height,"<dict:lang value="高度" /> -- <dict:lang value="格式必须是数字加px，或数字加%" />");
			   		return false;
			   	}
				return true;
		}
		
		function validateInput(input)
		{
			var input_value = input.value;
		   	if(input_value != "" && input_value != null)
		   	{
		   		if(input_value.indexOf("\"") != -1  || input_value.indexOf("\'") != -1  || input_value.indexOf("<") != -1  || input_value.indexOf(">") != -1  
					|| input_value.indexOf("{") != -1  || input_value.indexOf("}") != -1  || input_value.indexOf("[") != -1  || input_value.indexOf("]") != -1  
					|| input_value.indexOf("(") != -1  || input_value.indexOf(")") != -1 )
				{
					_alertValMsg(input,"<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />");
			   		return false;	   		
			   	}
		   	}
		   	return true;
		}
		function init(){
		}
		
		function setUiData(thisObj){
			$('#UI_DATA_1').hide();
			$('#UI_DATA_2').hide();
			$('#UI_DATA_'+$(thisObj).val()).show();
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

		setUiData($("#paraMap_UI_PROGRESS_DATA_TYPE"));
	</script>
	<script type="text/javascript" 
	src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
	<script type="text/javascript">
	$(function()
	{
		 <%-- 设置显示当前的 --%>
		    if($("#"+db_dialect+"_sql").val() != ""){
		      $("#"+db_dialect+"_sql").show();
		      $("#codeType_"+db_dialect).attr("checked",true);
		    }else{
		      $("#comm_sql").show();
		      $("#codeType_comm").attr("checked",true);
		      
		    }
			if("<s:property value="dataMap.select"/>" == "number")
			{
				$("#number").attr("checked",true);
			}
			else if("<s:property value="dataMap.select"/>" == "all")
			{
				$("#all").attr("checked",true);
			}
			var uiData1 = document.getElementById("paraMap_UI_DATA_1");
			var width = document.getElementById("width");
			var height = document.getElementById("height");
			uiData1.addEventListener("input",function()
			{
				$("#paraMap_UI_DATA_1").attr("value",$("#paraMap_UI_DATA_1").attr("value").replace(/\D+/g,""));
			});
			//width.addEventListener("input",function()
			//{
			//	$("#width").attr("value",$("#width").attr("value").replace(/\D+/g,""));
			//});
			//height.addEventListener("input",function()
			//{
			//	$("#height").attr("value",$("#height").attr("value").replace(/\D+/g,""));
			//});
	});
	
function val_sql(){
var typeVal = $("#paraMap_UI_PROGRESS_DATA_TYPE").val();
			if(typeVal == "2"){
				 var db_sql = document.getElementById(db_dialect+"_sql");
				 var msg=$("#msg");
				    var val2 = db_sql.value.toUpperCase();
				    if(val.isBlank(val2)){
				      var comm_sql = document.getElementById("comm_sql");
				      val2 = comm_sql.value.toUpperCase();
				     }
		   		  //验证sql语句的表是否存在
		          var url = "${path}sys/BussModelAction_validTableIs.ms";
		           var valid_str ="";
			      $.ajax({
			          type: "POST",
			          dataType: "json",
			          url: url,
			          data: "paraMap.SQL="+val2,
			           async: false,
			          success: function(data){
			            if(data.ajaxMap != null){
			                valid_str =  data.ajaxMap.valid_str;
			                if(valid_str==null || valid_str==''){
			                 	//isSubmit = true;
			                 	//document.forms.add_form.submit();
			                 	//return true;
			                }else{
			                  //_alertValMsg(msg,valid_str);
			                  //isSubmit = false;
			                  // return false;
			                   
			                   return valid_str;
			                   
			                };
			              
			            };
			        },
			        error: function(msg){
			        	 //isSubmit = false;
			             //return false;
			        }
			      });
			      return valid_str;
		   	
	   		}
}

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
		 	
		 	form.verify({
		   		 paraMap_UI_DATA_1_verify: function(value,item){
		   		 		var typeVal = $("#paraMap_UI_PROGRESS_DATA_TYPE").val();
						if(typeVal == "1")
						{
							var paraMap_UI_DATA_1 = document.getElementById("paraMap_UI_DATA_1");
							if(val.isBlank(paraMap_UI_DATA_1))
							{
								return "数据总量不能为空";
							}	
						}
						
				 }
		     });
		     
		     form.verify({
		   		 comm_verify: function(value,item){
		   		 	var typeVal = $("#paraMap_UI_PROGRESS_DATA_TYPE").val();
		   		 	if(typeVal == "2")
					{
						 var db_sql = document.getElementById(db_dialect+"_sql");
						 var msg=$("#msg");
						    var val2 = db_sql.value.toUpperCase();
						    if(val.isBlank(val2)){
						      var comm_sql = document.getElementById("comm_sql");
						      val2 = comm_sql.value.toUpperCase();
						     }
						if(val.isBlank(val2))
						{
							return "<dict:lang value="当前数据库类型SQL语句或者通用sql" /> -- <dict:lang value="不能为空" />";
						}	
					}
					
					if($('input:radio[name="paraMap.codeType"]:checked').val()=='comm'){
		   		 			return val_sql();
		   		 		}
						
				 }
		     });
		     
		     form.verify({
		   		 width_verify: function(value,item){
		   		 	var width = document.getElementById("width");
				   	if(!validateInput(width))
				   	{
				   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
				   	}
				   	
				   	 var wvalue=$("#width").val();
					   var temps=null
					   var temps1
					   if(wvalue!=""&&wvalue!=null){
					    temps=wvalue.substring(wvalue.length-2,wvalue.length);
					    temps1=wvalue.substring(wvalue.length-1,wvalue.length);
					   }
					   
					   	if("px"==temps)
					   	{
					   		var temp = wvalue.substring(0,wvalue.length -2);
						   	var num = parseInt(temp);
							if (isNaN(num))
							{
						   	 return "<dict:lang value="格式必须是数字加px，或数字加%" />";
							}
					   	}
					   	else if(temps1=="%")
					   	{
						   	var temp = wvalue.substring(0,wvalue.length -1);
						   	var num = parseInt(temp);
							if (isNaN(num))
							{
						   	 return "<dict:lang value="格式必须是数字加px，或数字加%" />";
							}
					   	}
					   	else
					   	{
					   		
					   		return "<dict:lang value="格式必须是数字加px，或数字加%" />";
					   	}
						
				 }
		     });
		     
		     form.verify({
		   		 height_verify: function(value,item){
		   		 	var height = document.getElementById("height");
				   	if(!validateInput(height))
				   	{
				   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
				   	}
				   	
				   	var hvalue=$("#height").val();
					    var temps=null;
					    var temps1=null;
					    if(hvalue!=""&&hvalue!=null){
						    temps=hvalue.substring(hvalue.length-2,hvalue.length);
						   	temps1=hvalue.substring(hvalue.length-1,hvalue.length);
						}
					   	if(height.value == "" || height.value == null)
					   	{
					   	}
					   	else if("px"==temps)
					   	{
					   	 var temp = hvalue.substring(0,hvalue.length -2);
					   	 var num = parseInt(temp);
						 if (isNaN(num))
						 {
					   		return "<dict:lang value="格式必须是数字加px，或数字加%" />";
						 }
					   	}
					   	else if(temps1=="%")
					   	{
					   	 var temp = hvalue.substring(0,hvalue.length -1);
					   	 var num = parseInt(temp);
						 if (isNaN(num))
						 {
					   		return "<dict:lang value="格式必须是数字加px，或数字加%" />";
						 }
					   	}
					   	else
					   	{
					   		return "<dict:lang value="高度" /> -- <dict:lang value="格式必须是数字加px，或数字加%" />";
					   	}
						
				 }
		     });
		     
		     form.verify({
		   		 oracle_verify: function(value,item){
		   		 		if($('input:radio[name="paraMap.codeType"]:checked').val()=='oracle'){
		   		 			return val_sql();
		   		 		}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 sqlserver_verify: function(value,item){
		   		 		if($('input:radio[name="paraMap.codeType"]:checked').val()=='sqlserver'){
		   		 			return val_sql();
		   		 		}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 mysql_verify: function(value,item){
		   		 		if($('input:radio[name="paraMap.codeType"]:checked').val()=='mysql'){
		   		 			return val_sql();
		   		 		}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 pg_verify: function(value,item){
		   		 		if($('input:radio[name="paraMap.codeType"]:checked').val()=='pg'){
		   		 			return val_sql();
		   		 		}
		   		 		
				 }
		     });
	
	    });
	    
})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>