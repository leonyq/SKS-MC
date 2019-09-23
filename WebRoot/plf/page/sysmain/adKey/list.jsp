<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="关键数据库设置列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
			<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	
	<style type="text/css">
		.input {
    		box-sizing: border-box;
    		border: 1px solid #ccc;
    		height: 25px;
    		line-height: 25px;
    		padding-left: 5px;
    		font-size: 13px;
			 }
		.optn1 button {
    		border: 1px solid #75c4ff;
    		border-radius: 2px;
    		background-color: #fff;
    		color: #666;
    		height: 28px;
    		line-height: 26px;
    		cursor: pointer;
    		width: 100px;
		}
		.optn2 button {
    		border: 1px solid #75c4ff;
    		border-radius: 2px;
    		background-color: #fff;
    		color: #666;
    		height: 28px;
    		line-height: 26px;
    		cursor: pointer;
    		width: 33px;
    		margin-left: 10px;
    		margin-bottom: 10px;
    		float: left
		}
		.table-line thead th {
    		height:30px;
    		background-color: #e6eaf4; 
    		border-color:#dbe1ef;
    		border-bottom:0;
    		font-size:14px;
    		color:#666;
    		font-weight: normal;
		}
		
		td select{
			outline:none;
		}
		
		._data button{
			height: 22px;
		    width: 70px;
		    margin-top: 1px;
		    background-color: #75c4ff;
		    border: 0;
		    border-radius: 2px;
		    color: #fff;
		    cursor:pointer;
		}
		
		._data button:hover{
			background-color: #369EEE;
		}
		
		table tr:nth-of-type(2n){
			background-color: #f0f4fd;
		}
	</style>
	</head>
