<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
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
		  
			<div class="add_table_div">
			<form id="editForm" class="layui-form" name="editForm" action="${path}sys/UserCustomAction_editCommClass.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.ID" />
				<s:hidden name="paraMap.UP_ID" />
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
							<s:textfield name="paraMap.CLASS_DESC" value="%{dataMap.CLASS_DESC}" id="paraMap_CLASS_DESC"
							onkeyup="javascript:util.replaceLikeVal(this)" maxlength="60" />
							-->
							
							<input type="text" lay-verify="required" name="paraMap.CLASS_DESC" value="<s:property value="dataMap.CLASS_DESC" />" id="paraMap_CLASS_DESC"
							 onkeyup="javascript:util.replaceLikeVal(this)" maxlength="60"/>
							
						</td>
						
						
					</tr>
					
					<tr style="white-space:nowrap; ">
						
						<td class="tr1 title">
							<dict:lang value="类源码" />
						</td>
						<td class="widget">							
							<s:if test="null ==dataMap || @com.more.fw.core.common.method.StringUtilsMc@isBlank(dataMap.MS_CLASS_CODE_ID)">
								 <div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
				                 <input id="MS_CLASS_CODE_ID" type="text" value="<s:property value='dataMap.CLASS_NAME' />" readonly="readonly" class="readonly p_r_30" />
				                 <i class="layui-icon layui-icon-search" onclick="showSelectInter();" style="position: absolute;top:11px;right: 8px;"></i>
				                 </div>
                      
							</s:if>
							<s:else>
								<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
				                 <input id="MS_CLASS_CODE_ID" type="text"  value="<s:property value='dataMap.CLASS_NAME' />" readonly="readonly" class="readonly p_r_30" />
				                 <i class="layui-icon layui-icon-search" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');" style="position: absolute;top:11px;right: 8px;"></i>
				                 </div>
							</s:else>
							
						</td>
					</tr>
					
				</table>
				<input type="hidden" id="owner_id"   value="<s:property value="dataMap.ID"/>"/>
				
				<div class="ptop_10 txac">			
			
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit" style="margin:2px 2px 2px 2px;">提交</button>
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
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function showSelectInter(){
		var mcIframeName='${mcIframeName}';
		var url = "${path}sys/BussModelAction_selectInter.ms?listIframeName="+mcIframeName;
		showPopWin(url, "450", "300",null,"<dict:lang value="接口"/> <dict:lang value="选择"/>");
	}
	
	function showSelectMeth(sel,packPath,className,mcIframeName,listIframeName){
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_COMM_CLASS}"/>";
		var colName = "MS_CLASS_CODE_ID";
		var OWNER_ID = $("#owner_id").val();
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.tpl="+sel+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName+"&paraMap.OWNER_ID="+OWNER_ID+"&paraMap.xmlForPackge="+packPath+"&paraMap.xmlForClassName="+className+"&mcIframeName="+mcIframeName+"&listIframeName="+listIframeName;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
	}
	function showBlankMeth(mcIframeName,listIframeName){
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_COMM_CLASS}"/>";
		var colName = "MS_CLASS_CODE_ID";
		var OWNER_ID = $("#owner_id").val();
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.tableName="
				+tableName+"&paraMap.colName="+colName+"&paraMap.OWNER_ID="+OWNER_ID+"&mcIframeName="+mcIframeName+"&listIframeName="+listIframeName;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
	}
	
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var listIframeName='${mcIframeName}';
		var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_COMM_CLASS}"/>";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName+"&listIframeName="+listIframeName;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
		//window.open(url);
	}
	
	
	
	function updateCLASS_NAME_TEXT(id,txt,curIframeName,mcIframeName,listIframeName){
		$("#"+id).val(txt);
		window.parent.isModify=true;
		
		var obj={"mcIframeName":curIframeName,"type":"window"};
		getSrcByIframeName(obj).closePopWin();
		
		if(mcIframeName!='' && mcIframeName!=null){
			var obj2={"mcIframeName":mcIframeName,"type":"window"};
			getSrcByIframeName(obj2).closePopWin();
		}
		
		window.location.href = "${path}sys/UserCustomAction_showEditCommClass.ms?paraMap.ID=<s:property value='paraMap.ID' />&listIframeName="+listIframeName;
	}
        
	function valData(){
		var paraMap_CLASS_DESC = document.getElementById("paraMap_CLASS_DESC");
   	if(val.isBlank(paraMap_CLASS_DESC)){
   		_alertValMsg(paraMap_CLASS_DESC,"<dict:lang value="类说明" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}
	
	function init(){
	}
	
	init();
	
	$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
	    	  form.on('submit(filterSubmit)', function (data) {
	    	  		document.getElementById("curIframeName").value=window.frameElement.name;
			       return true;
			  }) 
           
	    });
	    
	    
	    
	})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>