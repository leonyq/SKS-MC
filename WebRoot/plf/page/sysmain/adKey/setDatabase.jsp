<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
	<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param value="HotKey" name="1"/>
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
<style type="text/css">
		.all {
	width: 100%;
	}

	.cursor_hand {
	cursor: pointer;
	}
	.hd{
	    height: 40px;
    line-height: 40px;
    margin-bottom: 11px;
	}
	.optn {
    position: absolute;
    right: 0;
    top: 0px;
	}
	.hd .optn1 {
    position: absolute;
    right: 13px;
    top: 43px;
	}
	
	.func_table2{
    width: 100%;
    color: #333; 
    margin-bottom: 7px;
    height: 30px;
    line-height: 30px;
	}
	
	.func_table2 input[type="radio"]{
		vertical-align: middle;
		margin-top:-2px;
	}
	
	.optn1 button {
    border: 1px solid #aace36;
    border-radius: 2px;
    background-color: #fff;
    color: #666;
    height: 28px;
    line-height: 29px;
    padding: 0 10px;
    margin-right: 2px;
    cursor: pointer;
	}
	.optn2 button {
    border: 1px solid #aace36;
    border-radius: 2px;
    background-color: #fff;
    color: #666;
    height: 28px;
    font-size:13px;
    line-height: 26px;
    padding: 0 10px;
    margin-right: 2px;
    cursor: pointer;
	}
	
	td input[type="button"]{
		border: 1px solid #aace36;
	    border-radius: 2px;
	    background-color: #fff;
	    color: #666;
	    height: 28px;
	    line-height: 26px;
	    padding: 0 10px;
	    margin-right: 6px;
	    cursor: pointer;
	    float: right;
	  
	}
	
	td input[type="button"]:hover{
		background-color: #aace36;
	    color: #fff;
	}
	
	.addTable{
		width:90%;
	}
	.addTable th{
		border: 1px solid #dbe1ef;
		color: #666;
		background-color:#e6eaf4;
	}
	.addTable tr{
		height:30px;
	}
	
	.addTable tr:hover{
		background-color:#c3e2fb;
	}
	
	.addTable td{
		height:30px;
		border: 1px solid #dbe1ef;
		text-align:center;
	}
	
	.addTable tr:nth-of-type(1) td{
		border-top:0px;
	}
	.mCSB_scrollTools .mCSB_draggerContainer{ right:-6px }
</style>
</head>
<body style="background-color:#fff;">
	<div class="all">
		<form id="addData" name="addData" target="submitFrame">
			<div id="div_head" style="background-color: #f6f5f7;">
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<table width="100%"    style=" height: 38px;">
							<tr>
									<td align="left" width="400px" style="padding-left: 30px;">
											
											<div class="hd">
							                 <div class="optn">
							                 <table >
								                 <tr>
													<td width="100%" align="right" >
												   	<button type="button" onclick="return commit(this);" style="margin-top: 11px" ><i class="ico ico-save"></i><dict:lang value="提交" /></button>
												    <button type="button" onclick="closeWindow();" style="margin-right:10px;"><i class="ico ico-sc"></i><dict:lang value="取消" /></button>
													</td>
									    		</tr>
											</table>
											</div>
											</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<div id="div_changeForSQL" style="margin:15px 10px;background-color: #fff;height:237px;">
				<table class="func_table2">	
								<tr>
									<td align="left" width="400px"  style="font-size: 14px;line-height:30px;">数据库适配:&nbsp;<label
										for="sqlType_comm" class="cursor_hand"><input
											type="radio" id="sqlType_comm" name="paraMap.sqlType" value="commsql"
											/>通用</label>
											&nbsp;&nbsp;
										<label for="sqlType_oracle" class="cursor_hand"><input
											type="radio" id="sqlType_oracle" name="paraMap.sqlType"  value="oracle"
										     />ORACLE</label>
										    &nbsp;&nbsp;
										<label for="sqlType_mysql" class="cursor_hand"><input
											type="radio" id="sqlType_mysql" name="paraMap.sqlType" value="mysql"
											 />MYSQL</label>
											&nbsp;&nbsp;
										<label for="sqlType_sqlserver" class="cursor_hand"><input
											type="radio" id="sqlType_sqlserver" name="paraMap.sqlType" value="sqlserver"
											/>SQLSERVER</label>
										<label for="sqlType_pg" class="cursor_hand"><input
											type="radio" id="sqlType_pg" name="paraMap.sqlType" value="pg"
											/>PG</label>
											&#x3000;&#x3000;&#x3000;&#x3000;&#x3000;&#x3000;&#x3000;&#x3000;	
