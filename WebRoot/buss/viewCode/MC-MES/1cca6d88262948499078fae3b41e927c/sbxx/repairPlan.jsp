<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="保养计划" />
    </title>
     <style type="text/css">
     .acss{
         width:30px !important;
     }
	.datagrid-header,.datagrid-body{
		width:100% !important;
	}
	.datagrid-body1 td{
		border-width: 0 1px 1px 0;
    		border-style: solid;
    		margin:0;
    		border-color: #dbe1ef;
	}
	
	.datagrid-body1 tr:hover{
	    background-color:#c3e2fb !important;
	}
	
	.datagrid-body2 tr:hover{
	    background-color:#c3e2fb !important;
	}
	
	.block2 .datagrid-body2{
	    height:calc(100% - 32px);
	}
	
	.datagrid-body2 .datagrid-selected{
	    background-color:#d3eafc;
	}
	
	.datagrid-body2 td{
		border-width: 0 1px 1px 0;
    		border-style: solid;
    		margin:0;
    		border-color: #dbe1ef;
	}
	.block2 td,.block1 td{
		box-sizing: border-box;
	}
	#_loading_lay_div{
		opacity:0 !important;
		background-color:#fff !important;
	}
    </style>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="67b046cee49343d98ec5214366ca5c7c"/>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="81d5442a15a8433d98467c6198a42ccc" />
            </div>
            <div class="bd" id="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="81d5442a15a8433d98467c6198a42ccc" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
         <div class="block1" style="float:left;width:40%;">
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
		<input type="hidden" name="formPage67b046cee49343d98ec5214366ca5c7c" id="formPage67b046cee49343d98ec5214366ca5c7c" value="${formPage67b046cee49343d98ec5214366ca5c7c}"/>
		<input type="hidden" name="formId" id="formId1" value='67b046cee49343d98ec5214366ca5c7c'/>
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="myleftId" name="myleftId" value=''/>
		<div class="panel-ajax datagrid datagrid-div1"  id="67b046cee49343d98ec5214366ca5c7c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax67b046cee49343d98ec5214366ca5c7c">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head1" id="datagrid-header-inner67b046cee49343d98ec5214366ca5c7c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable67b046cee49343d98ec5214366ca5c7c">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass=" datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell acss" style="width:30px; text-align:center;" ><bu:thSeq  formId="67b046cee49343d98ec5214366ca5c7c" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_67b046cee49343d98ec5214366ca5c7c" onclick="_selectAjaxTableAllData(this,'67b046cee49343d98ec5214366ca5c7c')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDP_PLAN_SN" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDP_PLAN_NAME" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDP_TYPE" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDP_CYCLE" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDP_SPACE" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDP_PRODUCT_TIMES" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body1  datagrid-div3  datagrid-body-ajax scroll1" id="tableDiv67b046cee49343d98ec5214366ca5c7c" onscroll="ajaxTableScroll(this,'67b046cee49343d98ec5214366ca5c7c')" style="overflow-x:hidden;">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax67b046cee49343d98ec5214366ca5c7c">
		<tbody id="tbody_67b046cee49343d98ec5214366ca5c7c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage67b046cee49343d98ec5214366ca5c7c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchPlanCode&formId=67b046cee49343d98ec5214366ca5c7c&showLoading=0" />
			
			</div>
		</c:if>
		</div>
			<div class="block2" style="width:58%;float:right;">
					<div style="height:100%;">
				   		<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="height:100%;border-bottom:none;">
			<div class="datagrid-header">
			<div class="datagrid-header-inner head2" id="datagrid-header-inner" >
				<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
						<td class="datagrid-cell" style="width:30px; text-align:center;" ></td>
						
						<td class="datagrid-cell" style="width:120px;" align="center"><dict:lang value="设备SN" /></td >
						<td class="datagrid-cell" style="width:120px;" align="center"><dict:lang value="保养项目" /></td >
						<td class="datagrid-cell" style="width:120px;" align="center"><dict:lang value="设备名称" /></td >
						<td class="datagrid-cell" style="width:120px;" align="center"><dict:lang value="所属区域" /></td >
						<td class="datagrid-cell" style="width:120px;" align="center"><dict:lang value="设备类型" /></td >
						<td class="datagrid-cell" style="width:120px;" align="center"><dict:lang value="设备型号" /></td >
						<td class="datagrid-cell" style="width:120px;display:none;" align="center"><input type="hidden"/></td >
						<td class="datagrid-cell" style="width:120px;display:none;" align="center"><input type="hidden"/></td >
					</tr>
					</tbody>
				</table>
			</div>
			</div>
		<div class="datagrid-body2 datagrid-div3 scroll2" id="datagrid-body">
				<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
					<tbody id="addLoadDevice">
					
					</tbody>
				</table>
		</div>	
		
						</div> 
						<div style="background-color: white;">
							<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchDevice&formId=formId2&showLoading=0" />
					</div>	
		</div>
					</div>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
               
            </div>
        </div>
    </div>
		<bu:submit viewId="81d5442a15a8433d98467c6198a42ccc" />
		<bu:script viewId="81d5442a15a8433d98467c6198a42ccc" />
    <script type="text/javascript">
    function showDevice(planId){
    var formId = $("#formId1").val();
    $("#myleftId").val(planId);
    var getDeviceUrl="${path}buss/bussModel_exeFunc.ms?funcMId=fd0ef2b723104d31a0390c80af6fe0f6&formId="+formId;
    util.showLoading("处理中...");
    var pcount = 0;
    //var pcount = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord * (_GLO_FORM_PAGE_MAP[paginationImpl].currentPage -1 );
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getDeviceUrl,
			    data:{
                "dataId":planId
			    },
			    //data: "",
				success: function(data){
						util.closeLoading();
						$("#addLoadDevice").empty();
						//console.log(data.ajaxPage.dataList);
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							//$("#addLoadDevice").empty();
							for(var i = 0;i < rccList.length; i++){
							    if(rccList[i].CA_NAME==null) rccList[i].CA_NAME="";
							    if(rccList[i].CDII_CYCLE==null) rccList[i].CDII_CYCLE="";
								$("#addLoadDevice").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(pcount+i+1)+"</td>");
								//$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px; text-align:center;'><input type='checkbox' name='deviceSel' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='120px;'><span onclick='itemJump1(\""+rccList[i].CDPI_DEVICE_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;' >"+rccList[i].CDPI_DEVICE_SN+"</span></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;'>"+rccList[i].CDII_ITEM_NAME+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;'>"+rccList[i].CD_DEVICE_NAME+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;'>"+rccList[i].CA_NAME+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;'>"+rccList[i].DEVICE_TYPE+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;'>"+rccList[i].DEVICE_CLASS+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;display:none;'><input type='hidden' id='myPlanSn' name='myPlanSn' value='"+rccList[i].CDP_PLAN_SN+"'></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;display:none;'><input type='hidden' id='mydataAuth' name='mydataAuth' value='"+rccList[i].DATA_AUTH+"'></td>");
							}
							
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
    }
							
							
	function searchDevice(paginationImpl){
             var url ="${path}buss/bussModel_exeFunc.ms?funcMId=590148d813cd48e69a5b1cc0511fb38d";
            	SearchDevice(paginationImpl,url);
            }
							
	
							
   
    //关联设备查询
		function SearchDevice(paginationImpl,url){
		
        var myleftId = $("#myleftId").val();
		var pcount = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord * (_GLO_FORM_PAGE_MAP[paginationImpl].currentPage -1 );
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data:{
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
                    "myleftId":myleftId
			    },
			    //data: "paraMap.myPlanSn="+myPlanSn+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			   
				success: function(data){
				        	
						util.closeLoading();
						$("#addLoadDevice").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							//$("#addLoadDevice").empty();
							for(var i = 0;i < rccList.length; i++){
							 	if(rccList[i].CA_NAME==null) rccList[i].CA_NAME="";
							 	if(rccList[i].CDII_CYCLE==null) rccList[i].CDII_CYCLE="";
								$("#addLoadDevice").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(pcount+i+1)+"</td>");
								//$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px; text-align:center;'><input type='checkbox' name='deviceSel' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='120px;'><span onclick='itemJump1(\""+rccList[i].CDPI_DEVICE_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;' >"+rccList[i].CDPI_DEVICE_SN+"</span></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='120px;'>"+rccList[i].CDII_ITEM_NAME+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='120px;'>"+rccList[i].CD_DEVICE_NAME+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='120px;'>"+rccList[i].CA_NAME+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='120px;'>"+rccList[i].DEVICE_TYPE+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='120px;'>"+rccList[i].DEVICE_CLASS+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;display:none;'><input type='hidden' id='myPlanSn' name='myPlanSn' value='"+rccList[i].CDP_PLAN_SN+"'></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;display:none;'><input type='hidden' id='mydataAuth' name='mydataAuth' value='"+rccList[i].DATA_AUTH+"'></td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		}
		
		function searchPlanCode(paginationImpl){
                var url ="${path}buss/bussModel_exeFunc.ms?funcMId=c1087f0fd7254adea62ac85caaf4c914";
        	SearchPlanCode(paginationImpl,url);
        }
		
	//保养计划查询
		function SearchPlanCode(paginationImpl,url){
		var planSn = $.trim($("#CDP_PLAN_SN").val());
		var planName = $.trim($("#CDP_PLAN_NAME").val());
		var cdpCycle = $("#CDP_CYCLE").val();
		var cdpType = $("#CDP_TYPE").val();
		var dataAuth = $("#DATA_AUTH").val();
		var formId = $("#formId1").val();
		var pcount = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord * (_GLO_FORM_PAGE_MAP[paginationImpl].currentPage -1 );

		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data:{
			        "paraMap.dataAuth":dataAuth,
			        "paraMap.planSn":planSn,
			        "paraMap.planName":planName,
			        "paraMap.cdpCycle":cdpCycle,
			        "paraMap.cdpType":cdpType,
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.dataAuth="+dataAuth+"&paraMap.planSn="+planSn+"&paraMap.planName="+planName+"&paraMap.cdpCycle="+cdpCycle+"&paraMap.cdpType="+cdpType+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
						util.closeLoading();
						//if(null == data){return ;}
						$("#tbody_67b046cee49343d98ec5214366ca5c7c").empty();
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							//$("#tbody_67b046cee49343d98ec5214366ca5c7c").empty();
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CDP_PLAN_NAME==null) rccList[i].CDP_PLAN_NAME="";
								if(rccList[i].CDPCYCLE==null) rccList[i].CDPCYCLE="";
							  	if(rccList[i].CDP_TYPE==1) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>周期</span>";}
							  	if(rccList[i].CDP_TYPE==2) {tempType="<span class='state' style='background-color:#7a60fd;color:#FFFFFF;width:50px'>保养间隔</span>";}
							  	if(rccList[i].CDP_TYPE==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>生产次数</span>";}
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
			 					var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].ID+"' onclick=\"showDevice('"+rccList[i].ID+"');\" abbr='"+rccList[i].ID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].ID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+(pcount+i+1)+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].ID+"' class='isSubmit _selectdata ' style='cursor: pointer;margin:0'></td>"
			 				    +"<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH' style='width:200px;text-align:center;'>"
			 					+"<span colno='DATA_AUTH'>"+rccList[i].DATAAUTH+"</span><input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"' />"
			 					+"</td>"
			 					+"<td colno='CDP_PLAN_SN' class='datagrid-cell' style='width:150px;' >"
			 					+"<span colno='CDP_PLAN_SN'>"+rccList[i].CDP_PLAN_SN+"</span>"
			 					+"<input type='hidden' id='planSn_"+rccList[i].ID+"' value='"+rccList[i].CDP_PLAN_SN+"'></td>"
			 					+"<td colno='CDP_PLAN_NAME' class='datagrid-cell' style='width:150px;' >"
			 					+"<span colno='CDP_PLAN_NAME'>"+rccList[i].CDP_PLAN_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='CDP_TYPE' class='datagrid-cell' style='width:100px;text-align:center;'>"
			 					+"<span colno='CDP_TYPE'>"+tempType+"</span>"
			 					+"</td>"
			 					+"<td colno='CDP_CYCLE' class='datagrid-cell' style='width:100px;text-align:center;'>"
			 					+"<span colno='CDP_CYCLE'>"+rccList[i].CDPCYCLE+"</span>"
			 					+"</td>"
			 					+"<td colno='CDP_SPACE' class='datagrid-cell' style='width:100px;text-align:right;'>"
			 					+"<span colno='CDP_SPACE'>"+rccList[i].CDP_SPACE+"</span>"
			 					+"</td>"
			 					+"<td colno='CDP_PRODUCT_TIMES' class='datagrid-cell' style='width:100px;text-align:right;'>"
			 					+"<span colno='CDP_PRODUCT_TIMES'>"+rccList[i].CDP_PRODUCT_TIMES+"</span>"
			 					+"</td></tr>";
			 					if(i==0){
			 					$("#myleftId").val(rccList[i].ID);
			 					trHtml = trHtml + "<input type='hidden' id='firstPlanSn' value='"+rccList[i].CDP_PLAN_SN+"' />"+ "<input type='hidden' id='firstId' value='"+rccList[i].ID+"' />";
			 					}
								$("#tbody_67b046cee49343d98ec5214366ca5c7c").append(trHtml);
							}
							
						}
						pageFun(data.ajaxPage,"67b046cee49343d98ec5214366ca5c7c");
							defTableWidthRewrite("67b046cee49343d98ec5214366ca5c7c");
							//clickTr("#datagrid-btable-ajax67b046cee49343d98ec5214366ca5c7c");
							$("#datagrid-btable-ajax67b046cee49343d98ec5214366ca5c7c").removeClass("isDefTable");
							getFirstDevice();
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		}
		
		function findPlanAndDevice(paginationImpl){
	         var url ="${path}buss/bussModel_exeFunc.ms?funcMId=7aecd0db0ffc416a89fc489dbadc72a5";
            	FindPlanAndDevice(paginationImpl,url);
        	}
		
	//混合查询
		function FindPlanAndDevice(paginationImpl,url){
		var planSn = $.trim($("#CDP_PLAN_SN").val());
		var planName = $.trim($("#CDP_PLAN_NAME").val());
		var cdpCycle = $("#CDP_CYCLE").val();
		var cdpType = $("#CDP_TYPE").val();
		var deviceSn = $.trim($("#CDP_DEVICE_SN").val());
		var deviceArea = $("#CDP_DEVICE_AREA").val();
		var dataAuth = $("#DATA_AUTH").val();
		var formId = $("#formId1").val();
		var pcount = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord * (_GLO_FORM_PAGE_MAP[paginationImpl].currentPage -1 );
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data:{
			        "paraMap.dataAuth":dataAuth,
			        "paraMap.planSn":planSn,
			        "paraMap.planName":planName,
			        "paraMap.cdpCycle":cdpCycle,
			        "paraMap.cdpType":cdpType,
			        "paraMap.deviceSn":deviceSn,
			        "paraMap.deviceArea":deviceArea,
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.dataAuth="+dataAuth+"&paraMap.planSn="+planSn+"&paraMap.planName="+planName+"&paraMap.cdpCycle="+cdpCycle+"&paraMap.cdpType="+cdpType+"&paraMap.deviceSn="+deviceSn+"&paraMap.deviceArea="+deviceArea+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
						util.closeLoading();
						//if(null == data){return ;}
						$("#tbody_67b046cee49343d98ec5214366ca5c7c").empty();
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							//$("#tbody_67b046cee49343d98ec5214366ca5c7c").empty();
							for(var i = 0;i < rccList.length; i++){
							if(rccList[i].CDP_PLAN_NAME==null) rccList[i].CDP_PLAN_NAME="";
								if(rccList[i].CDPCYCLE==null) rccList[i].CDPCYCLE="";
								if(rccList[i].CDP_TYPE==1) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>周期</span>";}
							  	if(rccList[i].CDP_TYPE==2) {tempType="<span class='state' style='background-color:#7a60fd;color:#FFFFFF;width:50px'>保养间隔</span>";}
							  	if(rccList[i].CDP_TYPE==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>生产次数</span>";}
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
			 					var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].ID+"' onclick=\"showDevice('"+rccList[i].ID+"');\" abbr='"+rccList[i].ID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].ID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+(pcount+i+1)+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].ID+"' class='isSubmit _selectdata ' style='cursor: pointer;margin:0'></td>"
			 					+"<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH' style='width:200px;text-align:center;'>"
			 					+"<span colno='DATA_AUTH'>"+rccList[i].DATAAUTH+"</span><input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"' />"
			 					+"</td>"
			 					+"<td colno='CDP_PLAN_SN' class='datagrid-cell' style='width:150px;' >"
			 					+"<span colno='CDP_PLAN_SN'>"+rccList[i].CDP_PLAN_SN+"</span>"
			 					+"<input type='hidden' id='planSn_"+rccList[i].ID+"' value='"+rccList[i].CDP_PLAN_SN+"'></td>"
			 					+"<td colno='CDP_PLAN_NAME' class='datagrid-cell' style='width:150px;' >"
			 					+"<span colno='CDP_PLAN_NAME'>"+rccList[i].CDP_PLAN_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='CDP_TYPE' class='datagrid-cell' style='width:100px;text-align:center;'>"
			 					+"<span colno='CDP_TYPE'>"+tempType+"</span>"
			 					+"</td>"
			 					+"<td colno='CDP_CYCLE' class='datagrid-cell' style='width:100px;text-align:center;'>"
			 					+"<span colno='CDP_CYCLE'>"+rccList[i].CDPCYCLE+"</span>"
			 					+"</td>"
			 					+"<td colno='CDP_SPACE' class='datagrid-cell' style='width:100px;text-align:right;'>"
			 					+"<span colno='CDP_SPACE'>"+rccList[i].CDP_SPACE+"</span>"
			 					+"</td>"
			 					+"<td colno='CDP_PRODUCT_TIMES' class='datagrid-cell' style='width:100px;text-align:right;'>"
			 					+"<span colno='CDP_PRODUCT_TIMES'>"+rccList[i].CDP_PRODUCT_TIMES+"</span>"
			 					+"</td></tr>";
			 					if(i==0){
			 					trHtml = trHtml + "<input type='hidden' id='firstPlanSn' value='"+rccList[i].CDP_PLAN_SN+"' />" + "<input type='hidden' id='firstId' value='"+rccList[i].ID+"' />";
			 					}
								$("#tbody_67b046cee49343d98ec5214366ca5c7c").append(trHtml);
						}
						
					   }
					   pageFun(data.ajaxPage,"67b046cee49343d98ec5214366ca5c7c");
					   	defTableWidthRewrite("67b046cee49343d98ec5214366ca5c7c");
					   	$("#datagrid-btable-ajax67b046cee49343d98ec5214366ca5c7c").removeClass("isDefTable");
					   	   //clickTr("#datagrid-btable-ajax67b046cee49343d98ec5214366ca5c7c");
							getFirstDevice();
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
			
			
		}
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CIG_SN\"}";
        var url = "${path}buss/bussModel_listMsData.ms";
        var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
        if(isPage(formId)){
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(isPage(formId)){
                        initPage(page,formId);
                    }
                    clearChildTable();
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    
    <%--判断是否分页--%>
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){    
           return true;
        }
        return false;
    }
    
    <%--查询--%>
    function query(thisObj){
        var formId = $("#formId1").val();
        var deviceSn = $("#CDP_DEVICE_SN").val();
	var deviceArea = $("#CDP_DEVICE_AREA").val();
	if(deviceSn!="" ||deviceArea!=""){
		findPlanAndDevice(formId);
	}else{
		searchPlanCode(formId);
	}
        //listAjaxTable(formId);
    }
    
    <%--清空表格--%>
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
   <%--当出现滚动条时动态设置表格宽度 --%>
   function setTableWidth(formId){
        /**
        *var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
        var height = $("#tableDiv"+formId).height();
        var datagridHeaderWidth = $("#datagrid-view-ajax"+formId+" .datagrid-header").width();
        if(scrollHeight-height>0){
          $("#datagrid-htable"+formId).css("width",datagridHeaderWidth-20+'px');
          $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth-20+'px');
        }else{
          $("#datagrid-htable"+formId).css("width",datagridHeaderWidth+'px');
          $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth+'px');    
        }
        *
        */
    }

    
    /*function alertInfo(msg){
        utilsFp.alert(msg);
    }*/
    
    <%--清空全选 --%>
    function clearAllSelect(){
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
     function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	checkboxAll("joblist");
}
    
    <%--子列表 --%>
    function listChildAjaxTable(formId,paramList){
        var data = {
            "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
            "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
            "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
            "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
            "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
            "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
        };
        if(isPage(formId)){
            data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
            data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        if(paramList != null && paramList != ""){
            data["paramList"] = paramList;
        }
        var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}";
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:data,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(isPage(formId)){
                        initPage(page,formId);    
                    }
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", "后台操作出错!","","260","145");
            }
        });
    }
    <%-- 数据为空时设置横向滚动条 --%>
    function setCrossWiseScroll(formId,arrHtml){
        if(arrHtml.length==0){
            var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
            arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth+"px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'");
            $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
       }else{
            $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});    
       }
   }
    
    <%-- 初始化子分页 --%>
    function initChildPage(formId){
        var ajaxPage = new Object();
        ajaxPage.currentPage = 1;
        ajaxPage.pageRecord = 20;
        ajaxPage.totalRecord = 0;
        ajaxPage.totalPage = 1;
        ajaxPage.first = true;
        ajaxPage.last = true;
        pageFun(ajaxPage,formId);
    }
    
    
    <%-- 初始化分页插件 --%>
    function initPage(page,formId){
        var ajaxPage = new Object();
        ajaxPage.currentPage = parseInt(page.currentPage);
        ajaxPage.pageRecord = parseInt(page.pageRecord);
        ajaxPage.totalPage = parseInt(page.totalPage);
        ajaxPage.totalRecord = parseInt(page.totalRecord);
        ajaxPage.first = page.first;
        ajaxPage.last = page.last;
        pageFun(ajaxPage,formId);
    };
    
    <%-- 判断是否首次异步访问 --%>
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }
    
    <%-- 初始化子表单 --%>
    function getFormIdInitChildPage(){
        var tableCount = $("#tableCount").val();
        for ( var i = 2; i <= tableCount; i++) {
            var formId = $("#formId"+i).val();
            if(isPage(formId)){
               initChildPage(formId);
            }
        }
    }
    
    
    
    
    function init(){
    $("#allDeviceSelect").click(function(){
    			if($("#allDeviceSelect").attr("checked") == "checked"){
        			$("input[name='deviceSel']").attr("checked","checked");
        			$('#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox').parents("tr").addClass('datagrid-selected')
        			
    			}else{
        			$("input[name='deviceSel']").removeAttr("checked","checked");
        			$('#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox').parents("tr").removeClass('datagrid-selected')
        			
    			}
			});
			
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
    
        listAjaxTable($("#formId1").val());
        //createMyTable(itemGroupUrl);
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
     }

    $(function(){
    
        var colNo = $("#relColVals").val();
        var subRelColIds = $("#subRelColIds").val();
        var subFormIds = $("#subFormIds").val();
        if(subRelColIds!="null"){
            var formId1 = $("#formId1").val();
            $(".isParents tr").live("click",function(){
                var _this = $(this);
                var relColVals = "";
                var abbr = _this.attr("abbr");
                var arrColNo = colNo.split(",");
                $(arrColNo).each(function(i,v){
                    relColVals += $("tr[abbr='"+abbr+"']").find("input[name='"+v+"']").val()+",";
                });
                setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
            });
        };
    });
    
    function getRelColVal(arr,obj,colNo){
   	   if(colNo){
	       var arrColNo = colNo.split(",");
	   	   $(arrColNo).each(function(i,v){
		  	   if(v!="ID"){
		  	     arr.push("<input type='hidden' name='"+v+"' value='"+obj[v]+"' />");
		  	   }
	   	   });
   	   }
    }
