<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="指标库设置列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
		<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
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
		
		._pic{
			display:inline-block;
			height:26px;
			width:26px;
			background-color:#dbdbdb;
			border-radius:50%;
			position: relative;
		}
		
		._pic .small_button{
			height: 10px;
		    width: 10px;
		    position: absolute;
		    background-image: url(${path}plf/page/fp/img/ico-set-pic.png?_mc_res_version=<%=PlfStaticRes.ICO_SET_PIC_PNG%>);
		    bottom: 0;
		    right: 0;
		    cursor:pointer;
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
	<form id="search_form" name="searchForm" action="${path}sys/AdminTargetDataAction_queryAdminList.ms" method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
	<table class="search_table">
		<tr>

			<td>
				<div class="group">
					<div class="name"><dict:lang value="指标名称" /></div>
					<div class="dec"><input class="input" id="targetNameSh" name="targetNameSh" class="input_sh" maxlength="30" value="<s:property value='targetNameSh'/>" onkeyup="javascript:replaceLikeVal(this)"/></div>			
      			</div>
		  	</td>
		  	<td>
		  		<div class="group">
					<div class="name"><dict:lang value="类别" /></div>
					<div class="dec"><dict:selectDict dictCode="TARGET_TYPE"   id="targetTypeSh" name="targetTypeSh" style="cursor: pointer; width:240px" cssClass="dept_select" 
			  	custom_option="<option value=''>%{getText('--请选择--')}</option>" dictValue="${targetTypeSh}" /></div>			
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
			<td style="width:30px;text-align:center;"><input type="checkbox" name="userDtoId" id="subcheck" value="<c:out value='${id}'/>"  style="margin:0"></td><!-- 复选框 -->
			
			<td style="width:250px;text-align:center;">
				<input id="TARGETNAME" name="targetName" value="<c:out value='${targetName}'/>" class="isSubmit" 
							onchange="setModify(this);"  maxLength="12" style="width: 100%;text-align:center;border:0px;background-color:transparent;" onkeyup="javascript:replaceLikeVal(this)" /><!-- 指标名称 -->
				<s:hidden name="id"></s:hidden>
			</td>
			<td style="padding:0;text-align:center;width:100px">
				<dict:selectDict id="TARGET_TYPE" name="type" dictCode="TARGET_TYPE" cssClass="isSubmit" dictValue="%{type}" style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this);" />
				<!-- 类型-->
			</td>
			<td class="_data" style="width:150px;text-align:center;">	
						
							<button type="button" id="button_id" onclick="setDatabase(this);setModify(this)" title="单击配置数据源" class="isSubmit" ><dict:lang value="未配置" /></button>
							<s:textfield id="DATA_TYPE" name="dataType" value="%{dataType}" cssStyle="display:none" cssClass="isSubmit"/>
							<s:textfield id="PARA_ARGS" name="paraArgs" value="%{paraArgs}" cssStyle="display:none" cssClass="isSubmit"/>
							<s:textarea  id="DATA_COMMENT" name="dataComment" value="%{dataComment}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textfield id="MS_CLASS_CODE_ID" name="classCode" value="%{classCode}" cssStyle="display:none" cssClass="isSubmit"/>
							<s:textfield id="CODE_TYPE" name="codeType" value="%{codeType}" cssStyle="display:none" cssClass="isSubmit"/>
							<s:textfield id="CLASS_NAME" name="className" value="%{className}" cssStyle="display:none" cssClass="isSubmit"/>
							<s:textarea id="COMM_SQL" name="commSql" value="%{commSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textarea id="SQLSERVER_SQL" name="sqlserverSql" value="%{sqlserverSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textarea id="ORACLE_SQL" name="oracleSql" value="%{oracleSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textarea id="MYSQL_SQL" name="mysqlSql" value="%{mysqlSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
							<s:textarea id="PG_SQL" name="pgSql" value="%{pgSql}" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
					
			</td>
			<td style="padding:0;width:100px;text-align:center;">
				<dict:selectDict id="CI_UNIT" name="unit" dictCode="CI_UNIT" dictValue="%{unit}" cssClass="isSubmit" style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this);" />
				<!-- 单位-->
			</td>
			<td style="padding:0;width:200px;text-align:center;">
							<s:textfield id="MENUNAME" name="menuName" value="%{menuName}" cssClass="isSubmit" 
							maxLength="30" cssStyle="width:67%;cursor:pointer;text-align:center;width:100%;height:100%;border:0;background-color:transparent;" title="双击配置菜单" readonly="true" ondblclick="setMenu(this);setModify(this)"/>
							<s:textfield id="MENUID" name="menuId" value="%{menuId}" cssStyle="display:none" cssClass="isSubmit"/>
					
			</td>
			<td style="height:28px;width:150px;text-align:center;">
				<div class="_pic">
					<img src="${path}plf/page/fp/img/ad5.png?_mc_res_version=<%=PlfStaticRes.AD5_PNG %>" title="双击配置图片"  width="18px" height="18px" style="cursor:pointer;margin-top:3px;" id="PIC_URL" name="picUrl" class="isSubmit" ondblclick="setPic(this);setModify1(this)">
					<input id="PIC_ID" name="picId" value="<c:out value='${picId}'/>" style="display:none" class="isSubmit"/>
					<div class="small_button"></div>
				</div>
				
			</td>
			<td style="padding:0;width:80px;text-align:center;">
				<!-- 是否默认显示-->
				<dict:selectDict id="IS_DEFAULT_SHOW" name="showDefault" dictCode="IS_DEFAULT_SHOW" cssClass="isSubmit" dictValue="%{showDefault}" onchange="setModify(this);showDefaultSel(this)"
				style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" disabled="true" />
			</td>
			<td style="width:80px;text-align:center;">
				<s:textfield id="SHOWORDER" name="showOrder" value="%{showOrder}" cssClass="isSubmit" cssStyle="width:100%;height:100%;border:0;background-color:transparent;text-align:center" onchange="setModify(this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
			</td>
			<td style="padding:0;text-align:center">
				<!-- 是否启用-->
				<dict:selectDict id="IS_WORK" name="status" dictCode="IS_WORK" cssClass="isSubmit" dictValue="%{status}" onchange="setModify(this);setShowDefault(this)"
				style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" />
			</td>
			</tr>
		</table>	
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@SHOW_DEFAULT_NUMBER}" id="showNumber"/>
	<table class="dlist-table table-line" style="width: 100%;table-layout: fixed;" >
		<thead>	
			<tr class="tableHead">
				<th style="width:30px;text-align:center;"></th>
				<th style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></th>
				<th style="width:250px;text-align:center;"><dict:lang value="指标名称" /></th>
				<th style="text-align:center;width:100px"><dict:lang value="类别" /></th>
				<th style="width:150px;text-align:center;"><dict:lang value="数据" /></th>
				<th style="width:100px;text-align:center;"><dict:lang value="单位" /></th>
				<th style="width:200px;text-align:center;"><dict:lang value="关联菜单名称" /></th>
				<th style="width:150px;text-align:center;"><dict:lang value="图片" /></th>
				<th style="width:80px;text-align:center;"><dict:lang value="默认显示" /></th>
				<th style="width:80px;text-align:center;"><dict:lang value="显示顺序" /></th>
				<th style="text-align:center;"><dict:lang value="是否启用" /></th>
			</tr>
		</thead>
	</table>	
	<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;">
    <table id="editTable" class="dlist-table  query-list" style="width: 100%;table-layout: fixed;">
	
	<tbody id="adminDataList">
	<s:iterator value="adminDataList" status="index" id="adto">
		<tr>
			<td style="width:30px;text-align:center;"><s:property value="#index.count"/></td><!-- 序号 -->
			<td style="width:30px;text-align:center;">
			<input type="checkbox" name="userDtoId" id="subchecks" value="<c:out value='${id}'/>"style="margin:0"/></td><!-- 复选框 -->
			<td style="width:250px;text-align:center;">
				<input id="TARGETNAME_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].targetName" value="<c:out value='${targetName}'/>" class="input" 
							maxLength="12" style="width: 100%;text-align:center;border:0px;background-color:transparent;" onchange="setModify(this)" onkeyup="javascript:replaceLikeVal(this)" /><!-- 指标名称 -->
				<s:hidden name="pageList[%{#index.index}].id" value="%{id}"></s:hidden>
			</td>
			<td style="padding:0;text-align:center;width:100px">
				<dict:selectDict id="TARGET_TYPE_%{#index.index}" name="pageList[%{#index.index}].type" dictCode="TARGET_TYPE" dictValue="%{type}" style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this)"/>
				<!-- 类型-->
			</td>
			<td class="_data" style="width:150px;text-align:center;">
							<s:if test="dataType!=null">	
								<button type="button" id="button_id_<c:out value='${index.index}'/>" onclick="setDatabase(this);setModify(this)" title="单击配置数据源"><dict:lang value="已配置" /></button>
							</s:if>	
							<s:else>
								<button type="button" id="button_id_<c:out value='${index.index}'/>" onclick="setDatabase(this);setModify(this)" title="单击配置数据源"><dict:lang value="未配置" /></button>
							</s:else>
							<input type="text" id="DATA_TYPE_<c:out value='${index.index}'/> name="pageList[<c:out value='${index.index}'/>].dataType" value="<c:out value='${dataType}'/>" style="display:none" />
							<input type="text" id="PARA_ARGS_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].paraArgs" value="<c:out value='${paraArgs}'/>" style="display:none"/>
							<textarea id="DATA_COMMENT_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].dataComment"  style="display:none;word-wrap: normal;" wrap="off" ><c:out value='${dataComment}'/></textarea>
							<input type="text" id="MS_CLASS_CODE_ID_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].classCode" value="<c:out value='${classCode}'/>" style="display:none"/>
							<input id="CODE_TYPE_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].codeType" value="<c:out value='${codeType}'/>" style="display:none"/>
							<input id="CLASS_NAME_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].className" value="<c:out value='${className}'/>" style="display:none"/>
							<textarea id="COMM_SQL_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].commSql"  style="display:none;word-wrap: normal;" wrap="off" ><c:out value='${commSql}'/></textarea>
							<textarea id="SQLSERVER_SQL_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].sqlserverSql"  style="display:none;word-wrap: normal;" wrap="off"><c:out value='${sqlserverSql}'/></textarea>
							<textarea id="ORACLE_SQL_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].oracleSql"  style="display:none;word-wrap: normal;" wrap="off"><c:out value='${oracleSql}'/></textarea>
							<textarea id="MYSQL_SQL_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].mysqlSql"  style="display:none;word-wrap: normal;" wrap="off"><c:out value='${mysqlSql}'/></textarea>
							<textarea id="PG_SQL_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].pgSql"  style="display:none;word-wrap: normal;" wrap="off"><c:out value='${pgSql}'/></textarea>
							<input type="hidden" id="MC_ID_MYSQL_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].MC_ID_MYSQL" value="<c:out value='${MC_ID_MYSQL}'/>" style="display:none"/>
							<input type="hidden" id="MC_ID_SQLSERVER_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].MC_ID_SQLSERVER" value="<c:out value='${MC_ID_SQLSERVER}'/>" style="display:none"/>
							<input type="hidden" id="MC_ID_ORACLE_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].MC_ID_ORACLE" value="<c:out value='${MC_ID_ORACLE}'/>" style="display:none"/>
							<input type="hidden" id="MC_ID_BASE_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].MC_ID_BASE" value="<c:out value='${MC_ID_BASE}'/>" style="display:none"/>	
							<input type="hidden" id="MC_ID_PG_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].MC_ID_PG" value="<c:out value='${MC_ID_PG}'/>" style="display:none"/>					<!--数据 -->
			</td>
			<td style="padding:0;width:100px;text-align:center;">
					<dict:selectDict id="CI_UNIT_%{#index.index}" name="pageList[%{#index.index}].unit" dictCode="CI_UNIT" dictValue="%{unit}" style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this)"/>
				<!-- 单位-->
			</td>
			<td  style="padding:0;width:200px;text-align:center;">
				
					<input id="MENUNAME_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].menuName" value="<c:out value='${menuName}'/>" 
							maxLength="30" style="width:100%;height:100%;border:0;background-color:transparent;cursor:pointer;text-align:center;" title="双击配置菜单" readonly="true" ondblclick="setMenu(this);setModify(this)" />
					<input id="MENUID_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].menuId" value="<c:out value='${menuId}'/>" cssStyle="display:none"/>
			</td>
			<td style="height:28px;width:150px;text-align:center;">
					<div class="_pic">
						<s:if test="${picUrl==null}">
							<img src="${path}plf/page/fp/img/ad5.png?_mc_res_version=<%=PlfStaticRes.AD5_PNG %>" title="双击配置图片" width="18px" height="18px" style="cursor:pointer;margin-top:3px;" id="PIC_URL_<c:out value='${index.index}'/>" ondblclick="setPic(this);setModify1(this)" >
						</s:if>
						<s:else>
							<img src="${path}plf/userPhoto/<c:out value='${picName}'/>?_mc_res_version=<%=PlfStaticRes.PICNAME %>"  title="双击配置图片" width="18px" height="18px"style="cursor:pointer;margin-top:3px;" id="PIC_URL_<c:out value='${index.index}'/>" ondblclick="setPic(this);setModify1(this)"  >
						</s:else>
						<input id="PIC_ID_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].picId" value="<c:out value='${picId}'/>" style="display:none"/>					
						<div class="small_button"></div>
					</div>
							
						
			</td>
			<td style="padding:0;width:80px;text-align:center;">
				<!-- 是否默认显示-->
				<s:if test="\"0\" == status ">
				<dict:selectDict id="IS_DEFAULT_SHOW_%{#index.index}" name="pageList[%{#index.index}].showDefault" dictCode="IS_DEFAULT_SHOW" dictValue="%{showDefault}" 
				style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;"  disabled="true" onchange="setModify(this);showDefaultSel(this)" />
				</s:if>
				<s:else>
				<dict:selectDict id="IS_DEFAULT_SHOW_%{#index.index}" name="pageList[%{#index.index}].showDefault" dictCode="IS_DEFAULT_SHOW" dictValue="%{showDefault}" 
				style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this);showDefaultSel(this)" />
				</s:else>
			</td>
			<td style="width:80px;text-align:center;">
				<s:if test="\"0\" == showDefault ">
					<input id="SHOWORDER_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].showOrder" value="" class="input" style="display:none;width:100%;height:100%;border:0;background-color:transparent;text-align:center" onchange="setModify(this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
				</s:if>
				<s:else>
					<input id="SHOWORDER_<c:out value='${index.index}'/>" name="pageList[<c:out value='${index.index}'/>].showOrder" value="<c:out value='${showOrder}'/>" class="input" style="width:100%;height:100%;border:0;background-color:transparent;text-align:center" onchange="setModify(this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"/>
				</s:else>
			</td>
			<td style="padding:0;text-align:center"><!-- 是否启动-->
					<dict:selectDict id="IS_WORK_%{#index.index}" name="pageList[%{#index.index}].status" dictCode="IS_WORK" dictValue="%{status}" 
					style="cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;" onchange="setModify(this);setShowDefault(this)" />
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
function replaceLikeVal(comp){  
   utilsFp.replaceLikeVal(comp)
} 
	var row_count=0;//总的记录数
	var editTable = $("#editTable");
	var isSubmit = false;//用来标记是否提交
	var removeAdd = false;//用来标记页面新增删除
	var delIds="";//删除ID
	var showDefaults="";
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
			$(thisObj).parent().parent().find("td").eq(9).find("input").show();
		}else{
			$(thisObj).parent().parent().find("td").eq(9).find("input").hide();
		}
	}
	function setShowDefault(thisObj){
		if("0" == thisObj.value){
			$(thisObj).parent().parent().find("td").eq(8).find("select").find("option[value='0']").prop("selected","selected");
			$(thisObj).parent().parent().find("td").eq(8).find("select").attr("disabled","disabled");
			$(thisObj).parent().parent().find("td").eq(9).find("input").hide();
		}else{
			$(thisObj).parent().parent().find("td").eq(8).find("select").find("option[value='1']").prop("selected","selected");
			$(thisObj).parent().parent().find("td").eq(8).find("select").removeAttr("disabled");
			$(thisObj).parent().parent().find("td").eq(9).find("input").show();
		}
	}
	//复选框功能
	function selectAll(){
		if ($("#SelectAll").prop("checked")){
			$(":checkbox").prop("checked",true);
			$("#adminDataList :checkbox").parents("tr").addClass("selected");
		}else{
			$(":checkbox").prop("checked",false);
			$("#adminDataList :checkbox").parents("tr").removeClass("selected");
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
						submitObj.attr("name","pageList["+(row_count)+"]."+submitObj.attr("name"));//所有新增的td name命名规则为 adminDataList[row_count的值]+addTable中td的值
					}else{
						submitObj[seq].id=submitObj[seq].id+"_"+row_count;//所有新增的td id命名规则为 id的值加上“_“+row_count的值 
						submitObj[seq].name="pageList["+(row_count)+"]."+submitObj[seq].name;//所有新增的td name命名规则为 adminDataList[row_count的值]+addTable中td的值
					};
					
				});
			};
		});
		editTable.append(row);
		$("#SHOWORDER_"+row_count).hide();
		row_count++;
	}
	var delId = "";
	function del(){//删除记录数
		if(checkSelected()){
			utilsFp.confirmIcon("1","","delConfirm","","<dict:lang value="会连同用户关联角色配置的指标数据一起删除" />","1",320,150);
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
	    document.forms.submitForm.action="${path}sys/AdminTargetDataAction_deleteData.ms";
		$("#deleteIds").val(delId);
		$("#showDefaults").val(showDefaults);
		document.forms.submitForm.submit();
		}
	}
	function alertInfo(msg){
		utilsFp.confirmIcon(3,"","","", msg,0,"300","");
	}
	<%-- 删除数据 --%>
	function delRow(){
		var showCout=0;
		var delIds="";
		var removeAdd = false;
		var removeFlag=true;
		var showNumber=$("#showNumber").val();
		editTable.find("tbody tr").each(function(seq) {
			if(!removeFlag){
				return
			}
			showCout=0;
			var ckBoxObj = $(this).find("td").eq(1).find("input[type='checkbox']");
			if(ckBoxObj.prop("checked")){
				if($("#IS_DEFAULT_SHOW_"+seq).val()=="1"){
					utilsFp.confirmIcon("3","","","","<dict:lang value="只能删除非默认显示记录" />","",320,150);
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
			var showNumber=$("#showNumber").val();
			for(var i=0,j=row_count;i<j;i++){
					var checked=$('input[name="userDtoId"]:checked').val();
					if(checked==undefined||checked==null){
						utilsFp.confirmIcon("3","","","","<dict:lang value="请至少选择一条记录" />","",320,150);
						return false;
					}
					if ($("#TARGETNAME_"+i).val()==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="指标名称不能为空" />","",320,150);
						return;
					}
					if ($("#PIC_ID_"+i).val()==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="图片不能为空" />","",320,150);
						return;
					}
					if ($("#DATA_TYPE_"+i).val()==""){
						utilsFp.confirmIcon("1","","","","<dict:lang value="数据源配置不能为空" />","",320,150);
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
		    document.forms.submit_Form.action="${path}sys/AdminTargetDataAction_editAdminTargetDatalist.ms";
			document.forms.submit_Form.submit();
			isSubmit = true;
		
	}
	function initHeight(){
		$('.main').height($(parent.window).height() - 65 - 100 -  35 - 36 + 14);
	}
	$(function(){
        initHeight();
        _newScroll("main");
  	});
	
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
		showPopWinFp("${path}sys/AdminTargetDataAction_goToSetMenu.ms?menuNameId="+menuNameId+"&menuId="+menuId+"&iframeId="+iframeId+"&menuIdValue="+menuIdValue, 350, 400,null,''+"<dict:lang value="菜单配置" />");
	}
	function setPic(thisObj){
		var picUrlId=$(thisObj).attr("id");//图片Url的img标签的ID
		var picIdId=$(thisObj).siblings().attr("id");//图片Id的输入框ID
		var picIdValue=$(thisObj).siblings().attr("value");//图片Id的值
		var iframeId=window.name;//获取当前iframId
		showPopWinFp("${path}sys/AdminTargetDataAction_goToSetPic.ms?picIdId="+picIdId+"&picIdValue="+picIdValue+"&iframeId="+iframeId+"&picUrlId="+picUrlId, 482, 500,null,''+"<dict:lang value="图片配置" />","setPicIframe");
	}
	
	function setDatabase(thisObj){//跳转到设置数据库页面
		var DATA_TYPE_ID="";
		var DATA_TYPE_VALUE="";
		var PARA_ARGS_ID="";
		var PARA_ARGS_VALUE="";
		var DATA_COMMENT_ID="";
		var DATA_COMMENT_VALUE="";
		var MS_CLASS_CODE_ID_ID="";
		var MS_CLASS_CODE_ID_VALUE="";
		var CODE_TYPE_ID="";
		var CODE_TYPE_VALUE="";
		var CLASS_NAME_ID="";
		var CLASS_NAME_VALUE="";
		var COMM_SQL_ID="";
		var SQLSERVER_SQL_ID="";
		var MYSQL_SQL_ID="";
		var ORACLE_SQL_ID="";
		var PG_SQL_ID="";
		$(thisObj).nextAll().each(function(seq,item){
			if(seq==0){
				DATA_TYPE_VALUE=item.value;
				DATA_TYPE_ID=item.id;
			}if(seq==1){
				PARA_ARGS_ID=item.id;
				PARA_ARGS_VALUE=item.value;
			}if(seq==2){
				DATA_COMMENT_ID=item.id;
				DATA_COMMENT_VALUE=item.value;
			}if(seq==3){
				MS_CLASS_CODE_ID_ID=item.id;
				MS_CLASS_CODE_ID_VALUE=item.value;
			}if(seq==4){
				CODE_TYPE_ID=item.id;
				CODE_TYPE_VALUE=item.value;
			}if(seq==5){
				CLASS_NAME_ID=item.id;
				CLASS_NAME_VALUE=item.value;
			}if(seq==6){
				COMM_SQL_ID=item.id;
			}if(seq==8){
				ORACLE_SQL_ID=item.id;
			}if(seq==7){
				SQLSERVER_SQL_ID=item.id;
			}if(seq==9){
				MYSQL_SQL_ID=item.id;
			}if(seq==10){
				PG_SQL_ID=item.id;
			}
			
		});
		var iframeId=window.name;//获取当前iframId
		var url="${path}sys/AdminTargetDataAction_goToSetDatabase.ms?paraMap.DATA_TYPE_ID="+DATA_TYPE_ID+"&paraMap.DATA_TYPE_VALUE="+DATA_TYPE_VALUE+
		"&paraMap.PARA_ARGS_ID="+PARA_ARGS_ID+"&paraMap.PARA_ARGS_VALUE="+PARA_ARGS_VALUE+
		"&paraMap.DATA_COMMENT_ID="+DATA_COMMENT_ID+
		"&paraMap.MS_CLASS_CODE_ID_ID="+MS_CLASS_CODE_ID_ID+"&paraMap.MS_CLASS_CODE_ID_VALUE="+MS_CLASS_CODE_ID_VALUE+
		"&paraMap.CODE_TYPE_ID="+CODE_TYPE_ID+"&paraMap.CODE_TYPE_VALUE="+CODE_TYPE_VALUE+"&iframeId="+iframeId+
		"&paraMap.CLASS_NAME_ID="+CLASS_NAME_ID+"&paraMap.CLASS_NAME_VALUE="+CLASS_NAME_VALUE+"&paraMap.BUTTON_ID="+$(thisObj).attr("id")+
		"&paraMap.COMM_SQL_ID="+COMM_SQL_ID+"&paraMap.ORACLE_SQL_ID="+ORACLE_SQL_ID+"&paraMap.SQLSERVER_SQL_ID="+SQLSERVER_SQL_ID+"&paraMap.MYSQL_SQL_ID="+MYSQL_SQL_ID+"&paraMap.PG_SQL_ID="+PG_SQL_ID;
		url = url.replace(/\</g, "%3C"); 
		url = url.replace(/\>/g, "%3E");
		showPopWinFp(url, 750, 500,null,''+"<dict:lang value="数据源配置" />","setDataBaseIframe");
	};
	
</script>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>