<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="多语言新增" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
	<div style="background-color: white;margin-top: 37px;">
		<div class="hd" style="height:0;">
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="window.parent.closePopWinFp('addLangFramepop');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			</div>
			<div style="height: 250px;overflow:auto;" class="scroll">
	<form id="add_form" name="addForm" action="${path}sys/LangTypeMagAction_addLangType.ms" method="post" target="submitFrame">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<c:out value='${iframeId}'/>"/>
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>
	<table class="basic-table" style="text-align: center;">
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种名称" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input class="input" name="langTypeDto.languageName" id="languageName" maxlength="50" style="width: 230px;"onkeyup="javascript:replaceLikeVal2(this)"/>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种英文名称" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input class="input" name="langTypeDto.languageEnName" id="languageEnName" maxlength="50" style="width: 230px;"   onkeyup="javascript:replaceLikeVal1(this)">
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种展示名称" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input class="input" name="langTypeDto.languageShowName" id="languageShowName" maxlength="50" style="width: 230px;" onkeyup="javascript:replaceLikeVal2(this)"/>
			</td>
       </tr>
         <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种key" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input class="input" name="langTypeDto.languageKey" id="languageKey" maxlength="50"  onkeyup="javascript:replaceLikeVal2(this)" style="width: 230px;"/>
			</td>
       </tr>
       <tr style="height:35px;">
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种代码" /></td>
			<td style="text-align:left;padding-left: 5px;" class="dec">
				<dict:selectDict name="langTypeDto.languageCode" dictValue="%{langTypeDto.languageCode}" style="width: 230px;" 
				cssClass="dept_select" dictCode="LANG_TYPE" 
			 id="langCodeMap" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
			</td>
			</td>
       	</tr>
     </table>
     <s:hidden name="paraMap.iframeId" id="iframeId"></s:hidden>
     </form>
   </div>
   
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
</div>

<script type="text/javascript">
function replaceLikeVal(comp){ 
	var regx=/[^A-Za-z0-9^_]/g
    if (comp.value.match(regx)) {  
    	comp.value=comp.value.replace(/[^A-Za-z0-9^_]/g,'')
        _alertValMsg(comp,"<dict:lang value="只能输入A-Za-z0-9_" />");
    }  
}  
function replaceLikeVal1(comp){ 
	var regx=/[^A-Z]/g
    if (comp.value.match(regx)) {  
    	comp.value=comp.value.replace(/[^A-Z]/g,'')
        _alertValMsg(comp,"<dict:lang value="只能输入A-Z" />");
    }  
}  
function replaceLikeVal2(comp){ 
	utilsFp.replaceLikeVal(comp)
	}  
	var isSubmit=true;
	$(function(){
  	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
  });
	function add(thisObj){
		var languageName = document.getElementById("languageName");
		var languageNameValue = $("#languageName").val();
		var languageEnName =document.getElementById("languageEnName");
		var languageEnNameValue = $("#languageEnName").val();
		var languageShowName =document.getElementById("languageShowName");
		var languageShowNameValue = $("#languageShowName").val();
		var languageCode = document.getElementById("langCodeMap");
		var languageCodeValue = $("#langCodeMap").val();
		var languageKey = document.getElementById("languageKey");
		var languageKeyValue = $("#languageKey").val();
		if(val.isBlank(languageNameValue)){
			_alertValMsg(languageName,"<dict:lang value="语种名称不能为空" />");
			return;
		}
		if(val.isBlank(languageEnNameValue)){
			_alertValMsg(languageEnName,"<dict:lang value="语种英文名称不能为空" />");
			return;
		}
		
		var regx=/[A-Z]/
		if(!languageEnNameValue.match(regx)){
			_alertValMsg(languageEnName,"<dict:lang value="语种英文名称必须为大写英文字母" />");
			return;	
		}
		
		if(val.isBlank(languageShowNameValue)){
			_alertValMsg(languageShowName,"<dict:lang value="语种展示名称不能为空" />");
			return;
		}
		var regxs=/[A-Za-z0-9^_]/
		if(val.isBlank(languageKeyValue)){
			_alertValMsg(languageKey,"<dict:lang value="语种key不能为空" />");
			return;
		}
		if(val.isBlank(languageCodeValue)){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="语种代码不能为空" />","","260","145");
			return;
		}
		checkOnly(languageCode, 'languageCode');
		if (isSubmit) {
			checkOnly(languageEnName, 'languageEnName');
		}
		if (isSubmit) {
			checkOnly(languageShowName, 'languageShowName');
		}
		if (isSubmit) {
			checkOnly(languageKey, 'languageKey');
		}
		if (isSubmit) {
			checkOnly(languageName, 'languageName');
		}
		if (isSubmit) {
			document.forms.add_form.submit();
		}
	}
	function checkOnly(obj, type) {
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : "${path}sys/LangTypeMagAction_queryOnlyAjax.ms?",
			data : {
				'paraMap.type' : type,
				'paraMap.value' : obj.value
			},
			success : function(data) {
				if (data.ajaxMap.status == "false") {
					isSubmit = false;
					if(type=='languageCode'){
					utilsFp.confirmIcon(3,"","","", data.ajaxMap.info,"","260","145");
					}else{
						_alertValMsg(obj, data.ajaxMap.info);
					}
				} else {
					isSubmit = true;
				}
			},
			error : function(msg) {
				isNoInit = true;

				if (isNoInit) {
					util.closeLoading();
				}
			}

		});
	}
	$(window).on('load', function() {
		setPopScroll('.scroll')
	})
</script>


</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>