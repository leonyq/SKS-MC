<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="持久化模型" /><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
		
	</jsp:include>
	

</head>
<body>
		<div style="margin-bottom: 80px">
			<table id="addDemoTable" style="display: none;">
				<tr id="addDemoTr" onclick="trClickColor(this);">
					<td style="text-align: center;">
						<span></span>
					</td>
					<td>
						<s:textfield id="COL_NO" name="COL_NO" cssClass="isSubmit mc-list-input-edit" maxLength="30" onkeyup="javascript:util.replaceLikeVal(this)" />
					</td>
					<td>
						<s:textfield id="COL_NAME" name="COL_NAME" cssClass="isSubmit colDetail mc-list-input-edit" maxLength="120" onkeyup="javascript:util.replaceLikeVal(this)" />
					</td>
					<td>
						<dict:selectDict layignore="1" id="COL_TYPE" dictCode="COL_TYPE" name="COL_TYPE" cssClass="mc-list-input-edit isSubmit" />

					</td>
					<td>
						<s:textfield id="LEN" name="LEN"  cssClass="isSubmit mc-list-input-edit" 
							maxLength="4" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" />
					</td>
					<td>
						<dict:selectDict layignore="1" id="COL_SCENE_0" name="COL_SCENE" cssClass="isSubmit mc-list-input-edit" dictCode="COL_SCENE"
							dictValue="0" style="width:100%;" />
					</td>
					<td>
						<dict:selectDict layignore="1" id="IS_NULL" name="IS_NULL" cssClass="isSubmit mc-list-input-edit" dictCode="YESNO" dictValue="1"
							style="width:95%" />
					</td>
					<td>
						<s:textfield id="DEF_VAL" name="DEF_VAL" cssClass="isSubmit mc-list-input-edit" onkeyup="replaceLikeVal(this)" />
					</td>
				</tr>
			</table>
			
			<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_saveOrm.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.MID" />
				<input type="hidden" name="paraMap.ORM_TYPE" id="paraMap_ORM_TYPE" maxlength="15" value="1"/>
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<input type="hidden" name="enter_type" id="enter_type" value="">
				
				<!-- 持久模型中增加建索引功能 -->
				<input type="hidden" name="index_value" id="index_value" value="${index_value}">
				
				<table class="add_table">
				
					<!--  
					<tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" />
							</span>
						</td>
					</tr>
					-->
					
					<tr>
						<td class="tr1 title">
							<dict:lang value="新增方式" />
						</td>
						<td class="widget">
							<!--  
							<dict:selectDict dictCode="ORM_ADD_TYPE" name="paraMap.ORM_ADD_TYPE" onchange="showTitleVal(this);" />
							-->
							
							<dict:selectDict bindEvent="showTitleVal" dictCode="ORM_ADD_TYPE" name="paraMap.ORM_ADD_TYPE"  />
							
						</td>
						
						<td>&nbsp;</td>
						
						<td class="tr1 title">
							<span id="title_ORM_ADD_TYPE_1"><dict:lang value="手工录入" /></span>
							<span id="title_ORM_ADD_TYPE_2" style="display: none;"><dict:lang value="数据库表名" /></span>
							<span id="title_ORM_ADD_TYPE_3" style="display: none;"><dict:lang value="从现有持久模型中复制" /></span>
						</td>
						<td class="widget">
							<span id="val_ORM_ADD_TYPE_1">
							</span>
							<span id="val_ORM_ADD_TYPE_2" style="display: none;"><input type="text" id="" onkeypress="searchTable(this);" title="<dict:lang value='输入表名，回车取数据(注意:原表中不能有ID字段)' />" />
							</span>
							<span id="val_ORM_ADD_TYPE_3" >
							<select id="ormModel" autocomplete="off" class="chosen-select" lay-filter="getOrmCol" lay-search>
					    		<option value='' ><dict:lang value="--请选择--" /></option>
							</select>
							</span>							
						</td>
					</tr>
					<tr>
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="持久模型名称" />
						</td>
						<td class="widget">
							<input type="text" name="paraMap.ORM_NAME" required="" lay-verify="required" maxlength="50" id="paraMap_ORM_NAME"   autocomplete="off" class="layui-input" onkeyup="javascript:util.replaceLikeVal(this)" >
						</td>
						
						<td>&nbsp;</td>
						
						<td  class="tr1 title">
							<span class="Eng">*</span><dict:lang value="持久模型表名" />
						</td>
						<td class="widget">
							<input type="text" name="paraMap.TABLE_NAME" required="" lay-verify="required|verdateTableName" maxlength="30" id="paraMap_TABLE_NAME"   autocomplete="off" class="layui-input" title="表名称不能以SY_和MS_开头" >
							
							<span id="paraMap_TABLE_NAME_err"><c:out value='${errors["paraMap.TABLE_NAME"][0]}' /></span>
						</td>
					</tr>
					
					<tr id="tspaceMap">
						<td  class="tr1 title">
							<dict:lang value="表空间" />
						</td>
						<td class="widget">
						<s:select list="tspaceMap" name="paraMap.spaceName" id="paraMap_spaceName_id" headerKey="" headerValue="--请选择--"></s:select>
						</td>
						
					</tr>
					<tr  id="title_ORM_ADD_TYPE_4" style="display: none;">
						<td class="tr1 title">
							<span><span class="Eng">*</span><dict:lang value="虚拟模型SQL语句" /></span>
						</td>					
						<td colspan="5">
						数据库适配:
							&nbsp;&nbsp;<label for="codeType_comm" class="cursor_hand"><input
								type="radio" id="codeType_comm" name="paraMap.codeType"
								value="comm" onclick="showSql(this)" style="width: 20px;" checked="checked" title="通用语句"/></label>
							&nbsp;&nbsp;<label for="codeType_oracle" class="cursor_hand"><input
								type="radio" id="codeType_oracle" name="paraMap.codeType"
								value="oracle" onclick="showSql(this)" style="width: 20px;" title="ORACLE"/></label>
							&nbsp;&nbsp;<label for="codeType_sqlserver" class="cursor_hand"><input
								type="radio" id="codeType_sqlserver" name="paraMap.codeType"
								value="sqlserver" onclick="showSql(this)" style="width: 20px;" title="SQLSERVER"/></label>
							&nbsp;&nbsp;<label for="codeType_mysql" class="cursor_hand"><input
								type="radio" id="codeType_mysql" name="paraMap.codeType"
								value="mysql" onclick="showSql(this)" style="width: 20px;" title="MYSQL"/></label>
							&nbsp;&nbsp;<label for="codeType_pg" class="cursor_hand"><input
								type="radio" id="codeType_pg" name="paraMap.codeType"
								value="pg" onclick="showSql(this)" style="width: 20px;" title="PG"/></label>
							<%-- 如果新增了支持的数据库类型，则这里需要新增 --%></br>
							<textarea id="comm_sql" name="paraMap.comm_sql" rows="6"
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.comm_sql"/></textarea>
							
							<textarea id="oracle_sql" name="paraMap.oracle_sql" rows="6"
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.oracle_sql"/></textarea>
							
							<textarea id="sqlserver_sql" name="paraMap.sqlserver_sql" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.sqlserver_sql"/></textarea>
							
							<textarea id="mysql_sql" name="paraMap.mysql_sql" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.mysql_sql"/></textarea>
							
							<textarea id="pg_sql" name="paraMap.pg_sql" rows="6" 
							style="width: 100%;overflow:scroll;word-wrap:normal;display: none;"><s:property value="dataMap.pg_sql"/></textarea>
							<%--
							
							<span id="val_ORM_ADD_TYPE_4" style="display: none;">
								<textarea id="paraMap_ORM_SQL" name="paraMap.ORM_SQL" rows="6" cols="" style="width: 80%;margin-top:10px;margin-bottom:10px;"><s:property value="dataMap.ORM_SQL"/></textarea>
							</span>		
						--%></td>
					</tr>	
									
				</table>
				<div style="height: 15px;"></div>
				<table id="addTable" class="table_list table-mc-form" <%if(request.getHeader("User-agent").indexOf("Firefox")>-1){%> style="table-layout: fixed;" <%} %>>
					<thead>
						<tr>
							<th width="40px">
								<dict:lang value="序号" />
							</th>
							<th width="100px">
								<span class="Eng">*</span><dict:lang value="字段名称" />
							</th>
							<th width="110px">
								<span class="Eng">*</span><dict:lang value="字段说明" />
							</th>
							<th width="85px">
								<dict:lang value="字段类型" />
							</th>
							<th >
								<span class="Eng">*</span><dict:lang value="字段长度" />
							</th>
							<th >
								<dict:lang value="字段用途" />
							</th>
							<th >
								<dict:lang value="允许空" />
							</th>
							<th >
								<dict:lang value="默认值" />
							</th>
						</tr>
					</thead>
					<tbody>
						<tr id="addDataTr" onclick="trClickColor(this);">
							<td style="text-align: center;">
								<span>1</span>
							</td>
							<td>
								<s:textfield id="COL_NO_0" name="paramList[0].COL_NO" cssClass="isSubmit mc-list-input-edit" maxLength="30" onkeyup="javascript:util.replaceLikeVal(this)"/>
							</td>
							<td>
								<s:textfield id="COL_NAME_0" name="paramList[0].COL_NAME" cssClass="isSubmit colDetail mc-list-input-edit" maxLength="120" onkeyup="javascript:util.replaceLikeVal(this)"/>
							</td>
							<td>
								<dict:selectDict id="COL_TYPE_0" layignore="1" dictCode="COL_TYPE" name="paramList[0].COL_TYPE" cssClass="isSubmit mc-list-input-edit" onchange="colTypeSel(this,0);"  />

											
								<!-- 
								<dict:selectDict id="COL_TYPE_0" dictCode="COL_TYPE" name="paramList[0].COL_TYPE" 
									cssClass="isSubmit" bindEvent="colTypeSel()" />
								-->	
								
							</td>
							<td>
								<s:textfield id="LEN_0" name="paramList[0].LEN" cssStyle="" cssClass="isSubmit mc-list-input-edit" 
									maxLength="4" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" />
							</td>
							<td>

								<dict:selectDict layignore="1" id="COL_SCENE_0" name="paramList[0].COL_SCENE" cssClass="isSubmit mc-list-input-edit" dictCode="COL_SCENE"
									dictValue="0" />

							</td>
							<td>

								<dict:selectDict layignore="1" id="IS_NULL_0" name="paramList[0].IS_NULL" cssClass="isSubmit mc-list-input-edit" dictCode="YESNO"
									dictValue="1" />

							</td>
							<td>
								<s:textfield id="DEF_VAL_0" name="paramList[0].DEF_VAL" cssClass="isSubmit mc-list-input-edit" onkeyup="replaceLikeVal(this)"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="ptop_10 txac">
					<!--  
					<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
					<%-- 防止误操作
					&nbsp;&nbsp;
					<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
					 --%>
					
					&nbsp;&nbsp;
					<input id="add_but" type="button" value="<dict:lang value="追加" />" onclick="addRow();" class="botton_img_add">
					&nbsp;&nbsp;
					<input id="del_but" type="button" value="<dict:lang value="删除行" />" onclick="delRow();" class="botton_img_search">
					&nbsp;&nbsp;
					<input id="get_but" type="button" value="<dict:lang value="获取字段" />" style="display:none;" onclick="getFields();" class="botton_img_search">
					-->
				
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					
					<input id="add_but" type="button" value="<dict:lang value="追加" />" onclick="addRow();" class="layui-btn">
				
					<input id="del_but" type="button" value="<dict:lang value="删除行" />" onclick="delRow();" class="layui-btn" >
					
					<input id="get_but" type="button" value="<dict:lang value="获取字段" />" style="display:none;" onclick="getFields();" class="layui-btn">
					
					<input id="index_but" type="button" value="<dict:lang value="索引" />" onclick="addIndex();" class="layui-btn">
				
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
	inputFocus(); //执行input focus/blur
	<%-- 当前数据库类型 --%>
	var db_dialect="<s:property value="@com.more.fw.core.common.method.CommMethodMc@getCUR_DB_DIALECT()"/>";
	var isSubmit = false;
	 var form;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	var regStr= /^[a-zA-Z][a-zA-Z0-9_]*$/;<%-- 数据库命名规则，必须以字母开头 --%>
	function add(thisObj){
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if("2"!=cur_ORM_ADD_TYPE){
			if(!valData()){
				return false;
			}
		}else{
			var paraMapORMNAME = document.getElementById("paraMap_ORM_NAME");
		   	if(val.isBlank(paraMapORMNAME)){
		   		//_alertValMsg(paraMapORMNAME,"<dict:lang value="持久模型名称" /> -- <dict:lang value="不能为空" />");
		   		alterWindows("<dict:lang value="持久模型名称" /> -- <dict:lang value="不能为空" />",5);
		   		return false;
		   	}
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
	}
	//<%-- 追加行数据 --%>
	var row_count=1;
	function addRow(map){
	
		var addTtable = $('#addTable');
		var addTableTr = $('#addDemoTr');
		var row = addTableTr.clone(true);
		row[0].id= "data_row_"+row_count;
		row.find("td").each(function(seq) {
			if(seq==0){
				$(this).find("span").text(row_count+1);
			}else{
				submitObj = $(this).find(".isSubmit");
				var inputName = submitObj.attr("name");
				submitObj.attr("id",submitObj.attr("id")+"_"+row_count);
				if(null != map){
				
					submitObj.val(map[inputName]);
				}
				if("LEN" == inputName){
					if(submitObj.val()=='0')
					{
						submitObj.val('');
					}
				}
				if("COL_TYPE" == inputName){
					var curRow=row_count;
					submitObj.change(function() {//加入onchange事件
					colTypeSel(this,curRow);//layui??
					});
				}else if("COL_SCENE" == inputName && cur_ORM_ADD_TYPE == 4){
					submitObj.val(1);
					submitObj.prop("disabled","disabled");
				}
				submitObj.attr("name","paramList["+(row_count)+"]."+inputName);
			}
		});
		if(row_count % 2 != 0){
			row.addClass("tr1");
		}
		addTtable.append(row);
		row_count++;
		$(document).scrollTop($(document).height());
		
		form.render("select");
		
	}
	
	//<%-- 从表中导入数据 --%>
	function addRowTable(map){
		var addTtable = $('#addTable');
		var addTableTr = $('#addDemoTr');
		var tds = '<td>'+(row_count+1)+'</td>';
		if(db_dialect=='pg')
		{
		tds += '<td>'+'<input type="hidden" class="isSubmit" name="paramList['+row_count+'].COL_NO" value="'+map.COL_NO.toUpperCase()+'" />'+map.COL_NO.toUpperCase()+'</td>';
		}else
		{
		tds += '<td>'+'<input type="hidden" class="isSubmit" name="paramList['+row_count+'].COL_NO" value="'+map.COL_NO+'" />'+map.COL_NO+'</td>';
		}
		
		tds += '<td>'+'<input type="hidden" name="paramList['+row_count+'].COL_NAME" value="'+util.toString(map.COL_NAME)+'" />'+util.toString(map.COL_NAME)+'</td>';
		tds += '<td>'+'<input type="hidden" layignore="1" name="paramList['+row_count+'].COL_TYPE" value="'+map.COL_TYPE+'" />'+util.getDictShow('COL_TYPE',map.COL_TYPE)+'</td>';
		if(map.LEN==0||map.COL_TYPE==3||map.COL_TYPE==1||map.COL_TYPE==5)
		{
			tds += '<td>'+'<input type="hidden" name="paramList['+row_count+'].LEN" value="" /></td>';
		}else
		{
			tds += '<td>'+'<input type="hidden" name="paramList['+row_count+'].LEN" value="'+map.LEN+'" />'+map.LEN+'</td>';
		}
		
		tds += '<td>'+'<input type="hidden" name="paramList['+row_count+'].COL_SCENE" value="'+map.COL_SCENE+'" />'+util.getDictShow('COL_SCENE',map.COL_SCENE)+'</td>';
		tds += '<td>'+'<input type="hidden" name="paramList['+row_count+'].IS_NULL" value="'+map.IS_NULL+'" />'+util.getDictShow('YESNO',map.IS_NULL)+'</td>';
		tds += '<td>'+'<input type="hidden" name="paramList['+row_count+'].DEF_VAL" value="'+util.toString(map.DEF_VAL)+'" />'+util.toString(map.DEF_VAL)+'</td>';
		var row = $('<tr id="'+("data_row_"+row_count)+'">'+tds+'</tr>');
		if(row_count % 2 != 0){
			row.addClass("tr1");
		}
		_toClickColor(row);//<%-- 行点击着色 --%>
		addTtable.append(row);
		row_count++;
		$(document).scrollTop($(document).height());
	}
	
	function initAddTable(){
		$("#addTable tbody tr").remove();
		row_count = 0;
	}
	
	function colTypeSel(thisObj,row){
		if("2" == thisObj.value){
			$("#LEN_"+row).show();
		}else{
			$("#LEN_"+row).hide();
		}
	}
	
	function delRow(){
		if(null == _oldSselectedTr){
			util.alert("<dict:lang value="请选择要删除的记录行" />");
			return;
		}
		if(row_count<2){
			util.alert("<dict:lang value="至少要有一个自定义字段" />");
			return;
		}
		var delSeq = _oldSselectedTr.children("td").eq(0).find("span").text()-1;
		_oldSselectedTr.remove();
		_oldSselectedTr=null;
		row_count--;
		var arrCol = ["COL_NO","COL_NAME","COL_TYPE","LEN","COL_SCENE","IS_NULL","DEF_VAL"];
		$("#addTable tr").each(function(seq) {
			var _this = $(this);
			if(seq>delSeq){
				_this.find("td").each(function(sdq) {
					if(sdq==0){
						return true;
					}
					$(this).children().attr("id",arrCol[sdq-1]+"_"+(seq-1));
					$(this).children().attr("name","paramList["+(seq-1)+"]."+arrCol[sdq-1]);
				});
				_this.children("td").eq(0).text(seq);
				if(seq % 2 == 0){
					_this.addClass("tr1");
				}else{
					_this.removeClass("tr1");
				}
			}
		});
		
		
	}
	
	var fg_type='1';
	function fgConfirm(){
		fg_type='2';
		
	}
	
	//获取语句字段
	var pre_sql='';
	function getFields(){
		if(cur_ORM_ADD_TYPE == 4){
			var codeType = $('input[name="paraMap.codeType"]:checked').val();
			var sql=null;
			if (codeType == "comm") {
				sqlContext = $("#comm_sql").val();
				sql=$("#comm_sql")
				if (sqlContext == "") {
					//_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
					alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
					return false;
				}
			} else if (codeType =="oracle") {
				sqlContext = $("#oracle_sql").val();
				sql=$("#oracle_sql")
				if (sqlContext == "") {
					//_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
					alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
					return false;
				}
			} else if (codeType == "mysql") {
				sqlContext = $("#mysql_sql").val();
				sql=$("#mysql_sql")
				if (sqlContext == "") {
					//_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
					alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
					return false;
				}
			} else if (codeType == "sqlserver") {
				sqlContext = $("#sqlserver_sql").val();
				sql=$("#sqlserver_sql")
				if (sqlContext == "") {
					//_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
					alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
					return false;
				}
			}
			
		}
		var db_sql = document.getElementById(db_dialect+"_sql");
		var sql2 = db_sql.value;
		if(val.isBlank(db_sql)){
			db_sql = document.getElementById("comm_sql");
			sql2 = db_sql.value;
			if(val.isBlank(db_sql)){
			   	//_alertValMsg(db_sql,"<dict:lang value="虚拟模型SQL语句" /> -- <dict:lang value="不能为空" />");
			   	alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
			   	return false;
			}
		}
		row_count = 0;
		
		var all_fields='';
		var addTtable = $('#addTable');
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
	          case 1:
	          fieldname=submitObj.val();
	          break;
	          
	          case 2:
	          field_comment=submitObj.val();
		      break;
	          
	          case 3:
    		  valueText=submitObj.val();//字段类型
    		  break;
    		  
	          case 4:
	          filedSize=submitObj.val();
			  break;
			  
	          case 6:
	          filedIsnull=submitObj.val();
			  break;
			  
	          case 7:
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
	    
	    //alert(all_fields);
	    if(all_fields!=null && all_fields!='' && sql2!=pre_sql){
	    	all_fields='';
	    	
	    }
	    
	    var url = "${path}sys/BussModelAction_getFields.ms";
		util.showLoading("处理中...");
		$("#addTable tbody").html("");
	    
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
					if(null != data.ajaxList){
						var addTtable = $('#addTable');
						var addTableTr = $('#addDemoTr');
						//var aList = eval(data.ajaxList);
						
						//if(all_fields!=null && all_fields!=''){
						//	util.confirm(fgConfirm,"确定重新覆盖获取字段");
						//	
						//}
						
						aList = eval(data.ajaxList_new2);
						
						for(var i = 0;i < aList.length; i++){
							var colType = "";
							if(aList[i].typeName == 'NUMBER'||aList[i].typeName == 'INT' ||aList[i].typeName == 'INTEGER'||aList[i].typeName == 'numeric'){
								colType = "1";
							}else if(aList[i].typeName == 'VARCHAR2' || aList[i].typeName == 'CHAR'|| aList[i].typeName == 'VARCHAR'||aList[i].typeName == 'varchar'){
								colType = "2";
							}else if(aList[i].typeName == 'DATE'){
								colType = "3";
							}
							else if(aList[i].typeName == 'DATETIME'||aList[i].typeName == 'timestamp'){
								colType = "4";
							}else if(aList[i].typeName == 'CLOB'|| aList[i].typeName == 'longblob'|| aList[i].typeName == 'text'){
								colType = "5";
							}					

							var row = addTableTr.clone(true);
							row[0].id= "data_row_"+row_count;
							row.find("td").each(function(seq) {
								if(seq==0){
									$(this).find("span").text(row_count+1);
								}else{
									submitObj = $(this).find(".isSubmit");
									var inputName = submitObj.attr("name");
									submitObj.attr("id",submitObj.attr("id")+"_"+row_count);
			
									if("COL_NO" == inputName){
										submitObj.prop("readOnly","readOnly");
										submitObj.val(aList[i].filedName);
									}else if("COL_NAME" == inputName){
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
							addTtable.append(row);
							row_count++;
							$(document).scrollTop($(document).height());	
							
							form.render("select");						
							
						}
					}
				},
				error: function(msg){
						util.closeLoading();
						//util.alert("error:"+msg);
						util.alert("error:"+msg.responseText);
						
				  }
			});		
	}
	
        
	function valData(){
		var paraMapORMNAME = document.getElementById("paraMap_ORM_NAME");
   	 if(val.isBlank(paraMapORMNAME)){
   		//_alertValMsg(paraMapORMNAME,"<dict:lang value="持久模型名称" /> -- <dict:lang value="不能为空" />");
   		alterWindows("<dict:lang value="持久模型名称" /> -- <dict:lang value="不能为空" />",5);
   		return false;
   	} 
   	var paraMapTABLENAME = document.getElementById("paraMap_TABLE_NAME");
   	if(val.isBlank(paraMapTABLENAME) || defTableNamePrefix == paraMapTABLENAME.value){
   		//_alertValMsg(paraMapTABLENAME,"<dict:lang value="持久模型表名" /> -- <dict:lang value="不能为空" />");
   		alterWindows("<dict:lang value="持久模型表称" /> -- <dict:lang value="不能为空" />",5);
   		var tVal=$(paraMapTABLENAME).val();
   		$(paraMapTABLENAME).val("").focus().val(tVal);
   		return false;
   	}else if(paraMapTABLENAME.value.toUpperCase().indexOf("SY_") == 0 || paraMapTABLENAME.value.toUpperCase().indexOf("MS_") == 0){
   		//_alertValMsg(paraMapTABLENAME,"<dict:lang value="持久模型表名" /> -- <dict:lang value="不能以SY_和MS_开头" />");
   		alterWindows("<dict:lang value="持久模型表称" /> -- <dict:lang value="不能为空" />",5);
   		$(paraMapTABLENAME).focus();
   		return false;
   	}
		if (!regStr.test(paraMapTABLENAME.value)){
   		var tVal=$(paraMapTABLENAME).val();
   		$(paraMapTABLENAME).val("").focus().val(tVal);
   		//_alertValMsg(paraMapTABLENAME,"<dict:lang value="持久模型表名" /><dict:lang value="必须以字母开头" />\n<dict:lang value="命名规则请参见数据库相关文档" />");
   		alterWindows("<dict:lang value="持久模型表名" /><dict:lang value="必须以字母开头" />\n<dict:lang value="命名规则请参见数据库相关文档" />",5);
			return false;
		}
		
	
		if(cur_ORM_ADD_TYPE == 4){
					
					var codeType = $('input[name="paraMap.codeType"]:checked').val();
					var sql=null;
					if (codeType == "comm") {
						sqlContext = $("#comm_sql").val();
						sql=$("#comm_sql")
						if (sqlContext == "") {
							//_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
							alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
							return false;
						}
					} else if (codeType == "oracle") {
						sqlContext = $("#oracle_sql").val();
						sql=$("#oracle_sql")
						if (sqlContext == "") {
							//_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
							alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
							return false;
						}
					} else if (codeType == "mysql") {
						sqlContext = $("#mysql_sql").val();
						sql=$("#mysql_sql")
						if (sqlContext == "") {
							//_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
							alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
							return false;
						}
					} else if (codeType == "sqlserver") {
						sqlContext = $("#sqlserver_sql").val();
						sql=$("#sqlserver_sql")
						if (sqlContext == "") {
							//_alertValMsg(sql,"<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />");
							alterWindows("<dict:lang value="虚拟模型SQL语句" /><dict:lang value="不能为空" />",5);
							return false;
						}
					}
<%--			var paraMap_ORM_SQL = document.getElementById("paraMap_ORM_SQL");--%>
<%--			if(val.isBlank(paraMap_ORM_SQL)){--%>
<%--				_alertValMsg(paraMap_ORM_SQL,"<dict:lang value="虚拟模型SQL语句"/> -- <dict:lang value="不能为空"/>");--%>
<%--				return false;--%>
<%--			}--%>
		}
		var addTtable = $('#addTable');
		var isPass=true;
		if(addTtable.find("tr").length == 1){
			alert("<dict:lang value="必须要添加字段"/>");
			isPass = false;
		}
	var all_fields='';
    addTtable.find("tr").each(function (seq){
    var valueText="";
    	$(this).find("td").each(function (seq2){
    		var submitObj=$(this).find(".isSubmit");//要提交的表单对象
    		switch(seq2){
    			case 1:
    			var valueTmp=submitObj.val();
    			if(val.isBlank(valueTmp)){
    				isPass=false;
    				//_alertValMsg(submitObj[0],"<dict:lang value="字段名称" /> -- <dict:lang value="不能为空" />");
    				alterWindows("<dict:lang value="字段名称" /> -- <dict:lang value="不能为空" />",5);
    			}else{
    			    var upVal = valueTmp.toUpperCase();
    			    if((upVal == "ID" || upVal == "EDIT_USER" || upVal == "EDIT_TIME" || upVal == "DEPT_ID" || upVal == "DATA_AUTH"
    			       || upVal == "CREATE_USER" || upVal == "CREATE_TIME") && cur_ORM_ADD_TYPE!='4'){
		    			    isPass = false;
		    			    //_alertValMsg(submitObj[0],"<dict:lang value="字段名称" /> -- <dict:lang value="不能为保留字段中的任何一个" />");
		    			    alterWindows("<dict:lang value="字段名称" /> "+upVal+"-- <dict:lang value="不能为保留字段中的任何一个" />",5);
	    			 }
	    			    
	    			 //持久模型中增加建索引功能
	    			 if(all_fields==''){
		            	all_fields=valueTmp;
		             }else{
		            	all_fields=all_fields+','+valueTmp;
		             }
	            
    			}
    			break;
    			case 2:
    			var valueTmp=submitObj.val();
    			if(val.isBlank(valueTmp)){
    				isPass=false;
    				//_alertValMsg(submitObj[0],"<dict:lang value="字段说明" /> -- <dict:lang value="不能为空" />");
    				alterWindows("<dict:lang value="字段说明" /> -- <dict:lang value="不能为空" />",5);
    			}
    			break;
    			case 3:
    			valueText=submitObj.val();//字段类型
    			break;
    			case 4:
    			if(valueText=="<s:property value="%{@com.more.fw.core.bd.model.database.DataBaseFiled@VARCHAR2}" />"){<%-- 当为文本时需要校验输入的内容为大于0的整数 --%>
    			if(val.isNull(submitObj[0]) || !val.isInt(submitObj[0]) || submitObj[0].value<1){
	    				isPass=false;
	    				//_alertValMsg(submitObj[0],"");
	    				alterWindows("<dict:lang value="字段长度" /> -- <dict:lang value="应为大于0的整数" />",5);
    				}
    			}
    			break;
    		}
    		if(!isPass){return false;}
    	});
    });
    
    if(!isPass){
			return isPass;
		}
        if(db_dialect=='oracle')
        {
        $("#paraMap_TABLE_NAME").val($("#paraMap_TABLE_NAME").val().toUpperCase());//转成大写
        }else if(db_dialect=='pg')
		{
		   $("#paraMap_TABLE_NAME").val($("#paraMap_TABLE_NAME").val().toUpperCase());//转成小写
		}
		var colLs=new Array();
		for(var i=0,j=row_count;i<j;i++){
			if (!regStr.test($("#COL_NO_"+i).val())){
					//_alertValMsg($("#COL_NO_"+i)[0],"<dict:lang value="字段名称" /><dict:lang value="必需以字母开头" /><br><dict:lang value="命名规则请参见数据库相关文档" />");
					alterWindows("<dict:lang value="字段名称" /><dict:lang value="必须以字母开头" /><br><dict:lang value="命名规则请参见数据库相关文档" />",5);
				return ;
			}
			$("#COL_NO_"+i).val($("#COL_NO_"+i).val().toUpperCase());//转成大写
			colLs.push($("#COL_NO_"+i).val());
		}
		var resObj = util.isRepeat(colLs);
		if(resObj.res){
   		//_alertValMsg($("#COL_NO_"+resObj.seq)[0],"<dict:lang value="字段名称重复" />"+resObj.val);
   		alterWindows("<dict:lang value="字段名称重复" />",5);
			return false;
		}
		
		//持久模型中增加建索引功能
		var index_value=$('#index_value').val();
		if(index_value!=null && index_value!=''){
				var index_value_arr=index_value.split("||");
				for(var i=0;i<index_value_arr.length;i++){
					var row_value=index_value_arr[i];
					if(row_value!=null && row_value!=''){
						var row_arr=row_value.split("@");
						var index_type=row_arr[0];
						var index_name=row_arr[1];
						var index_fields=row_arr[2];
						
						if(index_fields!=''){
							var fields_arr=index_fields.split(",");
							var cur_field='';
							for(var j=0;j<fields_arr.length;j++){
								cur_field=fields_arr[j];
								var flag=true;
								
								if(all_fields!=''){
									var addfields_arr=all_fields.split(",");
									for(var k=0;k<addfields_arr.length;k++){
										if(cur_field==addfields_arr[k]){
											flag=false;
											break;
										}
										
									}
								
								}
								
								if(flag){
									alterWindows("<dict:lang value="索引名称" />"+index_name+"<dict:lang value="字段" />"+cur_field+"<dict:lang value="在持久模型表字段中不存在，请检查！" />",5);
									return ;
									
								}
								
							}
							
						}
						
					}
					
				}
				
		}
		
		
		$("select").prop("disabled",false);
		return isPass;
	}
	
	var defTableNamePrefix;
	function init(){
		util.initDictMap('["YESNO","COL_TYPE","COL_SCENE"]');<%-- 初始化数据字典 --%>
		listAllOrm();

		var tableTrJs = $("#addTable tbody tr");
		row_count = tableTrJs.length;
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		
		var textField = document.getElementById('paraMap_TABLE_NAME');//获取表单域
		defTableNamePrefix = textField.value; //获取开头字符串
		textField.onkeyup = function(){
			if("2"==cur_ORM_ADD_TYPE){return;}<%-- 如果新增方式是:从表中复制时不验证表名称 --%>
			javascript:util.replaceLikeVal(textField);
			//如果不是以startText开头的，就把文本框内的值设为startText
			(textField.value.indexOf(defTableNamePrefix)===0) || (textField.value = defTableNamePrefix);
		};
		textField.onblur = function(){
			if("2"==cur_ORM_ADD_TYPE){return;}<%-- 如果新增方式是:从表中复制时不验证表名称 --%>
			//如果不是以startText开头的，就把文本框内的值设为startText
			(textField.value.indexOf(defTableNamePrefix)===0) || (textField.value = defTableNamePrefix);
		};
	}

	function searchTable(thisObj,e){
		$("#enter_type").val('ormtable');
	
		var lKeyCode = (navigator.appname=="Netscape")?event.which:window.event.keyCode;<%--  //event.keyCode按键的代码，13表示回车 --%>
		if(13!=lKeyCode){return ;}
		if(val.isBlank(thisObj.value)){util.alert("<dict:lang value="请输入表名" />");return ;}
		if(db_dialect=='oracle'){
		 	thisObj.value=thisObj.value.toUpperCase();<%-- 表名统一转成大写 --%>
		}else if(db_dialect=='pg')
		{
			thisObj.value=thisObj.value.toUpperCase();<%-- 表名统一转成大写 --%>
		}
		
	
		util.showLoading();
	  jQuery.ajax({
		type: "POST",
    dataType: "json",
    url: "${path}sys/BussModelAction_searchOrmTable.ms",
    data:{'paraMap.tableName':thisObj.value},
		success: function(data){
				//alert(JSON.stringify(data));
				//util.alert(data.ajaxMap.nextselectId);
				util.closeLoading();
				if(null == data){return ;}
				if(db_dialect=='pg')
				 {
				   if(null != data.ajaxString)
				   {
				  	 util.alert(data.ajaxString);return;
				   }
				 }
				if(null == data.ajaxList){return ;}

				if(data.ajaxList.length == 0){
					//util.alert("<dict:lang value="无对应表字段" />");
					alterWindows("<dict:lang value="无对应表字段" />",5);
					return;
					}
				$("#paraMap_TABLE_NAME").val(thisObj.value);
				initAddTable();
				jQuery.each(data.ajaxList, function(i, map) {
					addRowTable(map);
				});
				
				$("#enter_type").val('');
			},
		error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
		}
		});
	}

<%-- 初始化从现有持久模型中复制列表 --%>
	function listAllOrm(){
		util.showLoading();
	  jQuery.ajax({
		type: "POST",
    dataType: "json",
    url: "${path}sys/BussModelAction_listAllOrm.ms",
		success: function(data){
				//alert(JSON.stringify(data));
				//util.alert(data.ajaxMap.nextselectId);
				if(null == data){return ;}
				if(null == data.ajaxList){return ;}
				jQuery.each(data.ajaxList, function(i, map) {
					opt = $('<option value="'+map.ID+'" >'+map.ORM_NAME+'</option>');
					opt.appendTo($("#ormModel"));
				});
				//$(".chosen-select").chosen();
				$("#val_ORM_ADD_TYPE_3").hide();
				util.closeLoading();
				
				form.render("select");
				
			},
		error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
		}
		});
	}

