<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
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
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
		<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	

	<!-- head里面 -->
	
	<!-- 产品静态资源 -->
	
	<style type="text/css">
		table .chosen-container {
			width: 200px !important;
		}
		.black_overlay {
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: #000;
			z-index: 1001;
			opacity: 0.3;
			filter: alpha(opacity=30);
		}
	/*	
		td.span{
		    width:65px;
		    height:17px;
		    
		}*/
		
		
	</style>
	<style>
		.dialog{
		    border-bottom-left-radius:8px;
		    border-bottom-right-radius:8px;
		    border-top-left-radius:8px;
		    border-top-right-radius:8px;		    
		}
</style>
	<script>

	    
	  var fileMap=new Map();
	  
	 /* $(function(){
	  
	      var ziji=$("#ziji").val();
	      $("#paraMap1_ASSESS_USER_ID").val(ziji);
	     
	      
	  })*/
	
	</script>
	
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
				document.getElementById("tag3").style.display="none";
		}
		if(tag=="tag2"){
				document.getElementById("tag3").style.display="";
		}
	}
$(function(){
	$("#tag1").addClass("current");

	
})

</script>
	
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
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
			        <button type="button" onclick="saveMTInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:534px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="8908aae883f6400f82375bedb9a6ac3f" type="add" />
    <div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd1">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="基本信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="员工信息" /></SPAN> </A>
								</LI>
								<LI id="tag3" style="display:none;margin-left:475px;">
    								<div class="extend-btn" style="float:right;margin: 5px 0;">
                            			<button type="button" id="front_add" onclick="popWorkDiv('backShadow','BlankSpacs')" style="padding:0;" title="添加员工"><i class="ico ico-kl-new-add ico-small"></i></button>
                            			<button type="button" id="front_delete" onclick="delFrontList();" style="padding:0;" title="删除员工"><i class="ico ico-sc-new-add ico-small"></i></button>
                            		</div>							
                                </LI>
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table"  >
	<input type="hidden" name="formIds" value="8908aae883f6400f82375bedb9a6ac3f" />
	<input type="hidden" name="formId" id="formId3" value="1234" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="8908aae883f6400f82375bedb9a6ac3f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="ziji"  value=${param.ziji}/>
	<!--注意点-->
		<input type="hidden" name="ids" id="ids" />
	<input type="hidden" name="cfmId" id="cfmId" value="0" />
		<!--<s:set name="_$viewId" value="'3ce940e7d6f74f31b1471008d1837cc7'" />-->
		<s:set name="_$viewId" value="'eb78a3f566d1459fb7931d497d14538a'" />
		<s:set name="_$formId_1" value="'8908aae883f6400f82375bedb9a6ac3f'" />
		<s:set name="_$type" value="'add'" />
		
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSESS_CODE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_CODE" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_CODE" formId="8908aae883f6400f82375bedb9a6ac3f" value="%{ASSESS_CODE}" formIndex="1" style="width:200px" /></bu:td>
            <td style="width:15px"></td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSESS_DATE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_DATE" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_DATE" formId="8908aae883f6400f82375bedb9a6ac3f" value="%{ASSESS_DATE}" formIndex="1" style="width:200px" /></bu:td>
        </tr>

	    <tr>					
            <td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSESS_LEVEL_B" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_LEVEL_B" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_LEVEL_B" formId="8908aae883f6400f82375bedb9a6ac3f" value="%{ASSESS_LEVEL_B}" formIndex="1"  /></bu:td>
        <td style="width:15px"></td>

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSESS_LEVEL_A" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_LEVEL_A" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_LEVEL_A" formId="8908aae883f6400f82375bedb9a6ac3f" value="%{ASSESS_LEVEL_A}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="ASSESS_FILE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_FILE" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_FILE" formId="8908aae883f6400f82375bedb9a6ac3f"  name="upFile" value="%{ASSESS_FILE}" formIndex="1"  style="width:200px"/></bu:td>
	
		</tr>
		<tr>
		<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSESS_RESULT" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_RESULT" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_RESULT" formId="8908aae883f6400f82375bedb9a6ac3f" value="%{ASSESS_RESULT}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSESS_USER_ID" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_USER_ID" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_USER_ID" formId="8908aae883f6400f82375bedb9a6ac3f" value="%{ASSESS_USER_ID}" formIndex="1"  style="width:200px"/></bu:td>
	
		</tr>
	    <tr >
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSESS_CONTENT" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td  cssClass="dec" colNo="ASSESS_CONTENT" formId="8908aae883f6400f82375bedb9a6ac3f" colspan="4" ><bu:ui  colNo="ASSESS_CONTENT" formId="8908aae883f6400f82375bedb9a6ac3f" value="%{ASSESS_CONTENT}" formIndex="1"  style="width:595px;height:60px;" /></bu:td>
			
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="REMARK" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="REMARK" formId="8908aae883f6400f82375bedb9a6ac3f" colspan="4" ><bu:ui colNo="REMARK" formId="8908aae883f6400f82375bedb9a6ac3f" value="%{REMARK}" formIndex="1"  style="width:595px;height:60px;" /></bu:td>
		      
		</tr>
		
	</table>
	     </DIV>
	   <DIV id="content2" style="display:none" data-tab="tag2">
    			<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:500px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner head1" style="width:100%;" >
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234" >
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
									<td class="datagrid-cell" style="width:30px; text-align:center;"></td>
        								<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll2" onclick="select_All()" style="cursor: pointer;" title="全选"></span></td>
        								<td class="datagrid-cell" style="width:250px;text-align:center">
        									<dict:lang value="员工号" /> 
        								</td>
        								<td class="datagrid-cell" style="width:250px;text-align:center"> 
        									<dict:lang value="员工姓名" />
        								</td>
        								<td class="datagrid-cell" style="width:250px;text-align:center">
        									<dict:lang value="部门" />
        								</td>
        										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:400px;">
							<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="showZJFront" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
		</DIV>   
	     
	     
			<bu:jsVal formId="8908aae883f6400f82375bedb9a6ac3f" formIndex="1" />
				

	    </DIV>
	  </div>  		
	        <div id="BlankSpacs" class="black_overlay" > </div>
					<div class="dialog"   id="backShadow" style=" top: 0px; left: 250px; width: 700px; height: 430px; z-index: 3099;display: none;background-color: white;">
						<div style="display: block;">
							<div class="dialog-s1" id="addRole" style="width:700px;display:block;left:253px;">
								<div class="dialog-hd">
									<h3 class="tit"><dict:lang value="选择员工" /></h3>
								</div>
							</div>
						</div>
						
						
						<a    class="dialog-close " href="javascript:void(0);" onclick="closeAlert('backShadow','BlankSpacs');"></a>
						<div class="optn optn_div">
							<button type="button" onclick="choseZjList('backShadow','BlankSpacs')"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
							<button type="button" onclick="closeAlert('backShadow','BlankSpacs');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
						<button type="button" onclick="getZjList('formId1')"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
						</div>



						<div id="zjalert" class="dialog-bd-div"  style="z-index:9999;margin-top: 0px;">
                            <!--90-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!--	<dict:lang value="员工姓名:" />  <input type="text" class="dec-self input" id="zj_sn" name="zj_sn" /> -->
								<table class="basic-table">
				                     <tr>
                    			    	<td class="name" /><dict:lang value="员工姓名"/></td>
                    					<td class="dec"><input type="text" class="dec-self input" id="zj_sn" name="zj_sn" /></td>
        			    	        </tr>
        			    	</table>
						<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header" style="width:100%;">
    							<div class="datagrid-header-inner head" style="width:100%;" id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable1234" >
    									<tbody>
    									<tr class="datagrid-header-row datagrid-title-ajax">
    										<td class="datagrid-cell" style="width:30px; text-align:center;"><span></span></td>
											<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll1" onclick="selectAll()" style="cursor: pointer;" title="全选"></span></td>
											<td class="datagrid-cell" style="width:110px">
												<dict:lang value="员工号" /> </td>
											<td class="datagrid-cell" style="width:115px">
												<dict:lang value="员工姓名" />
											</td>
											<td class="datagrid-cell" style="width:115px">
												<dict:lang value="部门" />
											</td>
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll"   style="height:222px;">
    							<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajax1234" >
    								<tbody id="zjTbody" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
						

							<div style="background-color: white;">
								<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchZjList&formId=formId1&showLoading=0" />
								</div>
			     
			     
								</div>
							</div>
				
	  
	  
			</div>
		 </form>
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

	<script type="text/javascript">
	    	$(window).load(function(){
	    	    $(this).focus();
	    	})
		function init() {
			$('.btable').width($('.htable').width())

			if($("#leftTable-kz").length > 0) {
				$("#leftTable-kz").show();
			}

			if($("#leftTable").length > 0) {
				$("#leftTable").show();
			}
			if('${dataList[0].CFM_FIX_SN}') {

				$("#paraMap1_TCFM_REPORTER_SHOW").val('${dataList[1].cfmReporterShow}');
				//$("#paraMap1_TCFM_MT_MAN").val("%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}");

				$("#paraMap1_TCFM_TYPE").val('${dataList[0].TCFM_TYPE}');
				$("#paraMap1_TCFM_TYPE").trigger("chosen:updated");

				$("#paraMap1_TCFM_REPORTER").val('${dataList[0].TCFM_REPORTER}');
				$("#paraMap1_TCFM_DEFECT_REMARK").val('${dataList[0].TCFM_DEFECT_REMARK}');
				$('#paraMap1_TCFM_MT_MAN').val('${dataList[0].TCFM_MT_MAN}');
				$('#paraMap1_TCFM_AUDIT').val('${dataList[0].TCFM_AUDIT}');
				$('#cfmId').val('${dataList[0].ID}');

				$("#showZJFront").append("<tr class='showZJFront' id='' name=''></tr>");
				$("#showZJFront tr:last").append("<td style='width:30px; text-align:center;'>1</td>");
				$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' style='cursor: pointer;'></td>");
				$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:250px; text-align:center;'>${dataList[0].TCF_FEEDER_SN} </td>"); //
				$("#showZJFront tr:last").append("<td class='datagrid-cell' style=' width:250px;text-align:center;'>${dataList[0].TCS_SPEC} </td>");
				$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:250px;text-align:center;'>${dataList[0].TCT_TYPE} </td>");
			
				$("#front_add").attr("disabled", true);
				$("#front_delete").attr("disabled", true);

			} else {
				$("#front_add").attr("disabled", false);
				$("#front_delete").attr("disabled", false);
			}

		
			$('#paraMap1_TCF_EC_CODE').attr("disabled", "disabled");
			$('#paraMap1_TCF_EC_DES').attr("readonly", "readonly");
			$('#paraMap1_TCF_EC_DES').addClass("readonly");
			$("#paraMap1_TCF_EC_CODE").trigger("chosen:updated");
			$(".<s:property value=" % { @com.more.fw.core.cont.formui.AbsBaseUi @IS_SELECT_FILTER }
				"/>").chosen();
		} //初始化方法

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        function closeWinFun(){
			$("#isCloseWin").attr
			if($("#isCloseWin").attr("checked")) {
				$("#isCloseWinVal").val("1");
				//alert($("#isCloseWinVal").val());
			} else {
				$("#isCloseWinVal").val("0");
				//alert($("#isCloseWinVal").val());
			}
		}

       //选择员工页面
		function popWorkDiv(showId, backId) {
	         	$('#zj_sn')	.val('');
			$("#" + showId + ",#" + backId).show();
		//	$("#" + showId).draggable({cancel:'dialog-bd-div'});
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$('.chosen-container').css("width", "230px");
			getZjList(paginationImpl);
			
		}

		function closeAlert(showId, backId) {
			$("#" + showId).hide();
			$("#" + backId).hide();

		}
		var paginationImpl = {};

		function getZjList(paginationImpl) {

			//	&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"
			//	&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord

			util.showLoading("处理中...");
			var zj_sn = $.trim($("#zj_sn").val());
			var jsondata = "";
			if($("#cfmId").val() == 0) {
				jsondata = { "zj_sn": zj_sn };
			} else {
				jsondata = { "zj_sn": zj_sn, "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
			}

			var listUrl = getUrl();

			$.ajax({
				type: "post",
				dataType: "json",
				url: listUrl,
				data: jsondata,
				success: function(data) {
					util.closeLoading();

					var zjLists = data.ajaxPage.dataList;
					//if(null==data.ajaxMap.zjList){	
					if(null == data.ajaxPage.dataList) {
						//utilsFp.alert("没查询到数据");
						//utilsFp.confirmIcon(3,"","","", "<dict:lang value="没查询到数据" />",0,"","");
						$("#zjTbody").html("");
					} else {
						$("#zjTbody").html("");
						var j = 0;
						var tct_type = "";
						var lastTime = "";
						//console.log(zjLists);
						for(var i = 0; i < zjLists.length; i++) {
							var zj = zjLists[i];
							j = ++j;
				
							if(zj.TCF_MT_LASTTIME == null) {
								lastTime = "";
							} else {
								lastTime = zj.TCF_MT_LASTTIME;
								lastTime=lastTime.replace("T"," ");
								//alert(lastTime);
							}
							if(j % 2 == 0) {
							//alert('1'+zj.ID)
								$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;background:#f0f4fd;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							} else {
								$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							}
							//$("#zjTbody").append("<tr class='datagrid-row' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							$("#zjTbody tr:last").append("<td style='width:30px; text-align:center;'>" + j + "</td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' id='selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a' style='cursor: pointer;'></span></td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:110px; text-align:center;'>" + zj.LOGIN_NAME + "</td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:115px; text-align:center;'>" + zj.NAME + " </td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:115px; text-align:center;'>" + zj.DEPT_NAME + "</td>");
							
							$("#zjId_" + zj.ID).click(function(event) {

								var index = $(this).find("td:eq(0)").text();

								if($(':checkbox', this).prop('checked') == true) {
									$(':checkbox', this).attr("checked", false);
									if(index % 2 == 0) {
										$(this).css("background-color", "#f0f4fd");
									} else {
										$(this).css("background-color", "");
									}

								} else {
									$(':checkbox', this).attr("checked", true);
									$(this).css("background-color", "#d3eafc");
								}
								event.stopPropagation();
							});

							$(':checkbox', "#zjId_" + zj.ID).click(function(event) {
								if($(':checkbox', this).prop('checked') == true) {
									$(':checkbox', this).attr("checked", false);
									$(this).css("background-color", "");

									/* var index=$(this).find("td:eq(0)").text();
	 			                 if(index%2==0){
                                   $(this).css("background-color","#f0f4fd");
                                        }else{
                           		   $(this).css("background-color","");
                                 }*/

								} else {
									$(':checkbox', this).attr("checked", true);
									$(this).css("background-color", "#d3eafc");
								}
								event.stopPropagation();
							});
							
						}
						//console.log(data.ajaxPage);
						pageFun(data.ajaxPage, "formId1");
						defTableWidthRewrite('1234');
					}
				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "", "");
				}
			});

		}

		function searchZjList(paginationImpl) {
            var isFirstLoad = firstLoadThisPage(paginationImpl);
        	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
        	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			util.showLoading("处理中...");
			var zj_sn = $.trim($("#zj_sn").val());
			var jsondata = { "zj_sn": zj_sn, "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
			var listUrl = getUrl();

			$.ajax({
				type: "post",
				dataType: "json",
				url: listUrl,
				data: jsondata,
				success: function(data) {
					util.closeLoading();
					//var zjLists=data.ajaxMap.zjList;   data.ajaxPage.dataList.

					var zjLists = data.ajaxPage.dataList;
					//if(null==data.ajaxMap.zjList){	
					if(null == data.ajaxPage.dataList) {
						utilsFp.alert("没查询到数据");
						$("#zjTbody").html("");
					} else {
						$("#zjTbody").html("");
						var j = 0;
						var tct_type = "";
						var lastTime = "";
						for(var i = 0; i < zjLists.length; i++) {
							var zj = zjLists[i];
							j = ++j;
						
							if(zj.TCF_MT_LASTTIME == null) {
								lastTime = "";
							} else {
								lastTime = zj.TCF_MT_LASTTIME.replace(/T/," ");
							}
							if(j % 2 == 0) {
								$("#zjTbody").append("<tr  onclick='check_box()' class='datagrid-row' style='cursor:pointer;background:#f0f4fd;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							} else {
								$("#zjTbody").append("<tr   onclick='check_box()' class='datagrid-row' style='cursor:pointer;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							}
							//$("#zjTbody").append("<tr class='datagrid-row' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							$("#zjTbody tr:last").append("<td style='width:30px; text-align:center;'>" + ((currentPage-1)*pageRecord+(i+1))+ "</td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' id='selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a' style='cursor: pointer;'></span></td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:110px; text-align:center;'>" + zj.	LOGIN_NAME + " </td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:115px; text-align:center;'>" + zj.NAME + "</td>");
						    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:115px; text-align:center;'>" + zj.DEPT_NAME + "</td>");
							/*	$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'>"+zj.ASSISTANTTOOLNAME+" </td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style=' text-align:center;'>" + lastTime + "</td>");*/
						
							$("#zjId_" + zj.ID).click(function(event) {

								var index = $(this).find("td:eq(0)").text();

								if($(':checkbox', this).prop('checked') == true) {
									$(':checkbox', this).attr("checked", false);

									if(index % 2 == 0) {
										$(this).css("background-color", "#f0f4fd");
									} else {
										$(this).css("background-color", "");
									}

								} else {
									$(':checkbox', this).attr("checked", true);
									$(this).css("background-color", "#d3eafc");
								}
								event.stopPropagation();
							});

							$(':checkbox', "#zjId_" + zj.ID).click(function(event) {
								if($(':checkbox', this).prop('checked') == true) {
									$(':checkbox', this).attr("checked", false);
									$(this).css("background-color", "");
									/* var index=$(this).find("td:eq(0)").text();
	 			                 if(index%2==0){
                                   $(this).css("background-color","#f0f4fd");
                                        }else{
                           		   $(this).css("background-color","");
                           		   
                                 }*/

								} else {
									$(':checkbox', this).attr("checked", true);
									$(this).css("background-color", "#d3eafc");
								}
								event.stopPropagation();
							});
							
						}
						//console.log(data.ajaxPage);
						pageFun(data.ajaxPage, "formId1");
						defTableWidthRewrite('1234');
					}
				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "", "");
				}
			});

		}



		function choseZjList(showId, backId) {

			var len = $("#showZJFront tr").length;

			if(len == 0) {
				var i = 0;
				$("#zjTbody :checkbox").each(function() {
					if($(this).attr("checked")) {
						var trid = $(this).parent().parent().parent().attr("id");
						var trSN = $(this).parent().parent().parent().find("td:eq(2)").text();
						getInfoToFront(trid, ++i);
					}
				});
				$("#" + showId).hide();
				$("#" + backId).hide();
				$("#selectAll1").attr("checked", false);

			} else { //先判断是否存在相同的员工，若相同则忽略，否则添加

				$("#zjTbody :checkbox").each(function() {
					if($(this).attr("checked")) {
						var is = "0";
						var trid = $(this).parent().parent().parent().attr("id");
						var trSN = $(this).parent().parent().parent().find("td:eq(2)").text();

						$("#showZJFront tr").each(function() {
							var zjSN = $(this).find("td:eq(2)").text();
							//alert($.trim(trSN )== $.trim(zjSN));
							//alert("trSN:"+trSN);
							//alert("zjSN:"+zjSN);
							if($.trim(trSN) == $.trim(zjSN)) {

								is = "1";
							}

						});

						if(is == "0") {
							len = parseInt(len) + parseInt(1);
							getInfoToFront(trid, len);
						}

					}
				});
				$("#" + showId).hide();
				$("#" + backId).hide();
				$("#selectAll1").attr("checked", false);
			}

			if(i == 0) {
				utilsFp.confirmIcon(3, "", "", "", "请选择要添加的数据", 0, "", "");
			}
		}

		function getInfoToFront(trId, index) {
			var tr_id = $("#" + trId);
			if(index % 2 == 0) {

				$("#showZJFront").append("<tr onclick='check_box()' class='showZJFront' style='cursor:pointer;background:#f0f4fd;' id=f" + trId + " name=f" + trId + "></tr>");
			} else {
				$("#showZJFront").append("<tr onclick='check_box()' style='cursor:pointer;' class='showZJFront' id=f" + trId + " name=f" + trId + "></tr>");
			}
			//$("#showZJFront").append("<tr class='showZJFront' id=f" + trId + " name=f" + trId + "></tr>");
			$("#showZJFront tr:last").append("<td style='width:30px; text-align:center;'>" + index + "</td>");
			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' style='cursor: pointer;'></td>");
			$("#showZJFront tr:last").append("<td class='datagrid-cell' style=' width:250px;text-align:center;'>" + tr_id.find("td:eq(2)").text() + " </td>");
			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:250px;text-align:center;'>" + tr_id.find("td:eq(3)").text() + " </td>");
			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:250px;text-align:center;'>" + tr_id.find("td:eq(4)").text() + " </td>");
			//$("#showZJFront tr:last").append("<td class='datagrid-cell' style='text-align:center;'>" + tr_id.find("td:eq(5)").text() + " </td>");
			/*$("#showZJFront tr:last").append("<td class='datagrid-cell' style='text-align:center;'>"+tr_id.find("td:eq(6)").text()+"</td>");*/
		
			$("#f" + trId).click(function(event) {
				var index = $(this).find("td:eq(0)").text();
				if($(':checkbox', this).prop('checked') == true) {
					$(':checkbox', this).attr("checked", false);
					//	$(this).css("background-color","");
					if(index % 2 == 0) {
						$(this).css("background-color", "#f0f4fd");
					} else {
						$(this).css("background-color", "");
					}
				} else {
					$(':checkbox', this).attr("checked", true);
					$(this).css("background-color", "#d3eafc");
				}
				event.stopPropagation();
			});

			$(':checkbox', "#f" + trId).click(function(event) {
				if($(':checkbox', this).prop('checked') == true) {
					$(':checkbox', this).attr("checked", false);
					$(this).css("background-color", "");
				} else {
					$(':checkbox', this).attr("checked", true);
					$(this).css("background-color", "#d3eafc");
				}
				event.stopPropagation();
			});
		
		}

		function saveFix() {
			var userIds = "";
			var trs = $("#showZJFront tr");
			for(var i = 0; i < trs.length; i++) {

				var id = $("#showZJFront tr:eq(" + i + ")").attr("id");
				id = $.trim(id);
				userIds += id + ",";


			}
			$("#ids").val(userIds);
		//	console.log(ids);
			//console.log(sns);
			//console.log(types);
			//console.log(names);
			//console.log(specs);
		}
		
		
		//弹出窗的全选
	function selectAll() {
		if($("#selectAll1").attr("checked")) {
			$("#zjTbody :checkbox").each(function() {
				$(this).attr("checked", true);
				$(this).parents('tr').css('background-color','#c3e2fb')
			});
		} else {	
        	var i = 1;
			$("#zjTbody :checkbox").each(function() {
				$(this).attr("checked", false);
				if (i % 2 == 0) {
				    $(this).parents('tr').css('background-color','#f0f4fd')
				}else {
				    $(this).parents('tr').css('background-color','')
				}
				i++;
			});
		}

	}
		

	/*	function selectAll() {
			if($("#selectAll1").attr("checked")) {
				$("#zjTbody :checkbox").each(function() {
					$(this).attr("checked", true);
				});
			} else {
				$("#zjTbody :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}

		}*/
		
		
		//已添加奖惩员工的表格内全选
	function select_All() {
		if($("#selectAll2").attr("checked")) {
			$("#showZJFront :checkbox").each(function() {
				$(this).attr("checked", true);
				$(this).parents('tr').css('background-color','#c3e2fb')
			});
		} else {
		var i = 1;
			$("#showZJFront :checkbox").each(function() {
				$(this).attr("checked", false);
				if (i % 2 == 0) {
				    $(this).parents('tr').css('background-color','#f0f4fd')
				}else {
				    $(this).parents('tr').css('background-color','')
				}
				i++;
			});
		}
	}

/*		function select_All() {
			if($("#selectAll2").attr("checked")) {
				$("#showZJFront :checkbox").each(function() {
					$(this).attr("checked", true);
					$(this).parents('tr').css('background-color','#d3eafc')
				});
			} else {
				$("#showZJFront :checkbox").each(function() {
					$(this).attr("checked", false);
					$(this).parents('tr').css('background-color','')
				});
			}
		}*/
		
		
		 //确认删除的回调方法
    function delIf(){
        var i = 0;
    	$("#showZJFront :checkbox").each(function() {
			if($(this).attr("checked")) {
				i++;
				var trid = "#" + $(this).parent().parent().attr("id");
				 $(trid).remove();
			}
		});
		$("#selectAll2").attr("checked", false);
		reSort('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
      
    }
    
    //重新排序
    function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
    }
		
		
		
		
			function delFrontList() {
		var i = 0;
		$("#showZJFront :checkbox").each(function() {
			if($(this).attr("checked")) {
				i++;
			}
		});
		
		if(i == 0) {
			utilsFp.confirmIcon(3, "", "", "", "请选择要删除的数据", 0, "", "");
			
		}else {
		    utilsFp.confirmIcon(3, "删除确认", "delIf", "", "确认删除选中的员工", 1, "", "");
		}
	}


		function getUrl(){
            var url="${path}buss/bussModel_exeFunc.ms?funcMId=d211a87b5fb14ef7b9ed3bc506b9ac68"; 
            
            //alert(url);
            return url;
            }

		function saveMTInfo(){
		
        saveFix();
        if($("#paraMap1_ASSESS_CODE").val()==""){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请输入考核编号" />",0,"260","");
             return;
        } if($("#paraMap1_ASSESS_CODE").val().length>=200){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="考核编号不得超过最大字符数:200" />",0,"260","");
             return;
        }
        
        if($("#paraMap1_ASSESS_DATE").val()==""){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择考核时间" />",0,"260","");
             return;
        }
        if($("#paraMap1_ASSESS_LEVEL_B").val()==""){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择考核前等级" />",0,"260","");
             return;
        }
        if($("#paraMap1_ASSESS_LEVEL_A").val()==""){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择考核后等级" />",0,"260","");
             return;
        }
        if($("#paraMap1_ASSESS_CONTENT").val()==""){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请输入考核意见" />",0,"260","");
             return;
        }if($("#paraMap1_ASSESS_CONTENT").val().length>=2000){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="考核意见不得超过最大字符数:2000" />",0,"260","");
             return;
        }
        
        
        if($("#paraMap1_REMARK").val().length>=2000){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="备注不得超过最大字符数:2000" />",0,"260","");
             return;
        }
        if($("#paraMap1_ASSESS_USER_ID_SHOW").val()==""){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择审核人" />",0,"260","");
             return;
        }
         if($("#paraMap1_ASSESS_RESULT").val()==""){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择考核结果" />",0,"260","");
             return;
        }
        
        if($("#ids").val()==""){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加考核员工" />",0,"260","");
            return;
        }
   //document.forms.addForm.action="@{funcUrl}";
   //document.forms.addForm.submit();
        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
		$DisInput.attr("disabled", false); 
        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
			$("#addForm").append($("#isCloseWin").clone());
			$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
		}
		$("#saveBtn").prop("disabled","disabled");
           
        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=5b3164869a774b6e8d62b72a9c401fd0"; 
        document.forms.addForm.submit();
       
			isQuery = true;
			$DisInput.attr("disabled", true);
}

/*$(function(){
    var url="${path}buss/bussModel_exeFunc.ms?funcMId=c65e9e3c169a4d69a34c42ff806a8a21";
	     $.ajax({
	       type: "POST",
	       dataType: 'json',
	       url: url,
	     
	       success: function(data) {
	       console.log(data.ajaxList[0].ID);
	        console.log(data.ajaxList[0].NAME);
	       
	       
	          
	          if(data!=null){
	          $("#paraMap1_ASSESS_USER_ID").val(data.ajaxList[0].ID);
	            $("#paraMap1_ASSESS_USER_ID_SHOW").val(data.ajaxList[0].NAME);
	              
	          };
	         
	       },
	       error: function(data) {
	           console.log('error');
	           console.log(data);
	       }
	        
	    });
	    
    
})*/
		
	</script>
	
	
<script>
	(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>


<!-- 页面结束 -->
 