<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="生产实时信息" />
    </title>
    <style>
    		.datagrid-body1 tbody td,.datagrid-body2 tbody td{
    			border-width: 0 1px 1px 0;
    			border-style: solid;
    			border-color: #dbe1ef;
    			height: 28px;
    			margin: 0;
    		}
    		
    		#block1 .datagrid-header,#block2 .datagrid-header{
    			width:100% !important;
    		}
    		
    		#block1 .datagrid-htable,#block2 .datagrid-htable{
    			width:100% !important;
    		}
    		
    		#block1 .datagrid-btable,#block2 .datagrid-btable{
    			width:100% !important;
    		}
    		.numWidth{
    		    width:60px;
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
		<bu:header formId ="ba0b1e72aae14ee38a2c1272e136dcd5"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="ebdd073fb6594794bf2334aa9e4ecec9" />
            </div>
            <div class="bd" id="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="ebdd073fb6594794bf2334aa9e4ecec9" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageba0b1e72aae14ee38a2c1272e136dcd5" id="formPageba0b1e72aae14ee38a2c1272e136dcd5" value="${formPageba0b1e72aae14ee38a2c1272e136dcd5}"/>
		<input type="hidden" name="formId" id="formId1" value='ba0b1e72aae14ee38a2c1272e136dcd5'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="ba0b1e72aae14ee38a2c1272e136dcd5">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxba0b1e72aae14ee38a2c1272e136dcd5" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerba0b1e72aae14ee38a2c1272e136dcd5">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableba0b1e72aae14ee38a2c1272e136dcd5"  >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ba0b1e72aae14ee38a2c1272e136dcd5" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ba0b1e72aae14ee38a2c1272e136dcd5" onclick="_selectAjaxTableAllData(this,'ba0b1e72aae14ee38a2c1272e136dcd5')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PM_MO_NUMBER" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PM_PROJECT_ID" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T2#DESTROY_NO" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PM_MODEL_CODE" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PRODUCT_NAME" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PRODUCT_STANDARD" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="PRODUCT_COUNT" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PM_PROCESS_FACE" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PM_AREA_SN" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="PM_TARGET_QTY" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="PM_INPUT_COUNT" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="PM_FINISH_COUNT" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="PM_SCRAP_QTY" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="PRODUCT_OPENTIME" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="PM_START_DATE" formId="ba0b1e72aae14ee38a2c1272e136dcd5" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivba0b1e72aae14ee38a2c1272e136dcd5" onscroll="ajaxTableScroll(this,'ba0b1e72aae14ee38a2c1272e136dcd5')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxba0b1e72aae14ee38a2c1272e136dcd5" >
		<tbody id="tbody_ba0b1e72aae14ee38a2c1272e136dcd5" class="">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageba0b1e72aae14ee38a2c1272e136dcd5==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchMoNumber&formId=ba0b1e72aae14ee38a2c1272e136dcd5&showLoading=0" />
			</div>
		</c:if>
		
		
		<div id="block1" style="float:left;width:49%;margin-top:10px;">
		<div class="panel-ajax datagrid datagrid-div1"  style="overflow-y:auto;overflow-x:auto;">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="">
		<table class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="groupStatistic1" style="min-width:800px;">
		<tbody class="isChildsTitle">
		<tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ></td>
			<td class="datagrid-cell" style="width:150px;text-align:center;" ><dict:lang value="制令单号" /></td>
			<td class="datagrid-cell" style="width:100px;text-align:center;" ><dict:lang value="工序" /></td>
			<td class="datagrid-cell" style="width:70px;text-align:center;" ><dict:lang value="过站数量" /></td>
			<td class="datagrid-cell" style="width:100px;text-align:center;" ><dict:lang value="二次过站数量" /></td>
			<td class="datagrid-cell" style="width:70px;text-align:center;" ><dict:lang value="WIP数量" /></td>
			<td class="datagrid-cell" style="width:100px;text-align:center;" ><dict:lang value="一次不良数量" /></td>
			<td class="datagrid-cell" style="width:100px;text-align:center;" ><dict:lang value="二次不良数量" /></td>
			<td class="datagrid-cell" style="text-align:center;" ><dict:lang value="报废数量" /></td>
		</tr>
		</tbody>
		</table>
		</div>
		</div>
		<div class="datagrid-body1 datagrid-div3 datagrid-body-ajax" id="groupStatisticDiv">
		<table class="datagrid-btable fixedTable dblClick"  id="groupStatistic" style="min-width:800px;">
		<tbody id="addGroupStatistic" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=formId2&showLoading=0" />
		</div>
		</div>
		
		
		<div id="block2" style="float:right;width:49%;margin-top:10px;">
		<div class="panel-ajax datagrid datagrid-div1"  style="overflow-y:auto;">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="">
		<table class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="tracking1" style="min-width:940px;">
		<tbody class="isChildsTitle">
		<tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax1">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="产品序列号" /></td>
			<td class="datagrid-cell" style="width:70px;text-align:center;" ><dict:lang value="状态" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="线别" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center;" ><dict:lang value="数量" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center;" ><dict:lang value="不良数量" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center;" ><dict:lang value="报废数量" /></td>
			<td class="datagrid-cell" style="width:70px;text-align:center;" ><dict:lang value="生产批次" /></td>
			<td class="datagrid-cell" style="width:80px;text-align:center;" ><dict:lang value="作业员" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;" ><dict:lang value="过站时间" /></td>
		    <td class="datagrid-cell" style="text-align:center;" ><dict:lang value="流程结束标志" /></td>
			
		</tr>
		</tbody>
		</table>
		</div>
		</div>
		<div class="datagrid-body2 datagrid-div3 datagrid-body-ajax" id="trackingDiv" style="height:calc(100% - 32px);">
		<table class="datagrid-btable fixedTable dblClick"  id="tracking" style="min-width:940px;">
		<tbody id="addTracking" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listTracking&formId=formId3&showLoading=0" />
		</div>
		</div>
		
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="ebdd073fb6594794bf2334aa9e4ecec9" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="ebdd073fb6594794bf2334aa9e4ecec9" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
   
<script type="text/javascript">
//根据制令单获取所对应的工序生产统计数据
//var getGroupStatistic="${path}buss/bussModel_exeFunc.ms?funcMId=465ff1311ea04bc8863b9b6d4f1fc7b7&formId=%{formId}";
var getGroupStatistic="${path}buss/bussModel_exeFunc.ms?funcMId=7a8f7f1ebc7e45a49d9b9a4962c657ad&formId=%{formId}";
var dataAuth =$("#DATA_AUTH").val();
function showGroupStatistic(moNumber,dataId){
console.log(moNumber+"..."+dataId);
var dataAuthVal=$("#auth_"+dataId).val();
console.log("moNumber+"+moNumber+",dataAuthVal="+dataAuthVal);
util.showLoading("处理中...");
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getGroupStatistic,
			    data: {"moNumber":moNumber,"dataAuth":dataAuthVal},
				success: function(data){
						util.closeLoading();
						console.log(data.ajaxList);
						$("#addGroupStatistic").empty();
						//if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var j=0;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].MGS_MO_NUMBER==null) rccList[i].MGS_MO_NUMBER="";
								if(rccList[i].GROUP_NAME==null) rccList[i].GROUP_NAME="";
								if(rccList[i].PASSNUM==null) rccList[i].PASSNUM="0";
								if(rccList[i].MGS_T_OK_PCS==null) rccList[i].MGS_T_OK_PCS="0";
								if(rccList[i].WIP_NUM==null) rccList[i].WIP_NUM="0";
								if(rccList[i].MGS_NG_PCS==null) rccList[i].MGS_NG_PCS="0";
								if(rccList[i].MGS_T_NG_PCS==null) rccList[i].MGS_T_NG_PCS="0";
								if(rccList[i].MGS_SCRAP_QTY==null) rccList[i].MGS_SCRAP_QTY="0";
								if(rccList[i].RW_FLAG!="Y"){
								$("#addGroupStatistic").append("<tr id='"+(i+1)+"' name='"+(i+1)+"' onclick=\"showTracking('"+(i+1)+"','"+dataAuthVal+"');\" ></tr>"); 
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(j+1)+"</td>");  
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;' title='"+rccList[i].MGS_MO_NUMBER+"'>"+rccList[i].MGS_MO_NUMBER+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].GROUP_NAME+"'>"+rccList[i].GROUP_NAME+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].PASSNUM+"'>"+rccList[i].PASSNUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_OK_PCS+"'>"+rccList[i].MGS_T_OK_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WIP_NUM+"'>"+rccList[i].WIP_NUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align:right;' title='"+rccList[i].MGS_NG_PCS+"'>"+rccList[i].MGS_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_NG_PCS+"'>"+rccList[i].MGS_T_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align:right;'  title='"+rccList[i].MGS_SCRAP_QTY+"'>"+rccList[i].MGS_SCRAP_QTY+"</td>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_"+(i+1)+"' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								j++;
								}
							}
                              var j=0;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].MGS_MO_NUMBER==null) rccList[i].MGS_MO_NUMBER="";
								if(rccList[i].GROUP_NAME==null) rccList[i].GROUP_NAME="";
								if(rccList[i].PASSNUM==null) rccList[i].PASSNUM="0";
								if(rccList[i].MGS_T_OK_PCS==null) rccList[i].MGS_T_OK_PCS="0";
								if(rccList[i].WIP_NUM==null) rccList[i].WIP_NUM="0";
								if(rccList[i].MGS_NG_PCS==null) rccList[i].MGS_NG_PCS="0";
								if(rccList[i].MGS_T_NG_PCS==null) rccList[i].MGS_T_NG_PCS="0";
								if(rccList[i].MGS_SCRAP_QTY==null) rccList[i].MGS_SCRAP_QTY="0";
								if(rccList[i].RW_FLAG=="Y"){
								$("#addGroupStatistic").append("<tr id='"+(i+1)+"' name='"+(i+1)+"' onclick=\"showTracking('"+(i+1)+"','"+dataAuthVal+"');\" ></tr>"); 
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;background-color:red;'>"+"返工"+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;' title='"+rccList[i].MGS_MO_NUMBER+"'>"+rccList[i].MGS_MO_NUMBER+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].GROUP_NAME+"'>"+rccList[i].GROUP_NAME+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].PASSNUM+"'>"+rccList[i].PASSNUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_OK_PCS+"'>"+rccList[i].MGS_T_OK_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WIP_NUM+"'>"+rccList[i].WIP_NUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align:right;' title='"+rccList[i].MGS_NG_PCS+"'>"+rccList[i].MGS_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_NG_PCS+"'>"+rccList[i].MGS_T_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align:right;'  title='"+rccList[i].MGS_SCRAP_QTY+"'>"+rccList[i].MGS_SCRAP_QTY+"</td>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_"+(i+1)+"' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								j++;
								}
							}
							
						}


								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");	
					
						//pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#addGroupStatistic tr");
							_tongLineColor(tableTrJs);
						//newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						alert(1);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//根据制令单，工序，工序顺序获取产品在制信息
