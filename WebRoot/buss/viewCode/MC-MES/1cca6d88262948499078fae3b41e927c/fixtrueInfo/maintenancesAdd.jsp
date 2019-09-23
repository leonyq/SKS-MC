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
	<style>
		.dec .chosen-container{
			width:200px !important;
		}
		
		.dlist-table tbody td{
		    line-height:30px;
		}
	</style>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>

	<!-- head里面 -->
	<style type="text/css">
	.black_overlay{
					display: none;
					position: absolute;
					top: 0%;
					left: 0%;
					width: 100%;
					height: 100%;
					background-color: #000;
					z-index: 1001;
					opacity:0.3;
					filter:alpha(opacity=30);	
				}
	</style>
</head>
<body style="overflow:hidden;">
	<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
                <div style="margin-left:10px;">
                           <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                           	<s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
					id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                		<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
					listKey="id" listValue="name"  name="_DATA_AUTH"
					id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   		</s:else>
                		</s:if>	
                	</div>
			    <div class="optn">
			       
			        <button type="button" onclick="fixUrl()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 534px;">
				
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9e447f80074441dcb0541aa75341e0b5" type="add" />
   <div class="mod">		
   <div class="mod-hd">		
   <h3 class="tit"><dict:lang value="保养信息"/></h3>	
   </div>
	 <div class="mod-hd" style="height:160px;border-bottom: none;z-index: 1;">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9e447f80074441dcb0541aa75341e0b5" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='123456'/>
	<input type="hidden" name="9e447f80074441dcb0541aa75341e0b5" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="ids" id="ids"/>
	<input type="hidden" name="sns" id="sns"/>  
	<input type="hidden" name="codes" id="codes"/>  
	<input type="hidden" name="names" id="names"/> 
	<input type="hidden" name="types" id="types"/> 
	<input type="hidden" name="cfmId" id="cfmId" value="0"/>
	
		<s:set name="_$viewId" value="'32883234cc4f41fba0cfe46899b52012'" />
		<s:set name="_$formId_1" value="'9e447f80074441dcb0541aa75341e0b5'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name" style="width:84px"/><span class="dot">*</span><bu:uitn colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_TYPE}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" style="width:52px"/><span class="dot">*</span><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_REPORTER}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" style="width:82px"/><span class="dot">*</span><bu:uitn colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_MT_MAN}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_AUDIT}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_EC_CODE}" formIndex="1" style="width:200px;"/></bu:td>
		  
			<td class="name" />不良描述</td>
			<bu:td cssClass="dec" colNo="CFM_DESC" formId="9e447f80074441dcb0541aa75341e0b5" ><input type="text" id="CFM_DESC" name="CFM_DESC" class=" input isSubmit " style="width:200px;"></bu:td>
		</tr>
 		<tr>
			<td class="name-six" /><bu:uitn colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" colspan="8"><bu:ui colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_DEFECT_REMARK}" formIndex="1" style="width:100%;"/></bu:td>
		</tr>
	</table>
	</div>
	
	<div style="width:100%;">
	 <div class="mod-hd" style="margin-bottom:5px;">		
     <h3 class="tit"><dict:lang value="制具信息"/></h3>	
     <div class="extend-btn" style="float:right;margin: 5px 0;">
			<button type="button" id="front_add" onclick="popWorkDiv('backShadow','test')" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" id="front_delete" onclick="delFrontList();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   	</div>	
     </div>
     
	 </div>
	  <div class="mod-hd" style="border-bottom: none;clear:both;"> 
	   			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
									<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="selectAll2" name="allSelect" onchange="select_All();"/></td >
		                        	<td class="datagrid-cell" style="width:171px;"><dict:lang value="制具SN"/> </td>
		                           	<td class="datagrid-cell" style="width:171px;"><dict:lang value="制具类型"/></td>
                        			<td class="datagrid-cell" style="width:171px;"><dict:lang value="制具料号"/></td>
                        			<td class="datagrid-cell" style="width:171px;"><dict:lang value="制具名称"/></td>
                        			<td class="datagrid-cell" style="width:171px;"><dict:lang value="最后保养时间"/></td>		
                        		</tr>
                        		</tbody>
                        		</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="showZJFront" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
		<!--<tbody id="showZJFront" style="height:150px;">
		</tbody> 
		
	    <div class="main" style="overflow-y: auto;overflow-x: hidden;height: 249px;">
       		 <table  class="dlist-table table-line btable" style="width: 100%;table-layout: fixed;" >
			<tbody id="showZJFront">
			</tbody>
		</table>
	    </div>-->
		
	        
	        <div id="test" class="black_overlay"></div>
		<div class="dialog" id="backShadow"  style="top: 20px; left: 253px; width: 810px; height: 560px; z-index: 3099;display: none;background-color: white;border-radius: 8px;">
		 <div style="display: block;" >
			<div class="dialog-s1" id="addRole" style="width:810px;display:block;left:253px;">
			<div class="dialog-hd">
			
				选择制具
			</div>
			</div>
		</div>
			<a class="dialog-close" href="javascript:void(0);" onclick="closeAlert('backShadow','test');"></a>
			<div class="dialog-bd-div">
			<div class="optn optn_div" >
				        <button type="button" onclick="choseZjList('backShadow','test')"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
				        <button type="button" onclick="closeAlert('backShadow','test');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
				        <button type="button" onclick="getZjList('formId3')"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
		    </div>
		    	   
		    	<div id="zjalert"  style="z-index:9999;margin-top: 0px;">
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;制具SN <input type="text"  class="dec-self input" id="zj_sn" name="zj_sn"/> 
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;制具类型 
				 <select class="dec-self input" id="zj_type" name="zj_type">
				     <option value="0">--请选择--</option>	
				     <option value="2">钢网</option>	
				     <option value="3">刮刀</option>	
				 </select>
				
			 
					   				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" style="width:30px; text-align:center;"><span></span></td>
									<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll1" onclick="selectAll()" style="cursor: pointer;" title="全选"></span></td>
									<td class="datagrid-cell" style="width:171px;"><dict:lang value="制具SN"/> </td>
									<td class="datagrid-cell" style="width:171px;"><dict:lang value="制具类型"/></td>
									<td class="datagrid-cell" style="width:171px;"><dict:lang value="制具料号"/></td>
									<td class="datagrid-cell" style="width:171px;"><dict:lang value="制具名称"/></td>
									<td class="datagrid-cell" style="width:171px;"><dict:lang value="最后保养时间"/></td>								
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:330px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax123456" >
								<tbody id="zjTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
						
			    	<div style="background-color: white;">
					<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=getZjList2&formId=formId3&showLoading=0" />
					</div>
			     	</div>
			     
					</div>
		    		</div>
		    
	    </div>
 
		</div>
	
	
	</div>
			<bu:jsVal formId="9e447f80074441dcb0541aa75341e0b5" formIndex="1" />
									</form>
			</div>
		
	

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
		<bu:submit viewId="32883234cc4f41fba0cfe46899b52012" />
		<bu:script viewId="32883234cc4f41fba0cfe46899b52012" />
