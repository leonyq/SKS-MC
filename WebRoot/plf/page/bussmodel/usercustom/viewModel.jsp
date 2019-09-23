<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
	<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<link rel="stylesheet" 
href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>" type="text/css" />
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
	<jsp:param name="layui" value="1" />
</jsp:include>
</head>
<body>
	<div >
		<div  class="add_table_div">
		<form id="editForm" class="layui-form" name="editForm"
			action="${path}sys/UserCustomAction_analyClsCode.ms" method="post"
			target="submitFrame">
			<div id="div_head">
				<table class="func_table view-code">
					<tr>
						<td class="widget">
										<span class="view-code-name"> <dict:lang value="类适配" /> </span>
										<label
										for="codeType_0" class="cursor_hand"><input
											type="radio" id="codeType_0" name="paraMap.codeType"
											value="CODE_BASE" onclick="loadClsCode(this.value)" title="BASE" style="margin-top:0px;"/></label>
											
										<label for="codeType_1" class="cursor_hand"><input
											type="radio" id="codeType_1" name="paraMap.codeType"
											value="CODE_ORACLE" onclick="loadClsCode(this.value)" title="ORACLE" style="margin-top:0px;"/></label>
											
										<label for="codeType_2" class="cursor_hand"><input
											type="radio" id="codeType_2" name="paraMap.codeType"
											value="CODE_SQLSERVER" onclick="loadClsCode(this.value)" title="SQLSERVER" style="margin-top:0px;"/></label>
											
										<label for="codeType_3" class="cursor_hand"><input
											type="radio" id="codeType_3" name="paraMap.codeType"
											value="CODE_MYSQL" onclick="loadClsCode(this.value)" title="MYSQL" style="margin-top:0px;"/></label>
											
										<label for="codeType_4" class="cursor_hand"><input
										type="radio" id="codeType_4" name="paraMap.codeType"
										value="CODE_PG" onclick="loadClsCode(this.value)" title="PG" style="margin-top:0px;"/></label>
						 </td>				
					</tr>
				</table>
				<div id="div_code">
					<textarea readOnly id="clsCode__" name="paraMap.clsCode" class="tabIndent code-textarea" wrap="off"></textarea>
							
				</div>
			</div>
			<s:hidden id="parentiframeId" name="iframeId"/><!-- 父表单的iframe	-->
			
		</form>
		</div>
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
	    data:{"paraMap.codeType":type,"paraMap.CODE_ID":"<s:property value="paraMap.CODE_ID"/>","paraMap.tableName":"MS_COMM_CLASS","paraMap.relCol":"MS_CLASS_CODE_ID"},
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
		var textAreaHei = $(window).height()-70+'px';
		$("#clsCode__").css({width:"100%"});
		$("#clsCode__").css({height:textAreaHei});
	}
	
	//设置textarea的高度
	
	layui.use('form', function(){
    	  var form = layui.form;
    	  //监听提交
    	  form.on('radio(radioChange)', function(data){
    		  var val = data.value;
    		  
          	form.render("select");
    	  });

    });

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>