var getTracking="${path}buss/bussModel_exeFunc.ms?funcMId=c2263b2614144692b1226b1177e0ba49&formId=%{formId}";
function showTracking(msgId,dataAuth){
$('#groupStatisticDiv tr').eq(msgId - 1).css('background-color','#d3eafc').siblings().css('background-color','');
//setPopScroll('#block2 .datagrid-body2','#block2 .datagrid-header-inner')
$('#block2 .datagrid-body2').mCustomScrollbar("destroy");
var moNumber = $("#moNumber_"+msgId).val();
var groupCode = $("#groupCode_"+msgId).val();
var groupSeq = $("#groupSeq_"+msgId).val();
console.log(moNumber+","+groupCode+","+groupSeq);
util.showLoading("处理中...");
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getTracking,
			    data: {"moNumber":moNumber,"groupCode":groupCode,"groupSeq":groupSeq,"dataAuth":dataAuth},
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxPage.dataList);
						$("#addTracking").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempState;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].WT_LOT==null) rccList[i].WT_LOT="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].WT_ERROR_FLAG!=null){
									if(rccList[i].WT_ERROR_FLAG==0)	   tempState = "<span><span class='state' style='background-color:#4e9d0f;color:#ffffff;width:45px'>正常</span></span>";
									if(rccList[i].WT_ERROR_FLAG==1)	   tempState = "<span><span class='state' style='background-color:#e35850;color:#ffffff;width:45px'>不良</span></span>";
									if(rccList[i].WT_ERROR_FLAG==2)	   tempState = "<span><span class='state' style='background-color:#fdab36;color:#ffffff;width:45px'>维修</span></span>";
									if(rccList[i].WT_ERROR_FLAG==3)	   tempState = "<span><span class='state' style='background-color:#aeaeae;color:#ffffff;width:45px'>报废</span></span>";
								}else tempState = "";
								var inTime=(rccList[i].WT_IN_TIME).replace("T"," ");
								$("#addTracking").append("<tr id='"+(i+1)+"' name='"+(i+1)+"' ></tr>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(i+1)+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:100px;' title='"+rccList[i].WT_SN+"'><span onclick='itemJump4(\""+rccList[i].WT_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WT_SN+"</span></td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align:center;'>"+tempState+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].WT_AREA_SN+"'>"+rccList[i].WT_AREA_SN+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].WT_NUM+"'>"+rccList[i].WT_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align:right;' title='"+rccList[i].WT_NG_NUM+"'>"+rccList[i].WT_NG_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WT_SCRAP_NUM+"'>"+rccList[i].WT_SCRAP_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align:center;' title='"+rccList[i].WT_LOT+"'>"+rccList[i].WT_LOT+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:80px;text-align:center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:140px;text-align:center;' title='"+inTime+"'>"+inTime+"</td>");
								if(rccList[i].WT_FINISH_FLAG=="Y"){
$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align:center;'><span><img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'></span></td>");
}else{
$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align:center;'><span><img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'></span></td>");
}
								
								
							}
							$("#addTracking tr:last").append("<input type='hidden' id='myMoNumber' name='myMoNumber' value='"+rccList[0].WT_MO_NUMBER+"'>");
							$("#addTracking tr:last").append("<input type='hidden' id='myGroupCode' name='myGroupCode' value='"+rccList[0].WT_GROUP_CODE+"'>");
							$("#addTracking tr:last").append("<input type='hidden' id='myGroupSeq' name='myGroupSeq' value='"+rccList[0].WT_GROUP_SEQ+"'>");
							
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#addTracking tr");
							_tongLineColor(tableTrJs);
						setPopScroll('#block2 .datagrid-body2','#block2 .datagrid-header-inner');
						$('#block2 .datagrid-header-inner').scrollLeft(0)
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//在制产品信息分页
var paginationImpl = {};
function ListTracking(paginationImpl,url){
var myMoNumber = $("#myMoNumber").val();
var myGroupCode = $("#myGroupCode").val();
var myGroupSeq = $("#myGroupSeq").val();
var dataAuth = $("#DATA_AUTH").val();
$('#block2 .datagrid-body2').mCustomScrollbar("destroy");
var isFirstLoad = firstLoadThisPage(paginationImpl);
    			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    			
    			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	util.showLoading("处理中...");
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
			    data: {"paraMap.myMoNumber":myMoNumber,"paraMap.myGroupCode":myGroupCode,"paraMap.myGroupSeq":myGroupSeq,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,"dataAuth":dataAuth},
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxPage.dataList);
						$("#addTracking").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempState;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].WT_LOT==null) rccList[i].WT_LOT="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].WT_ERROR_FLAG!=null){
									if(rccList[i].WT_ERROR_FLAG==0)	   tempState = "<span><span class='state' style='background-color:#4e9d0f;color:#ffffff;width:45px'>正常</span></span>";
									if(rccList[i].WT_ERROR_FLAG==1)	   tempState = "<span><span class='state' style='background-color:#e35850;color:#ffffff;width:45px'>不良</span></span>";
									if(rccList[i].WT_ERROR_FLAG==2)	   tempState = "<span><span class='state' style='background-color:#fdab36;color:#ffffff;width:45px'>维修</span></span>";
									if(rccList[i].WT_ERROR_FLAG==3)	   tempState = "<span><span class='state' style='background-color:#aeaeae;color:#ffffff;width:45px'>报废</span></span>";
								}else tempState = "";
								var inTime=(rccList[i].WT_IN_TIME).replace("T"," ");
								$("#addTracking").append("<tr id='"+((currentPage-1)*pageRecord+(i+1))+"' name='"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:100px;' title='"+rccList[i].WT_SN+"'><span onclick='itemJump4(\""+rccList[i].WT_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WT_SN+"</span></td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align:center;'>"+tempState+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].WT_AREA_SN+"'>"+rccList[i].WT_AREA_SN+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].WT_NUM+"'>"+rccList[i].WT_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align:right;' title='"+rccList[i].WT_NG_NUM+"'>"+rccList[i].WT_NG_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WT_SCRAP_NUM+"'>"+rccList[i].WT_SCRAP_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align:center;' title='"+rccList[i].WT_LOT+"'>"+rccList[i].WT_LOT+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:80px;text-align:center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:140px;text-align:center;' title='"+inTime+"'>"+inTime+"</td>");
								if(rccList[i].WT_FINISH_FLAG=="Y"){
$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align:center;'><span><img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'></span></td>");
}else{
$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align:center;'><span><img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'></span></td>");
}
								
							}
							$("#addTracking tr:last").append("<input type='hidden' id='myMoNumber' name='myMoNumber' value='"+rccList[0].WT_MO_NUMBER+"'>");
							$("#addTracking tr:last").append("<input type='hidden' id='myGroupCode' name='myGroupCode' value='"+rccList[0].WT_GROUP_CODE+"'>");
							$("#addTracking tr:last").append("<input type='hidden' id='myGroupSeq' name='myGroupSeq' value='"+rccList[0].WT_GROUP_SEQ+"'>");
							
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#addTracking tr");
							_tongLineColor(tableTrJs);
							setPopScroll('#block2 .datagrid-body2','#block2 .datagrid-header-inner');
							$('#block2 .datagrid-header-inner').scrollLeft(0)
						//newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//制令单查询分页