<body>
		<div class="content-in">
			<div class="dlist">
               <div class="hd">
                  <div class="optn">
                  <table class="func_table">
                  <tr>
				<td width="100%" align="right">
			    <button type="button" onclick="addRow();"><i class="ico ico-kl"></i><dict:lang value="新增" /></button>
			   	<button type="button" onclick="return commit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
			    <button type="button" onclick="del();"><i class="ico ico-sc"></i><dict:lang value="删除" /></button>
			    <button type="button" onclick="query(this);"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
				</td>
	    		</tr>
				</table>
				</div>
				</div>
                <div class="bd">
             <div class="search-box">
	<form id="search_form" name="searchForm" action="${path}sys/AdKeyDataAction_queryAdList.ms" method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
	<table class="search_table">
		<tr>

			<td>
				<div class="group">
					<div class="name" ><dict:lang value="关键数据名称" /></div>
					<div class="dec"><input class="input" id="keyNameSh" name="keyNameSh" Class="input_sh" maxlength="30" value="<s:property value='keyNameSh'/>" onkeyup="javascript:replaceLikeVal(this)"/></div>			
      			</div>	  	
		  	</td>
		  	<td>
		  		<div class="group">
					<div class="name" ><dict:lang value="类别" /></div>
					<div class="dec"><dict:selectDict dictCode="TARGET_TYPE"   id="typeSh" name="typeSh" style="cursor: pointer; width:240px" cssClass="dept_select" 
			  	custom_option="<option value=''>%{getText('--请选择--')}</option>"   dictValue="${fn:escapeXml(typeSh)}"/> </div>			
      			</div>
			  	
		  	</td>
	    </tr>
	</table>
	</form>
	</div>
	
	
	<!-- 新增列表使用 -->
	<table id="addTable" style="display: none;" >
 			<tr id="addTr">
 			<td style="width:30px;text-align:center;"><span></span></td><!-- 序号 -->
			<td style="width:30px;text-align:center;"><input type="checkbox" name="adminKeyId" id="subcheck" value="<c:out value='${id}'/>"  style="margin:0"></td><!-- 复选框 -->
			
			<td style="width:250px;text-align:center;">
				<s:textfield id="KEYNAME" name="keyName" value="%{keyName}" cssClass="isSubmit" 
							onchange="setModify(this);"  maxLength="20" cssStyle="width: 100%;text-align:center;border:0px;background-color:transparent;" onkeyup="javascript:replaceLikeVal(this)" /><!-- 指标名称 -->
				<s:hidden name="id"></s:hidden>
			</td>
			<td style="padding:0;text-align:center;width:100px">
				<dict:selectDict id="TARGET_TYPE" name="type" dictCode="TARGET_TYPE" cssClass="isSubmit" dictValue="%{type}" style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this);" />
				<!-- 类型-->
			</td>
			<td style="padding:0;width:150px;text-align:center;">
				<dict:selectDict id="AD_SHOW_TYPE" name="showType" dictCode="AD_SHOW_TYPE" dictValue="%{showType}" cssClass="isSubmit" style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this);" />
				<s:hidden name="showType" id="SHOW_TYPE" value="${showType}"></s:hidden>
				<!-- 展示类型-->
			</td>
			<td class="_data" style="width:150px;text-align:center;">	
						
							<button type="button" id="button_id" onclick="setDatabase(this);setModify(this)" title="单击配置数据源" class="isSubmit" ><dict:lang value="未配置" /></button>
							<s:textfield id="PARA_ARGS" name="paraArgs" value="%{paraArgs}" cssStyle="display:none" cssClass="isSubmit"/>
							<s:textarea  id="DATA_COMMENT" name="dataComment" value="%{dataComment}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textfield id="COL_PRO" name="colPro" value="%{colPro}" cssStyle="display:none" cssClass="isSubmit"/>
							<s:textarea id="COMM_SQL" name="commSql" value="%{commSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textarea id="SQLSERVER_SQL" name="sqlserverSql" value="%{sqlserverSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textarea id="ORACLE_SQL" name="oracleSql" value="%{oracleSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textarea id="MYSQL_SQL" name="mysqlSql" value="%{mysqlSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textfield id="CHARTS_CONFIG" name="chartsConfigjson" value="%{chartsConfigjson}" cssStyle="display:none" cssClass="isSubmit"/>
							<s:textfield id="CHARTS_Id" name="chartsId" value="%{chartsId}" cssStyle="display:none" cssClass="isSubmit"></s:textfield>
							<s:hidden  id="SHOW_TYPE" value="${showType}" cssClass="isSubmit"></s:hidden>
<s:textarea id="PG_SQL" name="pgSql" value="%{pgSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>							
			</td>
			<td style="padding:0;width:200px;text-align:center;">
							<s:textfield id="MENUNAME" name="menuName" value="%{menuName}" cssClass="isSubmit" 
							maxLength="30" cssStyle="width:67%;cursor:pointer;text-align:center;width:100%;height:100%;border:0;background-color:transparent;" title="双击配置菜单" readonly="true" ondblclick="setMenu(this);setModify(this)"/>
							<s:textfield id="MENUID" name="menuId" value="%{menuId}" cssStyle="display:none" cssClass="isSubmit"/>
					
			</td>
			<td style="padding:0;width:80px;text-align:center;">
				<!-- 是否默认显示-->
				<dict:selectDict id="IS_DEFAULT_SHOW" name="showDefault" dictCode="IS_DEFAULT_SHOW" disabled="true" cssClass="isSubmit" dictValue="%{showDefault}" onchange="showDefaultSel(this);setModify(this)"
				style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" />
			</td>
			<td style="width:80px;text-align:center;">
				<s:textfield id="SHOWORDER" name="showOrder" value="%{showOrder}" cssClass="isSubmit" cssStyle="width:100%;height:100%;border:0;background-color:transparent;text-align:center" onchange="setModify(this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
			</td>
			<td style="width:80px;text-align:center;"><%--显示行数 --%>
				<s:textfield id="SHOWNUMBER" name="showNumber" value="%{showOrder}" cssClass="isSubmit" cssStyle="width:100%;height:100%;border:0;background-color:transparent;text-align:center" onchange="setModify(this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
			</td>
			<td style="padding:0;text-align:center;">
				<!-- 是否启用-->
				<dict:selectDict id="IS_WORK" name="status" dictCode="IS_WORK" cssClass="isSubmit" dictValue="%{status}" onchange="setShowDefault(this);setModify(this)"
				style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" />
			</td>
			</tr>
		</table>	
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@SHOW_DEFAULT_KEY_NUMBER}" id="showNumberTotal"/>
		
	<table class="dlist-table table-line" style="width: 100%;table-layout: fixed;">
	<thead>	
		<tr class="tableHead">
			<th style="width:30px;text-align:center;"></th>
			<th style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></th>
			<th style="width:250px;text-align:center;"><dict:lang value="关键数据名称" /></th>
			<th style="text-align:center;width:100px"><dict:lang value="类别" /></th>
			<th style="width:150px;text-align:center;"><dict:lang value="显示类型" /></th>
			<th style="width:150px;text-align:center;"><dict:lang value="数据" /></th>
			<th style="width:200px;text-align:center;"><dict:lang value="关联菜单名称" /></th>
			<th style="width:80px;text-align:center;"><dict:lang value="默认显示" /></th>
			<th style="width:80px;text-align:center;"><dict:lang value="显示顺序" /></th>
			<th style="width:80px;text-align:center;"><dict:lang value="显示行数" /></th>
			<th style="text-align:center;"><dict:lang value="是否启用" /></th>
		</tr>
	</thead>
	</table>
	<div class="main" id="main" style="overflow: hidden;">
    <table id="editTable" class="dlist-table " style="width: 100%;table-layout: fixed;">
	
	<tbody id="adKeyList">
	<s:iterator value="adKeyList" status="index" id="adto">
		<tr>
			<td style="width:30px;text-align:center;"><s:property value="#index.count"/></td><!-- 序号 -->
			<td style="width:30px;text-align:center;"><input type="checkbox" name="adminKeyId" id="subcheck" value="<c:out value='${id}'/>"  style="margin:0"/></td><!-- 复选框 -->
			<td style="width:250px;text-align:center;">
				<s:textfield id="KEYNAME_%{#index.index}" name="pageKeyList[%{#index.index}].keyName" value="%{keyName}" cssClass="input" 
							maxLength="20" cssStyle="width: 100%;text-align:center;border:0px;background-color:transparent;" onchange="setModify(this)" onkeyup="javascript:replaceLikeVal(this)"  /><!-- 指标名称 -->
				<s:hidden name="pageKeyList[%{#index.index}].id" value="${id}"></s:hidden>
			</td>
			<td style="padding:0;text-align:center;width:100px" >
				<dict:selectDict id="TARGET_TYPE_%{#index.index}" name="pageKeyList[%{#index.index}].type" dictCode="TARGET_TYPE" dictValue="%{type}" style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this)"/>
				<!-- 类型-->
			</td>
			<td style="padding:0;width:150px;text-align:center;">
					<dict:selectDict id="AD_SHOW_TYPE_%{#index.index}" name="pageKeyList[%{#index.index}].showType" dictCode="AD_SHOW_TYPE" dictValue="%{showType}" style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this);changeType(this)"/>
				<!-- 展示类型-->
			</td>
			<td class="_data" style="width:150px;text-align:center;">
							<s:if test="showType==0&&dataComment!=null">	
								<button type="button" id="button_id_<c:out value='${index.index}'/>" onclick="setDatabase(this);setModify(this)" title="单击配置数据源"><dict:lang value="已配置" /></button>
							</s:if>	
							<s:elseif test="showType!=0&&chartsId!=null">	
								<button type="button" id="button_id_<c:out value='${index.index}'/>" onclick="setDatabase(this);setModify(this)" title="单击配置数据源"><dict:lang value="已配置" /></button>
							 </s:elseif>
							<s:else>
								<button type="button" id="button_id_<c:out value='${index.index}'/>" onclick="setDatabase(this);setModify(this)" title="单击配置数据源"><dict:lang value="未配置" /></button>
							</s:else>
							<input id="PARA_ARGS_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].paraArgs" value="<c:out value='${paraArgs}'/>" style="display:none"/>
							<textarea id="DATA_COMMENT_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].dataComment" style="display:none;word-wrap: normal;" wrap="off"><c:out value='${dataComment}'/></textarea>
							<textarea id="COL_PRO_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].colPro"  style="display:none"/><c:out value='${colPro}'/></textarea>
							<textarea id="COMM_SQL_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].commSql"  style="display:none;word-wrap: normal;" wrap="off"><c:out value='${commSql}'/></textarea>
							<textarea id="SQLSERVER_SQL_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].sqlserverSql"  style="display:none;word-wrap: normal;" wrap="off"><c:out value='${sqlserverSql}'/></textarea>
							<textarea id="ORACLE_SQL_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].oracleSql"  style="display:none;word-wrap: normal;" wrap="off"><c:out value='${oracleSql}'/></textarea>
							<textarea id="MYSQL_SQL_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].mysqlSql"  style="display:none;word-wrap: normal;" wrap="off"><c:out value='${mysqlSql}'/></textarea>
							<input id="CHARTS_CONFIG_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].chartsConfigjson" value="<c:out value='${chartsConfigjson}'/>" style="display:none"/>
							<input id="CHARTS_Id_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].chartsId" value="<c:out value='${chartsId}'/>" style="display:none"/>
							<s:hidden  id="SHOW_TYPE_${index.index}" value="${showType}"></s:hidden>
							<textarea id="PG_SQL_<c:out value='${index.index}'/>" name="pageKeyList[<c:out value='${index.index}'/>].pgSql"  style="display:none;word-wrap: normal;" wrap="off">${pgSql}</textarea>
					<!--数据 -->
			</td>
			<td  style="padding:0;width:200px;text-align:center;">
				
					<s:textfield id="MENUNAME_${index.index}" name="pageKeyList[%{#index.index}].menuName" value="%{menuName}" 
							maxLength="30" cssStyle="width:100%;height:100%;border:0;background-color:transparent;cursor:pointer;text-align:center;" title="双击配置菜单" readonly="true" ondblclick="setMenu(this);setModify(this)" />
					<s:textfield id="MENUID_${index.index}" name="pageKeyList[%{#index.index}].menuId" value="%{menuId}" cssStyle="display:none"/>
			</td>
			<td style="padding:0;width:80px;text-align:center;">
				<s:if test="\"0\" == status ">
				<!-- 是否默认显示-->
				<dict:selectDict id="IS_DEFAULT_SHOW_%{#index.index}" name="pageKeyList[%{#index.index}].showDefault" dictCode="IS_DEFAULT_SHOW" dictValue="%{showDefault}" 
				style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" disabled="true" onchange="showDefaultSel(this);setModify(this)" />
				</s:if>
				<s:else>
				<dict:selectDict id="IS_DEFAULT_SHOW_%{#index.index}"  name="pageKeyList[%{#index.index}].showDefault" dictCode="IS_DEFAULT_SHOW" dictValue="%{showDefault}" 
				style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="showDefaultSel(this);setModify(this)" />
				</s:else>
			</td>
			<td style="width:80px;text-align:center;">
				<s:if test="\"0\" == showDefault ">
					<s:textfield id="SHOWORDER_%{#index.index}" name="pageKeyList[%{#index.index}].showOrder" value=""  cssClass="input" cssStyle="display:none;width:100%;height:100%;border:0;background-color:transparent;text-align:center" onchange="setModify(this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
				</s:if>
				<s:else>
					<s:textfield id="SHOWORDER_%{#index.index}" name="pageKeyList[%{#index.index}].showOrder" value="%{showOrder}" cssClass="input"  cssStyle="width:100%;height:100%;border:0;background-color:transparent;text-align:center" onchange="setModify(this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
				</s:else>
			</td>
			<td style="width:80px;text-align:center;">
				<s:textfield id="SHOWNUMBER_%{#index.index}" name="pageKeyList[%{#index.index}].showNumber" value="%{showNumber}" cssClass="input" cssStyle="width:100%;height:100%;border:0;background-color:transparent;text-align:center" onchange="setModify(this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
			</td>
			<td style="padding:0;text-align:center;">
				<!-- 是否启动-->
					<dict:selectDict id="IS_WORK_%{#index.index}" name="pageKeyList[%{#index.index}].status" dictCode="IS_WORK" dictValue="%{status}" 
					style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setShowDefault(this);setModify(this)" />
			</td>
		</tr>
	</s:iterator>
		</tbody>
	</table>
	</div>
	<form id="submit_Form" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="deleteIds" name="deleteIds" />
		<input type="hidden" id="showDefaults" name="showDefaults" />
		<input type="hidden" id="iframeId" name="iframeId" value="<c:out value='${iframeId}'/>"/>
		<table id="submitTable" style="display: none;" >
		</table>
	</form>
	<div style="display: none;">
	<!--为了能使表单提交后返回的页面在iframe所在的页面了 -->
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>
	</div>
	</div> 
