<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
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
</head>
<body>
<div id="_alertValMsgDiv" style="color: rgb(255, 0, 0); background-color: rgb(254, 224, 178); left: 125px; position: absolute; top: 255px; z-index: 10; display: none;">请选择报废类型</div>
	<div class="edit">
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
			    	        <%--<button type="button" onclick="showDetailUrl();"><i class="ico ico-save"></i><dict:lang value="展示详情" /></button>
        				<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    	        --%>
			    	        <button type="button" onclick="_addDiscarde();"><i class="ico ico-save"></i><dict:lang value="报废" /></button>
        				<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="637eae7df1284e708d361ddbc63c542d" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="637eae7df1284e708d361ddbc63c542d" />
	<input type="hidden" name="637eae7df1284e708d361ddbc63c542d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	
	<input type="hidden" name="isExit" value="" id="isExit"/> 
	
	<input type="hidden" name="scardSuppCode" value="" id="scardSuppCode"/>
	<input type="hidden" name="curUser" value="" id="curUser"/>
	<input type="hidden" name="scarpTime" value="" id="scarpTime"/>
	<input type="hidden" name="assisType" value="" id="assisType"/>  
	<input type="hidden" name="ctiLot" value="" id="ctiLot"/>
	<input type="hidden" name="ctiId" value="" id="ctiId"/>
	<input type="hidden" name="item_code" value="" id="item_code"/>
	
		<s:set name="_$viewId" value="'fa6c03ae9fa8425385f4bb3058a5701e'" />
		<s:set name="_$formId_1" value="'637eae7df1284e708d361ddbc63c542d'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CTS_TIN_SN" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_TIN_SN" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_TIN_SN" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
		</tr>
		  <td class="name-six" /><bu:uitn colNo="CTS_ITEM_CODE" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_ITEM_CODE" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_ITEM_CODE" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		<tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTTOOLNAME" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLNAME" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="ASSISTANTTOOLNAME" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			
		<tr>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLSPEC" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="ASSISTANTTOOLSPEC" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		 <td class="name-six" /><bu:uitn colNo="SUPPLIER_NAME" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="SUPPLIER_NAME" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="SUPPLIER_NAME" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>	
		</tr>	
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CTS_SCARP_TYPE" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SCARP_TYPE" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SCARP_TYPE" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CTS_SCARP_REASON" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SCARP_REASON" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SCARP_REASON" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" style="width:229px;height:80px;"/></bu:td>
		</tr>	
			
			
			<!--<td class="name-six" /><bu:uitn colNo="CTS_ITEM_TYPE" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_ITEM_TYPE" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_ITEM_TYPE" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTS_SUPPLIER_CODE" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SUPPLIER_CODE" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SUPPLIER_CODE" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CTS_LOT" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_LOT" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_LOT" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTS_SCARP_TIME" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SCARP_TIME" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SCARP_TIME" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CTS_SCARP_MAN" formId="637eae7df1284e708d361ddbc63c542d" /></td>
			<bu:td cssClass="dec-self" colNo="CTS_SCARP_MAN" formId="637eae7df1284e708d361ddbc63c542d" ><bu:ui colNo="CTS_SCARP_MAN" formId="637eae7df1284e708d361ddbc63c542d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
	</table>
			<bu:jsVal formId="637eae7df1284e708d361ddbc63c542d" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
        <bu:submit viewId="fa6c03ae9fa8425385f4bb3058a5701e" />
		<bu:script viewId="fa6c03ae9fa8425385f4bb3058a5701e" />
	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
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
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}  
			 $("#paraMap1_CTS_SCARP_TYPE").prepend("<option value='a'>请选择2</option>");
			 $("#paraMapObj_ASSISTANTTOOLNAME").attr("disabled",false);
		     $("#paraMapObj_ASSISTANTTOOLSPEC").attr("disabled",false);
		     $("#paraMapObj_SUPPLIER_NAME").attr("disabled",false);
		     
		  //    $('#paraMapObj_CTS_TIN_SN').attr("readonly","readonly"); 
            //  $('#paraMapObj_CTS_TIN_SN').addClass("readonly");
              
               $('#paraMapObj_CTS_ITEM_CODE').attr("readonly","readonly"); 
              $('#paraMapObj_CTS_ITEM_CODE').addClass("readonly");
              
               $('#paraMapObj_ASSISTANTTOOLNAME').attr("readonly","readonly"); 
              $('#paraMapObj_ASSISTANTTOOLNAME').addClass("readonly");
              
               $('#paraMapObj_ASSISTANTTOOLSPEC').attr("readonly","readonly"); 
              $('#paraMapObj_ASSISTANTTOOLSPEC').addClass("readonly");
              
               $('#paraMapObj_SUPPLIER_NAME').attr("readonly","readonly"); 
              $('#paraMapObj_SUPPLIER_NAME').addClass("readonly");
              
             //  $('#paraMapObj_CTS_SCARP_REASON').attr("readonly","readonly"); 
             // $('#paraMapObj_CTS_SCARP_REASON').addClass("readonly");
              
		 //	_alertValMsg($('#paraMapObj_CTS_SCARP_TYPE'),"<dict:lang value="请选择报废类型" />");
		         
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
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
      window.onload=function(){
         var errorText2="";
       	$("#paraMapObj_CTS_SCARP_TYPE").prepend("<option value='a' selected='selected'> --请选择-- </option>");
       	$("#paraMapObj_CTS_SCARP_TYPE").trigger("chosen:updated"); 
       
       	
       	$("#paraMapObj_CTS_TIN_SN").bind("keydown",function(event){
       		if(event.keyCode=="13"){
       			//alert("urlDetail2: "+showDetailUrl());
       			var tinSn=$("#paraMapObj_CTS_TIN_SN").val();
       			var urlDetail=showDetailUrl();
       			if(tinSn==""){
       			   _alertValMsg($("#paraMapObj_CTS_TIN_SN"),"请填写辅料SN");
       			   
       			   $('#paraMapObj_CTS_ITEM_CODE').val('');
       			   $('#paraMapObj_ASSISTANTTOOLNAME').val('');
       			   $('#paraMapObj_ASSISTANTTOOLSPEC').val('');
       			   $('#paraMapObj_SUPPLIER_NAME').val('');
       			    
       			   $("#paraMapObj_CTS_SCARP_TYPE").val('a'); 
       			   $("#paraMapObj_CTS_SCARP_TYPE").trigger("chosen:updated"); 
       			   
       			   $('#paraMapObj_CTS_SCARP_REASON').val('');
       			      			          			   
       			}else{
       			
       			      	   jQuery.ajax({
       			 type:"POST",
       			 dataType:"json",
       			 url:urlDetail+"&dataId="+tinSn,
       			 success:function(data){
       			 	var snList=data.ajaxMap.snList;
       			 	console.log(data.ajaxMap);
       			 	var scarplList=data.ajaxMap.scarplList;
       			 	errorText2=data.ajaxMap.errorList;
       			 	if(snList.length>0){
       			 	        
       			 		$("#paraMapObj_CTS_ITEM_CODE").val(snList[0].CTI_ITEM_CODE);
       			 		$("#paraMapObj_ASSISTANTTOOLNAME").val(snList[0].ASSISTANTTOOLNAME);
       			 		$("#paraMapObj_ASSISTANTTOOLSPEC").val(snList[0].ASSISTANTTOOLSPEC);
       			 		$("#paraMapObj_SUPPLIER_NAME").val(snList[0].SUPPLIERNAME);
       			 		//$("#paraMapObj_CTS_TIN_SN").val(snList.get(0).get("CTI_ITEM_CODE"));
       			 		
       			 		$("#scardSuppCode").val(snList[0].SUPPLIERCODE);
       			 		
       			 		$("#assisType").val(snList[0].ASSISTANTTOOLTYPE);
       			 		$("#ctiLot").val(snList[0].CTI_LOT);
       			 		$("#ctiId").val(snList[0].ID);
       			 		
       			 		$("#curUser").val(snList[1].curUser);      
       			 		$("#scarpTime").val(snList[1].scarpTime);
       			 		
       			 		
       			 		
       			 		
       			 		$("#paraMapObj_CTS_ITEM_CODE").attr("disabled","disabled"); 
       			 		$("#paraMapObj_ASSISTANTTOOLNAME").attr("disabled","disabled"); 
       			 		$("#paraMapObj_ASSISTANTTOOLSPEC").attr("disabled","disabled"); 
       			 		$("#paraMapObj_SUPPLIER_NAME").attr("disabled","disabled"); 
       			 		 
       			 	}else{
       			 	utilsFp.confirmIcon(3,"","","", "<dict:lang value="辅料SN不存在,请更换" />",0,"","");
       			 	}
       			 	if(scarplList.length>0){
       			 	$("#isExit").val('1');
       			 		//$("#paraMapObj_CTS_SCARP_TYPE").val(scarplList[0].CTS_SCARP_TYPE);
       			 		var _scarpType=scarplList[0].CTS_SCARP_TYPE;
       			 		$("#paraMapObj_CTS_SCARP_TYPE option[value='"+_scarpType+"']").attr("selected",true); 
       			 		$("#paraMapObj_CTS_SCARP_TYPE").trigger("chosen:updated"); 
       			 		$("#paraMapObj_CTS_SCARP_REASON").val(scarplList[0].CTS_SCARP_REASON);
       			 		$("#paraMapObj_CTS_SCARP_TYPE option[value='a']").attr("selected",false); 
       			 		//$('#areaSelect').attr("disabled",true);  paraMapObj_CTS_SCARP_TYPE
       			 		
			                $("#paraMapObj_CTS_SCARP_TYPE").attr("disabled","disabled"); 
			                $("#paraMapObj_CTS_SCARP_TYPE").addClass("readonly"); 
			                $("#paraMapObj_CTS_SCARP_TYPE").trigger("chosen:updated"); 
			                 
			                $("#paraMapObj_CTS_SCARP_REASON").attr("readonly","readonly"); 	 
			                $("#paraMapObj_CTS_SCARP_REASON").addClass("readonly"); 
			                
			                $("#paraMapObj_CTS_SCARP_TYPE").attr("disabled","disabled"); 
       			 		$("#paraMapObj_CTS_SCARP_REASON").attr("disabled","disabled"); 
			 
       			 	}else{
       			 	        $("#isExit").val('');
       			 		$("#paraMapObj_CTS_SCARP_TYPE option[value='a']").attr("selected",true); 
       			 		$("#paraMapObj_CTS_SCARP_TYPE").trigger("chosen:updated"); 
       			 		
       			 		$("#paraMapObj_CTS_SCARP_TYPE ").removeAttr("disabled"); 
       			 		$("#paraMapObj_CTS_SCARP_REASON ").removeAttr("readonly"); 
       			 		$("#paraMapObj_CTS_SCARP_REASON ").removeClass("readonly"); 
       			 	}
       			 	
       			 	   
       			 },
       			 error:function(msg){
       			      utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
       			 	
       			 }
       			 
       		});
       		
       			
       			}
  
       		}
       		
       	});
       }
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