function SearchMoNumber(paginationImpl,url){
var beginTime = $("#PRODUCT_OPENTIME_BEGIN").val();
var endTime = $("#PRODUCT_OPENTIME_END").val();
var moNumber = $.trim($("#PM_MO_NUMBER_SHOW").val());
var projectId = $.trim($("#PM_PROJECT_ID_SHOW").val());
var modelCode = $.trim($("#PM_MODEL_CODE_SHOW").val());
var destroyNo =  $.trim($(document.getElementById('T2#DESTROY_NO')).val());
var status = $("#PM_STATUS").val();
var formId = $("#formId1").val();
var dataAuth = $("#DATA_AUTH").val();
	util.showLoading("处理中...");
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
			    data: {"paraMap.destroyNo":destroyNo,"paraMap.moNumber":moNumber,"paraMap.projectId":projectId,"paraMap.modelCode":modelCode,"paraMap.status":status,"paraMap.beginTime":beginTime,"paraMap.endTime":endTime,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,"dataAuth":dataAuth},
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxPage.dataList);
						$("#tbody_ba0b1e72aae14ee38a2c1272e136dcd5").empty();
						$("#addTracking").empty();
						$("#addGroupStatistic").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							//var tempState;	
							var rccList = eval(data.ajaxPage.dataList);
							console.log(rccList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].PM_MO_NUMBER==null) rccList[i].PM_MO_NUMBER = "";
								if(rccList[i].PM_PROJECT_ID==null) rccList[i].PM_PROJECT_ID= "";
								if(rccList[i].PM_MODEL_CODE==null) rccList[i].PM_MODEL_CODE= "";
								if(rccList[i].PRODUCT_NAME==null) rccList[i].PRODUCT_NAME= "";
								if(rccList[i].PRODUCT_STANDARD==null) rccList[i].PRODUCT_STANDARD= "";
								if(rccList[i].PRODUCT_COUNT==null) rccList[i].PRODUCT_COUNT= "";
								if(rccList[i].FACE_NAME==null) rccList[i].FACE_NAME= "";
								if(rccList[i].PM_AREA_SN==null) rccList[i].PM_AREA_SN= "";
								if(rccList[i].PM_TARGET_QTY==null) rccList[i].PM_TARGET_QTY= "";
								if(rccList[i].PM_FINISH_COUNT==null) rccList[i].PM_FINISH_COUNT= "";
								if(rccList[i].PRODUCT_OPENTIME==null) rccList[i].PRODUCT_OPENTIME= "";
								if(rccList[i].START_DATE==null) rccList[i].START_DATE= "";
								if(rccList[i].PM_INPUT_COUNT==null) rccList[i].PM_INPUT_COUNT= "";
								if(rccList[i].DESTROY_NO==null) rccList[i].DESTROY_NO= "";
								if(rccList[i].PM_SCRAP_QTY==null) rccList[i].PM_SCRAP_QTY= "";
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
								var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].DATA_ID+"' onclick=\"showGroupStatistic('"+rccList[i].PM_MO_NUMBER+"','"+rccList[i].DATA_ID+"');\" abbr='"+rccList[i].DATA_ID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].DATA_ID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+rccList[i].ROWNUM+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>"
			 					+"<td colno='DATA_AUTH' class='datagrid-cell' style='width:200px;text-align:center;' >"
			 					+"<span colno='DATA_AUTH' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</span><input type='hidden' id='auth_"+rccList[i].DATA_ID+"' value='"+rccList[i].ID+"'/>"
			 					+"</td>"
			 				    //+ "<td  class='datagrid-cell TD_DATA_AUTH' style='width:200px;text-align:center;'>"
                                //+ "<span  class='datagrid-cell ' title='"+rccList[i].DATA_AUTH2+"'>"+rccList[i].DATA_AUTH2+"</span>"
                                + "<input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"' /></td>" 
			 					+"<td colno='PM_MO_NUMBER' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_MO_NUMBER' title='"+rccList[i].PM_MO_NUMBER+"'>"+rccList[i].PM_MO_NUMBER+"</span>"
			 					+"</td>"
			 					+"<td colno='PM_PROJECT_ID' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_PROJECT_ID' title='"+rccList[i].PM_PROJECT_ID+"'>"+rccList[i].PM_PROJECT_ID+"</span>"
			 					+"</td>"
			 					+"<td colno='DESTROY_NO' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='DESTROY_NO' title='"+rccList[i].DESTROY_NO+"'>"+rccList[i].DESTROY_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='PM_MODEL_CODE' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_MODEL_CODE' title='"+rccList[i].PM_MODEL_CODE+"'>"+rccList[i].PM_MODEL_CODE+"</span>"
			 					+"</td>"
								+"<td colno='PRODUCT_NAME' class='datagrid-cell' style='width:120px;'  >"
			 					+"<span colno='PRODUCT_NAME' title='"+rccList[i].PRODUCT_NAME+"'>"+rccList[i].PRODUCT_NAME+"</span>"
			 					+"</td>"
								+"<td colno='PRODUCT_STANDARD' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PRODUCT_STANDARD' title='"+rccList[i].PRODUCT_STANDARD+"'>"+rccList[i].PRODUCT_STANDARD+"</span>"
			 					+"</td>"
								+"<td colno='PRODUCT_COUNT' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PRODUCT_COUNT' title='"+rccList[i].PRODUCT_COUNT+"'>"+rccList[i].PRODUCT_COUNT+"</span>"
			 					+"</td>"
								+"<td colno='PM_PROCESS_FACE' class='datagrid-cell' style='width:120px;text-align:center;'>"
			 					+"<span colno='PM_PROCESS_FACE' title='"+rccList[i].FACE_NAME+"'>"+rccList[i].FACE_NAME+"</span>"
			 					+"</td>"
								+"<td colno='PM_AREA_SN' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_AREA_SN' title='"+rccList[i].PM_AREA_SN+"'>"+rccList[i].PM_AREA_SN+"</span>"
			 					+"</td>"
								+"<td colno='PM_TARGET_QTY' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PM_TARGET_QTY' title='"+rccList[i].PM_TARGET_QTY+"'>"+rccList[i].PM_TARGET_QTY+"</span>"
			 					+"</td>"
			 					+"<td colno='PM_INPUT_COUNT' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PM_INPUT_COUNT' title='"+rccList[i].PM_INPUT_COUNT+"'>"+rccList[i].PM_INPUT_COUNT+"</span>"
			 					+"</td>"
								+"<td colno='PM_FINISH_COUNT' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PM_FINISH_COUNT' title='"+rccList[i].PM_FINISH_COUNT+"'>"+rccList[i].PM_FINISH_COUNT+"</span>"
			 					+"</td>"
								+"<td colno='PM_SCRAP_QTY' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PM_SCRAP_QTY' title='"+rccList[i].PM_SCRAP_QTY+"'>"+rccList[i].PM_SCRAP_QTY+"</span>"
			 					+"</td>"			 					
								+"<td colno='PRODUCT_OPENTIME' class='datagrid-cell' style='width:140px;text-align:center;'>"
			 					+"<span colno='PRODUCT_OPENTIME' title='"+rccList[i].PRODUCT_OPENTIME+"'>"+rccList[i].PRODUCT_OPENTIME+"</span>"
			 					+"</td>"
								+"<td colno='PM_START_DATE' class='datagrid-cell' style='width:140px;text-align:center;'>"
			 					+"<span colno='PM_START_DATE' title='"+rccList[i].START_DATE+"'>"+rccList[i].START_DATE+"</span>"
			 					+"</td>";
								if(i==0){
			 					trHtml = trHtml + "<input type='hidden' id='firstGroupStatistic' value='"+rccList[i].PM_MO_NUMBER+"' />";
			 					}
								$("#tbody_ba0b1e72aae14ee38a2c1272e136dcd5").append(trHtml);	
							}
							setNumColWidth("ba0b1e72aae14ee38a2c1272e136dcd5");
						}
						pageFun(data.ajaxPage,"ba0b1e72aae14ee38a2c1272e136dcd5");
						//if(null != data){
						getfirstGroupStatistic();
						//}	
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//混合查询
function FindAllInfo(paginationImpl,url){
var beginTime = $("#PRODUCT_OPENTIME_BEGIN").val();
var endTime = $("#PRODUCT_OPENTIME_END").val();
var moNumber = $.trim($("#PM_MO_NUMBER_SHOW").val());
var projectId = $.trim($("#PM_PROJECT_ID_SHOW").val());
var modelCode = $.trim($("#PM_MODEL_CODE_SHOW").val());
var status = $("#PM_STATUS").val();
var dataAuth = $("#DATA_AUTH").val();
var productSeq = $.trim($("#PRODUCT_SEQ").val());
	var destroyNo =  $.trim($(document.getElementById('T2#DESTROY_NO')).val());

var formId = $("#formId1").val();
	util.showLoading("处理中...");
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
			    data: {"dataAuth":dataAuth,"paraMap.destroyNo":destroyNo,"paraMap.moNumber":moNumber,"paraMap.projectId":projectId,"paraMap.modelCode":modelCode,"paraMap.status":status,"paraMap.beginTime":beginTime,"paraMap.endTime":endTime,"paraMap.productSeq":productSeq,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord},
				success: function(data){
				        	
						util.closeLoading();
						//console.log(data.ajaxPage.dataList);
						$("#tbody_ba0b1e72aae14ee38a2c1272e136dcd5").empty();
						$("#addTracking").empty();
						$("#addGroupStatistic").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							//var tempState;	
							var rccList = eval(data.ajaxPage.dataList);
							console.log(rccList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].PM_MO_NUMBER==null) rccList[i].PM_MO_NUMBER = "";
								if(rccList[i].PM_PROJECT_ID==null) rccList[i].PM_PROJECT_ID= "";
								if(rccList[i].PM_MODEL_CODE==null) rccList[i].PM_MODEL_CODE= "";
								if(rccList[i].PRODUCT_NAME==null) rccList[i].PRODUCT_NAME= "";
								if(rccList[i].PRODUCT_STANDARD==null) rccList[i].PRODUCT_STANDARD= "";
								if(rccList[i].PRODUCT_COUNT==null) rccList[i].PRODUCT_COUNT= "";
								if(rccList[i].FACE_NAME==null) rccList[i].FACE_NAME= "";
								if(rccList[i].PM_AREA_SN==null) rccList[i].PM_AREA_SN= "";
								if(rccList[i].PM_TARGET_QTY==null) rccList[i].PM_TARGET_QTY= "";
								if(rccList[i].PM_FINISH_COUNT==null) rccList[i].PM_FINISH_COUNT= "";
								if(rccList[i].PRODUCT_OPENTIME==null) rccList[i].PRODUCT_OPENTIME= "";
								if(rccList[i].START_DATE==null) rccList[i].START_DATE= "";
								if(rccList[i].DESTROY_NO==null) rccList[i].DESTROY_NO= "";
								if(rccList[i].PM_SCRAP_QTY==null) rccList[i].PM_SCRAP_QTY= "";
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
								var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].DATA_ID+"' onclick=\"showGroupStatistic('"+rccList[i].PM_MO_NUMBER+"','"+rccList[i].DATA_ID+"');\" abbr='"+rccList[i].DATA_ID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].DATA_ID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+rccList[i].ROWNUM+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>"
			 					+"<td colno='DATA_AUTH' class='datagrid-cell' style='width:200px;text-align:center;' >"
			 					+"<span colno='DATA_AUTH' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</span><input type='hidden' id='auth_"+rccList[i].DATA_ID+"' value='"+rccList[i].ID+"'/>"
			 					+"</td>"
			 				//	+ "<td  class='datagrid-cell TD_DATA_AUTH' style='width:200px;text-align:center;'>"
                               // + "<span  class='datagrid-cell ' title='"+rccList[i].DATA_AUTH2+"'>"+rccList[i].DATA_AUTH2+"</span>"
                                + "<input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"' /></td>" 
			 					+"<td colno='PM_MO_NUMBER' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_MO_NUMBER' title='"+rccList[i].PM_MO_NUMBER+"'>"+rccList[i].PM_MO_NUMBER+"</span>"
			 					+"</td>"
			 					+"<td colno='PM_PROJECT_ID' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_PROJECT_ID' title='"+rccList[i].PM_PROJECT_ID+"'>"+rccList[i].PM_PROJECT_ID+"</span>"
			 					+"</td>"
			 					+"<td colno='DESTROY_NO' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='DESTROY_NO' title='"+rccList[i].DESTROY_NO+"'>"+rccList[i].DESTROY_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='PM_MODEL_CODE' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_MODEL_CODE' title='"+rccList[i].PM_MODEL_CODE+"'>"+rccList[i].PM_MODEL_CODE+"</span>"
			 					+"</td>"
								+"<td colno='PRODUCT_NAME' class='datagrid-cell' style='width:120px;text-align:center;'>"
			 					+"<span colno='PRODUCT_NAME' title='"+rccList[i].PRODUCT_NAME+"'>"+rccList[i].PRODUCT_NAME+"</span>"
			 					+"</td>"
								+"<td colno='PRODUCT_STANDARD' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PRODUCT_STANDARD' title='"+rccList[i].PRODUCT_STANDARD+"'>"+rccList[i].PRODUCT_STANDARD+"</span>"
			 					+"</td>"
								+"<td colno='PRODUCT_COUNT' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PRODUCT_COUNT' title='"+rccList[i].PRODUCT_COUNT+"'>"+rccList[i].PRODUCT_COUNT+"</span>"
			 					+"</td>"
								+"<td colno='PM_PROCESS_FACE' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_PROCESS_FACE' title='"+rccList[i].FACE_NAME+"'>"+rccList[i].FACE_NAME+"</span>"
			 					+"</td>"
								+"<td colno='PM_AREA_SN' class='datagrid-cell' style='width:120px;' >"
			 					+"<span colno='PM_AREA_SN' title='"+rccList[i].PM_AREA_SN+"'>"+rccList[i].PM_AREA_SN+"</span>"
			 					+"</td>"
								+"<td colno='PM_TARGET_QTY' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PM_TARGET_QTY' title='"+rccList[i].PM_TARGET_QTY+"'>"+rccList[i].PM_TARGET_QTY+"</span>"
			 					+"</td>"
			 					+"<td colno='PM_INPUT_COUNT' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PM_INPUT_COUNT' title='"+rccList[i].PM_INPUT_COUNT+"'>"+rccList[i].PM_INPUT_COUNT+"</span>"
			 					+"</td>"
								+"<td colno='PM_FINISH_COUNT' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PM_FINISH_COUNT' title='"+rccList[i].PM_FINISH_COUNT+"'>"+rccList[i].PM_FINISH_COUNT+"</span>"
			 					+"</td>"
								+"<td colno='PM_SCRAP_QTY' class='datagrid-cell' style='width:80px;text-align:right;' >"
			 					+"<span colno='PM_SCRAP_QTY' title='"+rccList[i].PM_SCRAP_QTY+"'>"+rccList[i].PM_SCRAP_QTY+"</span>"
			 					+"</td>"			 					
								+"<td colno='PRODUCT_OPENTIME' class='datagrid-cell' style='width:140px;text-align:center;' >"
			 					+"<span colno='PRODUCT_OPENTIME' title='"+rccList[i].PRODUCT_OPENTIME+"'>"+rccList[i].PRODUCT_OPENTIME+"</span>"
			 					+"</td>"
								+"<td colno='PM_START_DATE' class='datagrid-cell' style='width:140px;text-align:center;' >"
			 					+"<span colno='PM_START_DATE' title='"+rccList[i].START_DATE+"'>"+rccList[i].START_DATE+"</span>"
			 					+"</td>";
								if(i==0){
			 					trHtml = trHtml + "<input type='hidden' id='findMoNumber' value='"+rccList[i].PM_MO_NUMBER+"' />";
								trHtml = trHtml + "<input type='hidden' id='findGroupCode' value='"+rccList[i].groupCode+"' />";
								trHtml = trHtml + "<input type='hidden' id='findGroupSeq' value='"+rccList[i].groupSeq+"' />";
			 					}
								$("#tbody_ba0b1e72aae14ee38a2c1272e136dcd5").append(trHtml);	
							}			
							setNumColWidth("ba0b1e72aae14ee38a2c1272e136dcd5");
						}
						pageFun(data.ajaxPage,"ba0b1e72aae14ee38a2c1272e136dcd5");
						//if(null != data.ajaxPage.dataList){
						getFindGroupStatistic();
						//}
							
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function getFindGroupStatistic(){
var findMoNumber = $("#findMoNumber").val();
var findGroupCode = $("#findGroupCode").val();
var findGroupSeq = $("#findGroupSeq").val();
util.showLoading("处理中...");
var getFindGroupStatisticUrl="${path}buss/bussModel_exeFunc.ms?funcMId=075ac01f9ed54929836374139d2ea70b&formId=%{formId}";
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getFindGroupStatisticUrl+"&findMoNumber="+findMoNumber+"&findGroupCode="+findGroupCode+"&findGroupSeq="+findGroupSeq,
			    data: "",
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxList);
						$("#addGroupStatistic").empty();
						//if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].MGS_MO_NUMBER==null) rccList[i].MGS_MO_NUMBER="";
								if(rccList[i].GROUP_NAME==null) rccList[i].GROUP_NAME="";
								if(rccList[i].PASSNUM==null) rccList[i].PASSNUM="0";
								if(rccList[i].MGS_T_OK_PCS==null) rccList[i].MGS_T_OK_PCS="0";
								if(rccList[i].WIP_NUM==null) rccList[i].WIP_NUM="0";
								if(rccList[i].MGS_NG_PCS==null) rccList[i].MGS_NG_PCS="0";
								if(rccList[i].MGS_T_NG_PCS==null) rccList[i].MGS_T_NG_PCS="0";
								if(rccList[i].MGS_SCRAP_QTY==null) rccList[i].MGS_SCRAP_QTY="0";
								$("#addGroupStatistic").append("<tr id='"+(i+1)+"' name='"+(i+1)+"' onclick=\"showTracking('"+(i+1)+"','"+dataAuth+"');\" ></tr>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(i+1)+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;' title='"+rccList[i].MGS_MO_NUMBER+"'>"+rccList[i].MGS_MO_NUMBER+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].GROUP_NAME+"'>"+rccList[i].GROUP_NAME+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].PASSNUM+"'>"+rccList[i].PASSNUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_OK_PCS+"'>"+rccList[i].MGS_T_OK_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WIP_NUM+"'>"+rccList[i].WIP_NUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align:right;' title='"+rccList[i].MGS_NG_PCS+"'>"+rccList[i].MGS_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_NG_PCS+"'>"+rccList[i].MGS_T_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align:right;' title='"+rccList[i].MGS_SCRAP_QTY+"'>"+rccList[i].MGS_SCRAP_QTY+"</td>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_"+(i+1)+"' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								if(i==0){
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstMoNumber' name='firstMoNumber' value='"+rccList[i].MGS_MO_NUMBER+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupCode' name='firstGroupCode' value='"+rccList[i].MGS_GROUP_CODE+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupSeq' name='firstGroupSeq' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								}
							}
							
						}

								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");	
					//	pageFun(data.ajaxPage,"formId2");
						//if(null != data){
						getFirstTracking();
						//}
						
							var tableTrJs = $("#addGroupStatistic tr");
							_tongLineColor(tableTrJs);
						//newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function getFirstTracking(){
