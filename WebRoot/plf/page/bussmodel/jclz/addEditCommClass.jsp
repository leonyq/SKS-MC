<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="自定义类" /><dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
		  <table class="func_table">
	    	<tr>
	      <td width="100%" align="right">
					<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="botton_img_add">
	      </td>
	      </tr>
			</table>
			<form id="editForm" name="editForm" action="${path}sys/JClzAction_editClsCode.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.ID" id="parentId" />
				<table class="add_table">
					<tr>
						<td colspan="6">
							<span class="Point"><span class="Eng">*</span><dict:lang value="为必填项" />
							</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="类说明" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:textfield name="paraMap.CLASS_DESC" value="%{dataMap.CLASS_DESC}" id="paraMap_CLASS_DESC" maxlength="60" />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="菜单树" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<input type="text" id="funcDto_upName" name="funcDto.upName" readOnly class="readonly" value="<c:out value='${dataMap.PARENTNAME}' />"/>
							<img src="${IMG_PATH}/search.png?_mc_res_version=<%=PlfStaticRes.SEARCH_PNG %>" onclick="showModelTree();" style="cursor:pointer;" width="20px" height="20px"/>
							<input type="hidden" id="funcDto_upId" name="funcDto.upId" value="<c:out value='${dataMap.PARENTID}' />" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="类源码" /><span class="Eng">*</span>
						</td>
						<td >
							<input id="className" name="paraMap.CLASS_NAME" type="text" value="<s:property value='dataMap.CLASS_NAME' />" readonly="readonly" class="readonly" />
							<a href="javascript:void(0);" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>')">
							<s:if test="null ==dataMap || @com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID)">
								<dict:lang value="新增" />
							</s:if>
							<s:else>
								<dict:lang value="编辑" />
							</s:else>
							</a>
						</td>
						<td width="20%" class="tr1">
							
						</td>
						<td width="30%">
						</td>
					</tr>
				</table>
				<s:textarea  name="context" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
				<s:hidden name="paraMap.clsCode" id="dataContext"/>
				<input type="hidden" name="paraMap.CODE_ID" value="<s:property value='dataMap.MS_CLASS_CODE_ID' />">
				<input type="hidden" id="parentName" value="<s:property value='dataMap.CLASS_NAME' />">
				<input type="hidden" id="codeType" name="paraMap.codeType">
				<input type="hidden" id="paraMapUpId" name="paraMap.UP_ID" value="<c:out value='${dataMap.PARENTID}' />" >
				
				<%-- <s:hidden id="paraMap.OWNER_ID" name="paraMap.ID" /> --%>
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
 	var parentName=null;
	if(null!=$("#parentName").val()){//如果parentName 为空：新增   不为空：修改
		parentName=$("#parentName").val();
		parentName=parentName.substring(0,parentName.lastIndexOf("."));
		$("#parentName").val(parentName);
	} 
	var valueText="";
	var isSubmit = false;
	function reloadPg(msg){
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		$("#dataContext").val($("#context").val());
		var up_id=$("#funcDto_upId").val();
		var className=$("#className").val();
		className=className.substring(0,className.lastIndexOf("."));
		if(""!=parentName){
			if(className!=parentName){
				util.alert("不能修改类路径");
				return false;
			}
		}else{
		 if($("#parentId").val()!=className){
			util.alert("当前目录与代码路径不一致");
			return false;
			}
		}
		
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function showEditCode(codeId,OWNER_TYPE){
		var conText = $("#context").val();
		var CLASS_NAME_TEXT_ID = $("#className").val();
		var url = "${path}sys/JClzAction_packPathModel.ms?paraMap.CODE_ID="+codeId
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
	}
	function updateCLASS_NAME_TEXT(txt,contextValue,codeType){
		$("#className").val(txt);
		$("#context").val(contextValue);
		$("#codeType").val(codeType);
		window.parent.isModify=true;
		closePopWin();
	}
        
	function valData(){
		var paraMap_CLASS_DESC = document.getElementById("paraMap_CLASS_DESC");
   		if(val.isBlank(paraMap_CLASS_DESC)){
   			_alertValMsg(paraMap_CLASS_DESC,"<dict:lang value="类说明" /> -- <dict:lang value="不能为空" />");
   			return false;
   		}
   		var funcDto_upName = document.getElementById("funcDto_upName");
   		if(val.isBlank(funcDto_upName)){
   			_alertValMsg(funcDto_upName,"<dict:lang value="菜单树" /> -- <dict:lang value="不能为空" />");
   			return false;
   		}
   		var className = document.getElementById("className");
   		if(val.isBlank(className)){
   			_alertValMsg(className,"<dict:lang value="类源码" /> -- <dict:lang value="不能为空" />");
   			return false;
   		}
    
		return true;
	}
	
	   //功能树
    function showModelTree(){
		var url = "${path}plf/page/bussmodel/usercustom/upFuncTree.jsp";
      	showPopWin(url, 300, 400,null,"<dict:lang value="上级功能菜单" />");
    }
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>