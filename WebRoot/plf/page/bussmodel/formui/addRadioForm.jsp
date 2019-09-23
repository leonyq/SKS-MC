<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="单选按钮" />UI <dict:lang value="配置" />
	</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
</head>
<style>
	#editCode{
	display: block;
	  width: 20px;
	  height: 20px;
	  background-size: cover;
	  background-image:url(${path}/plf/images/control_code.png);
	  
	}
	
	#editCode:hover{
	background-image:url(${path}/plf/images/control_code_h.png);
		
	}
	
</style>
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
						<td  class="tr1 table" >
							<span class="Eng">*</span><dict:lang value="数据来源" />
						</td>
						<td >
							<dict:selectDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}"  id="paraMap_UI_DATA_TYPE" 
							name="paraMap.UI_DATA_TYPE"	bindEvent="setUiData" />
							<!-- <dict:radioDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}" id="paraMap_UI_DATA_TYPE_" 
								name="paraMap.UI_DATA_TYPE" style="width:30px;" /> -->
							
						</td>
					</tr>
					<c:if test="${mcIsOpenAuth eq '1' || (mcIsOpenAuth eq '0' && isOldAuthDataPattern eq '1')}">
				   <tr id = "showIsByDataAuthFilter" style="display: none;">
						<td width="30%" class="tr1" >
							<span class="Eng">*</span><dict:lang value="组织机构过滤数据" />
						</td>
						<td width="70%">
						<select id="paraMap_IS_BY_DATA_AUTH_FILTER"    name="paraMap.isByDataAuthFilter">
								<option  <s:if test="dataMap.isByDataAuthFilter == 1 ">selected="selected"</s:if> value="1"><dict:lang value="是"/></option>
								<option  <s:if test="dataMap.isByDataAuthFilter == 2 ">selected="selected"</s:if> value="2"><dict:lang value="否"/></option>
							</select>
						</td>
					</tr>
					
					<%--<tr id = "showIsByDataAuthFkFilter" style="display: none;">
						<td width="30%" class="tr1" >
							<span class="Eng">*</span><dict:lang value="主表组织机构等于外键表组织机构过滤" />
						</td>
						<td width="70%">
						<select id="paraMap_IS_BY_DATA_AUTH_FK_FILTER" name="paraMap.isByDataAuthAndFkFilter">
								<option  <s:if test="dataMap.isByDataAuthAndFkFilter == 1 ">selected="selected"</s:if> value="1"><dict:lang value="是"/></option>
								<option  <s:if test="dataMap.isByDataAuthAndFkFilter == 2 ">selected="selected"</s:if> value="2"><dict:lang value="否"/></option>
							</select>
						</td>
					</tr>
					--%></c:if>
					<%@ include file="inc_save_mark_att.jsp"%>
					
					<!-- //多组织机构数据权限改造lth -->
					<tr id="IS_OPEN_DATA_AUTH">
						<td width="20%" class="tr1 table" >
							<dict:lang value="是否关联组织机构" />
						</td>
						<td width="80%">
						<dict:selectDict dictCode="IS_OPEN_DATA_AUTH" id="IS_OPEN_DATA_AUTH_ID"  verify="IS_OPEN_DATA_AUTH_ID_verify" dictValue="%{dataMap.IS_OPEN_DATA_AUTH}" custom_option="<option value=''>%{getText('--请选择--')}</option>"  name="paraMap.IS_OPEN_DATA_AUTH"  />
						</td>
					</tr>
					
					<tr id="UI_DATA_1" style="display: none;">
						<td  class="tr1 table" >
							<span class="Eng">*</span><dict:lang value="手工输入常量" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_1" name="paraMap.UI_DATA_1" value="<s:property value="dataMap.UI_DATA_1"/>" />
							
							<br>示例数据 1:福建,2:北京,3:上海
						</td>
					</tr>
					<tr id="UI_DATA_2" style="display: none;">
						<td  class="tr1 table" >
							
							<span class="Eng">*</span><dict:lang value="SQL语句" />
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
						<!-- 	<textarea id="paraMap_UI_DATA_2" name="paraMap.UI_DATA_2" rows="6" cols="" style="width: 100%;"><s:property value="dataMap.UI_DATA_2"/></textarea> -->
												              
			<textarea id="comm_sql"  lay-verify="comm_verify" name="paraMap.UI_DATA_11" rows="4"
              style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_11"/></textarea>
              
              
              <textarea id="oracle_sql" lay-verify="oracle_verify" name="paraMap.UI_DATA_8" rows="4"
              style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_8"/></textarea>
              
              <textarea id="sqlserver_sql" lay-verify="sqlserver_verify" name="paraMap.UI_DATA_9" rows="4" 
              style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_9"/></textarea>
              
              <textarea id="mysql_sql" lay-verify="mysql_verify" name="paraMap.UI_DATA_10" rows="4" 
              style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_10"/></textarea>
              
              <textarea id="pg_sql" lay-verify="pg_verify" name="paraMap.UI_DATA_PG" rows="4" 
			  style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_PG"/></textarea>
							
						</td>
					</tr>
					<tr id="UI_DATA_3" style="display: none;">
						<td  class="tr1 table" >
							<span class="Eng">*</span><dict:lang value="数据字典编码(key)" />
						</td>
						<td >
							
							<!--  
							<input type="button" style="width:66px" value="<dict:lang value="选择" />" onclick="selToDict(this);" class="botton_img_add">
							-->

							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
                      		<input type="text" class="p_r_30" id="paraMap_UI_DATA_3" lay-verify="paraMap_UI_DATA_3_verify" name="paraMap.UI_DATA_3" value="<s:property value="dataMap.UI_DATA_3"/>" />
							
                            <i class="layui-icon layui-icon-search" onclick="selToDict(this);" style="position: absolute;top:11px;right: 8px;"></i>
                        	</div>
							
						</td>
					</tr>
					<tr id="UI_DATA_4" style="display: none;">
						<td  class="tr1 table" >
							<dict:lang value="外键配置" />
						</td>
						<td >
							<span style="display:inline-block;width: 80px;"><span class="Eng">*</span>外键表名</span>&nbsp;&nbsp;
							<input type="text" id="paraMap_UI_DATA_4_1" lay-verify="paraMap_UI_DATA_4_1_verify" name="paraMap.UI_DATA_4_1" value="<s:property value="dataMap.UI_DATA_4_1"/>" onkeyup="javascript:replaceLikeVal(this)"/>
							<br>
							<span style="display:inline-block;width: 80px;"><span class="Eng">*</span>外键显示字段</span>&nbsp;&nbsp;
							<input type="text" id="paraMap_UI_DATA_4_2" lay-verify="paraMap_UI_DATA_4_2_verify" name="paraMap.UI_DATA_4_2" value="<s:property value="dataMap.UI_DATA_4_2"/>" onkeyup="javascript:replaceLikeVal(this)"/>
							<br>
							<span style="display:inline-block;width: 80px;"><span class="Eng">*</span>外键取值字段</span>&nbsp;&nbsp;
							<input type="text" id="paraMap_UI_DATA_4_3" lay-verify="paraMap_UI_DATA_4_3_verify" name="paraMap.UI_DATA_4_3" value="<s:property value="dataMap.UI_DATA_4_3"/>" onkeyup="javascript:replaceLikeVal(this)"/>
							<br>
							<span style="display:inline-block;width: 80px;"><span class="Eng">*</span>外键关联字段</span>&nbsp;&nbsp;
							<input type="text" id="paraMap_UI_DATA_4_4" lay-verify="paraMap_UI_DATA_4_4_verify" name="paraMap.UI_DATA_4_4" value="<s:property value="dataMap.UI_DATA_4_4"/>" onkeyup="javascript:replaceLikeVal(this)"/>
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
	function replaceLikeVal(comp){ 
		var regx=/[^A-Za-z0-9^_]/g
	    if (comp.value.match(regx)) {  
	    	comp.value=comp.value.replace(/[^A-Za-z0-9^_]/g,'')
	        _alertValMsg(comp,"<dict:lang value="只能输入A-Za-z0-9_" />");
	    }  
	}  
	function selToDict(obj){
		var iframeId=window.name;
		var paraMap_UI_DATA_3=$("#paraMap_UI_DATA_3").val();
		url="${path}sys/BussModelAction_showDict.ms?paraMap.UI_DATA_3="+paraMap_UI_DATA_3+"&mcIframeName="+window.parent.name;
		showPopWin(url, 950, 550,null,''+"<dict:lang value="数据字典" /> <dict:lang value="配置" />");
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
	var db_sql = document.getElementById(db_dialect+"_sql");
    var val2 = db_sql.value.toUpperCase();
    if(val.isBlank(db_sql)){
      var comm_sql = document.getElementById("comm_sql");
      val2 = comm_sql.value.toUpperCase();
     }
		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		if(typeVal == "2"){
			var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
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
		                 	isSubmit = true;
		                 	//document.forms.add_form.submit();
		                 	return true;
		                }else{
		                  _alertValMsg(db_sql,valid_str);
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
        
	function valData(){
		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		if(typeVal == "2"){
	/* 		var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
	   	if(val.isBlank(paraMap_UI_DATA_2)){
	   		_alertValMsg(paraMap_UI_DATA_2,"<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	} */
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
   	}else if(typeVal == "3"){
			var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
	   	if(val.isBlank(paraMap_UI_DATA_3)){
	   		_alertValMsg(paraMap_UI_DATA_3,"<dict:lang value="数据字典编码(key)" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}else if(typeVal == "4"){
			var paraMap_UI_DATA_4_1 = document.getElementById("paraMap_UI_DATA_4_1");
	   	if(val.isBlank(paraMap_UI_DATA_4_1)){
	   		_alertValMsg(paraMap_UI_DATA_4_1,"<dict:lang value="外键表名" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_2 = document.getElementById("paraMap_UI_DATA_4_2");
	   	if(val.isBlank(paraMap_UI_DATA_4_2)){
	   		_alertValMsg(paraMap_UI_DATA_4_2,"<dict:lang value="外键显示字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_3 = document.getElementById("paraMap_UI_DATA_4_3");
	   	if(val.isBlank(paraMap_UI_DATA_4_3)){
	   		_alertValMsg(paraMap_UI_DATA_4_3,"<dict:lang value="外键取值字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_4 = document.getElementById("paraMap_UI_DATA_4_4");
	   	if(val.isBlank(paraMap_UI_DATA_4_4)){
	   		_alertValMsg(paraMap_UI_DATA_4_4,"<dict:lang value="外键关联字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}
    
		return true;
	}
	
	function setUiData(thisObj){
		$('#UI_DATA_1').hide();
		$('#UI_DATA_2').hide();
		$('#UI_DATA_3').hide();
		$('#UI_DATA_4').hide();
		$('#UI_DATA_'+$(thisObj).val()).show();
		if("1"=="<c:out value='${mcIsOpenAuth}' />" || ("0"=="<c:out value='${mcIsOpenAuth}' />"  && "1" =="<c:out value='${isOldAuthDataPattern}' />")){
		if($(thisObj).val()=="4"){
			$("#showIsByDataAuthFilter").show();
			//$("#showIsByDataAuthFkFilter").show();
		}else{
			$("#showIsByDataAuthFilter").hide();
			//$("#showIsByDataAuthFkFilter").hide();
		}
		}
		//多组织机构数据权限改造lth
		if($(thisObj).val()=='2'){
			$('#IS_OPEN_DATA_AUTH').show();
		}else{
			$('#IS_OPEN_DATA_AUTH').hide();
		}
		
	}
	    <%-- 设置显示当前的 --%>
    if($("#"+db_dialect+"_sql").val() != ""){
      $("#"+db_dialect+"_sql").show();
      $("#codeType_"+db_dialect).attr("checked",true);
    }else{
      $("#comm_sql").show();
      $("#codeType_comm").attr("checked",true);
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
	function init(){
	}
		setUiData($("#paraMap_UI_DATA_TYPE"));
		
function val_sql(){
var db_sql = document.getElementById(db_dialect+"_sql");
    var val2 = db_sql.value.toUpperCase();
    if(val.isBlank(db_sql)){
      var comm_sql = document.getElementById("comm_sql");
      val2 = comm_sql.value.toUpperCase();
     }
		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		if(typeVal == "2"){
			var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
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
		                  //_alertValMsg(db_sql,valid_str);
		                 // isSubmit = false;
		                   //return false;
		                   
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
		   		 comm_verify: function(value,item){
		   		 		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		   		 		if(typeVal == "2"){
						 var db_sql = document.getElementById(db_dialect+"_sql");
					    var val2 = db_sql.value.toUpperCase();
					      if(val.isBlank(db_sql)){
					      var comm_sql = document.getElementById("comm_sql");
					      val2 = comm_sql.value.toUpperCase();
					      if(val.isBlank(comm_sql)){
					          return "<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />";
					        }
					      }
					   	}
					   	
					   	if($('input:radio[name="paraMap.codeType"]:checked').val()=='comm'){
		   		 			return val_sql();
		   		 		}
   	
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_3_verify: function(value,item){
		   		 		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		   		 		if(typeVal == "3"){
								var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
						   	if(val.isBlank(paraMap_UI_DATA_3)){
						   		return "<dict:lang value="数据字典编码(key)" /> -- <dict:lang value="不能为空" />";
						   	}
					   	}
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_1_verify: function(value,item){
		   		 		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		   		 		if(typeVal == "4"){
		   		 			var paraMap_UI_DATA_4_1 = document.getElementById("paraMap_UI_DATA_4_1");
						   	if(val.isBlank(paraMap_UI_DATA_4_1)){
						   		return "<dict:lang value="外键表名" /> -- <dict:lang value="不能为空" />";
						   	}
		   		 		}
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_2_verify: function(value,item){
		   		 		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		   		 		if(typeVal == "4"){
		   		 			var paraMap_UI_DATA_4_2 = document.getElementById("paraMap_UI_DATA_4_2");
						   	if(val.isBlank(paraMap_UI_DATA_4_2)){
						   		return "<dict:lang value="外键显示字段" /> -- <dict:lang value="不能为空" />";
						   	}
		   		 		}
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_3_verify: function(value,item){
		   		 		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		   		 		if(typeVal == "4"){
		   		 			var paraMap_UI_DATA_4_3 = document.getElementById("paraMap_UI_DATA_4_3");
						   	if(val.isBlank(paraMap_UI_DATA_4_3)){
						   		return "<dict:lang value="外键取值字段" /> -- <dict:lang value="不能为空" />";
						   	}
		   		 		}
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_4_verify: function(value,item){
		   		 		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		   		 		if(typeVal == "4"){
		   		 			var paraMap_UI_DATA_4_4 = document.getElementById("paraMap_UI_DATA_4_4");
						   	if(val.isBlank(paraMap_UI_DATA_4_4)){
						   		return "<dict:lang value="外键关联字段" /> -- <dict:lang value="不能为空" />";
						   	}
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
		   		 		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		   		 		if(typeVal == "2"){
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
				 }
		     });
	
	    });
	    
})

</script>
<script src="${path}plf/page/js_files/comm/chk.form.ui.control.vals.js?_mc_res_version=<%=PlfStaticRes.ChkFormUiControlVals %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>