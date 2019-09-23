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
			<div style="margin-left:10px;margin-top: -35px;">
				<div class="save-close" title="<dict:lang value='保存并关闭窗口' />" onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
				
			</div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			</div>
			<div style="height: 212px;overflow:auto;" class="scroll">
	<form id="add_form" name="addForm" action="${path}comm/CacheAction_addLangFileAx.ms?&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F5000" method="post" target="submitFrame">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<s:property value='iframeId'/>"/>
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>
	<table class="basic-table" style="text-align: center;">
		 <tr>
				<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="属性名称" />(KEY)</td>
				<td style="text-align:left;padding-left: 5px;">
					<input class="input"  id="messageKey" maxlength="125" style="width: 230px;" onchange="codeJSFun(this)"/>
					<input type="hidden" name="paraMap.messageKey" />
				</td>
	       </tr>
		<s:iterator id="key" value="keyList" status="index">
		<tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="${key}" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input class="input"  id="col${index.count}" maxlength="125" style="width: 230px;" onchange="codeJSFun(this)"/>
				<input type="hidden" name="paraMap.col${index.count}" />
			</td>
			 </tr>
		</s:iterator>
     </table>
     <s:hidden name="paraMap._langKeyColNum_"></s:hidden>
     </form>
   </div>
   
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
</div>

<script type="text/javascript">
	  function codeJSFun(objThis){
  		var langs = _mcBase64JsToJava.getMcDealBase64Encode(objThis.value);  
  		 $(objThis).next().val(langs);
  		}
  		
	$(function(){
  	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
  });
	function replaceLikeVal(comp){  
		utilsFp.replaceLikeVal(comp)
    } 
	function add(thisObj){
		var messageKey = $("#messageKey").val();
		
		var delstr=_mcBase64JsToJava.getMcDealBase64Encode(messageKey);
		
		var messageKeys = document.getElementById("messageKey");
		if (""!=messageKey&&null!=messageKey&&messageKey) {
			if ($("#isCloseWin").attr("checked")) {
				$("#isCloseWin_s").val("0");
			}else{
				$("#isCloseWin_s").val("1");
			}
			$.ajax({
					type: "POST",
				    dataType: "json",
				    url: "${path}comm/CacheAction_langFileKeyVal.ms",
				    data: {'paraMap.flag':'add','paraMap.messageKey':delstr},
					success: function(data){
							if(null == data){
							return ;}
							if(null != data.ajaxCacheDto){
								if (data.ajaxCacheDto.result) {
									_alertValMsg(messageKeys,data.ajaxCacheDto.msg);
					    			return false;
							}else{
								document.forms.add_form.submit();
							}
								}
								
					},
						error: function(msg){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					  }	
					});
		}else{
			_alertValMsg(messageKeys,"<dict:lang value="属性名称不能为空" />");
		}
			
	}
	$(window).on('load',function(){
		setPopScroll('.scroll')
	})
</script>


</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>