//根据制令单，工序，工序顺序加载第一条产品在制信息
var firstMoNumber = $("#firstMoNumber").val();
var firstGroupCode = $("#firstGroupCode").val();
var firstGroupSeq = $("#firstGroupSeq").val();
var dataAuth  = $("#DATA_AUTH").val();
	util.showLoading("处理中...");
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getTracking,
			    data: {"moNumber":firstMoNumber,"groupCode":firstGroupCode,"groupSeq":firstGroupSeq,"dataAuth":dataAuth},
				success: function(data){
						util.closeLoading();
						//console.log(data.dataList);
						$("#addTracking").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempState;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].WT_LOT==null) rccList[i].WT_LOT="";
								if(rccList[i].WT_ERROR_FLAG!=null){
									if(rccList[i].WT_ERROR_FLAG==0)	   tempState = "<span><span class='state' style='background-color:#4e9d0f;color:#ffffff;width:45px'>正常</span></span>";
									if(rccList[i].WT_ERROR_FLAG==1)	   tempState = "<span><span class='state' style='background-color:#e35850;color:#ffffff;width:45px'>不良</span></span>";
									if(rccList[i].WT_ERROR_FLAG==2)	   tempState = "<span><span class='state' style='background-color:#fdab36;color:#ffffff;width:45px'>维修</span></span>";
									if(rccList[i].WT_ERROR_FLAG==3)	   tempState = "<span><span class='state' style='background-color:#aeaeae;color:#ffffff;width:45px'>报废</span></span>";
								}else tempState = "";
								var inTime=(rccList[i].WT_IN_TIME).replace("T"," ");
								$("#addTracking").append("<tr id='"+(i+1)+"' name='"+(i+1)+"'></tr>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(i+1)+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:100px;' title='"+rccList[i].WT_SN+"'><span onclick='itemJump4(\""+rccList[i].WT_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WT_SN+"</span></td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align:center;'>"+tempState+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].WT_AREA_SN+"'>"+rccList[i].WT_AREA_SN+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].WT_NUM+"'>"+rccList[i].WT_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align:right;' title='"+rccList[i].WT_NG_NUM+"'>"+rccList[i].WT_NG_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WT_SCRAP_NUM+"'>"+rccList[i].WT_SCRAP_NUM+"</td>");
								
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align:center;' title='"+rccList[i].WT_LOT+"'>"+rccList[i].WT_LOT+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:80px;text-align:center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:140px;text-align:center;' title='"+inTime+"'>"+inTime+"</td>");
								if(rccList[i].WT_FINISH_FLAG=="Y"){
$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align:center;'><span><img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'></span></td>");
}else{
$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align:center;'><span><img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'></span></td>");
}
								////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
								//$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:140px;text-align:center;' title='"+inTime+"'>"+inTime+"</td>");
								//$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align:center;' title='"+rccList[i].WT_LOT+"'>"+rccList[i].WT_LOT+"</td>");
								
								
							}
							$("#addTracking tr:last").append("<input type='hidden' id='myMoNumber' name='myMoNumber' value='"+rccList[0].WT_MO_NUMBER+"'>");
							$("#addTracking tr:last").append("<input type='hidden' id='myGroupCode' name='myGroupCode' value='"+rccList[0].WT_GROUP_CODE+"'>");
							$("#addTracking tr:last").append("<input type='hidden' id='myGroupSeq' name='myGroupSeq' value='"+rccList[0].WT_GROUP_SEQ+"'>");
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#addTracking tr");
							_tongLineColor(tableTrJs);
						//newScroll(".datagrid-body2")
						 $('#block2 .datagrid-body2').mCustomScrollbar("destroy");
						 setPopScroll('#block2 .datagrid-body2','#block2 .datagrid-header-inner')
						 $('#block2 .datagrid-header-inner').scrollLeft(0)

					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//根据制令单条件查询所得加载查询出的工序生产统计数据
