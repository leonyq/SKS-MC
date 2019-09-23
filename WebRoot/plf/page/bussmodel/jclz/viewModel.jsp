<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
	<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<link rel="stylesheet" href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CSS %>" type="text/css" />
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
	<jsp:param name="layui" value="1" />
</jsp:include>
</head>
<body>
	<div class="" style="overflow:hidden;">
		<form id="editForm" class="layui-form" name="editForm"
			action="${path}sys/JClzAction_analyClsCode.ms" method="post"
			target="submitFrame">
			<div id="div_head">
				<table class="add_table">
					<tr>
						<td style="width:50px;">
							<dict:lang value="类适配" />
						</td>
						<td colspan="3" class="widget">
						
							<label
		                    for="codeType_0" class="cursor_hand"><input
		                      type="radio" id="codeType_0" name="paraMap.codeType"
		                      value="CODE_BASE" onclick="loadClsCode(this.value)"  title="BASE"/></label>
		                      
		                    <label for="codeType_1" class="cursor_hand"><input
		                      type="radio" id="codeType_1" name="paraMap.codeType"
		                      value="CODE_ORACLE" onclick="loadClsCode(this.value)"  title="ORACLE"/></label>
		                      
		                    <label for="codeType_2" class="cursor_hand"><input
		                      type="radio" id="codeType_2" name="paraMap.codeType"
		                      value="CODE_SQLSERVER" onclick="loadClsCode(this.value)"  title="SQLSERVER"/></label>
		                      
		                    <label for="codeType_3" class="cursor_hand"><input
		                      type="radio" id="codeType_3" name="paraMap.codeType"
		                      value="CODE_MYSQL" onclick="loadClsCode(this.value)"  title="MYSQL"/></label>
		                      
		                      <label for="codeType_4" class="cursor_hand"><input
		                      type="radio" id="codeType_4" name="paraMap.codeType"
		                      value="CODE_PG" onclick="loadClsCode(this.value)"  title="PG"/></label>
                      
						</td>
					</tr> 
								<%-- <tr>
									<td align="left" width="320px">类适配:&nbsp;<label
										for="codeType_0" class="cursor_hand"><input
											type="radio" id="codeType_0" name="paraMap.codeType"
											value="CODE_BASE" onclick="loadClsCode(this.value)" />BASE</label>
										&nbsp;&nbsp;<label for="codeType_1" class="cursor_hand"><input
											type="radio" id="codeType_1" name="paraMap.codeType"
											value="CODE_ORACLE" onclick="loadClsCode(this.value)" />ORACLE</label>
										&nbsp;&nbsp;<label for="codeType_2" class="cursor_hand"><input
											type="radio" id="codeType_2" name="paraMap.codeType"
											value="CODE_SQLSERVER" onclick="loadClsCode(this.value)" />SQLSERVER</label>
										&nbsp;&nbsp;<label for="codeType_3" class="cursor_hand"><input
											type="radio" id="codeType_3" name="paraMap.codeType"
											value="CODE_MYSQL" onclick="loadClsCode(this.value)" />MYSQL</label>
											
										&nbsp;&nbsp;<label for="codeType_4" class="cursor_hand"><input
										type="radio" id="codeType_4" name="paraMap.codeType"
										value="CODE_PG" onclick="loadClsCode(this.value)" />PG</label>
											
								</tr> 	--%>			
					
				</table>
				<div id="div_code" style="margin-top: 15px;">
					<textarea readOnly id="clsCode__" name="paraMap.clsCode" class="tabIndent code-textarea" wrap="off">
						</textarea>
							
				</div>
			</div>
			<s:hidden id="parentiframeId" name="iframeId"/><!-- 父表单的iframe	-->
			
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

<script type="text/javascript">
	var isNoInit = false;
	var type= "CODE_BASE";
	$("input[type=radio][value="+type+"]").attr("checked",'checked');
	loadClsCode(type);
	function loadClsCode(type){
		if(isNoInit){
			util.showLoading("处理中...");
		}
	  jQuery.ajax({
		type: "POST",
	    dataType: "text",
	    url: "${path}sys/BussModelAction_loadClsCode.ms?",
	    data:{'paraMap.codeType':type,'paraMap.CODE_ID':'<s:property value="paraMap.CODE_ID"/>',"paraMap.tableName":"MS_JCLZ_MODEL","paraMap.relCol":"MS_CLASS_CODE_ID"},
		success: function(data){
				$("#clsCode__").val(data);
				isNoInit = true;
			if(isNoInit){
				util.closeLoading();
			}
			},
			error: function(msg){
				isNoInit = true;
			if(isNoInit){
				util.closeLoading();
			}
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}
	<%-- 设置textarea 自适应高度 --%>
	if (window.navigator.userAgent.indexOf("MSIE") > -1) {
		util.setTextAreaWidth("div_code","clsCode__");
		util.setTextAreaHeight("clsCode__",$("#div_head").height());
		$(window).resize(function () {
			util.setTextAreaWidth("div_code","clsCode__");
			util.setTextAreaHeight("clsCode__",$("#div_head").height());
		});
	} else {
		$("#clsCode__").css({width:"100%"});
	}
	
	layui.use('form', function(){
  	  var form = layui.form;
  	  form.render('radio')
  	});

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>