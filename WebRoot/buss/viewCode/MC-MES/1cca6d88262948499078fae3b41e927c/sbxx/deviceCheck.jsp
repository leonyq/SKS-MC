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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
 <%--   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>--%>

<script type="text/javascript">
//把禁用的数据塞到隐藏域中
function setHid(){
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_TYPE' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_TYPE").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_CLASS' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_CLASS").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_USE_DEP' type='hidden' value='"+$("#paraMapObj_CD_USE_DEP").val()+"'>");
}

</script>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
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
			    	        <button type="button" id="saveInfo" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="99338dfb95df4eec8d5714a4e773b127" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="type1" value="校验项目"/>
	<s:hidden id ="curUser" name="curUser" value='%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}'/>
	<input type="hidden" name="formIds" value="99338dfb95df4eec8d5714a4e773b127" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="99338dfb95df4eec8d5714a4e773b127" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ee250c494b504106bcca8de9d4766746'" />
		<s:set name="_$formId_1" value="'99338dfb95df4eec8d5714a4e773b127'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec"  colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_TYPE" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_SN" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" readonly="readonly" /></bu:td>
			
			<td class="name"/><bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_CLASS" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name"/><bu:uitn colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_USE_DEP" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDC_CHECK_TYPE" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_CHECK_TYPE" formId="1d564e83df4f4eabbbafb0813b189d69" ><bu:ui colNo="CDC_CHECK_TYPE" style="width:200px;" formId="1d564e83df4f4eabbbafb0813b189d69" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDC_TASK_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_TASK_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" ><bu:ui colNo="CDC_TASK_TIME" style="width:200px;" onkeyup="value=value.replace(/[^\d.]/g,'')" formId="1d564e83df4f4eabbbafb0813b189d69" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDC_CHECK_COMPANY" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_CHECK_COMPANY" formId="1d564e83df4f4eabbbafb0813b189d69" ><bu:ui colNo="CDC_CHECK_COMPANY" style="width:200px;" formId="1d564e83df4f4eabbbafb0813b189d69" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDC_OUT_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_OUT_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" ><bu:ui colNo="CDC_OUT_TIME" style="width:200px;" formId="1d564e83df4f4eabbbafb0813b189d69" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDC_RETURN_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_RETURN_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" ><bu:ui colNo="CDC_RETURN_TIME" style="width:200px;" formId="1d564e83df4f4eabbbafb0813b189d69" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDC_REPORT_EMP" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_REPORT_EMP" formId="1d564e83df4f4eabbbafb0813b189d69" ><bu:ui colNo="CDC_REPORT_EMP" style="width:200px;" formId="1d564e83df4f4eabbbafb0813b189d69" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDC_REPAIR_EMP" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_REPAIR_EMP" formId="1d564e83df4f4eabbbafb0813b189d69" ><bu:ui colNo="CDC_REPAIR_EMP" style="width:200px;" formId="1d564e83df4f4eabbbafb0813b189d69" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDC_AUDIT_EMP" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_AUDIT_EMP" formId="1d564e83df4f4eabbbafb0813b189d69" ><bu:ui colNo="CDC_AUDIT_EMP" style="width:200px;" formId="1d564e83df4f4eabbbafb0813b189d69" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDC_CHECK_CONTANT" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<bu:td cssClass="dec" colNo="CDC_CHECK_CONTANT" formId="1d564e83df4f4eabbbafb0813b189d69" style="height:80px;" colspan="5"><bu:ui colNo="CDC_CHECK_CONTANT" formId="1d564e83df4f4eabbbafb0813b189d69" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="校验项目" /></h3>	
        </div>
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
							<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="1d564e83df4f4eabbbafb0813b189d69" i18n="1"/></td>
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:170px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:125px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:125px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:125px;" ><dict:lang value="实际值" /></td >
										
										<td class="datagrid-cell" style="width:300px;"><dict:lang value="校验内容" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:150px;max-width:100%">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addDeviceItem_1" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
</div>
			<bu:jsVal formId="99338dfb95df4eec8d5714a4e773b127" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="ee250c494b504106bcca8de9d4766746" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
