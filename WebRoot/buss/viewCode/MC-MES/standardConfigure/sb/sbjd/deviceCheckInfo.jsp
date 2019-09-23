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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
   <%-- <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>--%>
    <!-- 产品静态资源 -->
<script type="text/javascript">
//把禁用的数据塞到隐藏域中
function setHid(){
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_TYPE' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_TYPE").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_CLASS' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_CLASS").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_USE_DEP' type='hidden' value='"+$("#paraMapObj_CD_USE_DEP").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_SN' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_SN").val()+"'>");

}

</script>
<style>
.acss{
    width:137px!important;
}
</style>
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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:493px">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="7e51cc6aa9ee435690126e8c25c50178" type="edit" />
	<div class="mod">
    <div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>	
	<table class="basic-table" >
	<s:hidden id ="curId" name="curId" value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}'/>
	<input type="hidden" name="type1" value="点检项目"/>
	<s:hidden id ="curUser" name="curUser" value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}'/>
	
	<input type="hidden" name="formIds" value="7e51cc6aa9ee435690126e8c25c50178" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" id="prefixInd" name="7e51cc6aa9ee435690126e8c25c50178" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0a97d06fef064a5dbd1dab2e7eaa3d83'" />
		<s:set name="_$formId_1" value="'7e51cc6aa9ee435690126e8c25c50178'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" style="width:200px;" readonly="readonly" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" style="width:200px;" disabled="disabled"  /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" style="width:200px;" disabled="disabled" /></bu:td>
		</tr>
	
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDS_TASK_TIME" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<bu:td cssClass="dec" colNo="CDS_TASK_TIME" formId="7e51cc6aa9ee435690126e8c25c50178" ><bu:ui colNo="CDS_TASK_TIME" onkeyup="value=value.replace(/[^\d.]/g,'')" formId="7e51cc6aa9ee435690126e8c25c50178" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDS_CHECK_TIME" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<bu:td cssClass="dec" colNo="CDS_CHECK_TIME" formId="7e51cc6aa9ee435690126e8c25c50178" ><bu:ui colNo="CDS_CHECK_TIME" formId="7e51cc6aa9ee435690126e8c25c50178" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
	            			

			<td class="name" /><bu:uitn colNo="CDS_REPAIR_EMP" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<bu:td cssClass="dec" colNo="CDS_REPAIR_EMP" formId="7e51cc6aa9ee435690126e8c25c50178" ><bu:ui colNo="CDS_REPAIR_EMP" formId="7e51cc6aa9ee435690126e8c25c50178" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDS_MEMO" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<bu:td cssClass="dec" colNo="CDS_MEMO" formId="7e51cc6aa9ee435690126e8c25c50178" style="height:80px;" colspan="5" ><bu:ui colNo="CDS_MEMO" style="width: 100%;height: 100%;" formId="7e51cc6aa9ee435690126e8c25c50178" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
		

	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="点检项目" /></h3>	
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
						        	<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="7e51cc6aa9ee435690126e8c25c50178" i18n="1"/></td>
										<td class="datagrid-cell " style="width:137px;" ><dict:lang value="项目代码" /></td ><!--acss-->
										<td class="datagrid-cell" style="width:137px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:168px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:168px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:168px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:168px;" ><dict:lang value="实际值" /></td >
										
										<td class="datagrid-cell" style="width:168px;"><dict:lang value="备注" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:190px;">
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
			<bu:jsVal formId="7e51cc6aa9ee435690126e8c25c50178" formIndex="1" />		<div style="padding:1px;"></div>
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
	<script type="text/javascript">
    var trCount1 = 0;
	var url = "buss/bussModel_exeFunc.ms?&funcMId=a0e6771d04584df7964effb7e5c1d975";
		$(function(){
		$("#paraMapObj_CDS_REPAIR_EMP_SHOW").val($("#curUser").val());
		$("#paraMapObj_CDS_CHECK_TIME").val(timeBeginString());
		$("#paraMapObj_CDS_REPAIR_EMP").val($("#curId").val());
		
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
									if(itemList[i].CDII_ITEM_TYPE=="点检项目"){
										trCount1++;
										var deviceItemCode1="deviceItemCode1_"+trCount1;
										var deviceItemName1="deviceItemName1_"+trCount1;
										var deviceItemClass1="deviceItemClass1_"+trCount1;
										var deviceitemMaxvalue1="deviceitemMaxvalue1_"+trCount1;
										var deviceitemMinvalue1="deviceitemMinvalue1_"+trCount1;
											/*	var divN="<div id='hidDiv_"+trCount1+"' style='display: none;'>"+
												""+
												""+
												""+
												""+
												""+
												""+
												"</div>";
												
										$("#deviceItem_1 tbody:last").append(divN);*/
									
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+trCount1+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align:center;' >"+trCount1+"</td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell  datagrid-cell-1' style='width:137px;text-align: center;' name='deviceItemCode'>"+itemList[i].CDII_ITEM_CODE+"<input name='deviceItemCodes' type='hidden' id='"+deviceItemCode1+"' value='"+itemList[i].CDII_ITEM_CODE+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:137px;text-align: center;' name='deviceItemName'>"+itemList[i].CDII_ITEM_NAME+"<input name='deviceItemNames' type='hidden' id='"+deviceItemName1+"' value='"+itemList[i].CDII_ITEM_NAME+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:168px;text-align: center;' name='deviceItemClass'>"+tempItemClass+"<input name='deviceItemClasss' type='hidden' id='"+deviceItemClass1+"' value='"+itemList[i].CDII_ITEM_CLASS+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:168px;text-align: center;' name='deviceitemMaxvalue'>"+itemList[i].CDII_ITEM_MAXVALUE+"<input name='deviceitemMaxvalues' type='hidden' id='"+deviceitemMaxvalue1+"' value='"+itemList[i].CDII_ITEM_MAXVALUE+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:168px;text-align: center;' name='deviceitemMinvalue'>"+itemList[i].CDII_ITEM_MINVALUE+"<input name='deviceitemMinvalues' type='hidden' id='"+deviceitemMinvalue1+"' value='"+itemList[i].CDII_ITEM_MINVALUE+"'></td>");
									
									    if(itemList[i].CDII_ITEM_CLASS!=2){
										   $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:168px;text-align: center;'><input type='text' class='_VAL_NULL ' id='deviceItemReal1_"+trCount1+"' name='deviceItemReal' value='' style='width:100%'/></td>");
										}else{
										    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:168px;text-align: center;'><select type='text' class='_VAL_NULL ' id='deviceItemReal1_"+trCount1+"' name='deviceItemReal' style='width:100%'><option value='0'>OK</option><option value='1'>NG</option></select></td>");
										}
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:168px;text-align: center;'><input type='text' id='deviceItemContent1_"+trCount1+"' name='deviceItemContent' value='' style='width:100%'/><input name='deviceSn' type='hidden' style='width:100%' value='"+deviceSn+"'></td>");
									}
									
								}
								
						
							
							}
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
		
		
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
		}
	)
	
	//校验函数
	
	function checkVal1(trCount1){
		var tempVal;
		var tempId;
		var tempFlag;
		for(var i=1;i<=trCount1;i++){
			tempVal = $("#deviceItemReal1_"+i).val();
			tempId = document.getElementById("deviceItemReal1_"+i);
			//alert($(tempId).closest("div"));
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
	
	
	function editCal(){
                        
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
                    if($("#paraMapObj_CDS_TASK_TIME").val()<=0){
                         
                           _alertValMsg(document.getElementById("paraMapObj_CDS_TASK_TIME"),"<dict:lang value="请输入大于0的数" />");
                           return ;
                        }
                    if($("#paraMapObj_CDS_CYCLE").val()<=0){
                         
                           _alertValMsg(document.getElementById("paraMapObj_CDS_CYCLE"),"<dict:lang value="请输入大于0的数" />");
                           return ;
                        }
            setHid();
           document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=263a7ab1c06b42988ec904c61519f2ec";
        
document.forms.editForm.submit();
}


function timeBeginString(){
    			var datetime = new Date();
    		//	datetime.setDate(datetime.getDate()-7);
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			var Hours =datetime.getHours();       //获取当前小时数(0-23)
                var Minutes = datetime.getMinutes();     //获取当前分钟数(0-59)
                var Seconds =  datetime.getSeconds();     //获取当前秒数(0-59)
    			return year + "-" + month + "-" + date+" "+Hours+":"+Minutes+":"+Seconds;
    		}
</script>
	
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
