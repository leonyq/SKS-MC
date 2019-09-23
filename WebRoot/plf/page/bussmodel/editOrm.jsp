<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="持久化模型" /><dict:lang value="修改" /></title>
		
		<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
		
		</jsp:include>
	
	</head>

<body >
	<div class="all">
		<table id="addDemoTable" style="display: none;" >
 			<tr id="addDemoTr" onclick="trClickColor(this);" style="height:39px;" test_type="1">
			<td><input type="checkbox" onclick="selectself(this);" style="width:18px;" id="ID" name="ID" value="" class="isSubmit" checked="checked" /></td>
			<td><span></span></td>
			<td><s:textfield id="COL_NO" name="COL_NO" cssClass="isSubmit mc-list-input-edit" onchange="setModify(this);" onkeyup="javascript:util.replaceLikeVal(this)" maxLength="30" /></td>
			<td><s:textfield id="COL_NAME" name="COL_NAME" cssClass="isSubmit colDetail mc-list-input-edit" onchange="setModify(this);" maxLength="120" /></td>
			<td>
					<dict:selectDict  layignore="1" id="COL_TYPE" dictCode="COL_TYPE" name="COL_TYPE" 
					cssClass="isSubmit mc-list-input-edit" />
				
			</td>
			<td><s:textfield id="LEN" name="LEN" cssClass="isSubmit mc-list-input-edit" onchange="setModify(this);" cssStyle="" 
				maxLength="4" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" /></td>
			<td>
				<dict:selectDict layignore="1" id="COL_SCENE_0" name="COL_SCENE" cssClass="isSubmit mc-list-input-edit" dictCode="COL_SCENE"
					dictValue="0" style="width:100%;" />
			</td>
			<td>
				<dict:selectDict layignore="1" id="IS_NULL" name="IS_NULL" cssClass="isSubmit mc-list-input-edit" onchange="setModify(this);"
					dictCode="YESNO" dictValue="1" />
			</td>
			<td><s:textfield id="DEF_VAL" name="DEF_VAL" cssClass="isSubmit mc-list-input-edit" onchange="setModify(this);" /></td>
			</tr>
		</table>
		
	<div  class="add_table_div">
	<form id="edit_form" name="editForm" action="${path}sys/BussModelAction_editOrm.ms" method="post" target="submitFrame">
		<s:hidden name="paraMap.MID" />
		<s:hidden name="paraMap.ORMID" />
		<s:hidden name="paraMap.ORM_TYPE" id="ORM_TYPE" value="%{dataMap.ORM_TYPE}"/>
		<input type="hidden" name="mcIframeName" value="${mcIframeName}">
		<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
		<input type="hidden" name="mcTokenKey" value="${mc_token_key}">
        <input type="hidden" name="_formToken" value="${mc_token_key}">

	<table class="add_table">
		<!--  
        <tr>
          <td colspan="6">
          	<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项"/></span>
          </td>
		</tr>
		-->
		
        <tr>
				<td  class="tr1 title"><dict:lang value="持久模型表名" /></td>
				<td class="widget"><s:property value="dataMap.TABLE_NAME"/></td>
				
				<td>&nbsp;</td>
				
				<td  class="tr1 title"><dict:lang value="记录数" /></td>
				<td class="widget"><s:property value="dataMap.TB_COUNT"/></td>
      </tr>
      <tr>
				<td class="tr1 title"><span class="Eng">*</span><dict:lang value="持久模型名称" /></td>
								
				<td  colspan="3" class="widget">
					<s:textfield name="paraMap.ORM_NAME" value="%{dataMap.ORM_NAME}" id="paraMap_ORM_NAME" onkeyup="javascript:util.replaceLikeVal(this)" maxlength="50"/>
				</td>
      </tr>
					<tr  id="title_ORM_ADD_TYPE_4" style="display: none;">
						<td width="20%" class="tr1">
							<div id="showSpan" style="margin-top:33px;"><span onclick="hideSql();" style="cursor:pointer" title="<dict:lang value="单击隐藏并删除SQL语句" />"><dict:lang value="关联子表单SQL语句" /></span></div>
						</td>					
