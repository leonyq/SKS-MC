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
  
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;height:530px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ef1235107cca42518c74d9cac446da3f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ef1235107cca42518c74d9cac446da3f" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
	<input type="hidden" name="ef1235107cca42518c74d9cac446da3f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'07ca51cd51be46a9bcc5def50c81c484'" />
		<s:set name="_$formId_1" value="'ef1235107cca42518c74d9cac446da3f'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WDT_TYPE_SN" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_TYPE_SN" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_TYPE_SN" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WDT_TYPE_NAME" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_TYPE_NAME" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_TYPE_NAME" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_DOC_PREFIX" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_DOC_PREFIX" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_DOC_PREFIX" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WDT_OPERATE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_OPERATE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_OPERATE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_ERP_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_ERP_TYPE" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_ERP_TYPE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="WDT_SAMPLE_FLAG" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_SAMPLE_FLAG" formId="ef1235107cca42518c74d9cac446da3f" >
			<bu:ui colNo="WDT_SAMPLE_FLAG" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="WDT_HANDOVER_FLAG" formId="ef1235107cca42518c74d9cac446da3f" />
			<bu:ui colNo="WDT_HANDOVER_FLAG" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
		    </bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_TEST_STEP" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_TEST_STEP" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_TEST_STEP" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WDT_SAMPLE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_SAMPLE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_SAMPLE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_EXCESS_RECEIVE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_EXCESS_RECEIVE" formId="ef1235107cca42518c74d9cac446da3f" >
			<bu:ui colNo="WDT_EXCESS_RECEIVE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="WDT_EXCESS_PICK" formId="ef1235107cca42518c74d9cac446da3f" />
			<bu:ui colNo="WDT_EXCESS_PICK" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			</bu:td>
		    	
            <td class="name" /><bu:uitn colNo="WDT_HANDOVER_WAYS" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_HANDOVER_WAYS" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_HANDOVER_WAYS" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WDT_UPLOAD_FLAG" formId="ef1235107cca42518c74d9cac446da3f" /></td>
		    <bu:td cssClass="dec" colNo="WDT_UPLOAD_FLAG" formId="ef1235107cca42518c74d9cac446da3f" >
			<bu:ui colNo="WDT_UPLOAD_FLAG" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
            <bu:uitn colNo="WDT_PDA_FLAG" formId="ef1235107cca42518c74d9cac446da3f" />
			<bu:ui colNo="WDT_PDA_FLAG" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			</bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_CREATE_RULE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_CREATE_RULE" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_CREATE_RULE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="指令信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="收发类型" /></SPAN> </A>
								</LI>
								

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<!--
		<div class="extend-btn" id="addDel" style="float: right;margin-top:-5px;margin-bottom:5px;">
	<button type="button" onclick="popModelDiv('addModel','backModel');" style="padding:0;" title="新增">
		<i class="ico ico-kl-new-add ico-small"></i>
	</button>
	<button type="button" onclick="delRow();" style="padding:0" title="删除">
		<i class="ico ico-sc-new-add ico-small"></i>
	</button>
		</div>
		-->
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="指令代码" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="指令名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="指令集名称" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scorl1"   style="height:190px;max-width:100%">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addOrderSet" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>	
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
			
					<!--
					<div class="extend-btn" style="float: right;margin-bottom:5px;margin-top: -5px;">
						<button type="button"    onclick="addMyRow();" style="padding:0;" title="<dict:lang value="新增" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="delMyRow();" style="padding:0"   title="<dict:lang value="删除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
					-->
			<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" style=""  >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head2" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="收发类型代码" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="收发类型名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="收发类型前缀" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="是否送检" /></td >
										<td style="display:none;">
										<dict:selectDict id="isCheck" name="isCheck" dictCode="YOrN" />
										</td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="检测阶别" /></td >
										<td style="display:none;">
										<dict:selectDict id="checkSt" name="checkSt" dictCode="QTI_TEST_STEP" />
										</td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="检测类型" /></td >
										<td style="display:none;">
										<dict:selectDict id="checkTy" name="checkTy" dictCode="SAMPLE_TYPE" />
										</td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="是否交接" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="交接方式" /></td >
										<td style="display:none;">
										<dict:selectDict id="handWay" name="handWay" dictCode="HANDOVER_WAYS" />
										</td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="ERP同步标志" /></td >
										
										<td class="datagrid-cell" style="width:240px;" ><dict:lang value="生成规则" /></td >
										<td style="display:none;">
										<bu:ui colNo="WDT_CREATE_RULE" id="createRule" name="createRule" style="width:240px;" formId="ef1235107cca42518c74d9cac446da3f"  dataId="${dataId}" formIndex="1" />
										</td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scorl2"   style="height:190px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
								<tbody id="addDispatchType" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>		
		 				</DIV>
		 				

						</DIV>

	</DIV>
