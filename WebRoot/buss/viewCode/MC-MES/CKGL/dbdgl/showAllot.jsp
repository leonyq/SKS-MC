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
			<div class="bd" style="border: none;height:500px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="4f273d714d9544149f34e2d6d7ff9b4a" type="edit" />
		<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
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
	<table class="basic-table"  id="myTable">
	<input type="hidden" name="formIds" value="4f273d714d9544149f34e2d6d7ff9b4a" />
	<input type="hidden" name="4f273d714d9544149f34e2d6d7ff9b4a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c1e97d8ada944efcbb6682eedba3f01b'" />
		<s:set name="_$formId_1" value="'4f273d714d9544149f34e2d6d7ff9b4a'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="WAI_DOC_NUM" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="WAI_DOC_NUM" formId="4f273d714d9544149f34e2d6d7ff9b4a" ><bu:ui colNo="WAI_DOC_NUM" style="width:200px;" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T4#WDT_TYPE_NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="T4#WDT_TYPE_NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" ><bu:ui colNo="T4#WDT_TYPE_NAME" style="width:200px;" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T5#WDO_DISPATCH_NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" style="width:300px;" colNo="T5#WDO_DISPATCH_NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" ><bu:ui colNo="T5#WDO_DISPATCH_NAME" style="width:300px;" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T2#WAD_ALLOT_DATE" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="T2#WAD_ALLOT_DATE" formId="4f273d714d9544149f34e2d6d7ff9b4a" ><bu:ui colNo="T2#WAD_ALLOT_DATE" style="width:200px;" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T3#NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="T3#NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" ><bu:ui colNo="T3#NAME" style="width:200px;" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WAD_URGENT_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="T2#WAD_URGENT_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" >
			<bu:ui colNo="T2#WAD_URGENT_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" />
			<bu:uitn colNo="T2#WAD_OUTSTOCK_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" />
			<bu:ui colNo="T2#WAD_OUTSTOCK_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" />
			<bu:uitn colNo="T2#WAD_ERP_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" />
			<bu:ui colNo="T2#WAD_ERP_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" />
			</bu:td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WAD_STATUS" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="WAD_STATUS" formId="4f273d714d9544149f34e2d6d7ff9b4a"><input type="text" id="myState" class="input isSubmit" readonly="readonly"></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WAD_CREATE_TIME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="T2#WAD_CREATE_TIME" formId="4f273d714d9544149f34e2d6d7ff9b4a" ><bu:ui colNo="T2#WAD_CREATE_TIME" style="width:200px;" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr style="display:none;">
			<td class="name" /><bu:uitn colNo="WAD_STATUS" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="WAD_STATUS" formId="4f273d714d9544149f34e2d6d7ff9b4a"><bu:ui colNo="WAD_STATUS" style="width:200px;" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="T2#WAD_MEMO" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<bu:td cssClass="dec" colNo="T2#WAD_MEMO" formId="4f273d714d9544149f34e2d6d7ff9b4a" style="height:80px;" colspan="5"><bu:ui colNo="T2#WAD_MEMO" style="width:100%;height:100%" formId="4f273d714d9544149f34e2d6d7ff9b4a" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
	</table>
	
        </div>
		 <DIV id="content2" style="display:none" data-tab="tag2">
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header" >
							<div class="datagrid-header-inner"  id="datagrid-header-inner1">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" disabled="disabled"/>
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="计划数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="标准包装数量" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="调入仓库" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="调出仓库" /></td>
										<td class="datagrid-cell" style="width:140px;"><dict:lang value="调拨日期" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:430px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
</div>
			<bu:jsVal formId="4f273d714d9544149f34e2d6d7ff9b4a" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
  	var tempState = $("#paraMapObj_WAD_STATUS").val();
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
//根据调拨单号获取物料信息
function getItem(){
	$("#docNum").val($("#paraMapObj_WAI_DOC_NUM").val());
	util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=5b174435d68345c3a35ac776f4aae0cb",
			    data: {
			        "docNum" : $("#paraMapObj_WAI_DOC_NUM").val()
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
								if(rccList[i].ALLOT_DATE==null) rccList[i].ALLOT_DATE="";
								if(rccList[i].WAI_PACK_NUM==null) rccList[i].WAI_PACK_NUM="";
								var wmsSel = "<select id='wmsSel_"+(trrCount+1)+"' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;' disabled='disabled'>"+ wmsOption +"</select>";
								var outSel = "<select id='outSel_"+(trrCount+1)+"' name='outSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;' disabled='disabled'>"+ wmsOption +"</select>";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='trr"+rccList[i].ITEM_ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' disabled='disabled'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].WAI_ITEM_CODE+"<input type='hidden' class='CI_ITEM_CODE' name='CI_ITEM_CODE' value='"+rccList[i].WAI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='PLAN_NUM_"+(trrCount+1)+"' name='PLAN_NUM' value='"+rccList[i].WAI_PLAN_NUM+"' readonly='readonly'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='CI_MIN_PACK_"+(trrCount+1)+"' name='MIN_PACK' value='"+rccList[i].WAI_PACK_NUM+"' readonly='readonly'/></td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;padding:0;'>"+wmsSel+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;padding:0;'>"+outSel+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:140px;text-align: center;padding:0;'><input style='width: 100%;padding:0;' name='ALLOT_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+rccList[i].ALLOT_DATE+"' disabled='disabled'/></td>");
								
								setChosen();//设置下拉框样式
								$("#wmsSel_"+(trrCount+1)).val(rccList[i].WAI_IN_WH);
								$("#outSel_"+(trrCount+1)).val(rccList[i].WAI_OUT_WH);
								$("#wmsSel_"+(trrCount+1)).trigger("chosen:updated");
								$("#outSel_"+(trrCount+1)).trigger("chosen:updated");
								$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
								$("#outSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
								trrCount++;
					
							}
							
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemInfo');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
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
			    url: "buss/bussModel_exeFunc.ms?funcMId=22d8b5e68fb84cabadff3d45e674c625",
			    data: "",
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
    setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 
