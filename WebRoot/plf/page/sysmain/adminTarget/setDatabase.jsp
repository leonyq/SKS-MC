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
	.func_table {
    width: 100%;
    color: #1133ae;
    margin-bottom: 1px;
    height: 21px;
    line-height: 21px;
	}
	.func_table1{
    width: 100%;
    margin-bottom: 1px;
    height: 32px;
    line-height: 21px;
	}
	.func_table2{
    width: 100%;
    color: #f6f5f7;
    border: solid 1px #a8c7ce;
    margin-bottom: 1px;
    background-color: #74bff7;
    height: 30px;
    line-height: 21px;
	}
	
	.optn1 input[type='button']{
		border: 1px solid #aace36;
	    border-radius: 2px;
	    background-color: #fff;
	    color: #666;
	    height: 28px;
	    line-height: 26px;
	    padding: 0 10px;
	    margin-right: 2px;
	    cursor: pointer;
	}
	
	.optn1 input[type='button']:hover{
		background-color:#aace36;
		color:#fff;
	}
	
	.optn1 button {
    border: 1px solid #aace36;
    border-radius: 2px;
    background-color: #fff;
    color: #666;
    height: 28px;
    line-height: 26px;
    padding: 0 10px;
    margin-right: 2px;
    cursor: pointer;
	}
	
	.optn1 button:hover{
		background-color:#aace36;
		color:#fff;
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
	
	.optn2 button:hover{
		background-color:#aace36;
		color:#fff;
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
	
	input[type="radio"]{
		vertical-align: middle;
		margin-top:-2px;
	}
	
	td input[type="button"]:hover{
		background-color: #aace36;
	    color: #fff;
	}

	.addTable th{
		border: 1px solid #dbe1ef;
		color: #666;
		background-color:#e6eaf4;
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
												   	<button type="button" onclick="return commit(this);" style="margin-top: 11px;" ><i class="ico ico-save"></i><dict:lang value="提交" /></button>
												    <button type="button" onclick="closeWindow();" style="margin-right:10px;"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
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
			<DIV style="margin-bottom:10px;padding:0 10px;">
				<UL class="tab-list tab">
					<li id="showClass" class="current"><A 
						href="javascript:void(0);"> <SPAN><dict:lang value="自定义类" /></SPAN>
					</A>
					</li>
					<li id="showSQL"><A 
						href="javascript:void(0);"> <SPAN><dict:lang value="自定义SQL" /></SPAN> </A>
					</li>
					<li id="showProcess"><A 
						href="javascript:void(0);"> <SPAN><dict:lang value="存储过程" /></SPAN> </A>
					</li>
					<li id="showFunc"><A 
						href="javascript:void(0);"> <SPAN><dict:lang value="函数" /></SPAN> </A>
					</li>
				</UL>
			</DIV>
			<!-- <div style="padding:10px;border-bottom: 1px solid #ccc;">
				<label class="cursor_hand">
				<input type="radio" id="showClass" name="paraMap.DATA_TYPE" value="CLASS_TYPE" />自定义类</label>
				&nbsp;&nbsp;
				<label class="cursor_hand"><input type="radio" id="showSQL" name="paraMap.DATA_TYPE" value="SQL_TYPE"/>自定义SQL</label>
				&nbsp;&nbsp;
				<label class="cursor_hand"><input type="radio" id="showProcess" name="paraMap.DATA_TYPE" value="PRO_TYPE"/>存储过程</label>
   				&nbsp;&nbsp;<label class="cursor_hand"><input type="radio" id="showFunc" name="paraMap.DATA_TYPE" value="FUN_TYPE"/>函数</label>
			</div> -->
			<div id="div_changeForClass" style="margin:12px 10px;display: none">
						<div style="height:28px;line-height:28px;">
							类适配：
							<label for="codeType_0" class="cursor_hand">
								<input type="radio" id="codeType_0" name="paraMap.codeType"
								value="CODE_BASE" onclick="loadClsCode(this.value)" checked="checked"/>BASE
							</label>&nbsp;&nbsp;
							<label for="codeType_1" class="cursor_hand">
								<input type="radio" id="codeType_1" name="paraMap.codeType"
								value="CODE_ORACLE" onclick="loadClsCode(this.value)" />ORACLE
							</label>&nbsp;&nbsp;
							<label for="codeType_2" class="cursor_hand">
								<input type="radio" id="codeType_2" name="paraMap.codeType"
								value="CODE_SQLSERVER" onclick="loadClsCode(this.value)" />SQLSERVER
							</label>&nbsp;&nbsp;
							<label for="codeType_3" class="cursor_hand">
								<input type="radio" id="codeType_3" name="paraMap.codeType"
								value="CODE_MYSQL" onclick="loadClsCode(this.value)" />MYSQL
							</label>
							<label for="codeType_4" class="cursor_hand">
								<input type="radio" id="codeType_4" name="paraMap.codeType"
								value="CODE_PG" onclick="loadClsCode(this.value)" />PG
							</label>
							<%-- 如果新增了支持的数据库类型，则这里需要新增 --%>
						</div>
						<div style="margin-top:12px;height: 28px;">
							<div style="float:left;">
								类全名<input type="text" id="paraMap_CLASS_NAME" name="paraMap.CLASS_NAME"
								value="<s:property value="dataMap.CLASS_NAME"/>" class="input" style="width:400px;height:28px;margin-left:5px;"/>
							</div>
							<div class="optn2" style="float:left;margin-left:6px;">
								<input type="hidden" id="codeId" name="codeId" value="<s:property value="dataMap.ID"/>">
								<button type="button" onclick="return analyClsCode(this);"><i class="ico ico-save"></i><dict:lang value="解析" /></button>
								<button type="button" onclick="del(this);"><i class="ico ico-sc"></i><dict:lang value='删除' /></button>
								<button type="button" id="debugButton" style="display: none" onclick="validateIsCurrentsDebug()" >调试</button>
							</div>
						</div>				
						<div id="div_code" style="margin-top:15px;">
							<textarea id="clsCode__" name="paraMap.clsCode" class="tabIndent"
							wrap="off" style="word-wrap: normal; width: 100%;height: 310px;" onchange="checkAnaly(this);"></textarea>
						</div>
			</div>
			<div id="div_changeForSQL" style="margin:12px 10px;height:230px;display: none">
					<div style="height:28px;">
						<div style="float:left;height:28px;line-height:28px;">
							数据库适配：<label
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
								type="radio" id="sqlType_pg" name="paraMap.sqlType"  value="pg"
							     />PG</label>
							    &nbsp;&nbsp;	
						</div>
						<div class="optn1" style="float:right;">
							<input id="confirmButton" style="display: none;" type="button" onclick="showSqlParam()" value="<dict:lang value='确定' />" />
							<input id="analyButton" type="button" onclick="analySql()" style="display: none;margin-right:0;" value="<dict:lang value='解析' />" />
				
						</div>
					</div>
						<div id="div_changeForSQLName"  style="display: none;margin-top:8px;">
							<table style="width: 100%;">
								<tr>
									<td>
										<textarea id="comm_sql" name="paraMap.comm_sql" rows="6"
								style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px"></textarea>
								<textarea id="oracle_sql" name="paraMap.oracle_sql" rows="6"
								style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px"></textarea>
								<textarea id="sqlserver_sql" name="paraMap.sqlserver_sql" rows="6" 
								style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px"></textarea>
								<textarea id="mysql_sql" name="paraMap.mysql_sql" rows="6" 
								style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px"></textarea>
								<textarea id="pg_sql" name="paraMap.pg_sql" rows="6" 
								style="width: 100%;overflow:auto;word-wrap:normal;display: none;height:200px"></textarea>
									</td>
								</tr>
							</table>
						</div>
			</div>
			<div id="div_func" style="display: none;margin:15px 10px;height:30px;margin-bottom:0;">
				<table>
					<tr>
						<td><input type="text" id="functionValue" value="F(in,in)" style="height: 28px;width: 400px;" class="input"/></td>
						<td><input type="button" id="functionConfirm" style="margin-left: 4px;width: 57px;" value="<dict:lang value='确定' />"/></td>
						<td><input type="button" id="functionAnaly" value="<dict:lang value='解析' />"/></td>
					</tr>
				</table>
				
			</div>
			<div id="div_showProcess" style="display: none;margin:15px 10px;height:30px;margin-bottom:0;">
				<table>
					<tr>
						<td><input type="text" id="processValue" value="P(in,in)" style="height: 28px;width: 400px;" class="input"/></td>
						<td><input type="button" id="processConfirm" style="margin-left: 4px;width: 57px;" value="<dict:lang value='确定' />"/></td>
						<td><input type="button" id="processAnaly" value="<dict:lang value='解析' />"/></td>
					</tr>
				</table>
				
			</div>	
			<div id="div_param" style="display: none;padding: 0 10px;">
					<table style="margin-top: 20px;width:100%" id="addTable" class="addTable">
						<thead>
							<tr>
							<th style="width:25px;text-align:center"><dict:lang value="序号" /></th>
							<th style="width:75px;text-align:center"><dict:lang value="参数名" /></th>
							<th style="width:75px;text-align:center;"><dict:lang value="参数值" /></th>
							</tr>
						</thead>
					</table>
			</div>
			<div id="div_sql_param" style="display: none;padding: 0 10px;" >
					<table style="height: 100%;margin-top: 20px;width: 100%;table-layout: fixed;" id="addSqlTable" class="addTable" >
						<thead>
							<tr>
								<th style="width:25px;text-align:center"><dict:lang value="序号" /></th>
								<th style="width:75px;text-align:center"><dict:lang value="参数名" /></th>
								<th style="width:75px;text-align:center;"><dict:lang value="参数值" /></th>
							<tr>
						</thead>
					</table>
					<div class="scroll" style="height: 115px;overflow: auto;">
						<table id="addSqlTable1" class="addTable" style="width:100%;table-layout: fixed;">
							
						</table>
					</div>	
			</div>
			<div id="div_func_param" style="display: none;padding: 0 10px;" >
				<table style="margin-top: 20px;width:100%" id="addFuncTable" class="addTable">
					<thead>
						<tr>
						<th style=width:25px;text-align:center><dict:lang value="序号" /></th>
						<th style=width:75px;text-align:center><dict:lang value="参数名" /></th>
						<th style=width:75px;text-align:center;><dict:lang value="参数值" /></th>
						</tr>
					</thead>
				</table>
			</div>
			<!-- resultData 需要返回给主页面的存储过程名称、函数名称     -->
			<!-- resultData 需要返回给主页面的存储过程、函数所对应的参数类型     -->
			<!-- resultData 需要返回给主页面的数据类型     -->
			<input type="hidden" id="resultPFName">
			<input type="hidden" id="resultDataType">
			<input type="hidden" id="resultTableDate">
				<s:hidden id="DATA_TYPE_ID" name="paraMap.DATA_TYPE_ID"/>
				<input type="hidden" id="DATA_TYPE_VALUE" name="paraMap.DATA_TYPE_VALUE" value="<c:out value="${paraMap.DATA_TYPE_VALUE}" />"/>
				<s:hidden id="DATA_COMMENT_ID" name="paraMap.DATA_COMMENT_ID"/>
				<s:textarea  id="DATA_COMMENT_VALUE" name="paraMap.DATA_COMMENT_VALUE" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:hidden id="PARA_ARGS_ID" name="paraMap.PARA_ARGS_ID"/>
				<s:hidden id="PARA_ARGS_VALUE" name="paraMap.PARA_ARGS_VALUE"/>
				<s:hidden id="MS_CLASS_CODE_ID_ID" name="paraMap.MS_CLASS_CODE_ID_ID"/>
				<input type="hidden" id="MS_CLASS_CODE_ID_VALUE" name="paraMap.MS_CLASS_CODE_ID_VALUE" value="<c:out value="${paraMap.MS_CLASS_CODE_ID_VALUE}" />"/>
				<s:hidden id="CODE_TYPE_ID" name="paraMap.CODE_TYPE_ID"/>
				<s:hidden id="CODE_TYPE_VALUE" name="paraMap.CODE_TYPE_VALUE"/>
				<s:hidden id="CLASS_NAME_ID" name="paraMap.CLASS_NAME_ID"/>
				<s:hidden id="CLASS_NAME_VALUE" name="paraMap.CLASS_NAME_VALUE"/>
				<s:hidden id="BUTTON_ID" name="paraMap.BUTTON_ID"/>
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
	var initLoadClass = true;//是否加载类模板
	var flag;
	var type;
	var isNoInit = false;//为了判断是否关闭加载中方法
	var isSubmit = false;//为了判断是否关闭加载中方法
	var analySucess=false;
	var isDel=false;
	var isAnaly=false;//判断是否点击解析
	var isAnalyOther=false;//判断sql当前数据库是否解析成功;
	var isAnalyCommon=false;//判断sql通用是否解析成功；
	var isConfirmButton=false;
	var curDataType="<s:property value="curDataType" />";
	var _codeType= "<s:property value="paraMap.CODE_TYPE_VALUE" />";
	var DATA_TYPE="";
	 $('.dialog-bd',parent.document).css('padding','0')
		$("#showClass").click(function(){//点击class按钮
			$("#div_changeForClass").show();
			$("#div_changeForSQL").hide();
			$("#div_changeForSQLName").hide();
			$("#div_func").hide();
			$("#div_showProcess").hide();
			$("#resultPFName").val("");
			$("#resultDataType").val("");
			$("#resultTableDate").val("");
			$("#div_sql_param").hide();
			$("#div_func_param").hide();
			$("#div_param").hide();
			DATA_TYPE="CLASS_TYPE";
			$("#showClass").addClass("current").siblings().removeClass("current");
		});
		$("#showSQL").click(function(){//点击sql按钮
			$("#div_changeForClass").hide();
			$("#div_changeForSQL").show();
			$("#div_sql_param").show();
			$("#div_param").hide();
			$("#div_func_param").hide();
			
			if(curDataType=='oracle'){
				$("#oracle_sql").siblings().hide();
				$("#sqlType_oracle").attr("checked",'checked');
				$("#oracle_sql").show();
			}else if(curDataType=='sqlserver'){
				$("#sqlserver_sql").siblings().hide();
				$("#sqlType_sqlserver").attr("checked",'checked');
				$("#sqlserver_sql").show();
			}else if(curDataType=='mysql'){
				$("#mysql_sql").siblings().hide();
				$("#sqlType_mysql").attr("checked",'checked');
				$("#mysql_sql").show();
			}else if(curDataType=='commsql'){
				$("#comm_sql").siblings().hide();
				$("#sqlType_commsql").attr("checked",'checked');
				$("#comm_sql").show();
			}
			else if(curDataType=='pg'){
				$("#pg_sql").siblings().hide();
				$("#sqlType_pg").attr("checked",'checked');
				$("#pg_sql").show();
			}
			$("#confirmButton").show();
			$("#analyButton").show();
			$("#div_changeForSQLName").show();
			$("#div_func").hide();
			$("#div_showProcess").hide();
			$("#resultPFName").val("");
			$("#resultDataType").val("");
			$("#resultTableDate").val("");
			isAnalyOther=false;//判断sql当前数据库是否解析成功;
			isAnalyCommon=false;//判断sql通用是否解析成功；
			DATA_TYPE="SQL_TYPE";
			$("#showSQL").addClass("current").siblings().removeClass("current");
		});
		$("#showFunc").click(function(){//点击函数按钮
			$("#div_changeForClass").hide();
			$("#div_changeForSQL").hide();
			$("#div_changeForSQLName").hide();
			$("#div_showProcess").hide();
			$("#div_func").show();
			$("#div_param").hide();
			$("#resultPFName").val("");
			$("#resultDataType").val("");
			$("#resultTableDate").val("");
			$("#div_sql_param").hide();
			$("#div_func_param").show();
			DATA_TYPE="FUN_TYPE";
			$("#showFunc").addClass("current").siblings().removeClass("current");
		});
		$("#showProcess").click(function(){//点击过程按钮
			$("#div_changeForClass").hide();
			$("#div_changeForSQL").hide();
			$("#div_changeForSQLName").hide();
			$("#div_func").hide();
			$("#div_showProcess").show();
			$("#div_sql_param").hide();
			$("#div_func_param").hide();
			$("#div_param").show();
			$("#resultPFName").val("");
			$("#resultDataType").val("");
			$("#resultTableDate").val("");
			DATA_TYPE="PRO_TYPE";
			$("#showProcess").addClass("current").siblings().removeClass("current");
		});
		 $("#processConfirm").click(function(){//存储过程按钮确定
			$("#div_sql_param").hide();
			$("#div_func_param").hide();
			$("#div_param").show();
			var index=1;
			var result = $("#processValue").val();
			result=result.substring(result.indexOf("(")+1,result.lastIndexOf(")"));
			var addTrFor="<thead><tr>"
						  +"<th style=width:25px;text-align:center><dict:lang value='序号' /></th>"
						  +"<th style=width:75px;text-align:center><dict:lang value='参数名' /></th>"
						  +"<th style=width:75px;text-align:center><dict:lang value='参数值' /></th>"
						  +"</tr></thead>";
			if(null!=result&&""!=result){
				var arr=result.split(",");
				addTrFor+="<tbody>";
				for(var i=0;i<arr.length;i++){
						if(arr[i]=="out"){
							addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+arr[i]+"'>"+arr[i]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'><option value='0'><dict:lang value='字符串' /> &nbsp;&nbsp;</option></select></td></tr>";
							index++;
						}else if(arr[i]=="in"||arr[i]=="inout"){
							addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+arr[i]+"'>"+arr[i]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'><option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option></select></td></tr>";
							index++;
						}
				}
				addTrFor+="</tbody>";
				$("#addTable").html(addTrFor);
				for(var i=0;i<arr.length;i++){
					$("#select_"+i).trigger("chosen:updated");
					setChosen();
				}
			}
			utilsFp.confirmIcon("2","","","","获取参数完成","",320,150);
		});
		 function checkAnaly(){
			 analySucess=false;
		 };
		$("#functionConfirm").click(function(){//点击函数按钮
			$("#div_sql_param").hide();
			$("#div_func_param").show();
			$("#div_param").hide();
			var result = $("#functionValue").val();
			result=result.substring(result.indexOf("(")+1,result.lastIndexOf(")"));
			var addTrFor="<thead><tr>"
						  +"<th style=width:25px;text-align:center><dict:lang value='序号' /></th>"
						  +"<th style=width:75px;text-align:center><dict:lang value='参数名' /></th>"
						  +"<th style=width:75px;text-align:center><dict:lang value='参数值' /></th>"
						  +"</tr></thead>";
			if(null!=result&&""!=result){
				addTrFor+="<tbody>";
				var arr=result.split(",");
				var addTrFor;
				var index=1;
				for(var i=0;i<arr.length;i++){
						if(arr[i]=="in"){
							addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+arr[i]+"'>"+arr[i]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'><option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option></select></td></tr>";
							index++;	
						}
				}
			}
			addTrFor+="</tbody>";
			$("#addFuncTable").html(addTrFor);
			for(var i=0;i<arr.length;i++){
				$("#select_"+i).trigger("chosen:updated");
				setChosen();
			}
			utilsFp.confirmIcon("2","","","","获取参数完成","",320,150);
		});
		$("#processAnaly").live("click",function(){//存储过程解析按钮
			$("#resultPFName").val("");
			$("#resultDataType").val("");
			$("#resultTableDate").val("");
			var innerData=new Array();
			var tableDate=new Array();
			var resultName=$("#processValue").val();
			var name=resultName.substring(0,resultName.indexOf("("));
			innerData.push(name);
			flag=0;
			checkPF(innerData,tableDate);
			if(flag==0){
				utilsFp.confirmIcon("1","","","","<dict:lang value="至少需要一个输出参数" />","",400,300);
				return false;
			}
		 	if(flag==2){
				utilsFp.confirmIcon("1","","","","<dict:lang value="只支持一个输出参数" />","",400,300);
				return false;
			} 
			type="PRO_TYPE";
			$.ajax({
			type: "POST",
		    url: "${path}sys/AdminTargetDataAction_analysisProcessdure.ms",
		    data:"paraMap.dataInner="+innerData+"&paraMap.dataType="+type+"&paraMap.resultName="+resultName,
		     success: function(data){
						if(data.RES){
							utilsFp.confirmIcon("1","","","","<dict:lang value="" />"+data.respone,"",320,150);
							if("解析失败"==data.respone){
							
							}else{
								$("#resultPFName").val(resultName);
								$("#resultDataType").val(type);
								$("#resultTableDate").val(tableDate);
							}
						}else{
							utilsFp.confirmIcon("1","","","","<dict:lang value="" />"+data.RES_MSG,"",400,300);
						}
					} 
			});
		});
		$("#functionAnaly").click(function(){//函数解析按钮
			$("#resultPFName").val("");
			$("#resultDataType").val("");
			$("#resultTableDate").val("");
			var innerData=new Array();
			var tableDate=new Array();
			var resultName=$("#functionValue").val();
			var name=resultName.substring(0,resultName.indexOf("("));
			innerData.push(name);
			var tdArr;
			var param;
			var dateValue;
			var rowNum=1;
			var tableDate=new Array();
			$("#addFuncTable tbody tr").each(function(){
				 tdArr=$(this).children();
				 param=tdArr.eq(1).find("input").val();
				 dateValue=tdArr.eq(2).find("select").val();//获取table中第三列的数据
				 innerData.push("in_"+rowNum+"_"+dateValue);
				 rowNum++;
				 tableDate.push(param+"="+dateValue);
			});
			type="FUN_TYPE";
			$.ajax({
			type: "POST",
		    url: "${path}sys/AdminTargetDataAction_analysisProcessdure.ms",
		    data:"paraMap.dataInner="+innerData+"&paraMap.dataType="+type+"&paraMap.resultName="+resultName,
		    success: function(data){
						if(data.RES){
							utilsFp.confirmIcon("1","","","","<dict:lang value="" />"+data.respone,"",320,150);	
							$("#resultPFName").val(resultName);
							$("#resultDataType").val(type);
							$("#resultTableDate").val(tableDate);
						}else{
							utilsFp.confirmIcon("1","","","","<dict:lang value="" />"+data.RES_MSG,"",400,300);
						}
					}
			});
		});
		
		$("#submitBut").click(function(){
			if(($("#resultPFName").val()!="")&&($("#resultDataType").val()!="")){
				
			}else{
				util.alert("<dict:lang value="需要返回到父页面的值为空不能提交：" />:");
			}
		});
	
	//函数或者存储过程参数的校验
	function checkPF(innerData,tableDate){
		var rowNum=1;
		var tdArr;
		var param;
		var dateValue;
		var patternIn=/^[in]+$/;
		var patternOut=/^[out]+$/;
		var patternInout=/^[inout]+$/;
		var index=1;
		$("#addTable tbody tr").each(function(){
			 if(flag>1){
				flag=2;
				return false;
			}else{
				tdArr=$(this).children();
				param=tdArr.eq(1).find("input").val();
				dateValue=tdArr.eq(2).find("select").val();
				if(patternIn.test(param)){
					innerData.push("in_"+rowNum+"_"+dateValue);
				}else if(patternOut.test(param)){
					innerData.push("out_"+rowNum+"_"+dateValue);
					flag++;
				}else if(patternInout.test(param)){
					innerData.push("inout_"+rowNum+"_"+dateValue);
					flag++;
				}
				tableDate.push(param+"="+dateValue);
				rowNum++;
			}
		});
	}
		//异步加载类源码
	function loadClsCode(type){
		_codeType = type;
		if(isNoInit){
			util.showLoading("处理中...");
		}
	  	jQuery.ajax({
		type: "POST",
	    dataType: "text",
	    url: "${path}sys/AdminTargetDataAction_loadClsCode.ms?",
	    data:{'paraMap.CODE_TYPE':type,'paraMap.DATA_TYPE':'<c:out value="${paraMap.DATA_TYPE_VALUE}" />','paraMap.CODE_ID':'<c:out value="${paraMap.MS_CLASS_CODE_ID_VALUE}" />'},
		success: function(data){
				$("#clsCode__").val(data);
				isNoInit = true;
				if(isNoInit){
					util.closeLoading();
				}
			},
			error: function(msg){
				isNoInit = true;
				
			if(isNoInit){
				util.closeLoading();
			}
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}
	//异步解析类源码
	function analyClsCode(Obj){
		var clsCode=$("#clsCode__").val();
		var paraMap_CLASS_NAME=$("#paraMap_CLASS_NAME").val();
		if(clsCode==""||clsCode==null){
			utilsFp.confirmIcon("1","","","","<dict:lang value="请填写类源码,再点击解析！" />","",320,150);
			return false;
		}
		if(paraMap_CLASS_NAME==""||paraMap_CLASS_NAME==null){
			utilsFp.confirmIcon("1","","","","<dict:lang value="请填写类全名,再点击解析！" />","",320,150);
			return false;
		}
	  	$.ajax({
		type: "POST",
	    dataType: "json",
	    url: "${path}sys/AdminTargetDataAction_analyClsCode.ms?",
	    data:{'paraMap.clsCode':clsCode,'paraMap.CLASS_NAME':paraMap_CLASS_NAME},
		success: function(data){
			if(data.ajaxMap.status=="false"){
				analySucess=false;
				isSubmit=false;
				utilsFp.confirmIcon("1","","","",data.ajaxMap.info,"",320,150);
			}else{
				analySucess=true;
				isSubmit=true;
				utilsFp.confirmIcon("2","","","",data.ajaxMap.info,"",320,150);
			}
		},
		error: function(msg){
			isNoInit = true;
			
			if(isNoInit){
				util.closeLoading();
			}
				utilsFp.confirmIcon("3","","","","error:"+msg,"",320,150);
		   }
			
		});
	}
	
	function init() {//页面初始化数值
		var DATA_TYPE_VALUE=$("#DATA_TYPE_VALUE").val();
		DATA_TYPE=DATA_TYPE_VALUE;
		var CODE_TYPE_VALUE=$("#CODE_TYPE_VALUE").val();
		var parentiframeId=$("#parentiframeId").val();
		var DATA_COMMENT_ID=$("#DATA_COMMENT_ID").val();
		var CLASS_NAME_VALUE=$("#CLASS_NAME_VALUE").val();
		var COMM_SQL_ID=$("#COMM_SQL_ID").val();
		var MYSQL_SQL_ID=$("#MYSQL_SQL_ID").val();
		var ORACLE_SQL_ID=$("#ORACLE_SQL_ID").val();
		var SQLSERVER_SQL_ID=$("#SQLSERVER_SQL_ID").val();
		var PG_SQL_ID=$("#PG_SQL_ID").val();
		var PARA_ARGS_VALUE=$("#PARA_ARGS_VALUE").val();
		var parentFrame=top.document.getElementById(parentiframeId);//获取到父iframe对象
		var parentDATA_COMMENT_ID=parentFrame.contentWindow.document.getElementById(DATA_COMMENT_ID);
		var parentSQLSERVER_SQL_ID=parentFrame.contentWindow.document.getElementById(SQLSERVER_SQL_ID);
		var parentMYSQL_SQL_ID=parentFrame.contentWindow.document.getElementById(MYSQL_SQL_ID);
		var parentCOMM_SQL_ID=parentFrame.contentWindow.document.getElementById(COMM_SQL_ID);
		var parentORACLE_SQL_ID=parentFrame.contentWindow.document.getElementById(ORACLE_SQL_ID);
		var parentPG_SQL_ID=parentFrame.contentWindow.document.getElementById(PG_SQL_ID);
		if(DATA_TYPE_VALUE==""){
			$("#div_changeForClass").css('display','block');
			$("#div_changeForSQL").css('display','none');
			$("#div_changeForSQLName").css('display','none');
			$("#div_func").css('display','none');
			$("#div_showProcess").css('display','none');
			$("#resultPFName").val("");
			$("#resultDataType").val("");
			$("#resultTableDate").val("");
			$("#div_sql_param").css('display','none');
			$("#div_fun_param").css('display','none');
			$("#div_param").css('display','none');
			$("#showClass").addClass("current").siblings().removeClass("current");
			DATA_TYPE="CLASS_TYPE";
		}
		if(DATA_TYPE_VALUE=="SQL_TYPE"){
			$("#showSQL").addClass("current").siblings().removeClass("current");
			isInit=true;
			$("#comm_sql").val(parentCOMM_SQL_ID.value);
			$("#oracle_sql").val(parentORACLE_SQL_ID.value);
			$("#sqlserver_sql").val(parentSQLSERVER_SQL_ID.value);
			$("#mysql_sql").val(parentMYSQL_SQL_ID.value);
			$("#pg_sql").val(parentPG_SQL_ID.value);
			var arr=PARA_ARGS_VALUE.split(",");
			var name;
			if(arr.length>0){
				$("#div_sql_param").css('display','block');
			}
			$("#div_func_param").css('display','none');
			$("#div_param").css('display','none');
			var sqlParaJson=$("#sqlParaJson").val();
			var addSqlTableBody="";
			var j=1;
			for(var i=0;i<arr.length;i++){
				if(arr[i]==""){
					continue;
				}
				name=arr[i].split("=");
				if(i==0){
					addSqlTableBody="<tbody >"	
				}
					addSqlTableBody+="<tr>"
					+"<td align='center' style='width:25px;'>"+j+"</td>"
					+"<td align='center' style='width:75px;'><input type='hidden' value='"+name[0]+"'>"+name[0]+"</input></td>"
					+"<td align='center' style='width:75px;'><select id='select_"+i+"' class='dept_select'>"
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
			addSqlTableBody+="</tbody>";
			$("#addSqlTable1").html(addSqlTableBody);
			for(var i=0;i<arr.length;i++){
				$("#select_"+i).trigger("chosen:updated");
				setChosen();
			}
			$("input[type=radio][value="+DATA_TYPE_VALUE+"]").attr("checked",'checked');
			$("#div_changeForSQLName").show();
			$("#div_changeForSQL").show();
			if(curDataType=='oracle'){
			
				$("#sqlType_oracle").attr("checked",'checked');
				$("#oracle_sql").show();
			}else if(curDataType=='sqlserver'){
			
				$("#sqlType_sqlserver").attr("checked",'checked');
				$("#sqlserver_sql").show();
			}else if(curDataType=='mysql'){
		
				$("#sqlType_mysql").attr("checked",'checked');
				$("#mysql_sql").show();
			}else if(curDataType=='commsql'){
		
				$("#sqlType_commsql").attr("checked",'checked');
				$("#comm_sql").show();
		    }else if(curDataType=='pg'){
		    
			    $("#sqlType_pg").attr("checked",'checked');
			    $("#pg_sql").show();
		    }
			$("#analyButton").show();
			$("#confirmButton").show();
			
		}
		if(DATA_TYPE_VALUE=="PRO_TYPE"||DATA_TYPE_VALUE=="FUN_TYPE"){
			isInit=true;
			var result = PARA_ARGS_VALUE;
			var arr;
			var addTrFor="<thead><tr>"
						     +"<th style=width:25px;text-align:center><dict:lang value='序号' /></th>"
						     +"<th style=width:75px;text-align:center><dict:lang value='参数名' /></th>"
						  	 +"<th style=width:75px;text-align:center><dict:lang value='参数值' /></th>"
						  	 +"</tr></thead>";
			if(DATA_TYPE_VALUE=="PRO_TYPE"){
				$("#showProcess").addClass("current").siblings().removeClass("current");
				$("#div_func_param").hide();
				$("#div_param").show();
				isProInit=true;
				$("#div_showProcess").show();
				$("#processValue").val(parentDATA_COMMENT_ID.value);
				var name;
				var index=1;
				addTrFor+="<tbody>";
				if(result.indexOf(",")>=0){
					arr=result.split(",");
				  for(var i=0;i<arr.length;i++){
					name=arr[i].split("=");
						if(name[0]=="out"){
							addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+name[0]+"'>"+name[0]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'>";
							addTrFor+="<option value='0' selected><dict:lang value='字符串' /> &nbsp;&nbsp;</option></select></td></tr>";
							index++;
						}else if(name[0]=="in" || name[0]=="inout"){
							addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+name[0]+"'>"+name[0]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'>";
							if(name[1]==0){
								addTrFor+="<option value='0' selected><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
							}else if(name[1]==1){
								addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1' selected><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
							}else if(name[1]==2){
								addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2' selected><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
							}else if(name[1]==3){
								addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3' selected><dict:lang value='当前时间' /></option>";
							}
							addTrFor+="</select></td></tr>";
							index++;
						}
				  }
				}else{
					name=result.split("=");
					if(name[0]=="out"){
							addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+name[0]+"'>"+name[0]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'>";
							addTrFor+="<option value='0' selected><dict:lang value='字符串' /> &nbsp;&nbsp;</option></select></td></tr>";
							index++;
					}else if(name[0]=="in" || name[0]=="inout"){
							addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+name[0]+"'>"+name[0]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'>";
							if(name[1]==0){
								addTrFor+="<option value='0' selected><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
							}else if(name[1]==1){
								addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1' selected><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
							}else if(name[1]==2){
								addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2' selected><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
							}else if(name[1]==3){
								addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3' selected><dict:lang value='当前时间' /></option>";
							}
							addTrFor+="</select></td></tr>";
							index++;
					}
				}
				addTrFor+="</tbody>";
				$("#addTable").html(addTrFor);
				for(var i=0;i<arr.length;i++){
					$("#select_"+i).trigger("chosen:updated");
					setChosen();
				}
				utilsFp.confirmIcon("2","","","","获取参数完成","",320,150);
			}else{
				$("#showFunc").addClass("current").siblings().removeClass("current");
				addTrFor+="<tbody>";
				$("#div_func").show();
				$("#functionValue").val(parentDATA_COMMENT_ID.value);
				$("#div_func_param").show();
				$("#div_param").hide();
				var index=1;
				if(result.indexOf(",")>=0){
					arr=result.split(",");
					var name;
				for(var i=0;i<arr.length;i++){
					name=arr[i].split("=");
					if(name[0]=="in"){
						addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+name[0]+"'>"+name[0]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'>";
						if(name[1]==0){
							addTrFor+="<option value='0' selected><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
						}else if(name[1]==1){
							addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1' selected><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
						}else if(name[1]==2){
							addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2' selected><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
						}else if(name[1]==3){
							addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3' selected><dict:lang value='当前时间' /></option>";
						}
						addTrFor+="</select></td></tr>";
						index++;
					}
				}
				}else{
					name=result.split("=");
					 if(name[0]=="in"){
						addTrFor+="<tr><td style=\"width:25px;text-align:center\">"+index+"</td><td style=\"width:75px;text-align:center\"><input type='hidden' value='"+name[0]+"'>"+name[0]+"</input></td><td style=\"width:75px;text-align:center\"><select class='dept_select' id='select_"+i+"'>";
						if(name[1]==0){
							addTrFor+="<option value='0' selected><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
						}else if(name[1]==1){
							addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1' selected><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
						}else if(name[1]==2){
							addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2' selected><dict:lang value='部门Id' /></option><option value='3'><dict:lang value='当前时间' /></option>";
						}else if(name[1]==3){
							addTrFor+="<option value='0'><dict:lang value='用户Id' /></option><option value='1'><dict:lang value='用户名称' /></option><option value='2'><dict:lang value='部门Id' /></option><option value='3' selected><dict:lang value='当前时间' /></option>";
						}
						addTrFor+="</select></td></tr>";
						index++;
					}
				}
				addTrFor+="</tbody>";
				$("#addFuncTable").html(addTrFor);
				for(var i=0;i<arr.length;i++){
					$("#select_"+i).trigger("chosen:updated");
					setChosen();
				}
			}
		}
		if(DATA_TYPE_VALUE=="CLASS_TYPE"){
			initLoadClass = false;
			isInit=true;
			analySucess	=false;
			$("#div_sql_param").hide();
			$("#div_fun_param").hide();
			$("#div_param").hide();
			util.reloadTabKey($("#clsCode__"));
			var divHeadH = $("#div_head").height();
			var docWh = $(document).height();
			var winWh = $(window).height();
			$("#clsCode__").css({height:310});
			_codeType=$("#CODE_TYPE_VALUE").val();
			if(_codeType == ""){
				_codeType = "CODE_BASE";
			}
			if(CODE_TYPE_VALUE!=null){
				$("input[type=radio][value="+DATA_TYPE_VALUE+"]").attr("checked",'checked');
				$("input[type=radio][value="+_codeType+"]").attr("checked",'checked');
				$("#div_changeForClass").show();
			}
		
			$("#paraMap_CLASS_NAME").val(CLASS_NAME_VALUE);
		
			var clsCode=parentDATA_COMMENT_ID.value;
			if(clsCode!=""&&clsCode!=null){
				$("#clsCode__").val(clsCode);
			}else{
				loadClsCode(_codeType);
			}
			$("#clsCode__").show();
			//类名称文本框长度
			if($("#paraMap_CLASS_NAME").width()<100){
				$("#paraMap_CLASS_NAME").css({width:100});
			}
			if (window.navigator.userAgent.indexOf("MSIE") > -1) {
				util.setTextAreaWidth("div_code","clsCode__");
				util.setTextAreaHeight("clsCode__",$("#div_head").height());
				$(window).resize(function () {
					util.setTextAreaWidth("div_code","clsCode__");
					util.setTextAreaHeight("clsCode__",$("#div_head").height());
				});
			} else {
				$("#clsCode__").css({width:"100%"});
			}

			var codeId=$("#codeId").val();
			if(codeId) {
				$("#debugButton").show();
			}
		}
		}
		function commit(obj){//数据源提交按钮
			var CODE_TYPE=$("input[name='paraMap.codeType']:checked").val();
			var comm_sql=$("#comm_sql").val();
			var oracle_sql=$("#oracle_sql").val();
			var sqlserver_sql=$("#sqlserver_sql").val();
			var mysql_sql=$("#mysql_sql").val();
			var pg_sql=$("#pg_sql").val();
			var resultPFName=$("#resultPFName").val();
			var resultDataType=$("#resultDataType").val();
			var resultTableDate=$("#resultTableDate").val();
			var DATA_TYPE_ID=$("#DATA_TYPE_ID").val();
			var DATA_COMMENT_ID=$("#DATA_COMMENT_ID").val();
			var PARA_ARGS_ID=$("#PARA_ARGS_ID").val();
			var MS_CLASS_CODE_ID_ID=$("#MS_CLASS_CODE_ID_ID").val();
			var CODE_TYPE_ID=$("#CODE_TYPE_ID").val();
			var CLASS_NAME_ID=$("#CLASS_NAME_ID").val();
			var parentiframeId=$("#parentiframeId").val();
			var paraMap_CLASS_NAME=$("#paraMap_CLASS_NAME").val();
			var BUTTON_ID=$("#BUTTON_ID").val();		   
			var RESULT_PF_NAME=$("#resultPFName").val();
			var RESULT_TABLE_DATE=$("#resultTableDate").val();
			var COMM_SQL_ID=$("#COMM_SQL_ID").val();
			var MYSQL_SQL_ID=$("#MYSQL_SQL_ID").val();
			var ORACLE_SQL_ID=$("#ORACLE_SQL_ID").val();
			var SQLSERVER_SQL_ID=$("#SQLSERVER_SQL_ID").val();
			var PG_SQL_ID=$("#PG_SQL_ID").val();
			var parentFrame=top.document.getElementById(parentiframeId);//获取到父iframe对象
			var parentDATA_TYPE_ID=parentFrame.contentWindow.document.getElementById(DATA_TYPE_ID);//通过父iframe找到菜单名称这个输入框
			var parentCODE_TYPE_ID=parentFrame.contentWindow.document.getElementById(CODE_TYPE_ID);//通过父iframe找到菜单Id这个输入框
			var parentCLASS_NAME_ID=parentFrame.contentWindow.document.getElementById(CLASS_NAME_ID);
			var parentDATA_COMMENT_ID=parentFrame.contentWindow.document.getElementById(DATA_COMMENT_ID);
			var parentSQLSERVER_SQL_ID=parentFrame.contentWindow.document.getElementById(SQLSERVER_SQL_ID);
			var parentMYSQL_SQL_ID=parentFrame.contentWindow.document.getElementById(MYSQL_SQL_ID);
			var parentCOMM_SQL_ID=parentFrame.contentWindow.document.getElementById(COMM_SQL_ID);
			var parentORACLE_SQL_ID=parentFrame.contentWindow.document.getElementById(ORACLE_SQL_ID);
			var parentPG_SQL_ID=parentFrame.contentWindow.document.getElementById(PG_SQL_ID);
			var parentPARA_ARGS_ID=parentFrame.contentWindow.document.getElementById(PARA_ARGS_ID);
			var BUTTON_ID_ID=parentFrame.contentWindow.document.getElementById(BUTTON_ID);
			var parentMS_CLASS_CODE_ID_ID=parentFrame.contentWindow.document.getElementById(MS_CLASS_CODE_ID_ID);
			if(isDel&&DATA_TYPE=="CLASS_TYPE"){
				var clsCode=$("#clsCode__").val();
				if(clsCode==""||clsCode==null){
					utilsFp.confirmIcon("1","","","","<dict:lang value="请填写类源码,再点击提交！" />","",320,150);
					return false;
				}
				if(!analySucess){
					utilsFp.confirmIcon("1","","","","<dict:lang value="解析未成功,不能提交！" />","",320,150);
					return false;
				}
			}
			switch(DATA_TYPE){
				case "CLASS_TYPE":
					var clsCode=$("#clsCode__").val();
						if(DATA_TYPE==null){
							utilsFp.confirmIcon("1","","","","<dict:lang value="请填写一个数据源,再点击提交！" />","",320,150);
							return false;
						}
						if(!isDel&&(clsCode==""||clsCode==null)){

							utilsFp.confirmIcon("1","","","","<dict:lang value="请填写类源码,再点击提交！" />","",320,150);
							return false;
						}
						if(!analySucess){
							utilsFp.confirmIcon("1","","","","<dict:lang value="解析未成功,不能提交！" />","",320,150);
							return false;
						}
					break;
				case "SQL_TYPE":
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
					if(comm_sql!=""){
						if(!isAnalyCommon){
							utilsFp.confirmIcon("1","","","","<dict:lang value="通用sql解析未成功,不能提交！" />","",320,150);
							return false;
						}
					}
					if(comm_sql==""&&sqlserver_sql==""&&mysql_sql==""&&oracle_sql==""&&pg_sql==""){
						utilsFp.confirmIcon("1", "", "", "",
								"<dict:lang value="未填写任何相关sql语句，请填写！" />", "", 320,
								150);
						return false;
					}
					break;
				case "PRO_TYPE":
					if((resultPFName==""||resultPFName==null)||(resultDataType==""||resultDataType==null)||(resultTableDate==""||resultTableDate==null)){
						utilsFp.confirmIcon("1","","","","<dict:lang value="请正确解析一个存储过程,再点击保存！" />","",320,150);
						return false;
					}
					break;
				case "FUN_TYPE":
					if(resultPFName==""||resultPFName==null){
						utilsFp.confirmIcon("1","","","","<dict:lang value="请正确解析一个函数,再点击保存！" />","",320,150);
						return false;
					}
					break;
				default:
					utilsFp.confirmIcon("1","","","","<dict:lang value="请选择你想要的操作！" />","",320,150);
					return false;
					break;
			}
			
			if(DATA_TYPE=='CLASS_TYPE'){//数据源类源码
				if(isDel){
					parentMS_CLASS_CODE_ID_ID.value="";
				}
				isDel=false;
				BUTTON_ID_ID=parentFrame.contentWindow.document.getElementById(BUTTON_ID);
				parentDATA_TYPE_ID.value=DATA_TYPE;
				parentCODE_TYPE_ID.value=CODE_TYPE;
				parentCLASS_NAME_ID.value=paraMap_CLASS_NAME;
				parentDATA_COMMENT_ID.value=clsCode;
				BUTTON_ID_ID.innerText="已配置";
			}
			if(DATA_TYPE=='SQL_TYPE'){//sql语句
				var sqlPara="";
				parentDATA_TYPE_ID.value=DATA_TYPE;
				parentCODE_TYPE_ID.value=CODE_TYPE;
				parentCOMM_SQL_ID.value=comm_sql;
				parentSQLSERVER_SQL_ID.value=sqlserver_sql;
				parentMYSQL_SQL_ID.value=mysql_sql;
				parentORACLE_SQL_ID.value=oracle_sql;
				parentPG_SQL_ID.value=pg_sql;				
				$("#addSqlTable1 tbody tr").each(function(seq,length){
					 var tdArr=$(this).children();
					 param=tdArr.eq(1).find("input").val();
					 dateValue=tdArr.eq(2).find("select").val();
					 sqlPara=sqlPara+param+"="+dateValue+",";
				});
				parentPARA_ARGS_ID.value=sqlPara;
				BUTTON_ID_ID.innerText="已配置";
			}
			if(DATA_TYPE=="PRO_TYPE" || DATA_TYPE=="FUN_TYPE"){//过程和函数
				parentDATA_TYPE_ID.value=DATA_TYPE;
				parentPARA_ARGS_ID.value=RESULT_TABLE_DATE;
				parentDATA_COMMENT_ID.value=RESULT_PF_NAME;
				BUTTON_ID_ID.innerText="已配置";
			}
			closeWindow();
		}
		function del(obj){
			utilsFp.confirmIcon(4,"","commDel","","<dict:lang value='请确认是否删除类源码内容！' />",1,320,150);
		}
		function commDel(){
			isDel=true;
			$("#clsCode__").val("");
			$("#paraMap_CLASS_NAME").val("");
		}
		function showSqlParam(){//解析sql参数
		 	isConfirmButton=true;
		 	var sqlType=$('input[name="paraMap.sqlType"]:checked').val();

			if(sqlType=="commsql"){
				 sqlContext=$("#comm_sql").val();
				 if(sqlContext==""){
					utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
					return false;
				 }
			}else if(sqlType=="oracle"){
				sqlContext=$("#oracle_sql").val();
				 if(sqlContext==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
						return false;
				}
			}else if(sqlType=="mysql"){
				sqlContext=$("#mysql_sql").val();
				 if(sqlContext==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
						return false;
				 }
			}else if(sqlType=="sqlserver"){
				sqlContext=$("#sqlserver_sql").val();
				 if(sqlContext==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
						return false;
				 }
			}else if(sqlType=="pg"){
			sqlContext=$("#pg_sql").val();
			 if(sqlContext==""){
					utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
					return false;
			 }
		    }
			var type=/:param([12][0-9]|[1-9])/g;//匹配:param(1-29)
			var arr=sqlContext.match(type);
			var addSqlTableBody=""
			if(arr!=null){
				var index=1;
				var sqlParaJson= $("#sqlParaJson").val();
				for(var i=0;i<arr.length;i++){
					if(i==0){
						 addSqlTableBody="<tbody >"
					}
					addSqlTableBody+="<tr>"
					+"<td align='center' style='width:25px;'>"+index+"</td>"
					+"<td align='center' style='width:75px;'><input type='hidden' value='"+arr[i]+"'>"+arr[i]+"</input></td>"
					+"<td align='center' style='width:75px;'><select id='select_"+i+"' class='dept_select'>"
					var sqlParaMap= eval("("+sqlParaJson+")")
					for(var k  in sqlParaMap){
						if( k ==0){
							addSqlTableBody+="<option value='"+k+"' selected >"+sqlParaMap[k]+"</option>"
						}else{
							addSqlTableBody+="<option value='"+k+"' >"+sqlParaMap[k]+"</option>"
						}
					}
					addSqlTableBody+="</select></td></tr>"
					if(i==arr.length-1){
						addSqlTableBody+="</tbody>"
					}
					index++;
				}
			}
			$("#addSqlTable1").html(addSqlTableBody);
			utilsFp.confirmIcon("2","","","","获取参数完成","",320,150);
			if(arr!=null){
				for(var i=0;i<arr.length;i++){
					$("#select_"+i).trigger("chosen:updated");
					setChosen();
				}
			}
			$("#div_sql_param").show();
			$("#div_fun_param").hide();
			$("#div_param").hide();
			
		}
		
		$("#sqlType_comm").click(function(){
			$("#comm_sql").show();
			$("#sqlserver_sql").hide();
			$("#mysql_sql").hide();
			$("#oracle_sql").hide();
			$("#pg_sql").hide();
			isAnaly=false;
			$("#analyButton").show();
			$("#confirmButton").show();
		});
		$("#sqlType_sqlserver").click(function(){
			$("#comm_sql").hide();
			$("#sqlserver_sql").show();
			$("#mysql_sql").hide();
			$("#oracle_sql").hide();
			$("#pg_sql").hide();
			isAnaly=false;
			if(curDataType=='sqlserver'){
				$("#analyButton").show();
				$("#confirmButton").show();
			}else{
				$("#analyButton").hide();
				$("#confirmButton").hide();
			}
		});
		$("#sqlType_mysql").click(function(){
			$("#comm_sql").hide();
			$("#sqlserver_sql").hide();
			$("#mysql_sql").show();
			$("#oracle_sql").hide();
			$("#pg_sql").hide();
			isAnaly=false;
			if(curDataType=='mysql'){
				$("#analyButton").show();
				$("#confirmButton").show();
			}else{
				$("#analyButton").hide();
				$("#confirmButton").hide();
			}
		});
		$("#sqlType_oracle").click(function(){
			$("#comm_sql").hide();
			$("#sqlserver_sql").hide();
			$("#mysql_sql").hide();
			$("#pg_sql").hide();
			$("#oracle_sql").show();
			isAnaly=false;
			if(curDataType=='oracle'){
				$("#analyButton").show();
				$("#confirmButton").show();
			}else{
				$("#analyButton").hide();
				$("#confirmButton").hide();
			}
		});
		$("#sqlType_pg").click(function(){
			$("#comm_sql").hide();
			$("#sqlserver_sql").hide();
			$("#mysql_sql").hide();
			$("#oracle_sql").hide();
			$("#pg_sql").show();
			isAnaly=false;
			if(curDataType=='pg'){
				$("#analyButton").show();
				$("#confirmButton").show();
			}else{
				$("#analyButton").hide();
				$("#confirmButton").hide();
			}
		});
		function analySql(){//解析sql
			if(!isConfirmButton){//sql参数已经解析了，则不会提示，有参数但是没有点击确定直接解析会报错
				utilsFp.confirmIcon("1","","","","<dict:lang value="请先点击确定，再点击解析！" />","",320,150);
				return false;
			}
			var sqlType=$('input[name="paraMap.sqlType"]:checked').val();
			if(sqlType=="commsql"){//判断当前的sql是否有写入内容
				 sqlContext=$("#comm_sql").val();
				 if(sqlContext==""){
					utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
					return false;
				 }
			}else if(sqlType=="oracle"){
				sqlContext=$("#oracle_sql").val();
				 if(sqlContext==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
						return false;
				}
			}else if(sqlType=="mysql"){
				sqlContext=$("#mysql_sql").val();
				 if(sqlContext==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
						return false;
				 }
			}else if(sqlType=="sqlserver"){
				sqlContext=$("#sqlserver_sql").val();
				 if(sqlContext==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
						return false;
				 }
			}else if(sqlType=="pg"){
				sqlContext=$("#pg_sql").val();
				 if(sqlContext==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="未填写任何相关sql语句，请填写！" />","",320,150);
						return false;
				 }
			}
			var sqlPara="";
			var sqlContext=$("#sqlContext").val();
			
			var sqlType=$('input[name="paraMap.sqlType"]:checked').val();
			if(sqlType=="commsql"){
				 sqlContext=$("#comm_sql").val();
			}else if(sqlType=="oracle"){
				sqlContext=$("#oracle_sql").val();
			}else if(sqlType=="mysql"){
				sqlContext=$("#mysql_sql").val();
			}else if(sqlType=="sqlserver"){
				sqlContext=$("#sqlserver_sql").val();
			}else if(sqlType=="pg"){
				sqlContext=$("#pg_sql").val();
			}
			$("#addSqlTable1 tbody tr").each(function(seq, length) {
				var tdArr = $(this).children();
				param = tdArr.eq(1).find("input").val();
				dateValue = tdArr.eq(2).find("select").val();
				sqlPara = sqlPara + param + "=" + dateValue + ",";
			});
		
<%--			sqlContext=sqlContext.replace(/\+/g,"%2B");//ajax post数据 对于+或者& 或省略 需要转成特定的字符编码--%>
<%--			sqlContext=sqlContext.replace(/\g/g,"%26");--%>
			$.ajax({
				type: "POST",
			    url: "${path}sys/AdminTargetDataAction_analySql.ms?",
			    data : {"paraMap.sqlPara" :sqlPara,"paraMap.sqlType":sqlType,"paraMap.sqlContext":sqlContext},
				success: function(data){
					if(data.ajaxMap.status=="false"){
						if(sqlType=="commsql"){
							isAnalyCommon=false
						}else{
							isAnalyOther=false;
						}
						utilsFp.confirmIcon("1","","","",data.ajaxMap.info,"",320,150);
					}else{
						if(sqlType=="commsql"){
							isAnalyCommon=true
						}else{
							isAnalyOther=true;
						}
						utilsFp.confirmIcon("2","","","",data.ajaxMap.info,"",320,150);
					}
				},
				error: function(msg){
					isNoInit = true;
					if(isNoInit){
						util.closeLoading();
					}
						utilsFp.confirmIcon("3","","","","error:"+msg,"",320,150);
				   }
					
				});
		}
		$(function(){
			$('.scroll').mCustomScrollbar({
	        scrollInertia:150,
	        autoHideScrollbar:true,
	        theme:"minimal-dark",
	      });
	      
	      if(initLoadClass){
	      	loadClsCode("CODE_BASE");
	      }
	      
	      
	      	      //去除空格
	      $("#paraMap_CLASS_NAME").blur(function(){
	      	$("#paraMap_CLASS_NAME").val(util.allTrim($(this).val()));
	      });
	      
		});

	//打开新窗口
	function validateIsCurrentsDebug(){
		var classNameValue = $("#paraMap_CLASS_NAME").val();
		var codeId = $("#codeId").val();
		var codeType = $("input[name='paraMap.codeType']:checked").val();
		if(codeId) {
			utilsFp.debugPageDetail(classNameValue,codeId,codeType);
		}
	}
</script>

</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp"%>