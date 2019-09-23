<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="视图模型" /> <dict:lang value="新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="multiselect" value="0" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	<style type="text/css">
	.ico-search-input {
		background: url(plf/page/fp/img/ico-search-h-c.png?_mc_res_version=<%=PlfStaticRes.ICO_SEARCH_H_C_PNG%>) no-repeat right;
		cursor: pointer;
		left: 230px;
		top: 6px; 
		height:21px;
		border: 1px solid #A9A9A9;
	}
	</style>
</head>
<body>
	<div class="all">
		<div  class="add_table_div">
			<form id="add_form" class="layui-form" name="addForm" action="${path}sys/BussModelAction_addView.ms" method="post">
				<s:token />
				<input type="hidden" id="paraMap_MID" name="paraMap.MID" value="<s:property value="paraMap.MID"/>"/>
				<input type="hidden" id="paraMap_title" name="paraMap2.title" />
				<input type="hidden" id="paraMap_showColId" name="paraMap2.showColId" />
				<input type="hidden" id="paraMap_showColCname" name="paraMap2.showColCname" />
				<input type="hidden" id="paraMap_showColEname" name="paraMap2.showColEname" />
				<input type="hidden" id="paraMap_showColType" name="paraMap2.showColType" />
				<input type="hidden" id="paraMap_showColIsNull" name="paraMap2.showColIsNull" />
				<input type="hidden" id="paraMap_ormId" name="paraMap2.ormId" />
				<input type="hidden" id="paraMap_associated" name="paraMap2.associated" />
				<input type="hidden" id="paraMap_ormName" name="paraMap2.ormName" />
				<input type="hidden" id="paraMap_isThreeLevel" name="paraMap2.isThreeLevel" />
				<input type="hidden" id="paraMap_isTopForm" name="paraMap2.isTopForm" />
				<input type="hidden" id="paraMap_isChildForm" name="paraMap2.isChildForm" />
				<input type="hidden" id="paraMap_threeLevelFormId" name="paraMap2.threeLevelFormId" />
				<table class="add_table">
					<tr>
						<td  class="tr1 title">
						    <span class="Eng">*</span>
							<dict:lang value="视图模型名称" />
						</td>
						<td class='widget'>
						    <input type="text" name="paraMap.VIEW_NAME" required="" lay-verify="required" maxlength="60" id="paraMap_VIEW_NAME"  placeholder="请输入视图名称" autocomplete="off" class="layui-input" onkeyup="javascript:util.replaceLikeVal(this)">
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="表单模型" />
						</td>
						<td class='widget' >
							<%--<s:select id="paraMap_FORMID" name="paramList[0].FORMID" headerKey="" headerValue="%{getText('-请选择-')}"
								list="listData" listKey="ID" listValue="FORM_NAME" cssStyle="width:150px;" />
								
						    --%>
						   <select name="paramList[0].FORMID"  lay-verify="required"  id="paraMap_FORMID" lay-search>
						       <c:forEach items="${listData}" var="listData">
       							   <option value="${fn:escapeXml(listData.ID)}"><dict:lang value="${fn:escapeXml(listData.FORM_NAME)}" /></option>
  							   </c:forEach>
						   </select>
						
						</td>
					</tr>
					<tr id="tab_count_tr">
						<td class="tr1 title">
							<dict:lang value="TAB标签数量" />
						</td>
						<td colspan="5">
							<!-- <select name="paraMap.TAB_COUNT" id="paraMap_TAB_COUNT" onchange="showTabTables(this.value);">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
							</select> -->
							<input id="paraMap_TAB_COUNT" onblur="_showTabTables(this);" value="1" style="ime-mode:disabled" onkeypress="_keyPress();" onpaste="return false;">
						</td>
					</tr>		
							
					<tr id="form_id_tr">
							<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="视图类型" />
						</td>
						<td  class='widget'><%--
							<dict:selectDict id="paraMap_VIEW_TYPE" name="paraMap.VIEW_TYPE" dictCode="VIEW_TYPE" dictValue="VIEW_TYPE" 
								custom_option="%{getText('-请选择-')}" style="width:153px;" onchange="changeVT(this.value);" />
							<span class="Eng">*</span>
							
							<input id="paraMap_VIEW_TYPE" type="hidden" name="paraMap.VIEW_TYPE" />
							<input id="paraMap_VIEW_TYPE_TEXT" type="text"  onclick="preview()"  readonly="readonly" class="ico-search-input"  style="ime-mode:disabled" />
						--%>
						   <div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
						 	  <input id="paraMap_VIEW_TYPE"  type="hidden" name="paraMap.VIEW_TYPE" />
						 	  <input id="paraMap_VIEW_TYPE_TEXT" lay-verify="required" type="text"    readonly="readonly"  class="input_indent" />
                  		  		<i class="layui-icon layui-icon-search" onclick="previewTab();" style="position: absolute;top:11px;right: 8px;"></i>
               				</div>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
						     <span class="Eng">*</span>
							<dict:lang value="视图模型编码" />
						</td>
						<td class='widget'>
					      <input type="text" name="paraMap.VIEW_MODEL_CODE" required="" lay-verify="viewModelCode" maxlength="60" id="paraMap_VIEW_MODEL_CODE"  placeholder="请输入视图编码" autocomplete="off" class="layui-input">
						</td>
					</tr>
					<tr>
						<td   class="tr1 title">
								<span class="Eng">*</span>
							<dict:lang value="控制数据权限" />
						</td>
						<td class='widget'>
						<dict:selectDict dictCode="IS_DATA_AUTH" dictValue="%{IS_DATA_AUTH}" name="paraMap.IS_DATA_AUTH"  />
							
						</td>	
						<td>&nbsp;</td>		
						<td   class="tr1 title">
							<dict:lang value="自定义类" />
						</td>
						<td  class='widget'>
							<s:textfield name="paraMap.CLASS_NAME" id="paraMap_CLASS_NAME" maxlength="120" />
							<span class="Eng" id="CLASS_NAME_Eng" style="display: none;">*</span>
						</td>					
					</tr>
					<tr>
						
						<td   class="tr1 title">
							<dict:lang value="引入静态文件" />
						</td>
						<td  class='widget'>
						<select id="paraMap2_STATIC_RES_FILE" name="paraMap2.STATIC_RES_FILE" >
						        <option value="">===请选择===</option>
								<c:forEach items="${listFileName}" var="listFileName" varStatus="index">
									 <option value="<c:out value='${listFileName}' />"><c:out value='${listFileName}' /></option>
							   </c:forEach>
							</select>
						</td>	
						<td>&nbsp;</td>	
						<td   class="tr1 title">
							<dict:lang value="默认分页记录数" />
						</td>
						<td  class='widget'>
							<dict:selectDict dictCode="PAGE_SHOW"  cssClass="dept_select" style="width:153px;" onchange="deptChange(this)" name="paraMap.DEF_PAGE_NUM" id="paraMap_DEF_PAGE_NUM"/>
						</td>			
							
					</tr>
					
					<tr id="tab_show" style="display: none">
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="Tab标题" />
						</td>
						<td class='widget'>
							<input class='paraMap_TAB_TITLE' type='text' name='paraMap2.TAB_TITLE' />
							
						</td>
						<td>&nbsp;</td>	
						<td  class="tr1 title">
							<dict:lang value="显示字段" />
						</td>
						<td  class='widget'>
						<input class='paraMap_SHOW_COL_ID' id="paraMap_SHOW_COL_ID1" type='hidden'  value=''  flag='1' name='paraMap2.SHOW_COL_ID' />
						<input class='paraMap_SHOW_COL_CNAME' id="paraMap_SHOW_COL_CNAME1" type='text' flag='1' name='paraMap2.SHOW_COL_CNAME' />
						<input class='paraMap_SHOW_COL_ENAME'  id="paraMap_SHOW_COL_ENAME1"  type='hidden' flag='1' name='paraMap2.SHOW_COL_ENAME' />
						<input class='paraMap_SHOW_COL_Type' id="paraMap_SHOW_COL_Type1" type='hidden'  value=''  flag='1' name='paraMap2.SHOW_COL_TYPE' />
						<input class='paraMap_SHOW_COL_IS_NULL' id="paraMap_SHOW_COL_IS_NULL1" type='hidden'  value=''  flag='1' name='paraMap2.SHOW_COL_IS_NULL' />
							<span class="Eng">*</span>
						</td>
						<td >
							<div><input type="button" id="addTab" value="添加tab标签页" /></div>
						</td>
					</tr>
					
					<tr id="tab_add_model_show" style="display: none">
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="二级表单新增模式" />
						</td>
						<td colspan="5">
							<select id="paraMap_associatedModel" name="paraMap2.associatedModel" >
								<option value="1">行编辑</option>
								<option value="2">弹出</option>
							</select>
							
						</td>
					</tr>
					<tr id="tab_child_add_model_show" style="display: none">
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="三级表单新增模式" />
						</td>
						<td colspan="5">
							<select id="paraMap_threeAssociatedModel" name="paraMap2.threeAssociatedModel" >
								<option value="1">行编辑</option>
								<option value="2">弹出</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td   class="tr1 title">
								<span class="Eng">*</span>
							<dict:lang value="是否工作流表单" />
						</td>
						<td class='widget'>
						<dict:selectDict dictCode="IS_FLOW_FORM" dictValue="%{IS_FLOW_FORM}" name="paraMap.IS_FLOW_FORM" id="paraMap_IS_FLOW_FORM"  />
							
						</td>	
										
					</tr>
					
					<tr id="zdy">
						<td class="tr1 title">
							<dict:lang value="自定义类源码" />
						</td>
						<td colspan="4">
							<textarea name="paraMap.MS_CLASS_CODE_ID" id="paraMap_MS_CLASS_CODE_ID" rows="10" cols="150" style="width: 100%;" ></textarea>
						</td>
					</tr>
					
				</table>
				<div class="ptop_10 txac">
				<button class="layui-btn" lay-submit="" lay-filter="filterSubmit">提交</button>
				<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
			</form>
		</div>
		<br />
		<br />
		<br />
		
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	
	function preview(){
		var formId = $("#paraMap_FORMID").val();
		if(formId == ""){
			_alertValMsg($("#paraMap_FORMID"),"<dict:lang value="请先选择" /> -- <dict:lang value="表单模型" />");
			return;
		}
		var isTopForm = $("#paraMap_isTopForm").val();
		var url = "${path}sys/BussModelAction_forPreview.ms?paraMap.isTopForm="+isTopForm;
		showPopWin(url, 900, 550,null,"<dict:lang value="视图类型"/>");
	}
	
	function previewTab(){
		var curIframeName = window.frameElement.name;
		var formId = $("#paraMap_FORMID").val();
		if(formId == ""){
			_alertValMsg($("#paraMap_FORMID"),"<dict:lang value="请先选择" /> -- <dict:lang value="表单模型" />");
			return;
		}
		var isTopForm = $("#paraMap_isTopForm").val();
		
		var url = "${path}sys/BussModelAction_forPreviewTab.ms?paraMap.isTopForm="+isTopForm+"&curIframeName="+curIframeName;
		showPopWin(url, 900, 550,null,"<dict:lang value="视图类型"/>");
	}
	

	function add(){
		if(!valData()){
			return ;
		}
		var viewType = $("#paraMap_VIEW_TYPE").val();
		if(viewType=="12"){
			setTabColVal();	
		}
		if(!valEnglish()){
			return ;
		}
		//document.forms.add_form.submit();
		//thisObj.onclick = function(){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
	}
    //校验只允许输入英文且不能为空
    function valEnglish(){
    	var VIEWMODELCODE=document.getElementById("paraMap_VIEW_MODEL_CODE");
    	if(val.isBlank(VIEWMODELCODE)){
    		$("#paraMap_VIEW_MODEL_CODE").focus();
    		$("#paraMap_VIEW_MODEL_CODE").addClass("layui-form-danger");
    		layer.msg("<dict:lang value="视图模型编码--不能为空" />", {icon: 5,anim:6});
    		//reMap.msg="<dict:lang value="视图模型编码--不能为空" />";
    		return false;
    	}
    	var reg=/^[a-zA-Z\d_]+$/;
    	var VIEWMODELCODEVALUE=VIEWMODELCODE.value;
    	if(!reg.test(VIEWMODELCODEVALUE)){
    		//reMap.state=false;
    		$("#paraMap_VIEW_MODEL_CODE").focus();
    		$("#paraMap_VIEW_MODEL_CODE").addClass("layui-form-danger");
    		layer.msg("<dict:lang value="视图模型编码--只能为英文、数字、下划线" />", {icon: 5,anim:6});
    		return false;
    		//reMap.msg="<dict:lang value="视图模型编码--只能为英文、数字、下划线" />";
    	}
    	return reMap;
    }    
	//检测数据
	function valData(){
		var paraMapVIEWNAME = document.getElementById("paraMap_VIEW_NAME");
		var paraMap_VIEW_TYPE = document.getElementById("paraMap_VIEW_TYPE");
   	if(val.isBlank(paraMapVIEWNAME)){
   		$("#paraMap_VIEW_NAME").focus();
		$("#paraMap_VIEW_NAME").addClass("layui-form-danger");
		layer.msg("<dict:lang value="视图模型名称" /> -- <dict:lang value="不能为空" />", {icon: 5,anim:6});
   		return false;
   	}
   	
   	//跨站脚本漏洞处理lth
   	if(paraMapVIEWNAME.value.indexOf("'")!=-1 || paraMapVIEWNAME.value.indexOf('"')!=-1 || paraMapVIEWNAME.value.indexOf('<')!=-1 || paraMapVIEWNAME.value.indexOf('>')!=-1 || paraMapVIEWNAME.value.indexOf('?')!=-1){
   	 	paraMapVIEWNAME.value = paraMapVIEWNAME.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\?/g,"");
   		$("#paraMap_VIEW_NAME").focus();
		$("#paraMap_VIEW_NAME").addClass("layui-form-danger");
		layer.msg("<dict:lang value="视图模型名称" /> -- <dict:lang value="不能输入单引号双引号<>?" />", {icon: 5,anim:6});
   		return false;
   	}
   	
	var paraMapVIEWTYPE = document.getElementById("paraMap_VIEW_TYPE_TEXT");
   	if(val.isBlank(paraMapVIEWTYPE)){
   		$("#paraMap_VIEW_TYPE_TEXT").focus();
		$("#paraMap_VIEW_TYPE_TEXT").addClass("layui-form-danger");
		layer.msg("<dict:lang value="视图模型名称" /> -- <dict:lang value="不能输入单引号双引号<>?" />", {icon: 5,anim:6});
   		//_alertValMsg(paraMapVIEWTYPE,"<dict:lang value="视图类型" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
	
   	var paraMapFORMID = document.getElementById("paraMap_FORMID");
   	var backVal = true;
   	if(paraMap_VIEW_TYPE.value != "8"){
	   	if(val.isBlank(paraMapFORMID)){
	   		$("#paraMap_FORMID").focus();
			$("#paraMap_FORMID").addClass("layui-form-danger");
			layer.msg("<dict:lang value="请选择" /> -- <dict:lang value="表单模型" />", {icon: 5,anim:6});
	   		//_alertValMsg(paraMapFORMID,"<dict:lang value="请选择" /> -- <dict:lang value="表单模型" />");
	   		return false;
	   	}
		if(paraMap_VIEW_TYPE.value == "12" || paraMap_VIEW_TYPE.value == "20"){
			$(".paraMap_childPopPage").each(function(i){
				if($(this).is(":visible")){
					var childPopPage = $(this).val();
		   			if(childPopPage==""){
		   				$(this).focus();
		   				$(this).addClass("layui-form-danger");
		   				layer.msg("<dict:lang value="子表单弹出界面" /> -- <dict:lang value="不能为空" />", {icon: 5,anim:6});
		   		   		backVal = false;
		   		   		return false;
		   			} 			
				}
	   		});
   			return backVal;
   		}
   	}else{
   		
   		$("tr[name='tabTr']").each(function(i){
   			//console.log($("#paraMap_FORMID_"+i).val());
   			var formId = document.getElementById("paraMap_FORMID_"+i);
   			var tabName = document.getElementById("paraMap_TABNAME_"+i);
   			if(val.isBlank(formId)){
   				$("#paraMap_FORMID_"+i).focus();
   				$("#paraMap_FORMID_"+i).addClass("layui-form-danger");
   				layer.msg("<dict:lang value="请选择" /> -- <dict:lang value="表单模型" />", {icon: 5,anim:6});
   		   		//_alertValMsg(formId,"<dict:lang value="请选择" /> -- <dict:lang value="表单模型" />");
   		   		backVal = false;
   		   		return false;
   			}else if(val.isBlank(tabName)){
   				$("#paraMap_TABNAME_"+i).focus();
   				$("#paraMap_TABNAME_"+i).addClass("layui-form-danger");
   				layer.msg("<dict:lang value="TAB标签页名称" /> -- <dict:lang value="不能为空" />", {icon: 5,anim:6});
   		   		//_alertValMsg(tabName,"<dict:lang value="TAB标签页名称" /> -- <dict:lang value="不能为空" />");
   		   		backVal = false;
   		   		return false;
   			} 			
   		});
   		
   		$("tr[name='tabTr1']").each(function(i){
   			var viewId = document.getElementById("paraMap_VIEWID_"+i);
   			if(val.isBlank(viewId)){
   				$("#paraMap_VIEWID_"+i).focus();
   				$("#paraMap_VIEWID_"+i).addClass("layui-form-danger");
   				layer.msg("<dict:lang value="视图ID" /> -- <dict:lang value="不能为空" />", {icon: 5,anim:6});
   		   		//_alertValMsg(viewId,"<dict:lang value="视图ID" /> -- <dict:lang value="不能为空" />");
   		   		backVal = false;
   		   		return false;
   			} 			
   		});
   		return backVal;
   	}

   	if($("#paraMap_VIEW_TYPE").val() =="7"){
			var paraMap_CLASS_NAME = document.getElementById("paraMap_CLASS_NAME");
	   	if(val.isBlank(paraMap_CLASS_NAME)){
	   		$("#paraMap_CLASS_NAME").focus();
			$("#paraMap_CLASS_NAME").addClass("layui-form-danger");
			layer.msg("<dict:lang value="当<视图类型>为用户自定义时，自定义类 " /> -- <dict:lang value="不能为空" />", {icon: 5,anim:6});
	   		//_alertValMsg(paraMap_CLASS_NAME,"<dict:lang value="当<视图类型>为用户自定义时，自定义类 " /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}
    	
    	return true;
    }

	//只允许数字
	function _keyPress(){
		var keyCode = event.keyCode;
		if(keyCode >= 48 && keyCode <= 57){
			event.returnValue = true;
		}else{
			event.returnValue = false;
		}
	}
		function changeVT(id){
			if(id == "7"){
				$("#CLASS_NAME_Eng").show();
			}else{
				$("#CLASS_NAME_Eng").hide();
			}
			
			if(id == "8"){
				$("#tab_count_tr").show();
				$("#form_id_tr").hide();
				$("#paraMap_FORMID").prop("disabled","disabled");
				_showTabTables($("#paraMap_TAB_COUNT").get(0));
			}else{
				$("#tab_count_tr").hide();
				$("#form_id_tr").show();
				$("tr[name='tabTr']").remove();
				$("tr[name='tabTr1']").remove();
				$("#paraMap_FORMID").prop("disabled","");
			}
		}
		
		//显示表单模型
		function _showTabTables(obj){
			var val = obj.value;
			if(val < 1 || val >15){
   		   		_alertValMsg(obj,"<dict:lang value="TAB标签数量只能是1到15之间的数字！"/>");
   		   		obj.value = 1;
   		   		return false;
			}
			
			var selectObj = $("#paraMap_FORMID").clone(true);

			var trHtml = "";
			
			for(var i = 0 ; i < val; i++){
				selectObj.name = "paramList["+i+"].FORMID";
				selectObj.id = "paraMap_FORMID"+i;
				trHtml += "<tr name='tabTr'>"
						+"	<td class=\"tr1\">"
						+"		<dict:lang value="TAB表单模型" />"+(i+1)
						+"	</td>"
						+"	<td>"
						+"   <select name=\"paramList["+i+"].FORMID\" id=\"paraMap_FORMID_"+i+"\">"
						+""+selectObj.html()+""
						+" </select><span class=\"Eng\">*</span>"
						+"	</td>"
						+"	<td class=\"tr1\">"
						+"		<dict:lang value="TAB标签页名称" />"+(i+1)
						+"	</td>"
						+"<td>"
						+" <input type=\"text\" name=\"paramList["+i+"].TABNAME\" id=\"paraMap_TABNAME_"+i+"\"><span class=\"Eng\">*</span>"
						+"</td>"
						+"</tr>"
						+"<tr name='tabTr1'>"
						+"<td class=\"tr1\">"
						+" <dict:lang value="视图ID" />"+(i+1)
						+"</td>"
						+"<td colspan='3'>"
						+" <input type=\"text\" name=\"paramList["+i+"].VIEWID\" id=\"paraMap_VIEWID_"+i+"\"><span class=\"Eng\">*</span>"
						+"</td>"
						+"</tr>";
				
			}
			//删除原有的TR
			$("tr[name='tabTr']").remove();
			$("tr[name='tabTr1']").remove();
			
			$(trHtml).insertAfter("#tab_count_tr");
		}
		
		$("#tab_count_tr").hide();
		
		
		// 获取不重复随机数
		function guid(){
			return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,function(c){
				var r = Math.random()*16|0,v=c=='x'?r:(r&0x3|0x8);
				return v.toString(16);
			});
		}
		
		$("#addTab").click(function(){
			$("#zdy").before(getTabHtml(guid()));
		});
		
		$(".removeTab").live("click",function(){
			$(this).parents(".tab").remove();
		});
		
		$("#paraMap_FORMID").change(function(){
			var viewType = $("#paraMap_VIEW_TYPE").val();
			var formId = $(this).val();
			if((formId == "" || viewType == "") ){
				//$("#tab_show,#tab_add_model_show,#tab_child_add_model_show").hide();
				return;
			};
			getChildFormList(formId,viewType,1);
		});
		
		function getChildFormList(formId,viewType,flag){
		   if(viewType==22||viewType==23||viewType==24)
          {
            $("#paraMap_IS_FLOW_FORM").val('Y');           
          }
          else{
            $("#paraMap_IS_FLOW_FORM").val('N');
          }
         layui.use('form', function(){
           var form = layui.form;
           form.render("select");
            });
			var url = "${path}sys/BussModelAction_getChildFormInfo.ms";
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: "paraMap.ID="+formId,
				success: function(data){
					if(data.ajaxMap != null){
						var isTopForm =  data.ajaxMap.isTopForm;
						var listSubForm =  data.ajaxMap.listSubForm;
						if(!isTopForm || (viewType!="12" && viewType!="20")){
							if(flag == 1){
								$("#paraMap_VIEW_TYPE_TEXT,#paraMap_VIEW_TYPE").val("");
							}
							clearOption();
						}else{
							if(listSubForm){
								$("#tab_show").hide();
								createChildInfo(listSubForm);
							}else{
								$("#tab_show").show();
							};
						};
					};
				},
				error: function(msg){
					   util.closeLoading();
					   util.alert("error:"+msg);
				}
			});	
			
		}
		
		// 弹出新增时候选择子表单弹出页面
		$(".paraMap_associatedModel").live("change",function(){
			var formId = $("#paraMap_FORMID").val();
			var associatedModel = $(this).val();
			if(associatedModel == "2"){
				$(this).next().show();
			}else{
				$(this).next().hide();
			}
			//getChildFormInfo(associatedModel,formId,"#tab_add_model_show","two_level");
		});
		
		// 弹出新增时候选择子表单弹出页面
		$("#paraMap_threeAssociatedModel").change(function(){
			var twoChildSelect = $("#paraMap_associatedModel").val();
			if(twoChildSelect=="1"){
				_alertValMsg($("#paraMap_associatedModel"),"<dict:lang value="二级表单请先选择弹出" /> -- <dict:lang value="表单模型" />");
				return;
			}
			var formId = "";
			var associatedModel = $(this).val();
			$(".two_level_childInfo input[type='hidden']").each(function(seq) {
				formId+=$(this).val()+",";
			});
			getChildFormInfo(associatedModel,formId,"#tab_child_add_model_show","three_level");
		});
		
		function getChildFormInfo(associatedModel,formId,thisObj,flag){
			if(associatedModel == "2"){
				var url = "${path}sys/BussModelAction_getChildFormInfo.ms";
				$.ajax({
					type: "POST",
				    dataType: "json",
				    url: url,
				    data: "paraMap.ID="+formId+"&paraMap.VIEWTYPE=19"+"&paraMap.flag="+flag,
					success: function(data){
						if(data.ajaxMap != null){
							var listSubForm =  data.ajaxMap.listSubForm;
							if(listSubForm){
								createChildInfo(listSubForm,thisObj,flag);
							};
						};
					},
					error: function(msg){
						   util.closeLoading();
						   util.alert("error:"+msg);
					}
				});	
				$("."+flag+"_childInfo").show();
			}else{
				clearOption(flag);
			}
		}
		
		function createChildInfo(listSubForm){
			var trHtml = "";
			$.each(listSubForm,function(i,v){
				var threeChildForm = v["three_"+v.ID];
				var childPages = v[v.ID];
				var threeLevelFormId="";
				trHtml += joinChildHtml("二级表单名称",childPages,v,"paraMap2.twoLevelChildFormId");
				if(threeChildForm){
				 $.each(threeChildForm,function(i,v){
			            childPages = v[v.ID];
			            trHtml+=joinChildHtml("三级表单名称",childPages,v,"paraMap2.threeLevelChildFormId");
			            threeLevelFormId += v.ID+",";
			      });
				 $(".add_table").append("<input type='hidden' value="+threeLevelFormId+" name='paraMap2.threeLevelFormId_"+v.ID+"' />");
				 //$("#paraMap_threeLevelFormId"+v.ID).val(threeLevelFormId);
				};
			});
			$("#paraMap_isChildForm").val("1");
			clearOption();
			$("#tab_show").after(trHtml);
		}
	
		function joinChildHtml(chiledFormNum,childPages,v,formIdName){
			var trHtml = "";
			trHtml += "<tr class='childInfo'>"
		       + "<td width='20%' class='tr1'>"
		       + ""+chiledFormNum+""
		       + "</td>"
		       + "<td width='30%'>"
		       + "<input type='hidden' value="+v.ID+" name='"+formIdName+v.ID+"' />"
		       + ""+v.FORM_NAME+""
		       + "</td>"
		       + "<td width='20%' class='tr1'>"
		       + "新增模式"
		       + "</td>"
		       + "<td width='30%'>"
		       + "<select id='paraMap_AssociatedModel"+v.ID+"' name='paraMap2.associatedModel"+v.ID+"'  class='paraMap_associatedModel' >"
		       + "<option value='1'>行编辑</option>"
		       + "<option value='2'>弹出</option>"
		       +"</select>"
		       + "<select id='paraMap_childPopPage"+v.ID+"' name='paraMap2.childPopPage"+v.ID+"' style='display:none;margin-left:10px;' class='paraMap_childPopPage popPage"+v.ID+"' >"
		       + "<option value=''>请选择弹出表单界面</option>"
		       + createChildViewOption(childPages)
		       +"</select>"
		       + (formIdName=="paraMap2.threeLevelChildFormId"?"<input type='hidden' value='isThreeLevel' name='paraMap2.isThreeLevel' />":"");
		       + "</td>"
		       +"</tr>";
		       return trHtml;
		}
		
		function clearOption(){
			$(".childInfo").remove();
		}
		
		// 生成对应的字表单option
		function createChildViewOption(childPages){
			var option = "";
			$.each(childPages,function(i,v){
				option+="<option value="+v.ID+">"+v["VIEW_NAME"]+"</option>";
			});
			return option;
		}
		
		function tabIsShow(viewType,isTopForm,isChildForm,isThreeLevel){
			//"#tab_show","#tab_add_model_show","#tab_child_add_model_show",
			if(viewType=="12"||viewType=="20"){
				if(isTopForm && isChildForm){
					$("#tab_add_model_show").show();
					$("#tab_show").hide();
					if(isThreeLevel){
						$("#tab_child_add_model_show").show();
					}else{
						$("#tab_child_add_model_show").hide();
					}
				}
				if(isTopForm && !isChildForm){
					$("#tab_add_model_show").hide();
					$("#tab_show").show();
				}
			}else{
				$("#tab_show").hide();
				$("#tab_add_model_show").hide();
				$("#tab_child_add_model_show").hide();
			}
		}
		
		// 获取url
		$(".paraMap_SHOW_COL_CNAME").live("click",function(){
			var formId = $("#paraMap_FORMID").val();
			if(formId==""){
				_alertValMsg($("#paraMap_FORMID"),"<dict:lang value="请先选择" /> -- <dict:lang value="表单模型" />");
				return;
			}
			var colIds =  $(this).prev().val();
			//var formId;
			var otherColIds = "";
			$(".add_table").find("input[name='paraMap2.SHOW_COL_ID']").not($(this).prev()).each(function(seq) {
				otherColIds+=$(this).val();
			});
			var url = "${path}sys/BussModelAction_forShowTabCol.ms?paraMap.MID="+$("#paraMap_MID").val()+"&paraMap.flag="+$(this).attr("flag")+"&paraMap.colIds="+colIds+"&paraMap.otherColIds="+otherColIds+"&paraMap.formId="+formId;
			showPopWin(url, 750, 400,null,"<dict:lang value="显示字段"/>");
		});
		
		function setTabColVal(){
			var title = "",showColId="",showColCname="",showColEname="",showColType="",showColIsNull="";
			$(".add_table").find("input[name='paraMap2.SHOW_COL_ID']").each(function(seq) {
				var flag = $(this).attr("flag");
				showColId+=$(this).val()+";";
				showColCname+=$("#paraMap_SHOW_COL_CNAME"+flag).val()+";";
				showColEname+=$("#paraMap_SHOW_COL_ENAME"+flag).val()+";";
				showColType+=$("#paraMap_SHOW_COL_Type"+flag).val()+";";
				showColIsNull+=$("#paraMap_SHOW_COL_IS_NULL"+flag).val()+";";
			});
			
			if(showColId!=""){
				$("#paraMap_showColId").val(showColId);
				$("#paraMap_showColCname").val(showColCname);
				$("#paraMap_showColEname").val(showColEname);
				$("#paraMap_showColType").val(showColType);
				$("#paraMap_showColIsNull").val(showColIsNull);
			};
		};
		
		function getTabHtml(flag){
			var tabHtml =
			"<tr class='tab'>"+
			"<td width='20%' class='tr1'>"+
			"<dict:lang value='Tab标题' />"+
			"</td>"+
			"<td width='30%'>"+
			"<input class='paraMap_TAB_TITLE' type='text' name='paraMap2.TAB_TITLE' />"+
			"<span class='Eng'>*</span>"+
			"</td>"+
			"<td width='20%' class='tr1'>"+
			"<dict:lang value='显示字段' />"+
			"</td>"+
			"<td width='20%' >"+
			"<input class='paraMap_SHOW_COL_ID' id=paraMap_SHOW_COL_ID"+flag+" value='' type='hidden' flag="+flag+" name='paraMap2.SHOW_COL_ID' />"+
			"<input class='paraMap_SHOW_COL_CNAME' id=paraMap_SHOW_COL_CNAME"+flag+" value='' flag="+flag+" type='text' name='paraMap2.SHOW_COL_CNAME' />"+
			"<input class='paraMap_SHOW_COL_ENAME' id=paraMap_SHOW_COL_ENAME"+flag+" value='' type='hidden' flag="+flag+" name='paraMap2.SHOW_COL_ENAME' />"+
			"<input class='paraMap_SHOW_COL_Type' id=paraMap_SHOW_COL_Type"+flag+" type='hidden'  value=''  flag="+flag+" name='paraMap2.SHOW_COL_TYPE' />"+
			"<input class='paraMap_SHOW_COL_IS_NULL' id=paraMap_SHOW_COL_IS_NULL"+flag+" type='hidden'  value=''  flag="+flag+" name='paraMap2.SHOW_COL_IS_NULL' />"+
			"<span class='Eng'>*</span>"+
			"</td>"+
			"<td width='10%' >"+
			"<div><input type='button' class='removeTab' value='删除tab标签页' /></div>"+
			"</td>"+
			"</tr>";
			return tabHtml;
		};
		
		
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  form.on('submit(filterSubmit)', function(data){
	    		  if(!add()){
	    			  return false;
	    		  }
	    	  });
	    	  
	    	  form.verify({
	    		  viewModelCode: function(value,item){
	    			  var reMap =  valEnglish();
	    		      if(!reMap.state){
	    		        return reMap.msg;
	    		      }
	    		    },
	    		  funcDtoIsAuth: function(value,item){
					  var val=$('input:radio[name="funcDto.isAuth"]:checked').val();
				      if(!val){
				        return '权限控制不能为空！';
				      }
				  }
	           });
	    	  
	    });
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>