<input id="analyButton" type="button" onclick="analySql()" style="display: none;margin-right:0px;margin-top: 1px;" value="<dict:lang value='解析' />" />
										<input id="confirmButton" style="display: none;margin-top: 1px;" type="button" onclick="showSqlParam()" value="<dict:lang value='确定' />" />
									</td>
								</tr>
							</table>
				<div id="div_changeForSQLName">
						<table style="width: 100%;">
							<tr>
								<td>
							<textarea id="comm_sql" name="paraMap.comm_sql" rows="6"
							style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
							<textarea id="oracle_sql" name="paraMap.oracle_sql" rows="6"
							style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
							<textarea id="sqlserver_sql" name="paraMap.sqlserver_sql" rows="6" 
							style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
							<textarea id="mysql_sql" name="paraMap.mysql_sql" rows="6" 
							style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
							<textarea id="pg_sql" name="paraMap.pg_sql" rows="6" 
							style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px" onchange="textChange()"></textarea>
								</td>
							</tr>
						</table>
						
				</div>
			</div>
				
			<div style="height:122px">
				<div id="div_sql_rs" style="padding-left:10px;padding-right:10px;" >
						<table style="width: 100%;" id="addParamTable" class="addTable"  cellpadding="0" cellspacing="0">
							<thead>
								<th style='width:10%;text-align:center;'><dict:lang value='序号'/></th>
								<th style='width:35%;text-align:center;'><dict:lang value='字段名称'/></th>
								<th style='width:35%;text-align:center;'><dict:lang value='页面显示别名'/></th>
								<th style="width:20%;text-align:center;"><dict:lang value='页面显示宽度(%)'/></th>
							</thead>
						</table>
				</div>
				<div id="div_sql_rs_td"  class="scroll" style="height: 91px;margin: 0 10px;" >
					<table style="width: 730px;" id="addParamTableTd" class="addTable btable"   cellpadding="0" cellspacing="0">
					</table>
				</div>
			</div>
			<div id="div_sql_param" style="padding: 0 10px;margin-top:10px;" >
					<table style="height: 100%;width: 100%;" id="addSqlTable" class="addTable" >
						<thead>
							<th style='height:30px;width:10%;text-align:center'><dict:lang value="序号" /></th>
							<th style="height:30px;width:45%;text-align:center"><dict:lang value="参数名" /></th>
							<th style="height:30px;width:45%;text-align:center;"><dict:lang value="参数值" /></th>
						</thead>
					</table>
					<div  class="scroll" style="height:110px;overflow:auto;">
						<table style="height: 100%;width: 100%;" class="addTable">
							<tbody id="sqlTbody">
								
							</tbody>
						</table>
					</div>
			</div>
				<s:hidden id="DATA_COMMENT_ID" name="paraMap.DATA_COMMENT_ID"/>
				<s:hidden id="PARA_ARGS_ID" name="paraMap.PARA_ARGS_ID"/>
				<s:hidden id="PARA_ARGS_VALUE" name="paraMap.PARA_ARGS_VALUE"/>
				<s:hidden id="COL_PRO_ID" name="paraMap.COL_PRO_ID"/>
				<s:hidden id="COL_PRO_VALUE" name="paraMap.COL_PRO_VALUE"/>
				<s:hidden id="showTypeId" name="paraMap.showTypeId"/>
				<s:hidden id="BUTTON_ID" name="paraMap.BUTTON_ID"/>
				<s:hidden id="CHARTS_CONFIG_ID" name="paraMap.CHARTS_CONFIG_ID"/>
				<s:hidden id="parentiframeId" name="iframeId"/><!-- 父表单的iframe	-->
				<s:hidden id="DELETE_FLAG" name="paraMap.DELETE_FLAG"/>
				<s:hidden id="curDataType" name="curDataType"/>
				<s:hidden id="sqlParaJson" name="sqlParaJson"/>
				<s:textarea  id="COMM_SQL_ID" name="paraMap.COMM_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:textarea  id="ORACLE_SQL_ID" name="paraMap.ORACLE_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:textarea  id="SQLSERVER_SQL_ID" name="paraMap.SQLSERVER_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:textarea  id="MYSQL_SQL_ID" name="paraMap.MYSQL_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:textarea  id="PG_SQL_ID" name="paraMap.PG_SQL_ID" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				</form>