</script>
<script>
var isFirstSetScroll=0;
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='67b046cee49343d98ec5214366ca5c7c'){<%--FM-保养计划信息--%>
     $('.scroll1').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showDevice('"+v.ID+"');\" abbr='"+v.ID+"' style='width:30px;cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
             arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ")
            arrHtml.push("<input type='hidden' id='planSn_"+v.ID+"' value='"+v['CDP_PLAN_SN']+"'></td>");
            arrHtml.push("<td colno='CDP_PLAN_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDP_PLAN_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CDP_PLAN_SN')+"' "+ms.tdEvent(formId, 'CDP_PLAN_SN')+">")
            arrHtml.push("<span colno='CDP_PLAN_SN' class='"+ms.uiClass(formId, 'CDP_PLAN_SN')+"' style='"+ms.uiStyle(formId, 'CDP_PLAN_SN')+"' "+ms.uiEvent(formId, 'CDP_PLAN_SN')+" title='"+ms.titleAttr(formId,'CDP_PLAN_SN','IS_TITLE_ATTR',v)+"' >"+v['CDP_PLAN_SN']+"</span>")
            arrHtml.push("<input type='hidden' id='planSn_"+v.ID+"' value='"+v['CDP_PLAN_SN']+"'></td>");
            arrHtml.push("<td colno='CDP_PLAN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CDP_PLAN_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CDP_PLAN_NAME')+"' "+ms.tdEvent(formId, 'CDP_PLAN_NAME')+">")
            arrHtml.push("<span colno='CDP_PLAN_NAME' class='"+ms.uiClass(formId, 'CDP_PLAN_NAME')+"' style='"+ms.uiStyle(formId, 'CDP_PLAN_NAME')+"' "+ms.uiEvent(formId, 'CDP_PLAN_NAME')+" title='"+ms.titleAttr(formId,'CDP_PLAN_NAME','IS_TITLE_ATTR',v)+"' >"+v['CDP_PLAN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDP_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CDP_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CDP_TYPE')+"' "+ms.tdEvent(formId, 'CDP_TYPE')+">")
            arrHtml.push("<span colno='CDP_TYPE' class='"+ms.uiClass(formId, 'CDP_TYPE')+"' style='"+ms.uiStyle(formId, 'CDP_TYPE')+"' "+ms.uiEvent(formId, 'CDP_TYPE')+" title='"+ms.titleAttr(formId,'CDP_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CDP_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDP_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'CDP_CYCLE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CDP_CYCLE')+"' "+ms.tdEvent(formId, 'CDP_CYCLE')+">")
            arrHtml.push("<span colno='CDP_CYCLE' class='"+ms.uiClass(formId, 'CDP_CYCLE')+"' style='"+ms.uiStyle(formId, 'CDP_CYCLE')+"' "+ms.uiEvent(formId, 'CDP_CYCLE')+" title='"+ms.titleAttr(formId,'CDP_CYCLE','IS_TITLE_ATTR',v)+"' >"+v['CDP_CYCLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDP_SPACE' class='datagrid-cell "+ms.tdClass(formId, 'CDP_SPACE')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CDP_SPACE')+"' "+ms.tdEvent(formId, 'CDP_SPACE')+">")
            arrHtml.push("<span colno='CDP_SPACE' class='"+ms.uiClass(formId, 'CDP_SPACE')+"' style='"+ms.uiStyle(formId, 'CDP_SPACE')+"' "+ms.uiEvent(formId, 'CDP_SPACE')+" title='"+ms.titleAttr(formId,'CDP_SPACE','IS_TITLE_ATTR',v)+"' >"+v['CDP_SPACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDP_PRODUCT_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'CDP_PRODUCT_TIMES')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CDP_PRODUCT_TIMES')+"' "+ms.tdEvent(formId, 'CDP_PRODUCT_TIMES')+">")
            arrHtml.push("<span colno='CDP_PRODUCT_TIMES' class='"+ms.uiClass(formId, 'CDP_PRODUCT_TIMES')+"' style='"+ms.uiStyle(formId, 'CDP_PRODUCT_TIMES')+"' "+ms.uiEvent(formId, 'CDP_PRODUCT_TIMES')+" title='"+ms.titleAttr(formId,'CDP_PRODUCT_TIMES','IS_TITLE_ATTR',v)+"' >"+v['CDP_PRODUCT_TIMES']+"</span>")
            arrHtml.push("</td>");
            if(i==0){
		arrHtml.push("<input type='hidden' id='firstPlanSn' value='"+v['CDP_PLAN_SN']+"' />");
		arrHtml.push("<input type='hidden' id='firstId' value='"+v['ID']+"' />");
		$("#myleftId").val(v['ID']);
	    }
	    arrHtml.push("</tr>");
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setPopScroll('.scroll1','.head1');
     if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
    getFirstDevice();
}
//加载查询出来的第一个保养计划里面的设备
function getFirstDevice(){
var formId = $("#formId1").val();
var getDeviceUrl="${path}buss/bussModel_exeFunc.ms?funcMId=fd0ef2b723104d31a0390c80af6fe0f6";

//加载第一个保养计划里面的设备
 var paginationImpl = {};
    util.showLoading("处理中...");
 var firstId = $("#firstId").val();
    //var pcount = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord * (_GLO_FORM_PAGE_MAP[paginationImpl].currentPage -1 );
    var pcount = 0;
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getDeviceUrl,
			    data:{
			        "formId":formId,
                     "dataId":firstId
			    },
			    //data: "",
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxPage.dataList);
						$("#addLoadDevice").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
							    if(rccList[i].CA_NAME==null) rccList[i].CA_NAME="";
							    if(rccList[i].CDII_CYCLE==null) rccList[i].CDII_CYCLE="";
								$("#addLoadDevice").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(pcount+i+1)+"</td>");
								//$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px; text-align:center;'><input type='checkbox' name='deviceSel' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='120px;'><span onclick='itemJump1(\""+rccList[i].CDPI_DEVICE_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;' >"+rccList[i].CDPI_DEVICE_SN+"</span></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;'>"+rccList[i].CDII_ITEM_NAME+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;'>"+rccList[i].CD_DEVICE_NAME+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;'>"+rccList[i].CA_NAME+"</td>");
							
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;'>"+rccList[i].DEVICE_TYPE+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;'>"+rccList[i].DEVICE_CLASS+"</td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;display:none;'><input type='hidden' id='myPlanSn' name='myPlanSn' value='"+rccList[i].CDP_PLAN_SN+"'></td>");
								$("#addLoadDevice tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;display:none;'><input type='hidden' id='mydataAuth' name='mydataAuth' value='"+rccList[i].DATA_AUTH+"'></td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function newScroll(item){
	$(item).mCustomScrollbar({
		axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
			
	  });
}

function initHeight(){
    	$(".block1 .datagrid-header").width($('.block1').width());
	
	    $('.block1 .datagrid-htable').width(($(window).width() - 2) * 0.4);
		
     	$('.block1 .datagrid-btable').width(($(window).width() - 2) * 0.4);    	
     
     	$(".block1 .datagrid-body1").height($('.datagrid-view-ajax').height() - 32 );
     	
     	$('.block2').height($(window).height()- 213);//220
     	
     	$(".block2 .datagrid-header").width($('.block2').width());
     	
     //	$('.block2 #datagrid-view').height($(window).height() - 230);
}

$(function(){
	initHeight()
})

$(window).resize(function(){
        initHeight()     		 
});

function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//设备建档
function itemJump1(obj){
      winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
}  


</script>
<script>(function($){
  $(window).on('load',function(){

    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>