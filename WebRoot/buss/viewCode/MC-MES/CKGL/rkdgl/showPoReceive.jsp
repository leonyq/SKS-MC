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
    	#addSecondItemDetail .chosen-container {
    	    position: initial
    	}
    	#addItemInfo .chosen-container {
    	    position: initial
    	}
	</style>
 <script type="text/javascript">
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
		/*
		if(tag=="tag1"){
			listAjaxTable("2f1adeb396c4403b8fea545ec6317938");
			$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
			searchItemDetail();
			$("#allSelect1").removeAttr("checked");
		}
		*/
	}
$(function(){
	$("#tag1").addClass("current");
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
})

</script>
			<!-- head里面 -->
  
<style type="text/css">
#myTable .input {
	width:200px !important;
}
</style>
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;height:600px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="7b5230d9dda44e8cadb18aa7137d1aa4" type="edit" />
<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="基本信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="单据明细" /></SPAN> </A>
								</LI>
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" id="myTable">
	<input type="hidden" name="formIds" value="7b5230d9dda44e8cadb18aa7137d1aa4" />
	<input type="hidden" name="formId" id="formId2" value='7b5230d9dda44e8cadb18aa7137d1a05'/>
	<input type="hidden" name="7b5230d9dda44e8cadb18aa7137d1aa4" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1c07076fe0c04f47902c3962278b72f6'" />
		<s:set name="_$formId_1" value="'7b5230d9dda44e8cadb18aa7137d1aa4'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="WRI_DOC_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="WRI_DOC_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="WRI_DOC_NUM" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T6#WDT_TYPE_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T6#WDT_TYPE_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T6#WDT_TYPE_NAME" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T7#WDO_DISPATCH_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="T7#WDO_DISPATCH_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T7#WDO_DISPATCH_NAME" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T2#WPD_DELIVERY_DATE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WPD_DELIVERY_DATE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T2#WPD_DELIVERY_DATE" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WRD_URGENT_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WRD_URGENT_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" >
			<bu:ui colNo="T2#WRD_URGENT_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" />
			<bu:uitn colNo="T2#WRD_ERP_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" />
			<bu:ui colNo="T2#WRD_ERP_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" />
			</bu:td>
			
			<td class="name" /><bu:uitn colNo="T3#SUPPLIER_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T3#SUPPLIER_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T3#SUPPLIER_NAME" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WRD_STATUS" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="WRD_STATUS" formId="7b5230d9dda44e8cadb18aa7137d1aa4"><input type="text" id="myState" class="input isSubmit" readonly="readonly"></bu:td>
			
			<td class="name" /><bu:uitn colNo="T4#NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T4#NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T4#NAME" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WRD_CREATE_TIME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WRD_CREATE_TIME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T2#WRD_CREATE_TIME" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr style="display:none;">
			<td class="name" /><bu:uitn colNo="WRD_STATUS" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="WRD_STATUS" formId="7b5230d9dda44e8cadb18aa7137d1aa4"><bu:ui colNo="WRD_STATUS" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="T2#WRD_MEMO" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WRD_MEMO" formId="7b5230d9dda44e8cadb18aa7137d1aa4" style="height:80px;" colspan="5"><bu:ui colNo="T2#WRD_MEMO" style="width:100%;height:100%" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
	</table>
	 </div>
	<DIV id="content2" style="display:none" data-tab="tag2">
		
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:500px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner" style="width:100%;" id="datagrid-header-inner1">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1a05">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" disabled="disabled"/>
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="计划数量" /></td >
										<td class="datagrid-cell" style="width:102px;" ><dict:lang value="标准包装数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="接收数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="赠品数量" /></td >
										<td class="datagrid-cell" style="width:70px;"><dict:lang value="项次" /></td>
										<td class="datagrid-cell" style="width:160px;"><dict:lang value="采购单号" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="仓库" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="交货日期" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="生产批号" /></td>
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="生产日期" /></td>
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:430px;">
							<table class="datagrid-htable fixedTable  dlist-table table-line" style="table-layout:fixed;"  id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
