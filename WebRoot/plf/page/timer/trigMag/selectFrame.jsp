<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title><dict:lang value="任务管理页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
		<style>
			body{
				margin:0;
			}
			html,body{
				height:100%;
			}
		
		</style>
	</head>
	<body style="overflow:hidden;">
			<div style="height:100%;width:100%; overflow:hidden;">
				<iframe  name="selectTree" id="selectTree"  scrolling="auto" height="99%"  style="width:25%; border:none; box-sizing: border-box; border-right: 1px solid #ccc; float:left;" ></iframe>	
					
				<iframe name="selectListFrame" id="selectListFrame"  scrolling="auto"  height="99%" style="width:75%; border:none; box-sizing: border-box; border-left: 1px solid #ccc; float:left;"></iframe>
			</div>		
			<s:hidden id="checkId" name="paraMap.checkId"></s:hidden>
			<s:hidden id="type" name="paraMap.type"></s:hidden>
			<s:hidden id="workDec" name="paraMap.workDec"></s:hidden>
			<s:hidden id="selectId" name="paraMap.id"></s:hidden>
			<s:hidden id="userDataAuth" name="paraMap.userDataAuth"></s:hidden>
			<s:hidden id="queryType" name="paraMap.queryType"></s:hidden>
	</body>
	<script type="text/javascript">
			var checkId=$("#checkId").val();
			var type=$("#type").val();
			var workDec=$("#workDec").val();
			var userDataAuth=$("#userDataAuth").val();
			var mcIframeName="${mcIframeName}";
			$(function(){
				var selectId=$("#selectId").val();
				if(checkId!=""){
					window.frames.selectListFrame.location.href = "${path}sys/workMagAction_selectListModule.ms?paraMap.checkId="+checkId+"&paraMap.type="+type+"&paraMap.modelName="+workDec+"&mcIframeName="+mcIframeName+"&userDataAuth="+userDataAuth+"&paraMap.queryType=checkTask";
					window.frames.selectTree.location.href="${path}plf/page/timer/trigMag/selectTree.jsp?paraMap.checkId="+checkId+"&selectId="+selectId+"&mcIframeName="+mcIframeName+"&userDataAuth="+userDataAuth+"&paraMap.queryType=checkTask";
				}else{
					window.frames.selectListFrame.location.href = "${path}sys/workMagAction_selectListModule.ms"+"?mcIframeName="+mcIframeName+"&userDataAuth="+userDataAuth+"&paraMap.queryType=checkTask";
					window.frames.selectTree.location.href="${path}plf/page/timer/trigMag/selectTree.jsp"+"?mcIframeName="+mcIframeName+"&userDataAuth="+userDataAuth+"&paraMap.queryType=checkTask";
				}
				
				
			})
	</script>
<%@ include file="/plf/common/pub_end.jsp" %>