<%-- 取持久模型字段 --%>
	function getOrmCol(obj){
		util.showLoading();
	  jQuery.ajax({
		type: "POST",
    dataType: "json",
    url: "${path}sys/BussModelAction_getOrmCol.ms",
    data:{'paraMap.ormId':obj.value},
		success: function(data){
				//alert(JSON.stringify(data));
				//util.alert(data.ajaxMap.nextselectId);
				util.closeLoading();
				initAddTable();
				if(null == data){return ;}
				if(null == data.ajaxList){return ;}
				jQuery.each(data.ajaxList, function(i, map) { 
					addRow(map);
					//addRowTable(map);
				});
			},
		error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
		}
		});
	}	
	

	var cur_ORM_ADD_TYPE=1;
	function showTitleVal(obj){
		$("#title_ORM_ADD_TYPE_1").hide();
		$("#title_ORM_ADD_TYPE_2").hide();
		$("#title_ORM_ADD_TYPE_3").hide();
		$("#title_ORM_ADD_TYPE_4").hide();
		$("#val_ORM_ADD_TYPE_1").hide();
		$("#val_ORM_ADD_TYPE_2").hide();
		$("#val_ORM_ADD_TYPE_3").hide();
		$("#val_ORM_ADD_TYPE_4").hide();
		$("#tspaceMap").show();
		$("#title_ORM_ADD_TYPE_"+obj.value).show();
		$("#val_ORM_ADD_TYPE_"+obj.value).show();
		
		initAddTable();
		if(obj.value == "2"){
			$("#add_but").attr("disabled","disabled");
			$("#del_but").attr("disabled",true);
			$("#paraMap_TABLE_NAME").attr("readonly",true);
			$("#tspaceMap").hide();
		}else{
			$("#add_but").attr("disabled",false);
			$("#del_but").attr("disabled",false);
			$("#paraMap_TABLE_NAME").attr("readonly",false);
		}
		if(obj.value == "4"){
			//$("#add_but").hide();
			//$("#del_but").hide();
			$("#get_but").show();
			$("#paraMap_ORM_TYPE").val("0");
			$("#tspaceMap").hide();
			$("#add_but").hide();
			var s=$("#"+db_dialect+"_sql").val();
			//alert(s);
			if($("#"+db_dialect+"_sql").val() != ""){
				$("#"+db_dialect+"_sql").show();
				$("#codeType_"+db_dialect).attr("checked",true);
			}else{
				$("#comm_sql").show();
				$("#codeType_comm").attr("checked",true);
			}
		}else{
			//$("#add_but").show();
			//$("#del_but").show();
			$("#get_but").hide();
			$("#add_but").show();
			$("#paraMap_ORM_TYPE").val("1");
<%--			$("#paraMap_ORM_SQL").val("");--%>
		}
		cur_ORM_ADD_TYPE=obj.value;
	}
	function replaceLikeVal(comp){  
	
        if (comp.value.indexOf("<") != -1|| comp.value.indexOf(">") != -1) 
        {  
            //comp.value = comp.value.substring(0, comp.value.length-1);  
            comp.value = comp.value.replace(/</g,"").replace(/>/g,"");  
            //_alertValMsg($(comp),"<dict:lang value="不能输入<>" />");
            alterWindows("<dict:lang value="不能输入<>" />",5);
        }  
    }  

	function _searchSelectVal(obj,myselectid){    	      
     keywords=obj.value.replace(/ /g,"")   //去掉空格
     var myselect=document.getElementById(myselectid) //得到select对象
     for(i=0;i<myselect.length;i++)// 循环option
     {
         if(myselect.options[i].text.indexOf(keywords)!=-1) //判断option的text是否包含keyword
         {
             myselect.options[i].selected=true;//选中第一个匹配到的值
             break;
         }
         else
         {
             myselect.options[i].selected=false; //不包含keywords的取消选中
         }
     }
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
//////////////////////////////////////////////////////////////////////////
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
				
				//_alertValMsg(_this,"<dict:lang value="字段名称重复" />");
				alterWindows("字段说明重复",5);
				_this.focus();
				return false;
			}
		});
    });
})

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
		 
		 layui.use('form', function(){
	    	  var form = layui.form;
	    	  
	    	  form.on('submit(filterSubmit)', function (data) {
	    	  	   document.getElementById("curIframeName").value=window.frameElement.name;
	    	  	   
	    	  	   if($("#enter_type").val()=='ormtable'){
	    	  	   		return false;
	    	  	   }
	    	  	   
			       var flag=add(data.elem);
			       if(!flag){
			       		return false;
			       }else{
			       		return true;
			       }
			       
			  }) 
			  
			  form.on('select(getOrmCol)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				getOrmCol(data.elem);
			
		 	});
           	form.verify({
		  		verdateTableName: function(value, item){ //value：表单的值、item：表单的DOM对象
		   		 if(value.toUpperCase().indexOf("SY_") == 0 || value.toUpperCase().indexOf("MS_") == 0){
		   			$(paraMapTABLENAME).focus();
		   			return "<dict:lang value="持久模型表名" /> -- <dict:lang value="不能以SY_和MS_开头" />";
		   		}
		   		//var regStr= /^[a-zA-Z][a-zA-Z0-9_]*$/;
		   		if(!new RegExp(/^[a-zA-Z][a-zA-Z0-9_]*$/).test(value)){
		   			var paraMapTABLENAME = document.getElementById("paraMap_TABLE_NAME");
		   			 var tVal=$(paraMapTABLENAME).val();
		   			$(paraMapTABLENAME).val("").focus().val(tVal); 
					return "<dict:lang value="持久模型表名" /><dict:lang value="必须以字母开头" />\n<dict:lang value="命名规则请参见数据库相关文档" />";
		   		}
		  }
		});
		
	    });
	    
	    

    });
	    
})

