<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="查询条件" /> <dict:lang value="新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="1" />
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="json2" value="1" />
	</jsp:include>
	<style type="text/css">
	
	.img_search{
		position: relative;
	    left: 245px;
	    top: -27px;
	}
	</style>
</head>
<body>
	<div class="all" >
		<div  class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}sys/BussModelAction_addSearch.ms" method="post" target="submitFrame">
				<s:token />
				<input type="hidden" id="paraMap_VIEWID" name="paraMap.VIEWID" value="<s:property value="paraMap.VIEWID"/>" />
				<table class="add_table" align="center">
					<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="条件名称" />
						</td>
						<td class="widget">
							<%--<s:select list="listData" listKey="COLID" id="paraMap_SEL_FORM_COL_ID" listValue="TITLE_NAME"
								cssStyle="width:153px;" cssClass="_VAL_NULL chosen-select" onchange="setFormColVal(this)"/>
								
							--%><select lay-filter="setFormColVal" lay-search="" lay-verify="required"  id="paraMap_SEL_FORM_COL_ID">
						       <c:forEach items="${listData}" var="listData">
       							   <option value="${fn:escapeXml(listData.COLID)}"><dict:lang value="${fn:escapeXml(listData.TITLE_NAME)}" /></option>
  							   </c:forEach>
						   </select>
								
							<input type="hidden" id="paraMap_FORM_COL_ID" name="paraMap.FORM_COL_ID" />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="条件符号" />
						</td>
						<td class="widget">
							<dict:selectDict dictCode="SEARCH_COM"  dictValue="" id="paraMap_SEARCH_COM" name="paraMap.SEARCH_COM" 
								cssClass="_VAL_NULL" />
							
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="关联符号" />
						</td>
						<td  class="widget">
							<dict:selectDict dictCode="SEARCH_REL" dictValue="" id="paraMap_SEARCH_REL" name="paraMap.SEARCH_REL" 
								cssClass="_VAL_NULL" />
							
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="UI来源" />
						</td>
						<td  class="widget">
							<dict:radioDict dictCode="SH_UI_SOUR" dictValue="1" id="paraMap_SH_UI_SOUR" name="paraMap.SH_UI_SOUR"
								bindEvent="radioChange"  style="width:30px;" cssClass="_VAL_NULL" />
							
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="排列顺序" />
						</td>
						<td class="widget">
							<input type="text" lay-verify="required"  id="paraMap_SHOW_ORDER" name="paraMap.SHOW_ORDER" maxlength="3" class="_VAL_NULL _VAL_NaN"
							  onkeyup='this.value=this.value.replace(/[^0-9]/gi,"")' />
							
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<dict:lang value="条件UI" />
						</td>
						<td class="widget">
						
						<div id="paraMap_SEARCH_UI_div" style="display: none;" class="layui-input-inline">
						<input type="text" id="paraMap_SEARCH_UI_NAME"  name="paraMap.SEARCH_UI_NAME"   readonly="readonly" class="input_indent" />
                  		  <i class="layui-icon layui-icon-search" onclick="cfgUI();" style="position: absolute;top:11px;right: 8px;"></i>
                  		  								<input type="hidden" id="paraMap_SEARCH_UI" name="paraMap.SEARCH_UI" readOnly class="readonly"/>
                  		  
               			 </div><%--
						
						    <div >
							<!--<s:textfield name="paraMap.SEARCH_UI" id="paraMap_SEARCH_UI" maxlength="60" cssClass="_VAL_NULL" 
								cssStyle="display:none;"	disabled="true" />-->
								
								<!-- <input type="hidden" id="funcdto_roleid" name="funcDto.roleId"/>-->
							<i class="layui-icon layui-icon-search"  style="position:  relative;bottom: 29px;left: 250px;cursor: pointer;"></i>
						   </div>
														

						--%></td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="样式属性" />
						</td>
						<td class="widget">
							<input type="text" id="paraMap_SH_UI_SYTLE" name="paraMap.SH_UI_SYTLE" maxlength="300" />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<dict:lang value="样式表" />
						</td>
						<td class="widget">
							<input type="text" id="paraMap_SH_UI_CLASS" name="paraMap.SH_UI_CLASS" maxlength="300" />
						</td>
					</tr>
					
					<tr id="is_show_in_bar_id" style="display:none">
						<td  class="tr1 title">
							<dict:lang value="显示在按钮栏" />
						</td>
						<td colspan="3">
							<select id="paraMap_IS_SHOW_IN_BAR" name="paraMap.IS_SHOW_IN_BAR">
								<option value="1"><dict:lang value="是" /></option>
								<option value="0" selected><dict:lang value="否" /></option>
							</select>
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="方法事件" />
						</td>
						<td class="widget">
							<input type="text" id="paraMap_SH_UI_FUN" name="paraMap.SH_UI_FUN" maxlength="300" />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<dict:lang value="回车查询" />
						</td>
						<td class="widget">
							<label>
								<input type="radio" name="paraMap.SH_UI_ENTER"
									value="1" onclick="" title='开启' style="width:30px;" checked="checked"/>
							</label>
							<label>
								<input type="radio"  name="paraMap.SH_UI_ENTER"
									value="0" onclick="" title='关闭' style="width:30px;" />
							</label>
						</td>
					</tr>
					
					<tr id="is_time_id">
						<td  class="tr1 title">
							<dict:lang value="时间段" />
						</td>
						<td class="widget">
							<select id="paraMap_IS_TIME_BUCKET" lay-filter="setConnSy"  name="paraMap.IS_TIME_BUCKET" >
								<option value="1"><dict:lang value="是" /></option>
								<option value="0" selected><dict:lang value="否" /></option>
							</select>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="连接符" />
						</td>
						<td class="widget">
							<input type="text" id="paraMap_CONN_SYMBOL" name="paraMap.CONN_SYMBOL" maxlength="5" class="readonly" readOnly/>
							
						</td>
					</tr>
					<tr id="is_time_id2" style="display:none;">
						<td  class="tr1 title">
							<dict:lang value="默认时间(天)" />
						</td>
						<td class="widget" title="时间段查询默认时间范围，单位天，0表示当天，必须是整数，比如输入1表示当前系统时间往前推1天。">
							<input type="text" id="paraMap_DEF_TIMESPACE" name="paraMap.DEF_TIMESPACE" maxlength="5" class="readonly" readOnly onkeyup='this.value=this.value.replace(/[^0-9]/gi,"")'/>
							
						</td>
					</tr>
					
				</table>
				<div class="ptop_10 txac">
			<%--<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
			&nbsp;&nbsp;
			--%><button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			
			<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
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

	//从列表中获取formId
	function getFormId(){
		//var formId="<s:property value="#request.formId"/>";
			return '<s:property value="#request.formId"/>';

	}
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function showSEARCH_UI(thisObj){
		
	}

	function add(){
		/*if("1" == $("input[name='paraMap.SH_UI_SOUR']:checked").val()){
			$("#paraMap_SEARCH_UI").prop("disabled",true);
		}else{
			$("#paraMap_SEARCH_UI").prop("disabled",false);
		}*/
		if("2" == $("input[name='paraMap.SH_UI_SOUR']:checked").val() && $("#paraMap_SEARCH_UI").val() == ""){
	   		_alertValMsg(document.getElementById("paraMap_SEARCH_UI_NAME"),"<dict:lang value="条件UI" /> -- <dict:lang value="不能为空" />");
	   		return false;
		}
		if($("#paraMap_IS_TIME_BUCKET").val() == "1" && $("#paraMap_CONN_SYMBOL").val() == ""){
	   		_alertValMsg(document.getElementById("paraMap_CONN_SYMBOL"),"<dict:lang value="连接符" /> -- <dict:lang value="不能为空" />");
	   		return false;
		}
		
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valNaNData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		document.forms.addForm.submit();
	}

	//
	function setFormColVal(obj){
		var selVal = obj.value;
		if(selVal != "" && selVal != null && selVal.indexOf(";") != -1){
			$("#paraMap_FORM_COL_ID").val(selVal.split(";")[1]);
			showIsTimBucket(selVal.split(";")[0]);
		}		
	}
	
	function showIsTimBucket(val){
		if(val == "4" || val == "3"){
			$("#is_time_id").show();
			$("#is_time_id2").show();
			
		}else{
			$("#is_time_id").hide();
			$("#is_time_id2").hide();
			$("#paraMap_IS_TIME_BUCKET").val("0");
			setConnSy("0");
		}
	}
	
	function setConnSy(val){
		if(val == "1"){
			$("#paraMap_CONN_SYMBOL").prop("readOnly","").removeClass("readonly").val("~");
			$("#paraMap_DEF_TIMESPACE").prop("readOnly","").removeClass("readonly");
			//$("#is_show_in_bar_id").show();
		}else{
			$("#paraMap_CONN_SYMBOL").prop("readOnly","readOnly").addClass("readonly").val("");
			$("#paraMap_DEF_TIMESPACE").prop("readOnly","readOnly").addClass("readonly").val("");
			//$("#is_show_in_bar_id").hide();
			//$("#paraMap_IS_SHOW_IN_BAR").val("0");
		}
	}
	
	function cfgUI(){//alert(UI_COMP);
	   var mcIframeName = $("#curIframeName").val();
		var url = "${path}sys/BussModelAction_cfgUICompFrame.ms?paraMap.id="+$("#paraMap_SEL_FORM_COL_ID").val().split(";")[1]+"&paraMap.FORM_ID="+getFormId()+"&paraMap.UI_COMP__TYPE=UI_COMP_SEARCH&paraMap.UI_COMP="+$("#paraMap_SEARCH_UI").val()+"&mcIframeName="+mcIframeName;
		showPopWin(url, 1000, 600,null,$("#paraMap_SEL_FORM_COL_ID option:selected").text()+" <dict:lang value="UI组件配置"/>","cfgUiIframe");
	}	
	
	function init(){$(".chosen-select").chosen();}
	
	$(function(){
		var selVal = $("#paraMap_SEL_FORM_COL_ID").val();
		if(selVal != "" && selVal != null && selVal.indexOf(";") != -1){
			$("#paraMap_FORM_COL_ID").val(selVal.split(";")[1]);
			showIsTimBucket(selVal.split(";")[0]);
		}
	});
	layui.use('form', function(){
	  	  var form = layui.form;
	  	  var form = layui.form;
	  	  form.on('submit(component-form-element)', function(data){
	  		  
	  	  });
	  	  
	  	  form.on('radio(radioChange)', function(data){
    		  if("1" == $("input[name='paraMap.SH_UI_SOUR']:checked").val()){
    				$("#paraMap_SEARCH_UI_div").hide();
    				//$("#paraMap_SEARCH_UI").prop("disabled",true);
    			}else{
    				$("#paraMap_SEARCH_UI_div").show();
    				//$("#paraMap_SEARCH_UI").prop("disabled",false);
    			}          
    	  });
	  	  
	  	form.on('select(setFormColVal)', function(data){
	  		var selVal = data.value;
			if(selVal != "" && selVal != null && selVal.indexOf(";") != -1){
				$("#paraMap_FORM_COL_ID").val(selVal.split(";")[1]);
				showIsTimBucket(selVal.split(";")[0]);
			}		
		});
	  	
	  	form.on('select(setConnSy)', function(data){
	  		var selVal = data.value;
	  		setConnSy(selVal);
		});
	  });
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>