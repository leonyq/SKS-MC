<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethod"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <title><dict:lang value="模块导入导航菜单" /></title>
	    <jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
	<body style="margin: 0px;padding: 0px">
		<div id="leftBtn" style="float: left">
			<input type="button" value="选择模块" onclick="selectModule()">
			<input type="button" value="关联资源" onclick="linkSource()">
			<input type="button" value="已选模块" onclick="alreadySelectModule()">
		</div>
		<div id="rightBtn" style="float: right;display: none;">
			<input type="button" value="移除" onclick="removeModule()">
			<input type="button" value="导出" onclick="moduleExport()">
		</div>
		
		
		<div style="display: hidden">
			<form id='form'  action="${path}plf/page/bussmodel/moduleSourceExport.jsp" method="post" target="leftFrame2">
				<input type="hidden" id="filepaths" name="filepaths">
			</form>
			
			<form id="exportForm" action="${path}sys/BussModelAction_exportMod.ms">
				<input type="hidden" id="exportJson" value="" name="paraMap.input">
			</form>
		</div>
		<script type="text/javascript">
			var exportModule = {};
		</script>
		<script type="text/javascript">
			//选择模块
			function selectModule() {
				hideRightBtn();
				window.parent.leftFrame2.location.href = "${path}sys/BussModelAction_listModule.ms";
				window.parent.mainFrame.location.href = "<%=CommMethod.getMainFrameUrl(request)%>";
				initFrameSet();
			}
			//关联资源
			function linkSource() {
				//window.parent.leftFrame.location.href = "${path}plf/page/bussmodel/moduleSourceExport.jsp";
				hideRightBtn();
				if(exportModule.file) {
					document.getElementById("filepaths").value = exportModule.file;
				}
				document.forms.form.submit();
				hideMainFrameSet();
			}
			
			//已选模块
			function alreadySelectModule() {
				showRightBtn();
				window.parent.leftFrame2.location.href = "${path}plf/page/bussmodel/selectModule.jsp";
				hideMainFrameSet();
			}
			
			//初始化Framset
			function initFrameSet() {
				$('#frameSet1',window.parent.document).attr('cols','230,*');
			}
			
			//隐藏mainFrame
			function hideMainFrameSet() {
				$('#frameSet1',window.parent.document).attr('cols','*');
			}
			
			//隐藏
			function hideRightBtn() {
				$("#rightBtn").hide();
			}
			
			//显示
			function showRightBtn() {
				$("#rightBtn").show();
			}
			
			//移除模块
			function removeModule() {
				
				var win = window.parent.frames.leftFrame2;
				if($(win.document).find("input[name='id'][type='checkbox']:checked").length == 0) {
					window.parent.parent.util.alert("请至少选择一条记录移除");
					return ;
				} 
				$(win.document).find("input[name='id'][type='checkbox']:checked").each(function(i,e){
					var type = e.value.split("_")[1];
					var id = e.value.split("_")[0];
					
					if( type == "orm" || type == "form" || type == "view" || type == "class") {
						var key = e.value.split("_")[2];
						var arr = exportModule[key];
						for(var j=0;j<arr.length;j++) {
							if(id == arr[j].id && type == arr[j].type) {
								//删除
								arr.splice(j,1);
								break;
							}
						}
						if(arr.length == 0) {
							delete exportModule[key];
						}
					}else if(type == "cls") {
						var arr = exportModule.cls;
						for(var j=0;j<arr.length; j++) {
							if(id == arr[j].id) {
								arr.splice(j,1);
								break;
							}
						}
						
						if(arr.length == 0) {
							delete exportModule.cls;
						}
						
					}else if(type == "page") {
						var arr = exportModule.page;
						for(var j=0;j<arr.length; j++) {
							if(id == arr[j].id) {
								arr.splice(j,1);
								break;
							}
						}
						if(arr.length == 0) {
							delete exportModule.page;
						}
					}
				});
				
				alert("ok");
				alreadySelectModule();
			};
			
			// 导出模块
			function moduleExport() {
				var flag = false;
				for(key in exportModule) {
					flag = true;
					break;
				}
				
				if(!flag) {
					//alert(top.name)
					window.parent.parent.util.alert("导出模块列表为空，请选择");
					return;
				}
				document.getElementById("exportJson").value = JSON.stringify(exportModule);
				document.forms.exportForm.submit();
			}
			
		</script>
	</body>
<%@ include file="/plf/common/pub_end.jsp" %>