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
     
	<!-- head里面 -->
	<style>
	    #addConnectDevice tr{
	        height:30px;
	    }
	</style>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <!--<div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>-->
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height: 500px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="f6ff43e9ca644d13b4eec3237b64cd15" type="add" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="f6ff43e9ca644d13b4eec3237b64cd15" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="f6ff43e9ca644d13b4eec3237b64cd15" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'4019da686e534825a5b5980e43f74464'" />
		<s:set name="_$formId_1" value="'f6ff43e9ca644d13b4eec3237b64cd15'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><bu:uitn colNo="CDPI_AREA_SN" formId="f6ff43e9ca644d13b4eec3237b64cd15" /></td>
			<bu:td cssClass="dec" colNo="CDPI_AREA_SN" formId="f6ff43e9ca644d13b4eec3237b64cd15" ><bu:ui colNo="CDPI_AREA_SN" style="width:200px;" formId="f6ff43e9ca644d13b4eec3237b64cd15" value="%{CDPI_AREA_SN}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="CDPI_DEVICE_SN" formId="f6ff43e9ca644d13b4eec3237b64cd15" /></td>
			<bu:td cssClass="dec" colNo="CDPI_DEVICE_SN" formId="f6ff43e9ca644d13b4eec3237b64cd15" ><bu:ui colNo="CDPI_DEVICE_SN" style="width:200px;" formId="f6ff43e9ca644d13b4eec3237b64cd15" value="%{CDPI_DEVICE_SN}" formIndex="1" /></bu:td>
	
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDP_PLAN_SN" formId="f6ff43e9ca644d13b4eec3237b64cd15" /></td>
			<!--<td class="name" /><bu:uitn colNo="CDP_PLAN_SN" formId="f6ff43e9ca644d13b4eec3237b64cd15" />-->
			<bu:td cssClass="dec" style="width:200px;" colNo="CDP_PLAN_SN" formId="f6ff43e9ca644d13b4eec3237b64cd15" ><bu:ui colNo="CDP_PLAN_SN" style="width:200px;" formId="f6ff43e9ca644d13b4eec3237b64cd15" value="%{CDP_PLAN_SN}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="详细信息" /></h3>	
        </div>
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" style="max-width:100%">
							<div class="datagrid-header-inner head" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;" ></td >
										<!--<td class="datagrid-cell" style="width:30px;" ><input type="checkbox" id="allSelect" name="allSelect"/></td >-->
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="设备SN" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="设备名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="设备类型" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="保养项目" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="设备型号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="所属区域" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="周期(天)" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="保养计划" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:270px;width:100%">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addConnectDevice" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
</div>
			<bu:jsVal formId="f6ff43e9ca644d13b4eec3237b64cd15" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<bu:script viewId="4019da686e534825a5b5980e43f74464" />