function getfirstGroupStatistic(){
util.showLoading("处理中...");
    var moNumber = $("#firstGroupStatistic").val();
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getGroupStatistic+"&moNumber="+moNumber,
			    data: "",
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxPage.ajaxList);
						$("#addGroupStatistic").empty();
						//if(null == data){return ;}
						if(null != data.ajaxList){
							var tempType;	
							var rccList = eval(data.ajaxList);
							var j=0;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].MGS_MO_NUMBER==null) rccList[i].MGS_MO_NUMBER="";
								if(rccList[i].GROUP_NAME==null) rccList[i].GROUP_NAME="";
								if(rccList[i].PASSNUM==null) rccList[i].PASSNUM="0";
								if(rccList[i].MGS_T_OK_PCS==null) rccList[i].MGS_T_OK_PCS="0";
								if(rccList[i].WIP_NUM==null) rccList[i].WIP_NUM="0";
								if(rccList[i].MGS_NG_PCS==null) rccList[i].MGS_NG_PCS="0";
								if(rccList[i].MGS_T_NG_PCS==null) rccList[i].MGS_T_NG_PCS="0";
								if(rccList[i].MGS_SCRAP_QTY==null) rccList[i].MGS_SCRAP_QTY="0";
								if(rccList[i].RW_FLAG!="Y"){
								$("#addGroupStatistic").append("<tr id='"+(i+1)+"' name='"+(i+1)+"' onclick=\"showTracking('"+(i+1)+"','"+dataAuth+");\" ></tr>"); 
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(j+1)+"</td>");  
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;' title='"+rccList[i].MGS_MO_NUMBER+"'>"+rccList[i].MGS_MO_NUMBER+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].GROUP_NAME+"'>"+rccList[i].GROUP_NAME+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].PASSNUM+"'>"+rccList[i].PASSNUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_OK_PCS+"'>"+rccList[i].MGS_T_OK_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WIP_NUM+"'>"+rccList[i].WIP_NUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align:right;' title='"+rccList[i].MGS_NG_PCS+"'>"+rccList[i].MGS_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_NG_PCS+"'>"+rccList[i].MGS_T_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align:right;'  title='"+rccList[i].MGS_SCRAP_QTY+"'>"+rccList[i].MGS_SCRAP_QTY+"</td>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_"+(i+1)+"' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								if(i==0){
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstMoNumber' name='firstMoNumber' value='"+rccList[i].MGS_MO_NUMBER+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupCode' name='firstGroupCode' value='"+rccList[i].MGS_GROUP_CODE+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupSeq' name='firstGroupSeq' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								}
								j++;
								}
							}
                            var j=0;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].MGS_MO_NUMBER==null) rccList[i].MGS_MO_NUMBER="";
								if(rccList[i].GROUP_NAME==null) rccList[i].GROUP_NAME="";
								if(rccList[i].PASSNUM==null) rccList[i].PASSNUM="0";
								if(rccList[i].MGS_T_OK_PCS==null) rccList[i].MGS_T_OK_PCS="0";
								if(rccList[i].WIP_NUM==null) rccList[i].WIP_NUM="0";
								if(rccList[i].MGS_NG_PCS==null) rccList[i].MGS_NG_PCS="0";
								if(rccList[i].MGS_T_NG_PCS==null) rccList[i].MGS_T_NG_PCS="0";
								if(rccList[i].MGS_SCRAP_QTY==null) rccList[i].MGS_SCRAP_QTY="0";
								if(rccList[i].RW_FLAG=="Y"){
								$("#addGroupStatistic").append("<tr id='"+(i+1)+"' name='"+(i+1)+"' onclick=\"showTracking('"+(i+1)+"','"+dataAuth+");\" ></tr>"); 
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;background-color:red;'>"+"返工"+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;' title='"+rccList[i].MGS_MO_NUMBER+"'>"+rccList[i].MGS_MO_NUMBER+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].GROUP_NAME+"'>"+rccList[i].GROUP_NAME+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].PASSNUM+"'>"+rccList[i].PASSNUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_OK_PCS+"'>"+rccList[i].MGS_T_OK_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WIP_NUM+"'>"+rccList[i].WIP_NUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align:right;' title='"+rccList[i].MGS_NG_PCS+"'>"+rccList[i].MGS_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_NG_PCS+"'>"+rccList[i].MGS_T_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align:right;'  title='"+rccList[i].MGS_SCRAP_QTY+"'>"+rccList[i].MGS_SCRAP_QTY+"</td>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_"+(i+1)+"' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								if(i==0){
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstMoNumber' name='firstMoNumber' value='"+rccList[i].MGS_MO_NUMBER+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupCode' name='firstGroupCode' value='"+rccList[i].MGS_GROUP_CODE+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupSeq' name='firstGroupSeq' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								}
								j++;
								}
							}
							
						}

								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");	
					//	pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#addGroupStatistic tr");
							_tongLineColor(tableTrJs);
							//if(null != data){
							getFirstTracking();
							//}
						//newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

