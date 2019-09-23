<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="弹出选择窗口" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
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
		     url=str+"?paraMap.UI_MODEL_ID=ui26"+url;
		    location.href=url;
		   //location.href=url;
		  }//function getGoUrl(){
		
		</script>
</head>

	<style type="text/css">
	.table-mc-form input {
		display: inline-block;
		width: 100%;
		height: 100%;
		border: none;
		outline: none;
		background-color: transparent;
	}
	div.mc-select {  
	    width: 100%;
	    height: 100%;
	    border-radius: 2px;
	    border: 1px solid #e6e6e6;
	    position: relative;
	}
	div.mc-select select{
	    border: none;
	    outline: none;
	    width: 100%;
	    height: 100%;
	    appearance: none;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    padding-left: 10px;
	}
	div.mc-select .layui-icon-triangle-d {
		position: absolute;
		right: 0;
		top: -15%;
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
						<td colspan="2" class="mc-database-radio-td"> 
    						<input type="radio" name="selectItem"  checked  style="width:20px;vertical-align:middle;" value="1" title="自定义">
							
							<input type="radio" name="selectItem"   lay-filter="getGoUrl"  style="width:20px;vertical-align:middle;" value="2" title="公用列表">
							  
						</td>
					</tr>
					
					<tr>
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="数据来源" />
						</td>
						<td >
							<dict:selectDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}"  id="paraMap_UI_DATA_TYPE" 
							name="paraMap.UI_DATA_TYPE"	bindEvent="setUiData" filterVal="1,3"/>
						</td>
					</tr>
					
					<%@ include file="inc_save_mark_att.jsp"%>
					
					<tr id="UI_DATA_2" style="display: none;">
						<td  class="tr1 title" >
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
							<%-- 如果新增了支持的数据库类型，则这里需要新增 --%></br>
							
							<textarea id="comm_sql" name="paraMap.UI_DATA_11" lay-verify="comm_verify" rows="4"
							style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_11"/></textarea>
							
							<textarea id="oracle_sql" name="paraMap.UI_DATA_8" lay-verify="oracle_verify" rows="4"
							style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_8"/></textarea>
							
							<textarea id="sqlserver_sql" name="paraMap.UI_DATA_9" lay-verify="sqlserver_verify" rows="4" 
							style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_9"/></textarea>
							
							<textarea id="mysql_sql" name="paraMap.UI_DATA_10" lay-verify="mysql_verify" rows="4" 
							style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_10"/></textarea>
							
							<textarea id="pg_sql" name="paraMap.UI_DATA_PG" lay-verify="pg_verify" rows="4" 
			  				style="font-size: 14px;width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.UI_DATA_PG"/></textarea>
            
						</td>
					</tr>
					<tr id="UI_DATA_7">
						<td  class="tr1 title" >
							<dict:lang value="字段显示别名" />
						</td>
						<td >
							<input type="hidden" id="paraMap_UI_DATA_7" name="paraMap.UI_DATA_7" value="<s:property value="dataMap.UI_DATA_7"/>" />
							
							 <input type="button" lay-verify="getfields_verify" id="getFieldBtn" class="layui-btn layui-btn-xs" value="<dict:lang value="获取字段" />"
							  style="width: 70px;margin-bottom:5px;" title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							
							<table class="table_list table-mc-form" id="fieldsTable" >
								<thead>
									<tr>
										<th style="background: rgb(242,242,242);white-space: normal;padding: 0px 0px !important;"><dict:lang value="字段名" /></th>
										<th style="background: rgb(242,242,242);white-space: normal;padding: 0px 0px !important;"><dict:lang value="别名" /></th>
										<th style="background: rgb(242,242,242);white-space: normal;padding: 0px 0px !important;"><dict:lang value="查询条件" /></th>
										<th style="background: rgb(242,242,242);white-space: normal;padding: 0px 0px !important;"><dict:lang value="是否显示" /></th>
										<th style="background: rgb(242,242,242);white-space: normal;padding: 0px 0px !important;"><dict:lang value="宽高" /></th>
										<!-- <th width="10%"><img id="addRowImg" src="${path}images/add.png" style="width:20px;height:20px;cursor:pointer;" title="<dict:lang value="添加行" />"/></th>-->
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</td>
					</tr>		
					<tr id="UI_DATA_4" style="">
						<td class="tr1 title" >
							<dict:lang value="外键配置" />
						</td>
						<td>
							<div class="m-t-10">
								<span class="m-b-5" style="display:inline-block;width: 100px;"><span class="Eng">*</span>外键表名</span>&nbsp;&nbsp;
								<input type="text" id="paraMap_UI_DATA_4_1" lay-verify="paraMap_UI_DATA_4_1_verify" name="paraMap.UI_DATA_4_1" value="<s:property value="dataMap.UI_DATA_4_1"/>" onkeyup="javascript:replaceLikeVal(this)"/>
							</div>
							
							<div class="m-t-10">
								<span class="m-b-5" style="display:inline-block;width: 100px;"><span class="Eng">*</span>外键显示字段</span>&nbsp;&nbsp;
								<input type="text" id="paraMap_UI_DATA_4_2" lay-verify="paraMap_UI_DATA_4_2_verify" name="paraMap.UI_DATA_4_2" value="<s:property value="dataMap.UI_DATA_4_2"/>" onkeyup="javascript:replaceLikeVal(this)"/>
							</div>
							
							<div class="m-t-10">	
								<span class="m-b-5" style="display:inline-block;width: 100px;"><span class="Eng">*</span>外键取值字段</span>&nbsp;&nbsp;
								<input type="text" id="paraMap_UI_DATA_4_3" lay-verify="paraMap_UI_DATA_4_3_verify" name="paraMap.UI_DATA_4_3" value="<s:property value="dataMap.UI_DATA_4_3"/>" onkeyup="javascript:replaceLikeVal(this)"/>
							</div>
							
							<div class="m-t-10">
								<span class="m-b-5" style="display:inline-block;width: 100px;"><span class="Eng">*</span>外键关联字段</span>&nbsp;&nbsp;
								<input type="text" id="paraMap_UI_DATA_4_4" lay-verify="paraMap_UI_DATA_4_4_verify" name="paraMap.UI_DATA_4_4" value="<s:property value="dataMap.UI_DATA_4_4"/>" onkeyup="javascript:replaceLikeVal(this)"/>
							</div>
							
						</td>
					</tr>
					<tr id="UI_DATA_13">
						<td  class="tr1 title" >
							ORDER BY
						</td>
						<td >
						<input type="text"  id="paraMap_IS_ORDER_BY" name="paraMap.IS_ORDER_BY" value="<s:property value="dataMap.IS_ORDER_BY"/>"  />
						</td>
					</tr>	
					<tr id="IS_OPEN_DATA_AUTH">
						<td  class="tr1 title" >
							<dict:lang value="是否关联组织机构" />
						</td>
						<td >
						<dict:selectDict dictCode="IS_OPEN_DATA_AUTH" id="IS_OPEN_DATA_AUTH_ID" verify="IS_OPEN_DATA_AUTH_ID_verify" dictValue="%{dataMap.IS_OPEN_DATA_AUTH}" custom_option="<option value=''>%{getText('--请选择--')}</option>"  name="paraMap.IS_OPEN_DATA_AUTH"  />
						</td>
		 			 </tr>		
		 			 
		 			  <%--<tr id="IS_OPEN_DATA_AUTH_PROMPT">
						<td  class="tr1 title" >
							<dict:lang value="是否开启组织机构提示" />
						</td>
						<td >
						<dict:selectDict dictCode="IS_OPEN_DATA_AUTH_PROMPT" dictValue="%{dataMap.IS_OPEN_DATA_AUTH_PROMPT}" custom_option="<option value=''>%{getText('--请选择--')}</option>"  name="paraMap.IS_OPEN_DATA_AUTH_PROMPT"  />
						</td>
		  			  </tr>		
						
						
					--%><tr id="UI_DATA_12">
						<td  class="tr1 title" >
							<dict:lang value="窗口宽度" />
						</td>
						<td >
							<input type="text" id="paraMap_WP_WIDTH" lay-verify="paraMap_WP_WIDTH_verify" name="paraMap.WP_WIDTH" value="<s:property value="dataMap.WP_WIDTH"/>" />
						</td>
					</tr>	
					<tr id="UI_DATA_12">
						<td  class="tr1 title" >
							<dict:lang value="窗口高度" />
						</td>
						<td >
							<input type="text" id="paraMap_WP_HEIGHT" name="paraMap.WP_HEIGHT" lay-verify="paraMap_WP_HEIGHT_verify" value="<s:property value="dataMap.WP_HEIGHT"/>" />
						</td>
					</tr>	
					<tr id="UI_DATA_12">
						<td  class="tr1 title" >
							<dict:lang value="是否全屏" />
						</td>
						<td >
							<select id="paraMap_WP_FULL_SCREEN" name="paraMap.WP_FULL_SCREEN"><option value='0' <c:if test="${dataMap.WP_FULL_SCREEN==0}">selected</c:if>>否</option><option value='1' <c:if test="${dataMap.WP_FULL_SCREEN==1}">selected</c:if>>是</option></select>
						</td>
					</tr>		
												
					<tr id="UI_DATA_3">
						<td  class="tr1 title" >
							<dict:lang value="传参函数名称" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_3" lay-verify="paraMap_UI_DATA_3_verify" name="paraMap.UI_DATA_3" value="<s:property value="dataMap.UI_DATA_3"/>" />
						</td>
					</tr>
					<tr id="UI_DATA_4">
						<td  class="tr1 title" >
							<dict:lang value="传参函数体" />
							<br>
			<i class="editCode" style="float: right;margin-right:30px;" id="editCode" onclick="editJsValFun('paraMap_UI_DATA_4');"></i> 
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_4" name="paraMap.UI_DATA_4" rows="6" 
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_4"/></textarea>
						</td>
					</tr>
					<tr id="UI_DATA_5">
						<td  class="tr1 title" >
							<dict:lang value="自定义回调函数名称" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_5" name="paraMap.UI_DATA_5"  lay-verify="paraMap_UI_DATA_5_verify" value="<s:property value="dataMap.UI_DATA_5"/>" />
						</td>
					</tr>
					<tr id="UI_DATA_6">
						<td  class="tr1 title" >
							<dict:lang value="自定义回调函数体" />
							<br>
			<i class="editCode" style="float: right;margin-right:38px;" id="editCode" onclick="editJsValFun('paraMap_UI_DATA_6');"></i> 
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_6" name="paraMap.UI_DATA_6" rows="6" 
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_6"/></textarea>
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
	
	function editJsValFun(thisObj){
		curJsFunObj = $("#"+thisObj);
		var url = "${path}sys/BussModelAction_forEditJsValFun.ms?funcFlag=control&mcIframeName="+parent.frameElement.name;
		showPopWin(url, '99%', '99%',null,"修改"); 
	}
	
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
	
	function setJsFunCode(code){
		curJsFunObj.val(code) ;
	}
	function setSqlFunCode(id,code,checkedVal){
		$("#"+id).val(code);
		
			if("CODE_BASE" == checkedVal){
				$("#codeType_comm").click();
				$("#codeType_comm").attr("checked",'checked');
			}else if("CODE_ORACLE" == checkedVal){
			
			$("#codeType_oracle").click();
			$("#codeType_oracle").attr("checked",'checked');
			}else if("CODE_SQLSERVER" == checkedVal){
			
			$("#codeType_sqlserver").click();
			$("#codeType_sqlserver").attr("checked",'checked');
			
			}else if("CODE_MYSQL" == checkedVal){
			
			$("#codeType_mysql").click();
			$("#codeType_mysql").attr("checked",'checked');
			
			}else if("CODE_PG" == checkedVal ){
			$("#codeType_pg").click();
			$("#codeType_pg").attr("checked",'checked');
			}
			layui.form.render('radio');
	}
	
	function setJsFunObjFoucue(){
		//curJsFunObj.focus();
	}
	
	function replaceLikeVal(comp){ 
		var regx=/[^A-Za-z0-9^_]/g
	    if (comp.value.match(regx)) {  
	    	comp.value=comp.value.replace(/[^A-Za-z0-9^_]/g,'')
	        _alertValMsg(comp,"<dict:lang value="只能输入A-Za-z0-9_" />");
	    }  
	}  
	<%-- 当前数据库类型 --%>
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
		
		/*
		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		if(typeVal == "2"){
			var db_sql = document.getElementById(db_dialect+"_sql");
			var val2 = db_sql.value.toUpperCase();
				if(val.isBlank(db_sql)){
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
		                if(typeof(valid_str) == "undefined" || valid_str==null || valid_str==''){
		                 	//isSubmit = true;
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
		
		*/
		return true;
	}
        
	function valData(){
	
		var db_sql = document.getElementById(db_dialect+"_sql");
		var val2 = db_sql.value.toUpperCase();
		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		
			if(val.isBlank(db_sql)){
				var comm_sql = document.getElementById("comm_sql");
				val2 = comm_sql.value.toUpperCase();
			}
		
		/*
		if(typeVal == "2"){
		   	if(val.isBlank(db_sql)){
				var comm_sql = document.getElementById("comm_sql");
				val2 = comm_sql.value.toUpperCase();
				if(val.isBlank(comm_sql)){
			   		_alertValMsg(db_sql,"<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />");
			   		return false;
		   		}
		   	}
		   	if(val2.indexOf("VAL") == -1 ){
		   		_alertValMsg(db_sql,"<dict:lang value="SQL语句" /> -- <dict:lang value="语句中应该包含VAL字段" />");
		   		return false;	   		
		   	}
		   	
		   	var len_hqzd = $("#fieldsTable tr:gt(0)").length;
			if("<c:out value='${paraMap.UI_COMP__TYPE}' />" != "UI_COMP_VIEW" && len_hqzd==0){
	        	_alertValMsg(db_sql,"<dict:lang value="请先获取字段" />");
	      		backVal = false;
	      		return false;
	      	}
	      	
	   	}else if(typeVal=="4"){
	   		var val41 = $("#paraMap_UI_DATA_4_1").val();
	   		if(val41==""){
	   			_alertValMsg($("#paraMap_UI_DATA_4_1"),"<dict:lang value="外键配置" /> -- <dict:lang value="外键表名不能为空" />");
	   			return false;	
	   		}
	   		var val42 = $("#paraMap_UI_DATA_4_2").val();
	   		if(val42==""){
	   			_alertValMsg($("#paraMap_UI_DATA_4_2"),"<dict:lang value="外键配置" /> -- <dict:lang value="外键显示字段不能为空" />");
	   			return false;	
	   		}
	   		var val43 = $("#paraMap_UI_DATA_4_3").val();
	   		if(val43==""){
	   			_alertValMsg($("#paraMap_UI_DATA_4_3"),"<dict:lang value="外键配置" /> -- <dict:lang value="外键取值字段不能为空" />");
	   			return false;	
	   		}
	   		var val44 = $("#paraMap_UI_DATA_4_4").val();
	   		if(val44==""){
	   			_alertValMsg($("#paraMap_UI_DATA_4_4"),"<dict:lang value="外键配置" /> -- <dict:lang value="外键关联字段不能为空" />");
	   			return false;	
	   		}
	   	}
	   	
	   	if(val2.indexOf("VAL") == -1 || val2.indexOf("MKEY") == -1){
        	_alertValMsg(db_sql,"<dict:lang value="SQL语句" /> -- <dict:lang value="语句中应该同时包含MKEY和VAL字段" />");
        	return false;       
        }
	   	
	   	var wp_width = document.getElementById("paraMap_WP_WIDTH");
	   	if(!validateInput(wp_width))
	   	{
	   		return false;
	   	}
	   	
	   	var wp_high = document.getElementById("paraMap_WP_HEIGHT");
	   	if(!validateInput(wp_high))
	   	{
	   		return false;
	   	}
	   	var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
	   	if(!validateInput(paraMap_UI_DATA_3))
	   	{
	   		return false;
	   	}
	   	
	   	var paraMap_UI_DATA_5 = document.getElementById("paraMap_UI_DATA_5");
	   	if(!validateInput(paraMap_UI_DATA_5))
	   	{
	   		return false;
	   	}
		*/
		
		var backVal = true;
	   	var fieldName = "";//字段名
	   	var showName = "";//别名
	   	var selVal = "";//是否为搜索条件
	   	var filedsVal = "[";//拼装成json值
	   	var len = $("#fieldsTable tr:gt(0)").length;
	   	//console.log(len);
		$("#fieldsTable tr:gt(0)").each(function(i){
			//console.log(i);
			fieldName = $($(this).find("input").get(0)).val();
			showName = $($(this).find("input").get(1)).val();
			selVal = $($(this).find("select").get(0)).val();
			objStyle = $($(this).find("input").get(2)).val();
			isShowVal = $($(this).find("select").get(1)).val();
			typeName = $($(this).find("input").get(4)).val();
			if(fieldName == "" || fieldName == null){
				_alertValMsg($($(this).find("input").get(0)),"<dict:lang value="字段名" /> -- <dict:lang value="不能为空" />");
				backVal = false;
				return false;
			}
			
			if(fieldName.indexOf("\"") > 0){
				_alertValMsg($($(this).find("input").get(0)),"<dict:lang value="字段名" /> -- <dict:lang value="不能包含敏感字符:如双引号" />");
				backVal = false;
				return false;
			}
			
			if(showName == "" || showName == null){
				_alertValMsg($($(this).find("input").get(1)),"<dict:lang value="别名" /> -- <dict:lang value="不能为空" />");
				backVal = false;
				return false;
			}
			
						
			if(showName.indexOf("\"") > 0){
				_alertValMsg($($(this).find("input").get(1)),"<dict:lang value="别名" /> -- <dict:lang value="不能包含敏感字符:如双引号" />");
				backVal = false;
				return false;
			}
			
			if(objStyle.indexOf("\"") !=-1 || objStyle.indexOf("\'") !=-1 || objStyle.indexOf("<") !=-1 || objStyle.indexOf(">") !=-1 
			|| objStyle.indexOf("{") !=-1 || objStyle.indexOf("}") !=-1 || objStyle.indexOf("[") !=-1 || objStyle.indexOf("]") !=-1 
			|| objStyle.indexOf("(") !=-1 || objStyle.indexOf(")") !=-1 )
			{
				_alertValMsg($($(this).find("input").get(2)),"<dict:lang value="宽高" /> -- <dict:lang value="不能包含敏感字符:如双引号" />");
				backVal = false;
				return false;
			}
			
			if(filedsVal.toUpperCase().indexOf(fieldName.toUpperCase()) != -1){
				_alertValMsg($($(this).find("input").get(0)),"<dict:lang value="字段名" /> -- <dict:lang value="不能重复配置" />");
				backVal = false;
				return false;				
			}
			
			if(val2.indexOf(fieldName.toUpperCase()) == -1){
				_alertValMsg($($(this).find("input").get(0)),"<dict:lang value="字段名" /> -- <dict:lang value="不存在SQL语句中，请检查是拼写有误" />");
				backVal = false;
				return false;				
			}
			
			filedsVal += "{\"FIELD_NAME\":\""+fieldName+"\",\"SHOW_NAME\":\""+showName+"\",\"IS_SEARCH\":\""+selVal+"\",\"OBJ_STYLE\":\""+objStyle+"\",\"IS_SHOW\":\""+isShowVal+"\",\"TYPE_NAME\":\""+typeName+"\"}";
			
			if(i < len - 1){
				filedsVal += ",";
			}
			
		});
		
		//var isPpenDataAuth = $("#IS_OPEN_DATA_AUTH_ID").val();
		//if((val2.indexOf("{mc_data_auth")>-1||val2.indexOf("{MC_DATA_AUTH")>-1) && isPpenDataAuth!="1"){
		//	_alertValMsg($("#IS_OPEN_DATA_AUTH_ID"),"<dict:lang value="SQL中具有组织机构占位符" /> -- <dict:lang value="请开启关联组织机构权限" />");
		//   	return false;
		//}
		
		filedsVal += "]";
	   	
	   	if(len > 0 && backVal){
	   		$("#paraMap_UI_DATA_7").val(filedsVal);
	   	}else{
	   		$("#paraMap_UI_DATA_7").val("");
	   	}
		return backVal;
	}
	
	function setUiData(thisObj){
		$('#UI_DATA_2').hide();
		$('#UI_DATA_4').hide();
		if($(thisObj).val()=='4'){
			$('#UI_DATA_7').hide();
		}else{
			$('#UI_DATA_7').show();
		}
		$('#UI_DATA_'+$(thisObj).val()).show();
	}
	
	function validateInput(input)
	{
		var input_value = input.value;
	   	if(input_value != "" && input_value != null)
	   	{
	   		if(input_value.indexOf("\"") != -1  || input_value.indexOf("\'")  != -1  || input_value.indexOf("<") != -1  || input_value.indexOf(">") != -1  
				|| input_value.indexOf("{") != -1  || input_value.indexOf("}") != -1  || input_value.indexOf("[")  != -1  || input_value.indexOf("]") != -1  
				|| input_value.indexOf("(") != -1  || input_value.indexOf(")") != -1 )
			{
				_alertValMsg(input,"<dict:lang value="不能包含敏感字符:如双引号,括号等特殊符号" />");
		   		return false;	   		
		   	}
	   	}
	   	return true;
	}
	
	function init(){
	}
		setUiData($("#paraMap_UI_DATA_TYPE"));
		
		var rowNo = 1;//行号
		$("#addRowImg").click(function(){
			addTr();
		});
		//添加行
		function addTr(){
			//var $tr = $("#fieldsTable tr:last");
			var $tr = $("#fieldsTable tbody");
			if($tr.size == 0){
				return;
			}
			var htmlTr = "<tr>"
						+"<td style='padding:5px;white-space: normal;padding: 0px 0px !important;'><input type='text' class='mc-list-input-edit' id='filedName_"+rowNo+"' name='filedName_"+rowNo+"' style='width:100%;'/></td>"
						+"<td style='white-space: normal;padding: 0px 0px !important;'><input type='text' class='mc-list-input-edit' id='showName_"+rowNo+"' name='showName_"+rowNo+"' style='width:100%;'/></td>"
						+"<td style='white-space: normal;padding: 0px 0px !important;'><select lay-ignore class='mc-list-input-edit' id='searchSel_"+rowNo+"' style='width:100%;'><option value='1'>是</option><option value='0'>否</option></select></td>"
						+"<td style='white-space: normal;padding: 0px 0px !important;'><select lay-ignore class='mc-list-input-edit' id='isShow_"+rowNo+"' style='width:100%;'><option value='1'>是</option><option value='0'>否</option></select></td>"
						+"<td style='white-space: normal;padding: 0px 0px !important;'><input type='text' id='objStyle_"+rowNo+"' class='mc-list-input-edit' name='objStyle_"+rowNo+"' style='width:100%;'/></td>"
						
						//+"<td ><input type='hidden' id='typeName"+rowNo+"'  name='typeName_"+rowNo+"'  value='' /></td>"
						+"<input type='hidden' id='typeName"+rowNo+"'  name='typeName_"+rowNo+"'  value='' />"
						
						+"</tr>";
						//+"<td width='10%'><img src=\"${path}images/ContImg10.gif\" onclick='delTr(this);' style=\"width:20px;height:20px;cursor:pointer;\" title=\"<dict:lang value="删除" />\"/></td></tr>";
			$tr.append(htmlTr);
			rowNo ++;
			inputFocus(); //执行input focus/blur
		}		

		$(function(){
			
			var data7 = $("#paraMap_UI_DATA_7").val();//"<s:property value="dataMap.UI_DATA_7"/>";
			if(data7 != null &&　data7　!= ""){
				data7 = eval(data7);
				for(var i = 0;i < data7.length; i++){
					addTr();
					var lastTr = $("#fieldsTable tr:last");
					//console.log($(lastTr).html());
					//console.log(data7[i].SHOW_NAME);
					$($(lastTr).find("input").get(0)).val(data7[i].FIELD_NAME);
					$($(lastTr).find("input").get(1)).val(data7[i].SHOW_NAME);
					$($(lastTr).find("select").get(0)).val(data7[i].IS_SEARCH);
					$($(lastTr).find("input").get(2)).val(data7[i].OBJ_STYLE);
					$($(lastTr).find("select").get(1)).val(data7[i].IS_SHOW);
					$($(lastTr).find("input").get(4)).val(data7[i].TYPE_NAME);
				}
			}
			
			var pre_sql='';
			$("#getFieldBtn").click(function(){
				var db_sql = document.getElementById(db_dialect+"_sql");
				var val2 = db_sql.value;
				if(val.isBlank(db_sql)){
					db_sql = document.getElementById("comm_sql");
					val2 = db_sql.value;
					if(val.isBlank(db_sql)){
					   	_alertValMsg(db_sql,"<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />");
					   	return false;
					}
				}
				
				var all_fields='';
				$("#fieldsTable tr:gt(0)").each(function(i){
					//console.log(i);
					filedName = $($(this).find("input").get(0)).val();
					field_comment = $($(this).find("input").get(1)).val();
					selVal = $($(this).find("select").get(0)).val();
					isShowVal = $($(this).find("select").get(1)).val();
					objStyle = $($(this).find("input").get(2)).val();
					multiLang=true;
					
					if(!val.isBlank(filedName)){
						filedName=filedName+"@"+field_comment+"@"+selVal+"@"+isShowVal+"@"+objStyle+"@"+multiLang;
			            if(all_fields==''){
			            	all_fields=filedName;
			            }else{
			            	all_fields=all_fields+'||'+filedName;
			            }
			            
			      }
		
				});
				
				//alert(all_fields);
			    if(all_fields!=null && all_fields!='' && val2!=pre_sql){
			    	all_fields='';
			    	
			    }
			    
				var url = "${path}sys/BussModelAction_getFields.ms?paraMap.all_fields="+all_fields+"&paraMap.getfields_type=pop";
				util.showLoading("处理中...");
				$.ajax({
					type: "POST",
				    dataType: "json",
				    url: url,
				    data: "paraMap."+db_dialect+"="+val2.replace("?","%3F"),
					success: function(data){
							pre_sql=val2;	
							//alert(JSON.stringify(data));
							//util.alert(data.ajaxMap.nextselectId);
							util.closeLoading();
							if(null == data){return ;}
							//if(null == data.ajaxMap){return ;}
							//if(null != data.ajaxList){
							if(null != data.ajaxList_new2){
								//var aList = eval(data.ajaxList);
								var aList = eval(data.ajaxList_new2);
								
								$("#fieldsTable tbody").html("");
								for(var i = 0;i < aList.length; i++){
									addTr();
									var lastTr = $("#fieldsTable tr:last");
									//console.log($(lastTr).html());
									//console.log(data7[i].SHOW_NAME);

									$($(lastTr).find("input").get(0)).val(aList[i].filedName);
									$($(lastTr).find("input").get(1)).val(aList[i].field_comment);
									
									$($(lastTr).find("select").get(0)).val("1");
									if(aList[i].selVal!=null && aList[i].selVal!=''){
										$($(lastTr).find("select").get(0)).val(aList[i].selVal);
									}
									
									//$($(lastTr).find("select").get(1)).val("1");
									if(aList[i].isShowVal!=null && aList[i].isShowVal!=''){
										$($(lastTr).find("select").get(1)).val(aList[i].isShowVal);
									}
									
									if(aList[i].objStyle!=null && aList[i].objStyle!=''){
										$($(lastTr).find("input").get(2)).val(aList[i].objStyle);
									}
									
									/*
									if(aList[i].multiLang!=null && aList[i].multiLang!=''){
										//$($(lastTr).find("input[type=checkbox]")).val(aList[i].multiLang);
										
										if(aList[i].multiLang==true || aList[i].multiLang=='true'){
											$($(lastTr).find("input[type=checkbox]")).attr("checked",true);
										}else{
											$($(lastTr).find("input[type=checkbox]")).attr("checked",false);
										}
										
									}
									*/
									
									$($(lastTr).find("input").get(4)).val(aList[i].typeName);
									
								}
								//console.log($("#fieldsTable").html());
							}
						},
					error: function(msg){
							util.closeLoading();
							//util.alert("error:"+msg);
							util.alert("error:"+msg.responseText);
					  }
					});
				return false;
			});
			
			<%-- 设置显示当前的 --%>
			if($("#"+db_dialect+"_sql").val() != ""){
				$("#"+db_dialect+"_sql").show();
				$("#codeType_"+db_dialect).attr("checked",true);
			}else{
				$("#comm_sql").show();
				$("#codeType_comm").attr("checked",true);
			}
			
			
			if("<c:out value='${paraMap.UI_COMP__TYPE}' />" == "UI_COMP_VIEW"){
				$("#UI_DATA_7").hide();
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
var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		if(typeVal == "2"){
			var db_sql = document.getElementById(db_dialect+"_sql");
			var val2 = db_sql.value.toUpperCase();
				if(val.isBlank(db_sql)){
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
		                if(typeof(valid_str) == "undefined" || valid_str==null || valid_str==''){
		                 	//isSubmit = true;
		                 	//document.forms.add_form.submit();
		                 	//return true;
		                }else{
		                  //_alertValMsg(db_sql,valid_str);
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
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
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
				if(data.value=='2'){
					getGoUrl();
				}
			
		 	});
		 	
		 	form.verify({
		   		 comm_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
						var typeVal = $("#paraMap_UI_DATA_TYPE").val();
						if(typeVal == "2"){
						   	if(val.isBlank(db_sql)){
								var comm_sql = document.getElementById("comm_sql");
								val2 = comm_sql.value.toUpperCase();
								if(val.isBlank(comm_sql)){
							   		return "<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />";
						   		}
						   	}
						   	//if(val2.indexOf("VAL") == -1 ){
						   	//	return "<dict:lang value="SQL语句" /> -- <dict:lang value="语句中应该包含VAL字段" />";	   		
						   	//}
						   				
			   		 		if(val2.indexOf("VAL") == -1 || val2.indexOf("MKEY") == -1){
					        	return "<dict:lang value="SQL语句" /> -- <dict:lang value="语句中应该同时包含MKEY和VAL字段" />";       
					        }
					        
					        if($('input:radio[name="paraMap.codeType"]:checked').val()=='comm'){
		   		 				return val_sql();
		   		 	  		}
					      	
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 getfields_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
						var typeVal = $("#paraMap_UI_DATA_TYPE").val();
						if(typeVal == "2"){
						   	var len_hqzd = $("#fieldsTable tr:gt(0)").length;
							if("<c:out value='${paraMap.UI_COMP__TYPE}' />" != "UI_COMP_VIEW" && len_hqzd==0){
					      		return "<dict:lang value="请先获取字段" />";
					      	}
					      	
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_1_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
						var typeVal = $("#paraMap_UI_DATA_TYPE").val();
						
		   		 		if(typeVal=="4"){
					   		var val41 = $("#paraMap_UI_DATA_4_1").val();
					   		if(val41==""){
					   			return "<dict:lang value="外键配置" /> -- <dict:lang value="外键表名不能为空" />";	
					   		}

					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_2_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
						var typeVal = $("#paraMap_UI_DATA_TYPE").val();
						
		   		 		if(typeVal=="4"){
					   		var val42 = $("#paraMap_UI_DATA_4_2").val();
					   		if(val42==""){
					   			return "<dict:lang value="外键配置" /> -- <dict:lang value="外键显示字段不能为空" />";	
					   		}

					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_3_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
						var typeVal = $("#paraMap_UI_DATA_TYPE").val();
						
		   		 		if(typeVal=="4"){
					   		var val43 = $("#paraMap_UI_DATA_4_3").val();
					   		if(val43==""){
					   			return "<dict:lang value="外键配置" /> -- <dict:lang value="外键取值字段不能为空" />";	
					   		}

					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_4_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
						var typeVal = $("#paraMap_UI_DATA_TYPE").val();
						
		   		 		if(typeVal=="4"){
					   		var val44 = $("#paraMap_UI_DATA_4_4").val();
					   		if(val44==""){
					   			return "<dict:lang value="外键配置" /> -- <dict:lang value="外键关联字段不能为空" />";	
					   		}

					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_WP_WIDTH_verify: function(value,item){
		   		 		var wp_width = document.getElementById("paraMap_WP_WIDTH");
	   					if(!validateInput(wp_width))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_WP_HEIGHT_verify: function(value,item){
		   		 		var wp_high = document.getElementById("paraMap_WP_HEIGHT");
	   					if(!validateInput(wp_high))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_3_verify: function(value,item){
		   		 		var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
	   					if(!validateInput(paraMap_UI_DATA_3))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_5_verify: function(value,item){
		   		 		var paraMap_UI_DATA_5 = document.getElementById("paraMap_UI_DATA_5");
	   					if(!validateInput(paraMap_UI_DATA_5))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
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
		     
			form.verify({
		   		 IS_OPEN_DATA_AUTH_ID_verify: function(value,item){
		   		 		var db_sql = document.getElementById(db_dialect+"_sql");
						var val2 = db_sql.value.toUpperCase();
		
		   		 		var isPpenDataAuth = $("#IS_OPEN_DATA_AUTH_ID").val();
						if((val2.indexOf("{mc_data_auth")>-1||val2.indexOf("{MC_DATA_AUTH")>-1) && isPpenDataAuth!="1"){
						   	return "<dict:lang value="SQL中具有组织机构占位符" /> -- <dict:lang value="请开启关联组织机构权限" />";
						}
		   		 		
				 }
		     });
		 	
	
	    });
	    
})
		
</script>

<script src="${path}plf/page/js_files/comm/chk.form.ui.control.vals.js?_mc_res_version=<%=PlfStaticRes.ChkFormUiControlVals %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>