var trCount1 = 0;
	var trCount2 = 0;
	var trCount3 = 0;
	var trCount4 = 0;
	var url = "buss/bussModel_exeFunc.ms?&funcMId=a0e6771d04584df7964effb7e5c1d975";
		$(function(){
		$("#paraMapObj_CDC_CHECK_TYPE").attr("onchange","changeTypeInfo();");
		$("#paraMapObj_CDC_AUDIT_EMP").val($("#curUser").val());
		var deviceSn = $("#paraMapObj_CD_DEVICE_SN").val();
		var tempItemClass;
		$.ajax({
						url:url,
						type:"post",
						data:{"deviceSn":deviceSn},
						success:function(data){
							var itemList=data.ajaxList;
							if(itemList!=""){
								for(var i=0;i<itemList.length;i++){
									if(itemList[i].CDII_ITEM_CODE=='null'||itemList[i].CDII_ITEM_CODE==null){
										itemList[i].CDII_ITEM_CODE="";
									}
									if(itemList[i].CDII_ITEM_NAME=='null'||itemList[i].CDII_ITEM_NAME==null){
										itemList[i].CDII_ITEM_NAME="";
									}
									if(itemList[i].CDII_ITEM_UNIT=='null'||itemList[i].CDII_ITEM_UNIT==null){
										itemList[i].CDII_ITEM_UNIT="";
									}
								
									if(itemList[i].CDII_ITEM_MAXVALUE==null||itemList[i].CDII_ITEM_MAXVALUE=='undefined'){
										itemList[i].CDII_ITEM_MAXVALUE="";
									}
									if(itemList[i].CDII_ITEM_MINVALUE==null||itemList[i].CDII_ITEM_MINVALUE=='undefined'){
										itemList[i].CDII_ITEM_MINVALUE="";
									}
									if(itemList[i].CDII_CYCLE==null||itemList[i].CDII_CYCLE=='undefined'){
										itemList[i].CDII_CYCLE="";
									}
									if(itemList[i].CDII_ITEM_CLASS==0){
										tempItemClass="范围值";
									}
									if(itemList[i].CDII_ITEM_CLASS==1){
										tempItemClass="固定值";
									}
									if(itemList[i].CDII_ITEM_CLASS==2){
										tempItemClass="状态值";
									}
									if(itemList[i].CDII_ITEM_TYPE=="校验项目"){
										trCount1++;
										var deviceItemCode1="deviceItemCode1_"+trCount1;
										var deviceItemName1="deviceItemName1_"+trCount1;
										var deviceItemClass1="deviceItemClass1_"+trCount1;
										var deviceitemMaxvalue1="deviceitemMaxvalue1_"+trCount1;
										var deviceitemMinvalue1="deviceitemMinvalue1_"+trCount1;
									/*	var divN="<div id='hidDiv_"+trCount1+"' style='display: none;'>"+
												"<input name='"+deviceItemCode1+"' type='hidden' id='"+deviceItemCode1+"' value='"+itemList[i].CDII_ITEM_CODE+"'>"+
												"<input name='"+deviceItemName1+"' type='hidden' id='"+deviceItemName1+"' value='"+itemList[i].CDII_ITEM_NAME+"'>"+
												"<input name='"+deviceItemClass1+"' type='hidden' id='"+deviceItemClass1+"' value='"+itemList[i].CDII_ITEM_CLASS+"'>"+
												"<input name='"+deviceitemMaxvalue1+"' type='hidden' id='"+deviceitemMaxvalue1+"' value='"+itemList[i].CDII_ITEM_MAXVALUE+"'>"+
												"<input name='"+deviceitemMinvalue1+"' type='hidden' id='"+deviceitemMinvalue1+"' value='"+itemList[i].CDII_ITEM_MINVALUE+"'>"+
												"<input name='deviceSn' type='hidden' value='"+deviceSn+"'>"+
												"</div>";
												
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);*/
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+trCount1+"' ></tr>");
											$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align:center;' >"+trCount1+"</td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode1_"+trCount1+"'>"+itemList[i].CDII_ITEM_CODE+"<input name='"+deviceItemCode1+"' type='hidden' id='"+deviceItemCode1+"' value='"+itemList[i].CDII_ITEM_CODE+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName1_"+trCount1+"'>"+itemList[i].CDII_ITEM_NAME+"<input name='"+deviceItemName1+"' type='hidden' id='"+deviceItemName1+"' value='"+itemList[i].CDII_ITEM_NAME+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:170px;text-align: center;' name='deviceItemClass1_"+trCount1+"'>"+tempItemClass+"<input name='"+deviceItemClass1+"' type='hidden' id='"+deviceItemClass1+"' value='"+itemList[i].CDII_ITEM_CLASS+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:125px;text-align: center;' name='deviceitemMaxvalue1_"+trCount1+"'>"+itemList[i].CDII_ITEM_MAXVALUE+"<input name='"+deviceitemMaxvalue1+"' type='hidden' id='"+deviceitemMaxvalue1+"' value='"+itemList[i].CDII_ITEM_MAXVALUE+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:125px;text-align: center;' name='deviceitemMinvalue1_"+trCount1+"'>"+itemList[i].CDII_ITEM_MINVALUE+"<input name='"+deviceitemMinvalue1+"' type='hidden' id='"+deviceitemMinvalue1+"' value='"+itemList[i].CDII_ITEM_MINVALUE+"'></td>");
										
                                        if(itemList[i].CDII_ITEM_CLASS!=2){
										   $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:125px;text-align: center;'><input type='text' class='_VAL_NULL ' id='deviceItemReal1_"+trCount1+"' name='deviceItemReal1_"+trCount1+"' value='' style='width:100%'/></td>");
										}else{
										    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:125px;text-align: center;'><select type='text' class='_VAL_NULL ' id='deviceItemReal1_"+trCount1+"' name='deviceItemReal1_"+trCount1+"' style='width:100%'><option value='0'>OK</option><option value='1'>NG</option></select></td>");
										}	
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:300px;text-align: center;'><input type='text' id='deviceItemContent1_"+trCount1+"' name='deviceItemContent1_"+trCount1+"' value='' style='width:100%'/><input name='deviceSn' type='hidden' value='"+deviceSn+"'></td>");
									}
									
								}
								
							$('#saveInfo').attr("onclick","editCal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')");
							
							}
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
		$('#saveInfo').attr("onclick","editCal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')");
		
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
		}
	)
	
	//根据校验类型改变相应状态
	function changeTypeInfo(){
	    if($("#paraMapObj_CDC_CHECK_TYPE").val()==0){ //内部
	        $("#paraMapObj_CDC_CHECK_COMPANY").attr("disabled","disabled");	
            $("#paraMapObj_CDC_CHECK_COMPANY").attr("class","isSubmit input readonly _VAL_DATABASE");
            $("#paraMapObj_CDC_CHECK_COMPANY").val("");
	        $("#paraMapObj_CDC_OUT_TIME").attr("disabled","disabled");
	        $("#paraMapObj_CDC_OUT_TIME").attr("class","input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly");
	        $("#paraMapObj_CDC_OUT_TIME").val("");
	        $("#paraMapObj_CDC_RETURN_TIME").attr("disabled","disabled");
	        $("#paraMapObj_CDC_RETURN_TIME").attr("class","input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly");
	        $("#paraMapObj_CDC_RETURN_TIME").val("");
	    }else if($("#paraMapObj_CDC_CHECK_TYPE").val()==1){
	        $("#paraMapObj_CDC_CHECK_COMPANY").removeAttr("disabled");
	        $("#paraMapObj_CDC_CHECK_COMPANY").attr("class","isSubmit input _VAL_DATABASE");
	        $("#paraMapObj_CDC_OUT_TIME").removeAttr("disabled");
	        $("#paraMapObj_CDC_OUT_TIME").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData isaddSubmit WdateNomorl");
	        $("#paraMapObj_CDC_RETURN_TIME").removeAttr("disabled");
	        $("#paraMapObj_CDC_RETURN_TIME").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData isaddSubmit WdateNomorl");
	        
	    }
	}
	//校验函数
	
	function checkVal1(trCount1){
		var tempVal;
		var tempId;
		var tempFlag;
		for(var i=1;i<=trCount1;i++){
			tempVal = $("#deviceItemReal1_"+i).val();
			tempId = document.getElementById("deviceItemReal1_"+i);
			//alert($(tempId).closest("div"));
			//console.log(tempId);
			if(tempVal==null) continue;
			if(tempVal!=""){
				tempFlag = checkNum(tempVal,tempId);
			}else{
				tempFlag = checkIsNull(tempId);
			}
			
		}
		     return tempFlag;
	}
	
	function checkNum(tempVal,tempId){
		if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test( tempVal ) || tempVal < 0){
			    _alertValMsg(tempId,"<dict:lang value="该项只能为正数" />");
			    return "0";  
		}else 
		return "1"; 
	}
	
	function checkIsNull(tempId){
		_alertValMsg(tempId,"<dict:lang value="该项不能为空" />");
		return "0";  
	}
	
	
	
	function editCal(trCount1,trCount2,trCount3,trCount4){
                        
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
        	
                    var tempFlag1 = checkVal1(trCount1);
                    if(tempFlag1=="0"){
                         return ;
                    }
                    if($("#paraMapObj_CDC_TASK_TIME").val()<=0){
                         
                           _alertValMsg(document.getElementById("paraMapObj_CDC_TASK_TIME"),"<dict:lang value="请输入大于0的数" />");
                           return ;
                        }
          setHid();
           document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=71d8daa74b444f79922148ba52bcbef4"+"&trCount1="+trCount1+"&trCount2="+trCount2+"&trCount3="+trCount3+"&trCount4="+trCount4;
        
document.forms.editForm.submit();
}
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
  })
})(jQuery)</script>


	<!-- js初始化方法 -->
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
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
