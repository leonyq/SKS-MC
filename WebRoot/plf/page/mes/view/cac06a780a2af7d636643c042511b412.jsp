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
			    	        <button type="button" onclick="editMtInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button> <!-- edit(this); -->
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
		<bu:set name="paraMapObj" value="${dataId}" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" type="edit" />
     <div class="mod">	
     <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="保养信息"/></h3>	
     </div>
     </div>

	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9fe40c6681484bbdaeeee44cc7fe3c2a" />
	<input type="hidden" name="9fe40c6681484bbdaeeee44cc7fe3c2a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b6d6096437a640f8aa8f00827d21e11a'" />
		<s:set name="_$formId_1" value="'9fe40c6681484bbdaeeee44cc7fe3c2a'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
		    <td class="name-six" /><span class="dot">*</span><bu:uitn colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" colspan="8" ><bu:ui colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>
		</tr>
		
	</table>
	
	<div style="width:100%;">
	 <div class="mod">	
	 <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="Feeder信息"/></h3>	
     </div>
    </div>
	 <div class="extend-btn" style="float:right;display:none;">
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
			
			<!--<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9fe40c6681484bbdaeeee44cc7fe3c2a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a" onclick="_selectAjaxTableAllData(this,'9fe40c6681484bbdaeeee44cc7fe3c2a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CFM_FIX_SN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>-->
			
			<th class="datagrid-cell" style="width:5%"><dict:lang value="FeederSN"/> </th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="Feeder类型"/></th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="Feeder料号"/></th>
			<th class="datagrid-cell" style="width:10%"><dict:lang value="最后保养时间"/></th>		
		</tr>
		</thead>
		<tbody id="showZJFront">
		</tbody>
		</table>
	   </div>
	   
	   
			<bu:jsVal formId="9fe40c6681484bbdaeeee44cc7fe3c2a" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

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
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			var date='${dataList[0].TCF_MT_LASTTIME}';
			var tct_type="";
			if(${dataList[0].TCT_TYPE}=="1"){
 				              tct_type="单通道";
 				            }else if(${dataList[0].TCT_TYPE}=="2"){
 				              tct_type="双通道";
 				            }else if(${dataList[0].TCT_TYPE}=="3"){
 				              tct_type="三通道";
 				            }
                        var time_date=date.substring(0,date.length-2);
			$("#showZJFront").append("<tr class='showZJFront' id='' name=''></tr>");
	                $("#showZJFront tr:last").append("<td style='width:2%; text-align:center;'><span>1</span></td>");
		    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].TCF_FEEDER_SN}'/> </td>");//
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tct_type+"'/> </td>");
	        $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].TCS_SPEC}'/> </td>");
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='"+time_date+"'/> </td>");
			
			
			var type='${dataMap.TCFM_TYPE}';
	                //alert(type);
			
			if(type==0){
	             //保养
	             $('#paraMapObj_TCF_EC_CODE').val("");
                     $('#paraMapObj_TCF_EC_DES').val(""); 
	                 $('#paraMapObj_TCF_EC_CODE').attr("disabled","disabled"); 
                     $('#paraMapObj_TCF_EC_DES').attr("readonly","readonly"); 
                     $('#paraMapObj_TCF_EC_DES').addClass("readonly");
                     $("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
              
	           }else if(type==1){
	              $('#paraMapObj_TCF_EC_CODE').removeAttr("disabled");
	              $('#paraMapObj_TCF_EC_DES').attr("disabled",false); 
	              //$('#paraMapObj_TCF_EC_DES').removeAttr("readonly");
	              //$('#paraMapObj_TCF_EC_DES').removeClass("readonly");
	              $("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
              
	           }
			            
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		$("#paraMapObj_TCFM_TYPE").change(function(){
	           var type=$(this).val();
	           //alert(type);
	           if(type==0){
	             //保养
	             $('#paraMapObj_TCF_EC_CODE').val("");
                     $('#paraMapObj_TCF_EC_DES').val(""); 
	             $('#paraMapObj_TCF_EC_CODE').attr("disabled","disabled"); 
               
	              $('#paraMapObj_TCF_EC_DES').attr("readonly","readonly"); 
	              $('#paraMapObj_TCF_EC_DES').addClass("readonly");
	              $("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
              
              
	           }else if(type==1){
	             $('#paraMapObj_TCF_EC_CODE').removeAttr("disabled");
	             $('#paraMapObj_TCF_EC_DES').removeAttr("disabled"); 
	              $('#paraMapObj_TCF_EC_DES').removeAttr("readonly");
	              $('#paraMapObj_TCF_EC_DES').removeClass("readonly");
	              $("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
              
	           }
	        });
	        

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>



       $("#paraMapObj_TCF_EC_CODE").change(function(){
	 		
	 		var ecCode=$("#paraMapObj_TCF_EC_CODE").val(); 		
	 		//alert(cfm_type);
	 	         var jsondata="";
	 	 	jsondata ={"ecCode":ecCode};
	  
	 	         var listUrl=getEditEcDescUrl();
	 	 	 $.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 			        //alert(data);
	 				var cd=data.ajaxList;
	 				$("#paraMapObj_TCF_EC_DES").val(cd[0].CEC_DESC);
	 				//alert(cd[0].CEC_DESC);
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	   });
	 	
	         }); 
</script>
<bu:submit viewId="b6d6096437a640f8aa8f00827d21e11a" />
<bu:script viewId="b6d6096437a640f8aa8f00827d21e11a" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
