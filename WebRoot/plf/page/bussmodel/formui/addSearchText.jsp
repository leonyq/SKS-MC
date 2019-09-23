<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="实时搜索框" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
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
						<td  class="tr1 title" >
							每页显示数据条数
						</td>
						<td  >
						<input type="text" name="paraMap.number" lay-verify="number_verify" id="number" value="<s:property value="dataMap.UI_NUMBER"/>" ></input>
						</td>
					</tr>
					<tr id="UI_DATA_1">
						<td  class="tr1 title" >
							数据来源
							<br>
			<i class="editCode" style="float: right;margin-right:20px;" id="editCode" onclick="editSqlValFun('comm_sql');"></i>
						</td>
						
						<td  class="mc-database-radio-td">
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
							
							<textarea id="comm_sql" name="paraMap.UI_DATA_COMM" lay-verify="comm_verify" rows="4"
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_COMM"/></textarea>
							
							<textarea id="oracle_sql" name="paraMap.UI_DATA_ORACLE" lay-verify="oracle_verify" rows="4"
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_ORACLE"/></textarea>
							
							<textarea id="sqlserver_sql" name="paraMap.UI_DATA_SQLSERVER" lay-verify="sqlserver_verify" rows="4" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_SQLSERVER"/></textarea>
							
							<textarea id="mysql_sql" name="paraMap.UI_DATA_MYSQL" lay-verify="mysql_verify" rows="4" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_MYSQL"/></textarea>
							
							<textarea id="pg_sql" name="paraMap.UI_DATA_PG" lay-verify="pg_verify" rows="4" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_PG"/></textarea>
							
						</td>
						
						<%--<td >
							<textarea id="paraMap_UI_DATA_1" name="paraMap.UI_DATA_1" rows="6" cols="" style="width: 100%;" value="<s:property value="dataMap.UI_DATA_1"/>"><s:property value="dataMap.UI_DATA_1"/></textarea>
							<span class="Eng">*</span>
						</td>
					--%></tr>
					  <%@ include file="inc_save_mark_att.jsp"%>
					  
					  <!-- //多组织机构数据权限改造lth -->
					<tr id="IS_OPEN_DATA_AUTH">
						<td  class="tr1 title" >
							<dict:lang value="是否关联组织机构" />
						</td>
						<td >
						<dict:selectDict dictCode="IS_OPEN_DATA_AUTH" id="IS_OPEN_DATA_AUTH_ID"  verify="IS_OPEN_DATA_AUTH_ID_verify" dictValue="%{dataMap.IS_OPEN_DATA_AUTH}" custom_option="<option value=''>%{getText('--请选择--')}</option>"  name="paraMap.IS_OPEN_DATA_AUTH"  />
						</td>
					</tr>
					
					<tr>
		                <td width="20%" class="tr1" >
		                  <dict:lang value="是否多语言" />
		                </td>
		                <td width="80%">
		                  <dict:checkBoxDict name="paraMap.ISMORELANG" layskin="primary" id="ismorelang" dictCode="SELECTED" dictValue="%{dataMap.ISMORELANG}"
		                    style="width:90px;cursor: pointer;" />
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
		
		function add(thisObj)
		{		
			//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!valData()){
				return false;
			}
			
			var db_sql = document.getElementById(db_dialect+"_sql");
			var val2 = db_sql.value.toUpperCase();
			if(val.isBlank(db_sql)){
				var comm_sql = document.getElementById("comm_sql");
				val2 = comm_sql.value.toUpperCase();
		   	}
		   	
	   		//验证sql语句的表是否存在
	        var url = "${path}sys/BussModelAction_validTableIs.ms";
	        val2=val2.replace("%", "").replace("%", "").replace("%", "").replace("%", "");
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
		                  _alertValMsg(db_sql,valid_str);
		                  isSubmit = false;
		                   return false;

                }
                    }
                  },
		        error: function(msg){
		        	 isSubmit = false;
		             return false;
		        }
		    });
		    
		    //isSubmit = true;
		    //document.forms.add_form.submit();
		     return true;
		}
		
		function init(){
		}

		function valData()
		{	
		var number = document.getElementById("number");		
			if(val.isBlank(number))
			{
				_alertValMsg(number,"每页显示数据条数不能为空");
				return false;
			}	
			var db_sql = document.getElementById(db_dialect+"_sql");
			var val2 = db_sql.value.toUpperCase();
		   	if(val.isBlank(db_sql)){
				var comm_sql = document.getElementById("comm_sql");
				val2 = comm_sql.value.toUpperCase();
				if(val.isBlank(comm_sql)){
			   		_alertValMsg(db_sql,"<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />");
			   		return false;
		   		}
		   	}
			
			return true;
		}
