<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	
	
	<script type="text/javascript">
	    	     function select(){
	        var selectobj = document.getElementById("paraMap1_CF_TYPE");
	        var inputobj1 = document.getElementById("CF_PROJECT_ID_SHOW");
	        var inputobj2 = document.getElementById("MODEL_CODE_SHOW");
	        var hinputobj = document.getElementById("flag");
	       for(var i=0;i<selectobj.length;i++){
	         var optionobj = selectobj[i];
	         var optionvalue = selectobj[i].value;
	         if(optionobj.selected==true){
	           if(optionvalue=="0"){
	           $("#pi").text("");
                   $("#mc").text("");
	          $("#CF_PROJECT_ID_SHOW").attr("value","");
	          $("#CF_PROJECT_ID").val("");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          $("#MODEL_CODE").val("");
	          inputobj1.disabled =true;
	          inputobj2.disabled =true;
	          $("#CF_PROJECT_ID_SHOW").addClass("readonly");
		  $("#MODEL_CODE_SHOW").addClass("readonly");
	          $(inputobj1).parent().find("button").attr("disabled",true);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	         }else if(optionvalue=="1"){
	          $("#pi").text("*");
                  $("#mc").text("");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          $("#MODEL_CODE").val("");
	          inputobj1.disabled = false;
	          inputobj2.disabled = true;
	          $("#CF_PROJECT_ID_SHOW").removeClass("readonly");
		  $("#MODEL_CODE_SHOW").addClass("readonly");
	           $(inputobj1).parent().find("button").attr("disabled",false);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	         }else if(optionvalue=="2"){
	          $("#pi").text("");
                  $("#mc").text("*");
	          $("#CF_PROJECT_ID_SHOW").attr("value","");
	          $("#CF_PROJECT_ID").val("");
	          inputobj1.disabled = true;
	          inputobj2.disabled = false;
	          $("#CF_PROJECT_ID_SHOW").addClass("readonly");
		  $("#MODEL_CODE_SHOW").removeClass("readonly");
	           $(inputobj1).parent().find("button").attr("disabled",true); 
	          $(inputobj2).parent().find("button").attr("disabled",false); 
	         } 
	         } 
	         	       }
	     }
	    
	    function validate(thisObj){
			if(isQuery){util.alert("?数据正在提交，请稍候...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			validate_code();
			isQuery = true;
		}
		
	   function validate_code(){
             var ipt1 = document.getElementById("MODEL_CODE").value;
             var ipt2 = document.getElementById("forbidden_code").value;
              var ipt4 = document.getElementById("CF_PROJECT_ID").value;
             var ipt5 = $("#paraMap1_CF_TYPE option:selected").val();
             if(ipt1 == ipt2){  
             //utilsFp.alert("<dict:lang value="机种与禁用料不能相同" />");
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种与禁用料不能相同" />",0,"","");
             }else{
              if(ipt5 == "1"){
               if(ipt4 == ""){
               //utilsFp.alert("<dict:lang value="工单不能为空" />");
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="工单不能为空" />",0,"","");
               }else{
                 document.forms.editForm.submit();
               }
             }else if(ipt5 == "2"){
               if(ipt1 == ""){
               //utilsFp.alert("<dict:lang value="机种不能为空" />");
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种不能为空" />",0,"","");
               }else{
                 document.forms.editForm.submit();
               }
             }else if(ipt5 == "0"){
                 document.forms.editForm.submit();
             }
             }
             
             }
	    
	</script>
	
	
	
	
	<style type="text/css">
	.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	
	
</head>
<body>
	<div class="edit">
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
			    	        <button type="button" onclick="validate(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="iframeId" value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name="file_type" value="edit_file">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="09206fb514ca4b258beb531bc903334b" type="edit" />
		
	<table class="basic-table" id="table1" name="table1" >
	<input type="hidden" name="formIds" value="09206fb514ca4b258beb531bc903334b" />
	<input type="hidden" name="09206fb514ca4b258beb531bc903334b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1345767213bc4e43aa23db2e5a650fc6'" />
		<s:set name="_$formId_1" value="'09206fb514ca4b258beb531bc903334b'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
		<td class="name"  style="width:93px" /><span class="dot"></span><bu:uitn colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" id="CF_TYPE_T"/></td>
		<td class="dec" ><bu:ui colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" onchange="select()" id="paraMap1_CF_TYPE" style="width:300px;"/></td>
		</tr>
		<tr>
		<td class="name" /><span class="dot">*</span><bu:uitn colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" style="width:300px;"/></td>
		</tr>
		<tr>
		<td class="name " ><span class="dot" id="pi">*</span><bu:uitn colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" /></td>
                <td class="dec" ><bu:ui colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" id="CF_PROJECT_ID"  style="width:300px;"/></td>
                </tr>
                <tr>
                <td class="name " ><span class="dot" id="mc">*</span><bu:uitn colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
                <td class="dec">				
		<bu:ui colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" id="MODEL_CODE"  style="width:300px;"/></td>
		</tr>
		<tr>
		<td class="name" /><span class="dot">*</span><bu:uitn colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui colNo="CF_ITEM_CODE" id="forbidden_code" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" style="width:300px;"/></td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui id="CF_ITEM_NAME" colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" style="width:300px;"/></td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui id="CF_ITEM_DESC" colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" style="width:300px;"/></td>
		</tr>	
		<tr>
		<td class="name"/><bu:uitn colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td colspan="3" style="height:80px;" class="dec"><bu:ui colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" style="width:300px;height:100%;"/></td>
		</tr>	
			
	</table>					

			<bu:jsVal formId="09206fb514ca4b258beb531bc903334b" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}

		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function init(){
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		
	//重置	
	function resetForm(){
		$("#editForm")[0].reset();
	}
	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>
    <script type="text/javascript">
        select();
         
	</script> 
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
