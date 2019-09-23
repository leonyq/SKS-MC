<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="序列号管理" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
			<form id="updateForm" name="updateForm" action="" method="post" target="submitFrame">
			 
			<input type="hidden" id="paraMap_ID" name="paraMap.ID" value="<c:out value='${paraMap.ID }'/>"/>
			<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
					<span style="float:right;margin-right:5px" >
						<input type="button" value="<dict:lang value="提交" />" onclick="update(this);" class="botton_img_add">
						<input type="button" value="<dict:lang value="取消" />" onclick="cancel(this);" class="botton_img_add">
					</span>
				<table class="add_table">
					<tr>
						<td width="30%" class="tr1">
							<dict:lang value="自定编号" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<s:textfield name="paraMap.DEF_ID" value="%{dataMap.DEF_ID}" id="paraMap_DEF_ID" maxlength="60" />
					    </td>
					</tr>
					<tr>
						<td width="30%" class="tr1">
							<dict:lang value="初始步长" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<s:textfield name="paraMap.INIT_STEP" value="%{dataMap.INIT_STEP}" id="paraMap_INIT_STEP" maxlength="10" />
					    </td>
					</tr>
					
					<tr>
						<td width="30%" class="tr1">
							<dict:lang value="最大值" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<s:textfield name="paraMap.SEQ_MAX_VAL" value="%{dataMap.SEQ_MAX_VAL}" id="paraMap_SEQ_MAX_VAL" maxlength="20" />
					    </td>
					</tr>
					<tr>
						<td width="30%" class="tr1">
							<dict:lang value="是否循环" /><span class="Eng">*</span>
						</td>
						<td width="70%"> 
                             <select id="IS_LOOP" name="paraMap.IS_LOOP">
					        <option value="0" <s:if test="${dataMap.IS_LOOP=='0'}"> selected </s:if>  ><dict:lang value="是" /></option>
					         <option value="1" <s:if test="${dataMap.IS_LOOP=='1'}"> selected </s:if>  ><dict:lang value="否" /></option>
					      </select>
					    </td>
					</tr>
					
				</table>
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	function cancel(){
		parent.closePopWin();
	}
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function update(thisObj){
	   if(isSubmit){
	    util.alert('<dict:lang value="正在提交中..." />' );return;
	   }
	   if($("#paraMap_DEF_ID").val()=="")
	     {
	      alert('<dict:lang value="自定编号不能为空值" />');return;
	     }
	     if($("#paraMap_INIT_STEP").val()=="")
	     {
	      alert('<dict:lang value="初始步长不能为空值" />');return;
	     }
	     if($("#paraMap_SEQ_MAX_VAL").val()=="")
	     {
	      alert('<dict:lang value="最大值不能为空值" />');return;
	     }	     
	     var url="${path}sys/seq_mng/SeqAction_Insert.ms";
	     if($("#paraMap_ID").val()!="")
	       url="${path}sys/seq_mng/SeqAction_Update.ms";
	     isSubmit=true;
	      
	     document.forms.updateForm.action=url;
		 document.forms.updateForm.submit();
	}//function update(thisObj){
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>