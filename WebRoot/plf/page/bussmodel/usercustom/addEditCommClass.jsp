<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="自定义类" /><dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
		  
			<div  class="add_table_div">
			<form id="editForm" class="layui-form" name="editForm" action="${path}sys/UserCustomAction_editClsCode.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.ID" id="parentId" />
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
			
				<table class="add_table">
					<!--  
					<tr>
						<td colspan="6">
							<span class="Point"><span class="Eng">*</span><dict:lang value="为必填项" />
							</span>
						</td>
					</tr>
					-->
					
					<tr style="white-space:nowrap; ">
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="类说明" />
						</td>
						<td class="widget">
							<!--  
							<s:textfield name="paraMap.CLASS_DESC" value="%{dataMap.CLASS_DESC}" id="paraMap_CLASS_DESC" maxlength="60" />
							-->
							
							<input type="text" lay-verify="required" name="paraMap.CLASS_DESC" value="<s:property value="dataMap.CLASS_DESC" />" id="paraMap_CLASS_DESC"
							  maxlength="60"/>
						</td>
						
						
					</tr>
					
					<tr style="white-space:nowrap; ">
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="菜单树" />
						</td>
						<td class="widget">							
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
								<input type="text" lay-verify="required" id="funcDto_upName" name="funcDto.upName" readOnly class="readonly p_r_30" value="<c:out value='${dataMap.PARENTNAME}' />" />
								
                  		  		<i class="layui-icon layui-icon-search" onclick="showModelTree();" style="position: absolute;top:11px;right: 8px;"></i>
                  		  		<input type="hidden" id="funcDto_upId" name="funcDto.upId" value="<c:out value='${dataMap.PARENTID}' />" />
               				</div>
               				
						</td>
					</tr>
					
					<tr style="white-space:nowrap; ">
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="类源码" />
						</td>
						<td class="widget">
							
							<s:if test="null ==dataMap || @com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID)">
								
								<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
								<input id="className2" lay-verify="required" name="paraMap.CLASS_NAME" type="text" value="<s:property value='dataMap.CLASS_NAME' />" readonly="readonly" class="readonly p_r_30" />
							
                  		  		<i class="layui-icon layui-icon-search" onclick="showSelectInter();" style="position: absolute;top:11px;right: 8px;"></i>
               					</div>
							</s:if>
							<s:else>
								<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
								<input id="className2" lay-verify="required" name="paraMap.CLASS_NAME" type="text" value="<s:property value='dataMap.CLASS_NAME' />" readonly="readonly" class="readonly p_r_30" />
							
                  		  		<i class="layui-icon layui-icon-search" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>')" style="position: absolute;top:11px;right: 8px;"></i>
               					</div>
							</s:else>
							
						</td>
						
						<!--  
						<td width="20%" class="tr1">
							
						</td>
						<td width="30%">
						</td>
						-->
						
					</tr>
				</table>
				<%-- <s:textarea  name="context" cssStyle="display:none;word-wrap: normal;" wrap="off" cssClass="isSubmit"/>
				 --%><input type="hidden" id="context" name="context" value="<s:property value='dataMap.classCode' />"/>
				<s:hidden name="paraMap.clsCode" id="classCode"/>
				<input type="hidden" name="paraMap.CODE_ID" value="<s:property value='dataMap.MS_CLASS_CODE_ID' />">
				<input type="hidden" id="parentName" value="<s:property value='dataMap.CLASS_NAME' />">
				<input type="hidden" id="codeType" name="paraMap.codeType" value="<s:property value='dataMap.CODETYPE' />">
				<input type="hidden" id="paraMapUpId" name="paraMap.UP_ID" value="<c:out value='${dataMap.PARENTID}' />" >
				<input
					type="hidden" name="paraMap.MC_ID_MYSQL"
					value="<s:property value="dataMap.MC_ID_MYSQL" />" /><input
					type="hidden" name="paraMap.MC_ID_SQLSERVER"
					value="<s:property value="dataMap.MC_ID_SQLSERVER" />" /><input
					type="hidden" name="paraMap.MC_ID_ORACLE"
					value="<s:property value="dataMap.MC_ID_ORACLE" />" /><input
					type="hidden" name="paraMap.MC_ID_BASE"
					value="<s:property value="dataMap.MC_ID_BASE" />" /><input
					type="hidden" id="DATABASETYPE" name="paraMap.DATABASETYPE" /><input
					type="hidden" name="paraMap.MC_ID_PG"
					value="<s:property value="dataMap.MC_ID_PG" />" />
				<%-- <s:hidden id="paraMap.OWNER_ID" name="paraMap.ID" /> --%>
				
				<div class="ptop_10 txac">
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
							
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				
			</form>
			</div>
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
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		$("#classCode").val($("#context").val());
		var up_id=$("#funcDto_upId").val();
		var className=$("#className2").val();
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
		
		//document.forms.editForm.submit();
		//isSubmit = true;
		return true;
	}
	
	function showEditCode(codeId,OWNER_TYPE){
		var mcIframeName = window.frameElement.name; //外层iframe的name
		var conText = $("#context").val();
		var CLASS_NAME_TEXT_ID = $("#className2").val();
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_COMM_CLASS}"/>";
		var colName = "MS_CLASS_CODE_ID";
		var url = "${path}sys/UserCustomAction_toEditCode.ms?paraMap.CODE_ID="+codeId
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName+"&mcIframeName="+mcIframeName+"&mcIframeName2=temp";
		
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
	}
     function updateCodeData(codeType, className, classCode){
     	$("#className2").val(className);
		$("#context").val(classCode);
		$("#codeType").val(codeType);
		$("#classCode").val(classCode);
		window.parent.isModify=true;
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
   		var className = document.getElementById("className2");
   		if(val.isBlank(className)){
   			_alertValMsg(className,"<dict:lang value="类源码" /> -- <dict:lang value="不能为空" />");
   			return false;
   		}
    
		return true;
	}
	
	   //功能树
    function showModelTree(){
		var url = "${path}plf/page/bussmodel/usercustom/upFuncTree.jsp";
      	showPopWin(url, 350, 500,null,"<dict:lang value="上级功能菜单" /> <dict:lang value="选择" />");
    }
	function showSelectInter(){
		if($("#context").val()!=""){
			showBlankMeth();
		}else{
			var url = "${path}sys/UserCustomAction_toSelectJsp.ms?paraMap.path="+$("#parentId").val();
			showPopWin(url, "450", "285",null,"<dict:lang value="接口"/> <dict:lang value="选择"/>");
		}
		
	}
	function showSelectMeth(sel,packPath,className,mcIframeName){
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_COMM_CLASS}"/>";
		var colName = "MS_CLASS_CODE_ID";
		var url = "${path}sys/UserCustomAction_toEditCode.ms?paraMap.tpl="+sel+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName+"&paraMap.xmlForPackge="+packPath+"&paraMap.xmlForClassName="+className+"&mcIframeName="+mcIframeName;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
	}
	function showBlankMeth(curIframeName2){
	 	var mcIframeName = window.frameElement.name; //外层iframe的name
	 	//alert(mcIframeName);
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_COMM_CLASS}"/>";
		var colName = "MS_CLASS_CODE_ID";
		var url = "${path}sys/UserCustomAction_toEditCode.ms?mcIframeName="+mcIframeName+"&mcIframeName2="+curIframeName2;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
	}
	function init() {
		$("#classCode").val($("#context").val());
	}
	
	$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
	    	  form.on('submit(filterSubmit)', function (data) {
	    	  document.getElementById("curIframeName").value=window.frameElement.name;
			   var flag=edit(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
			  }) 
           
	    });
	    
	    
	    
	})
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>