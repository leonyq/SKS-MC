<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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


	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
 	<style>
		.dec input{
			width:200px;
		}
		.dec .chosen-container{
			width:200px !important;
		}
		td .state1{
			width: 50px;
   			height: 20px;
    			display: inline-block;
    			background-color: red;
    			border-radius: 5px;
    			color: #fff;
		}
		td .state2{
			width: 50px;
   			height: 20px;
    			display: inline-block;
    			background-color: green;
    			border-radius: 5px;
    			color: #fff;
		}
	</style>   
    <!-- 产品静态资源 -->

</head>
<body>

	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
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
			    	<div class="optn">
			    	        <button type="button" onclick="comparison();" ><i class="ico ico-gk"></i><dict:lang value="加载" /></button>
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="dab546190c604b8b9ff1e67e1d20ab72" type="edit" />
<div class="mod">
 <div class="mod-hd">
		<h3 class="tit"><dict:lang value="在线信息" /></h3>
	</div>
	<table class="basic-table" >
	<input type="hidden" id="tableSn" name="tableSn" value="<c:out value='${param.tableSn}' />" />
	<input type="hidden" id="PDO_AREA_SN" name="PDO_AREA_SN">
	<input type="hidden" id="PDO_DEVICE_SN" name="PDO_DEVICE_SN">
	<input type="hidden" id="PDO_NUMBER" name="PDO_NUMBER">
	<input type="hidden" id="PDO_MODEL_CODE" name="PDO_MODEL_CODE">
	<input type="hidden" id="PDO_PROCESS_FACE" name="PDO_PROCESS_FACE">
	<input type="hidden" id="PDO_PROJECT_ID" name="PDO_PROJECT_ID" value="${param.projectId}">
	<input type="hidden" id="PDO_DEVICE_SEQ" name="PDO_DEVICE_SEQ" value="${param.devSeq}">	
	<input type="hidden" id="PDO_NUMBER_S" name="PDO_NUMBER_S">
	<input type="hidden" id="PDO_MODEL_CODE_S" name="PDO_MODEL_CODE_S">
	<input type="hidden" id="PDO_PROCESS_FACE_S" name="PDO_PROCESS_FACE_S">
	<input type="hidden" id="TRACK" name="TRACK" value="<c:out value='${param.track}' />">
	<input type="hidden" name="formIds" value="dab546190c604b8b9ff1e67e1d20ab72" />
	<input type="hidden" name="formId" id="formId2" value='456789'/>
	<input type="hidden" id="prefixInd" name="dab546190c604b8b9ff1e67e1d20ab72" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f969da9cf27543b29e7ed446e21382f1'" />
		<s:set name="_$formId_1" value="'dab546190c604b8b9ff1e67e1d20ab72'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_AREA_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="PDO_AREA_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_AREA_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_DEVICE_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="PDO_DEVICE_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_DEVICE_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_NUMBER" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="PDO_NUMBER" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_NUMBER" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PDO_MODEL_CODE" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" colNo="PDO_MODEL_CODE" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_MODEL_CODE" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="PDO_ITEM_NAME" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" colNo="PDO_ITEM_NAME" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_ITEM_NAME" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="PDO_PROCESS_FACE" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" colNo="PDO_PROCESS_FACE" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_PROCESS_FACE" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="dab546190c604b8b9ff1e67e1d20ab72" formIndex="1" />
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="转产信息" /></h3>
	</div>
	<table class="basic-table" >
		<tr>
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_NUMBER_S" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="PDO_NUMBER_S" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_NUMBER_S" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_MODEL_CODE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="PDO_MODEL_CODE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_MODEL_CODE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_ITEM_NAME_S" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="PDO_ITEM_NAME_S" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_ITEM_NAME_S" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PDO_PROCESS_FACE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" colNo="PDO_PROCESS_FACE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_PROCESS_FACE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
	</table>
	
		<div class="mod-hd">
			<h3 class="tit"><dict:lang value="比对信息" /></h3>
		</div>
		<table style="width: 100%;margin-top: 10px;">
			<tr>
				<td class="name" style="width: 52px;text-align: right;"><dict:lang value="相同"/></td>
			    	<td class="dec" style="width: 225px;text-align: left;padding-left: 5px;"><input class="input readonly" readonly="readonly"  type="text" id="identical"/></td>
			    	<td class="name" style="width: 52px;text-align: right;"><dict:lang value="差异"/></td>
			    	<td class="dec" style="width: 225px;text-align: left;padding-left: 5px;"><input class="input readonly" readonly="readonly" type="text" id="difference"/></td>
				<td class="name" style="width: 52px;"></td>
				<td class="dec" style="width: 205px;padding-left: 5px;"></td>
			 </tr>
		</table>
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable456789">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;"></td >
									<td style="width: 130px;"><dict:lang value="TABLE" /></td >
									<td style="width: 130px;"><dict:lang value="料站" /></td >
									<td style="width: 60px;"><dict:lang value="通道" /></td >
									<td style="width: 60px;"><dict:lang value="轨道" /></td >
									<td style="width: 90px;"><dict:lang value="对比结果" /></td >
									<td style="width: 130px;"><dict:lang value="物料料号" /></td >
									<td style="width: 110px;"><dict:lang value="物料名称" /></td >
									<td style="width: 110px;"><dict:lang value="规格" /></td >							
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax456789" >
								<tbody id="dbTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>							
			</div>
	</form>	
	</div>
