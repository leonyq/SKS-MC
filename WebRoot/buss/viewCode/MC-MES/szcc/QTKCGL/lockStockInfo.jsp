<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="齐套信息" />
    </title>
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
		<bu:header formId ="7d3186a8e1c648ffa7faa54929b521b0"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="9f705c108ecf406bb0c489118a410482" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="9f705c108ecf406bb0c489118a410482" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage7d3186a8e1c648ffa7faa54929b521b0" id="formPage7d3186a8e1c648ffa7faa54929b521b0" value="${formPage7d3186a8e1c648ffa7faa54929b521b0}"/>
		<input type="hidden" name="formId" id="formId1" value='7d3186a8e1c648ffa7faa54929b521b0'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="7d3186a8e1c648ffa7faa54929b521b0">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax7d3186a8e1c648ffa7faa54929b521b0" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head" id="datagrid-header-inner7d3186a8e1c648ffa7faa54929b521b0">
		<bu:table cssClass="datagrid-htable fixedTable  datagrid-div6 datagrid-htable-kz" id="datagrid-htable7d3186a8e1c648ffa7faa54929b521b0">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="7d3186a8e1c648ffa7faa54929b521b0" i18n="1"/></td>
			<td class="datagrid-cell"style="width:120px; text-align:center;">物料代码</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">总需求数量</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">仓库数量</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">第1天</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">第2天</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">第3天</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">第4天</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">第5天</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">第6天</td>
			<td class="datagrid-cell"style="width:70px; text-align:center;">第7天</td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDiv7d3186a8e1c648ffa7faa54929b521b0" onscroll="ajaxTableScroll(this,'7d3186a8e1c648ffa7faa54929b521b0')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0">
		<tbody id="tbody_7d3186a8e1c648ffa7faa54929b521b0" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage7d3186a8e1c648ffa7faa54929b521b0==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTables&formId=7d3186a8e1c648ffa7faa54929b521b0&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="9f705c108ecf406bb0c489118a410482" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="9f705c108ecf406bb0c489118a410482" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>

<%--生成异步表格--%>
function createTableModel(ms,formId){
//loadItem();
}
</script>
<script type="text/javascript">
//查询
function query(thisObj){
    var formId = $("#formId1").val();
    listAjaxTables(formId);
 // loadItem();
    
}


