<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<style type="text/css">
.input {
	width:200px !important;
}
</style>
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
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                
                <div style="margin-left:40px;">
                
			
      			
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="冻结" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="searchTracking('formId2');" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="46a2000d9dd641acab47c18beb57b9d0" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="46a2000d9dd641acab47c18beb57b9d0" />
	<input type="hidden" id="wtSns" name="wtSns" value="" />
	<input type="hidden" id="WFI_ERROR_DOC" name="WFI_ERROR_DOC" value="" />
	<input type="hidden" id="checkLot" name="checkLot" value="" />
	<input type="hidden" name="46a2000d9dd641acab47c18beb57b9d0" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'8e8e2f1919224ad99ae861c4de5682ab'" />
		<s:set name="_$formId_1" value="'46a2000d9dd641acab47c18beb57b9d0'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="txt" title="等于"><dict:lang value="过站时间" /></span></td>
			<td class="dec" colspan="5"><input id="WT_IN_TIME_BEGIN" name="searchParaList[0]._PAGE_SEARCH_VALUE" value="" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly">
			
			<span class="txt">~</span>
			
			<input id="WT_IN_TIME_END" name="searchParaList[0]._PAGE_SEARCH_VALUE" value="" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly">
			</td>
			
		
		</tr>
		<tr style="display:none;">
		    <td class="name" /><bu:uitn colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WFI_MODEL_CODE" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WFI_MODEL_CODE" formId="3497f5c022944fd492507df10f51ab9a" ><bu:ui colNo="WFI_MODEL_CODE" formId="3497f5c022944fd492507df10f51ab9a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WFI_AREA_SN" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<bu:td cssClass="dec" colNo="WFI_AREA_SN" formId="3497f5c022944fd492507df10f51ab9a" ><bu:ui colNo="WFI_AREA_SN" formId="3497f5c022944fd492507df10f51ab9a" dataId="${dataId}" formIndex="1"/></bu:td>
			
			<!--<td class="name" /><bu:uitn colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec" colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1"/></bu:td>-->
			
			<td class="name" /><bu:uitn colNo="WT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="WT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="WT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1"/></bu:td>
			
			
			<!--
			<td class="name" /><bu:uitn colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
			-->
		</tr>
		
	</table>
	<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
	<div class="panel datagrid datagrid-div1">
	<div class="datagrid-div2 datagrid-div6 datagrid-view">
	    <div class="datagrid-header" >
			<div class="datagrid-header-inner">
		          <table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
					<tbody>
						<tr class="datagrid-header-row thcolor">
						<td class="datagrid-cell" style="width:30px;"  ></td >
						<td class="datagrid-cell" style="width:30px;" ><input type="checkbox" id="allSelect" name="allSelect"/></td >
						<td class="datagrid-cell" style="width:110px;"  ><dict:lang value="产品SN" /></td >
						<td class="datagrid-cell" style="width:130px;"  ><dict:lang value="制令单" /></td >
						<td class="datagrid-cell" style="width:110px;"  ><dict:lang value="线别" /></td >
						<td class="datagrid-cell" style="width:120px;"  ><dict:lang value="机种" /></td >
						<td class="datagrid-cell" style="width:120px;"  ><dict:lang value="机种名称" /></td >
						<td class="datagrid-cell" style="width:120px;"  ><dict:lang value="检验批" /></td >
						<td class="datagrid-cell" style="width:120px;"><dict:lang value="产品数量" /></td >
					</tr>
					</tbody>
	          </table>
	 </div>
</div>
								
							
	<div class="datagrid-body datagrid-div3 scroll" style="height:350px;">
		<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234" >
					
					<tbody id="addTracking">
					
				
					</tbody>
	</table>
	</div>
	
