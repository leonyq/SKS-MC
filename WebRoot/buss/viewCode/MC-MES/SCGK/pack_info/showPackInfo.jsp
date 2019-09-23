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
<style type="text/css">
.input {
	width:200px !important;
}
</style>
			<!-- head里面 -->
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="080ce545617f4ff5949b1f52484c48ee" type="edit" />
<div class="mod">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="基本信息" /></h3>	
        </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="080ce545617f4ff5949b1f52484c48ee" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="080ce545617f4ff5949b1f52484c48ee" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="dataAuth" name="dataAuth" value="${param.dataAuth}"/>
		<s:set name="_$viewId" value="'87fa02e7d79c42e181d22b992de5176f'" />
		<s:set name="_$formId_1" value="'080ce545617f4ff5949b1f52484c48ee'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTI_SN" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_SN" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_SN" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTI_NAME" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_NAME" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_NAME" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="PTI_WEIGH_WAY" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="PTI_WEIGH_WAY" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_WEIGH_WAY" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PTI_DEVIATE_RANGE" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_DEVIATE_RANGE" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_DEVIATE_RANGE" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>			

            <td class="name" /><bu:uitn colNo="PTI_ROUTE_CHECK" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_ROUTE_CHECK" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_ROUTE_CHECK" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>

			
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PTI_MEMO" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_MEMO" formId="080ce545617f4ff5949b1f52484c48ee" colspan="5" style="height:80px;"><bu:ui colNo="PTI_MEMO" style="width:100%;height:100%" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>
		
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="策略明细信息" /></h3>	
        </div>
        
	<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" disabled="disabled"/>
										</td>
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="包装层级" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="层级名称" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="容量" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="条码规则" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="标签打印" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="标签模板" /></td >
										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="标签打印地址" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="清单打印" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="清单模板" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="清单打印地址" /></td >
										<td class="datagrid-cell" style="width:100px;"><dict:lang value="分页带表头" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="生成规则" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3" style="height:220px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addPackInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				
</div>	
			<bu:jsVal formId="080ce545617f4ff5949b1f52484c48ee" formIndex="1" />

				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
    setVal();
})
//回填信息
function setVal(){
    util.showLoading("处理中...");
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=586384c8cdec4a8985daabd2d0d63492",
			    data: {
			        pSn: $("#paraMapObj_PTI_SN").val(),
			        dataAuth: $("#dataAuth").val()
			    },
				success: function(data){
						         $("#addPackInfo").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i=0;i<rccList.length;i++){
							    if(rccList[i].PTD_LABLE_TEMPLATE==null) rccList[i].PTD_LABLE_TEMPLATE="";
							    if(rccList[i].PTD_LABLE_ADDRESS==null) rccList[i].PTD_LABLE_ADDRESS="";
							    if(rccList[i].PTD_LIST_TEMPLATE==null) rccList[i].PTD_LIST_TEMPLATE="";
							    if(rccList[i].PTD_LIST_ADDRESS2==null) rccList[i].PTD_LIST_ADDRESS2="";
							    if(rccList[i].CCC_CONFIGURE_NAME==null) rccList[i].CCC_CONFIGURE_NAME="";
							    if(rccList[i].TBR_NAME==null) rccList[i].TBR_NAME="";
							    if(rccList[i].LABEL_NAME==null) rccList[i].LABEL_NAME="";
							    if(rccList[i].PTD_LABLE_RULE==null) rccList[i].PTD_LABLE_RULE="";
							    if(rccList[i].PTD_LABLE_PRINT=="Y") rccList[i].PTD_LABLE_PRINT="是";
							    if(rccList[i].PTD_LABLE_PRINT=="N") rccList[i].PTD_LABLE_PRINT="否";
							    if(rccList[i].PTD_LIST_PRINT=="Y") rccList[i].PTD_LIST_PRINT="是";
							    if(rccList[i].PTD_LIST_PRINT=="N") rccList[i].PTD_LIST_PRINT="否";
							    if(rccList[i].PTD_TITLE_FLAG=="Y") rccList[i].PTD_TITLE_FLAG="是";
							    if(rccList[i].PTD_TITLE_FLAG=="N") rccList[i].PTD_TITLE_FLAG="否";
								var tempHtml = "<tr id='tr_"+(i+1)+"'>"+
                    				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' disabled='disabled'/><input name='memo' type='hidden' value='"+rccList[i].PTD_MEMO+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: center;'>"+rccList[i].PTD_LEVEL+"<input name='myPackLevel' type='hidden' value='"+rccList[i].PTD_LEVEL+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-5' style='width:130px;text-align: center;'>"+rccList[i].PTD_LEVEL_NAME+"<input name='levelName' type='hidden' value='"+rccList[i].PTD_LEVEL_NAME+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;'>"+rccList[i].PTD_CAPACITY+"<input name='capacity' type='hidden' value='"+rccList[i].PTD_CAPACITY+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: center;'>"+rccList[i].TBR_NAME+"<input name='labelRule' type='hidden' value='"+rccList[i].PTD_LABLE_RULE+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;'>"+rccList[i].PTD_LABLE_PRINT+"<input name='lablePrint' type='hidden' value='"+rccList[i].PTD_LABLE_PRINT+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: center;'>"+rccList[i].LABEL_NAME+"<input name='labelTemp' type='hidden' value='"+rccList[i].PTD_LABLE_TEMPLATE+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-9' style='width:200px;text-align: center;'>"+rccList[i].PTD_LABLE_ADDRESS+"<input name='labelAddress' type='hidden' value='"+rccList[i].PTD_LABLE_ADDRESS+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;'>"+rccList[i].PTD_LIST_PRINT+"<input name='listPrint' type='hidden' value='"+rccList[i].PTD_LIST_PRINT+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: center;'>"+rccList[i].PTD_LIST_TEMPLATE+"<input name='listTemp' type='hidden' value='"+rccList[i].PTD_LIST_TEMPLATE+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: center;'>"+rccList[i].PTD_LIST_ADDRESS2+"<input name='listAddress' type='hidden' value='"+rccList[i].PTD_LIST_ADDRESS2+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: center;'>"+rccList[i].PTD_TITLE_FLAG+"<input name='titleFlag' type='hidden' value='"+rccList[i].PTD_TITLE_FLAG+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: center;'>"+rccList[i].CCC_CONFIGURE_NAME+"<input name='listAddress' type='hidden' value='"+rccList[i].CCC_CONFIGURE_NAME+"'></td>"+
                    				"</tr>";
                    			$("#addPackInfo").append(tempHtml);
							    
							}
							$("#packLevel").val(rccList.length+1);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
    //setPopScroll('.scorl1','.head1');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