<script type="text/javascript">
	$(function(){
		$("#paraMap1_CDP_PLAN_SN").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData dept_select")
		$("#paraMap1_CDPI_AREA_SN").attr("onchange","getConnDevice()");
		$("#paraMap1_CDPI_DEVICE_SN").attr("onchange","findDevice()");
		$("#paraMap1_CDP_PLAN_SN").attr("onchange","setPlan()");
		$("#paraMap1_CDPI_DEVICE_SN").empty();
 		$("#paraMap1_CDPI_DEVICE_SN").append("<option value=''>--请选择--</option>");
 		$("#paraMap1_CDPI_DEVICE_SN").trigger("chosen:updated");

	})
	
	var trCount = 0;
	var array=new Array();
	<c:forEach items="${dataList}" var="dec" varStatus="status">  
          var temp={"CDP_PLAN_SN":"${dec.CDP_PLAN_SN}","CDP_PLAN_NAME":"${dec.CDP_PLAN_NAME}"};
          array.push(temp);
        </c:forEach>  
        //console.log(array.length);
        var myOption = "<option value=''>--请选择--</option>";
        for(var j=0;j<array.length;j++){
	myOption = myOption + "<option value='"+array[j].CDP_PLAN_SN+"'>"+array[j].CDP_PLAN_NAME+"</option>";
	}
	
	//根据线别获取关联的设备
	function getConnDevice(){
	    var formId = $("#formId1").val();
        var getConnDeviceUrl="${path}buss/bussModel_exeFunc.ms?funcMId=a49ac6eec56648eb916c86bea5d10eab";
		var areaId = $("#paraMap1_CDPI_AREA_SN").val();
		$("#addConnectDevice").empty();
		trCount = 0;
		jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: getConnDeviceUrl,
 	    	data:{
 	    	    "areaId":areaId,
 	    	},
 			success: function(data){
 			
 				var pList=data.ajaxMap.deviceList;
 				var deList=data.ajaxMap.deList;
 				
 				var tempOption = "";
 				for(var i=0;i<pList.length;i++){
 				    tempOption = tempOption + "<option value='"+pList[i].CD_DEVICE_SN+"'>"+pList[i].CD_DEVICE_SN+"</option>" ;
 				}
 				$("#paraMap1_CDPI_DEVICE_SN").empty();
 				$("#paraMap1_CDPI_DEVICE_SN").append("<option value=''>--请选择--</option>");
 				$("#paraMap1_CDPI_DEVICE_SN").append(tempOption);
 				$("#paraMap1_CDPI_DEVICE_SN").trigger("chosen:updated");
 				
 				//根据设备sn加载设备相关信息
 				var tempHtml;
 				var mySelect;
 				var tempDiv;
 				for(var i=0;i<deList.length;i++){
 				    trCount++;
 				  var cycle="";
 				    if(deList[i].CDII_CYCLE==null || deList[i].CDII_CYCLE=="null"){
 				        cycle="";
 				    }else{
 				        cycle=deList[i].CDII_CYCLE;
 				    }
 				    tempDiv = "<input type='hidden' name='deviceSn_"+trCount+"' value='"+deList[i].CD_DEVICE_SN+"'>"+
 				    		"<input type='hidden' name='itemCode_"+trCount+"' value='"+deList[i].CDII_ITEM_CODE+"'>"+
 				    		"<input type='hidden' name='area_"+trCount+"' value='"+deList[i].CA_ID+"'>"
 				    mySelect = "<select id='sel_"+trCount+"' name='paraMap"+trCount+"@4#PLAN_CODE' class='_VAL_NULL input isSubmit _VAL_OjbsData dept_select' style='width:100%'>"
 				    			+ myOption +"</select>";
 				    tempHtml = "<tr id='tr_"+trCount+"'>"+
					"<td class='datagrid-cell datagrid-cell-0' style='width:30px;text-align: center;' name='connDevice_"+trCount+"'>"+trCount+"</td>"+
					//"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;' name='connDevice_"+trCount+"'><input type='checkbox' class='isSubmit _selectdata' style='cursor: pointer;margin:0' value='"+trCount+"' name='isSelect1'/></td>"+
					"<td class='datagrid-cell datagrid-cell-2' style='width:130px;text-align: center;' >"+deList[i].CD_DEVICE_SN+"<input type='hidden' name='deviceSn_"+trCount+"' value='"+deList[i].CD_DEVICE_SN+"'></td>"+
					"<td class='datagrid-cell datagrid-cell-3' style='width:130px;text-align: center;' >"+deList[i].CD_DEVICE_NAME+"<input type='hidden' name='itemCode_"+trCount+"' value='"+deList[i].CDII_ITEM_CODE+"'></td>"+
					"<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: center;' >"+deList[i].DEVICE_TYPE_NAME+"<input type='hidden' name='area_"+trCount+"' value='"+deList[i].CA_ID+"'></td>"+
					"<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;' >"+deList[i].CDII_ITEM_NAME+"</td>"+
					"<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;' >"+deList[i].DEVICE_CLASS_NAME+"</td>"+
					"<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: center;' >"+deList[i].CA_NAME+"</td>"+
					"<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: center;' >"+cycle+"</td>"+
					"<td class='datagrid-cell datagrid-cell-9' style='width:120px;overflow: visible;padding:0;' >"+mySelect+"</td>";
				//	$("#addConnectDevice").append(tempDiv);
					$("#addConnectDevice").append(tempHtml);
					$("#sel_"+trCount).val(deList[i].CDP_PLAN_SN);
 				}
 				//setPlan();
 					defTableWidthRewrite('831b2dbf0dfb494695b7ce66538a1234');
 				
 			},
 			error: function(msg){
 				if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     		    }
 		   }
 		});
	}
	
	//根据设备sn加载设备相关信息
	function getDeviceInfo(deviceSn,areaId){
	    var getDeviceInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=d4da9b65b55442b9b25daeebbc9c971d";
		jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: getDeviceInfoUrl,
 	    	data: {
 	    	    "deviceSn" : deviceSn,
 	    	    "areaId" : areaId
 	    	},
 			success: function(data){
 				var sList=data.ajaxList;
 				var tempOption = "";
 				var tempHtml;
 				var mySelect;
 				var tempDiv;
 				for(var i=0;i<sList.length;i++){
 				    trCount++;
 				     var cycle="";
 				    if(sList[i].CDII_CYCLE==null || sList[i].CDII_CYCLE=="null"){
 				        cycle="";
 				    }else{
 				        cycle=sList[i].CDII_CYCLE;
 				    }
 				    tempDiv = "<input type='hidden' name='deviceSn_"+trCount+"' value='"+sList[i].CD_DEVICE_SN+"'>"+
 				    		"<input type='hidden' name='itemCode_"+trCount+"' value='"+sList[i].CDII_ITEM_CODE+"'>"+
 				    		"<input type='hidden' name='area_"+trCount+"' value='"+sList[i].CA_ID+"'>"
 				    mySelect = "<select id='sel_"+trCount+"' name='paraMap"+trCount+"@4#PLAN_CODE' class='_VAL_NULL input isSubmit _VAL_OjbsData dept_select' style='width:100%'>"
 				    			+ myOption +"</select>";
 				    tempHtml = "<tr id='tr_"+trCount+"'>"+
					"<td class='datagrid-cell datagrid-cell-0' style='width:30px;text-align: center;' name='connDevice_"+trCount+"'>"+trCount+"</td>"+
					//"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;' name='connDevice_"+trCount+"'><input type='checkbox' class='isSubmit _selectdata' style='cursor: pointer;margin:0' value='"+trCount+"' name='isSelect1'/></td>"+
					"<td class='datagrid-cell datagrid-cell-2' style='width:130px;text-align: center;' >"+sList[i].CD_DEVICE_SN+"<input type='hidden' name='deviceSn_"+trCount+"' value='"+sList[i].CD_DEVICE_SN+"'></td>"+
					"<td class='datagrid-cell datagrid-cell-3' style='width:130px;text-align: center;' >"+sList[i].CD_DEVICE_NAME+"<input type='hidden' name='itemCode_"+trCount+"' value='"+sList[i].CDII_ITEM_CODE+"'></td>"+
					"<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: center;' >"+sList[i].DEVICE_TYPE_NAME+"<input type='hidden' name='area_"+trCount+"' value='"+sList[i].CA_ID+"'></td>"+
					"<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;' >"+sList[i].CDII_ITEM_NAME+"</td>"+
					"<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;' >"+sList[i].DEVICE_CLASS_NAME+"</td>"+
					"<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: center;' >"+sList[i].CA_NAME+"</td>"+
					"<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: center;' >"+cycle+"</td>"+
					"<td class='datagrid-cell datagrid-cell-9' style='width:120px;overflow: visible;padding:0;' >"+mySelect+"</td>";
					//$("#addConnectDevice").append(tempDiv);
					$("#addConnectDevice").append(tempHtml);
					$("#sel_"+trCount).val(sList[i].CDP_PLAN_SN);
					
 				}
 				defTableWidthRewrite('831b2dbf0dfb494695b7ce66538a1234');
 			},
 			error: function(msg){
        		if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     		    }
 		   }
 		});
	}
	
	function findDevice(){
		var deSn = $("#paraMap1_CDPI_DEVICE_SN").val();
		var areaId = $("#paraMap1_CDPI_AREA_SN").val();
		$("#addConnectDevice").empty();
		trCount = 0;
		getDeviceInfo(deSn,areaId);
		
	}
	
	//根据选择的保养计划设置其他保养计划
	function setPlan(){
		var selPlanCode = $("#paraMap1_CDP_PLAN_SN").val();
		if(trCount!=0){
		    
			for(var i=1;i<=trCount;i++){	
                if($("#sel_"+i).val()==""){
                    $("#sel_"+i).val(selPlanCode);
                }
				
				//$("#sel_"+i).trigger("chosen:updated");
			}
		}
	}
	function addCal(){
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
                        
                    if(trCount==0){
                       
                       utilsFp.confirmIcon(3,"","","", "<dict:lang value="请关联设备" />",0,"260","");
                             return;
                    }
           var areaId = $("#paraMap1_CDPI_AREA_SN").val();
           document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=8fbc5184610e4712934b794e1004679c&trCount="+trCount+"&areaId="+areaId;
        
document.forms.addForm.submit();
}
	
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
  })
})(jQuery)</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
