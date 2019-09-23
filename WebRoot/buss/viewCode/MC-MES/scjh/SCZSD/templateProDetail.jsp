<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
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
	<style>
	    	.ssss{
	    	    width:30px!important;
	    	}
	
	</style>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
			<!-- head里面 -->
  <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="b23d17c37f2a4922a978579833073e98" type="edit" />
	<div class="mod">
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="基本信息" /></h3>
			</div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="b23d17c37f2a4922a978579833073e98" />
	<input type="hidden" id="prefixInd" name="b23d17c37f2a4922a978579833073e98" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<s:set name="_$viewId" value="'65a40545b2ae44fa87c24f0d152380b1'" />
		<s:set name="_$formId_1" value="'b23d17c37f2a4922a978579833073e98'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name"  style="width: 20px;" /><span class="dot">*</span><bu:uitn colNo="CTP_TEMPLATE_NAME" formId="b23d17c37f2a4922a978579833073e98" /></td>
			<bu:td cssClass="dec"  style="width: 200px;" colNo="CTP_TEMPLATE_NAME" formId="b23d17c37f2a4922a978579833073e98" ><bu:ui colNo="CTP_TEMPLATE_NAME" formId="b23d17c37f2a4922a978579833073e98" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	
	<div class="mod-hd">
				<h3 class="tit"><dict:lang value="检查项目" /></h3>
				<div class="extend-btn" id="addDel" style="display:none;float: right;margin-top:5px;margin-bottom:5px;">
    				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="">
    					<i class="ico ico-kl-new-add ico-small"></i>
    				</button>
    				<button type="button" onclick="delRow();" style="padding:0" title="删除">
    					<i class="ico ico-sc-new-add ico-small"></i>
    				</button>
    			</div>
			</div>
			
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner head3" >
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell ssss" style="width:30px;"></td>
											
												<td class="datagrid-cell" style="width:150px;" >
													<dict:lang value="项目编码" />
												</td>
												<td class="datagrid-cell" style="width:150px;" >
													<dict:lang value="项目名称" />
												</td>
												<td class="datagrid-cell" style="width:150px;" >
													<dict:lang value="项目类型" />
												</td>
												<td class="datagrid-cell" style="width:150px;" >
													<dict:lang value="生产阶别" />
												</td>

												<td class="datagrid-cell" style="width:280px;" >
													<dict:lang value="影响因素" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll  scroll3" style="height:300px;">
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

		</div>
			<bu:jsVal formId="b23d17c37f2a4922a978579833073e98" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_11" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
        var trrCount = 0;
        $(function(){
            $("#SREACH_PRO_NAME").removeAttr("disabled");
            getItem();
            
        })
        
		
        	
    	function getItem(){ 
		//console.log(itemUrl);
		var templateName=$("#paraMapObj_CTP_TEMPLATE_NAME").val();
		var dataId ='${dataId}';
		var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=6fd0aa7fc9a84dc99b18894c33f8a376";
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: itemUrl,
		    	data:{
		    	   "templateName":templateName ,
		    	   "dataId":dataId
		    	},
				success: function(data){
		        	$("#addItemInfo").empty();
					util.closeLoading();
					console.log(data);
					if(null == data){return ;}
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						for(var i=0;i<rccList.length;i++){
							if(rccList[i].CO_PROJECT_CODE==null) rccList[i].CO_PROJECT_CODE="";
							if(rccList[i].CO_PROJECT_NAME==null) rccList[i].CO_PROJECT_NAME="";
							if(rccList[i].CO_PROJECT_TYPE==null) rccList[i].CO_PROJECT_TYPE="";
							if(rccList[i].PROJECT_TYPE_NAME==null) rccList[i].PROJECT_TYPE_NAME="";
							if(rccList[i].CO_DEFAULT==null) rccList[i].CO_DEFAULT="N";
							if(rccList[i].CO_AFFECT_INFO==null) rccList[i].CO_AFFECT_INFO="";
							if(rccList[i].AFFECT_INFO_NAME==null) rccList[i].AFFECT_INFO_NAME="";
							if(rccList[i].CO_STATE==null) rccList[i].CO_STATE="";
							if(rccList[i].PRODUCT_STEP==null) rccList[i].PRODUCT_STEP="";
							var tempFlag="";
							if(rccList[i].CO_DEFAULT=='Y') tempFlag="<img src='plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
							if(rccList[i].CO_DEFAULT=='N') tempFlag="<img src='plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
							
						    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell ' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell ' style='width:150px;text-align: left;' title='"+rccList[i].CO_PROJECT_CODE+"'>" + rccList[i].CO_PROJECT_CODE + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell ' style='width:150px;text-align: left;' title='"+rccList[i].CO_PROJECT_NAME+"' >" + rccList[i].CO_PROJECT_NAME + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell ' style='width:150px;text-align: left;' title='"+rccList[i].PROJECT_TYPE_NAME+"'>" + rccList[i].PROJECT_TYPE_NAME + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell ' style='width:150px;text-align: left;' title='"+rccList[i].PRODUCT_STEP+"'>" + rccList[i].PRODUCT_STEP + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell ' style='width:280px;text-align: left;' title='"+rccList[i].CO_AFFECT_INFO+"'>" + rccList[i].CO_AFFECT_INFO + "</td>");
        				
    		
						}	
					

					}
				  						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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
   setPopScroll('.scroll3','.head3');
   setPopScroll('.scroll1','.datagrid-header-inner1');
   setPopScroll('.scroll2','.datagrid-header-inner2');
   defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
