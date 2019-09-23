<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
 <%-- <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>--%>
	<!-- head里面 -->
<style type="text/css">
#myTable .input {
	width:200px !important;
}
</style>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			    <div class="optn">
			        <button type="button" id="mySaveBut" onclick="addCal()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:500px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="fba7fc49f50e4a7d80996a6a5d0fe903" type="add" />
	<table class="basic-table"  id="myTable">
	<input type="hidden" name="SAMPLE_TYPE" id="SAMPLE_TYPE" value="" />
	<input type="hidden" name="INSPECT_SN" id="INSPECT_SN" value="" />
	<input type="hidden" name="TEST_STEP" id="TEST_STEP" value="" />
	<input type="hidden" name="ITEM_CODE" id="ITEM_CODE" value="" />
	<input type="hidden" name="HANDLE_TYPE" id="HANDLE_TYPE" value="" />
	<input type="hidden" name="DOC_NUM" id="DOC_NUM" value="" />
	<input type="hidden" name="formIds" value="fba7fc49f50e4a7d80996a6a5d0fe903" />
	<input type="hidden" name="fba7fc49f50e4a7d80996a6a5d0fe903" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'409fd873cd18484cb045bdaa4a6d70bf'" />
		<s:set name="_$formId_1" value="'fba7fc49f50e4a7d80996a6a5d0fe903'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QIE_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_SN}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="QIE_INSPECT_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_INSPECT_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_INSPECT_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_INSPECT_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QIE_TEST_STEP" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="QIE_TEST_STEP" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_TEST_STEP" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_TEST_STEP}" formIndex="1" /></bu:td>
		<tr>
			<td class="name" /><bu:uitn colNo="QIE_ITEM_CODE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_ITEM_CODE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_ITEM_CODE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_ITEM_CODE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QIE_ITEM_NAME" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_ITEM_NAME" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_ITEM_NAME" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_ITEM_NAME}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QIE_ITEM_SPEC" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_ITEM_SPEC" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_ITEM_SPEC" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_ITEM_SPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QIE_HANDLE_TYPE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_HANDLE_TYPE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_HANDLE_TYPE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_HANDLE_TYPE}" formIndex="1" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="QIE_DOC_NUM" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_DOC_NUM" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_DOC_NUM" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_DOC_NUM}" formIndex="1" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="QIE_REPLACE_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_REPLACE_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" ><bu:ui colNo="QIE_REPLACE_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_REPLACE_SN}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QIE_MEMO" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<bu:td cssClass="dec" colNo="QIE_MEMO" formId="fba7fc49f50e4a7d80996a6a5d0fe903" style="height:80px;" colspan="5"><bu:ui colNo="QIE_MEMO" style="width:100%;height:100%" formId="fba7fc49f50e4a7d80996a6a5d0fe903" value="%{QIE_MEMO}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<div class="mod">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="检验不良信息" /></h3>	
        </div>
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view">
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										
						
										<td class="datagrid-cell" style="width:150px; text-align: center"><dict:lang value="检验项目类型" /></td >
										<td class="datagrid-cell" style="width:150px; text-align: center"><dict:lang value="检验项目" /></td >
										<td class="datagrid-cell" style="width:150px; text-align: center"><dict:lang value="检测结果" /></td >
										<td class="datagrid-cell" style="width:150px; text-align: center"><dict:lang value="不良代码" /></td >
										<td class="datagrid-cell" style="width:150px; text-align: center"><dict:lang value="不良名称" /></td >
										<td class="datagrid-cell" style="width:150px; text-align: center"><dict:lang value="缺陷等级" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:170px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addCheckInfo" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
	</div>	 
			<bu:jsVal formId="fba7fc49f50e4a7d80996a6a5d0fe903" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:submit viewId="409fd873cd18484cb045bdaa4a6d70bf" />
