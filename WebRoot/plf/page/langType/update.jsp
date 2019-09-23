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
			        <button type="button" onclick="update(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="window.parent.closePopWinFp('updateLangFramepop');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			</div>
   </div>
   <div style="height: 250px;">
	<form id="update_form" name="updateForm" action="${path}sys/LangTypeMagAction_updateLangType.ms?&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F5000" method="post" target="submitFrame">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>
	<table class="basic-table" style="text-align: center;">
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种名称" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<s:textfield cssClass="input" name="langTypeDto.languageName" id="languageName" maxlength="100" cssStyle="width: 230px;" onkeyup="javascript:replaceLikeVal2(this)"></s:textfield>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种展示名称" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<s:textfield cssClass="input" name="langTypeDto.languageShowName" id="languageShowName" maxlength="100" cssStyle="width: 230px;"  onkeyup="javascript:replaceLikeVal2(this)"></s:textfield>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种key" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<s:textfield cssClass="input" name="langTypeDto.languageKey" id="languageKey" maxlength="100"   onkeyup="javascript:replaceLikeVal2(this)" cssStyle="width: 230px;" ></s:textfield>
			</td>
       </tr>
         <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="语种代码" /></td>
			<td style="text-align:left;padding-left: 5px;" class="dec">
			<dict:selectDict name="langTypeDto.languageCode" dictValue="%{langTypeDto.languageCode}" style="width: 200px;"   
				cssClass="dept_select" dictCode="LANG_TYPE" 
			 id="langCodeMap" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
			</td>
       </tr>
     </table>
     <s:hidden name="paraMap.iframeId" id="iframeId"></s:hidden>
     <s:hidden name="paraMap.updateId" id="updateId"></s:hidden>
     </form>
   </div>
   
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
</div>

<script type="text/javascript">
	  var  updateId=null;
		var isSubmit=true;
		function replaceLikeVal2(comp){ 
			utilsFp.replaceLikeVal(comp)
			}  
		function replaceLikeVal(comp){ 
			var regx=/[^A-Za-z0-9^_]/g
		    if (comp.value.match(regx)) {  
		    	comp.value=comp.value.replace(/[^A-Za-z0-9^_]/g,'')
		        _alertValMsg(comp,"<dict:lang value="只能输入A-Za-z0-9_" />");
		    }  
		} 	
	$(function(){
  	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val("langFrame");
			}
		}
		
  });
	function update(thisObj){
		var languageKey =document.getElementById("languageKey");
		var languageKeyValue = $("#languageKey").val();
		var languageName = document.getElementById("languageName");
		var languageNameValue = $("#languageName").val();
		var languageShowName =document.getElementById("languageShowName");
		var languageShowNameValue = $("#languageShowName").val();
		var languageCode = document.getElementById("langCodeMap");
		var languageCodeValue = $("#langCodeMap").val();
		if(languageCodeValue=="zh_TW"||languageCodeValue=="zh_CN"||languageCodeValue=="en_US"){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="系统默认语种不可修改" />","","260","145");
			return;
		}
		if(val.isBlank(languageNameValue)){
			_alertValMsg(languageName,"<dict:lang value="语种名称不能为空" />");
			return;
		}
		if(val.isBlank(languageShowNameValue)){
			_alertValMsg(languageShowName,"<dict:lang value="语种展示名称不能为空" />");
			return;
		}
		
		if(val.isBlank(languageKeyValue)){
			_alertValMsg(languageKey,"<dict:lang value="语种key不能为空" />");
			return;
		}
		if(val.isBlank(languageCodeValue)){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="语种代码不能为空" />","","260","145");
			return;
		}
		var regxs=/[A-Za-z0-9^_]/
		checkUpdateOnly(languageCode, 'languageCode');
		if (isSubmit) {
			checkUpdateOnly(languageName, 'languageName');
		}
		if (isSubmit) {
			checkUpdateOnly(languageShowName, 'languageShowName');
		}
		if (isSubmit) {
			checkUpdateOnly(languageKey, 'languageKey');
		}
		
		if (isSubmit) {
			document.forms.update_form.submit();
		}
	}
	
	function checkUpdateOnly(obj, type) {
		updateId=$("#updateId").val();
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : "${path}sys/LangTypeMagAction_queryUpdateOnlyAjax.ms?",
			data : {
				'paraMap.type' : type,
				'paraMap.value' : obj.value,
				'paraMap.id' : updateId
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
				utilsFp.confirmIcon("3", "", "", "", "error:" + msg, "", 320,
						150);
			}

		});
	}
	$(window).on('load', function() {
		setPopScroll('.scroll')
	})
</script>


</body>
<%@ include file="/plf/common/pub_end.jsp" %>