<script type="text/javascript">
    function getEcType(){
        var zjlisturl ="${path}buss/bussModel_exeFunc.ms?funcMId=dc602a133c9c4de7bd8571815b2d71d6"; // VM-保养维修-保存 操作功能 获取不良内容
        return zjlisturl;
    }


	function fixUrl(){

            saveFix();
            if($("#paraMap1_CFM_TYPE").val()==""){
             _alertValMsg($("#paraMap1_CFM_TYPE_chosen"),"该项不能为空");
            return;
            }
            
            if($("#ids").val()==""){
                utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加制具信息" />",0,"","");
            
            return;
            }
            
            if($("#paraMap1_CFM_TYPE").val()=="1"&&$("#paraMap1_CFM_EC_CODE").val()==""){
             _alertValMsg($("#paraMap1_CFM_EC_CODE_chosen"),"请选择不良代码");
            return;
            } 
            
            //if($("#paraMap1_CFM_TYPE").val()=="0"){
            //$('#paraMap1_CFM_EC_CODE_chosen').removeClass('_VAL_NULL');
            //}
            
            
            if($("#paraMap1_CFM_REPORTER").val()==""){
             _alertValMsg($("#paraMap1_CFM_REPORTER_SHOW"),"该项不能为空");
            return;
            }
            if($("#paraMap1_CFM_MT_MAN").val()==""){
             _alertValMsg($("#paraMap1_CFM_MT_MAN_SHOW"),"该项不能为空");
            return;
            }
            if($("#paraMap1_CFM_AUDIT").val()==""){
             _alertValMsg($("#paraMap1_CFM_AUDIT_SHOW"),"该项不能为空");
            return;
            }
            //if(!val.valNullData()){
				//return ;
			//}
			//if(!valData()){
				//return ;
			//}
			//if(!val.valOjbsData()){
				//return ;
			//}
			//if(!val.valDataBaseSetData()){
		        //return ;
	        //}
   if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
	$("#addForm").append($("#isCloseWin").clone());
	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
   }
   //"${path}buss/bussModel_exeFunc.ms?funcMId=dd1a733b73254caf9e472c3b49c5630c";
    	var url = "${path}buss/bussModel_exeFunc.ms?funcMId=dd1a733b73254caf9e472c3b49c5630c";
    	document.forms.addForm.action=url;
    //document.forms.addCalForm.action 
 // document.forms.addCalForm.submit();
 document.forms.addForm.submit();
}





    function getListUrl(){
        var zjlisturl ="${path}buss/bussModel_exeFunc.ms?funcMId=fbc64ebba1c9421ab7c36b9a04915893"; //VM-保养维修-保存 操作功能 选择制具
        return zjlisturl;
    }

	function init(){
		$('.btable').width($('.htable').width())
		
		
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
	
		
		if('${dataList[0].CFM_FIX_SN}'){
		
		
		$("#paraMap1_CFM_REPORTER_SHOW").val('${dataList[1].cfmReporterShow}');
		
		
		
		$("#paraMap1_CFM_TYPE").val('${dataList[0].CFM_TYPE}');
		$("#paraMap1_CFM_TYPE").trigger("chosen:updated");
		
		
		
		$("#paraMap1_CFM_REPORTER").val('${dataList[0].CFM_REPORTER}'); 
		$("#paraMap1_CFM_DEFECT_REMARK").val('${dataList[0].CFM_DEFECT_REMARK}');
        	$('#paraMap1_CFM_MT_MAN').val('${dataList[0].CFM_MT_MAN}');
        	$('#paraMap1_CFM_AUDIT').val('${dataList[0].CFM_AUDIT}');
       	 	$('#cfmId').val('${dataList[0].ID}');
         
	         $("#showZJFront").append("<tr class='showZJFront' id='' name=''></tr>");
	     	 $("#showZJFront tr:last").append("<td style='width:30px; text-align:center;'><span>1</span></td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'><dict:lang value='${dataList[0].CFM_FIX_SN}'/> </td>");//
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style=' width:171px;text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_TYPE}'/> </td>");
	     	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style=' width:171px;text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_CODE}'/> </td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style=' width:171px;text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_NAME}'/> </td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'><dict:lang value='${dataList[0].CFM_MT_TIME}'/> </td>");
		 $("#front_add").attr("disabled", true); 
         $("#front_delete").attr("disabled", true); 
         defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
		
		}else{
			$("#front_add").attr("disabled", false); 
            		$("#front_delete").attr("disabled", false); 
		}
		
		
	          $('#paraMap1_CFM_EC_CODE').attr("disabled","disabled");   
              $('#CFM_DESC').attr("readonly","readonly"); 
              $('#CFM_DESC').addClass("readonly");
              $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated");
	
          
         
         	
       
       
         
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	 	function popWorkDiv(showId,backId){
	 	$("#"+showId+",#"+backId).show();
		$("#"+showId).draggable({cancel:'.dialog-bd-div'});
		//$("#test").draggable();
		$('.chosen-container').css("width","230px");
		getZjList(paginationImpl);
		}
	 	
	 	function closeAlert(showId,backId){
	 		$("#"+showId).hide();
	 		$("#"+backId).hide();
	 		
	 	}
        var paginationImpl = {};
	 	function getZjList(paginationImpl){
	 		
	 	//	&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"
	 	//	&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	 		
	 	 util.showLoading("处理中...");
	 	 var zj_sn=$.trim($("#zj_sn").val());
	 	 var zj_type=$.trim($("#zj_type").val());
	 	 var jsondata="";
	 	 if($("#cfmId").val()==0){
	 	 	 jsondata ={"zj_sn":zj_sn,"zj_type":zj_type};
	 	 }else{
	 	 	jsondata ={"zj_sn":zj_sn,"zj_type":zj_type,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord};
	 	 }
	 	 var listUrl=getListUrl();
	 	 //var cpage = _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
	 	 //var pager = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	 	// console.log(cpage+","+pager);
	 		$.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 				util.closeLoading();
	 				//var zjLists=data.ajaxMap.zjList;   data.ajaxPage.dataList.
	 				
	 				var zjLists=data.ajaxPage.dataList;
	 				//if(null==data.ajaxMap.zjList){	
	 				if(null==data.ajaxPage.dataList){
	 					utilsFp.alert("没查询到数据");
	 					 $("#zjTbody").html("");
	 				}else{	 
	 					     $("#zjTbody").html("");
	 					     var j=0;
	 					    for(var i = 0;i < zjLists.length; i++){
	 					    
	 					        
	 						var zj= zjLists[i];
	 						if(zj.ASSISTANTTOOLNAME== null) {
								zj.ASSISTANTTOOLNAME= "";
							} 
	 					    j=++j;
	 					    if(j%2==0){
                             $("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;background:#dcecfa;' id=zjId_"+zj.ID+" name=zjId_"+zj.ID+"></tr>"); 
                           }else{
                           	$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;' id=zjId_"+zj.ID+" name=zjId_"+zj.ID+"></tr>");
                           }
	 						$("#zjTbody tr:last").append("<td style='width:30px; text-align:center;'><span>"+j+"</span></td>");
	 						$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' id='selectAll_9e447f80074441dcb0541aa75341e0b5' style='cursor: pointer;'></span></td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:171px;  text-align:center;'>"+zj.CFI_FIX_SN+"</td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+zj.VALUE+"</td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:171px;text-align:center;'>"+zj.CFI_ITEM_CODE+"</td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+zj.ASSISTANTTOOLNAME+"</td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+zj.CFI_INSTOCK_TIME+"</td>");	
	 				        
	 				     
	 				        
	 				        
                           $("#zjId_"+zj.ID).click(function(event){
                           	
                           	var index = $(this).find("td:eq(0)").text();
                           	  
                         	if($(':checkbox',this).prop('checked')==true){
                           		$(':checkbox',this).attr("checked", false);
                           		if(index%2==0){
                           			$(this).css("background-color","#dcecfa");
                           		}else{
                           			$(this).css("background-color","");
                           		}
                           		
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#d3eafc");
                           }  
                             event.stopPropagation();
                           });
                           
                      
                            $(':checkbox',"#zjId_"+zj.ID).click(function(event){
                         	if($(':checkbox',this).prop('checked')==true){
                           	     $(':checkbox',this).attr("checked", false);
                           	     $(this).css("background-color","");
                           	   
                           	   /* var index=$(this).find("td:eq(0)").text();
	 			                 if(index%2==0){
                                   $(this).css("background-color","#dcecfa");
                                        }else{
                           		   $(this).css("background-color","");
                                 }*/
                                        
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#d3eafc");
                           }  
                             event.stopPropagation();
                          });
	 					    }
	 					    
	 					 pageFun(data.ajaxPage,"formId3");  
	 					 defTableWidthRewrite("123456");
	 				}
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}
	 		});
	 		
             	 

	 	}
	 	function getZjList2(paginationImpl){
	 		
	 	 util.showLoading("处理中...");
	 	 var zj_sn=$.trim($("#zj_sn").val());
	 	 var zj_type=$.trim($("#zj_type").val());
	 	 var jsondata="";
	 	 
	 	 jsondata ={"zj_sn":zj_sn,"zj_type":zj_type,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord};
	 	 
	 	 var listUrl=getListUrl();
	 	 var cpage = _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
	 	 var pageR = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	 	 var j=(cpage-1)*pageR;
	 		$.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 				util.closeLoading();
	 				//var zjLists=data.ajaxMap.zjList;   data.ajaxPage.dataList.
	 				
	 				var zjLists=data.ajaxPage.dataList;
	 				//if(null==data.ajaxMap.zjList){	
	 				if(null==data.ajaxPage.dataList){
	 					utilsFp.alert("没查询到数据");
	 					 $("#zjTbody").html("");
	 				}else{	 
	 					     $("#zjTbody").html("");
	 					     
	 					    for(var i = 0;i < zjLists.length; i++){
	 					    
	 						var zj= zjLists[i];
	 						if(zj.ASSISTANTTOOLNAME== null) {
								zj.ASSISTANTTOOLNAME= "";
							} 
	 					    j=++j;
	 					    if(j%2==0){
	 					    	$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;background:#dcecfa;' id=zjId_"+zj.ID+" name=zjId_"+zj.ID+"></tr>");
	 					    }else{
	 					    	$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;' id=zjId_"+zj.ID+" name=zjId_"+zj.ID+"></tr>");
	 					    }
	 						
	 						$("#zjTbody tr:last").append("<td style='width:30px; text-align:center;'><span>"+j+"</span></td>");
	 						$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' id='selectAll_9e447f80074441dcb0541aa75341e0b5' style='cursor: pointer;'></span></td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style=' width:171px;text-align:center;'>"+zj.CFI_FIX_SN+"</td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+zj.VALUE+"</td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style=' width:171px;text-align:center;'>"+zj.CFI_ITEM_CODE+"</td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+zj.ASSISTANTTOOLNAME+"</td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+zj.CFI_INSTOCK_TIME+" </td>");	//CFI_MT_DATE
	 				 
                           $("#zjId_"+zj.ID).click(function(event){
                           	 	
                           	 var index = $(this).find("td:eq(0)").text();
                           	 
                         	if($(':checkbox',this).prop('checked')==true){
                           		$(':checkbox',this).attr("checked", false);
                           		 
                           		if(index%2==0){
                           			$(this).css("background-color","#dcecfa");
                           		}else{
                           			$(this).css("background-color","");
                           		}
                           		
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#d3eafc");
                           }  
                             event.stopPropagation();
                           });
                           
                      
                            $(':checkbox',"#zjId_"+zj.ID).click(function(event){
                         	if($(':checkbox',this).prop('checked')==true){
                           	     $(':checkbox',this).attr("checked", false);
                           	     $(this).css("background-color","");
                           	  /* var index=$(this).find("td:eq(0)").text();
	 			                 if(index%2==0){
                                   $(this).css("background-color","#dcecfa");
                                        }else{
                           		   $(this).css("background-color","");
                           		   
                                 }*/
                           	   
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#d3eafc");
                           }  
                             event.stopPropagation();
                          });
	 					    }
	 					    
	 					 pageFun(data.ajaxPage,"formId3");   
	 					 defTableWidthRewrite("123456");
	 				}
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}
	 		});
	 	}
	 	
	 	
	 	
	 	function choseZjList(showId,backId){
	
	 	  var len=$("#showZJFront tr").length;
	 	 
	 	  
	 	  if(len==0){
	 	  	  var i=0;
	 	  $("#zjTbody :checkbox").each(function(){
	 			 if($(this).attr("checked")){
	 				var trid = $(this).parent().parent().parent().attr("id");
	 				var trSN=$(this).parent().parent().parent().find("td:eq(2)").text();
	 				getInfoToFront(trid,++i);
	 			} 
	 		});  
	 		    $("#"+showId).hide();
	 		    $("#"+backId).hide();
	 		    $("#selectAll1").attr("checked",false);
	 		
	 	  }else{//先判断是否存在相同的SN，若相同则忽略，否则添加
	 	   
	 	        $("#zjTbody :checkbox").each(function(){
	 			 if($(this).attr("checked")){
	 			 	var is="0";
	 				var trid = $(this).parent().parent().parent().attr("id");
	 				var trSN=$(this).parent().parent().parent().find("td:eq(2)").text();
	 				
	 				$("#showZJFront tr").each(function(){
	 	         	var zjSN=$(this).find("td:eq(2)").text();
	 	         	if(trSN==zjSN){
	 					is="1";
	 				}	
	 	         	
	 	        	 });
	 	        	 
	 	        	 if(is=="0"){ 	 
	 					len=parseInt(len)+parseInt(1); 
	 					getInfoToFront(trid,len);
	 	        	 }
	 				
	 			} 
	 		});  
	 	        $("#"+showId).hide();
	 		    $("#"+backId).hide();
	 		    $("#selectAll1").attr("checked",false);
	 	  }
	 	  
	 		if(i==0){
              utilsFp.confirmIcon(3,"","","", "请选择要添加的数据",0,"","");
	 		} 
	 			
	 		 
	 		
	 		 
	 	}
	 	
	 	
	 	function getInfoToFront(trId,index){
	 		 
	 	      var  tr_id=$("#"+trId);
	 		  if(index%2==0){
	 		  	
	 		  	          $("#showZJFront").append("<tr onclick='check_box()' class='showZJFront' style='cursor:pointer;background:#dcecfa;' id=f"+trId+" name=f"+trId+"></tr>");
	 		  }else{
	 				      $("#showZJFront").append("<tr onclick='check_box()' style='cursor:pointer;' class='showZJFront' id=f"+trId+" name=f"+trId+"></tr>");
	 		 }
	 		  
	 		$("#showZJFront tr:last").append("<td style='width:30px; text-align:center;'><span>"+index+"</span></td>");
	 		$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	      	$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+tr_id.find("td:eq(2)").text()+"</td>");
	 	        $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+tr_id.find("td:eq(3)").text()+"</td>");
	          	$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+tr_id.find("td:eq(4)").text()+"</td>");
	 	        $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:171px; text-align:center;'>"+tr_id.find("td:eq(5)").text()+"</td>");
	 	        $("#showZJFront tr:last").append("<td class='datagrid-cell' style=' width:171px;text-align:center;'>"+tr_id.find("td:eq(6)").text()+"</td>");
	 	    defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
	 	          $("#f"+trId).click(function(event){
                           	var index = $(this).find("td:eq(0)").text(); 
                         	if($(':checkbox',this).prop('checked')==true){
                           		$(':checkbox',this).attr("checked", false);
                           	//	$(this).css("background-color","");
                           	   if(index%2==0){
                           			$(this).css("background-color","#dcecfa");
                           		}else{
                           			$(this).css("background-color","");
                           		}
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#d3eafc");
                           }  
                             event.stopPropagation();
                           });
                           
                      
                            $(':checkbox',"#f"+trId).click(function(event){
                         	if($(':checkbox',this).prop('checked')==true){
                           	     $(':checkbox',this).attr("checked", false);
                           	     $(this).css("background-color","");
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#d3eafc");
                           }  
                             event.stopPropagation();
                           });
                           
	 	}
	 	
	 	function saveFix(){
	 		var ids="";
	 		var sns="";
	 		var codes="";
	 		var names="";
	 		var types="";
	 		var trs=$("#showZJFront tr");
	 		for(var i = 0;i < trs.length; i++){
              
            var id=$("#showZJFront tr:eq("+i+")").attr("id");
            id=$.trim(id);       
	 	 	ids+=id+",";
	 	 	
	 	 	var sn=$("#showZJFront tr:eq("+i+")").find("td:eq(2)").text();
	 	 	sn=$.trim(sn);
	 	 	sns+=sn+",";
	 	 	
	 	    var type=$("#showZJFront tr:eq("+i+")").find("td:eq(3)").text();
	 	    type=$.trim(type);
	 	 	types+=type+",";
	 	 	 
	 	 	var code=$("#showZJFront tr:eq("+i+")").find("td:eq(4)").text();
	 	 	code=$.trim(code);
	 	 	codes+=code+",";
	 	 	 
	 	 	var name=$("#showZJFront tr:eq("+i+")").find("td:eq(5)").text();
	 	 	name=$.trim(name);
	 	 	names+=name+",";
	 	 	 
	 	   }
	 		$("#ids").val(ids);
	 		$("#sns").val(sns);
	 		$("#codes").val(codes);
	 		$("#names").val(names);
	 		$("#types").val(types);
	 		
	 		
}
	 	
	 	function selectAll(){
	 		if($("#selectAll1").attr("checked")){
	 			$("#zjTbody :checkbox").each(function(){
	 			$(this).attr("checked",true);
	 			$(this).parent().parent().parent().css("background-color","#d3eafc");
	 		});
	 		}else{
	 			$("#zjTbody :checkbox").each(function(){
	 			$(this).attr("checked",false);
	 			var index=$(this).parent().parent().parent().find("td:eq(0)").text();
	 			if(index%2==0){
                                   $(this).parent().parent().parent().css("background-color","#dcecfa");
                      }else{
                           		   $(this).parent().parent().parent().css("background-color","");
                 }
	 		});
	 		}
	 		
	 	}
	 	
	 	function select_All(){
	 		if($("#selectAll2").attr("checked")){
	 			$("#showZJFront :checkbox").each(function(){
	 			$(this).attr("checked",true);
	 			$(this).parent().parent().parent().css("background-color","#d3eafc");
	 		});
	 		}else{
	 			$("#showZJFront :checkbox").each(function(){
	 			$(this).attr("checked",false);
	 			var index=$(this).parent().parent().parent().find("td:eq(0)").text();
	 			if(index%2==0){
                                   $(this).parent().parent().parent().css("background-color","#dcecfa");
                      }else{
                           		   $(this).parent().parent().parent().css("background-color","");
                 }
	 		});
	 		}
	 	}
	 	
	 	
	 	
	 	
	 	function delFrontList(){
	 		    var i=0;
	 			$("#showZJFront :checkbox").each(function(){
	 			 if($(this).attr("checked")){
	 			 	i++;
	 			 	var trid = "#"+$(this).parent().parent().parent().attr("id");
	 	            $(trid).remove();
	 			 }
	 		 });
	 		 $("#selectAll2").attr("checked",false);
	 		 if(i==0){
              utilsFp.confirmIcon(3,"","","", "请选择要删除的数据",0,"","");
	 		}
	 	}
	 	
	 	
	 	 $("#paraMap1_CFM_TYPE").change(function(){
	 	 	 
            if($(this).val()==0){//保养 
 
              $('#paraMap1_CFM_EC_CODE').attr("disabled","disabled"); 
               
              $('#CFM_DESC').attr("readonly","readonly"); 
              $('#CFM_DESC').addClass("readonly");
              $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated");
              $('#CFM_DESC').val("");
              $("#paraMap1_CFM_EC_CODE option[value='']").attr("selected",true); 
       		  $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated"); 
              
            }else{//维修
              
              $('#paraMap1_CFM_EC_CODE').removeAttr("disabled");
              $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated");
             }
    });
	 	
	 	
	 	
	 	$("#paraMap1_CFM_EC_CODE").change(function(){
	 		
	 		var cfm_type=$("#paraMap1_CFM_EC_CODE").val(); 		
	 		 
	 		if(cfm_type==""){
	 			$("#CFM_DESC").val("");
	 		}else{
	 			  var jsondata="";
	 	 	jsondata ={"cfm_type":cfm_type};
	  
	 	     var listUrl=getEcType();
	 			 	 $.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){			 
	 		        	//var cd=data.ajaxMap.cecDesc;
	 		        	var cd=data.ajaxList;
	 				    $("#CFM_DESC").val(cd[0].CEC_DESC);
	 				
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	});
	 		 			
	 		}

	}); 	
	
  
</script>

<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>

<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 