//加载物料信息
function loadItems(){
	var dataAuth = $("#DATA_AUTH").val();
	var boomId =$("#PROJECT_ID_SHOW").val();
	var dayProduct = $.trim($("#DAY_PRODUCTER_NUM").val());
	var days = $("#DAYS").val();
	if(dayProduct!=''&&parseInt(dayProduct)!=dayProduct){
       utilsFp.confirmIcon(3,"","","", "每日产量应为整数",0,"260","");
       return;
    }
    if(days!=''&&parseInt(days)!=days){
    console.log(days)
       utilsFp.confirmIcon(3,"","","", "天数应为整数",0,"260","");
       return;
    }
	                                                             //97e1c2a9aae141a382ed5169e922a2ba
	var loadCollectUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=97e1c2a9aae141a382ed5169e922a2ba";
	console.log(999)
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
		dataType: "json",
		url: loadCollectUrl,
		data: "paraMap.boomId=" + boomId,
		success: function(data){
			util.closeLoading();
			$("#tbody_7d3186a8e1c648ffa7faa54929b521b0").empty();
			if(null != data.ajaxPage.dataList){
				var rccList = eval(data.ajaxPage.dataList);
					console.log(rccList);
				for(var i = 0;i < rccList.length; i++){
					var tempStatus = "";
					if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";

					$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
					$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
					//$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-5'  style='width:120px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'>"+rccList[i].ITEM_CODE+"</td>");
					$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: left;' title='"+rccList[i].TOTAL_NUM+"'>"+rccList[i].TOTAL_NUM+"</td>");
					$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:70px;text-align: left;' title='"+rccList[i].TOTAL_ITEM_NUM+"'>"+rccList[i].TOTAL_ITEM_NUM+"</td>");
					var itemNum = rccList[i].TOTAL_ITEM_NUM > rccList[i].TOTAL_NUM?rccList[i].TOTAL_NUM:rccList[i].TOTAL_ITEM_NUM;//可用数量
					var usefulDays = 0;
					var dayNum = 0;
					var remainder = 0;
					if(days > 0){
					    if (dayProduct > 0){
					        usefulDays = parseInt(itemNum/dayProduct)<days?parseInt(itemNum/dayProduct):days;
					        usefulDays = usefulDays > 7?7:usefulDays;
					        dayNum = dayProduct;
					        remainder = (parseInt(itemNum/dayProduct)<days&&days<=7)?itemNum%dayProduct:0;
					    }else{
					        usefulDays = days<7?days:7;
					        dayNum = parseInt(itemNum/days);
					        remainder = days<7?itemNum%days:0;
					    }
					}else{
					    if(dayProduct > 0){
					        usefulDays = parseInt(itemNum/dayProduct)<=7?parseInt(itemNum/dayProduct):7;
					        dayNum = dayProduct;
					        remainder = usefulDays<7?itemNum%dayProduct:0;
					    }else{
					        usefulDays = 7;
					        dayNum = parseInt(itemNum/7);
					        remainder = 0;
					    }
					}
					
					for (var k =0; k<usefulDays;k++){
					    $("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: left;' title='"+dayNum+"'>"+dayNum+"</td>"); 
					}
					
					if (remainder > 0){
					    $("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;background-color:#e0000077; text-align: left;' title='"+remainder+"'>"+remainder+"</td>");
					    usefulDays = (usefulDays+1)>7?7:(usefulDays+1);
					}
					for (var j =0;j<(7-usefulDays);j++){
					    $("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;background-color:#e00000b9; text-align: left;' ></td>"); 
					}
					
					
				}
			}
                            defTableWidthRewrite("7d3186a8e1c648ffa7faa54929b521b0");
			    			pageFun(data.ajaxPage,"7d3186a8e1c648ffa7faa54929b521b0");
				//var tableTrJs = $("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tbody tr");
		       // _tongLineColor(tableTrJs);
			//	clickTr('datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0');

						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

var paginationImpl = {};

 function firstLoadThisPage(formId){
    if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
        return true;
    }
    return false;
}

//加载分页信息
	function listAjaxTables(paginationImpl) {
	var loadCollectUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=97e1c2a9aae141a382ed5169e922a2ba";
		//var url = "${path}buss/bussModel_exeFunc.ms?funcMId=97e1c2a9aae141a382ed5169e922a2ba";
		util.showLoading("处理中...");
		var dataAuth = $("#DATA_AUTH").val();
    	var boomId =$("#PROJECT_ID_SHOW").val();
    	var dayProduct = $.trim($("#DAY_PRODUCTER_NUM").val());
    	var days = $("#DAYS").val();
    	if(dayProduct!=''&&parseInt(dayProduct)!=dayProduct){
           utilsFp.confirmIcon(3,"","","", "每日产量应为整数",0,"260","");
           return;
        }
        if(days!=''&&parseInt(days)!=days){
        console.log(days)
           utilsFp.confirmIcon(3,"","","", "天数应为整数",0,"260","");
           return;
        }
        
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		$.ajax({
			type: "POST",
			dataType: "json",
			url: loadCollectUrl,
			data: "paraMap.boomId=" + boomId + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			success: function(data) {
				util.closeLoading();
				$("#tbody_7d3186a8e1c648ffa7faa54929b521b0").empty();
				if(null != data.ajaxPage.dataList){
					var rccList = eval(data.ajaxPage.dataList);
					//	console.log(rccList);
					for(var i = 0;i < rccList.length; i++){
						var tempStatus = "";
						if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";

						$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
						$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
						//$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
						$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;' title='"+rccList[i].ITEM_CODE+"'>"+rccList[i].ITEM_CODE+"</td>");
						$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;' title='"+rccList[i].TOTAL_NUM+"'>"+rccList[i].TOTAL_NUM+"</td>");
						$("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;' title='"+rccList[i].TOTAL_ITEM_NUM+"'>"+rccList[i].TOTAL_ITEM_NUM+"</td>");
						var itemNum = rccList[i].TOTAL_ITEM_NUM > rccList[i].TOTAL_NUM?rccList[i].TOTAL_NUM:rccList[i].TOTAL_ITEM_NUM;//可用数量
						var usefulDays = 0;
						var dayNum = 0;
						var remainder = 0;
						if(days > 0){
						    if (dayProduct > 0){
						        usefulDays = parseInt(itemNum/dayProduct)<days?parseInt(itemNum/dayProduct):days;
						        usefulDays = usefulDays > 7?7:usefulDays;
						        dayNum = dayProduct;
						        remainder = (parseInt(itemNum/dayProduct)<days&&days<=7)?itemNum%dayProduct:0;
						    }else{
						        usefulDays = days<7?days:7;
						        dayNum = parseInt(itemNum/days);
						        remainder = days<7?itemNum%days:0;
						    }
						}else{
						    if(dayProduct > 0){
						        usefulDays = parseInt(itemNum/dayProduct)<=7?parseInt(itemNum/dayProduct):7;
						        dayNum = dayProduct;
						        remainder = usefulDays<7?itemNum%dayProduct:0;
						    }else{
						        usefulDays = 7;
						        dayNum = parseInt(itemNum/7);
						        remainder = 0;
						    }
						}
						
						for (var k =0; k<usefulDays;k++){
						    $("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: left;' title='"+dayNum+"'>"+dayNum+"</td>"); 
						}
						
						if (remainder > 0){
						    $("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='background-color:#e0000077; text-align: left;' title='"+remainder+"'>"+remainder+"</td>");
						    usefulDays = (usefulDays+1)>7?7:(usefulDays+1);
						}
						for (var j =0;j<(7-usefulDays);j++){
						    $("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='background-color:#e00000b9; text-align: left;' ></td>"); 
						}
						
						
					}
				}
                    defTableWidthRewrite("7d3186a8e1c648ffa7faa54929b521b0");
	    			pageFun(data.ajaxPage,"7d3186a8e1c648ffa7faa54929b521b0");
					var tableTrJs = $("#datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0 tbody tr");
			        _tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax7d3186a8e1c648ffa7faa54929b521b0');

			},
			error: function(msg) {
				util.closeLoading();
				utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
			}
		});
	}

 function init(){
    if($(".leftTable-ajax").length>0){
        $(".leftTable-ajax").show();
    };
    getFormIdInitChildPage();
    initTableWidth();
//	listAjaxTable($("#formId1").val());
    loadItems();
 }

			
</script>

<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
  })
})(jQuery)</script>

<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
