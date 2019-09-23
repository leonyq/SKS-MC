<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 

	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>

	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
          <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
            
			    <div class="optn">
			        <button type="button" onclick="addPack();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			        <button type="button" onclick="SearchPoInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			    </div>
			   
			</div>
			<div class="mod">
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="454cc1d04a9240f4868ccffb52793896" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="454cc1d04a9240f4868ccffb52793896" />
	<input type="hidden" id="prefixInd" name="454cc1d04a9240f4868ccffb52793896" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	 <input type="hidden" id="selectDataAuth" value='${param.dataAuth}'/>
    <input type="hidden" id="planStartDate" value="${param.planStartDate}"/>
     <input type="hidden" id="planEndDate" value="${param.planEndDate}"/>
    <input type="hidden" id="exsitPorjectIds" value='${param.exsitPorjectIds}'/>
		<s:set name="_$viewId" value="'2b4ecb5177144fbc87f46ecf120d2bbd'" />
		<s:set name="_$formId_1" value="'454cc1d04a9240f4868ccffb52793896'" />
		<s:set name="_$type" value="'add'" />
		 	<tr>
			<td class="name-six" /><bu:uitn colNo="PPW_PROJECT_ID" formId="454cc1d04a9240f4868ccffb52793896" /></td>
			<bu:td cssClass="dec-self" colNo="PPW_PROJECT_ID" formId="454cc1d04a9240f4868ccffb52793896" ><bu:ui colNo="PPW_PROJECT_ID" formId="454cc1d04a9240f4868ccffb52793896" value="%{PPW_PROJECT_ID}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="PPW_STEP" formId="454cc1d04a9240f4868ccffb52793896" /></td>
			<bu:td cssClass="dec-self" colNo="PPW_STEP" formId="454cc1d04a9240f4868ccffb52793896" ><bu:ui colNo="PPW_STEP" formId="454cc1d04a9240f4868ccffb52793896" value="%{PPW_STEP}" formIndex="1" /></bu:td>
	    </tr>
			<tr>
            <td class="name-six" /><bu:uitn colNo="PRODUCT_MATERIAL" formId="454cc1d04a9240f4868ccffb52793896" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_MATERIAL" formId="454cc1d04a9240f4868ccffb52793896" ><bu:ui colNo="PRODUCT_MATERIAL" formId="454cc1d04a9240f4868ccffb52793896" value="%{PRODUCT_MATERIAL}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	    <div class="mod" >
    			<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
    				<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header"> <!--min-width:1500px-->
    							<div class="datagrid-header-inner" id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
    										<td class="datagrid-cell" style="width:30px;"></td>
    										<td class="datagrid-cell" style="width:30px;">
    										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
    										</td>
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="工单号" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="生产阶别" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="计划数量" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="可排产数量" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="标准工时" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="机种" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="机种名称" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="预计开工时间" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="预计完工时间" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="计划交货日期" /></td >
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll"   style="height:200px;"><!--min-width:1500px;-->
    							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
    								<tbody id="poInfoTbody" >
    								</tbody>
    							</table>
    						</div>
    					
    					</div>
    						<div style="background-color: white;" id="pageDiv1">
    					        
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchPoInfo&formId=formId2&showLoading=0" />
                            </div>	
    				</div>
    			</div>
    		 </div>	
		    </div>
			<bu:jsVal formId="454cc1d04a9240f4868ccffb52793896" formIndex="1" />
				
		 </div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

<script>
var parentWindow;
var exsitProjects='${param.exsitPorjectIds}';
function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	$(function(){
	    //$("#paraMap1_PTD_LEVEL").val(packLevel);
	    parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
	   addPoInfo();
	})
 var trCount=0;	
