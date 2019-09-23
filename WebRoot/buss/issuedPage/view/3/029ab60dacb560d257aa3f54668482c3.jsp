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
	<div class="edit">
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name=iframeId value="${iframeId}">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="9e447f80074441dcb0541aa75341e0b5" type="edit" />
     <div class="mod">	
     <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="保养信息"/></h3>	
     </div>
     </div>
    <table class="basic-table" >
	<input type="hidden" name="formIds" value="9e447f80074441dcb0541aa75341e0b5" />
	<input type="hidden" name="9e447f80074441dcb0541aa75341e0b5" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'6aa4306c2d4a41f88d13efc8a4a3312e'" />
		<s:set name="_$formId_1" value="'9e447f80074441dcb0541aa75341e0b5'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
	        </tr><tr>
	        <td class="name-six" /><bu:uitn colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
			<td class="name-six" />不良描述</td>
			<bu:td cssClass="dec-self" colNo="CFM_DESC" formId="9e447f80074441dcb0541aa75341e0b5" ><input type="text" id="CFM_DESC" name="CFM_DESC" class=" input isSubmit "></bu:td>
	        </tr>
		   <tr>
		    <td class="name-six" /><bu:uitn colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" colspan="8"><bu:ui colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>
		</tr>
		
	</table>
	<div style="width:100%;">
	 <div class="mod">	
	 <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="制具信息"/></h3>	
     </div>
    </div>
	 <div class="extend-btn" style="float:right;">
			<button type="button" id="front_add" onclick="popWorkDiv('backShadow','zjalert')" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" id="front_delete" onclick="delFrontList();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   	</div>	
	</div>
	<div class="mod-hd" style="height:150px;border-bottom: none;clear:both;overflow: auto;"> 
	<table  class="dlist-table table-line " style="display:block;" target="secondTable" >
		
		<thead>
		<tr class="thcolor">
			<th class="datagrid-cell" style="width:2%; text-align:center;"><span></span></th>
			<th class="datagrid-cell" style="width:3%; text-align:center"><span><input type="checkbox" id="selectAll2"  style="cursor: pointer;" title="全选"></span></th>
			
			<!--<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9e447f80074441dcb0541aa75341e0b5" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9e447f80074441dcb0541aa75341e0b5" onclick="_selectAjaxTableAllData(this,'9e447f80074441dcb0541aa75341e0b5')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>-->
			
			<th class="datagrid-cell" style="width:5%"><dict:lang value="制具SN"/> </th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="制具类型"/></th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="制具料号"/></th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="制具名称"/></th>
			<th class="datagrid-cell" style="width:10%"><dict:lang value="最后保养时间"/></th>		
		</tr>
		</thead>
		<tbody id="showZJFront">
		</tbody>
		</table>
	   </div>
	
	
			<bu:jsVal formId="9e447f80074441dcb0541aa75341e0b5" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:submit viewId="6aa4306c2d4a41f88d13efc8a4a3312e" />
		<bu:script viewId="6aa4306c2d4a41f88d13efc8a4a3312e" />
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
				
		
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			var date='${dataList[0].CFM_MT_TIME}';
            var time_date=date.substring(0,date.length-2);
            $("#CFM_DESC").val('${dataList[0].CEC_DESC}');
			$('#cfmId').val('${dataList[0].ID}');
			$("#showZJFront").append("<tr class='showZJFront' id='' name=''></tr>");
	        $("#showZJFront tr:last").append("<td style='width:2%; text-align:center;'><span>1</span></td>");
		    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_FIX_SN}'/> </td>");//
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_TYPE}'/> </td>");
	        $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_CODE}'/> </td>");
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_NAME}'/> </td>");
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='"+time_date+"'/> </td>");
		    $("#front_add").attr("disabled", true); 
            $("#front_delete").attr("disabled", true);
		 	
			
			
			
		//	alert("sn: "+${dataList[0].ID});
			
/*				if('${dataList[0].CFM_FIX_SN}'){
		
		 
		$("#paraMap1_CFM_REPORTER_SHOW").val('${dataList[1].cfmReporterShow}');
		
		
		
		$("#paraMap1_CFM_TYPE").val('${dataList[0].CFM_TYPE}');
		$("#paraMap1_CFM_TYPE").trigger("chosen:updated");
        $("#CFM_DESC").val('${dataList[0].CEC_DESC}');
        $('#cfmId').val('${dataList[0].ID}');
        var date='${dataList[0].CFM_MT_TIME}';
        var time_date=date.substring(0,date.length-2);
        alert(${dataList[0].CFM_FIX_SN});
	     $("#showZJFront").append("<tr class='showZJFront' id='' name=''></tr>");
	     $("#showZJFront tr:last").append("<td style='width:2%; text-align:center;'><span>1</span></td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_FIX_SN}'/> </td>");//
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_TYPE}'/> </td>");
	     $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_CODE}'/> </td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_NAME}'/> </td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='"+time_date+"'/> </td>");
		 $("#front_add").attr("disabled", true); 
         $("#front_delete").attr("disabled", true); 
		
		} 
		*/
		$("#paraMapObj_CFM_TYPE").change(function(){  
	 	 	 
            if($(this).val()==0){//保养 
 
              $('#paraMapObj_CFM_EC_CODE').attr("disabled","disabled"); 
               
              $('#CFM_DESC').attr("readonly","readonly"); 
              $('#CFM_DESC').addClass("readonly");
              $("#paraMapObj_CFM_EC_CODE").trigger("chosen:updated");
              $('#CFM_DESC').val("");
              $("#paraMapObj_CFM_EC_CODE option[value='']").attr("selected",true); 
       		  $("#paraMapObj_CFM_EC_CODE").trigger("chosen:updated"); 
              
            }else{//维修
              
              $('#paraMapObj_CFM_EC_CODE').removeAttr("disabled");
             
              $('#CFM_DESC').removeAttr("readonly");
              $('#CFM_DESC').removeClass("readonly");
              $("#paraMapObj_CFM_EC_CODE").trigger("chosen:updated");
             }
    });
	 		
			
			
			$("#paraMapObj_CFM_EC_CODE").change(function(){
	 		
	 		var cfm_type=$("#paraMapObj_CFM_EC_CODE").val(); 		
	 		//alert(cfm_type);
	 	    var jsondata="";
	 	 	jsondata ={"cfm_type":cfm_type};
	  
	 	     var listUrl=getEcType();
	 	 	 $.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 				var cd=data.ajaxMap.cecDesc;
	 				$("#CFM_DESC").val(cd[0].CEC_DESC);
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	});
	 	
	}); 
			
			
			
			
			
			
			
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
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

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
