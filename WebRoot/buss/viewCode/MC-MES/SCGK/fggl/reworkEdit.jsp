<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>

<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="修改" /></title>
<style type="text/css">
.block2 {
	float: left;
	width: 10%;
	text-align: center;
	padding-top: 12%;
}

.block2 button {
	width: 60px;
	height: 30px;
	line-height: 30px;
	color: #fff;
	text-align: center;
	background-color: #aace36;
	border: none;
	border-radius: 2px;
	cursor: pointer;
	display: block;
	margin: 0 auto 20px;
}

.block2 button:hover {
	background-color: #99b932;
}

td .state0 {
	width: 50px;
	height: 20px;
	text-align: center;
	display: inline-block;
	background-color: green;
	border-radius: 5px;
	color: #fff;
}

td .state1 {
	width: 50px;
	height: 20px;
	text-align: center;
	display: inline-block;
	background-color: blue;
	border-radius: 5px;
	color: #fff;
}

td .state2 {
	width: 50px;
	height: 20px;
	text-align: center;
	display: inline-block;
	background-color: yellow;
	border-radius: 5px;
	color: #fff;
}

td .state3 {
	width: 50px;
	height: 20px;
	text-align: center;
	display: inline-block;
	background-color: red;
	border-radius: 5px;
	color: #fff;
}

td .state4 {
	width: 50px;
	height: 20px;
	text-align: center;
	display: inline-block;
	background-color: #7a60fd;
	border-radius: 5px;
	color: #fff;
}


</style>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
<%--<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="inHead" />
</jsp:include>--%>
<style>
    #container #content ul{
        margin:0;
    }
    
    #container #content li{
        margin:0;
    }
</style>
<script type="text/javascript">
	var addTableTrMap;
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display = "";

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
		//2018/06/21 点击判定是查询产品
		/*if(tag=="tag2"){
		    searchTracking('formId2');
		    searchHadTracking('formId3');
		}*/

	}