<%--查询--%>
function query(thisObj){//alert(11);
  var formId = $("#formId1").val();
  var productSeq = $.trim($("#PRODUCT_SEQ").val());
  if(productSeq!=""){
		findAllInfo(formId);
  }else{
		searchMoNumber(formId);
  }
        //listAjaxTable(formId);
}

$(function(){
$("#18195917a5fb41728bc48aea8f31530c").attr("style","display:none;");   
})

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#PM_PROJECT_ID_SHOW").val(jumpId);
                  $("#PM_PROJECT_ID").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
</script>

<script>
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='ba0b1e72aae14ee38a2c1272e136dcd5'){<%--生产实时信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showGroupStatistic('"+v['PM_MO_NUMBER']+"','"+v.ID+"');\" abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:60px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
			if(v._SEQ==1){
            arrHtml.push("<input type='hidden' id='firstGroupStatistic' value='"+v['PM_MO_NUMBER']+"' />");
            }
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='auth_"+v['ID']+"'  value='"+v['DATA_AUTH_ID']+"'  />")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='PM_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PM_MO_NUMBER')+"' style='width:120px;"+ms.tdStyle(formId, 'PM_MO_NUMBER')+"' "+ms.tdEvent(formId, 'PM_MO_NUMBER')+">")
            arrHtml.push("<span colno='PM_MO_NUMBER' class='"+ms.uiClass(formId, 'PM_MO_NUMBER')+"' onclick='itemJump1(\""+v['PM_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PM_MO_NUMBER')+" title='"+ms.titleAttr(formId,'PM_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PM_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PM_PROJECT_ID')+"' style='width:120px;"+ms.tdStyle(formId, 'PM_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PM_PROJECT_ID')+">")
            arrHtml.push("<span colno='PM_PROJECT_ID' class='"+ms.uiClass(formId, 'PM_PROJECT_ID')+"' onclick='itemJump2(\""+v['PM_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PM_PROJECT_ID')+" title='"+ms.titleAttr(formId,'PM_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PM_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#DESTROY_NO' class='datagrid-cell "+ms.tdClass(formId, 'T2#DESTROY_NO')+"' style='width:120px;"+ms.tdStyle(formId, 'T2#DESTROY_NO')+"' "+ms.tdEvent(formId, 'T2#DESTROY_NO')+">")
            arrHtml.push("<span colno='T2#DESTROY_NO' class='"+ms.uiClass(formId, 'T2#DESTROY_NO')+"' style='"+ms.uiStyle(formId, 'T2#DESTROY_NO')+"' "+ms.uiEvent(formId, 'T2#DESTROY_NO')+" title='"+ms.titleAttr(formId,'T2#DESTROY_NO','IS_TITLE_ATTR',v)+"' >"+v['T2#DESTROY_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PM_MODEL_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'PM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PM_MODEL_CODE')+">")
            arrHtml.push("<span colno='PM_MODEL_CODE' class='"+ms.uiClass(formId, 'PM_MODEL_CODE')+"' onclick='itemJump3(\""+v['PM_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'PM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['PM_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_NAME')+"' style='"+ms.tdStyle(formId, 'PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'PRODUCT_NAME')+">")
            arrHtml.push("<span colno='PRODUCT_NAME' class='"+ms.uiClass(formId, 'PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'PRODUCT_NAME')+" title='"+ms.titleAttr(formId,'PRODUCT_NAME','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.tdStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.tdEvent(formId, 'PRODUCT_STANDARD')+">")
            arrHtml.push("<span colno='PRODUCT_STANDARD' class='"+ms.uiClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.uiStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.uiEvent(formId, 'PRODUCT_STANDARD')+" title='"+ms.titleAttr(formId,'PRODUCT_STANDARD','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_STANDARD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_COUNT')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'PRODUCT_COUNT')+">")
            arrHtml.push("<span colno='PRODUCT_COUNT' class='"+ms.uiClass(formId, 'PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'PM_PROCESS_FACE')+"' style='text-align:center;"+ms.tdStyle(formId, 'PM_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'PM_PROCESS_FACE')+">")
            arrHtml.push("<span colno='PM_PROCESS_FACE' class='"+ms.uiClass(formId, 'PM_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'PM_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'PM_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'PM_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['PM_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PM_AREA_SN')+"' style='"+ms.tdStyle(formId, 'PM_AREA_SN')+"' "+ms.tdEvent(formId, 'PM_AREA_SN')+">")
            arrHtml.push("<span colno='PM_AREA_SN' class='"+ms.uiClass(formId, 'PM_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PM_AREA_SN')+"' "+ms.uiEvent(formId, 'PM_AREA_SN')+" title='"+ms.titleAttr(formId,'PM_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PM_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_TARGET_QTY' class='datagrid-cell "+ms.tdClass(formId, 'PM_TARGET_QTY')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'PM_TARGET_QTY')+"' "+ms.tdEvent(formId, 'PM_TARGET_QTY')+">")
            arrHtml.push("<span colno='PM_TARGET_QTY' class='"+ms.uiClass(formId, 'PM_TARGET_QTY')+"' style='"+ms.uiStyle(formId, 'PM_TARGET_QTY')+"' "+ms.uiEvent(formId, 'PM_TARGET_QTY')+" title='"+ms.titleAttr(formId,'PM_TARGET_QTY','IS_TITLE_ATTR',v)+"' >"+v['PM_TARGET_QTY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_INPUT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'PM_INPUT_COUNT')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'PM_INPUT_COUNT')+"' "+ms.tdEvent(formId, 'PM_INPUT_COUNT')+">")
            arrHtml.push("<span colno='PM_INPUT_COUNT' class='"+ms.uiClass(formId, 'PM_INPUT_COUNT')+"' style='"+ms.uiStyle(formId, 'PM_INPUT_COUNT')+"' "+ms.uiEvent(formId, 'PM_INPUT_COUNT')+" title='"+ms.titleAttr(formId,'PM_INPUT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['PM_INPUT_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_FINISH_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'PM_FINISH_COUNT')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'PM_FINISH_COUNT')+"' "+ms.tdEvent(formId, 'PM_FINISH_COUNT')+">")
            arrHtml.push("<span colno='PM_FINISH_COUNT' class='"+ms.uiClass(formId, 'PM_FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'PM_FINISH_COUNT')+"' "+ms.uiEvent(formId, 'PM_FINISH_COUNT')+" title='"+ms.titleAttr(formId,'PM_FINISH_COUNT','IS_TITLE_ATTR',v)+"' >"+v['PM_FINISH_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_SCRAP_QTY' class='datagrid-cell "+ms.tdClass(formId, 'PM_SCRAP_QTY')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'PM_SCRAP_QTY')+"' "+ms.tdEvent(formId, 'PM_SCRAP_QTY')+">")
            arrHtml.push("<span colno='PM_SCRAP_QTY' class='"+ms.uiClass(formId, 'PM_SCRAP_QTY')+"' style='"+ms.uiStyle(formId, 'PM_SCRAP_QTY')+"' "+ms.uiEvent(formId, 'PM_SCRAP_QTY')+" title='"+ms.titleAttr(formId,'PM_SCRAP_QTY','IS_TITLE_ATTR',v)+"' >"+v['PM_SCRAP_QTY']+"</span>")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='PRODUCT_OPENTIME' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_OPENTIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'PRODUCT_OPENTIME')+"' "+ms.tdEvent(formId, 'PRODUCT_OPENTIME')+">")
            arrHtml.push("<span colno='PRODUCT_OPENTIME' class='"+ms.uiClass(formId, 'PRODUCT_OPENTIME')+"' style='"+ms.uiStyle(formId, 'PRODUCT_OPENTIME')+"' "+ms.uiEvent(formId, 'PRODUCT_OPENTIME')+" title='"+ms.titleAttr(formId,'PRODUCT_OPENTIME','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_OPENTIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_START_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PM_START_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'PM_START_DATE')+"' "+ms.tdEvent(formId, 'PM_START_DATE')+">")
            arrHtml.push("<span colno='PM_START_DATE' class='"+ms.uiClass(formId, 'PM_START_DATE')+"' style='"+ms.uiStyle(formId, 'PM_START_DATE')+"' "+ms.uiEvent(formId, 'PM_START_DATE')+" title='"+ms.titleAttr(formId,'PM_START_DATE','IS_TITLE_ATTR',v)+"' >"+v['PM_START_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();


	//加载第一条制令单所对应的工序生产统计数据
    util.showLoading("处理中...");
    var moNumber = $("#firstGroupStatistic").val();
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getGroupStatistic+"&moNumber="+moNumber,
			    data: "",
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxPage.ajaxList);
						$("#addGroupStatistic").empty();
						//if(null == data){return ;}
						if(null != data.ajaxList){
							var tempType;	
							var rccList = eval(data.ajaxList);
							var j=0;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].MGS_MO_NUMBER==null) rccList[i].MGS_MO_NUMBER="";
								if(rccList[i].GROUP_NAME==null) rccList[i].GROUP_NAME="";
								if(rccList[i].PASSNUM==null) rccList[i].PASSNUM="0";
								if(rccList[i].MGS_T_OK_PCS==null) rccList[i].MGS_T_OK_PCS="0";
								if(rccList[i].WIP_NUM==null) rccList[i].WIP_NUM="0";
								if(rccList[i].MGS_NG_PCS==null) rccList[i].MGS_NG_PCS="0";
								if(rccList[i].MGS_T_NG_PCS==null) rccList[i].MGS_T_NG_PCS="0";
								if(rccList[i].MGS_SCRAP_QTY==null) rccList[i].MGS_SCRAP_QTY="0";
								if(rccList[i].RW_FLAG!="Y"){
								$("#addGroupStatistic").append("<tr id='"+(i+1)+"' name='"+(i+1)+"' onclick=\"showTracking('"+(i+1)+"','"+dataAuth+");\" ></tr>"); 
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(j+1)+"</td>");  
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;' title='"+rccList[i].MGS_MO_NUMBER+"'>"+rccList[i].MGS_MO_NUMBER+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].GROUP_NAME+"'>"+rccList[i].GROUP_NAME+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].PASSNUM+"'>"+rccList[i].PASSNUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_OK_PCS+"'>"+rccList[i].MGS_T_OK_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WIP_NUM+"'>"+rccList[i].WIP_NUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align:right;' title='"+rccList[i].MGS_NG_PCS+"'>"+rccList[i].MGS_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_NG_PCS+"'>"+rccList[i].MGS_T_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align:right;'  title='"+rccList[i].MGS_SCRAP_QTY+"'>"+rccList[i].MGS_SCRAP_QTY+"</td>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_"+(i+1)+"' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								if(i==0){
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstMoNumber' name='firstMoNumber' value='"+rccList[i].MGS_MO_NUMBER+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupCode' name='firstGroupCode' value='"+rccList[i].MGS_GROUP_CODE+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupSeq' name='firstGroupSeq' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								}
								j++;
								}
							}
                              var j=0;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].MGS_MO_NUMBER==null) rccList[i].MGS_MO_NUMBER="";
								if(rccList[i].GROUP_NAME==null) rccList[i].GROUP_NAME="";
								if(rccList[i].PASSNUM==null) rccList[i].PASSNUM="0";
								if(rccList[i].MGS_T_OK_PCS==null) rccList[i].MGS_T_OK_PCS="0";
								if(rccList[i].WIP_NUM==null) rccList[i].WIP_NUM="0";
								if(rccList[i].MGS_NG_PCS==null) rccList[i].MGS_NG_PCS="0";
								if(rccList[i].MGS_T_NG_PCS==null) rccList[i].MGS_T_NG_PCS="0";
								if(rccList[i].MGS_SCRAP_QTY==null) rccList[i].MGS_SCRAP_QTY="0";
								if(rccList[i].RW_FLAG=="Y"){
								$("#addGroupStatistic").append("<tr id='"+(i+1)+"' name='"+(i+1)+"' onclick=\"showTracking('"+(i+1)+"','"+dataAuth+");\" ></tr>"); 
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;background-color:red;'>"+"返工"+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;' title='"+rccList[i].MGS_MO_NUMBER+"'>"+rccList[i].MGS_MO_NUMBER+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].GROUP_NAME+"'>"+rccList[i].GROUP_NAME+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].PASSNUM+"'>"+rccList[i].PASSNUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_OK_PCS+"'>"+rccList[i].MGS_T_OK_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WIP_NUM+"'>"+rccList[i].WIP_NUM+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align:right;' title='"+rccList[i].MGS_NG_PCS+"'>"+rccList[i].MGS_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align:right;' title='"+rccList[i].MGS_T_NG_PCS+"'>"+rccList[i].MGS_T_NG_PCS+"</td>");
								$("#addGroupStatistic tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align:right;'  title='"+rccList[i].MGS_SCRAP_QTY+"'>"+rccList[i].MGS_SCRAP_QTY+"</td>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_"+(i+1)+"' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								if(i==0){
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstMoNumber' name='firstMoNumber' value='"+rccList[i].MGS_MO_NUMBER+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupCode' name='firstGroupCode' value='"+rccList[i].MGS_GROUP_CODE+"'>");
									$("#addGroupStatistic tr:last").append("<input type='hidden' id='firstGroupSeq' name='firstGroupSeq' value='"+rccList[i].MGS_GROUP_SEQ+"'>");
								}
								j++;
								}
							}
						    
						}
						

								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='moNumber_' name='moNumber_"+(i+1)+"' value='"+rccList[i].MGS_MO_NUMBER+"'>");
								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupCode_"+(i+1)+"' name='groupCode_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_CODE+"'>");
								//$("#addGroupStatistic tr:last").append("<input type='hidden' id='groupSeq_"+(i+1)+"' name='groupSeq_"+(i+1)+"' value='"+rccList[i].MGS_GROUP_SEQ+"'>");							 
							
					
						//pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#addGroupStatistic tr");
							_tongLineColor(tableTrJs);
						//newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	//alert($("#firstMoNumber").val());
	if($("#firstMoNumber").val()!=undefined){//alert(11);
	//根据制令单，工序，工序顺序加载第一条产品在制信息
	var firstMoNumber = $("#firstMoNumber").val();
	var firstGroupCode = $("#firstGroupCode").val();
        var firstGroupSeq = $("#firstGroupSeq").val();
        var dataAuth  = $("#DATA_AUTH").val();
	util.showLoading("处理中...");
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getTracking,
			    data: {"moNumber":firstMoNumber,"groupCode":firstGroupCode,"groupSeq":firstGroupSeq,"dataAuth":dataAuth},
				success: function(data){
						util.closeLoading();
						//console.log(data.dataList);
						$("#addTracking").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempState;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].WT_LOT==null) rccList[i].WT_LOT="";
								if(rccList[i].WT_ERROR_FLAG!=null){
									if(rccList[i].WT_ERROR_FLAG==0)	   tempState = "<span><span class='state' style='background-color:#4e9d0f;color:#ffffff;width:45px'>正常</span></span>";
									if(rccList[i].WT_ERROR_FLAG==1)	   tempState = "<span><span class='state' style='background-color:#e35850;color:#ffffff;width:45px'>不良</span></span>";
									if(rccList[i].WT_ERROR_FLAG==2)	   tempState = "<span><span class='state' style='background-color:#fdab36;color:#ffffff;width:45px'>维修</span></span>";
									if(rccList[i].WT_ERROR_FLAG==3)	   tempState = "<span><span class='state' style='background-color:#aeaeae;color:#ffffff;width:45px'>报废</span></span>";
								}else tempState = "";
								var inTime=(rccList[i].WT_IN_TIME).replace("T"," ");
								$("#addTracking").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"'></tr>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+rccList[i].ROWNUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:100px;' title='"+rccList[i].WT_SN+"'><span onclick='itemJump4(\""+rccList[i].WT_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WT_SN+"</span></td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align:center;'>"+tempState+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;' title='"+rccList[i].WT_AREA_SN+"'>"+rccList[i].WT_AREA_SN+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align:right;' title='"+rccList[i].WT_NUM+"'>"+rccList[i].WT_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align:right;' title='"+rccList[i].WT_NG_NUM+"'>"+rccList[i].WT_NG_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align:right;' title='"+rccList[i].WT_SCRAP_NUM+"'>"+rccList[i].WT_SCRAP_NUM+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:70px;text-align:center;' title='"+rccList[i].WT_LOT+"'>"+rccList[i].WT_LOT+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:80px;text-align:center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:140px;text-align:center;' title='"+inTime+"'>"+inTime+"</td>");
								if(rccList[i].WT_FINISH_FLAG=="Y"){
$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align:center;'><span><img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'></span></td>");
}else{
$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align:center;'><span><img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'></span></td>");
}
								
							}
							$("#addTracking tr:last").append("<input type='hidden' id='myMoNumber' name='myMoNumber' value='"+rccList[0].WT_MO_NUMBER+"'>");
							$("#addTracking tr:last").append("<input type='hidden' id='myGroupCode' name='myGroupCode' value='"+rccList[0].WT_GROUP_CODE+"'>");
							$("#addTracking tr:last").append("<input type='hidden' id='myGroupSeq' name='myGroupSeq' value='"+rccList[0].WT_GROUP_SEQ+"'>");
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#addTracking tr");
							_tongLineColor(tableTrJs);
						//newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
		
}

$('#addTracking').on('click','tr',function(){
    $(this).css('background-color','#d3eafc').siblings().css('background-color','');
})

function setStyle(){
	$('.dlist .datagrid-body1').width(($(window).width() - 2 ) * 0.49)
	$('.dlist .datagrid-body2').width(($(window).width() - 2 ) * 0.49)
	$('#block1 .panel-ajax').height(($(window).height() - 30 - 100 - 35)/2 - 10)
	$('#block1 .datagrid-body-ajax').height($('#block1 .datagrid-view-ajax').height() - 40)
}

$(function(){
	setStyle()
	setPopScroll('.datagrid-body','#datagrid-header-innerba0b1e72aae14ee38a2c1272e136dcd5')
	setPopScroll('#block1 .datagrid-body1','#block1 .datagrid-header-inner')
	setPopScroll('#block2 .datagrid-body2','#block2 .datagrid-header-inner')
	
})

$(window).resize(function(){
	setStyle()
})
///制令单查询分页
function searchMoNumber(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=2639d98563544f878b6ddd56bfa741aa";
	SearchMoNumber(paginationImpl,url);
}
//产品分页
function listTracking(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=db5c9a4f9b864b5c91a26bbfaabce579";
	ListTracking(paginationImpl,url);
}


function findAllInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=001640159d15458dabb4ab762207d773";
	FindAllInfo(paginationImpl,url);
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//BOM管理
function itemJump3(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 

//产品追溯
function itemJump4(obj){
  winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
} 


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>

