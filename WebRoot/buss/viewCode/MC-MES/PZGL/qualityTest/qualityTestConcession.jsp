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
		if(tag=="tag1"){
			$("#save").removeAttr("style");
			$("#filter").attr("style","display:none;");
		}else if(tag=="tag2"){
			$("#filter").removeAttr("style");
			$("#save").attr("style","display:none;");
		}
	}
	
	     //全选
     	function select_All(){
		if($("#selectAll").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}   
</script>
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
			    	        <button id="save" type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			    	        <button id="filter" style="display:none;" type="button" onclick=""><i class="ico ico-save"></i><dict:lang value="筛选" /></button>
        				
        				<button type="button" onclick="closeWindow1();" ><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
        				
        				
			    </div>
			</div>
			<div class="bd" style="height:800px;">
			<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class=""><!--<DIV class="hd"> -->
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="检验单信息" /></SPAN> </A>			
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="物料/产品信息" /></SPAN> </A>
								</LI>
							</UL>
						</DIV>
						<DIV class="content1" id="content">
								<DIV id="content1" data-tab="tag1">
			
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="339caba30f6c4d78957a3815da1d1fdf" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="checkNo" id="checkNo" value="" />
	<input type="hidden" name="formIds" value="339caba30f6c4d78957a3815da1d1fdf" />
	<input type="hidden" name="formId" id="formId1" value='339caba30f6c4d78957a3815da1d1234'/>
	<input type="hidden" name="339caba30f6c4d78957a3815da1d1fdf" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'da14ad04536f4ea8a70d2081bb31ead2'" />
		<s:set name="_$formId_1" value="'339caba30f6c4d78957a3815da1d1fdf'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="QII_INSPECT_SN" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_INSPECT_SN" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_INSPECT_SN" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_ITEM_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_ITEM_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ITEM_CODE" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_ITEM_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_ITEM_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" style="width:200px;"><bu:ui colNo="QII_ITEM_NAME" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QII_ITEM_SPEC" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_ITEM_SPEC" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ITEM_SPEC" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_SEND_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_SEND_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SEND_NUM" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_TARGET_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_TARGET_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_TARGET_NUM" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QII_ACTUAL_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_ACTUAL_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ACTUAL_NUM" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_ERROR_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_ERROR_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ERROR_NUM" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_LIST_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_LIST_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_LIST_FLAG" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QII_CUST_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_CUST_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_CUST_CODE" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_SAMPLE_TYPE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_SAMPLE_TYPE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SAMPLE_TYPE" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_SEND_DEP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_SEND_DEP" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SEND_DEP" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QII_ATMOSPHERIC_PRESSURE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_ATMOSPHERIC_PRESSURE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ATMOSPHERIC_PRESSURE" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_TEMPERATURE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_TEMPERATURE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_TEMPERATURE" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_HUMIDITY" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_HUMIDITY" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_HUMIDITY" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QII_SEND_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_SEND_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SEND_TIME" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_SEND_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_SEND_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SEND_EMP" style="" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec" colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_INSEPCT_RESULT" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width: 80px;text-align: right;">
			<bu:uitn colNo="QII_INSEPCT_BASIS" formId="339caba30f6c4d78957a3815da1d1fdf" />
			</td>
			<td colspan="5">
				<bu:ui colNo="QII_INSEPCT_BASIS" disabled="disabled" style="margin-left:5px;height:80px;width: 364px;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /> &#x3000;
				<!--<bu:uitn colNo="QII_MEMO" style="margin-left:39px;vertical-align:middle;"  formId="339caba30f6c4d78957a3815da1d1fdf" />-->
				<div style=" margin-left:40px;display:inline-block;vertical-align:middle;margin-top:-70px;"><dict:lang value="备注" /></div>
				<bu:ui colNo="QII_MEMO" disabled="disabled" style="height:80px;width: 360px;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" />
			</td>
		</tr>

	</table>
	    <div class="mod">
		<div class="mod-hd">
			<h3 class="tit"><dict:lang value="让步接收信息" /></h3>
			
		</div>
		<table class="basic-table" >
			<tr>
				<td class="name" style="width:80px;"/><bu:uitn colNo="QII_CONCESSION_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
				<bu:td cssClass="dec" colNo="QII_CONCESSION_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_CONCESSION_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
				<td class="name" /><bu:uitn colNo="QII_FILE_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
				<bu:td cssClass="dec" colNo="QII_FILE_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_FILE_NAME" name="upFile" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
				<td class="name" />&nbsp;</td>
				<td class="dec" />&nbsp;</td>
			</tr>
			<tr>
				<td class="name" /><bu:uitn colNo="QII_CONCESSION_MEMO" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
				<bu:td cssClass="dec" colNo="QII_CONCESSION_MEMO" formId="339caba30f6c4d78957a3815da1d1fdf" colspan="5" style="height:80px;"><bu:ui colNo="QII_CONCESSION_MEMO" style="width: 100%;height: 100%;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
			</tr>
			</table>
	   </div>
	</DIV>
	<DIV id="content2" style="display:none" data-tab="tag2">
		<div class="panel datagrid datagrid-div1" name="itemTable" id="itemTable4">
										<div class="datagrid-div22 datagrid-div6 datagrid-view" id="datagrid-header1" >
											<div class="datagrid-header datagrid-header2" style="border-top:0px;soild;white;">
												<div class="datagrid-header-inner head2" id="datagrid-header-inner" style="width:100%">
													<table class="datagrid-htable fixedTable  datagrid-div6 datagrid-htable-kz" style="margin-top: 5px;" id="datagrid-htable339caba30f6c4d78957a3815da1d1234">
														<tbody>
															
															<tr class="datagrid-header-row thcolor">
																<td class="datagrid-cell" style="width:30px; text-align:center;"></td>
																<td class="datagrid-cell" style="width:30px; text-align:center"><span>
																	<input type="checkbox" id="selectAll" onclick="select_All()" style="cursor: pointer;" title="全选"></span>
																</td>
																<td class="datagrid-cell" style="width:200px;"><dict:lang value="物料/产品SN" /></td>
																<td class="datagrid-cell" style="width:95px;"><dict:lang value="检验结果" /></td>
																<td class="datagrid-cell" style="width:110px;"><dict:lang value="所属单据" /></td>
																<td class="datagrid-cell" style="width:80px;"><dict:lang value="数量" /></td>
																<td class="datagrid-cell" style="width:150px;"><dict:lang value="物料料号" /></td>
																<td class="datagrid-cell" style="width:80px;"><dict:lang value="抽验标志" /></td>
																<td class="datagrid-cell" style="width:80px;"><dict:lang value="检验人" /></td>
																<td class="datagrid-cell"><dict:lang value="检验时间" /></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="datagrid-body datagrid-div3 scroll2" style="height: 410px;overflow-y: auto;">
												<table class="dlist-table table-line btable" id="datagrid-btable-ajax339caba30f6c4d78957a3815da1d1234"  style="width:100%;table-layout: fixed;border-left: 1px solid #ccc;border-right: 1px solid #ccc;">
													<tbody class="" id="addItemInfo">
														
													</tbody>
												</table>
												
											</div>
										</div>
									</div>	
									<div id="page" style="background-color: white;" style="height: 30px;"> 
										<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId7&showLoading=0" />
									</div>
									
									<div style="background-color: white;" style="height: 50px;margin-top: 5px;"> 
										<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId1&showLoading=0" />
									</div>								
							</DIV>
						</DIV>
					</DIV>	
				</div>
			<bu:jsVal formId="339caba30f6c4d78957a3815da1d1fdf" formIndex="1" />
									
			</div>
	</form>	
	</div>
</DIV>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
	<bu:script viewId="da14ad04536f4ea8a70d2081bb31ead2" />
<script type="text/javascript">
        //var parentWindow1;
	$(function(){
		//parentWindow1 = top.$("#"+window.frameElement.name)[0].contentWindow;
		$("#tag1").addClass("current");
		$("#paraMapObj_QII_SEND_EMP_SHOW").removeAttr("style");
		$("#paraMapObj_QII_SEND_DEP_SHOW").removeAttr("style");
		$("#checkNo").val($("#paraMapObj_QII_INSPECT_SN").val());
		getItemInfo();
		$("input[name='upFile']:hidden").val("");
		$("#paraMapObj_QII_FILE_NAME").attr("disabled","true");
	})
	
	function closeWindow1(){
			if(parent.$(".dialog-close").length > 0){
				parent.$(".dialog-close").click();				
			}else if(parentWindow != null){
				var iframeSeq = parentWindow.name.replace("iframe","");
				parent.closeTab(iframeSeq);
			}
			parentWindow.query("");
			
	}

     $(function(){
    	var file_text = $('#paraMapObj_QII_FILE_NAME').next().text();
        if('' != file_text) {
          $("#paraMapObj_QII_FILE_NAME").attr("style","display:none;"); 
          $('#paraMapObj_QII_FILE_NAME').next().next().text('');
        }
    })
	
	function getItemInfo(){
	        var checkNo = $("#paraMapObj_QII_INSPECT_SN").val();
	        var dataAuth = $("#deptLs_data_auth").val();
	        var loadItemInfo = "${path}buss/bussModel_exeFunc.ms?funcMId=fa2754ab739d4b719e8735125092085d";
            var jsondata = { "checkNo": checkNo,"dataAuth":dataAuth};
		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: loadItemInfo,
			    data: jsondata,
				success: function(data){
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							$("#addItemInfo").empty();
							var tempResult = "";
							var tempFlag = "";
							for(var i = 0;i < rccList.length; i++){//alert(rccList[i].QIP_TEST_RESULT);
								if(rccList[i].QIP_TEST_RESULT=='1') tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>OK</span>";
								if(rccList[i].QIP_TEST_RESULT=='2') tempResult="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'>NG</span>";
								if(rccList[i].QIP_SAMPLE_FLAG=='Y') tempFlag="<img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].QIP_SAMPLE_FLAG=='N') tempFlag="<img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].USERNAME==null) rccList[i].USERNAME= "";
								if(rccList[i].TEST_TIME==null) rccList[i].TEST_TIME= "";
								$("#addItemInfo").append("<tr id='"+rccList[i].ID+"' name='"+rccList[i].ID+"'></tr>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/></td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 200px;'>"+rccList[i].QIP_SN+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 95px;text-align: center;'>"+tempResult+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 110px;'>"+rccList[i].QIP_DOC_NUM+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 80px;'>"+rccList[i].QIP_ITEM_NUM+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width: 150px;'>"+rccList[i].QIP_ITEM_CODE+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width: 80px;text-align: center;'>"+tempFlag+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width: 80px;'>"+rccList[i].USERNAME+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-9'>"+rccList[i].TEST_TIME+"</td>");
								tempResult = "";
								tempFlag = "";
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
						var tableTrJs = $("#datagrid-btable-ajax339caba30f6c4d78957a3815da1d1234 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajax339caba30f6c4d78957a3815da1d1234');
						defTableWidthRewrite("339caba30f6c4d78957a3815da1d1234");
					},
				error: function(msg){
						util.closeLoading();
						console.log(msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	
	//分页
	var paginationImpl = {};
	function SearchItemInfo(paginationImpl,url){
		var isFirstLoad = firstLoadThisPage(paginationImpl);
    	 	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	 	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		var checkNo = $("#paraMapObj_QII_INSPECT_SN").val();
		var dataAuth = $("#deptLs_data_auth").val();
		var jsondata = { "paraMap.checkNo": checkNo,"paraMap.dataAuth": dataAuth,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    //data: "paraMap.checkNo="+checkNo+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				data:jsondata,
				success: function(data){
						util.closeLoading();
						$("#addItemInfo").empty();
						//if(null == data){return ;}
						
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempResult="";
							var tempFlag="";
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].QIP_TEST_RESULT=='1') tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>OK</span>";
								if(rccList[i].QIP_TEST_RESULT=='2') tempResult="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'>NG</span>";
								if(rccList[i].QIP_SAMPLE_FLAG=='Y') tempFlag="<img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].QIP_SAMPLE_FLAG=='N') tempFlag="<img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].USERNAME==null) rccList[i].USERNAME= "";
								if(rccList[i].TEST_TIME==null) rccList[i].TEST_TIME= "";
								$("#addItemInfo").append("<tr id='"+rccList[i].ID+"' name='"+rccList[i].ID+"'></tr>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/></td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 200px;'>"+rccList[i].QIP_SN+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 95px;text-align: center;'>"+tempResult+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 110px;'>"+rccList[i].QIP_DOC_NUM+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 80px;'>"+rccList[i].QIP_ITEM_NUM+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width: 150px;'>"+rccList[i].QIP_ITEM_CODE+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width: 80px;text-align: center;'>"+tempFlag+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width: 80px;'>"+rccList[i].USERNAME+"</td>");
								$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-9'>"+rccList[i].TEST_TIME+"</td>");
								tempResult="";
							        tempFlag="";
							}
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax339caba30f6c4d78957a3815da1d1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax339caba30f6c4d78957a3815da1d1234');
							defTableWidthRewrite("339caba30f6c4d78957a3815da1d1234");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	var saveTestInfoUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=2a1f3e55a5874be19a434b8c2c68d23b";
	function saveInfo(){
	        //$("input[name='upFile']").val("");
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
	        if($("#paraMapObj_QII_FILE_NAME").val()==""){
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: saveTestInfoUrl,
			    data: $("#editForm").serialize(),
			    success: function(data){
						    if(null == data){return;}
						    if(null != data){
							
    							if(data.ajaxMap.returnMsg=="addSucc"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								switchTag('tag2','content2','');
                                    $("#save").removeAttr("onclick");
                                    $("#filter").attr("onclick","filterInfo();");
                                    $("#paraMapObj_QII_INSEPCT_RESULT").val(data.ajaxList[0].QII_INSEPCT_RESULT);
                                    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
                                    $("#paraMapObj_QII_CONCESSION_RESULT").attr("disabled","disabled");
                                    $("#paraMapObj_QII_FILE_NAME").attr("disabled","disabled");
                                    $("#paraMapObj_QII_CONCESSION_MEMO").attr("disabled","disabled");
                                    if($("#paraMapObj_QII_CONCESSION_RESULT").val()=='3'){
                                      	$("#filter").removeAttr("onclick");
                                    }
                                    getItemInfo();
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
    								return;
    							}
						    }
                                  /*utilsFp.confirmIcon(2,"","","", "保存成功",0,"260","");
                                  switchTag('tag2','content2','');
                                  $("#save").removeAttr("onclick");
                                  $("#filter").attr("onclick","filterInfo();");
                                  $("#paraMapObj_QII_INSEPCT_RESULT").val(data.ajaxList[0].QII_INSEPCT_RESULT);
                                  $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
                                  $("#paraMapObj_QII_CONCESSION_RESULT").attr("disabled","disabled");
                                  $("#paraMapObj_QII_FILE_NAME").attr("disabled","disabled");
                                  $("#paraMapObj_QII_CONCESSION_MEMO").attr("disabled","disabled");
                                  if($("#paraMapObj_QII_CONCESSION_RESULT").val()=='3'){
                                  	$("#filter").removeAttr("onclick");
                                  }
                                  getItemInfo();*/
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			});
	        }else{
	        	var formData = new FormData(document.getElementById("editForm"));
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: saveTestInfoUrl,
			    data: formData,
			    //cache: false,
			    processData:false,
                	    contentType:false,
			    success: function(data){
			                if(null == data){return;}
						    if(null != data){
							
    							if(data.ajaxMap.returnMsg=="addSucc"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								switchTag('tag2','content2','');
                                    $("#save").removeAttr("onclick");
                                    $("#filter").attr("onclick","filterInfo();");
                                    $("#paraMapObj_QII_INSEPCT_RESULT").val(data.ajaxList[0].QII_INSEPCT_RESULT);
                                    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
                                    $("#paraMapObj_QII_CONCESSION_RESULT").attr("disabled","disabled");
                                    $("#paraMapObj_QII_FILE_NAME").attr("disabled","disabled");
                                    $("#paraMapObj_QII_CONCESSION_MEMO").attr("disabled","disabled");
                                    if($("#paraMapObj_QII_CONCESSION_RESULT").val()=='3'){
                                      	$("#filter").removeAttr("onclick");
                                    }
                                    getItemInfo();
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
    								return;
    							}
						    }
                                  			/*utilsFp.confirmIcon(2,"","","", "保存成功",0,"260","");
                                  switchTag('tag2','content2','');
                                  $("#save").removeAttr("onclick");
                                  $("#filter").attr("onclick","filterInfo();");
                                  $("#paraMapObj_QII_INSEPCT_RESULT").val(data.ajaxList[0].QII_INSEPCT_RESULT);
                                  $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
                                  $("#paraMapObj_QII_CONCESSION_RESULT").attr("disabled","disabled");
                                  $("#paraMapObj_QII_FILE_NAME").attr("disabled","disabled");
                                  $("#paraMapObj_QII_CONCESSION_MEMO").attr("disabled","disabled");
                                  if($("#paraMapObj_QII_CONCESSION_RESULT").val()=='3'){
                                  	$("#filter").removeAttr("onclick");
                                  }
                                  getItemInfo();*/
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			});
	        }
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
		
		function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=9c8cea646bde41e0825618e980bbc9bd";
	SearchItemInfo(paginationImpl,url);
}

function filterInfo(){
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
			var result=$("#paraMapObj_QII_INSEPCT_RESULT").val();
                        var checkNo1 = $("#paraMapObj_QII_INSPECT_SN").val();
                        if(result==4){
                          var falg = 0; 
                          $('input[name="isSelect1"]:checkbox').each(function () { 
                                 if ($(this).attr("checked")) { 
		                     falg =1; 
		                     return false;
	                         } 
                          });
                          if(falg==0){
                          utilsFp.confirmIcon(3,"","","", "请至少选择一条记录","0","260","");
	                  return false;
                          }
                        }
                        
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=513676a477634048a4526808d1edbfd3&result="+result+"&checkNo="+checkNo1;
  document.forms.editForm.submit();
}
</script>
<script>(function($){
  $(window).on('load',function(){
     setPopScroll('.scroll2','.head2');
     console.log("aa");
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