</script>

<script type="text/javascript">	
//持久模型中增加建索引功能 begin
	function addIndex() {
		var all_fields='';
		var addTtable = $('#addTable');
	    addTtable.find("tr").each(function (seq){
	      var fieldname='';
	      var valueText='';
	        
	      $(this).find("td").each(function (seq2){
	        var submitObj=$(this).find(".isSubmit");//要提交的表单对象
	        if(submitObj==null || typeof(submitObj) == "undefined"){
	        	return;
	        }
	        
	        switch(seq2){
	          case 1:
	          fieldname=submitObj.val();
	          break;
	          
	          case 3:
    		  valueText=submitObj.val();//字段类型
    		  break;
	
	        }

	      });
	      
	      if(valueText!='5' && valueText!='6'){//5大文本 6二进制  这两个类型无法创建索引
	        	if(!val.isBlank(fieldname)){
		            if(all_fields==''){
		            	all_fields=fieldname;
		            }else{
		            	all_fields=all_fields+','+fieldname;
		            }
		            
		        }
	        
	        }
	      
	    });
	    
	    //alert(all_fields);
	    if(cur_ORM_ADD_TYPE=='4'){
	    	//虚拟模型
	    	alterWindows("<dict:lang value="虚拟模型不能创建索引" />",5);
	    	return false;
	    	
	    }
	    if(val.isBlank(all_fields)){
	   		alterWindows("<dict:lang value="请先创建字段名称" />",5);
	   		return false;
	    }
	    
	    var resObj = util.isRepeat(all_fields.split(","));
		if(resObj.res){
   			alterWindows("<dict:lang value="字段名称重复" />",5);
			return false;
		}
	    
	    var mcIframeName = window.frameElement.name; //外层iframe的name
		var url = "${path}sys/BussModelAction_toAddIndex.ms"+"?paraMap.mcIframeName="+mcIframeName+'&all_fields='+all_fields;
		showPopWin(url, "950", "600",null,"<dict:lang value="索引"/> <dict:lang value="新增"/>");
	      
	}
	
	function set_index_value(index_value){
		$('#index_value').val(index_value);
	}
	
	function get_index_value(){
		return $('#index_value').val();
	}
  
//持久模型中增加建索引功能 end

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>