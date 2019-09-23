<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	
	<!-- head里面 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body>
	<div class="edit">
            <div class="hd">
                    <div style="margin-left:10px;">
                           <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                         
                	</div>			   
                	<div class="optn">
			        <button type="button" onclick="addParentData('${param.piframeId}','${param.formId}','${exeid}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=F3710&funcMId=359ba052b7a94c3a9326871eaaafa422" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
					<!--					<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
									        <input type="hidden" name="dataId" value="${dataId}">
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>-->
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="671b570d08854e6e86c84a8a249ae59e" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="671b570d08854e6e86c84a8a249ae59e" />
	<input type="hidden" name="671b570d08854e6e86c84a8a249ae59e" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'57dfee4dbc9f40b3bf376573e86795b4'" />
		<s:set name="_$formId_1" value="'671b570d08854e6e86c84a8a249ae59e'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" style="width:71px"/><span class="dot">*</span><bu:uitn colNo="CMD_DEVICE_TYPE" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_DEVICE_TYPE" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_DEVICE_TYPE" formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_DEVICE_TYPE}" formIndex="1" /></bu:td>
		
		    <td class="name-three" style="width:96px"/><span class="dot">*</span><bu:uitn colNo="CMD_CHANEL_SN" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" style="width:230px" colNo="CMD_CHANEL_SN" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_CHANEL_SN" formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_CHANEL_SN}" formIndex="1" /></bu:td>
		
		
		</tr>
		<tr>
		   <td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CMD_ITEM_CODE" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_ITEM_CODE" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_ITEM_CODE" formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_ITEM_CODE}" formIndex="1" /></bu:td>
							
			<td class="name-three" /><bu:uitn colNo="CMD_ITEM_NAME" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_ITEM_NAME" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_ITEM_NAME"  formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_ITEM_NAME}" formIndex="1" /></bu:td>
					</tr>
		
		<tr>
		   <td class="name-three" /><bu:uitn colNo="CMD_ITEM_STANDARD" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_ITEM_STANDARD" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_ITEM_STANDARD" formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_ITEM_STANDARD}" formIndex="1" /></bu:td>
		   
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CMD_DEVICE_SEQ" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_DEVICE_SEQ" formId="671b570d08854e6e86c84a8a249ae59e" >
			<select id="paraMap1_CMD_DEVICE_SEQ" name="paraMap1@0#CMD_DEVICE_SEQ" onchange="queryTableL(this.value)" class="_VAL_NULL input isSubmit _VAL_OjbsData dept_select">
	        		<option value=""><dict:lang value="--请选择--"/></option>
	                        
			</select>
			</bu:td>
	   </tr>
		
		<tr>  
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CMD_TABLE_NO" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_TABLE_NO" formId="671b570d08854e6e86c84a8a249ae59e" >
			<select id="paraMap1_CMD_TABLE_NO" name="paraMap1@0#CMD_TABLE_NO" onchange="queryLoadpoint(this.value)" class="_VAL_NULL input isSubmit _VAL_OjbsData dept_select">
	        		
	        <option value=""><dict:lang value="--请选择--"/></option>
			</select>
			</bu:td>
		
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CMD_LOADPOINT" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_LOADPOINT" formId="671b570d08854e6e86c84a8a249ae59e" >
            <select id="paraMap1_CMD_LOADPOINT" name="paraMap1@0#CMD_LOADPOINT"  class="_VAL_NULL input isSubmit _VAL_OjbsData dept_select">
	        		
	        <option value=""><dict:lang value="--请选择--"/></option>
			</select>			</bu:td>
		</tr>
		
		<tr>
		    <td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CMD_POINT_LOCATION" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_POINT_LOCATION" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_POINT_LOCATION" formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_POINT_LOCATION}" formIndex="1" /></bu:td>
		    
		   <td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CMD_POINT_NUM" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
		   <bu:td cssClass="dec-self"  colNo="CMD_POINT_NUM" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_POINT_NUM"  formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_POINT_NUM}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name-three" /><bu:uitn colNo="CMD_FEEDER_SPEC" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colNo="CMD_FEEDER_SPEC" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_FEEDER_SPEC" formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_FEEDER_SPEC}" formIndex="1" /></bu:td>
		    
			
			<td class="name-three" />
				<bu:uitn colNo="CMD_TRY_FLAG" formId="671b570d08854e6e86c84a8a249ae59e" />
			</td>
			<bu:td cssClass="dec" colNo="CMD_TRY_FLAG" formId="671b570d08854e6e86c84a8a249ae59e" >
				<bu:ui colNo="CMD_TRY_FLAG" formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_TRY_FLAG}" formIndex="1" />
				
				&#x3000;&#x3000;&#x3000;&#x3000;
				<bu:uitn colNo="CMD_SHKIP_FLAG" formId="671b570d08854e6e86c84a8a249ae59e" />
				<bu:ui colNo="CMD_SHKIP_FLAG" formId="671b570d08854e6e86c84a8a249ae59e" value="%{CMD_SHKIP_FLAG}" formIndex="1" />
				
				
				
			</bu:td>			
		</tr>
		<tr>
		    <td class="name-three" /><bu:uitn colNo="CMD_MEMO" formId="671b570d08854e6e86c84a8a249ae59e" /></td>
			<bu:td cssClass="dec-self" colspan="3" colNo="CMD_MEMO" formId="671b570d08854e6e86c84a8a249ae59e" ><bu:ui colNo="CMD_MEMO" rows="3" formId="671b570d08854e6e86c84a8a249ae59e" style="width:100%" value="%{CMD_MEMO}" formIndex="1" /></bu:td>
		
		</tr>
		
	</table>
			<bu:jsVal formId="671b570d08854e6e86c84a8a249ae59e" formIndex="1" />
									</form>
			</div>
		
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:script viewId="57dfee4dbc9f40b3bf376573e86795b4" />

