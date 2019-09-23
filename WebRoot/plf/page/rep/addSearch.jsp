<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="查询条件" /> <dict:lang value="新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="1" />
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="json2" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
			<form id="addForm" name="addForm" action="" method="post" target="submitFrame">
				<table class="add_table" align="center">
					<tr>
						<th colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填写项" /> </span>
						</th>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="条件名称" />
						</td>
						<td width="30%">
							<input type="text" id="paraMap_CONDITION_NAME" name="CONDITION_NAME"  class="_VAL_NULL" maxlength="100" />
							<span class="Eng">*</span>
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="条件字段" />
						</td>
						<td width="30%">
							<input type="text" id="paraMap_CONDITION_FIELD" name="CONDITION_FIELD"  class="_VAL_NULL" maxlength="100" />
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="条件符号" />
						</td>
						<td width="30%">
							<dict:selectDict dictCode="SEARCH_COM" dictValue="" id="paraMap_SEARCH_COM" name="SEARCH_COM" style="width:153px;"
								cssClass="_VAL_NULL chosen-select" />
							<span class="Eng">*</span>
						</td>					
						<td width="10%" class="tr1">
							<dict:lang value="关联符号" />
						</td>
						<td width="20%">
							<dict:selectDict dictCode="SEARCH_REL" dictValue="" id="paraMap_SEARCH_REL" name="SEARCH_REL" style="width:153px;"
								cssClass="_VAL_NULL chosen-select" />
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="显示顺序" />
						</td>
						<td width="30%">
							<input type="text" id="paraMap_SHOW_ORDER" name="SHOW_ORDER" maxlength="3" class="_VAL_NULL _VAL_NaN"
							  onkeyup='this.value=this.value.replace(/[^0-9]/gi,"")' />
							<span class="Eng">*</span>
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="条件UI" />
						</td>
						<td width="30%">
							<!--<s:textfield name="paraMap.SEARCH_UI" id="paraMap_SEARCH_UI" maxlength="60" cssClass="_VAL_NULL" 
								cssStyle="display:none;"	disabled="true" />-->
							<div id="paraMap_SEARCH_UI_div">
								<input type="text" id="paraMap_SEARCH_UI_NAME" name="SEARCH_UI_NAME" readOnly class="readonly _VAL_NULL"/>
								<input type="hidden" id="paraMap_SEARCH_UI" name="SEARCH_UI" readOnly class="readonly"/>
									<img src="${IMG_PATH}/search.png?_mc_res_version=<%=PlfStaticRes.SEARCH_PNG %>" onclick="cfgUI();" style="cursor:pointer;" width="20px" height="20px"/>
								<!-- <input type="hidden" id="funcdto_roleid" name="funcDto.roleId"/>-->
								<span class="Eng">*</span>							
							</div>

						</td>	
					</tr>

					<tr id="is_time_id">
						<td width="20%" class="tr1">
							<dict:lang value="是否时间段" />
						</td>
						<td width="30%">
							<select id="paraMap_IS_TIME_BUCKET" name="IS_TIME_BUCKET" class="chosen-select" onchange="setConnSy(this.value);">
								<option value="1"><dict:lang value="是" /></option>
								<option value="0" selected><dict:lang value="否" /></option>
							</select>
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="连接符" />
						</td>
						<td width="30%">
							<input type="text" id="paraMap_CONN_SYMBOL" name="CONN_SYMBOL" maxlength="5" class="readonly" readOnly/>
							<span class="Eng"></span>
						</td>
					</tr>
					<!-- <tr id="is_show_in_bar_id" style="display:none">
						<td width="20%" class="tr1">
							<dict:lang value="显示在按钮栏" />
						</td>
						<td width="30%" colspan="3">
							<select id="paraMap_IS_SHOW_IN_BAR" name="IS_SHOW_IN_BAR">
								<option value="1"><dict:lang value="是" /></option>
								<option value="0" selected><dict:lang value="否" /></option>
							</select>
						</td>
					</tr>-->
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="方法事件" />
						</td>
						<td width="30%">
							<input type="text" id="paraMap_SH_UI_FUN" name="SH_UI_FUN" maxlength="300" />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="样式表" />
						</td>
						<td width="30%">
							<input type="text" id="paraMap_SH_UI_CLASS" name="SH_UI_CLASS" maxlength="300" />
						</td>						
					</tr>
                    <tr>
                        <td width="20%" class="tr1">
                           <dict:lang value="样式属性" />
                        </td>
                        <td colspan="3" width="30%">
                            <input type="text" id="paraMap_SH_UI_SYTLE" name="SH_UI_SYTLE" maxlength="300" />
                        </td>                  
                    </tr>									
				</table>
			</form>
		</div>
		<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">

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
		if("1" == $("input[name='paraMap.SH_UI_SOUR']:checked").val()){
			$("#paraMap_SEARCH_UI_div").hide();
			//$("#paraMap_SEARCH_UI").prop("disabled",true);
		}else{
			$("#paraMap_SEARCH_UI_div").show();
			//$("#paraMap_SEARCH_UI").prop("disabled",false);
		}
	}

	function add(){
		/*if("1" == $("input[name='paraMap.SH_UI_SOUR']:checked").val()){
			$("#paraMap_SEARCH_UI").prop("disabled",true);
		}else{
			$("#paraMap_SEARCH_UI").prop("disabled",false);
		}
		if("2" == $("input[name='paraMap.SH_UI_SOUR']:checked").val() && $("#paraMap_SEARCH_UI").val() == ""){
	   		_alertValMsg(document.getElementById("paraMap_SEARCH_UI_NAME"),"<dict:lang value="条件UI" /> -- <dict:lang value="不能为空" />");
	   		return false;
		}*/
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
		//document.forms.addForm.submit();
		//console.log($("#addForm").serialize());parent.rowNum
		
		var searchComText = $("#paraMap_SEARCH_COM").find("option:selected").text();
		var searchRelText = $("#paraMap_SEARCH_REL").find("option:selected").text();
		var timeBucketText = $("#paraMap_IS_TIME_BUCKET").find("option:selected").text();
		var seq = parent.rowNum - 1;
		
		var formHtml = "<td>"+$("#paraMap_CONDITION_NAME").val()+"<input type='hidden' name='paramList["+seq+"].CONDITION_NAME' value='"+$("#paraMap_CONDITION_NAME").val()+"'/></td>"
		        +"<td>"+$("#paraMap_CONDITION_FIELD").val()+"<input type='hidden' name='paramList["+seq+"].CONDITION_FIELD' value='"+$("#paraMap_CONDITION_FIELD").val()+"'/></td>"
				+"<td>"+searchComText+"<input type='hidden' name='paramList["+seq+"].SEARCH_COM' id='SEARCH_COM_VAL' value='"+$("#paraMap_SEARCH_COM").val()+"'/></td>"
				+"<td>"+searchRelText+"<input type='hidden' name='paramList["+seq+"].SEARCH_REL' id='SEARCH_REL_VAL' value='"+$("#paraMap_SEARCH_REL").val()+"'/></td>"
				+"<td>"+$("#paraMap_SHOW_ORDER").val()+"<input type='hidden' name='paramList["+seq+"].SHOW_ORDER' value='"+$("#paraMap_SHOW_ORDER").val()+"'/></td>"
				+"<td>"+$("#paraMap_SEARCH_UI_NAME").val()+"<input type='hidden' name='paramList["+seq+"].SEARCH_UI' id='SEARCH_UI' value='"+$("#paraMap_SEARCH_UI").val()+"'/></td>"
				+"<td>"+timeBucketText+"<input type='hidden' name='paramList["+seq+"].IS_TIME_BUCKET' id='IS_TIME_BUCKET_VAL' value='"+$("#paraMap_IS_TIME_BUCKET").val()+"'/></td>"
				+"<td>"+$("#paraMap_CONN_SYMBOL").val()+"<input type='hidden' name='paramList["+seq+"].CONN_SYMBOL' value='"+$("#paraMap_CONN_SYMBOL").val()+"'/></td>"
				+"<td>"+$("#paraMap_SH_UI_FUN").val()+"<input type='hidden' name='paramList["+seq+"].SH_UI_FUN' value='"+$("#paraMap_SH_UI_FUN").val()+"'/></td>"
				+"<td>"+$("#paraMap_SH_UI_CLASS").val()+"<input type='hidden' name='paramList["+seq+"].SH_UI_CLASS' value='"+$("#paraMap_SH_UI_CLASS").val()+"'/></td>"
				+"<td>"+$("#paraMap_SH_UI_SYTLE").val()+"<input type='hidden' name='paramList["+seq+"].SH_UI_SYTLE' value='"+$("#paraMap_SH_UI_SYTLE").val()+"'/></td>";
		//window.parent.addRowData($("#addForm").serializeArray());
		//window.parent.hidePopWin(true,'addSearchWinId');
		window.parent.addRowData(formHtml);
		parent.closePopWin();
	}
	
	function showIsTimBucket(val){
		if(val == "4" || val == "3"){
			$("#is_time_id").show();
			
		}else{
			$("#is_time_id").hide();
			$("#paraMap_IS_TIME_BUCKET").val("0");
			setConnSy("0");
		}
	}
	
	function setConnSy(val){
		if(val == "1"){
			$("#paraMap_CONN_SYMBOL").prop("readOnly","").removeClass("readonly").val("~").siblings("span").text("*");
			//$("#is_show_in_bar_id").show();
		}else{
			$("#paraMap_CONN_SYMBOL").prop("readOnly","readOnly").addClass("readonly").val("").siblings("span").text("");
			//$("#is_show_in_bar_id").hide();
			//$("#paraMap_IS_SHOW_IN_BAR").val("0");
		}
	}
	
	function cfgUI(){//alert(UI_COMP);
		//var url = "${path}rep/cfgUIFrame.ms";
		//showPopWin(url, 750, 450,null," <dict:lang value="UI组件配置"/>","cfgUi");
		var url = "${path}sys/BussModelAction_cfgUICompFrame.ms?paraMap.id=null&paraMap.FORM_ID=null&paraMap.UI_COMP__TYPE=UI_COMP_SEARCH&paraMap.UI_COMP=null";
		showPopWin(url, 750, 450,null," <dict:lang value="UI组件配置"/>","cfgUiIframe");		
	}	
	
	function init(){
		$(".chosen-select").chosen({
			disable_search:true//是否隐藏搜索框
			});
		}
	
	$(function(){
	});

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>