<bu:script viewId="409fd873cd18484cb045bdaa4a6d70bf" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
<script type="text/javascript">
//根据检验单对应的检验阶别及检验类型获取对应的不良品处理方式 以及 检测项目信息
function loadErrorInfo(){
    var testStep = $("#paraMap1_QIE_TEST_STEP").val();
    var sampleType = $("#SAMPLE_TYPE").val();
    var qieSn = $("#paraMap1_QIE_SN").val();
    var inspectSn = $("#paraMap1_QIE_INSPECT_SN").val();
    $("#INSPECT_SN").val(inspectSn);
    $("#TEST_STEP").val(testStep);
    $("#ITEM_CODE").val($("#paraMap1_QIE_ITEM_CODE").val());
    $("#DOC_NUM").val($("#paraMap1_QIE_DOC_NUM").val());
    var dataAuth=$("#deptLs_data_auth").val();
    util.showLoading("处理中...");
    var jsondata = { "testStep": testStep, "sampleType":sampleType,"qieSn":qieSn,"inspectSn":inspectSn,"dataAuth":dataAuth};
    var errorInfoUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=a7c2d86f143b45c0b2f126b7538ea5be";//VM-检验不良处理-新增 操作功能 加载不良品处理方式
    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: errorInfoUrl,
			    data: jsondata,
				success: function(data){
				        util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxMap){
							if(data.ajaxMap.handleRes=="getSucc"){ //获取到了处理方式
							    $("#paraMap1_QIE_HANDLE_TYPE").val(data.ajaxMap.handleType);
							    $("#paraMap1_QIE_HANDLE_TYPE").trigger("chosen:updated");
							    $("#HANDLE_TYPE").val(data.ajaxMap.handleType);
							    if(data.ajaxMap.handleType==2){ //处理方式为替换
							        $("#paraMap1_QIE_REPLACE_SN").removeAttr("disabled");
							        $("#paraMap1_QIE_REPLACE_SN").attr("class","_VAL_NULL input isSubmit isaddSubmit _VAL_DATABASE");
							    }else if(data.ajaxMap.handleType==1){ //处理方式为维修
							        $("#paraMap1_QIE_REPLACE_SN").attr("disabled","disabled");
							        $("#paraMap1_QIE_REPLACE_SN").attr("class"," input isSubmit  readonly isaddSubmit _VAL_DATABASE");
							    }
							    //检验不良信息
							    $("#addCheckInfo").empty();
							    var rccList = eval(data.ajaxList);
							    for(var i=0;i<rccList.length;i++){
							    if(rccList[i].ITEM_TYPE==null)  rccList[i].ITEM_TYPE="";
							    if(rccList[i].QII_ITEM_NAME==null)  rccList[i].QII_ITEM_NAME="";
							    if(rccList[i].TEST_RESULT==null)  rccList[i].TEST_RESULT="";
							    if(rccList[i].QII_ERROR_CODE==null)  rccList[i].QII_ERROR_CODE="";
							    if(rccList[i].ERROR_NAME==null)  rccList[i].ERROR_NAME="";
							    if(rccList[i].ERROR_GRADE==null)  rccList[i].ERROR_GRADE="";
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;text-align: center;'>"+rccList[i].ITEM_TYPE+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].QII_ITEM_NAME+"</td>");
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].TEST_RESULT+"</td>");
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].QII_ERROR_CODE+"<input type='hidden' name='ERROR_CODE' value='"+rccList[i].QII_ERROR_CODE+"'/></td>");
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+rccList[i].ERROR_NAME+"<input type='hidden' name='ERROR_NAME' value='"+rccList[i].ERROR_NAME+"'/></td>");
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: center;'>"+rccList[i].ERROR_GRADE+"<input type='hidden' name='ERROR_GRADE' value='"+rccList[i].QII_ERROR_GRADE+"'/></td>");
							    }
							    $("#mySaveBut").attr("onclick","addCal()");
							    var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							    _tongLineColor(tableTrJs);
							    defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							}
							if(data.ajaxMap.handleRes=="getErr"){ //没有获取到了处理方式
							    utilsFp.confirmIcon(3,"","","", "<dict:lang value="该SN无处理方式" />",0,"260","");
							    $("#mySaveBut").removeAttr("onclick");
								return;
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
function addCal(){      
 
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
                        
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=bdd456522f224c47a9099a8a3a940ad8";
                        document.forms.addForm.submit();
                        
}
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
  })
})(jQuery)</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
