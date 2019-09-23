<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
</jsp:include>
</head>
<body>
	<div class="all">
		<form id="editForm" name="editForm"
			action="${path}sys/websJobMagAction_editCode.ms" method="post"
			target="submitFrame">
			<div id="div_head">
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<table width="100%">
								<tr>
									<td align="left" width="320px">类适配:&nbsp;<label
										for="codeType_0" class="cursor_hand"><input
											type="radio" checked="checked" id="codeType_0" name="paraMap.CODE_TYPE"
											value="CODE_BASE"  onclick="loadClsCode(this.value)" />BASE</label>
										&nbsp;&nbsp;<label for="codeType_1" class="cursor_hand"><input
											type="radio" id="codeType_1" name="paraMap.CODE_TYPE"
											value="CODE_ORACLE"  onclick="loadClsCode(this.value)"/>ORACLE</label>
										&nbsp;&nbsp;<label for="codeType_2" class="cursor_hand"><input
											type="radio" id="codeType_2" name="paraMap.CODE_TYPE"
											value="CODE_SQLSERVER" onclick="loadClsCode(this.value)" />SQLSERVER</label>
										&nbsp;&nbsp;<label for="codeType_3" class="cursor_hand"><input
											type="radio" id="codeType_3" name="paraMap.CODE_TYPE"
											value="CODE_MYSQL"  onclick="loadClsCode(this.value)"/>MYSQL</label>
											<input
											type="radio" id="codeType_4" name="paraMap.CODE_TYPE"
											value="CODE_PG"  onclick="loadClsCode(this.value)"/>POSTGRESQL</label>
										<%-- 如果新增了支持的数据库类型，则这里需要新增 --%></td>
									<td width="60px">类全名</td>
									<td>
										<input type="text" id="className" name="paraMap.CLASS_NAME" value="<s:property value="paraMap.CLASS_NAME"/>"style="width:99%;" />
									</td>
									<td width="220px">
										<input type="reset" value="<dict:lang value='取消' />" onclick="parent.closePopWin();" class="botton_img_search" />
										<input type="button" id="submitBut" value="<dict:lang value='保存' />" onclick="edit(this);" class="botton_img_add" /> 
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<div>
				<div id="div_code">
					<textarea id="clsCode" name="paraMap.clsCode" class="tabIndent"
						wrap="off" style="word-wrap: normal; width: 100%;height: 364px;"></textarea>
				</div>
			</div>
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
	var isSubmit=false;
	function edit(thisObj) {
		var className = document.getElementById("className");
	   	if(val.isBlank(className)){
	   		_alertValMsg(className,"类全名 -- 不能为空");
	   		return false;
		}
	   	var checkRadioVal =$("input[name='paraMap.CODE_TYPE']").filter(':checked').val();
	   	var classCode = $("#clsCode").val();
	   	if(val.isBlank(classCode)){
	   		util.alert("类的内容 -- 不能为空");
	   		return false;
	   	}
	   	analyClsCode(checkRadioVal);
	   	if(!isSubmit){
	   		return false;
	   	}
	   	parent.updateCodeData(checkRadioVal, className.value, classCode);
	   	parent.closePopWin();
	}

	function init() {//初始化
		util.reloadTabKey($("#serviceCode"));
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#serviceCode").css({height:winWh - divHeadH - 15});
		//类名称文本框长度
		if($("#className").width()<100){
			$("#className").css({width:100});
		}
		var autoWrite = parent.document.getElementById("paraClsCode").value;
		if(autoWrite==""){
			loadClsCode(null);
		}
	}
	//异步解析类源码
	function analyClsCode(obj){
		var clsCode=$("#clsCode").val();
	  	$.ajax({
		type: "POST",
	    dataType: "json",
	    async:false,
	    url: "${path}sys/websJobMagAction_analyClsCode.ms?",
	    data:{'paraMap.clsCode':clsCode},
			success: function(data){
				if(data.ajaxMap.status=="false"){
					isSubmit=false;
					util.alert(data.ajaxMap.info);
				}else{
					isSubmit=true;
					util.alert(data.ajaxMap.info);
				}
			},
			error: function(msg){
					util.closeLoading();
					util.alert("error:"+msg);
			}
		});
	}
	
	//异步加载类源码
	function loadClsCode(obj){
		var codeId=null;
		var paraCodeId=parent.document.getElementById("paraCodeId").value;
		/* if(paraCodeId==null||paraCodeId==""){
			return;
		}else{
			codeId=paraCodeId;
		} */
		codeId=paraCodeId;
		util.showLoading("处理中...");
	  	jQuery.ajax({
		type: "POST",
	    dataType: "text",
	    url: "${path}sys/BussModelAction_loadClsCode.ms",
	    data:{"paraMap.codeType":obj,"paraMap.CODE_ID":codeId,"paraMap.tpl":"autoParam","paraMap.tableName":"MS_JOB_WEBS","paraMap.relCol":"PARA_CODE_ID"},
		success: function(data){
				$("#clsCode").val(data);
				util.closeLoading();
			},
			error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
				thisObj.disabled = false;
		   }
		});
	}
	<%-- 设置textarea 自适应高度 --%>
	if (window.navigator.userAgent.indexOf("MSIE") > -1) {
		util.setTextAreaWidth("div_code","serviceCode");
		util.setTextAreaHeight("serviceCode",$("#div_head").height());
		$(window).resize(function () {
			util.setTextAreaWidth("div_code","serviceCode");
			util.setTextAreaHeight("serviceCode",$("#div_head").height());
		});
	} else {
		$("#serviceCode").css({width:"100%"});
	}

	
	$(function() {
		var className=null;
		className=parent.document.getElementById("paraCodeName").value;
		clsCode=parent.document.getElementById("paraClsCode").value;
		codeType=parent.document.getElementById("paraCodeType").value;
		$("#clsCode").val(clsCode);
		if(codeType!=null){
			$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
		}
		$("#className").val(className);
	});
</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>