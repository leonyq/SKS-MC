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
	<jsp:param name="layui" value="1" />
</jsp:include>
</head>
<body>
	<div class="">
		<form id="editForm" class="layui-form" name="editForm"
			 method="post"
			target="submitFrame">
			<div id="div_head">
				<table class="add_table"><%--func_table onclick="loadClsCode(this.value)"--%>
				
					<tr>
						<td style="width:50px;">
							
							<dict:lang value="类适配" />
						</td>
						<td colspan="3" class="widget">
						
							<label
		                    for="codeType_0" class="cursor_hand"><input
		                      type="radio" id="codeType_0" name="paraMap.CODE_TYPE"
		                      value="CODE_BASE"  onclick="loadClsCode(this.value)" title="BASE"/></label>
		                      
		                    <label for="codeType_1" class="cursor_hand"><input
		                      type="radio" id="codeType_1" name="paraMap.CODE_TYPE"
		                      value="CODE_ORACLE" onclick="loadClsCode(this.value)"  title="ORACLE"/></label>
		                      
		                    <label for="codeType_2" class="cursor_hand"><input
		                      type="radio" id="codeType_2" name="paraMap.CODE_TYPE"
		                      value="CODE_SQLSERVER" onclick="loadClsCode(this.value)"  title="SQLSERVER"/></label>
		                      
		                    <label for="codeType_3" class="cursor_hand"><input
		                      type="radio" id="codeType_3" name="paraMap.CODE_TYPE"
		                      value="CODE_MYSQL" onclick="loadClsCode(this.value)" title="MYSQL"/></label>
		                      
		                      <label for="codeType_4" class="cursor_hand"><input
		                      type="radio" id="codeType_4" name="paraMap.CODE_TYPE"
		                      value="CODE_PG" onclick="loadClsCode(this.value)"  title="PG"/></label>
                      
						</td>
					</tr>
					<tr>
						<td class="title">
							<dict:lang value="类全名" />
						</td>
						<td colspan="3" class="widget">
						
							 <input  readonly="readonly" type="text" id="className1" name="paraMap.CLASS_NAME" class="input_sh" value="<s:property value="dataMap.CLASS_NAME"/>"style="width:99%;" />
                      
						</td>
						

					</tr> 
					
					 <%-- 
								<tr>
									<td align="left" width="320px">类适配:&nbsp;<label
										for="codeType_0" class="cursor_hand"><input
											type="radio" id="codeType_0" name="paraMap.CODE_TYPE"
											value="CODE_BASE" onclick="loadClsCode(this.value)" />BASE</label>
										&nbsp;&nbsp;<label for="codeType_1" class="cursor_hand"><input
											type="radio" id="codeType_1" name="paraMap.CODE_TYPE"
											value="CODE_ORACLE" onclick="loadClsCode(this.value)" />ORACLE</label>
										&nbsp;&nbsp;<label for="codeType_2" class="cursor_hand"><input
											type="radio" id="codeType_2" name="paraMap.CODE_TYPE"
											value="CODE_SQLSERVER" onclick="loadClsCode(this.value)" />SQLSERVER</label>
										&nbsp;&nbsp;<label for="codeType_3" class="cursor_hand"><input
											type="radio" id="codeType_3" name="paraMap.CODE_TYPE"
											value="CODE_MYSQL" onclick="loadClsCode(this.value)" />MYSQL</label><input
											type="radio" id="codeType_3" name="paraMap.CODE_TYPE"
											value="CODE_PG" onclick="loadClsCode(this.value)" />PG</label>
										<%-- 如果新增了支持的数据库类型，则这里需要新增 </td>
									<td width="60px">类全名</td>
									<td>
										<input  readonly="readonly" type="text" id="className1" name="paraMap.CLASS_NAME" class="input_sh" value="<s:property value="dataMap.CLASS_NAME"/>"style="width:99%;" />
									</td>
								</tr>
							--%>
				</table>
			</div>
			<br/>
			<div>			
				<div id="div_code">
					<textarea id="serviceCode" readonly="readonly" name="paraMap.serviceCode" class="tabIndent" wrap="off" style="word-wrap: normal; width: 600px;height: 500px;"></textarea>
				</div>
				<div id="div_code_preview"></div>
			</div>
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
	
	function init() {
		util.reloadTabKey($("#serviceCode"));
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#serviceCode").css({height:winWh - divHeadH - 40});
		
		//类名称文本框长度
		if($("#className1").width()<100){
			$("#className1").css({width:100});
		}
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
	layui.use('form',function(){
        var form = layui.form;
        form.render("radio");
	});
	var piframeName = '<s:property value="paraMap.piframeName"/>';
	var pIframe = top.window.frames[piframeName];
	$(function() {
		
		var codeType = pIframe.document.getElementById("codeType").value;
		if(codeType == ""){
			codeType = "CODE_BASE";
		}
		$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
		var classCode = pIframe.document.getElementById("classCode").value;
		var className1 = pIframe.document.getElementById("className").value;
		$("#className1").val(className1);
		$("#serviceCode").text(classCode);
	});
	var isNoInit = false;
	function loadClsCode(type){
		var id = pIframe.document.getElementById("serverSourceId").value;
		_codeType = type;
		if(isNoInit){
			util.showLoading("处理中...");
		}
	  jQuery.ajax({
		type: "POST",
	    dataType: "text",
	    url: "${path}sys/BussModelAction_loadClsCode.ms?",
	    data:{
	    	"paraMap.codeType":type,
	    	"paraMap.CODE_ID":id,
	    	"paraMap.tableName":"MS_HTTP_SERVER_MANAGER",
	    	"paraMap.relCol":"SERVER_SOURCE_ID"
	    	},
		success: function(data){
				$("#serviceCode").val(data);
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
</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>