</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<!-- js初始化方法 -->
<script type = "text/javascript">
    $(function(){
        $("#paraMapObj_PDO_DEVICE_SN").val($("#tableSn").val());
        //getComparison("1");
    })
    function comparison(){
		getComparison("0");
	}
    function getComparison(flag){
		      var pdoDeviceSn= $("#paraMapObj_PDO_DEVICE_SN").val();
		      var pdoNumber= $("#paraMapObj_PDO_NUMBER").val();
		      var pdoProcessFace= $("#paraMapObj_PDO_PROCESS_FACE").val();
		      var pdoModelCode= $("#paraMapObj_PDO_MODEL_CODE").val();
		      var pdoAreaSn= $("#paraMapObj_PDO_AREA_SN").val();
		      var pdoNumber_s= $("#paraMapObj_PDO_NUMBER_S").val();
		      var pdoModelCode_s= $("#paraMapObj_PDO_MODEL_CODE_S").val();
		      var pdoProcessFace_s= $("#paraMapObj_PDO_PROCESS_FACE_S").val();
		      var track = $("#TRACK").val();
			  var pdoNumber_s_err = document.getElementById("paraMapObj_PDO_NUMBER_S_SHOW");
			  var pdoProcessFace_s_err = document.getElementById("paraMapObj_PDO_PROCESS_FACE_S");
			  //alert(pdoDeviceSn+"~"+pdoNumber+"~"+pdoProcessFace+"~"+pdoModelCode+"~"+pdoAreaSn+"~"+pdoNumber_s+"~"+pdoModelCode_s+"~"+pdoProcessFace_s+"~"+track);
			  if(flag == 0){
			     if (pdoNumber == pdoNumber_s) {
					_alertValMsg(pdoNumber_s_err,"<dict:lang value="转产制令单不能是当前制令单" />");
			      	return ;
				}
			      if(""==pdoNumber_s){
	   					_alertValMsg(pdoNumber_s_err,"<dict:lang value="请选择转产制令单" />");
			      		return ;
			      }
			      if(""==pdoProcessFace_s){
	   					_alertValMsg(pdoProcessFace_s_err,"<dict:lang value="请选择转产生产面别" />");
			      		return ;
			      }
			    }
			    /*var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;*/
		      $.ajax({
						type: "POST",
					    dataType: "json",
					    url: "${path}buss/bussModel_exeFunc.ms?funcMId=d4b0b244c7184a8eb3add50d5f395da1",
					    data:{
					      "flag":flag,
					      "pdoDeviceSn":pdoDeviceSn,
					      "pdoNumber":pdoNumber,
					      "pdoProcessFace":pdoProcessFace,
					      "pdoModelCode":pdoModelCode,
					      "pdoAreaSn":pdoAreaSn,
					      "pdoNumber_s":pdoNumber_s,
					      "pdoModelCode_s":pdoModelCode_s,
					      "pdoProcessFace_s":pdoProcessFace_s,
					      "track":track
					    },
						success: function(data){
								util.closeLoading();
								if(null == data){return ;}
								if(null != data.ajaxString){
									utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"300","");
									return;
								}
								if(null != data.ajaxList){
									$("#identical").val(data.ajaxList[0]);
									$("#difference").val(data.ajaxList[1]);
								}
								$("#dbTbody").empty();
								
								if(null != data.ajaxPage.dataList){ 
									var reList = eval(data.ajaxPage.dataList); 
										for(var i = 0;i < reList.length; i++){
											$("#dbTbody").append("<tr id='"+reList[i].CODE+"' ></tr>");
											$("#dbTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
											
											$("#dbTbody tr:last").append("<td style='width: 130px;'>"+reList[i].CMO_TABLE_NO+"</td>");
											$("#dbTbody tr:last").append("<td style='width: 130px;'>"+reList[i].CMO_LOADPOINT+"</td>");//CMO_CHANEL_SN  CHANEL
											$("#dbTbody tr:last").append("<td style='width: 60px;text-align: center;'>"+reList[i].CMO_CHANEL_SN+"</td>");
											$("#dbTbody tr:last").append("<td style='width: 60px;text-align: center;'>"+reList[i].CMO_TRACK+"</td>");
											if(reList[i].RESULT == undefined){
												reList[i].RESULT = "";
											}
											if(reList[i].RESULT == "1"){
												$("#dbTbody tr:last").append("<td style='width: 90px;text-align: center;'><span class='state1'>差异</span></td>");
											}else if(reList[i].RESULT == "0"){
												$("#dbTbody tr:last").append("<td style='width: 90px;text-align: center;'><span class='state2'>相同</span></td>");
											}else{
												$("#dbTbody tr:last").append("<td style='width: 90px;text-align: center;'></td>");
												}
											$("#dbTbody tr:last").append("<td style='width: 130px;'>"+reList[i].CMO_ITEM_CODE+"</td>");
											$("#dbTbody tr:last").append("<td style='width: 110px;'>"+reList[i].CI_ITEM_NAME+"</td>");
											if (reList[i].CI_ITEM_SPEC == null) {
												reList[i].CI_ITEM_SPEC = "";
											}
											$("#dbTbody tr:last").append("<td style='width: 110px;'>"+reList[i].CI_ITEM_SPEC+"</td>");
										}
										
										//pageFun(data.ajaxPage,"formId1");
											defTableWidthRewrite("456789");
								}
							},
						error: function(msg){
								util.closeLoading();
								utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
						  }
						});
		}
function editCal(){
    if($("#identical").val()<=0){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前设备没有相同料站物料，不能进行转产" />",0,"","");
				 return ;
	}
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
	
	$("#PDO_AREA_SN").val($("#paraMapObj_PDO_AREA_SN").val());
	$("#PDO_DEVICE_SN").val($("#paraMapObj_PDO_DEVICE_SN").val());
	$("#PDO_NUMBER").val($("#paraMapObj_PDO_NUMBER").val());
	$("#PDO_MODEL_CODE").val($("#paraMapObj_PDO_MODEL_CODE").val());
	$("#PDO_PROCESS_FACE").val($("#paraMapObj_PDO_PROCESS_FACE").val());
	$("#PDO_NUMBER_S").val($("#paraMapObj_PDO_NUMBER_S").val());
	$("#PDO_MODEL_CODE_S").val($("#paraMapObj_PDO_MODEL_CODE_S").val());
	$("#PDO_PROCESS_FACE_S").val($("#paraMapObj_PDO_PROCESS_FACE_S").val());
	
	document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=c266d4a924da4622a975ea96ea17d422";
	document.forms.editForm.submit();
	isQuery = true;
}
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');

  })
})(jQuery)</script>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
