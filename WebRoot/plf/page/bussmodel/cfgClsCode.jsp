<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" />
</title>

<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ace" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
	
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="layui" value="1" />
	
</jsp:include>
<style>
html,body{
	height:99%;
}
</style>
</head>

<body>
	<div class="all">
		<div class="add_table_div">
		
		
		
		<form id="editForm" class="layui-form" name="editForm"
			action="${path}sys/BussModelAction_editClsCode.ms" method="post"
			target="submitFrame">
			<input type="hidden" id="clsCode__" name="paraMap.clsCode"  />
			<input type="hidden" id="module" name="module" value="<c:out value='${module}' />"  />
			<input type="hidden" name="paraMap.EditState" id="paraMap_EditState" value="<c:out value='${paraMap.EditState }' />"/>
			<div id="div_head">

				<table class="add_table">
					<tr>
						<td style="width:50px;">
							<dict:lang value="类适配" />
						</td>
						<td colspan="3" class="widget" style="width:450px;">
						
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
						

					
					
					
						<td style="width:50px;">
							<dict:lang value="类全名" />
						</td>
						<td colspan="3" class="widget">
						
							 <input type="text" id="paraMap_CLASS_NAME"
		                    name="paraMap.CLASS_NAME" title="<dict:lang value="多数据库支持占位符" />\${db.dialect}" <%-- 这里的EL表达式是字符串 --%>
		                   lay-verify="required"
		                    value="<s:property value="dataMap.CLASS_NAME"/>"
		                    style="width:420px;" />
                      
						</td>
						

					</tr> 
					
				</table></br>
			</div>

			<div sytyle="margin-top:10px;">
				<input type="hidden" name="paraMap.ifunc"
					value="<s:property value="paraMap.ifunc" />" /> <input
					type="hidden" name="paraMap.tpl"
					value="<s:property value="paraMap.tpl" />" /> <input type="hidden"
					id="_pageID" name="paraMap._pageID"
					value="<s:property value="paraMap._pageID" />" /> <input
					type="hidden" name="paraMap.CLASS_NAME_TEXT_ID"
					value="<s:property value="paraMap.CLASS_NAME_TEXT_ID" />" /> <input
					type="hidden" name="paraMap.OWNER_ID"
					value="<s:property value="paraMap.OWNER_ID" />" /> <input
					type="hidden" name="paraMap.CODE_ID"
					value="<s:property value="paraMap.CODE_ID" />" /> <input
					type="hidden" name="paraMap.OWNER_TYPE"
					value="<s:property value="paraMap.OWNER_TYPE" />" /> <input
					type="hidden" name="paraMap.tableName"
					value="<s:property value="paraMap.tableName" />" /> <input
					type="hidden" name="paraMap.colName"
					value="<s:property value="paraMap.colName" />" /> <input
					type="hidden" name="exeid"
					value="<s:property value="paraMap.ID" />" /><input
					type="hidden" name="paraMap.MC_ID_MYSQL"
					value="<s:property value="dataMap.MC_ID_MYSQL" />" /><input
					type="hidden" name="paraMap.MC_ID_SQLSERVER"
					value="<s:property value="dataMap.MC_ID_SQLSERVER" />" /><input
					type="hidden" name="paraMap.MC_ID_ORACLE"
					value="<s:property value="dataMap.MC_ID_ORACLE" />" /><input
					type="hidden" name="paraMap.MC_ID_BASE"
					value="<s:property value="dataMap.MC_ID_BASE" />" />
					
					<input
					type="hidden" name="paraMap.MC_ID_PG"
					value="<s:property value="dataMap.MC_ID_PG" />" />
					
					<input type="hidden" id="DATABASETYPE" name="paraMap.DATABASETYPE" /><input
					type="hidden" id="echarts" name="paraMap.echarts" value="<s:property value="paraMap.echarts" />"/>
					<input type="hidden" id="TrigNo" name="paraMap.TrigNo" value="<s:property value="paraMap.TrigNo" />" />
				<div id="div_code">
					<pre id="ace_code" class="ace_editor"></pre>
				</div>
				<div id="div_code_preview"></div>
			</div>
			
			<div class="ptop_10 txac">			
					<!--  
					<button  style="margin:2px 2px  ;" class="layui-btn" onclick="closePopWin();">取消</button>
							
					<input style="margin:2px 2px  ;" type="button" id="submitBut" value="<dict:lang value='提交' />" onclick="edit(this);" class="layui-btn">
							
					<s:if test="@com.more.fw.core.common.method.StringUtilsMc@isNotBlank(paraMap.CODE_ID)">
								
						<button  style="margin:2px 2px  ;" class="layui-btn" onclick="del(this);">删除</button>
					</s:if>	
					-->
					
					<button class="layui-btn" lay-filter="filterSubmit" id="submitBut" lay-submit="formSubmit">提交</button>
					
					<input type="button" value="<dict:lang value="取消" />"  onclick="closePopWin();" class="layui-btn layui-btn-danger">
					<input type="button" class="layui-btn"  onclick="validateIsCurrentDebug()" value="调试">
					<s:if test="@com.more.fw.core.common.method.StringUtilsMc@isNotBlank(paraMap.CODE_ID)">
						<input type="button" value="<dict:lang value="删除" />" id="del_but" onclick="del(this);" class="layui-btn layui-btn-danger">
					</s:if>
					
				</div>
		</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script>
		//初始化ace对象
		editor = ace.edit("ace_code");
		//设置风格和语言（更多风格和语言，请到github上相应目录查看）
		theme = "idle_fingers"//clouds
		language = "java"
		editor.setTheme("ace/theme/" + theme);
		editor.session.setMode("ace/mode/" + language);
		//字体大小
		editor.setFontSize(14);
		//设置只读（true时只读，用于展示代码）
		editor.setReadOnly(false);
		//自动换行,设置为off关闭
		editor.setOption("wrap", "off")
		//启用提示菜单
		ace.require("ace/ext/language_tools");
		editor.setOptions({
			enableBasicAutocompletion : true,
			enableSnippets : true,
			enableLiveAutocompletion : true
		});
		window.onbeforeunload = function(){
			closeDebugPage();
		}
	</script>


	<script type="text/javascript">
	var flag=false;
		function alertInfo(msg) {
			isSubmit = false;
			util.alert(msg);
		}

		function reloadPg(msg) {
			isSubmit = false;
			top.util.alert(msg, reloadPgExe);
		}
		var piframeName = '<s:property value="paraMap.piframeName"/>';
		var pIframe = top.window.frames[piframeName];
		var toFlag = '<s:property value="paraMap.toFlag"/>';

		function reloadPgExe(msg) {
			if(toFlag=="classManage"){ //业务模型---类管理
				pIframe.updateCLASS_NAME_TEXT(
					"<s:property value="paraMap.CLASS_NAME_TEXT_ID" />", $(
							"#paraMap_CLASS_NAME").val(),flag);
			}else if(toFlag=="form"){
				var mcIframeName="${mcIframeName}";
				var obj={"mcIframeName":mcIframeName,"type":"window"};
				getSrcByIframeName(obj).updateCLASS_NAME_TEXT(
						"<s:property value="paraMap.CLASS_NAME_TEXT_ID" />", $(
								"#paraMap_CLASS_NAME").val());
								
			}else if(toFlag=="dataform"){
				var mcIframeName='${mcIframeName}';
				var curIframeName=window.frameElement.name
				//修改父页面值
				var obj={"mcIframeName":mcIframeName,"type":"window"};
				getSrcByIframeName(obj).updateCLASS_NAME_TEXT(
						"<s:property value="paraMap.CLASS_NAME_TEXT_ID" />", $(
								"#paraMap_CLASS_NAME").val(),curIframeName,mcIframeName,'${listIframeName}');
								
			}else{
				var mcIframeName='${mcIframeName}';
				var curIframeName=window.frameElement.name
				//修改父页面值
				var obj={"isFramesetMethod":false,"type":"window"};
				getSrcDom(obj).updateCLASS_NAME_TEXT(
						"<s:property value="paraMap.CLASS_NAME_TEXT_ID" />", $(
								"#paraMap_CLASS_NAME").val(),curIframeName,mcIframeName,'${listIframeName}');
			}
			document.forms.editForm.action = "${path}sys/BussModelAction_cfgClsCode.ms";
			document.forms.editForm.submit();
			//window.location.href = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CLASS_NAME_TEXT_ID=<s:property value="paraMap.CLASS_NAME_TEXT_ID" />&paraMap.CODE_ID=<s:property value="paraMap.CODE_ID" />&paraMap.OWNER_ID=<s:property value="paraMap.OWNER_ID" />&paraMap.OWNER_TYPE=<s:property value="paraMap.OWNER_TYPE" />&paraMap.codeType="+_codeType+"";
		}

		var isSubmit = false;

		//Z:检验类源码非空
		function isBlankClsCode() {
			var clsCode = document.getElementById("clsCode__");
			if (val.isBlank(clsCode)) {
				//_alertValMsg(clsCode,"类源码 -- 不能为空");
				alert("类源码 -- 不能为空");
				return true;
			}
			if(toFlag=="classManage"){ //业务模型---类管理
				pIframe.idatas = pIframe.idatas || [];
				pIframe.idatas["clsCode"] = clsCode.value;
			}else{
				window.parent.idatas = window.parent.idatas || [];
				window.parent.idatas["clsCode"] = clsCode.value;
			}
			return false;
		}

		//指定页面id
		$("#_pageID").val(new Date().getTime());

		function edit(thisObj) {
			var paraMap_CLASS_NAME = document
					.getElementById("paraMap_CLASS_NAME");
			$("#clsCode__").val(editor.getValue());
			if (val.isBlank(paraMap_CLASS_NAME)) {
				//_alertValMsg(paraMap_CLASS_NAME, "类全名 -- 不能为空");
				return false;
			}

			if (isBlankClsCode())
				return false;
			if (isSubmit) {
				//util.alert("<dict:lang value="数据正在提交，请稍候" />...");
			}
			if($("#echarts").val()!=""){
				dynamicsClsCode(successCallBackFun,errorCallBackFun);
			}else{
				//document.forms.editForm.submit();
				return true;
			}
			
			isSubmit = true;
		}

		function del(thisObj) {
			util.confirm(delConfirm);
		}

		function delConfirm() {
			document.forms.editForm.action = "${path}sys/BussModelAction_delRelClsCode.ms";
			flag=true;
			document.forms.editForm.submit();
		}

		var isNoInit = false;
		var _codeType = "<s:property value="paraMap.codeType" />";
		function loadClsCode(type) {
			$("#DATABASETYPE").val(type);
			_codeType = type;
			if (isNoInit) {
				util.showLoading("处理中...");
			}
			jQuery
					.ajax({
						type : "POST",
						dataType : "text",
						url : "${path}sys/BussModelAction_loadClsCode.ms?",
						data : {
							'paraMap.codeType' : type,
							'paraMap.CODE_ID' : '<s:property value="paraMap.CODE_ID"/>',
							'paraMap.CODE_TYPE' : '<s:property value="paraMap.CODE_TYPE"/>',
							'paraMap.tpl' : '<s:property value="paraMap.tpl"/>',
							'paraMap.tableName' : '<s:property value="paraMap.tableName"/>',
							'paraMap.relCol' : '<s:property value="paraMap.colName"/>',
							'paraMap.xmlForPackge' : '<s:property value="paraMap.xmlForPackge"/>',
							'paraMap.xmlForClassName' : '<s:property value="paraMap.xmlForClassName"/>'
						},
						success : function(data) {
							$("#clsCode__").val(data);
							editor.setValue(data);
							isNoInit = true;
							if (isNoInit) {
								util.closeLoading();
							}
						},
						error : function(msg) {
							isNoInit = true;
							if (isNoInit) {
								util.closeLoading();
							}
							util.alert("error:无权限访问" );
							thisObj.disabled = false;
							thisObj.value = oldValue;
						}
					});
		}

		function init() {
			util.reloadTabKey($("#ace_code"));
			
			var docWh = $(document).height();
			var divHeadH = $("#div_head").height();
			var winWh = $(window).height();
			
			$("#ace_code").css({
				height : winWh - divHeadH - 81
			});
	<%-- 设置页面保存的执键 --%>
		setHotKey(83);
			setHotKeyAct(document.getElementById("submitBut"));
			if (_codeType == "") {
				_codeType = "CODE_BASE";
			}
			$("input[type=radio][value=" + _codeType + "]").attr("checked",
					'checked');
			if(toFlag=="classManage"){
				if($("#TrigNo").val()=="TrigNo"&&pIframe.document.getElementById("preAceCode").value!=""){
					//任务管理类修改失败后回填 不能重新加载类源码 要回填上次的类信息
				}else{
					loadClsCode(_codeType);
				}
			}else{
				if($("#TrigNo").val()=="TrigNo"&&parent.document.getElementById("preAceCode").value!=""){
					//任务管理类修改失败后回填 不能重新加载类源码 要回填上次的类信息
				}else{
					loadClsCode(_codeType);
				}
			}
			$("#DATABASETYPE").val(_codeType);
			$("#clsCode__").show();
			//类名称文本框长度
			if ($("#paraMap_CLASS_NAME").width() < 100) {
				$("#paraMap_CLASS_NAME").css({
					width : 100
				});
			}
		}
	<%-- 设置textarea 自适应高度 --%>
		if (window.navigator.userAgent.indexOf("MSIE") > -1) {
			util.setTextAreaWidth("div_code", "clsCode__");
			util.setTextAreaHeight("clsCode__", $("#div_head").height());
			$(window).resize(function() {
				util.setTextAreaWidth("div_code", "clsCode__");
				util.setTextAreaHeight("clsCode__", $("#div_head").height());
			});
		} else {
			$("#clsCode__").css({
				width : "100%"
			});
		}

		function writeback(msg,mark) {
			top.util.alert(msg);
			if(toFlag=="classManage"){
				pIframe.writebackClassName($("#paraMap_CLASS_NAME").val());
				pIframe.writebackClassCode($("#clsCode__").val(),mark);
				
				
				$("#paraMap_codeType", pIframe.document).val(_codeType);
				 //pIframe.hidePopWin(true,"popupFrameId");
				 closePopWin();
			}else{
				window.parent.writebackClassName($("#paraMap_CLASS_NAME").val());
				window.parent.writebackClassCode($("#clsCode__").val(),mark);
				
				
				$("#paraMap_codeType", window.parent.document).val(_codeType);
				 window.parent.hidePopWin(true,"popupFrameId");
			}
		}
		
		$(
		  function (){
			if(toFlag=="classManage"){
				$("#mcIframeName").val(piframeName);
				if($("#paraMap_EditState").val()=="20"){//页面之间转值
					$("#paraMap_CLASS_NAME").val($("#MS_CLASS_CODE_ID", pIframe.document).val());
					editor.setValue($("#preAceCode", pIframe.document).val());
					 
				 }
			}else{
				if($("#paraMap_EditState").val()=="20"){//页面之间转值
		        $("#paraMap_CLASS_NAME").val($("#MS_CLASS_CODE_ID", window.parent.document).val());
		        editor.setValue($("#preAceCode", window.parent.document).val());
		         
				}
			}
		    
		  }
		);
		
		function dynamicsClsCode(successCallBackFun,errorCallBackFun){
        $.ajax({
		    type: "POST",
	        dataType: "json",
	        url: "${path}sys/BussModelAction_editClsCode.ms",
	        data:$("#editForm").serialize(),
		    success:successCallBackFun,
		    error:errorCallBackFun
		});
	}
	
	function successCallBackFun(data){
		if(toFlag=="classManage"){
			if(data.success==true){
				$("#"+"<c:out value='${paraMap.javaClassElementId}' />",pIframe.document).val(data.infoMap.CLASS_NAME);
				$("#"+"<c:out value='${paraMap.clsCodeIdElementId}' />",pIframe.document).val(data.infoMap.codeId);
				$("#"+"<c:out value='${paraMap.codeTypeElementId}' />",pIframe.document).val(data.infoMap.codeType);
				$("#"+"<c:out value='${paraMap.clsCodeElementId}' />",pIframe.document).val(data.infoMap.clsCode);
				$("#"+"<c:out value='${paraMap.javaClassTextElementId}' />",pIframe.document).text("编辑");
				
				var curWindow=getSrcByIframeName({mcIframeName:window.frameElement.name,type:'window'});
				closePopWin();
			}else{
				util.alert(data.info);
			}
		}else{
			if(data.success==true){
				var _frameObj = $(window.parent.document).contents().find("#" + piframeName)[0].contentWindow;
				_frameObj.$("#"+"<c:out value='${paraMap.javaClassElementId}' />").val(data.infoMap.CLASS_NAME);
				_frameObj.$("#"+"<c:out value='${paraMap.clsCodeIdElementId}' />").val(data.infoMap.codeId);
				_frameObj.$("#"+"<c:out value='${paraMap.codeTypeElementId}' />").val(data.infoMap.codeType);
				_frameObj.$("#"+"<c:out value='${paraMap.clsCodeElementId}' />").val(data.infoMap.clsCode);
				_frameObj.$("#"+"<c:out value='${paraMap.javaClassTextElementId}' />").text("编辑");
				
				/*$("#"+"<c:out value='${paraMap.javaClassElementId}' />",parent.document).val(data.infoMap.CLASS_NAME);
				$("#"+"<c:out value='${paraMap.clsCodeIdElementId}' />",parent.document).val(data.infoMap.codeId);
				$("#"+"<c:out value='${paraMap.codeTypeElementId}' />",parent.document).val(data.infoMap.codeType);
				$("#"+"<c:out value='${paraMap.clsCodeElementId}' />",parent.document).val(data.infoMap.clsCode);
				$("#"+"<c:out value='${paraMap.javaClassTextElementId}' />",parent.document).text("编辑");*/
				closePopWin();
			}else{
				util.alert(data.info);
			}
		}
	}
	
	function errorCallBackFun(msg){
		util.alert("msg"+msg);
	}
	
	$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
	    	  form.on('submit(filterSubmit)', function (data) {
			       var flag=edit(data.elem);
			       if(!flag){
			       		return false;
			       }else{
			       		return true;
			       }
			  })
			  
			  //解决双滚动条问题
			  var divHeadH = $("#div_head").height();
			  var winWh = $(window).height();
			  //alert(divHeadH)
			  $("#ace_code").css({
				height : winWh - divHeadH - 81
			  });
           
	    });
	    
	      //去除空格
	      $("#paraMap_CLASS_NAME").blur(function(){
	      	$("#paraMap_CLASS_NAME").val(util.allTrim($(this).val()));
	      });	  
	    
	})
	

	//打开新窗口
	function validateIsCurrentDebug(){
		debugPageDetail($("#paraMap_CLASS_NAME").val(),'<s:property value="paraMap.CODE_ID"/>',$("input[name='paraMap.codeType']:checked").val());
	}
	/**
    * 调试按钮处理
    * param:className(类全名称)
    * param:codeId(类Id)
    * param:tableName(关联表id)
    * param:tableName(关联表id)
    */
	function debugPageDetail(classNameValue,codeId,codeType){
		localStorage.codeType=codeType;
		var classNameclassLength=classNameValue.lastIndexOf(".");//获取类全名长度
	   	var packageName=classNameValue.substring(0,classNameclassLength);//包名称
	   	var className=classNameValue.substring(classNameclassLength+1,classNameValue.length);//类名
	   	localStorage.packageName=packageName;//包名存储本地
	   	localStorage.className=className;//类名存储本地
	   	localStorage.currentClassName=classNameValue;//类全面存储
		localStorage.codeId=codeId;//获取codeId
		$.ajax({
	    			type : "POST",
	    			dataType : "text",
	    			async:false, 
	    			url : "${path}sys/pageDebugAction_checkOpen.ms",
	    			data:{},
	    			success : function(data) {
	    				data=JSON.parse(data);
	    				if(data.ajaxMap!=null&&data.ajaxMap.result=="true"){
	    					window.open("sys/pageDebugAction_pageDebug.ms");
	    				}else{
	    					if(data.ajaxMap.message=="otherOpen"){
	    						util.alert("其他用户调试中");	
	    					}else{
	    						util.alert("断点界面已打开，请切换断点界面");	
	    					}
	    				}
	    				
	    				
	    			},
	    			error : function(msg) {
	    				alert();
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