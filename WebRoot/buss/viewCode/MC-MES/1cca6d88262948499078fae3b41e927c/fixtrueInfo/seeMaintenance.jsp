<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
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
	
			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  
  <style>
        .basic-table .input{
            width:200px;
        }
  </style>
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9e447f80074441dcb0541aa75341e0b5" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9e447f80074441dcb0541aa75341e0b5" />
	<input type="hidden" name="9e447f80074441dcb0541aa75341e0b5" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d38dbfcd6da645d39adcc1307e603443'" />
		<s:set name="_$formId_1" value="'9e447f80074441dcb0541aa75341e0b5'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
		    <td class="name" style="width:84px;" /><bu:uitn colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
	
		    <td class="name" style="width:84px;"  /><bu:uitn colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
	
		    <td class="name" style="width:52px;"  /><bu:uitn colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
		
            <td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" >
			<input type="text" name="select" class="input isSubmit" readonly="readonly" value="" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}"  id="paraMapObj_CFM_TYPE"></bu:td>		    	

			
	
		    <td class="name" /><bu:uitn colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CFM_DESC " formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_DESC " formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_DESC" id="CFM_DESC" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
	
		    	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
	
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
	
			<td class="name" /><bu:uitn colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="CFM_MT_TIME" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_MT_TIME" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_TIME" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
	
				<td class="name" /><bu:uitn colNo="CFM_ITEM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_ITEM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
	
			
	
			<td class="name" /><bu:uitn colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    	<td class="name" /><bu:uitn colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" colspan="7"><bu:ui colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" style="height:80px;width:100%;"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="9e447f80074441dcb0541aa75341e0b5" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	    	$(function(){
	    	    getInfo();
	    	})
	    	function getInfo(){
	    	    var ID="<c:out value='${dataId}' />";
	    	   
	    	    getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=1398352531b14ba6975120b49f51a5c0"; 
	    	    $.ajax({
	    	        type:"post",
	    	        dataType:"json",
	    	        data:{
	    	         'ID':ID   
	    	        },
	    	        url:getInfoUrl,
	    	        success:function(data){
	    	        
	    	            if(data.ajaxList != null && data.ajaxList != ""){//data.ajaxList
	    	                	if(data.ajaxList[0].CFM_TYPE=="0"){
	    	                	    $("#paraMapObj_CFM_TYPE").val("保养");
     						
	    	                	}else if(data.ajaxList[0].CFM_TYPE=="1"){
	    	                	    $("#paraMapObj_CFM_TYPE").val("维修");
	    	                	    desc();
	    	                	}
	    	                	
	    	                	//$("#CFM_DESC").val(data.ajaxList[0].CEC_DESC);
	    	                	
     						
						}
     					
	    	        },
	    	        error: function(msg){
     				if(msg.readyState!=0){
     					utilsFp.alert("error:"+msg);
     				}
     			  }
	    	    })
	    	    
	    	}
	
	</script>
<script type="text/javascript">	
	function desc(){
			//var cfm_type=$("#paraMapObj_CFM_EC_CODE").val(); 	
			console.log("Sawdasd");
			var cfm_type="${param.dataId}"; 
	 		if(cfm_type==""){
			  $("#CFM_DESC").val("");
			}else{
	 	          var jsondata="";
	 	 	  jsondata ={"cfmId":cfm_type};
	  
	 	          var listUrl=getEcType2();
	 	     
	 	 	 $.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 			
	 			//alert();
	 				//var cd=data.ajaxMap.cecDesc;
	 				var cd=data.ajaxList;
	 					console.log("cd==>",cd);
	 				$("#CFM_DESC").val(cd[0].CEC_DESC);
	 			},
	 			error:function(msg){
	 			        console.log(msg);
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	          });
	 	          }
		}
		
	 
	 function getEcType2(){
        //var _currentFrame='iframe3';
        //var zjlisturl ="@{funcUrl}&formId=%{formId}&iframeId="+_currentFrame;
        //return zjlisturl;
        var zjlisturl ="${path}buss/bussModel_exeFunc.ms?funcMId=88c3db89f38941fe84464ea5ac6eb720"; 
        //alert(zjlisturl);
        return zjlisturl;
        }

</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