function addPoInfo(){
			util.showLoading("处理中...");
			//var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=7f23be136c72422e97a721a972c93d41&dataAuth="+$("#selectDataAuth").val()+"&planStartDate="+$("#planStartDate").val()+"&planEndDate="+$("#planEndDate").val()+"&exsitPorjectIds="+$("#exsitPorjectIds").val();
	       $.ajax({
	           type:"post",
	           dataType:"json",
	           data:{
                selectDataAuth:$("#selectDataAuth").val(),
                planStartDate:$("#planStartDate").val(),
                planEndDate:$("#planEndDate").val(),
                exsitPorjectIds:exsitProjects
               },
	           url:"${path}buss/bussModel_exeFunc.ms?funcMId=7f23be136c72422e97a721a972c93d41",
	           success:function(data){		
                	util.closeLoading();
                	$("#poInfoTbody").empty();
                	if(null==data){
                	    return;
                	}
                
                	if(null!=data.ajaxPage.dataList){
                	   var rccList = eval(data.ajaxPage.dataList);
                	   for(var i=0;i<rccList.length;i++){
                	        if(rccList[i].ID==null) rccList[i].ID="";
                	       if(rccList[i].PROJECT_ID==null) rccList[i].PROJECT_ID="";
                	       if(rccList[i].PROJECT_STEP==null) rccList[i].PROJECT_STEP="";
                	       if(rccList[i].PRODUCT_COUNT==null) rccList[i].PRODUCT_COUNT="";
                	       if(rccList[i].CST_STANDARD_TIME==null) rccList[i].CST_STANDARD_TIME="";
                	       if(rccList[i].PRODUCT_MATERIAL==null) rccList[i].PRODUCT_MATERIAL="";
                	       if(rccList[i].PRODUCT_NAME==null) rccList[i].PRODUCT_NAME="";
                	       if(rccList[i].PROLEPSIS_START_DATE==null) rccList[i].PROLEPSIS_START_DATE="";
                	       if(rccList[i].PROLEPSIS_END_DATE==null) rccList[i].PROLEPSIS_END_DATE="";
                	       if(rccList[i].TPPB_PLAN_DELIVERY_DATE==null) rccList[i].TPPB_PLAN_DELIVERY_DATE="";
                	       	    $("#poInfoTbody").append("<tr id='tr2_"+i+"' ></tr>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' id='ID"+(trCount+1)+"' value='"+rccList[i].ID+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/><input type='hidden' id='QII_ITEM_TYPE"+rccList[i].ID+"' value='"+rccList[i].QII_ITEM_TYPE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:185px;text-align: center;' title='"+rccList[i].PROJECT_ID+"'>"+rccList[i].PROJECT_ID+"<input type='hidden' id='PROJECT_ID"+rccList[i].ID+"' value='"+rccList[i].PROJECT_ID+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:185px;text-align: center;' title='"+rccList[i].STEP_NAME+"' stepSn='"+rccList[i].PROJECT_STEP+"'>"+rccList[i].STEP_NAME+"<input type='hidden' id='PROJECT_STEP"+rccList[i].ID+"' value='"+rccList[i].PROJECT_STEP+"'/></td>");
							    $("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:185px;text-align: center;' title='"+rccList[i].PRODUCT_COUNT+"'>"+rccList[i].PRODUCT_COUNT+"<input type='hidden' id='PRODUCT_COUNT"+rccList[i].ID+"' value='"+rccList[i].PRODUCT_COUNT+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:185px;text-align: center;' title='"+rccList[i].CANPLAN+"'>"+rccList[i].CANPLAN+"<input type='hidden' id='PRODUCT_COUNT"+rccList[i].ID+"' value='"+rccList[i].CANPLAN+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:185px;text-align: center;' title='"+rccList[i].CST_STANDARD_TIME+"'>"+rccList[i].CST_STANDARD_TIME+"<input type='hidden' id='CST_STANDARD_TIME"+rccList[i].ID+"' value='"+rccList[i].CST_STANDARD_TIME+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:185px;text-align: center;' title='"+rccList[i].PRODUCT_MATERIAL+"'>"+rccList[i].PRODUCT_MATERIAL+"<input type='hidden' id='PRODUCT_MATERIAL"+rccList[i].ID+"' value='"+rccList[i].PRODUCT_MATERIAL+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:185px;text-align: center;' title='"+rccList[i].PRODUCT_NAME+"'>"+rccList[i].PRODUCT_NAME+"<input type='hidden' id='PRODUCT_NAME"+rccList[i].ID+"' value='"+rccList[i].PRODUCT_NAME+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:185px;text-align: center;' title='"+rccList[i].PROLEPSIS_START_DATE+"'>"+rccList[i].PROLEPSIS_START_DATE+"<input type='hidden' id='PROLEPSIS_START_DATE"+rccList[i].ID+"' value='"+rccList[i].PROLEPSIS_START_DATE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:185px;text-align: center;' title='"+rccList[i].PROLEPSIS_END_DATE+"'>"+rccList[i].PROLEPSIS_END_DATE+"<input type='hidden' id='PROLEPSIS_END_DATE"+rccList[i].ID+"' value='"+rccList[i].PROLEPSIS_END_DATE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:185px;text-align: center;' title='"+rccList[i].TPPB_PLAN_DELIVERY_DATE+"'>"+rccList[i].TPPB_PLAN_DELIVERY_DATE+"<input type='hidden' id='TPPB_PLAN_DELIVERY_DATE"+rccList[i].ID+"' value='"+rccList[i].TPPB_PLAN_DELIVERY_DATE+"'/></td>");
								
								trCount++;
                	   }
                	}
                		pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						
	               
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	       })
	   }
	    var paginationImpl = {};
	   function SearchPoInfo(paginationImpl,url){
	   
	        util.showLoading("处理中...");
	       	var isFirstLoad = firstLoadThisPage(paginationImpl);
        	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
        	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        	
        	var PPW_PROJECT_ID = $("#paraMap1_PPW_PROJECT_ID_SHOW").val();
        	 var PPW_STEP = $("#paraMap1_PPW_STEP").val();
        	var PRODUCT_MATERIAL = $("#paraMap1_PRODUCT_MATERIAL_SHOW").val();
        	
        	 //var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=7f23be136c72422e97a721a972c93d41&dataAuth="+$("#selectDataAuth").val()+"&planStartDate="+$("#planStartDate").val()+"&planEndDate="+$("#planEndDate").val()+"&exsitPorjectIds="+$("#exsitPorjectIds").val();
        	 $.ajax({
	           type:"post",
	           dataType:"json",
	            //data:"PRODUCT_MATERIAL="+PRODUCT_MATERIAL+"&PPW_STEP="+PPW_STEP+"&PPW_PROJECT_ID="+PPW_PROJECT_ID+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
	           url:"${path}buss/bussModel_exeFunc.ms?funcMId=7f23be136c72422e97a721a972c93d41",
               data:{
                PRODUCT_MATERIAL:PRODUCT_MATERIAL,
                PPW_STEP:PPW_STEP,
                PPW_PROJECT_ID:PPW_PROJECT_ID,
                selectDataAuth:$("#selectDataAuth").val(),
                planStartDate:$("#planStartDate").val(),
                planEndDate:$("#planEndDate").val(),
                exsitPorjectIds:exsitProjects,
                currentPage:currentPage,
                pageRecord:pageRecord
               },
	           success:function(data){		
                	util.closeLoading();
                	$("#poInfoTbody").empty();
                	if(null==data){
                	    return;
                	}
                    	console.log(data.ajaxPage.dataList);
                	if(null!=data.ajaxPage.dataList){
                	   var rccList = eval(data.ajaxPage.dataList);
                	   for(var i=0;i<rccList.length;i++){
                	        if(rccList[i].ID==null) rccList[i].ID="";
                	       if(rccList[i].PROJECT_ID==null) rccList[i].PROJECT_ID="";
                	       if(rccList[i].PROJECT_STEP==null) rccList[i].PROJECT_STEP="";
                	       if(rccList[i].PRODUCT_COUNT==null) rccList[i].PRODUCT_COUNT="";
                	       if(rccList[i].CST_STANDARD_TIME==null) rccList[i].CST_STANDARD_TIME="";
                	       if(rccList[i].PRODUCT_MATERIAL==null) rccList[i].PRODUCT_MATERIAL="";
                	       if(rccList[i].PRODUCT_NAME==null) rccList[i].PRODUCT_NAME="";
                	       if(rccList[i].PROLEPSIS_START_DATE==null) rccList[i].PROLEPSIS_START_DATE="";
                	       if(rccList[i].PROLEPSIS_END_DATE==null) rccList[i].PROLEPSIS_END_DATE="";
                	       if(rccList[i].TPPB_PLAN_DELIVERY_DATE==null) rccList[i].TPPB_PLAN_DELIVERY_DATE="";
                	       	    $("#poInfoTbody").append("<tr id='tr2_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"<input type='hidden' id='ID"+(trCount+1)+"' value='"+rccList[i].ID+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/><input type='hidden' id='QII_ITEM_TYPE"+rccList[i].ID+"' value='"+rccList[i].ID+"'/></td>");
							    $("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:185px;text-align: center;' title='"+rccList[i].PROJECT_ID+"'>"+rccList[i].PROJECT_ID+"<input type='hidden' id='PROJECT_ID"+rccList[i].ID+"' value='"+rccList[i].PROJECT_ID+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:185px;text-align: center;' title='"+rccList[i].STEP_NAME+"'>"+rccList[i].STEP_NAME+"<input type='hidden' id='PROJECT_STEP"+rccList[i].ID+"' value='"+rccList[i].PROJECT_STEP+"'/></td>");
							    $("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:185px;text-align: center;' title='"+rccList[i].PRODUCT_COUNT+"'>"+rccList[i].PRODUCT_COUNT+"<input type='hidden' id='PRODUCT_COUNT"+rccList[i].ID+"' value='"+rccList[i].PRODUCT_COUNT+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:185px;text-align: center;' title='"+rccList[i].CANPLAN+"'>"+rccList[i].CANPLAN+"<input type='hidden' id='PRODUCT_COUNT"+rccList[i].ID+"' value='"+rccList[i].CANPLAN+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:185px;text-align: center;' title='"+rccList[i].CST_STANDARD_TIME+"'>"+rccList[i].CST_STANDARD_TIME+"<input type='hidden' id='CST_STANDARD_TIME"+rccList[i].ID+"' value='"+rccList[i].CST_STANDARD_TIME+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:185px;text-align: center;' title='"+rccList[i].PRODUCT_MATERIAL+"'>"+rccList[i].PRODUCT_MATERIAL+"<input type='hidden' id='PRODUCT_MATERIAL"+rccList[i].ID+"' value='"+rccList[i].PRODUCT_MATERIAL+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:185px;text-align: center;' title='"+rccList[i].PRODUCT_NAME+"'>"+rccList[i].PRODUCT_NAME+"<input type='hidden' id='PRODUCT_NAME"+rccList[i].ID+"' value='"+rccList[i].PRODUCT_NAME+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:185px;text-align: center;' title='"+rccList[i].PROLEPSIS_START_DATE+"'>"+rccList[i].PROLEPSIS_START_DATE+"<input type='hidden' id='PROLEPSIS_START_DATE"+rccList[i].ID+"' value='"+rccList[i].PROLEPSIS_START_DATE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:185px;text-align: center;' title='"+rccList[i].PROLEPSIS_END_DATE+"'>"+rccList[i].PROLEPSIS_END_DATE+"<input type='hidden' id='PROLEPSIS_END_DATE"+rccList[i].ID+"' value='"+rccList[i].PROLEPSIS_END_DATE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:185px;text-align: center;' title='"+rccList[i].TPPB_PLAN_DELIVERY_DATE+"'>"+rccList[i].TPPB_PLAN_DELIVERY_DATE+"<input type='hidden' id='TPPB_PLAN_DELIVERY_DATE"+rccList[i].ID+"' value='"+rccList[i].TPPB_PLAN_DELIVERY_DATE+"'/></td>");
								
								trCount++;
                	   }
                	}
                		pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						
	               
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	       })
        	
        	
	   }
	   	    //点击行寄选中该行
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
	   function getAllPo(){
		if($("#po_list_cb").attr("checked")=="checked"){
			$("#poInfoTbody :checkbox").attr("checked",true);
		}else{
			$("#poInfoTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 	
	//保存回填值
	function addPack(){
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
            var dataIds="";//
            var PROJECT_ID ="";//
            var PROJECT_STEP ="";//
            var PRODUCT_COUNT ="";//
            var CST_STANDARD_TIME ="";//
            var PRODUCT_MATERIAL ="";//
            var PRODUCT_NAME ="";//
            var PROLEPSIS_START_DATE ="";//
            var PROLEPSIS_END_DATE ="";//
            var TPPB_PLAN_DELIVERY_DATE ="";//
            var projectList=[];
            if($("#poInfoTbody :checkbox[checked='checked']").length<=0){
                utilsFp.confirmIcon(1,"","","","<dict:lang value='请选择一条记录！'/>",0,"260","");
                return;
            }
            $("#poInfoTbody :checkbox").each(function(){
			if($(this).attr("checked")){
					if (!$("#trr"+$(this).attr("id")).length) {
					projectList.push({
					    PROJECT_ID:$("#PROJECT_ID"+$(this).attr("id")).val(),
					    PROJECT_STEP:$("#PROJECT_STEP"+$(this).attr("id")).val(),
					    PRODUCT_COUNT:$("#PRODUCT_COUNT"+$(this).attr("id")).val(),
					    CST_STANDARD_TIME:$("#CST_STANDARD_TIME"+$(this).attr("id")).val(),
					    PRODUCT_MATERIAL:$("#PRODUCT_MATERIAL"+$(this).attr("id")).val(),
					    PRODUCT_NAME:$("#PRODUCT_NAME"+$(this).attr("id")).val(),
					    PROLEPSIS_END_DATE:$("#PROLEPSIS_END_DATE"+$(this).attr("id")).val(),
					    PROLEPSIS_START_DATE:$("#PROLEPSIS_START_DATE"+$(this).attr("id")).val(),
					    TPPB_PLAN_DELIVERY_DATE:$("#TPPB_PLAN_DELIVERY_DATE"+$(this).attr("id")).val(),
					});
						/*
						if(dataIds==""){
						    dataIds=dataIds+$("#QII_ITEM_TYPE"+$(this).attr("id")).val();
						}else{
						    dataIds = dataIds + ","+ $("#QII_ITEM_TYPE"+$(this).attr("id")).val();
						}
						if(PROJECT_ID==""){
						    PROJECT_ID=PROJECT_ID+$("#PROJECT_ID"+$(this).attr("id")).val();
						}else{
						    PROJECT_ID = PROJECT_ID + ","+ $("#PROJECT_ID"+$(this).attr("id")).val();
						}
					    if(PROJECT_STEP==""){
						    PROJECT_STEP=PROJECT_STEP+$("#PROJECT_STEP"+$(this).attr("id")).val();
						}else{
						    PROJECT_STEP = PROJECT_STEP + ","+ $("#PROJECT_STEP"+$(this).attr("id")).val();
						}
					    if(PRODUCT_COUNT==""){
						    PRODUCT_COUNT=PRODUCT_COUNT+$("#PRODUCT_COUNT"+$(this).attr("id")).val();
						}else{
						    PRODUCT_COUNT = PRODUCT_COUNT + ","+ $("#PRODUCT_COUNT"+$(this).attr("id")).val();
						}
				        if(CST_STANDARD_TIME==""){
						    CST_STANDARD_TIME=CST_STANDARD_TIME+$("#CST_STANDARD_TIME"+$(this).attr("id")).val();
						}else{
						    CST_STANDARD_TIME = CST_STANDARD_TIME + ","+ $("#CST_STANDARD_TIME"+$(this).attr("id")).val();
						}
					    if(PRODUCT_MATERIAL==""){
						    PRODUCT_MATERIAL=PRODUCT_MATERIAL+$("#PRODUCT_MATERIAL"+$(this).attr("id")).val();
						}else{
						    PRODUCT_MATERIAL = PRODUCT_MATERIAL + ","+ $("#PRODUCT_MATERIAL"+$(this).attr("id")).val();
						}
				        if(PRODUCT_NAME==""){
						    PRODUCT_NAME=PRODUCT_NAME+$("#PRODUCT_NAME"+$(this).attr("id")).val();
						}else{
						    PRODUCT_NAME = PRODUCT_NAME + ","+ $("#PRODUCT_NAME"+$(this).attr("id")).val();
						}
					    if(PROLEPSIS_END_DATE==""){
						    PROLEPSIS_END_DATE=PROLEPSIS_END_DATE+$("#PROLEPSIS_END_DATE"+$(this).attr("id")).val();
						}else{
						    PROLEPSIS_END_DATE = PROLEPSIS_END_DATE + ","+ $("#PROLEPSIS_END_DATE"+$(this).attr("id")).val();
						}
						if(PROLEPSIS_START_DATE==""){
						    PROLEPSIS_START_DATE=PROLEPSIS_START_DATE+$("#PROLEPSIS_START_DATE"+$(this).attr("id")).val();
						}else{
						    PROLEPSIS_START_DATE = PROLEPSIS_START_DATE + ","+ $("#PROLEPSIS_START_DATE"+$(this).attr("id")).val();
						}
						if(TPPB_PLAN_DELIVERY_DATE==""){
						    TPPB_PLAN_DELIVERY_DATE=TPPB_PLAN_DELIVERY_DATE+$("#TPPB_PLAN_DELIVERY_DATE"+$(this).attr("id")).val();
						}else{
						    TPPB_PLAN_DELIVERY_DATE = TPPB_PLAN_DELIVERY_DATE + ","+ $("#TPPB_PLAN_DELIVERY_DATE"+$(this).attr("id")).val();
						}
						*/
				}
			}
			
			
	})
	        parentWindow.$("#projectList").val(JSON.stringify(projectList));
	        parentWindow.addProjectCallBack();
	         /*
             parentWindow.$("#dataIds").val(dataIds);
             parentWindow.$("#PROJECT_ID").val(PROJECT_ID);
             parentWindow.$("#PROJECT_STEP").val(PROJECT_STEP);
             parentWindow.$("#PRODUCT_COUNT").val(PRODUCT_COUNT);
             parentWindow.$("#CST_STANDARD_TIME").val(CST_STANDARD_TIME);
             parentWindow.$("#PRODUCT_MATERIAL").val(PRODUCT_MATERIAL);
             parentWindow.$("#PRODUCT_NAME").val(PRODUCT_NAME);
             parentWindow.$("#PROLEPSIS_START_DATE").val(PROLEPSIS_START_DATE);
             parentWindow.$("#PROLEPSIS_END_DATE").val(PROLEPSIS_END_DATE);
             parentWindow.$("#TPPB_PLAN_DELIVERY_DATE").val(TPPB_PLAN_DELIVERY_DATE);
            */
           
            
            closeCurrentWindow();
	}
 //选中所有记录
 function getAllItems(){
	 try{
		 var isChecked=$("#allSelects").attr("checked")=="checked"?true:false;
		 $("#poInfoTbody :checkbox").each(function(){
			$(this).attr("checked",isChecked);
		});
	 }
	 catch(error){
       console.error(error);
	 }
 }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.datagrid-header-inner');
   // setPopScroll('.scroll');
  })
})(jQuery)</script>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
</body>

<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->