</div>
	</div>	

			<bu:jsVal formId="ef1235107cca42518c74d9cac446da3f" formIndex="1" />		

				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
	$("#tag1").addClass("current");
	getOrderInfo();
})
//根据类型编码带出相关信息
var ttCount=0;
function getOrderInfo(){
	util.showLoading("处理中...");
	var dataId = "${dataId}";
	var wdo_type_sn=$("#paraMapObj_WDT_TYPE_SN").val();
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=7367c4b827184d68832a757db764573b",//VM-单据配置中心-修改 操作功能 修改页面加载关联的指令
			    data: {
			        "wdo_type_sn":wdo_type_sn,
			        "dataId":dataId			        
			    },
				success: function(data){
				                 $("#addOrderSet").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxMap){
							var orderList =data.ajaxMap.orderList;
							var typeList =data.ajaxMap.typeList;
							for(var i=0;i<orderList.length;i++){
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' name='TCS_CODE' value='"+orderList[i].TCS_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'>"+orderList[i].TCL_CODE+"<input type='hidden' name='TCL_CODE' value='"+orderList[i].TCL_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: center;'>"+orderList[i].TCL_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:110px;text-align: center;'>"+orderList[i].TCS_NAME+"</td>");
							}
							for(var i=0;i<typeList.length;i++){
								var isCheckOpt = $("#isCheck").html();
                            	var isCheckOption = isCheckOpt.substring(isCheckOpt.indexOf('<option'));
                            	var isCheckSel = "<select id='isCheckSel_"+(ttCount+1)+"' name='isCheckSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                            	var isHandSel = "<select id='isHandSel_"+(ttCount+1)+"' name='isHandSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                            	var isERPSel = "<select id='isERPSel_"+(ttCount+1)+"' name='isERPSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                            	var checkSt = $("#checkSt").html();
                            	var testStepOption = checkSt.substring(checkSt.indexOf('<option'));
                            	var testStepSel = "<select id='testStepSel_"+(ttCount+1)+"' name='testStepSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ testStepOption +"</select>";
                            	var checkTy = $("#checkTy").html();
                            	var sampleOption = checkTy.substring(checkTy.indexOf('<option'));
                            	var sampleSel = "<select id='sampleSel_"+(ttCount+1)+"' name='sampleSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ sampleOption +"</select>";
                            	var handWay = $("#handWay").html();
                            	var handWayOption = handWay.substring(handWay.indexOf('<option'));
                            	var handWaySel = "<select id='handWaySel_"+(ttCount+1)+"' name='handWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ handWayOption +"</select>";
	                            var createRule = $("#createRule").html();
                            	var createRuleOption = createRule.substring(createRule.indexOf('<option'));
                            	var createRuleSel = "<select id='createRule_"+(ttCount+1)+"' name='createRuleSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ createRuleOption +"</select>";
	
	
								if(typeList[i].WDO_DISPATCH_PREFIX==null) typeList[i].WDO_DISPATCH_PREFIX="";
								if(typeList[i].CCC_CONFIGURE_NAME==null) typeList[i].CCC_CONFIGURE_NAME="";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' readonly='readonly' name='WDO_DISPATCH_SN' value='"+typeList[i].WDO_DISPATCH_SN+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' readonly='readonly' name='WDO_DISPATCH_NAME' value='"+typeList[i].WDO_DISPATCH_NAME+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%;' maxlength='50' class=' input isSubmit' readonly='readonly' name='WDO_DISPATCH_PREFIX' value='"+typeList[i].WDO_DISPATCH_PREFIX+"'/></td>");
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'>"+isCheckSel+"</td>");
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='display:none;'>"+isCheckSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;'>"+testStepSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;'>"+isCheckSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;padding:0;'>"+sampleSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='display:none;'>"+isCheckSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;padding:0;'>"+isHandSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:120px;padding:0;'>"+handWaySel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='display:none;'>"+isCheckSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>"+isERPSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:240px;padding:0;'><input type='text' style='width:100%;' maxlength='50' class=' input isSubmit' readonly='readonly' name='WDO_DISPATCH_PREFIX' value='"+typeList[i].CCC_CONFIGURE_NAME+"'/></td>");
	                            $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='display:none;'>"+isCheckSel+"</td>");
								
						        mySetChosen();//设置下拉框样式
                            	$("#isCheckSel_"+(ttCount+1)).val(typeList[i].WDO_SAMPLE_FLAG);
								$("#isCheckSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#testStepSel_"+(ttCount+1)).val(typeList[i].WDO_TEST_STEP);
								$("#testStepSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#sampleSel_"+(ttCount+1)).val(typeList[i].WDO_SAMPLE_TYPE);
								$("#sampleSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#isHandSel_"+(ttCount+1)).val(typeList[i].WDO_HANDOVER_FLAG);
								$("#isHandSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#handWaySel_"+(ttCount+1)).val(typeList[i].WDO_HANDOVER_WAYS);
								$("#handWaySel_"+(ttCount+1)).trigger("chosen:updated");
								$("#isERPSel_"+(ttCount+1)).val(typeList[i].WDO_UPLOAD_FLAG);
								$("#isERPSel_"+(ttCount+1)).trigger("chosen:updated");
						        $("#createRule_"+(ttCount+1)).val(typeList[i].WDT_CREATE_RULE);
								$("#createRule_"+(ttCount+1)).trigger("chosen:updated");
								
                            	$("#isCheckSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#isHandSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#isERPSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#testStepSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#sampleSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#handWaySel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");							
	                            $("#createRuleSel_"+(ttCount+1)+"_chosen").attr("style","width:240px;");
							    ttCount++;
							}
							//clickTr('dispatchType');
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							//clickTr('orderSet');
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//设置下拉框样式
function mySetChosen(){
	
	var curWinHeight = $(document).height();//当前窗口高度
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:true,//是否隐藏搜索框
		disable_search_threshold:15//少于15项，隐藏搜索框
	});

	//大于10个选项的，显示搜索框
	var len1 = $(".dept_select").length;
	$(".dept_select").each(function(index,item){
		if(item.id!=""){
		if(item != null && item.length > 10){
			//.chosen-container-single .chosen-search
			$("#"+item.id+"_chosen .chosen-search").css("display","block");
		}

		var offset = $("#"+item.id+"_chosen").offset(); //计算当前下拉框的偏移量
		
		var maxHeight = $("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
		
		var searchHeight = 0;//下拉搜索框的高度，默认为0
		//如果有显示搜索框，则需多计算搜索框的高度
		if(!$("#"+item.id+"_chosen .chosen-drop .chosen-search").is(":hidden")){
			searchHeight = 35;
		}
		//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
		if(offset.top > (curWinHeight/2)){
			$("#"+item.id+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
			//console.log($("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
			if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
			}
		}else{
			var itemHeight = curWinHeight - offset.top;
			if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
			}
		}
		}

	});
}
var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}
</script>
	
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scorl1','.head1');
    setPopScroll('.scorl2','.head2');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 