<%--							<span id="val_ORM_ADD_TYPE_4">--%>
<%--								<textarea id="paraMap_ORM_SQL" name="paraMap.ORM_SQL" rows="6" cols="" style="width: 80%;margin-top:10px;margin-bottom:10px;"><s:property value="dataMap.ORM_SQL"/></textarea>--%>
<%--							</span>		--%>
							<td colspan="5">
						数据库适配:
							&nbsp;&nbsp;<label for="codeType_comm" class="cursor_hand"><input
								type="radio" id="codeType_comm" name="paraMap.codeType"
								value="comm" onclick="showSql(this)" style="width: 20px;" />通用语句</label>
							&nbsp;&nbsp;<label for="codeType_oracle" class="cursor_hand"><input
								type="radio" id="codeType_oracle" name="paraMap.codeType"
								value="oracle" onclick="showSql(this)" style="width: 20px;" />ORACLE</label>
							&nbsp;&nbsp;<label for="codeType_sqlserver" class="cursor_hand"><input
								type="radio" id="codeType_sqlserver" name="paraMap.codeType"
								value="sqlserver" onclick="showSql(this)" style="width: 20px;" />SQLSERVER</label>
							&nbsp;&nbsp;<label for="codeType_mysql" class="cursor_hand"><input
								type="radio" id="codeType_mysql" name="paraMap.codeType"
								value="mysql" onclick="showSql(this)" style="width: 20px;" />MYSQL</label>
							&nbsp;&nbsp;<label for="codeType_pg" class="cursor_hand"><input
								type="radio" id="codeType_pg" name="paraMap.codeType"
								value="pg" onclick="showSql(this)" style="width: 20px;" />PG</label>
							<%-- 如果新增了支持的数据库类型，则这里需要新增 --%></br></br>
							<textarea id="comm_sql" name="paraMap.comm_sql" rows="6"
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.comm_sql"/></textarea>
							
							<textarea id="oracle_sql" name="paraMap.oracle_sql" rows="6"
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;" ><s:property value="dataMap.oracle_sql"/></textarea>
							
							<textarea id="sqlserver_sql" name="paraMap.sqlserver_sql" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.sqlserver_sql"/></textarea>
							
							<textarea id="mysql_sql" name="paraMap.mysql_sql" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.mysql_sql"/></textarea>
							
							
							<textarea id="pg_sql" name="paraMap.pg_sql" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.pg_sql"/></textarea>
							
							<!--  //持久模型添加子表单增加数据过滤 -->
							<!--  
							<blockquote class="layui-elem-quote" style="margin-top: 10px;">
							<span id="where_sp">
							<span style="color:red;">例如：(系统将{}当做一个完整的预配置项)</span></br>
							left join sy_user t2 on ( t2.id=t1.user_id {and t2.user_name=$MC_CRM_USERNAME} )</br>  
							</span>
							</blockquote>
							-->
							
							<%--
							
							<span id="val_ORM_ADD_TYPE_4" style="display: none;">
								<textarea id="paraMap_ORM_SQL" name="paraMap.ORM_SQL" rows="6" cols="" style="width: 80%;margin-top:10px;margin-bottom:10px;"><s:property value="dataMap.ORM_SQL"/></textarea>
							</span>		
						--%></td>
					</tr>	
					
					<!--  //持久模型添加子表单增加数据过滤 -->
					<tr  class="title_ORM_ADD_TYPE_5" style="display: none;">
						<td width="20%" class="tr1">
							<div id="showSpan2"><span onclick="hideSql();" style="cursor:pointer" title="<dict:lang value="单击隐藏并删除SQL语句" />"><dict:lang value="关联子表单where语句" /></span></div>
						</td>					
							<td colspan="5">
						
							<textarea id="comm_sql_where" name="paraMap.comm_sql_where" rows="6"
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.comm_sql_where"/></textarea>
							
							<textarea id="oracle_sql_where" name="paraMap.oracle_sql_where" rows="6"
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;" ><s:property value="dataMap.oracle_sql_where"/></textarea>
							
							<textarea id="sqlserver_sql_where" name="paraMap.sqlserver_sql_where" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.sqlserver_sql_where"/></textarea>
							
							<textarea id="mysql_sql_where" name="paraMap.mysql_sql_where" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.mysql_sql_where"/></textarea>
							
							
							<textarea id="pg_sql_where" name="paraMap.pg_sql_where" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.pg_sql_where"/></textarea>
							
							
							</td>
					</tr>	   
					<tr  class="title_ORM_ADD_TYPE_5" style="display: none;">    
						<td width="20%" class="tr1">
						</td>					
							<td colspan="5">
							<blockquote class="layui-elem-quote" style="margin-top: 10px;">
							<span>
							<span style="color:red;">例如：(系统将{}当做一个完整的预配置项)</span></br>
							{and t2.user_type=$MC_CRM_USERTYPE}  {and t2.user_id=_@MC_USER_ID_}</br>
							</span>
							</blockquote>
							</td>
					</tr>  
     </table>
     <div style="height: 15px;"></div>
			<table id="editTable" class="table_list table-mc-form" <%if(request.getHeader("User-agent").indexOf("Firefox")>-1){%>style="table-layout:fixed;" <%} %> >
				<thead>
					<tr style="height:39px;">
						<th width="40px"><input type="checkbox" onclick="selectAll(this);" style="width:40px;" id="selectall"/></th>
						<th width="40px"><dict:lang value="序号" /></th>
						<th width="100px"><span class="Eng">*</span><dict:lang value="字段名称" /></th>
						<th width="105px"><span class="Eng">*</span><dict:lang value="字段说明" /></th>
						<th width="85px"><dict:lang value="字段类型" /></th>
						<th width="70px"><span class="Eng">*</span><dict:lang value="字段长度" /></th>
						<th width="60px"><dict:lang value="字段用途" /></th>
						<th width="45px"><dict:lang value="允许空" /></th>
						<th><dict:lang value="默认值" /></th>
					</tr>
				</thead>
				<tbody>
				<s:iterator value="listData" status="index">
					<s:if test="%{@com.more.fw.core.common.method.ConstantsMc@MS_ORM_MODEL_COL_TYPE_0 == TYPE}">
						<s:set name="isSys" value="11" />
						<s:set name="disabledStr" value="disabled='disabled'" />
					</s:if>
					<s:else>
						<s:set name="isSys" value="" />
						<s:set name="disabledStr" value="" />
					</s:else>
					<tr test_type="${TYPE}" <s:if test="%{@com.more.fw.core.common.method.ConstantsMc@MS_ORM_MODEL_COL_TYPE_0 == TYPE}">title="<dict:lang value="系统字段不允许修改" />" style="background-color:#ccc!important;"</s:if>  >
						<td><input type="checkbox" onclick="selectself(this);" style="width:18px;" name="paramList[<s:property value="#index.index"/>].ID" value="<s:property value="ID"/>"
							 <s:property value="#disabledStr"/> class="isSubmit" />
						</td>
						<td><span><s:property value="#index.count"/><span></td>
						<td><s:textfield id="COL_NO_%{#index.index}" name="paramList[%{#index.index}].COL_NO" value="%{COL_NO}" cssClass="isSubmit mc-list-input-edit" 
							onchange="setModify(this);" onkeyup="javascript:util.replaceLikeVal(this)"  maxLength="30" disabled="%{#isSys}" readonly="true" /></td>
						<td><s:textfield name="paramList[%{#index.index}].COL_NAME" value="%{COL_NAME}" cssClass="isSubmit colDetail mc-list-input-edit" 
							 disabled="%{#isSys}" maxLength="120" onchange="setModify(this);" onkeyup="javascript:util.replaceLikeVal(this)" /></td>
						<td>
						<s:if test="\"0\" == dataMap.ORM_TYPE">
						 		<dict:selectDict layignore="1" dictCode="COL_TYPE" dictValue="%{COL_TYPE}"  name="paramList[%{#index.index}].COL_TYPE" 
						 			disabled="disabled" cssClass="isSubmit mc-list-input-edit" onchange="setModify(this);colTypeSel(this,'%{#index.index}');"/>
						</s:if>
						<s:else>
							<dict:selectDict layignore="1" dictCode="COL_TYPE" dictValue="%{COL_TYPE}" name="paramList[%{#index.index}].COL_TYPE" 
						 			disabled="%{#isSys}" cssClass="isSubmit mc-list-input-edit" onchange="setModify(this);colTypeSel(this,'%{#index.index}');"/>
						</s:else>					 			
						 </td>
						<td>
						<s:if test="\"2\" == COL_TYPE">
							<s:textfield id="LEN_%{#index.index}" name="paramList[%{#index.index}].LEN" value="%{LEN}" cssClass="isSubmit mc-list-input-edit" 
							 onchange="this.value=this.value.replace(/[^0-9]/gi,'');setModify(this);" maxLength="4" disabled="%{#isSys}" />
						</s:if><s:else>
							<s:textfield id="LEN_%{#index.index}" name="paramList[%{#index.index}].LEN" value="%{LEN}" cssClass="isSubmit mc-list-input-edit" 
							 cssStyle="display:none;" onchange="this.value=this.value.replace(/[^0-9]/gi,'');setModify(this);" maxLength="4"
							  disabled="%{#isSys}"  />
						</s:else>
							</td>
						<td>
							<dict:selectDict layignore="1" name="paramList[%{#index.index}].COL_SCENE" id="COL_SCENE_0_%{#index.index}" cssClass="isSubmit mc-list-input-edit" dictCode="COL_SCENE"
								disabled="disabled" onchange="setModify(this);" dictValue="%{COL_SCENE}" style="width:100%;" />
						</td>
						<td>
						<dict:selectDict layignore="1" id="tableDataMap_0_IS_NULL" name="paramList[%{#index.index}].IS_NULL" cssClass="isSubmit mc-list-input-edit" onchange="setModify(this);"
								dictCode="YESNO" dictValue="%{IS_NULL}" disabled="%{#isSys}" />
						</td>
						<td><s:textfield name="paramList[%{#index.index}].DEF_VAL" value="%{DEF_VAL}" cssClass="isSubmit mc-list-input-edit" 
							 disabled="%{#isSys}" onchange="setModify(this);" onkeyup="replaceLikeVal(this)" /></td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
			
			   <div class="ptop_10 txac">
			   		<!--  
					<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="botton_img_add">
					-->
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					
					<input type="button" value="<dict:lang value="追加" />" id="add_but" onclick="addRow();" class="layui-btn">
					<input type="button" value="<dict:lang value="删除行" />" id="del_but" onclick="del();" class="layui-btn">
					<input type="button" value="<dict:lang value="添加子表单" />" id="addUnionSql" onclick="addUnionSql2();" class="layui-btn"/>
					<input id="get_but" type="button" value="<dict:lang value="获取字段" />" style="display:none;" onclick="getFields();" class="layui-btn">				
			
				</div>
	
     </form>
     </div>
   </div>

	<form id="submitForm" name="submitForm" action=""  method="post" target="submitFrame">
		<input type="hidden" id="del_id" name="paraMap.id" />
		<s:hidden name="paraMap.MID" />
		<s:hidden name="paraMap.ORMID" />
		
		<input type="hidden" id="id_for_delete" name="paraMap.DEL_IDS" />
		<table id="submitTable" style="display: none;" >
		</table>
	</form>
	<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	var pre_sql='';
	inputFocus(); //执行input focus/blur

	var db_dialect="<s:property value="@com.more.fw.core.common.method.CommMethodMc@getCUR_DB_DIALECT()"/>";
	var editTable = $('#editTable');
	var isSubmit = false;
	var form;
	function reloadPg(msg){
		isSubmit = false;
		util.alert(msg);
	  var oldUrl = document.forms.editForm.action;
	  document.forms.editForm.action="${path}sys/BussModelAction_forEditOrm.ms";
		document.forms.editForm.submit();
	  document.forms.editForm.action=oldUrl;
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function replaceLikeVal(comp){  
	
        if ( comp.value.indexOf("<") != -1|| comp.value.indexOf(">") != -1) 
        {  
            //comp.value = comp.value.substring(0, comp.value.length-1);  
            comp.value = comp.value.replace(/</g,"").replace(/>/g,"");  
            _alertValMsg($(comp),"<dict:lang value="不能输入<>" />");
        }  
    }  
	var regStr= /^[a-zA-Z][a-zA-Z0-9_]*$/;<%-- 数据库命名规则，必需以字母开头 --%>
	function edit(thisObj){
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");return ;}
		if(!valData()){
			return false;
		}
		var colLs=new Array();
		for(var i=0,j=row_count;i<j;i++){
			if(!$("#COL_NO_"+i).prop("disabled")){<%-- 只验证可编辑字段 --%>
				var field_val=$("#COL_NO_"+i).val();
				field_val=field_val.replace('#','');
				if (!regStr.test(field_val) && $("#COL_SCENE_0_"+i).val() == "0"){
					_alertValMsg($("#COL_NO_"+i)[0],"<dict:lang value="字段名称" /><dict:lang value="必须以字母开头" /><br><dict:lang value="命名规则请参见数据库相关文档" />");
					return false;
				}
			}
			
			if($("#COL_NO_"+i).val()) {
			    if(db_dialect=='oracle')
			    {
			   	 $("#COL_NO_"+i).val($("#COL_NO_"+i).val().toUpperCase());
			    }else if(db_dialect=='pg')
			    {
			      $("#COL_NO_"+i).val($("#COL_NO_"+i).val().toUpperCase());
			    }
				
				colLs.push($("#COL_NO_"+i).val());
			}
			
		}
		var resObj = util.isRepeat(colLs);
		if(resObj.res){
   		_alertValMsg($("#COL_NO_"+resObj.seq)[0],"<dict:lang value="字段名称重复" />"+resObj.val);
			return false;
		}
		getSubmitTable();
		$("select").prop("disabled",false);
	    document.forms.submitForm.action="${path}sys/BussModelAction_editOrm.ms";
		document.forms.submitForm.submit();
		//isSubmit = true;
		return false;
	}
	
	function selectAll(obj){
		editTable.find("tbody tr").each(function(seq) {
			if($("#ORM_TYPE").val() == "0"){
				//虚拟模型
				//$(this).find("td").eq(0).find("input[type='checkbox'][disabled='']").prop("checked",$(obj).prop("checked"));
				$(this).find("td").eq(0).find("input[type='checkbox']").prop("checked",$(obj).prop("checked"));
				
			}else{
				if(seq>6){
					//$(this).find("td").eq(0).find("input[type='checkbox'][disabled='']").prop("checked",$(obj).prop("checked"));
					$(this).find("td").eq(0).find("input[type='checkbox']").prop("checked",$(obj).prop("checked"));
			
				}
				
			}
			
			form.render();
		});
	}
	
	function selectself(obj){
		if(!$(obj).prop("checked")){
			 $("#selectall").prop("checked",false);
		}
		
	}
	
	<%-- 数据修改时选中所修改的行 --%>
	function setModify(thisObj){
		$(thisObj).parent().parent().find("td").eq(0).find("input[type='checkbox']").prop("checked",true);
	}
    
	<%-- 追加行数据 --%>
	var row_count=0;
	function addRow(){
		var editTableTr = $('#addDemoTr');
		var row = editTableTr.clone(true);
		row[0].id= "data_row_"+row_count;
		row.css("background-color",_tableListSelTdCssBGC);
		row.find("td").each(function(seq) {
			if(seq==1){
				$(this).find("span").text(row_count+1);
			}else {
				submitObj = $(this).find(".isSubmit");
				submitObj.attr("id",submitObj.attr("id")+"_"+row_count);
				if("COL_TYPE" == submitObj.attr("name")){
					var curRow=row_count;
					submitObj.change(function() {
						colTypeSel(this,curRow);
					});
				}else if("COL_SCENE" == submitObj.attr("name") && $("#ORM_TYPE").val() == "0"){
					submitObj.val(1);
					submitObj.prop("disabled","disabled");
				}
				submitObj.attr("name","paramList["+(row_count)+"]."+submitObj.attr("name"));
			}
		});
		if(row_count % 2 == 1){
			row.addClass("tr1");
		}
		editTable.append(row);
		row_count++;
		$(document).scrollTop($(document).height());
		
		form.render("select");
		
	}
	
	function colTypeSel(thisObj,row){
		if("2" == thisObj.value){
			$("#LEN_"+row).show();
		}else{
			$("#LEN_"+row).hide();
		}
	}
	
	var delId = "";
	function del(){
		if(checkSelected()){
			top.util.confirm(delConfirm,"<dict:lang value="确定要删除选中的数据" />");
		}else{
			//util.alert("<dict:lang value="请至少勾选一条记录" />");
			alterWindows("<dict:lang value="请至少勾选一条记录" />",5);
		}
	}
	
	function delConfirm(){
		var mid='<s:property value="paraMap.MID"/>';
		var ormid='<s:property value="paraMap.ORMID"/>';
		
		if(delRow()){
			var mcIframeName = window.frameElement.name; //外层iframe的name
	    	document.forms.submitForm.action="${path}sys/BussModelAction_delOrmColBat.ms?mcIframeName="+mcIframeName+"&paraMap.mid="+mid+"&paraMap.ormid="+ormid;
			$("#del_id").val(delId);
			document.forms.submitForm.submit();
		}
	}
	
	<%-- 删除数据 --%>
	function delRow(){
		var delIds="";
		var removeAdd = false;
		editTable.find("tbody tr").each(function(seq) {
			var ckBoxObj = $(this).find("td").eq(0).find("input[type='checkbox']");
			if(ckBoxObj.prop("checked")){
				if(val.isBlank(ckBoxObj.val()) ){
					$(this).remove();
					removeAdd = true;
				}else{
					delIds+=ckBoxObj.val();
					delIds+=",";
				}
			}
		});
		if(""==delIds){
			if(!removeAdd){
				util.alert("<dict:lang value="请至少勾选一条记录" />");
			}else{
				util.alert("<dict:lang value="删除成功" />");
			}
			return false;
		}
		delId = delIds;
		return true;
	}
	
	<%-- 检查是否有选中记录 --%>
	function checkSelected(){
		var finded = false;
		editTable.find("tbody tr").each(function(seq) {
			if($(this).find("td").eq(0).find("input[type='checkbox']").prop("checked")){
				finded = true;
				return true;
			}
		});
		return finded;
	}
        
	function valData(){
		var paraMapORMNAME = document.getElementById("paraMap_ORM_NAME");
   		if(val.isBlank(paraMapORMNAME)){
   		_alertValMsg(paraMapORMNAME,"<dict:lang value="持久模型名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	
  //虚拟表
	if($("#ORM_TYPE").val() == "0"){
		var codeType = $('input[name="paraMap.codeType"]:checked').val();
		var sql=null;
		if (codeType == "comm") {
			sqlContext = $("#comm_sql").val();
			sql=$("#comm_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		} else if (codeType == "oracle") {
			sqlContext = $("#oracle_sql").val();
			sql=$("#oracle_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		} else if (codeType == "mysql") {
			sqlContext = $("#mysql_sql").val();
			sql=$("#mysql_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		} else if (codeType == "sqlserver") {
			sqlContext = $("#sqlserver_sql").val();
			sql=$("#sqlserver_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		}else if (codeType == "pg") {
			sqlContext = $("#pg_sql").val();
			sql=$("#pg_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		}
	}

		var isPass=true;
		var isSelect=true;
    editTable.find("tbody tr").each(function (seq){
    var valueText="";
    	$(this).find("td").each(function (seq2){
    		var submitObj=$(this).find(".isSubmit");//要提交的表单对象
    		if (typeof submitObj != 'undefined') {
	    		switch(seq2){
	    			case 0:
	    			var valueTmp=submitObj.val();
	    			isSelect = submitObj.prop("checked");
	    			break;
	    			case 2:
	    			var valueTmp=submitObj.val();
	    			if(val.isBlank(valueTmp)){
	    				isPass=false;
	    				_alertValMsg(submitObj[0],"<dict:lang value="字段名称" /> -- <dict:lang value="不能为空" />");
	    			}
	    			break;
	    			case 3:
	    			var valueTmp=submitObj.val();
	    			if(val.isBlank(valueTmp)){
	    				isPass=false;
	    				_alertValMsg(submitObj[0],"<dict:lang value="字段说明" /> -- <dict:lang value="不能为空" />");
	    			}
	    			break;
	    			case 4:
	    			valueText=submitObj.val();<%-- 字段类型 --%>
	    			break;
	    			case 5:
	    			if(valueText=="<s:property value="%{@com.more.fw.core.bd.model.database.DataBaseFiled@VARCHAR2}" />"){<%-- 当为文本时需要校验输入的内容为大于0的整数 --%>
	    			
		    			if(val.isNull(submitObj[0]) || !val.isInt(submitObj[0]) || submitObj[0].value<1){
		    				isPass=false;
		    				_alertValMsg(submitObj[0],"<dict:lang value="字段长度" /> -- <dict:lang value="应为大于0的整数" />");
	    				}
	    			}
	    			break;
	    	}
    		if(!isSelect){return false;}<%-- 如果未选中，则这行不校验 --%>
    		if(!isPass){return false;}
	    	}
    	});
    });
    
		return isPass;
	}
	
	<%-- 提交效率，加入要提交的数据，只提交有选中的记录行 --%>
	function getSubmitTable(){
		var submitTable = $("#submitTable");
		submitTable.empty();
		submitTable.append($('#paraMap_ORM_NAME').clone(true));
		submitTable.append($('#comm_sql').clone(true));
		submitTable.append($('#oracle_sql').clone(true));
		submitTable.append($('#sqlserver_sql').clone(true));
		submitTable.append($('#mysql_sql').clone(true));
		submitTable.append($('#pg_sql').clone(true));
		submitTable.append($("input[name='mcTokenKey']") .clone(true));
		submitTable.append($("input[name='_formToken']") .clone(true));
		
		//持久模型添加子表单增加数据过滤
		submitTable.append($('#comm_sql_where').clone(true));
		submitTable.append($('#oracle_sql_where').clone(true));
		submitTable.append($('#sqlserver_sql_where').clone(true));
		submitTable.append($('#mysql_sql_where').clone(true));
		submitTable.append($('#pg_sql_where').clone(true));
		
		submitTable.append($('#ORM_TYPE').clone(true));
		
		//虚拟表
		if($("#ORM_TYPE").val() == "0"){
			editTable.find("tbody tr").each(function (seq){
	    	if($(this).find("td").find("input[type='checkbox']")){
	    		var rowClone = $(this).clone(true);
					submitTable.append(rowClone);
				}
	    	});
	    	
		}else{
			editTable.find("tbody tr").each(function (seq){
	    	if($(this).find("td").find("input[type='checkbox']").prop("checked")){
	    		var rowClone = $(this).clone(true);
					submitTable.append(rowClone);
				}
	    	});
	    	
		}
    	
    	//alert(submitTable.html());
	}

	function getScroll() { //计算滚动条的位置
        var t, l;
        if (document.documentElement && document.documentElement.scrollTop) {
            t = document.documentElement.scrollTop;
            l = document.documentElement.scrollLeft;
        } else if (document.body) {
            t = document.body.scrollTop;
            l = document.body.scrollLeft;
        }
        else {
            t = 0; l = 0;
        }
        return { top: t, left: l };
	}

	
	//获取语句字段
	function getFields(){
		var codeType = $('input[name="paraMap.codeType"]:checked').val();
		var sql=null;
		if (codeType == "comm") {
			sqlContext = $("#comm_sql").val();
			sql=$("#comm_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		} else if (codeType == "oracle") {
			sqlContext = $("#oracle_sql").val();
			sql=$("#oracle_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		} else if (codeType == "mysql") {
			sqlContext = $("#mysql_sql").val();
			sql=$("#mysql_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		} else if (codeType == "sqlserver") {
			sqlContext = $("#sqlserver_sql").val();
			sql=$("#sqlserver_sql")
			if (sqlContext == "") {
				_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
				return false;
			}
		}
		var url = "${path}sys/BussModelAction_getFields.ms";
		util.showLoading("处理中...");
		//清空表体时，先把旧的字段ID保存起来，以便回填 
		var oldJson = "{";
		
	    editTable.find("tbody tr").each(function (seq){
	    	oldJson += "\""+$($(this).find("td").get(2)).find("input[type='text']").get(0).value+"\":\""+$(this).find("td").find("input[type='checkbox']").get(0).value+"\",";
	    });		
	    
	    oldJson = oldJson.substring(0,oldJson.length-1);
	    
	    oldJson += "}";
	    if(oldJson!='}'){
	    	oldJson = JSON.parse(oldJson);	
	    }
	    
		var db_sql = document.getElementById(db_dialect+"_sql");
		var sql2 = db_sql.value;
		if(val.isBlank(db_sql)){
			db_sql = document.getElementById("comm_sql");
			sql2 = db_sql.value;
			if(val.isBlank(db_sql)){
			   	_alertValMsg(db_sql,"<dict:lang value="虚拟模型SQL语句" /> -- <dict:lang value="不能为空" />");
			   	return false;
			}
		}
		
		var all_fields='';
		var addTtable = $('#editTable');
	    addTtable.find("tbody tr").each(function (seq){
	      var fieldname='';
	      var valueText='';
	      
	      var field_comment='';
	      var filedSize='';
	      var filedIsnull='';
	      var filedDefault='';
	        
	      $(this).find("td").each(function (seq2){
	        var submitObj=$(this).find(".isSubmit");//要提交的表单对象
	        if(submitObj==null || typeof(submitObj) == "undefined"){
	        	return;
	        }
	        
	        switch(seq2){
	          case 2:
	          fieldname=submitObj.val();
	          break;
	          
	          case 3:
	          field_comment=submitObj.val();
		      break;
	          
	          case 4:
    		  valueText=submitObj.val();//字段类型
    		  break;
    		  
	          case 5:
	          filedSize=submitObj.val();
			  break;
			  
	          case 7:
	          filedIsnull=submitObj.val();
			  break;
			  
	          case 8:
	          filedDefault=submitObj.val();
			  break;
	
	        }

	      });
	      
	      if(!val.isBlank(fieldname)){
	    	  	fieldname=fieldname+"@"+field_comment+"@"+valueText+"@"+filedSize+"@"+filedIsnull+"@"+filedDefault;
	            if(all_fields==''){
	            	all_fields=fieldname;
	            }else{
	            	all_fields=all_fields+'||'+fieldname;
	            }
	            
	      }
	      
	    });
	    
	    //alert(pre_sql);
	    if(all_fields!=null && all_fields!='' && pre_sql!='' && sql2!=pre_sql){
	    	all_fields='';
	    	
	    }
	    
	    $("#editTable tbody").html("");
	    
		$.ajax({
			type: "POST",
		    dataType: "json",
		    url: url,
		    data: "paraMap."+db_dialect+"="+sql2+"&paraMap.all_fields="+all_fields+"&paraMap.getfields_type=orm",
			success: function(data){
					pre_sql=sql2;
					util.closeLoading();
					if(null == data){return ;}
					//if(null == data.ajaxMap){return ;}
					var rowNewCount = 0;
					if(null != data.ajaxList){
						row_count = rowNewCount;
						//var aList = eval(data.ajaxList);
						var aList = eval(data.ajaxList_new2);
						
						var editTable = $('#editTable');
						var addTableTr = $('#addDemoTr');
						
						for(var i = 0;i < aList.length; i++){

							var colType = "";
							
							if(aList[i].typeName == 'NUMBER'||aList[i].typeName == 'numeric'){
								colType = "1";
							}else if(aList[i].typeName == 'VARCHAR2' || aList[i].typeName == 'CHAR'||aList[i].typeName == 'varchar'){
								colType = "2";
							}else if(aList[i].typeName == 'DATE'){
								colType = "3";
							}else if(aList[i].typeName == 'DATETIME'||aList[i].typeName == 'timestamp'){
								colType = "4";
							}else if(aList[i].typeName == 'CLOB'|| aList[i].typeName == 'text'){
								colType = "5";
							}
							

							var row = addTableTr.clone(true);
							
							row[0].id= "data_row_"+row_count;				
							
							row.find("td").each(function(seq) {
								if(seq==1){
									$(this).find("span").text(row_count+1);
								}else{
									
									submitObj = $(this).find(".isSubmit");
									var inputName = submitObj.attr("name");
									
									/*
									if(seq == 0){
										var j = 0;
										$.each(oldJson,function(key,value){
											//console.log(key+":"+value);
											if(key == aList[i].filedName){
												submitObj.attr("value",value);
												delete oldJson[key];
											}
										});										
									}	
									*/
									
									submitObj.attr("id",submitObj.attr("id")+"_"+row_count);

									if("COL_NO" == inputName){
										submitObj.prop("readOnly","readOnly");
										submitObj.val(aList[i].filedName);
									}else if("COL_NAME" == inputName){
										//submitObj.val(aList[i].filedName);
										submitObj.val(aList[i].field_comment);
									}else if("COL_TYPE" == inputName){
										submitObj.val(colType);
										submitObj.prop("disabled","disabled");
									}else if("LEN" == inputName){
										submitObj.val(aList[i].filedSize);
										submitObj.prop("readOnly","readOnly");
									}else if("COL_SCENE" == inputName){
										submitObj.val(1);
										submitObj.prop("disabled","disabled");
									}else if("IS_NULL" == inputName){//允许空
										if(aList[i].filedIsnull!=null && aList[i].filedIsnull!=''){
											submitObj.val(aList[i].filedIsnull);	
										}
										
									}else if("DEF_VAL" == inputName){//?默认值
										if(aList[i].filedDefault!=null && aList[i].filedDefault!=''){
											submitObj.val(aList[i].filedDefault);	
										}
										
									}

									submitObj.attr("name","paramList["+(row_count)+"]."+inputName);
								}
							});
														
							if(row_count % 2 != 0){
								row.addClass("tr1");
							}
							editTable.append(row);
							row_count++;
							$(document).scrollTop($(document).height());	
							
							form.render("select");						
							
						}
						
						$.each(oldJson,function(key,value){
							$("#id_for_delete").val($("#id_for_delete").val()+value+";");
						});	
					}
				},
				error: function(msg){
						util.closeLoading();
						util.alert("error:"+msg);
				  }
			});		
	}
		
	//显示SQL框
	function addUnionSql2(){
		$("#title_ORM_ADD_TYPE_4").show();
		$(".title_ORM_ADD_TYPE_5").show();//持久模型添加子表单增加数据过滤
		$("#addUnionSql").hide();
	}
	
	//隐藏SQL框
	function hideSql(){
		$("#title_ORM_ADD_TYPE_4").hide();		
		$("#comm_sql").val("");
		$("#oracle_sql").val("");
		$("#sqlserver_sql").val("");
		$("#mysql_sql").val("");
		$("#addUnionSql").show();
		
		//持久模型添加子表单增加数据过滤
		$(".title_ORM_ADD_TYPE_5").hide();		
		$("#comm_sql_where").val("");
		$("#oracle_sql_where").val("");
		$("#sqlserver_sql_where").val("");
		$("#mysql_sql_where").val("");
		
	}
	
	function init(){
		var tableTrJs = editTable.find("tbody tr");
		row_count = tableTrJs.length;
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		
		//虚拟表
		if($("#ORM_TYPE").val() == "0"){
			$("#add_but").hide();
			//$("#del_but").hide();
			$("#get_but").show();
			$("#title_ORM_ADD_TYPE_4").show();
			//$("#title_ORM_ADD_TYPE_5").show();//持久模型添加子表单增加数据过滤
			
			$("#addUnionSql").hide();
			$("#showSpan").html("<span><span class=\"Eng\">*</span><dict:lang value="虚拟模型SQL语句" /></span>");
		}

		if($("#comm_sql").val().length > 0||$("#oracle_sql").val().length > 0||$("#sqlserver_sql").val().length > 0||$("#mysql_sql").val().length > 0 ||$("#pg_sql").val().length > 0){
			$("#title_ORM_ADD_TYPE_4").show();
			
			if($("#ORM_TYPE").val() != "0"){
				$(".title_ORM_ADD_TYPE_5").show();//持久模型添加子表单增加数据过滤
			}else{
				$("#where_sp").hide();
			}
			
			$("#addUnionSql").hide();
		}
		if($("#"+db_dialect+"_sql").val() != ""){
			$("#"+db_dialect+"_sql").show();
			$("#codeType_"+db_dialect).attr("checked",true);
		}else{
			$("#comm_sql").show();
			$("#codeType_comm").attr("checked",true);
		}
		
		//持久模型添加子表单增加数据过滤
		if($("#"+db_dialect+"_sql_where").val() != ""){
			$("#"+db_dialect+"_sql_where").show();
		}else{
			$("#comm_sql_where").show();
		}
		
		
	}
	function showSql(thisObj){
		hiddenSql();
		$("#"+thisObj.value+"_sql").show();
		
		//持久模型添加子表单增加数据过滤
		$("#"+thisObj.value+"_sql_where").show();
		
	}
	
	function hiddenSql(){
		$("#comm_sql").hide();
		$("#oracle_sql").hide();
		$("#sqlserver_sql").hide();
		$("#mysql_sql").hide();
		$("#pg_sql").hide();
		
		//持久模型添加子表单增加数据过滤
		$("#comm_sql_where").hide();
		$("#oracle_sql_where").hide();
		$("#sqlserver_sql_where").hide();
		$("#mysql_sql_where").hide();
		$("#pg_sql_where").hide();
		
	}
	
	//追加换行
	function trClickColor(obj) {
		//遍历选中的checkbox 进行上色
		$("table tbody").find("input[type=checkbox]:checked").each(function(i,e){
			$(e).parent().parent().css("background-color",_tableListSelTdCssBGC);
		})
	
		//遍历未选中的checkbox 进行上色
		$("table tbody").find("input[type=checkbox]:not(:checked)").each(function(i,e){
			var test_type=$(e).parent().parent().attr("test_type");
			if(test_type=='1'){
				$(e).parent().parent().css("background-color","#FFFFFF");
			}
			
		})

	}
	
	function tr_click(obj,type){
		if(type=='1'){
			//alert($(obj).attr("type"));
			//$(obj).children().children().attr("checked","checked");
		}
		
	}
	
	$(function(){
		$(".colDetail").on("blur", function(){
			var _this = $(this);
			var colName = _this.val();
			if(colName==""){
				return;
			}
			$(".colDetail").each(function(){
				if(_this.is($(this))){
					return true;
				}
				if(colName.trim()==$(this).val().trim()){
					_alertValMsg(_this,"<dict:lang value="字段名称重复" />");
					_this.focus();
					return false;
				}
			});
	    });
		
		if($("#ORM_TYPE").val() == "0"){
			var db_sql = document.getElementById(db_dialect+"_sql");
			pre_sql = db_sql.value;
			if(val.isBlank(db_sql)){
				db_sql = document.getElementById("comm_sql");
				pre_sql = db_sql.value;
				
			}
		}
		
	});

	init();
	
	$(function(){
	layui.use('form', function(){
    	  form = layui.form;
          
          form.on('select(showTitleVal)', function(data){
			//console.log(data.elem); //得到select原始DOM对象
			//console.log(data.value); //得到被选中的值
			//console.log(data.othis); //得到美化后的DOM对象
			
			showTitleVal(data.elem);
			
		  });
		  
		  form.on('select(colTypeSel)', function(data){
			//console.log(data.elem); //得到select原始DOM对象
			//console.log(data.value); //得到被选中的值
			//console.log(data.othis); //得到美化后的DOM对象
			
			//alert(data.value);
			colTypeSel(data.elem,data.value);//layui??
			
		 });
		 
		 form.on('submit(filterSubmit)', function (data) {
		 document.getElementById("curIframeName").value=window.frameElement.name;
		 //util.alert("<dict:lang value="数据正在提交，请稍候" />...");
		   //var index = layer.load();
	       var flag=edit(data.elem);
	       if(!flag){
	       		return false;
	       }else{
	       		//layer.close(index)//关闭遮罩层
	       		return true;
	       }
			       
		}) 

    });
	    
})

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
	<jsp:param name="needValidate" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>