//		function setUiData(thisObj){
//			$('#UI_DATA_1').hide();
//			$('#UI_DATA_2').hide();
//			$('#UI_DATA_'+$(thisObj).val()).show();
//		}
//		setUiData($("#paraMap_UI_PROGRESS_DATA_TYPE"));
	</script>
	<script type="text/javascript" 
	src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
	<script type="text/javascript">
	$(function()
	{
			//if("<s:property value="dataMap.select"/>" == "number")
			//{
			//	$("#number").attr("checked",true);
			//}
			//else if("<s:property value="dataMap.select"/>" == "all")
			//{
			//	$("#all").attr("checked",true);
			//}
			var number = document.getElementById("number");
			//var width = document.getElementById("width");
			//var height = document.getElementById("height");
			number.addEventListener("input",function()
			{
				$("#number").attr("value",$("#number").attr("value").replace(/\D+/g,""));
			});
			
			if($("#"+db_dialect+"_sql").val() != ""){
				
				$("#"+db_dialect+"_sql").show();
				$("#codeType_"+db_dialect).attr("checked",true);
			}else{
				$("#comm_sql").show();
				$("#codeType_comm").attr("checked",true);
			}

	});
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
	
function val_sql(){
var db_sql = document.getElementById(db_dialect+"_sql");
			var val2 = db_sql.value.toUpperCase();
			if(val.isBlank(db_sql)){
				var comm_sql = document.getElementById("comm_sql");
				val2 = comm_sql.value.toUpperCase();
		   	}
		   	
	   		//验证sql语句的表是否存在
	        var url = "${path}sys/BussModelAction_validTableIs.ms";
	        val2=val2.replace("%", "").replace("%", "").replace("%", "").replace("%", "");
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
		                  //_alertValMsg(db_sql,valid_str);
		                 // isSubmit = false;
		                  // return false;
		                   
		                   return valid_str;

                }
                    }
                  },
		        error: function(msg){
		        	 //isSubmit = false;
		             //return false;
		        }
		    });
		    return valid_str;
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
				       
			});
			
			form.verify({
		   		 number_verify: function(value,item){
		   		 		var number = document.getElementById("number");		
						if(val.isBlank(number))
						{
							return "每页显示数据条数不能为空";
						}	
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 comm_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
					   	if(val.isBlank(db_sql)){
							var comm_sql = document.getElementById("comm_sql");
							val2 = comm_sql.value.toUpperCase();
							if(val.isBlank(comm_sql)){
						   		return "<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />";
					   		}
					   	}
					   	
					   	if($('input:radio[name="paraMap.codeType"]:checked').val()=='comm'){
		   		 			return val_sql();
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
		     
		     //多组织机构数据权限改造lth
		     form.verify({
		   		IS_OPEN_DATA_AUTH_ID_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
					   	if(val.isBlank(db_sql)){
							var comm_sql = document.getElementById("comm_sql");
							val2 = comm_sql.value.toUpperCase();
							
							var isPpenDataAuth = $("#IS_OPEN_DATA_AUTH_ID").val();
							if((val2.indexOf("{mc_data_auth")>-1||val2.indexOf("{MC_DATA_AUTH")>-1) && isPpenDataAuth!="1"){
						   	return "<dict:lang value="SQL中具有组织机构占位符" /> -- <dict:lang value="请开启关联组织机构权限" />";
							}
							
					   	}
					   		
				 }
		     });
	
	    });
	    
})

</script>
<script src="${path}plf/page/js_files/comm/chk.form.ui.control.vals.js?_mc_res_version=<%=PlfStaticRes.ChkFormUiControlVals %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>