</div>
<script>
	var flag;
	var type;
	var isChange = false;//为了判断是否有更改内容
	var isParaChange = false;//为了判断是否有更改内容
	var analySucess=false;
	var isDel=false;
	var isAnaly=false;//判断是否点击解析
	var isAnalyOther=false;//判断sql当前数据库是否解析成功;
	var isAnalyCommon=false;//判断sql通用是否解析成功；
	var isConfirmButton=false;
	var curDataType="<s:property value="curDataType" />";
	var _codeType= "<s:property value="paraMap.CODE_TYPE_VALUE" />";
	var DATA_TYPE="";
	 $('.dialog-bd',parent.document).css('padding','0');
	 function Height(){
	      $('.scroll').mCustomScrollbar({
	        scrollInertia:150,
	        autoHideScrollbar:true
	      });
	      $('.btable').parent().css('margin','0');
	 }
	 Height();
	 $(window).resize(function(){
	      $('.scroll').mCustomScrollbar("destroy");
	      Height();
	 });
	function textChange(){
		 isChange=true;
	}
	function paraChange(){
		 isParaChange=true;
	}	 
	function init() {//页面初始化数值
		var CHARTS_CONFIG_ID=$("#CHARTS_CONFIG_ID").val();
		var COL_PRO_VALUE = $("#COL_PRO_VALUE").val();
		var parentiframeId = $("#parentiframeId").val();
		var DATA_COMMENT_ID = $("#DATA_COMMENT_ID").val();
		var COMM_SQL_ID = $("#COMM_SQL_ID").val();
		var MYSQL_SQL_ID = $("#MYSQL_SQL_ID").val();
		var PG_SQL_ID = $("#PG_SQL_ID").val();
		var ORACLE_SQL_ID = $("#ORACLE_SQL_ID").val();
		var SQLSERVER_SQL_ID = $("#SQLSERVER_SQL_ID").val();
		var PARA_ARGS_VALUE = $("#PARA_ARGS_VALUE").val();
		var parentFrame = top.document.getElementById(parentiframeId);//获取到父iframe对象
		var parentDATA_COMMENT_ID = parentFrame.contentWindow.document
				.getElementById(DATA_COMMENT_ID);
		var parentSQLSERVER_SQL_ID = parentFrame.contentWindow.document
				.getElementById(SQLSERVER_SQL_ID);
		var parentMYSQL_SQL_ID = parentFrame.contentWindow.document
				.getElementById(MYSQL_SQL_ID);
		var parentCOMM_SQL_ID = parentFrame.contentWindow.document
				.getElementById(COMM_SQL_ID);
		var parentORACLE_SQL_ID = parentFrame.contentWindow.document
				.getElementById(ORACLE_SQL_ID);
		var parentPG_SQL_ID = parentFrame.contentWindow.document
		.getElementById(PG_SQL_ID);
		var parentCHARTS_CONFIG_ID = parentFrame.contentWindow.document
		.getElementById(CHARTS_CONFIG_ID);
		if(parentCHARTS_CONFIG_ID.value!=""){
			$("#comm_sql").val("");
			$("#oracle_sql").val("");
			$("#sqlserver_sql").val("");
			$("#mysql_sql").val("");
			$("#pg_sql").val("");
			if (curDataType == 'oracle') {
				$("#sqlType_oracle").attr("checked", 'checked');
				$("#oracle_sql").show();
			} else if (curDataType == 'sqlserver') {
				$("#sqlType_sqlserver").attr("checked", 'checked');
				$("#sqlserver_sql").show();
			} else if (curDataType == 'mysql') {
				$("#sqlType_mysql").attr("checked", 'checked');
				$("#mysql_sql").show();
			} else if (curDataType == 'pg') {
				$("#sqlType_pg").attr("checked", 'checked');
				$("#pg_sql").show();
			} 
			$("#analyButton").show();
			$("#confirmButton").show();
			return;
		}
		
		$("#comm_sql").val(parentCOMM_SQL_ID.value);
		$("#oracle_sql").val(parentORACLE_SQL_ID.value);
		$("#sqlserver_sql").val(parentSQLSERVER_SQL_ID.value);
		$("#mysql_sql").val(parentMYSQL_SQL_ID.value);
		$("#pg_sql").val(parentPG_SQL_ID.value);
		var showName="";
		var fieLdName="";
		var showWidth=""
		var number=1;
		var addParamTableBody=""
		if(COL_PRO_VALUE!=""){
			var jsonObj=eval(COL_PRO_VALUE);
			for(var i=0;i<jsonObj.length;i++){
				 showName=jsonObj[i].SHOW_NAME;
				 fieLdName=jsonObj[i].FIELD_NAME;
				 showWidth=jsonObj[i].SHOW_WIDTH;
				 if(i==0){
					 addParamTableBody += "<tbody><tr>"
				 }else if(i!=0&&(i%2)==0){
					 addParamTableBody += "<tr>"
				 }if(i!=0&&(i%2)!=0){
					 addParamTableBody += "<tr class=\"tr-hover\">"
				 }	
		    	 
			    	addParamTableBody +="<td style='width:10%;' align='center'>"+ number+"</td>"
						+ "<td  style='width:35%;' align='center'>"
						+ fieLdName
						+ "</input></td>"
						+ "<td  style='width:35%;' align='center'><input onchange=\"paraChange()\" type=\"text\" id=rs_name_"+i+" style=\"cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;text-align:center\" value='"+showName+"'/></td>"
						+ "<td   style='width:20%;' align='center'><input onchange=\"paraChange()\" type=\"text\" id=rs_height_"+i+" style=\"cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;text-align:center\" onkeyup=\"this.value=this.value.replace(/[^0-9]/gi,'')\" value=\""+showWidth+"\"/></td>"
						+"</tr>";
						
		    	 
				if (i == jsonObj.length - 1) {
					addParamTableBody += "</tbody>"
				}
				number++
			}
			$("#addParamTableTd").html(addParamTableBody);
			
			 $('.scroll').mCustomScrollbar({
			        scrollInertia:150,
			        autoHideScrollbar:true
			 });
			 $(".mCSB_container").css('margin','0');
		}
		if(PARA_ARGS_VALUE!=""){
			var arr = PARA_ARGS_VALUE.split(",");
			var name;
			var addSqlTableBody = "";
			var j = 1;
			var sqlParaJson= $("#sqlParaJson").val();
			
			for ( var i = 0; i < arr.length; i++) {
				if (arr[i] == "") {
					continue;
				}
				name = arr[i].split("=");
				 if((i%2)==0){
					 addSqlTableBody += "<tr>"
				 }else{
					 addSqlTableBody += "<tr class=\"tr-hover\">"
				 }
				addSqlTableBody +=  "<td align='center'style=\"width:10%;\">"
						+ j
						+ "</td>"
						+ "<td align='center' style=\"width:45%;\"><input type='hidden' value='"+name[0]+"'>"+name[0]+"</input></td>"
						+ "<td align='center' onchange=\"paraChange()\" style=\"width:45%;\"><select id='select_"+i+"' class='dept_select'>"
				var sqlParaMap= eval("("+sqlParaJson+")")
					for(var z in sqlParaMap){
						if(name[1]==z){
							addSqlTableBody+="<option value='"+z+"' selected >"+sqlParaMap[z]+"</option>"
						}else{
							addSqlTableBody+="<option value='"+z+"' >"+sqlParaMap[z]+"</option>"
						}
					}
				+"</select></td></tr>";
				j++;
			}
			$("#sqlTbody").html(addSqlTableBody);
			if(arr!=""||arr!=null){
				for ( var i = 0; i < arr.length; i++) {
					$("#select_" + i).trigger("chosen:updated");
					setChosen();
				}
			}
		}
		$("#div_changeForSQLName").show();
		$("#div_changeForSQL").show();
		if (curDataType == 'oracle') {
			$("#sqlType_oracle").attr("checked", 'checked');
			$("#oracle_sql").show();
		} else if (curDataType == 'sqlserver') {
			$("#sqlType_sqlserver").attr("checked", 'checked');
			$("#sqlserver_sql").show();
		} else if (curDataType == 'mysql') {
			$("#sqlType_mysql").attr("checked", 'checked');
			$("#mysql_sql").show();
		} else if (curDataType == 'pg') {
			$("#sqlType_pg").attr("checked", 'checked');
			$("#pg_sql").show();
		} 
		$("#analyButton").show();
		$("#confirmButton").show();
	}
	function commit(obj) {//数据源提交按钮
		var comm_sql = $("#comm_sql").val();
		var oracle_sql = $("#oracle_sql").val();
		var sqlserver_sql = $("#sqlserver_sql").val();
		var mysql_sql = $("#mysql_sql").val();
		var pg_sql = $("#pg_sql").val();
		var DATA_COMMENT_ID = $("#DATA_COMMENT_ID").val();
		var PARA_ARGS_ID = $("#PARA_ARGS_ID").val();
		var COL_PRO_ID = $("#COL_PRO_ID").val();
		var parentiframeId = $("#parentiframeId").val();
		var BUTTON_ID = $("#BUTTON_ID").val();
		var COMM_SQL_ID = $("#COMM_SQL_ID").val();
		var MYSQL_SQL_ID = $("#MYSQL_SQL_ID").val();
		var PG_SQL_ID = $("#PG_SQL_ID").val();
		var ORACLE_SQL_ID = $("#ORACLE_SQL_ID").val();
		var showTypeId = $("#showTypeId").val();
		var SQLSERVER_SQL_ID = $("#SQLSERVER_SQL_ID").val();
		var parentFrame = top.document.getElementById(parentiframeId);//获取到父iframe对象
		var parentCOL_PRO_ID = parentFrame.contentWindow.document
				.getElementById(COL_PRO_ID);//通过父iframe找到菜单Id这个输入框
		var parentDATA_COMMENT_ID = parentFrame.contentWindow.document
				.getElementById(DATA_COMMENT_ID);
		var parentSQLSERVER_SQL_ID = parentFrame.contentWindow.document
				.getElementById(SQLSERVER_SQL_ID);
		var parentMYSQL_SQL_ID = parentFrame.contentWindow.document
				.getElementById(MYSQL_SQL_ID);
		var parentCOMM_SQL_ID = parentFrame.contentWindow.document
				.getElementById(COMM_SQL_ID);
		var parentORACLE_SQL_ID = parentFrame.contentWindow.document
				.getElementById(ORACLE_SQL_ID);
		var parentPG_SQL_ID = parentFrame.contentWindow.document
		.getElementById(PG_SQL_ID);
		var parentPARA_ARGS_ID = parentFrame.contentWindow.document
				.getElementById(PARA_ARGS_ID);
		var BUTTON_ID_ID = parentFrame.contentWindow.document
				.getElementById(BUTTON_ID);
		var showTypeId_ID = parentFrame.contentWindow.document
		.getElementById(showTypeId);
		if(oracle_sql == ""&&mysql_sql == ""&&sqlserver_sql == ""&&comm_sql == ""&&pg_sql == ""){
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="未填写任何sql语句" />", "", 320,
					150);
			return false;
		}
		if(!isChange&&!isParaChange){
			closeWindow();
			return;
		}
		if(isChange){
			if (oracle_sql != "" &&curDataType == 'oracle') {
					
				if (!isAnalyOther) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="当前数据库sql解析未成功,不能提交！" />", "", 320,
							150);
					return false;
				}
			}
			if (mysql_sql != "" &&curDataType == 'mysql') {
				
				if (!isAnalyOther) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="当前数据库sql解析未成功,不能提交！" />", "", 320,
							150);
					return false;
				}
			}
			if (sqlserver_sql != "" &&curDataType == 'sqlserver') {
				
				if (!isAnalyOther) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="当前数据库sql解析未成功,不能提交！" />", "", 320,
							150);
					return false;
				}
			}
			if (pg_sql != "" &&curDataType == 'pg') {
				
				if (!isAnalyOther) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="当前数据库sql解析未成功,不能提交！" />", "", 320,
							150);
					return false;
				}
			}
			if (comm_sql != "") {
				if (!isAnalyCommon) {
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="通用sql解析未成功,不能提交！" />", "", 320, 150);
					return false;
				}
				}
			}
		
			var sqlPara = "";
			var sqlRs = "";
			var flag = false;
			parentCOMM_SQL_ID.value = comm_sql;
			parentSQLSERVER_SQL_ID.value = sqlserver_sql;
			parentMYSQL_SQL_ID.value = mysql_sql;
			parentORACLE_SQL_ID.value = oracle_sql;
			parentPG_SQL_ID.value = pg_sql;
			$("#sqlTbody tr").each(function(seq, length) {
				var tdArr = $(this).children();
				param = tdArr.eq(1).find("input").val();
				dateValue = tdArr.eq(2).find("select").val();
				sqlPara = sqlPara + param + "=" + dateValue + ",";
			});
			var totalWidth=0;
			$("#addParamTableTd tbody tr").each(function(seq, length) {
				var tdArr = $(this).children();
				var fieldName = tdArr.eq(1).html();
				var showName = tdArr.eq(2).find("input").val();
				if(showName==""){
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="页面显示别名必输！" />", "", 320, 150);
					flag=true;
					return false;
				}
				var showWidth = tdArr.eq(3).find("input").val();//获取table中第三列的数据
				
				if(showWidth==""){
					utilsFp.confirmIcon("1", "", "", "",
							"<dict:lang value="页面显示宽度必输！(百分比)" />", "", 320, 150);
					flag=true;
					return false;
				}
				showName.replace("?","")
				totalWidth=Number(totalWidth)+Number(showWidth);
				if(seq==0){
					sqlRs +="["
				}
				sqlRs += "{\"FIELD_NAME\":\""+fieldName+"\",\"SHOW_NAME\":\""+showName+"\",\"SHOW_WIDTH\":\""+showWidth+"\"}";
				if(seq==$("#addParamTableTd tbody tr").length-1){
					sqlRs += "]";
				}else{
					sqlRs += ",";
				}
			});
			if(!flag&&totalWidth!=100){
				utilsFp.confirmIcon("1", "", "", "",
						"<dict:lang value="宽度总和必须为100%" />", "", 320, 150);
				flag=true;
				return false;
			}
			if(flag){
				return false;
			}
			parentPARA_ARGS_ID.value = sqlPara;
			parentCOL_PRO_ID.value = sqlRs;
			BUTTON_ID_ID.innerText = "已配置";
			showTypeId_ID.value="0";
			closeWindow();
	}
	function showSqlParam() {//解析sql查询条件参数，查询结果参数
		isConfirmButton = true;
		var sqlType = $('input[name="paraMap.sqlType"]:checked').val();
		if (sqlType == "commsql") {
			sqlContext = $("#comm_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType =="oracle") {
			sqlContext = $("#oracle_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType =="mysql") {
			sqlContext = $("#mysql_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType =="sqlserver") {
			sqlContext = $("#sqlserver_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		}else if (sqlType =="pg") {
			sqlContext = $("#pg_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		}
		var  url="${path}sys/AdKeyDataAction_getQueryPara.ms";
		var addParamTableBody = ""
		$('.scroll').mCustomScrollbar("destroy");
		$.ajax({
			type: "POST",
		    dataType: "json",
		    url: url,
		    data: "paraMap.sql="+sqlContext,
		    success: function(data){
		    	if(data.ajaxMap.status!=null && data.ajaxMap.status=='false'){
		    		utilsFp.confirmIcon("3","","","",data.ajaxMap.info,"",320,150);
		    		return;
		    	}
		    	
		    	var arr=data.ajaxList;
		    	var filedName="";
		    	var number = 1;
		    	for(var i=0;i<arr.length;i++){
		    		filedName=arr[i].filedName;
		    		if(i==0){
						 addParamTableBody += "<tbody><tr>"
					 }else if(i!=0&&(i%2)==0){
						 addParamTableBody += "<tr>"
					 }if(i!=0&&(i%2)!=0){
						 addParamTableBody += "<tr class=\"tr-hover\">"
					 }	
			    	addParamTableBody += "<td style='width:10%;' align='center'>"
						+ number
						+ "</td>"
						+ "<td style='width:35%;' align='center'>"
						+ filedName
						+ "</input></td>"
						+ "<td style='width:35%;' align='center'><input onchange=\"paraChange()\" type=\"text\" id=rs_name_"+i+" style=\"cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;text-align:center\"/></td>"
						+ "<td style='width:20%;' align='center'><input onchange=\"paraChange()\" type=\"text\" id=rs_height_"+i+" style=\"cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;text-align:center\" onkeyup=\"this.value=this.value.replace(/[^0-9]/gi,'')\"/></td>"
						+"</tr>";
					if (i == arr.length - 1) {
						addParamTableBody += "</tbody>"
					}
					number++
		    	}
		    	$("#addParamTableTd").html(addParamTableBody);
		    	
				 $('.scroll').mCustomScrollbar({
				        scrollInertia:150,
				        autoHideScrollbar:true
				 });
				 $(".mCSB_container").css('margin','0');
				 utilsFp.confirmIcon("1","","","","获取参数完成","",320,150);
		    },
		    error: function(msg){
				utilsFp.confirmIcon("3","","","","error:"+msg,"",320,150);
			}
		});
		var type=/:param([12][0-9]|[1-9])/g;//匹配1-29
		var arr = sqlContext.match(type);
		var sqlParaJson= $("#sqlParaJson").val();
		var addSqlTableBody = ""
		if (arr != null) {
			var index = 1;
			for ( var i = 0; i < arr.length; i++) {
				if((i%2)==0){
					 addSqlTableBody += "<tr>"
				 }else{
					 addSqlTableBody += "<tr class=\"tr-hover\">"
				 }
				addSqlTableBody += "<td style='width:10%;' align='center'>"
						+ index
						+ "</td>"
						+ "<td style='width:45%;' align='center'><input type='hidden' value='"+arr[i]+"'>"
						+ arr[i]
						+ "</input></td>"
						+ "<td style='width:45%;'onchange=\"paraChange()\" align='center'><select id='select_"+i+"' class='dept_select'>"
						var sqlParaMap= eval("("+sqlParaJson+")")
						for(var k in sqlParaMap){
							if(k==0){
								addSqlTableBody+="<option value='"+k+"' selected >"+sqlParaMap[k]+"</option>"
							}else{
								addSqlTableBody+="<option value='"+k+"' >"+sqlParaMap[k]+"</option>"
							}
						}
						+ "</select></td></tr>";
				index++;
			}
		}
		
		$("#sqlTbody").html(addSqlTableBody);
		if(arr!=null){
		for ( var i = 0; i < arr.length; i++) {
			$("#select_" + i).trigger("chosen:updated");
			setChosen();
		}
		}
	}
	$("#sqlType_comm").click(function() {
		$("#comm_sql").show();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").hide();
		$("#oracle_sql").hide();
		$("#pg_sql").hide();
		isAnaly = false;
		$("#confirmButton").show();
		$("#analyButton").show();

	});
	$("#sqlType_sqlserver").click(function() {
		$("#comm_sql").hide();
		$("#sqlserver_sql").show();
		$("#mysql_sql").hide();
		$("#oracle_sql").hide();
		$("#pg_sql").hide();
		isAnaly = false;
		if (curDataType == 'sqlserver') {
			$("#confirmButton").show();
			$("#analyButton").show();
		} else {
			$("#analyButton").hide();
			$("#confirmButton").hide();
		}
	});
	$("#sqlType_mysql").click(function() {
		$("#comm_sql").hide();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").show();
		$("#oracle_sql").hide();
		$("#pg_sql").hide();
		isAnaly = false;
		if (curDataType == 'mysql') {
			$("#confirmButton").show();
			$("#analyButton").show();
		} else {
			$("#analyButton").hide();
			$("#confirmButton").hide();
		}
	});
	$("#sqlType_oracle").click(function() {
		$("#comm_sql").hide();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").hide();
		$("#oracle_sql").show();
		$("#pg_sql").hide();
		isAnaly = false;
		if (curDataType == 'oracle') {
			$("#confirmButton").show();
			$("#analyButton").show();
		} else {
			$("#analyButton").hide();
			$("#confirmButton").hide();
		}
	});
	$("#sqlType_pg").click(function() {
		$("#comm_sql").hide();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").hide();
		$("#oracle_sql").hide();
		$("#pg_sql").show();
		isAnaly = false;
		if (curDataType == 'pg') {
			$("#confirmButton").show();
			$("#analyButton").show();
		} else {
			$("#analyButton").hide();
			$("#confirmButton").hide();
		}
	});
	function analySql() {//解析sql
		if (isChange&&!isConfirmButton) {//sql参数已经解析了，则不会提示，有参数但是没有点击确定直接解析会报错
			utilsFp.confirmIcon("1", "", "", "",
					"<dict:lang value="请先点击确定，再点击解析！" />", "", 320, 150);
			return false;
		}
		var sqlType = $('input[name="paraMap.sqlType"]:checked').val();
		if (sqlType == "commsql") {//判断当前的sql是否有写入内容
			sqlContext = $("#comm_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType == "oracle") {
			sqlContext = $("#oracle_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType =="mysql") {
			sqlContext = $("#mysql_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType =="sqlserver") {
			sqlContext = $("#sqlserver_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		} else if (sqlType =="pg") {
			sqlContext = $("#pg_sql").val();
			if (sqlContext == "") {
				utilsFp
						.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "",
								320, 150);
				return false;
			}
		}
		var sqlPara = "";
		var sqlRs = "";
		var sqlContext = $("#sqlContext").val();
		var sqlType = $('input[name="paraMap.sqlType"]:checked').val();
		if (sqlType == "commsql") {
			sqlContext = $("#comm_sql").val();
		} else if (sqlType =="oracle") {
			sqlContext = $("#oracle_sql").val();
		} else if (sqlType == "mysql") {
			sqlContext = $("#mysql_sql").val();
		} else if (sqlType == "sqlserver") {
			sqlContext = $("#sqlserver_sql").val();
		}else if (sqlType == "pg") {
			sqlContext = $("#pg_sql").val();
		}
		$("#sqlTbody tr").each(function(seq, length) {
			var tdArr = $(this).children();
			param = tdArr.eq(1).find("input").val();
			dateValue = tdArr.eq(2).find("select").val();
			sqlPara = sqlPara + param + "=" + dateValue + ",";
		});
		$("#addParamTable tbody tr").each(function(seq, length) {
			var tdArr = $(this).children();
			var fieldName = tdArr.eq(1).html();
			var showName = tdArr.eq(2).find("input").val();
			if(showName==""){
				utilsFp.confirmIcon("1", "", "", "",
						"<dict:lang value="页面显示别名必输！" />", "", 320, 150);
				flag=true;
				return false;
			}
			var showWidth = tdArr.eq(3).find("input").val();//获取table中第三列的数据
			if(showWidth==""){
				utilsFp.confirmIcon("1", "", "", "",
						"<dict:lang value="页面显示高度必输！(百分比)" />", "", 320, 150);
				flag=true;
				return false;
			}
			if(seq==0){
				sqlRs +="["
			}
			sqlRs += "{\"FIELD_NAME\":\""+fieldName+"\",\"SHOW_NAME\":\""+showName+"\",\"SHOW_WIDTH\":\""+showWidth+"\"}";
			if(seq==$("#addParamTable tbody tr").length-1){
				sqlRs += "]";
			}else{
				sqlRs += ",";
			}
		});
<%--		sqlContext=sqlContext.replace(/\+/g,"%2B");//ajax post数据 对于+或者& 或省略 需要转成特定的字符编码--%>
<%--		sqlContext=sqlContext.replace(/\g/g,"%26");--%>
		$.ajax({
			type : "POST",
			url : "${path}sys/AdminTargetDataAction_analyKeySql.ms?",
			data : {"paraMap.sqlPara" :sqlPara,"paraMap.sqlType":sqlType,"paraMap.sqlContext":sqlContext,"paraMap.sqlKeyRs":sqlRs},
			success : function(data) {
				if (data.ajaxMap.status == "false") {
					if (sqlType == "commsql") {
						isAnalyCommon = false
					} else {
						isAnalyOther = false;
					}
					utilsFp.confirmIcon("1", "", "", "", data.ajaxMap.info, "",
							320, 150);
				} else {
					if (sqlType == "commsql") {
						isAnalyCommon = true
					} else {
						isAnalyOther = true;
					}
					utilsFp.confirmIcon("2", "", "", "", data.ajaxMap.info, "",
							320, 150);
				}
			},
			error : function(msg) {
				isNoInit = true;
				if (isNoInit) {
					util.closeLoading();
				}
				utilsFp.confirmIcon("3", "", "", "", "error:" + msg, "", 320,
						150);
			}

		});
	}
</script>

</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp"%>