<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
			<!-- head里面 -->
  
  <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;height: 481px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="01cd879dda5346a48b383622571bc6c2" type="edit" />
	<div class="mod">
    	<div class="mod-hd">
    		<h3 class="tit"><dict:lang value="基本信息" /></h3>
    	</div>		
    <table class="basic-table" >
	<input type="hidden" name="formIds" value="01cd879dda5346a48b383622571bc6c2" />
	<input type="hidden" name="01cd879dda5346a48b383622571bc6c2" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'971f5b11b0714c02883089824bebd130'" />
		<s:set name="_$formId_1" value="'01cd879dda5346a48b383622571bc6c2'" />
		<s:set name="_$type" value="'detail'"/>
        <tr>
			<td class="name" style="width: 70px;"/><bu:uitn colNo="CO_PROJECT_CODE" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_PROJECT_CODE" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_PROJECT_CODE" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width: 70px;"/><bu:uitn colNo="CO_PROJECT_NAME" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_PROJECT_NAME" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_PROJECT_NAME" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width: 70px;"/><bu:uitn colNo="CO_PROJECT_TYPE" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_PROJECT_TYPE" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_PROJECT_TYPE" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CO_AFFECT_INFO" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" colNo="CO_AFFECT_INFO" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_AFFECT_INFO" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CO_PRODUCT_STEP" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" colNo="CO_PRODUCT_STEP" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_PRODUCT_STEP" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name"  style="display:none;"/><bu:uitn colNo="CO_DEFAULT" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec"  style="display:none;" colNo="CO_DEFAULT" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_DEFAULT" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CO_REMARK" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" colspan="5" colNo="CO_REMARK" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_REMARK" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1"  style="width:100%; height:80px;"/></bu:td>
		</tr>
		
		
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="指示单项目责任人" /></h3>
			</div>
			<!--<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="">
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="delRow();" style="padding:0" title="删除">
					<i class="ico ico-sc-new-add ico-small"></i>
				</button>
			</div>-->
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner">
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="部门" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="确认人" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="审核人" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:210px;">
									<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" > <!--table-layout:fixed;-->
									<tbody id="addItemInfo">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="backItem" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:300px;top:118px;width:400px;height:180px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择明细信息" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:120%;">
			<!--<div class="optn optn_div">
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
			</div>-->

			<table class="basic-table">
				<tr>
        			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CO_DEPT_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
        			<bu:td style="width:200px;" cssClass="dec" colNo="CO_DEPT_ID" formId="02a4fef35fc845d5b563b1502e4760c0" ><bu:ui style="width:230px;" id="CO_DEPT_ID" colNo="CO_DEPT_ID" formId="02a4fef35fc845d5b563b1502e4760c0" value="%{CO_DEPT_ID}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CO_CONFIRM_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
        			<bu:td style="width:200px;" cssClass="dec" colNo="CO_CONFIRM_ID" formId="02a4fef35fc845d5b563b1502e4760c0" ><bu:ui colNo="CO_CONFIRM_ID" formId="02a4fef35fc845d5b563b1502e4760c0" value="%{CO_CONFIRM_ID}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CO_CHECK_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
        			<bu:td  colNo="CO_CHECK_ID" cssClass="dec" formId="02a4fef35fc845d5b563b1502e4760c0" ><bu:ui colNo="CO_CHECK_ID" formId="02a4fef35fc845d5b563b1502e4760c0" value="%{CO_CHECK_ID}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<input type="hidden" name="DEPT_ID" id="DEPT_ID" value="" />
        			<input type="hidden" name="CONFIRM_EMP" id="CONFIRM_EMP" value="" />
        			<input type="hidden" name="CHECK_EMP" id="CHECK_EMP" value="" />
        		</tr>
			</table>
		</div>

	</div>
		</div>	
			<bu:jsVal formId="01cd879dda5346a48b383622571bc6c2" formIndex="1" />		<div style="padding:1px;"></div>

		<!--<bu:form viewId="971f5b11b0714c02883089824bebd130" formId="02a4fef35fc845d5b563b1502e4760c0" isSubForm="1" list="dataListSub" formidFirstId="01cd879dda5346a48b383622571bc6c2" relColIds="" subFormIds="" subRelColIds="" />


				</form>	-->
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
        
    	getItem();	
    	function getItem(){ 
		//console.log(itemUrl);
		var infoId=$("input[name='dataId']").val();
		//console.log(infoId);
          //修改功能----回填信息
		var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=87be9b3fcab44c23a935c37bb6134507";
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: itemUrl,
		    	data: {
		    	    "infoId":infoId
		    	},
				success: function(data){
		        	$("#addItemInfo").empty();
					util.closeLoading();
					if(null == data){return ;}
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						for(var i=0;i<rccList.length;i++){
							if(rccList[i].DEPT_ID_VAL==null) rccList[i].DEPT_ID_VAL="";
							if(rccList[i].CONFIRM_ID_VAL==null) rccList[i].CONFIRM_ID_VAL="";
							if(rccList[i].CHECK_ID_VAL==null) rccList[i].CHECK_ID_VAL="";
							if(rccList[i].DEPT_NAME==null) rccList[i].DEPT_NAME="";
							if(rccList[i].CONFIRM_NAME==null) rccList[i].CONFIRM_NAME="";
							if(rccList[i].CHECK_NAME==null) rccList[i].CHECK_NAME="";
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr' ></tr>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/><input type='hidden' name='itemId' value='"+rccList[i].ID+"'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + rccList[i].DEPT_NAME + "<input type='hidden'	 name='DEPT_ID_VAL' id='DEPT_ID" + (i + 1) + "' value='" + rccList[i].DEPT_ID_VAL + "'/></td>");	
                			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + rccList[i].CONFIRM_NAME + "<input type='hidden'	 name='CONFIRM_EMP_VAL' id='CONFIRM_EMP" + (i + 1) + "' value='" + rccList[i].CONFIRM_ID_VAL + "'/></td>");
                			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + rccList[i].CHECK_NAME + "<input type='hidden'	 name='CHECK_EMP_VAL' id='CHECK_EMP" + (i + 1) + "' value='" + rccList[i].CHECK_ID_VAL + "'/></td>");
						}	
					
						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						//clickTr('addItemInfo');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					}
				
				},
				error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    }
			});
		}
    </script>
    <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
