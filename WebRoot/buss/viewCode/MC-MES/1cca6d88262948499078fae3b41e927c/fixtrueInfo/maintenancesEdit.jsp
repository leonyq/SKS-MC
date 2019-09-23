<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
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
	
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" /> 
</jsp:include> 
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
      <jsp:param name="location" value="jsLoading" />
   </jsp:include>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>

</head>
<body style="overflow:hidden">
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
<div class="save-close" style="display:none;" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>                
				<s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
			</div>
			    	<div class="optn" >
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
					
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
		   				<jsp:param name="location" value="editForm" />
		            </jsp:include>
<bu:set name="paraMapObj" value="${dataId}" formId="9e447f80074441dcb0541aa75341e0b5" type="edit" />		
     <div class="mod">	
     <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="保养信息"/></h3>	
     </div>
     </div>
    <table class="basic-table" >
	<input type="hidden" name="formIds" value="9e447f80074441dcb0541aa75341e0b5" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="9e447f80074441dcb0541aa75341e0b5" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'6aa4306c2d4a41f88d13efc8a4a3312e'" />
		<s:set name="_$formId_1" value="'9e447f80074441dcb0541aa75341e0b5'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:84px;"/><span class="dot">*</span><bu:uitn colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" style="width:52px;"/><span class="dot">*</span><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" style="width:82px;"/><span class="dot">*</span><bu:uitn colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
	        </tr>
	        <tr>
	        	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		    
			<td class="name" /><bu:uitn colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		    
			<td class="name" />不良描述</td>
			<bu:td cssClass="dec" colNo="CFM_DESC" formId="9e447f80074441dcb0541aa75341e0b5" ><input type="text" id="CFM_DESC" name="CFM_DESC" class=" input isSubmit " style="width:200px;"></bu:td>
	        </tr>
		<tr>
		    	<td class="name" /><bu:uitn colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" colspan="5"><bu:ui colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" style="height:80px;width:100%"/></bu:td>
		</tr>
		
	</table>
	<div style="width:100%;">
	 <div class="mod">	
	 <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="制具信息"/></h3>	
     </div>
    </div>
	 <div class="extend-btn" style="float:right;margin:5px 0;">
			<!--<button type="button" id="front_add" onclick="popWorkDiv('backShadow','zjalert')" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" id="front_delete" onclick="delFrontList();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button> -->    		        
   	</div>	
	</div>
	  <div class="mod-hd" style="border-bottom: none;clear:both;"> 
	   			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner"  id="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
									<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="selectAll2"/></td >
		                        	<td class="datagrid-cell" style="width:185px;"><dict:lang value="制具SN"/> </td>
		                           	<td class="datagrid-cell" style="width:185px;"><dict:lang value="制具类型"/></td>
                        			<td class="datagrid-cell" style="width:185px;"><dict:lang value="制具料号"/></td>
                        			<td class="datagrid-cell" style="width:185px;"><dict:lang value="制具名称"/></td>
                        			<td class="datagrid-cell" style="width:185px;"><dict:lang value="最后保养时间"/></td>		
                        		</tr>
                        		</tbody>
                        		</table>
							</div>
						</div>
					<!--	<div class="datagrid-body datagrid-div3 scroll" style="height:200px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="showZJFront" >
								</tbody>
							</table>
						</div> -->
						
							</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="showZJFront" >
								</tbody>
							</table>
						</div>
						
						
					</div>
				</div>


<!---->			<bu:jsVal formId="9e447f80074441dcb0541aa75341e0b5" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	    	<script>
    	    var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
		/*	if(!valData()){
				return ;
			}*/
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
		        return ;
	        }
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
    	</script>
<bu:submit viewId="6aa4306c2d4a41f88d13efc8a4a3312e" />
		<bu:script viewId="6aa4306c2d4a41f88d13efc8a4a3312e" />

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 
			});
		
		
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$("#paraMapObj_CFM_TYPE").trigger("chosen:updated");
			$("#paraMapObj_CFM_EC_CODE").trigger("chosen:updated");
			
			$("#CFM_DESC").val($("#CFM_DESC").val());
			
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
	        $("#showZJFront tr:last").append("<td style='width:30px; text-align:center;'><span>1</span></td>");
		    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:185px; text-align:center;'>${dataList[0].CFM_FIX_SN}</td>");//
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:185px; text-align:center;'>${dataList[0].CFM_ITEM_TYPE}</td>");
	        $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:185px; text-align:center;'>${dataList[0].CFM_ITEM_CODE}</td>");
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:185px; text-align:center;'>${dataList[0].CFM_ITEM_NAME}</td>");
	 	    $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:185px; text-align:center;'>"+time_date+"</td>");
		    $("#front_add").attr("disabled", true); 
            $("#front_delete").attr("disabled", true);
            setPopScroll('.scroll','.datagrid-header-inner');
		 	 defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
			
			
			
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
		
		
		if($("#paraMapObj_CFM_TYPE").val()=='0'){
		
	      $('#paraMapObj_CFM_EC_CODE').attr("disabled","disabled"); 
               
              $('#CFM_DESC').attr("readonly","readonly"); 
              $('#CFM_DESC').addClass("readonly");
              $("#paraMapObj_CFM_EC_CODE").trigger("chosen:updated");
		
		
		}
	
		
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
             
             
              $("#paraMapObj_CFM_EC_CODE").trigger("chosen:updated");
             }
    });
	 		
			
			
			
			$("#paraMapObj_CFM_EC_CODE").change(function(){
	 		
	 		var cfm_type=$("#paraMapObj_CFM_EC_CODE").val(); 
	 		//alert(cfm_type);
	 		if(cfm_type==""){
			  $("#CFM_DESC").val("");
			}else{
	 	          var jsondata="";
	 	 	  jsondata ={"cfm_type":cfm_type};
	  
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
	 				$("#CFM_DESC").val(cd[0].CEC_DESC);
	 			},
	 			error:function(msg){
	 			        console.log(msg);
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	          });
	 	          }
	 	
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
			//var cfm_type=$("#paraMapObj_CFM_EC_CODE").val(); 	
			var cfm_type="${param.dataId}"; 
	 		//alert(cfm_type);
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
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
	 
	 function getEcType2(){
        //var _currentFrame='iframe3';
        //var zjlisturl ="@{funcUrl}&formId=%{formId}&iframeId="+_currentFrame;
        //return zjlisturl;
        var zjlisturl ="${path}buss/bussModel_exeFunc.ms?funcMId=88c3db89f38941fe84464ea5ac6eb720";  // VM-保养维修-编辑 操作功能 获取不良内容保养维修
        //alert(zjlisturl);
        return zjlisturl;
        }

</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>