</div>
	<div id="backItem" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:870px;height:410px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择物料" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:120%;">
					<div class="optn optn_div">
			        <button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchItemInfo('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" /><dict:lang value="物料料号"/></td>
					<td class="dec"><input type="text" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
			    	</tr>
			    	</table>
			    	<div style="width:870px;height:35px;">  
			    	<table  width="870px" class="dlist-table table-line " >
						<thead>
						<tr>
			    			<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="物料料号" /></th>
							<th style="width: 180px;text-align: center;"><dict:lang value="物料名称" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="物料规格" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="供应商" /></th>
							<th style="text-align: center;"><dict:lang value="物料类型" /></th>	
						</tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:870px;height:310px;overflow-y: auto;overflow-x: hidden;" >  
			    	<table width="870px" style="table-layout:fixed" class="dlist-table table-line " id="itemTable">
			    	<tbody id="itemTbody">
		                </tbody>
				
				</table>

				</div>
				<div style="background-color: white;margin-top:20px;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
	<div id="backPoInfo" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addPoInfo" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:870px;height:410px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择采购单" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addPoInfo','addPoInfo');"></a>
				<div class="dialog-bd-div" style="width:100%;height:120%;">
					<div class="optn optn_div">
					
					<span class="txt" title="等于">开单时间</span>
					
					<input id="beginTime" name="" value="" style="width:200px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly">
					
					<span class="txt">~</span>
					<input id="endTime" name="" value="" style="width:200px;margin-right:145px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly">
					
      					
			        <button type="button" onclick="addPoInfoList('addPoInfo','addPoInfo');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv1('addPoInfo','addPoInfo');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchPoInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
		    		<td class="name" /><dict:lang value="采购单号"/></td>
					<td class="dec"><input type="text" id="poCode" name="poCode" class=" input isSubmit isaddSubmit"/></td>
					<td class="name" /><dict:lang value="物料料号"/></td>
					<td class="dec"><input type="text" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
			    	</tr>
			    	</table>
			    	<div style="width:870px;height:35px;">  
			    	<table  width="870px" class="dlist-table table-line " >
						<thead>
						<tr>
			    			<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="po_list_cb"  onchange="getAllPo();" /></th>
							<th style="width: 140px;text-align: center;"><dict:lang value="采购单号" /></th>
							<th style="width: 140px;text-align: center;"><dict:lang value="物料料号" /></th>
							<th style="width: 60px;text-align: center;"><dict:lang value="项次" /></th>
							<th style="width: 130px;text-align: center;"><dict:lang value="物料名称" /></th>
							<th style="width: 130px;text-align: center;"><dict:lang value="物料规格" /></th>
							<th style="width: 130px;text-align: center;"><dict:lang value="供应商" /></th>
							<th style="text-align: center;"><dict:lang value="计划数量" /></th>	
						</tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:870px;height:310px;overflow-y: auto;overflow-x: hidden;" >  
			    	<table width="870px" style="table-layout:fixed" class="dlist-table table-line " id="poInfoTable">
			    	<tbody id="poInfoTbody">
		                </tbody>
				
				</table>

				</div>
				<div style="background-color: white;margin-top:20px;" id="pageDiv1">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchPoInfo&formId=formId2&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
			<bu:jsVal formId="7b5230d9dda44e8cadb18aa7137d1aa4" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
	var tempState = $("#paraMapObj_WRD_STATUS").val();
	if(tempState==1){
		$("#myState").val("开立");
	}else if(tempState==2){
		$("#myState").val("操作中");
	}else if(tempState==3){
		$("#myState").val("关结");
	}
	getWmsSel();
	$('.dialog-bd',parent.document).css('background-color','#fff');
	
})
var trrCount=0;
//根据入库单号获取对应物料信息
//+$("#paraMapObj_WRI_DOC_NUM").val()+"&trDataAuth=${param.trDataAuth}"
function getItem(){
	util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=4df28c380ad54dcf81f10de621ea220f",//VM-采购入库管理-修改 操作功能 ajax回填入库物料信息
			    data: {
			        "docNum":$("#paraMapObj_WRI_DOC_NUM").val(),
                    "trDataAuth":"${param.trDataAuth}"
			    },
				success: function(data){
				                 $("#addItemInfo").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WRI_PLAN_NUM==null) rccList[i].WRI_PLAN_NUM="";
								if(rccList[i].WRI_GIFT_NUM==null) rccList[i].WRI_GIFT_NUM="";
								if(rccList[i].WRI_LOT_NO==null) rccList[i].WRI_LOT_NO="";
								if(rccList[i].DELIVERY_DATE==null) rccList[i].DELIVERY_DATE="";
								if(rccList[i].PRODUCE_DATE==null) rccList[i].PRODUCE_DATE="";
								if(rccList[i].WRI_CONNECT_DOC==null) rccList[i].WRI_CONNECT_DOC="";
								if(rccList[i].WRI_RECEIVE_NUM==null) rccList[i].WRI_RECEIVE_NUM="";
								var wmsSel = "<select id='wmsSel_"+(trrCount+1)+"' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;' disabled='disabled' >"+ wmsOption +"</select>";//disabled='disabled'
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tbody:last").append("<tr id='trr"+(trrCount+1)+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'  disabled='disabled'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].WRI_ITEM_CODE+"<input type='hidden' class='CI_ITEM_CODE' name='CI_ITEM_CODE' value='"+rccList[i].WRI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='PLAN_NUM_"+(trrCount+1)+"' name='PLAN_NUM' value='"+rccList[i].WRI_PLAN_NUM+"' readonly='readonly'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='CI_MIN_PACK_"+(trrCount+1)+"' name='MIN_PACK' value='"+rccList[i].WRI_PACK_NUM+"' readonly='readonly'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:102px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='WRI_RECEIVE_NUM_"+(trrCount+1)+"' name='WRI_RECEIVE_NUM' value='"+rccList[i].WRI_RECEIVE_NUM+"' readonly='readonly'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 100%;padding:0;text-align: right;' class=' input isSubmit' id='GIFT_NUM_"+(trrCount+1)+"' name='GIFT_NUM' value='"+rccList[i].WRI_GIFT_NUM+"' readonly='readonly'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:70px;text-align: center;padding:0;'><input type='text' style='width: 70px;padding:0;text-align: right;' class=' input isSubmit' id='ITEM_SEQ_"+(trrCount+1)+"' name='ITEM_SEQ' value='"+rccList[i].WRI_ITEM_SEQ+"' readonly='readonly'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:160px;text-align: center;padding:0;'><input type='text' style='width: 160px;padding:0;' class=' input isSubmit' id='WPI_PO_"+(trrCount+1)+"' name='WPI_PO' value='"+rccList[i].WRI_CONNECT_DOC+"' readonly='readonly'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;padding:0;'>"+wmsSel+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;text-align: center;padding:0;'><input style='width: 120px;padding:0;' name='WRI_DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+rccList[i].DELIVERY_DATE+"'  disabled='disabled'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:120px;text-align: center;padding:0;'><input type='text' class=' input isSubmit' style='width: 120px;padding:0;text-align: right;' id='WRI_LOT_NO_"+(trrCount+1)+"' name='WRI_LOT_NO' value='"+rccList[i].WRI_LOT_NO+"' readonly='readonly'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:150px;text-align: center;padding:0;'><input style='width: 100%;padding:0;' name='WRI_PRODUCE_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+rccList[i].PRODUCE_DATE+"'  disabled='disabled'/></td>");
								setChosen();//设置下拉框样式
								$("#wmsSel_"+(trrCount+1)).val(rccList[i].WRI_WH_CODE);
								$("#wmsSel_"+(trrCount+1)).trigger("chosen:updated");
								$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
						
								trrCount++;
					
							}
							
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a05 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemInfo');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1aa4');
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
var wmsOption;
//获取仓库信息
function getWmsSel(){
		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=22d8b5e68fb84cabadff3d45e674c625",//VM-采购入库管理-新增 操作功能 加载仓库信息
			    data: {
			        "trDataAuth":"${param.trDataAuth}"
			    },
				success: function(data){
						//console.log(data.ajaxMap.samplList);
						wmsOption = "<option value=''>--请选择--</option>";
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i = 0;i < rccList.length; i++){
								wmsOption = wmsOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
						}
						getItem();
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
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 