</script>
<!-- head里面 -->
</head>
<body style="background-color: #fff;"
	<DIV class="multilist comwrap content-in">
	<div class="edit">
		<form id="editForm" name="editForm"		
			method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
			<div class="hd" style="background-color: #f6f5f7;padding-bottom: 10px;">

				<div style="margin-left:40px;">
					
					<s:if test="${isDataAuth == '1'}">
						<span class="dot">*</span>
						<dict:lang value="组织机构" />
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
					<button type="button" id="saveBtn" onclick="saveRework(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>

					<button type="button" onclick="closeWindow();">
						<i class="ico ico-cancel"></i>
						<dict:lang value="取消" />
					</button>
					<button type="button"
						onclick="searchTracking('formId2');searchHadTracking('formId3');">
						<i class="ico ico-search-new"></i>
						<dict:lang value="查询" />
					</button>
				</div>

			</div>


			<bu:set name="paraMapObj" value="${dataId}"
				formId="d23be1e0a97e488c922c8d1144b774e9" type="edit" />
			<div class="js-tab">
				<DIV id="container" style="padding:0 20px;box-sizing: border-box;height:550px;">
				<!--	<DIV class="hd"> -->
						<UL class="tab-list tab">
							<LI id="tag1"><A class="selectli1"
								onclick="switchTag('tag1','content1','');this.blur();"
								href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang
											value="返工单信息" /> </SPAN> </A></LI>
							<LI id="tag2"><A class=""
								onclick="switchTag('tag2','content2','');this.blur();"
								href="javascript:void(0);"> <SPAN><dict:lang
											value="产品判定" /> </SPAN> </A></LI>

						</UL>
				<!--	</DIV> -->
	<DIV class="content1" id="content">
						<DIV id="content1" data-tab="tag1">

							<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
								<jsp:param name="modelName" value="VIEW_TYPE_11" />
								<jsp:param name="location" value="editForm" />
							</jsp:include>
							<table class="basic-table" id="tableRe">
								<input type="hidden" name="formIds"
									value="d23be1e0a97e488c922c8d1144b774e9" />
								<input type="hidden" name="d23be1e0a97e488c922c8d1144b774e9"
									value="paraMap1@" />
								<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
								<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
								
                        <input type="hidden" id="paraMapObj_CRD_DOC_NUMBER" name="paraMapObj.CRD_DOC_NUMBER" value="${paraMapObj.CRI_DOC_NUMBER}"/>
								<s:set name="_$viewId"
									value="'6dff850847134d9495656371a3532723'" />
								<s:set name="_$formId_1"
									value="'d23be1e0a97e488c922c8d1144b774e9'" />
								<s:set name="_$type" value="'edit'" />
								<tr>

									<td class="name-six" style="width:105px;" /><span class="dot">*</span>
									<bu:uitn colNo="CRI_REWORK_MO"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<bu:td cssClass="dec-self" style="width:200px;"
										colNo="CRI_REWORK_MO"
										formId="d23be1e0a97e488c922c8d1144b774e9">
										<bu:ui colNo="CRI_REWORK_MO" 
											formId="d23be1e0a97e488c922c8d1144b774e9"
											dataId="${dataId}" formIndex="1" />
									</bu:td>
									<td class="name-six" style="width:96px;" />
									<bu:uitn colNo="CRI_REWORK_TECH"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<bu:td cssClass="dec-self" style="width:200px;"
										colNo="CRI_REWORK_TECH"
										formId="d23be1e0a97e488c922c8d1144b774e9">
										<bu:ui colNo="CRI_REWORK_TECH"
											formId="d23be1e0a97e488c922c8d1144b774e9"
											dataId="${dataId}" formIndex="1" />
									</bu:td>
									<td class="name-six" style="width:96px;" /><span class="dot">*</span>
									<bu:uitn colNo="CRI_REWORK_INPUT"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<bu:td cssClass="dec-self" style="width:200px;"
										colNo="CRI_REWORK_INPUT"
										formId="d23be1e0a97e488c922c8d1144b774e9">
										<bu:ui colNo="CRI_REWORK_INPUT"
											formId="d23be1e0a97e488c922c8d1144b774e9"
											 formIndex="1" />
									</bu:td>

								</tr>
								<tr>

									<td class="name-six" />
									<bu:uitn colNo="CRI_REWORK_MODEL"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<bu:td cssClass="dec-self" colNo="CRI_REWORK_MODEL"
										formId="d23be1e0a97e488c922c8d1144b774e9">
										<bu:ui colNo="CRI_REWORK_MODEL"
											formId="d23be1e0a97e488c922c8d1144b774e9"
											dataId="${dataId}" readonly="readonly" cssClass="readonly isaddSubmit" formIndex="1" />
									</bu:td>
									<td class="name-six" />
									<bu:uitn colNo="CRI_INSPECT_NUM"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<bu:td cssClass="dec-self" colNo="CRI_INSPECT_NUM"
										formId="d23be1e0a97e488c922c8d1144b774e9">
										<bu:ui colNo="CRI_INSPECT_NUM"
											formId="d23be1e0a97e488c922c8d1144b774e9"
											dataId="${dataId}" formIndex="1" />
									</bu:td>
									<td class="name-six" /><span class="dot">*</span>
									<bu:uitn colNo="CRI_ERROR_NUM"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<bu:td cssClass="dec-self" colNo="CRI_ERROR_NUM"
										formId="d23be1e0a97e488c922c8d1144b774e9">
										<bu:ui colNo="CRI_ERROR_NUM"
											formId="d23be1e0a97e488c922c8d1144b774e9"
											dataId="${dataId}" formIndex="1" />
									</bu:td>

								</tr>
								<tr>
								
									<td class="name-six" />
									<bu:uitn colNo="CRI_ORIGINAL_FLAG"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<bu:td cssClass="dec-self" colNo="CRI_ORIGINAL_FLAG"
										formId="d23be1e0a97e488c922c8d1144b774e9">
										<bu:ui colNo="CRI_ORIGINAL_FLAG"
											formId="d23be1e0a97e488c922c8d1144b774e9"
											dataId="${dataId}" onclick="originalCheck(this)" formIndex="1" />
									</bu:td>
									<td class="name-six" />
									<bu:uitn colNo="CRI_FILE_NAME"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<td class="dec-self" colspan="3">
									<bu:ui colNo="CRI_SYS_NAME" name="upFile" formId="d23be1e0a97e488c922c8d1144b774e9" dataId="${dataId}" formIndex="1" />
                                   </td>

								</tr>
								<tr>

									<td class="name-six" />
									<bu:uitn colNo="CRI_MEMO"
										formId="d23be1e0a97e488c922c8d1144b774e9" />
									</td>
									<bu:td cssClass="dec-self" colspan="5" colNo="CRI_MEMO"
										formId="d23be1e0a97e488c922c8d1144b774e9">
										<bu:ui colNo="CRI_MEMO" rows="3" style="height:80px;width:100%;"
											formId="d23be1e0a97e488c922c8d1144b774e9" dataId="${dataId}"
											formIndex="1" />
									</bu:td>
								</tr>


							</table>
						</DIV>
	<DIV id="content2" data-tab="tag2"  style="display:none">
							<div class="mod-hd" style="height:80px">
								<table class="basic-table">
									<tr>
										<td class="name-six" style="width:96px;" />
										<bu:uitn colNo="CRI_MO_NUMBER"
											formId="d23be1e0a97e488c922c8d1144b774e9" />
										</td>
										<bu:td cssClass="dec-self" style="width:200px;"
											colNo="CRI_MO_NUMBER"
											formId="d23be1e0a97e488c922c8d1144b774e9">
											<bu:ui colNo="CRI_MO_NUMBER"
												formId="d23be1e0a97e488c922c8d1144b774e9"
												value="%{CRI_MO_NUMBER}" formIndex="1" />
										</bu:td>
										<td class="name-six" style="width:96px;" />
										<bu:uitn colNo="KZ_MODEL"
											formId="d23be1e0a97e488c922c8d1144b774e9" />
										</td>
										<bu:td cssClass="dec-self" style="width:200px;"
											colNo="KZ_MODEL" formId="d23be1e0a97e488c922c8d1144b774e9">
											<bu:ui colNo="KZ_MODEL"
												formId="d23be1e0a97e488c922c8d1144b774e9"
												value="%{KZ_MODEL}" formIndex="1" />
										</bu:td>
										<td class="name-six" style="width:96px;" />
										<bu:uitn colNo="KZ_JYPH"
											formId="d23be1e0a97e488c922c8d1144b774e9" />
										</td>
										<bu:td cssClass="dec-self" style="width:200px;"
											colNo="KZ_JYPH" formId="d23be1e0a97e488c922c8d1144b774e9">
											<bu:ui colNo="KZ_JYPH"
												formId="d23be1e0a97e488c922c8d1144b774e9" value="%{KZ_JYPH}"
												formIndex="1" />
										</bu:td>

									</tr>
									<tr>
										<td class="name-six" />
										<bu:uitn colNo="KZ_RQSN"
											formId="d23be1e0a97e488c922c8d1144b774e9" />
										</td>
										<bu:td cssClass="dec-self" colNo="KZ_RQSN"
											formId="d23be1e0a97e488c922c8d1144b774e9">
											<bu:ui colNo="KZ_RQSN"
												formId="d23be1e0a97e488c922c8d1144b774e9" value="%{KZ_RQSN}"
												formIndex="1" />
										</bu:td>

										<td class="name-six" />
										<dict:lang value="产品SN" />
										</td>
										<td class="dec-self"><input type="text" id="wtSn"
											name="wtSn" class="input isSubmit "></td>

										

									</tr>
								</table>
							</div>
							<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
							<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
							<div class="mod-hd" style="height:430px">

								<div class="block1" style="float:left;width:50%;">
									<div class="mod-hd">	
										<!--<dict:lang value="未选择产品" />-->
										<h3 class="tit" style="color:#004098;border-bottom:1PX solid #004098;
										font-weight:bold;position: relative;line-height: 34px;float: left;"><dict:lang value="未选择产品" /></h3>	
									</div>
									<div class="panel datagrid datagrid-div1">
										<div class="datagrid-div2 datagrid-div6 datagrid-view"
											id="datagrid-view" style="">
											<div class="datagrid-header">
												<div class="datagrid-header-inner head1"
													id="datagrid-header-inner">
													<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
														
																<td class="datagrid-cell" style="width:30px;"></td>
																<td class="datagrid-cell" style="width:30px;"><input
																	type="checkbox" id="allSelect1" name="allSelect1" /></td>
																<td class="datagrid-cell" style="width:100px;"><dict:lang
																		value="产品SN" /></td>
																<td class="datagrid-cell" style="width:120px;"><dict:lang
																		value="制令单" /></td>
																<td class="datagrid-cell" style="width:120px;"><dict:lang
																		value="容器SN" /></td>		
																<td class="datagrid-cell" style="width:100px;"><dict:lang value="产品状态" />
																</td>
																<td class="datagrid-cell" style="width:100px;"><dict:lang
																		value="生产批号" /></td>
																<td class="datagrid-cell" style="width:100px;"><dict:lang
																		value="当前工序" /></td>
                                                               <td class="datagrid-cell" style="display:none;"><dict:lang value="" />
																</td> 

															</tr>
														</tbody>
													</table>
												</div>
											</div>


											<div class="datagrid-body datagrid-div3 scroll1" style="height:300px;border:1px solid #dbdbdb;">
												<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >

													<tbody id="addTracking">


													</tbody>
												</table>
											</div>

										</div>
									</div>
									<div class="center">
										<s:include
											value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchTracking&formId=formId2&showLoading=0" />
									</div>
								</div>

								<div class="block2" style="float:left;width:7%;">

									<button type="button" onclick="fromNoToYes2();">&gt;&gt;</button>
									<button type="button" onclick="fromNoToYes1();">&gt;</button>
									<button type="button" onclick="fromYesToNo1();">&lt;</button>
									<button type="button" onclick="fromYesToNo2();">&lt;&lt;</button>

								</div>

								<div class="block3" style="float:left;width:43%;">
									<div class="mod-hd">	
										<!--<dict:lang value="已选择产品" />-->
									
										<h3 class="tit" style="color:#004098;border-bottom:1PX solid #004098;
										font-weight:bold;position: relative;line-height: 34px;float: left;"><dict:lang value="已选择产品" /></h3>
									</div>
									<div class="panel datagrid datagrid-div1">
										<div class="datagrid-div2 datagrid-div6 datagrid-view"
											id="datagrid-view" style="">
											<div class="datagrid-header">
												<div class="datagrid-header-inner head2">
													<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
															
																<td class="datagrid-cell" style="width:30px;"></td>
																<td class="datagrid-cell" style="width:30px;"><input
																	type="checkbox" id="allSelect3" name="allSelect3" /></td>
																<td class="datagrid-cell" style="width:170px;"><dict:lang
																		value="产品SN" /></td>
																<td class="datagrid-cell" style="width:170px;"><dict:lang value="制令单" />
																</td>
                                                                <td class="datagrid-cell" style="display:none;"><dict:lang value="" />
																</td>


															</tr>
														</tbody>
													</table>
												</div>
											</div>


											<div class="datagrid-body datagrid-div3 scroll2" id="datagrid-body3"
												style="height:300px;border:1px solid #dbdbdb;">
												<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >

													<tbody id="addTracking3">


													</tbody>
												</table>
											</div>

										</div>
									</div>
									<div class="center">
										<s:include
											value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchHadTracking&formId=formId3&showLoading=0" />
									</div>
								</div>
							</div>
						</DIV>
	</DIV>
	</DIV>



	</div>


	<bu:jsVal formId="d23be1e0a97e488c922c8d1144b774e9" formIndex="1" />
	<div style="padding:1px;"></div>




	</form>



	</div>
	</DIV>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_11" />
		<jsp:param name="location" value="jsLoading" />
	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript"
		src="${path}plf/page/fp/js/popMultPage.js"></script>

	<script type="text/javascript">
		var reworkurl= "${path}buss/bussModel_exeFunc.ms?funcMId=b9782e3489a741b5bd656493cebb0f09";

		$(function() {
		    $("#tag1").addClass("current");
			$("#paraMapObj_KZ_JYPH").removeAttr("disabled");
			$("#paraMapObj_KZ_RQSN").removeAttr("disabled");
			//searchTracking('formId1');
			searchHadTracking('formId3');
			var routeId = $("#paraMapObj_CRI_REWORK_TECH").val();
			queryGroup(routeId);
			if($('#paraMapObj_CRI_ORIGINAL_FLAG_1').is(':checked')) {
			  var criMo = $("#paraMapObj_CRI_REWORK_MO").val();
			  
			  $("#paraMapObj_CRI_MO_NUMBER").val(criMo);
				$("#paraMapObj_CRI_MO_NUMBER_SHOW").val(criMo);
				$("#paraMapObj_CRI_MO_NUMBER_SHOW").attr("disabled","disabled");
			}
			
			$("#allSelect1").click(function(){
    			if($("#allSelect1").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
			$("#allSelect3").click(function(){
    			if($("#allSelect3").attr("checked") == "checked"){
        			$("input[name='isSelect3']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect3']").removeAttr("checked","checked");
    			}
			});
			
		
		});
		function originalCheck(obj){
		   if (obj.checked) {
				var criMo = $("#paraMapObj_CRI_REWORK_MO").val();
				if (criMo == '' || criMo == null) {
					utilsFp.confirmIcon(3, "", "", "",
							"<dict:lang value="返工制令单必须选择" />", 0, "360", "");
					document.getElementById("paraMapObj_CRI_ORIGINAL_FLAG_1").checked=false;
					
					return;
				}
				$("#paraMapObj_CRI_MO_NUMBER").val(criMo);
				$("#paraMapObj_CRI_MO_NUMBER_SHOW").val(criMo);
				$("#paraMapObj_CRI_MO_NUMBER_SHOW").attr("disabled","disabled");
			
		   }
		   else{
		    $("#paraMapObj_CRI_MO_NUMBER_SHOW").removeAttr("disabled");
		   }
		}
		function searchTracking(paginationImpl) {
          	
			var isFirstLoad = firstLoadThisPage(paginationImpl);

			var currentPage = isFirstLoad ? 1
					: _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20
					: _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			var beginTime = $("#WT_IN_TIME_BEGIN").val();
			var endTime = $("#WT_IN_TIME_END").val();
			var moNumber = $("#paraMapObj_CRI_MO_NUMBER").val();
			var modelCode = $("#paraMapObj_KZ_MODEL").val();
			var jyph = $("#paraMapObj_KZ_JYPH").val();
			var rqsn = $("#paraMapObj_KZ_RQSN").val();
			var wtSn = $.trim($("#wtSn").val());
          	if(moNumber==""&&modelCode==""&&jyph==""&&rqsn==""&&wtSn==""){
				utilsFp.confirmIcon(1,"","","", "请输入查询条件！","1","500","");
              	return;
              	
            }
			util.showLoading();
			$
					.ajax({
						type : "POST",
						dataType : "json",
						url : reworkurl,
						data :{
						   "type":"nohad",
						   "moNumber":moNumber,
						   "jyph":jyph,
						   "rqsn":rqsn,
						   "wtSn":wtSn,
						   "modelCode":modelCode,
						   "beginTime":beginTime,
						   "endTime":endTime,
						   "page.currentPage":currentPage,
						   "page.pageRecord":pageRecord
						},
						success : function(data) {
							
							$("#addTracking").empty();

							if (null != data.ajaxPage.dataList) {
								var tempType;
								var rccList = eval(data.ajaxPage.dataList);
								var repairState;
								var containerSn="";
								for ( var i = 0; i < rccList.length; i++) {
								    if(rccList[i].PSI_CONTAINER_SN==null || rccList[i].PSI_CONTAINER_SN=='null'){
								        containerSn="";
								    }else{
								       containerSn=rccList[i].PSI_CONTAINER_SN;
								    }
									if (rccList[i].WT_ERROR_FLAG == "0") {
										repairState = "<span class='state0' ><dict:lang value="正常" /></span>";
									} else if (rccList[i].WT_ERROR_FLAG == "1") {
										repairState = "<span class='state1' ><dict:lang value="不良" /></span>";

									} else if (rccList[i].WT_ERROR_FLAG == "2") {
										repairState = "<span class='state2'><dict:lang value="维修" /></span>";
									} else if (rccList[i].WT_ERROR_FLAG == "3") {
										repairState = "<span class='state3'><dict:lang value="报废" /></span>";

									} else if (rccList[i].WT_ERROR_FLAG == "4") {
										repairState = "<span class='state4'><dict:lang value="冻结" /></span>";
									}
									$("#addTracking")
											.append(
													"<tr id='"
															+ ((currentPage - 1)
																	* pageRecord + (i + 1))
															+ "' name='"
															+ ((currentPage - 1)
																	* pageRecord + (i + 1))
															+ "' ></tr>");
									$("#addTracking tr:last")
											.append(
													"<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"
															+ ((currentPage - 1)
																	* pageRecord + (i + 1))
															+ "</td>");
									$("#addTracking tr:last")
											.append(
													"<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].WT_SN+"'/></td>");

									$("#addTracking tr:last").append(
											"<td class='datagrid-cell datagrid-cell-2' style='width: 100px;'>"
													+ rccList[i].WT_SN
													+ "</td>");
									$("#addTracking tr:last").append(
											"<td class='datagrid-cell datagrid-cell-3' style='width: 120px;'>"
													+ rccList[i].WT_MO_NUMBER
													+ "</td>");
									$("#addTracking tr:last").append(
											"<td class='datagrid-cell datagrid-cell-4' style='width: 120px;'>"
													+ containerSn
													+ "</td>");
									$("#addTracking tr:last").append(
											"<td class='datagrid-cell datagrid-cell-5' style='width:100px;align:center;'>"
													+ repairState + "</td>");
										$("#addTracking tr:last").append(
											"<td class='datagrid-cell datagrid-cell-6' style='width: 100px;'>"
													+ rccList[i].WT_LOT
													+ "</td>");				
									$("#addTracking tr:last").append(
											"<td class='datagrid-cell datagrid-cell-7' style='width: 100px;'>"
													+ rccList[i].WT_GROUP_CODE
													+ "</td>");
									
                                    $("#addTracking tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='display:none;'>"+ rccList[i].WT_NUM+"</td>");	
								}
							}
							pageFun(data.ajaxPage, paginationImpl);
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");

							$("input[name='allSelect1']").removeAttr("checked");
                          	util.closeLoading();
						},
						error : function(msg) {
							util.closeLoading();
							utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
									0, "300", "");
						}
					});
		}

		function searchHadTracking(paginationImpl) {
			var isFirstLoad = firstLoadThisPage(paginationImpl);

			var currentPage = isFirstLoad ? 1
					: _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20
					: _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			var dataId='${dataId}';		
			var beginTime = $("#WT_IN_TIME_BEGIN").val();
			var endTime = $("#WT_IN_TIME_END").val();
			var moNumber = $("#paraMapObj_CRI_MO_NUMBER").val();
			var docNumber = $("#paraMapObj_CRD_DOC_NUMBER").val();
			var modelCode = $("#paraMapObj_KZ_MODEL").val();
			var jyph = $("#paraMapObj_KZ_JYPH").val();
			var rqsn = $("#paraMapObj_KZ_RQSM").val();
			var wtSn = $.trim($("#wtSn").val());
			//util.showLoading();
			$
					.ajax({
						type : "POST",
						dataType : "json",
						url : reworkurl,
						data :{
						  "type":"had",
						   "docNumber":docNumber,
						   "moNumber":moNumber,
						   "jyph":jyph,
						   "rqsn":rqsn,
						   "wtSn":wtSn,
						   "modelCode":modelCode,
						   "beginTime":beginTime,
						   "endTime":endTime,
						   "dataId":dataId,
						   "page.currentPage":currentPage,
						   "page.pageRecord":pageRecord
						},
						success : function(data) {
							//util.closeLoading();
							$("#addTracking3").empty();

							if (null != data.ajaxPage.dataList) {
								var tempType;
								var rccList = eval(data.ajaxPage.dataList);
								var repairState;
								for ( var i = 0; i < rccList.length; i++) {

									$("#addTracking3")
											.append(
													"<tr id='addTracking3_"
															+ ((currentPage - 1)
																	* pageRecord + (i + 1))
															+ "' name='"
															+ ((currentPage - 1)
																	* pageRecord + (i + 1))
															+ "' ></tr>");
									$("#addTracking3 tr:last")
											.append(
													"<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"
															+ ((currentPage - 1)
																	* pageRecord + (i + 1))
															+ "</td>");
									$("#addTracking3 tr:last")
											.append(
													"<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect3' value='"+rccList[i].WT_SN+"'/></td>");
									$("#addTracking3 tr:last").append(
											"<td class='datagrid-cell datagrid-cell-2' style='width: 170px;'>"
													+ rccList[i].CRD_SN
													+ "</td>");
									$("#addTracking3 tr:last").append(
											"<td class='datagrid-cell datagrid-cell-3' style='width:170px;'>"
													+ nullToEmpty(rccList[i].CRD_MO_NUMBER)
													+ "</td>");
									$("#addTracking3 tr:last").append(
											"<td class='datagrid-cell datagrid-cell-4' style='display:none;'>"
													+ rccList[i].CRD_DOC_STATUS + "</td>");	

								}
							}
							pageFun(data.ajaxPage, paginationImpl);
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
							_tongLineColor(tableTrJs);
							$("input[name='allSelect3']").removeAttr("checked");
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
						},
						error : function(msg) {
							//util.closeLoading();
							utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
									0, "300", "");
						}
					});
		}

function nullToEmpty(str){
	 if(str==null){
	   return '';
	 }
	 return str;
	}
		function clickTr(tableId) {
			$("#" + tableId + " tr").unbind("click");
			$("#" + tableId + " tr input[type=checkbox]").unbind("click");
			$("#" + tableId + " tr")
					.on(
							"click",
							function(e) {
								var trId = $(this).attr("id");
								if ($("#" + trId + " :checkbox")
										.attr("checked")) {
									$("#" + trId + " :checkbox").prop(
											"checked", false);
									$("#" + trId).css("background-color", "");
								} else {
									$("#" + tableId + " input[type='checkbox']")
											.each(
													function() {
														if ($(this).attr(
																"checked")) {
															$(this).prop(
																	"checked",
																	false);
															$(this)
																	.parents(
																			"tr")
																	.css(
																			"background-color",
																			"");
														}
													});
									$("#" + trId + " :checkbox").prop(
											"checked", true);
									$("#" + trId).css("background-color",
											"#a0c8e5");
								}
							});

			$("#" + tableId + " tr input[type=checkbox]").click(function(e) {
				e.stopPropagation();
				var style = $(this).parents("tr").attr("style");
				if (style && style.indexOf("background-color") > -1) {
					$(this).parents("tr").css("background-color", "");
				} else {
					$(this).parents("tr").css("background-color", "#a0c8e5");
				}
			});
		}

		function saveRework() {
			if (!val.valNullData()) {
				return;
			}
			if (!valData()) {
				return;
			}
			if (!val.valOjbsData()) {
				return;
			}
			if(!val.valDataBaseSetData()){
                return ;
            }
			document.forms.editForm.action = reworkurl + "&type=editRework";
			document.forms.editForm.submit();
			isQuery = true;
		}

		function addParentData(msg, title, width, height, time, docNumber) {
			$("#paraMapObj_CRD_DOC_NUMBER").val(docNumber);
			$("#saveBtn").attr("disabled", "disabled");
			$('#tableRe input').each(function() {
				$(this).attr("readonly", "readonly");
				$(this).attr("disabled", "disabled");
			});

			msgPop(msg, '', title, width, height, time);
			if ($("#isCloseWin").attr('checked')) {
				closeWindow();
			}
			var sn = $("#paraMapObj_WT_SN").val();

		}

		function fromNoToYes2() {
			var docNumber = $("#paraMapObj_CRD_DOC_NUMBER").val();
			if (docNumber == '') {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="未生成返工单" />", 0, "260", "");
				return false;
			}
			var selCount = 0;
			var state;
			var reArr = [];
			var reS;
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr ").each(function(i) {
				selCount++;
				state = $(this).find("td").eq(5).text();
				if (state != '正常') {
					return false;
				}
				reS = {};
				reS.WT_SN = $(this).find("td").eq(2).text();
				reS.WT_MO_NUMBER = $(this).find("td").eq(3).text();
			//	reS.WT_NUM=$(this).find("td").eq(8).find('input').val();
		    	reS.WT_NUM=$(this).find("td").eq(8).text();
				//console.log("1::::"+$(this).find("td").eq(8).text());
				reArr.push(reS);

			});
			console.log("1111111111111111111111111111111111111111111111111");
			console.log(reArr);
			if (selCount == 0) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="未选择产品为空" />", 0, "260", "");
				return false;
			}
			if (state != '正常') {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="非正常状态的产品不允许判返工" />", 0,
						"360", "");
				return false;
			}
			//console.log(reArr);

			ajaxFromTo('fromNoToYes', reArr);
		}
         var  isque=true;
		function fromNoToYes1() {
		    if(isque==true){
		     isque=false;
			var docNumber = $("#paraMapObj_CRD_DOC_NUMBER").val();
			if (docNumber == '') {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="未生成返工单" />", 0, "260", "");
				return false;
			}
			var selCount = 0;
			var state;
			var reArr = [];
			var reS;
			$("input[name='isSelect1']:checked").each(function(i) {
				selCount++;
				var $tr = $(this).parents("tr");
				state = $tr.find("td").eq(5).text();
				if (state != '正常') {
					return false;
				}
				reS = {};
				reS.WT_SN = $tr.find("td").eq(2).text();
				reS.WT_MO_NUMBER = $tr.find("td").eq(3).text();
				reS.WT_NUM=$tr.find("td").eq(8).text();
				reArr.push(reS);

			});

			//console.log(reArr);
			if (selCount == 0) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="请至少选择一条记录" />", 0, "260", "");
				return false;
			}
			if (state != '正常') {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="非正常状态的产品不允许判返工" />", 0,
						"360", "");
				return false;
			}
			////////////////////////////////////////////////////////////////20180521 CSJ
			var planNum=parseInt($("#paraMapObj_CRI_ERROR_NUM").val());
			var trs = $("#addTracking3 tr").length;
			if(trs>=planNum){
			    utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="超出返工数量" />", 0, "260", "");
				return false;
			}
			ajaxFromTo('fromNoToYes', reArr);
            }
		}

		function ajaxFromTo(type, reArr) {
			var reStr = JSON.stringify(reArr);
			var docNumber = $("#paraMapObj_CRD_DOC_NUMBER").val();
			
			util.showLoading();
			$
					.ajax({
						type : "POST",
						dataType : "json",
						url : reworkurl,
						data : {
							'paraMap.CRD_DOC_NUMBER' : docNumber,
							'type':type,
							'reArr' : reStr
						},
						success : function(data) {

							if (data.ajaxMap != null) {
								msgPop(data.ajaxMap.alertMsg, '',
										data.ajaxMap.title, data.ajaxMap.width,
										data.ajaxMap.height, data.ajaxMap.time);
							} else if (data.ajaxString != null
									&& data.ajaxString != "") {
								utilsFp.confirmIcon(3, "", "", "",
										data.ajaxString, 0, "260", "");
								return;
							}

							searchTracking('formId2');
							searchHadTracking('formId3');
							isque=true;
						}
					});
			util.closeLoading();
		}

		function fromYesToNo1() {
			var docNumber = $("#paraMapObj_CRD_DOC_NUMBER").val();
			if (docNumber == '') {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="未生成返工单" />", 0, "260", "");
				return false;
			}
			var selCount = 0;
			var state;
			var reArr = [];
			var reS;
			$("input[name='isSelect3']:checked").each(function(i) {
				selCount++;
				var $tr = $(this).parents("tr");
				state = $tr.find("td").eq(4).text();
				if(state==2) return;
				reS = {};
				reS.WT_SN = $tr.find("td").eq(2).text();
				//reS.WT_MO_NUMBER=$tr.find("td").eq(3).text();
				//reS.state=$tr.find("td").eq(5).text();
				reArr.push(reS);
			});

			if (selCount == 0) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="请至少选择一条记录" />", 0, "260", "");
				return false;
			}
			if (state == 2) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="产品SN已返工" />", 0, "260", "");
				return false;
			}
			ajaxFromTo('fromYesToNo', reArr);
		}
		function fromYesToNo2() {
			var docNumber = $("#paraMapObj_CRD_DOC_NUMBER").val();
			if (docNumber == '') {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="未生成返工单" />", 0, "260", "");
				return false;
			}
			var selCount = 0;
			var state;
			var reArr = [];
			var reS;
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr ").each(function(i) {
				selCount++;
				state = $(this).find("td").eq(4).text();
				if(state==2) return;
				reS = {};
				reS.WT_SN = $(this).find("td").eq(2).text();
				reArr.push(reS);
			});

			if (selCount == 0) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="请至少选择一条记录" />", 0, "260", "");
				return false;
			}
			if (state == 2) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="产品SN已返工" />", 0, "260", "");
				return false;
			}
			ajaxFromTo('fromYesToNo', reArr);
		}