<script type="text/javascript">
    var areaSn='<c:out value="${param.areaSn}"/>';
    var modelCode='<c:out value="${param.modelCode}"/>';
	function init(){
	   // $("#paraMap1_CMD_DEVICE_SEQ").attr("disabled","disabled");
		queryDeviceSeq();
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	var queryUrl="${path}buss/bussModel_exeFunc.ms?funcMId=359ba052b7a94c3a9326871eaaafa422&formId=%{formId}";
	function queryDeviceSeq(){
	
	console.log(queryUrl);
	console.log("areaSn:"+areaSn);
	
	   	//var cmdDeviceType = $("#paraMap1_CMD_DEVICE_TYPE").val();
	   $.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: queryUrl,
 	    	data:{
 	    	    "areaSn":areaSn,
 	    	    "type":"1"
 	    	},
 			success: function(data){
 				var pList=data.ajaxList; 
 				console.log("pList:"+pList);
 				$("#paraMap1_CMD_DEVICE_SEQ").empty();	
 				$("#paraMap1_CMD_DEVICE_SEQ").append("<option value='''><dict:lang value="--请选择--"/></option>");
 				for(var i=0;i<pList.length;i++){ 				  
 				   $("#paraMap1_CMD_DEVICE_SEQ").append("<option value='"+pList[i].MKEY+"'>"+pList[i].VAL+"<option>"); 
 				 }
 				$("#paraMap1_CMD_DEVICE_SEQ").trigger("chosen:updated");
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 			
 		   }
 		});
 		
	}
	
	function queryTableL(val){
	  
	$("#paraMap1_CMD_TABLE_NO").empty();
	$("#paraMap1_CMD_TABLE_NO").append("<option value='''><dict:lang value="--请选择--"/></option>");
	 
	  jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: queryUrl,
 	    	data:{
 	    	    "areaSn":areaSn,
 	    	    "seviceSeq":val,
 	    	    "type":"2"
 	    	},
 			success: function(data){
 				var pList=data.ajaxList; 				
 				for(var i=0;i<pList.length;i++){ 				  
 				   $("#paraMap1_CMD_TABLE_NO").append("<option value='"+pList[i].CDL_TABLE+"'>"+pList[i].CDL_TABLE+"<option>");
 				}
 				$("#paraMap1_CMD_TABLE_NO").trigger("chosen:updated");
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				
 		   }
 		});
	}
	
	function queryLoadpoint(val){
	   $("#paraMap1_CMD_LOADPOINT").empty();
	   $("#paraMap1_CMD_LOADPOINT").append("<option value='''><dict:lang value="--请选择--"/></option>");
	   var seviceSeq=$("#paraMap1_CMD_DEVICE_SEQ").val();
	  jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: queryUrl,
 	    	data:{
 	    	    "areaSn":areaSn,
 	    	    "seviceSeq":seviceSeq,
 	    	    "type":"3",
 	    	    "table":val
 	    	},
 			success: function(data){
 				var pList=data.ajaxList; 				
 				for(var i=0;i<pList.length;i++){ 				  
 				   $("#paraMap1_CMD_LOADPOINT").append("<option value='"+pList[i].CDL_LOADPOINT+"'>"+pList[i].CDL_LOADPOINT+"<option>");
 				}
 				$("#paraMap1_CMD_LOADPOINT").trigger("chosen:updated");
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				
 		   }
 		});
	}
	
	$.fn.serializeObject = function()
	{
		var o = {};
		var a = this.serializeArray();
		$.each(a, function()
		{
			if (o[this.name]){
				if( !o[this.name].push){
					o[this.name] = [o[this.name]];
				}
				o[this.name].push(this.value || '');
			}
			else{
				o[this.name] = this.value || '';	
			}
		});
		return o;
	}
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	function addParentData(e,formId,viewid)
	{
	     if(!val.valNullData()){
			return ;
		}
		if(!valData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		} 
		if(!val.valDataBaseSetData()){
		    return ;
	    }
		var parentWindows = $(window.parent.document).contents().find("#"+e)[0].contentWindow;
		parentWindows.addData(e,formId);
		var colNo;
		var colNoValue;
		  $("table").find("td").each(function(i,item){
		        var colNo=$(item).attr("colno");
		        if(colNo==undefined ) return true;
		        console.log(item);
		        colNoValue=$(item).find(":input[name^='paraMap'][name$='"+colNo+"']").val();
		        if(colNo=='CMD_SHKIP_FLAG'||colNo=='CMD_TRY_FLAG') {
		           if(!$(this).find(":input[name^='paraMap'][name$='"+colNo+"']").is(":checked")){
		                colNoValue='N';
		            } 
		        }
		          
				parentWindows.editData(formId,colNo,colNoValue);
				if(colNo=='CMD_TRY_FLAG'){//TRY盘物料和跳过标志同一td,加一次回填
				   colNo='CMD_SHKIP_FLAG';
				   colNoValue=$(item).find(":input[name^='paraMap'][name$='"+colNo+"']").val();
				   
		           if(colNo=='CMD_SHKIP_FLAG'||colNo=='CMD_TRY_FLAG') {
		             if(!$(this).find(":input[name^='paraMap'][name$='"+colNo+"']").is(":checked")){
		                colNoValue='N';		                
		              }     
		          }
				  parentWindows.editData(formId,colNo,colNoValue);
				}
		}); 
		var itemCode=$("#paraMap1_CMD_ITEM_CODE").val();
		
        jQuery.ajax({
 			type: "POST",
 			async:false,
 	   		dataType: "json",
 	    	url: queryUrl+"&itemCode="+itemCode+"&modelCode="+modelCode+"&type=4",
 			success: function(data){
 				parentWindows.editData(formId,'CMD_BOM_FLAG',data.ajaxString);
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				
 		   }
 		});
 		parentWindows.calItemCount(formId);
		if($("#isCloseWin").attr('checked')){
		   closeTopPopWinFp(window.frameElement.id + "pop");
		}
	}
	
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 
 