</div>
</div>
	<div style="background-color: white;">
		     <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchTracking&formId=formId2&showLoading=0" />
	</div>
			<bu:jsVal formId="46a2000d9dd641acab47c18beb57b9d0" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="8e8e2f1919224ad99ae861c4de5682ab" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
    var moNumber = $("#paraMapObj_CQI_MO_NUMBER").val();
		var modelCode = $("#paraMapObj_CQI_MODEL_CODE").val();
		var docNum = $("#paraMapObj_CQI_DOC_NUMBER").val();
		$("#paraMapObj_WFI_MODEL_CODE").val(modelCode);
		$("#paraMapObj_WFI_MODEL_CODE_SHOW").val(modelCode);
		var dataAuth=$("#deptLs_data_auth").val();
		var jsondata = { "moNumber": moNumber, "modelCode":modelCode,"docNum":docNum,"dataAuth":dataAuth};
	util.showLoading("处理中...");
	    var loadTracking="${path}buss/bussModel_exeFunc.ms?funcMId=b997dc32895546ce94926af102d24e36";//VM-品质异常单-产品冻结 操作功能 加载产品信息

			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadTracking,
			    data: jsondata,
				success: function(data){
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							$("#addTracking").empty();
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
			 					$("#checkLot").val(data.ajaxMap.checkLot);
								$("#addTracking").append("<tr id='"+(i+1)+"' name='"+(i+1)+"'></tr>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].WT_SN+"'/></td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 110px;' title='"+rccList[i].WT_SN+"'>"+rccList[i].WT_SN+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 130px;' title='"+rccList[i].WT_MO_NUMBER+"'>"+rccList[i].WT_MO_NUMBER+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 110px;' title='"+rccList[i].CA_NAME+"'>"+rccList[i].CA_NAME+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 120px;' title='"+rccList[i].WT_MODEL_CODE+"'>"+rccList[i].WT_MODEL_CODE+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 120px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width: 120px;' title='"+data.ajaxMap.checkLot+"'>"+data.ajaxMap.checkLot+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width: 120px;'>"+rccList[i].WT_NUM+"</td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
						var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
					},
				error: function(msg){
						if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			       }
				  }
				});
				
	$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
	});
})

        //分页查询
        var paginationImpl = {};
		function SearchTracking(paginationImpl,url){
		var isFirstLoad = firstLoadThisPage(paginationImpl);
    	 	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	 	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		var beginTime = $("#WT_IN_TIME_BEGIN").val();
		var endTime = $("#WT_IN_TIME_END").val();
		var moNumber = $("#paraMapObj_CQI_MO_NUMBER").val();
		var modelCode = $("#paraMapObj_CQI_MODEL_CODE").val();
		var docNum = $("#paraMapObj_CQI_DOC_NUMBER").val();
		var areaSn = $("#paraMapObj_WFI_AREA_SN").val();
		var wt_sn= $.trim($("#paraMapObj_WT_SN").val());
		var dataAuth=$("#deptLs_data_auth").val();
		var jsondata = { "paraMap.moNumber": moNumber, "paraMap.areaSn":areaSn,"paraMap.dataAuth":dataAuth,"paraMap.wt_sn":wt_sn,"paraMap.modelCode":modelCode,"paraMap.docNum":docNum,"paraMap.beginTime":beginTime,"paraMap.endTime":endTime,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    //data: "paraMap.moNumber="+moNumber+"&paraMap.areaSn="+areaSn+"&paraMap.wt_sn="+wt_sn+"&paraMap.modelCode="+modelCode+"&paraMap.docNum="+docNum+"&paraMap.beginTime="+beginTime+"&paraMap.endTime="+endTime+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				data:jsondata,
				success: function(data){
						util.closeLoading();
						$("#addTracking").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							//$("#addTracking").empty();
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								$("#checkLot").val(data.ajaxMap.checkLot);
								$("#addTracking").append("<tr id='"+((currentPage-1)*pageRecord+(i+1))+"' name='"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].WT_SN+"'/></td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 110px;' title='"+rccList[i].WT_SN+"'>"+rccList[i].WT_SN+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 130px;' title='"+rccList[i].WT_MO_NUMBER+"'>"+rccList[i].WT_MO_NUMBER+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 110px;' title='"+rccList[i].CA_NAME+"'>"+rccList[i].CA_NAME+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 120px;' title='"+rccList[i].WT_MODEL_CODE+"'>"+rccList[i].WT_MODEL_CODE+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 120px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width: 120px;' title='"+data.ajaxMap.checkLot+"'>"+data.ajaxMap.checkLot+"</td>");
								$("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width: 120px;'>"+rccList[i].WT_NUM+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
								defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
					},
				error: function(msg){
						if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			       }
				  }
				});
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
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		}
		
	//获取选中的值
	function getSelectSn(){
	    $("#WFI_ERROR_DOC").val($("#paraMapObj_CQI_DOC_NUMBER").val());
	    var k=$("input[name='isSelect1']:checked").length;
	    if(k!=0){
	        var wtSns;
		$("input[name='isSelect1']:checked").each(function(i) { // 遍历选中的checkbox
			if(i==0){
				wtSns = $(this).val();
			}else{
				wtSns = wtSns + "," +$(this).val();
			}
	               
        	 });
        	 $("#wtSns").val(wtSns);
        	 return "1";
            }else{
            	utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return "0";
            }
	}
	
	function searchTracking(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=c27c855905984417a24250e51440beb6";//VM-品质异常单-产品冻结 操作功能 产品信息分页
	SearchTracking(paginationImpl,url);
}

function editCal(){
      var flag = getSelectSn();
      if(flag=="0"){
          return ;
      }
document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=41929ff48866440fb05617c4333eccd8";
  document.forms.editForm.submit();
}
</script>
	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