/*
		function queryGroup(routeId) {
            			var dataId='${dataId}';
            		//	alert("S");
			$("#paraMapObj_CRI_REWORK_INPUT").empty();
			$("#paraMapObj_CRI_REWORK_INPUT").append(
					"<option value='''><dict:lang value="--请选择--"/></option>");
			var routeId=$("#paraMap1_CRI_REWORK_TECH").val(); 
			jQuery
					.ajax({
						type : "POST",
						dataType : "json",
						url : reworkurl,
						data:{
						   "type":"queryGroup",
						   "routeId":routeId,
						   "dataId":dataId
						},
						success : function(data) {
							var pList = data.ajaxList;
							for ( var i = 0; i < pList.length; i++) {
								$("#paraMapObj_CRI_REWORK_INPUT").append(
										"<option value='"+pList[i].CRC_GROUP_CODE+"'>"
												+ pList[i].CRC_GROUP_CODE
												+ "<option>");
							}

							var a='${paraMapObj.CRI_INPUT_SEQ }'+'_'+'${paraMapObj.CRI_REWORK_INPUT}';
							$("#paraMapObj_CRI_REWORK_INPUT").val(a);
							
							$("#paraMapObj_CRI_REWORK_INPUT").trigger(
									"chosen:updated");
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							util.closeLoading();

						}
					});
		}
		*/
			function queryGroup(routeId) {

			$("#paraMapObj_CRI_REWORK_INPUT").empty();
			$("#paraMapObj_CRI_REWORK_INPUT").append(
					"<option value='''><dict:lang value="--请选择--"/></option>");
			//var routeId=$("#paraMap1_CRI_REWORK_TECH").val(); 
			jQuery
					.ajax({
						type : "POST",
						dataType : "json",
						url : reworkurl,
						data:{
						   "type":"queryGroup",
						   "routeId":routeId
						},
						success : function(data) {
							var pList = data.ajaxList;
							for ( var i = 0; i < pList.length; i++) {
								$("#paraMapObj_CRI_REWORK_INPUT").append(
										"<option value='"+pList[i].CRC_GROUP_CODE+"'>"
												+ pList[i].CRC_GROUP_CODE
												+ "<option>");
							}

							var a='${paraMapObj.CRI_INPUT_SEQ }'+'_'+'${paraMapObj.CRI_REWORK_INPUT}';
							$("#paraMapObj_CRI_REWORK_INPUT").val(a);
							
							$("#paraMapObj_CRI_REWORK_INPUT").trigger(
									"chosen:updated");
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							util.closeLoading();

						}
					});
		}
		
	</script>
		<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>