</div>
<script type="text/javascript">

	var row_count=0;//总的记录数
	var editTable = $("#editTable");
	var isSubmit = false;//用来标记是否提交
	var removeAdd = false;//用来标记页面新增删除
	var delIds="";//删除ID
	var showDefaults="";
	function replaceLikeVal(comp){  
		utilsFp.replaceLikeVal(comp);
	} 
	$(function(){
		var tableTrJs = editTable.find("tbody tr");
		row_count = tableTrJs.length;//获取当前行数
		$("#iframeId").val(window.name);//获取当前ID
	});
	function setModify1(thisObj){//让当前行被选中
		$(thisObj).parent().parent().parent().find("td").eq(1).find("input[type='checkbox']").prop("checked",true);
	}
	function setModify(thisObj){
		$(thisObj).parent().parent().find("td").eq(1).find("input[type='checkbox']").prop("checked",true);
	}
	function showDefaultSel(thisObj){
		if("1" == thisObj.value){
			$(thisObj).parent().parent().find("td").eq(8).find("input").show();
		}else{
			$(thisObj).parent().parent().find("td").eq(8).find("input").hide();
		}
	}
	function setShowDefault(thisObj){
		if("0" == thisObj.value){
			$(thisObj).parent().parent().find("td").eq(7).find("select").find("option[value='0']").attr("selected","selected");
			$(thisObj).parent().parent().find("td").eq(7).find("select").attr("disabled","disabled");
			$(thisObj).parent().parent().find("td").eq(8).find("input").hide();
		}else{
			$(thisObj).parent().parent().find("td").eq(7).find("select").find("option[value='1']").attr("selected","selected");
			$(thisObj).parent().parent().find("td").eq(7).find("select").removeAttr("disabled");
			$(thisObj).parent().parent().find("td").eq(8).find("input").show();
		}
	}
	//复选框功能
	function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			$("#adKeyList :checkbox").parents("tr").addClass("selected");
		}else{
			$(":checkbox").attr("checked",false);
			$("#adKeyList :checkbox").parents("tr").removeClass("selected");
		}
	}
	//追加行数
	function addRow(){
		var editTableTr = $("#addTr");
		var row = editTableTr.clone(true);
		row[0].id= "data_row_"+row_count;
		row.find("td").each(function(seq) {
			if(seq==0){
				$(this).find("span").text(row_count+1);
			}else {
				submitObj = $(this).find(".isSubmit");
				submitObj.each(function(seq){
					if(seq==0&&submitObj.length==1){
						submitObj.attr("id",submitObj.attr("id")+"_"+row_count);//所有新增的td id命名规则为 id的值加上“_“+row_count的值 
						if("status" == submitObj.attr("name")){
							var curRow=row_count;
							submitObj.change(function() {
								showDefaultSel(this,curRow);
							});
						}
						submitObj.attr("name","pageKeyList["+(row_count)+"]."+submitObj.attr("name"));//所有新增的td name命名规则为 adminDataList[row_count的值]+addTable中td的值
					}else{
						submitObj[seq].id=submitObj[seq].id+"_"+row_count;//所有新增的td id命名规则为 id的值加上“_“+row_count的值 
						submitObj[seq].name="pageKeyList["+(row_count)+"]."+submitObj[seq].name;//所有新增的td name命名规则为 adminDataList[row_count的值]+addTable中td的值
					};
					
				});
			};
		});
		editTable.append(row);
		$("#SHOWORDER_"+row_count).hide();
		$("#SHOWNUMER_"+row_count).val(10);
		row_count++;
	}
	var delId = "";
	function del(){//删除记录数
		if(checkSelected()){
			utilsFp.confirmIcon("1","","delConfirm","","<dict:lang value="会连同用户关联角色配置的关键数据一起删除" />","1",320,150);
		}else{
			utilsFp.confirmIcon("3","","","","<dict:lang value="请至少勾选一条记录" />","",320,150);
		}
	}
	function checkSelected(){
		var finded = false;
		editTable.find("tbody tr").each(function(seq) {//查找是否页面有选中记录
			if($(this).find("td").eq(1).find("input[type='checkbox']").prop("checked")){
				finded = true;
				return true;
			}
		});
		return finded;
	}
	function delConfirm(){
		if(delRow()){
	    document.forms.submitForm.action="${path}sys/AdKeyDataAction_deleteKeyData.ms";
		$("#deleteIds").val(delId);
		$("#showDefaults").val(showDefaults);
		document.forms.submitForm.submit();
		}
	}
	<%-- 删除数据 --%>
	function delRow(){
		var showCout=0;
		var delIds="";
		var removeAdd = false;
		var removeFlag=true;
		var showNumber=$("#showNumberTotal").val();
		editTable.find("tbody tr").each(function(seq) {
			if(!removeFlag){
				return
			}
			var ckBoxObj = $(this).find("td").eq(1).find("input[type='checkbox']");
			if(ckBoxObj.prop("checked")){
				showCout=0;
				if($("#IS_DEFAULT_SHOW_"+seq).val()=="1"){
					utilsFp.confirmIcon("3","","","","<dict:lang value="请更改当前记录为非默认显示记录" />","",320,150);
					removeFlag=false;
					return;
				}
				if(val.isBlank(ckBoxObj.val()) ){
					$(this).remove();
					removeAdd = true;
				}else{
					delIds+=ckBoxObj.val();
					delIds+=",";
					showDefaults+=$("#IS_DEFAULT_SHOW_"+seq).val();
					showDefaults+=",";
				};
			};
		});
		if(!removeFlag){
			return;
		}
		if(""==delIds){//删除之前数据库的值
			if(!removeAdd){
				utilsFp.confirmIcon("3","","","","<dict:lang value="请至少选择一条记录" />","",320,150);
			}else{//删除新增记录
				delAddRowMsg();
			}
			var tableTrJs = editTable.find("tbody tr");
			row_count = tableTrJs.length;
			return false;
		}
		delId = delIds;
		var tableTrJs = editTable.find("tbody tr");
		row_count = tableTrJs.length;
		return true;
	}
	function alertInfo(msg){
		utilsFp.confirmIcon(3,"","","", msg,0,"300","");
	}
	function delAddRowMsg(){//删除新增成功页面
		msgPop("<dict:lang value="删除成功" />","","<dict:lang value="提示信息" />",200,150,3000);
		
	}
	
	function reloadPg(msg,title,width,height,time){
    	msgPop(msg,reloadPgExe,title,width,height,time);
	}
	function reloadPgExe(){//页面提示信息
		util.showTopLoading();
		document.forms.search_form.submit();
	}
	function query(){
		util.showTopLoading();
		document.forms.search_form.submit();
	}
	
	function commit(){
			var colLs=new Array();
			var showCout=0;
			var showNumberTotal=$("#showNumberTotal").val();
			for(var i=0,j=row_count;i<j;i++){
					var checked=$('input[name="adminKeyId"]:checked').val();
					if(checked==undefined||checked==null){
						utilsFp.confirmIcon("3","","","","<dict:lang value="请至少选择一条记录" />","",320,150);
						return false;
					}
					if ($("#KEYNAME_"+i).val()==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="关键数据名称不能为空" />","",320,150);
						return;
					}
					
					if ($("#SHOWNUMBER_"+i).val()>50){
						utilsFp.confirmIcon("1","","","","<dict:lang value="显示行数不能大于50行" />","",320,150);
						return;
					}
					if($("#AD_SHOW_TYPE_"+i).val()==0){
						if ($("#COMM_SQL_"+i).val()==""&&$("#ORACLE_SQL_"+i).val()==""&&$("#SQLSERVER_SQL_"+i).val()==""&&$("#MYSQL_SQL_"+i).val()==""&&$("#PG_SQL_"+i).val()==""){
							utilsFp.confirmIcon("1","","","","<dict:lang value="数据源配置不能为空" />","",320,150);
							return;
						}
					}else{
						if($("#SHOW_TYPE_"+i).val()!=$("#AD_SHOW_TYPE_"+i).val()){
							utilsFp.confirmIcon("1","","","","<dict:lang value="数据源配置不能为空" />","",320,150);
							return;
						}
					}
					if ($("#SHOWNUMBER_"+i).val()==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="显示行数不能为空" />","",320,150);
						return;
					}
					
					if ($("#IS_DEFAULT_SHOW_"+i).val()==1&&$("#IS_WORK_"+i).val()==1){
						showCout+=1;
					}
					if ($("#IS_DEFAULT_SHOW_"+i).val()==1&&$("#SHOWORDER_"+i).val()==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="默认显示的记录,显示顺序不能为空" />","",320,150);
						return;
					};
			}
			getSubmitTable();
		    document.forms.submit_Form.action="${path}sys/AdKeyDataAction_editAdKeyDatalist.ms";
			document.forms.submit_Form.submit();
			isSubmit = true;
		
	}
	function getSubmitTable(){
		var submitTable = $("#submitTable");
		submitTable.empty();
    	editTable.find("tbody tr").each(function (seq){
    	if($(this).find("td").find("input[type='checkbox']").prop("checked")){
    		var rowClone = $(this).clone(true);
				submitTable.append(rowClone);
			}
    	});
   	}

	function setMenu(thisObj){
		var menuNameId=$(thisObj).attr("id");//查找菜单名称输入框ID
		var menuId=$(thisObj).siblings().attr("id");//菜单Id的输入框ID
		var menuIdValue=$(thisObj).siblings().attr("value");//菜单Id的值
		var iframeId=window.name;//获取当前iframId
		showPopWinFp("${path}sys/AdKeyDataAction_goToSetAdKeyMenu.ms?menuNameId="+menuNameId+"&menuId="+menuId+"&iframeId="+iframeId+"&menuIdValue="+menuIdValue, 350, 400,null,''+"<dict:lang value="菜单配置" />");
	}
	
	function setDatabase(thisObj){//跳转到设置数据库页面
		var type=$(thisObj).parent().parent().find("td").eq(4).find("select").val();
		var PARA_ARGS_ID="";
		var PARA_ARGS_VALUE="";
		var DATA_COMMENT_ID="";
		var DATA_COMMENT_VALUE="";
		var COMM_SQL_ID="";
		var SQLSERVER_SQL_ID="";
		var MYSQL_SQL_ID="";
		var PG_SQL_ID="";
		var ORACLE_SQL_ID="";
		var CHARTS_CONFIG_ID="";
		var CHARTS_CONFIG_VALUE="";
		var CHARTS_ID_ID="";
		var CHARTS_ID_VALUE="";
		var SHOW_TYPE_ID="";
		var SHOW_TYPE_VALUE="";
		$(thisObj).nextAll().each(function(seq,item){
			if(seq==0){
				PARA_ARGS_ID=item.id;
				PARA_ARGS_VALUE=item.value;
			}if(seq==1){
				DATA_COMMENT_ID=item.id;
				DATA_COMMENT_VALUE=item.value;
			}if(seq==2){
				COL_PRO_ID=item.id;
				COL_PRO_VALUE=item.value;
			}if(seq==3){
				COMM_SQL_ID=item.id;
			}if(seq==4){
				SQLSERVER_SQL_ID=item.id;
			}if(seq==5){
				ORACLE_SQL_ID=item.id;
			}if(seq==6){
				MYSQL_SQL_ID=item.id;
			}if(seq==7){
				CHARTS_CONFIG_ID=item.id;
				CHARTS_CONFIG_VALUE=item.value;
			}
			if(seq==8){
				CHARTS_ID_ID=item.id;
				CHARTS_ID_VALUE=item.value;
			}
			if(seq==9){
				SHOW_TYPE_ID=item.id;
				SHOW_TYPE_VALUE=item.value;
			}
			if(seq==10){
				PG_SQL_ID=item.id;
			}
			
		});
		var iframeId=window.name;//获取当前iframId
		var url="";
		var height=0;
		var width=0;
		if(type==0){//列表设置页面
			url="${path}sys/AdKeyDataAction_goToSetAdKeyDatabase.ms?paraMap.CHARTS_CONFIG_ID="+CHARTS_CONFIG_ID;
			width=750;
			height=600;
			url+="&paraMap.PARA_ARGS_ID="+PARA_ARGS_ID+"&paraMap.PARA_ARGS_VALUE="+PARA_ARGS_VALUE+
			"&paraMap.DATA_COMMENT_ID="+DATA_COMMENT_ID+
			"&paraMap.COL_PRO_ID="+COL_PRO_ID+"&paraMap.COL_PRO_VALUE="+COL_PRO_VALUE+"&iframeId="+iframeId+
			"&paraMap.BUTTON_ID="+$(thisObj).attr("id")+"&paraMap.COMM_SQL_ID="+COMM_SQL_ID+
			"&paraMap.ORACLE_SQL_ID="+ORACLE_SQL_ID+"&paraMap.SQLSERVER_SQL_ID="+SQLSERVER_SQL_ID+
			"&paraMap.MYSQL_SQL_ID="+MYSQL_SQL_ID+"&paraMap.showTypeId="+SHOW_TYPE_ID+"&paraMap.PG_SQL_ID="+PG_SQL_ID;
		}else{
			if(SHOW_TYPE_VALUE!=null&&SHOW_TYPE_VALUE!=type){
				url = "${path}charts/chartsAction_chartsAdd.ms?paraMap.CHARTS_TYPE="+type
				+"&paraMap.isCache=1&paraMap.iframeId="+iframeId+"&paraMap.chartsCacheId="+CHARTS_ID_ID+
				"&paraMap.buttonId="+thisObj.id+"&paraMap.showTypeId="+SHOW_TYPE_ID;;
			}else if (SHOW_TYPE_VALUE!=null&&SHOW_TYPE_VALUE==type){
				url = "${path}charts/"+getAction(type)+"_preCacheUpdate.ms?paraMap.CHARTS_TYPE="+type+
				"&paraMap.cacheId="+CHARTS_ID_VALUE+"&paraMap.isCache=1&paraMap.iframeId="+iframeId+
				"&paraMap.chartsCacheId="+CHARTS_ID_ID+"&paraMap.buttonId="+thisObj.id+"&paraMap.showTypeId="+SHOW_TYPE_ID;
			}else if (SHOW_TYPE_VALUE==null){
				url = "${path}charts/"+getAction(type)+"_preCacheUpdate.ms?paraMap.CHARTS_TYPE="+type+
				"&paraMap.cacheId="+CHARTS_ID_VALUE+"&paraMap.isCache=1&paraMap.iframeId="+iframeId+
				"&paraMap.chartsCacheId="+CHARTS_ID_ID+"&paraMap.buttonId="+thisObj.id+"&paraMap.showTypeId="+SHOW_TYPE_ID;
			}
			width=1200;
			height=600;
		}
		url = url.replace(/\</g, "%3C"); 
		url = url.replace(/\>/g, "%3E");
		showPopWinFp(url, width, height,null,''+"<dict:lang value="数据源配置" />","setKeyDataIframe");
	};
	function changeType(thisObj){
		var selectValue=thisObj.value;
		var button=$(thisObj).parent().parent().find("td").eq(5).find("button");
		var SHOW_TYPE_VALUE="";
		$(button).nextAll().each(function(seq,item){
			if(seq==9){
				SHOW_TYPE_VALUE=item.value;
				}
				
		});
		if(SHOW_TYPE_VALUE!=selectValue){
			button.text("未配置");
		}else{
			button.text("已配置");
		}
			
	}
	function getAction(type){
		if(type == "1"){
			return "pieAction";
		}else if(type == "2"){
			return "lineAction";
		}else if(type == "3"){
			return "barAction";
		}else if(type == "4"){
			return "gaugeAction";
		}else if(type == "5"){
			return "calAction";
		}
	}
	
	$(function(){
        initHeight();
        _newScroll("main");
  });
	
	function initHeight(){
		$('.main').height($(parent.window).height() - 65 - 100 -  35 - 36 + 14);
	}
	
</script>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>