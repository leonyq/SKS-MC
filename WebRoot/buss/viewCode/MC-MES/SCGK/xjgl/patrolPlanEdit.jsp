<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<title>
		<dict:lang value="修改巡检方案" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>
	<style type="text/css">
		.x-fieldset {
			border: 1px solid #B5B8C8;
			padding: 10px;
			margin-botton: 10px;
			display: block;
		}
	</style>
	<script language="javascript">
		

		function addWRT() {
			var table1 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var count1 = table1.rows.length;
			var count2 = table2.rows.length;
			var workTime = new Array();
			var valwGroup = "";
			var calwStart = "";
			var calwEnd = "";
			var calwOverFalg = "";
			var valrGroup = "";
			var calrStart = "";
			var calrEnd = "";
			for(var i = 2; i < count1; i++) {
				valwGroup = valwGroup + "&" + table1.rows[i].cells[0].innerHTML;
				calwStart = calwStart + "&" + table1.rows[i].cells[1].innerHTML;
				calwEnd = calwEnd + "&" + table1.rows[i].cells[2].innerHTML;
				calwOverFalg = calwOverFalg + "&" + table1.rows[i].cells[3].innerHTML;
			}
			for(var i = 2; i < count2; i++) {
				valrGroup = valrGroup + "&" + table2.rows[i].cells[0].innerHTML;
				calrStart = calrStart + "&" + table2.rows[i].cells[1].innerHTML;
				calrEnd = calrEnd + "&" + table2.rows[i].cells[2].innerHTML;
			}
			document.getElementById("wGroup").value = valwGroup;
			document.getElementById("wStart").value = calwStart;
			document.getElementById("wEnd").value = calwEnd;
			document.getElementById("wOverFalg").value = calwOverFalg;
			document.getElementById("rGroup").value = valrGroup;
			document.getElementById("rStart").value = calrStart;
			document.getElementById("rEnd").value = calrEnd;
			document.getElementById("workTime_count").value = workTimeCount;
			document.getElementById("areaCount").value = areaCount;
		}
		var isQuery = false;

		function query(thisObj) {
			if(isQuery) { //utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="
					数据正在提交， 请稍候 " />...", 0, "", "");
			}
			document.forms.searchForm.submit();
			util.showTopLoading();
			isQuery = true;
		}
	</script>
	<script type="text/javascript">
		//点击行寄选中该行
		function checkboxAll(tableId) {
			$("#" + tableId + " tr").unbind("click");
			$("#" + tableId + " tr input[type=checkbox]").unbind("click");
			$("#" + tableId + " tr").on("click", function(e) {
				var trId = $(this).attr("id");
				if($("#" + trId + " :checkbox").attr("checked")) {
					$("#" + trId + " :checkbox").attr("checked", false);
					$("#" + trId).css("background-color", "");
					$("#all_" + tableId).attr("checked", false);
				} else {
					$("#" + tableId + " input[type='checkbox']").each(function() {
						if($(this).attr("checked")) {
							$(this).attr("checked", false);
							$(this).parents("tr").css("background-color", "");
						}
					});
					$("#" + trId + " :checkbox").attr("checked", true);
					$("#" + trId).css("background-color", "#a0c8e5");
				}
			});

			$("#" + tableId + " tr input[type=checkbox]").click(function(e) {
				e.stopPropagation();
				var style = $(this).parents("tr").attr("style");
				if(style && style.indexOf("background-color") > -1) {
					$(this).parents("tr").css("background-color", "");
				} else {
					$(this).parents("tr").css("background-color", "#a0c8e5");
				}
			});
		}

		function delRow() {
			$("#" + rowIdStr).remove();
			$("#work_time_n" + rowIdStr).remove();
			$("#work_time_t" + rowIdStr).remove();
			$("#work_time_s" + rowIdStr).remove();
			$("#work_time_e" + rowIdStr).remove();
			$("#work_time_0" + rowIdStr).remove();
			rGroupStr = "";
		}

		
		function hideDivr(showId, backId) {
			document.getElementById("calrStart_err").innerHTML = "";
			$("#addFCRTpop").hide();
			$("#addFCWTshadow").hide();
			document.getElementById("calrStartH").value = "";
			document.getElementById("calrStartM").value = "";
			document.getElementById("calrEndH").value = "";
			document.getElementById("calrEndM").value = "";
			rGroupStr = "";
		}

		
		var workTimeNameStr = "";

		
		function closeValMsg(objthis) {
			document.getElementById(objthis).innerHTML = "";
		}

		
		function closeValMsg(objthis) {
			document.getElementById(objthis).innerHTML = "";
		}
	</script>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<style type="text/css">
		.black_overlay {
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: #f8fcff;
			z-index: 1001;
			opacity: 0.5;
			filter: alpha(opacity=88);
		}
		
		.white_content {
			display: none;
			position: absolute;
			top: 25%;
			left: 25%;
			width: 50%;
			height: 60%;
			padding: 10px;
			border: 1px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
		
		.white_contents {
			display: none;
			position: absolute;
			top: 15%;
			left: 2%;
			width: 94%;
			height: 65%;
			padding: 10px;
			border: 1px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
		
		.extend-btn button .ico-kl-new-add {
			width: 15px;
			height: 15px;
			margin-right: 5px;
			margin-bottom: 3px;
			background: url(${path}plf/page/fp/img/ico-kl.png) no-repeat;
		}
		
		.extend-btn button:hover .ico-kl-new-add {
			width: 15px;
			height: 15px;
			margin-right: 5px;
			margin-bottom: 3px;
			background: url(${path}plf/page/fp/img/ico-kl-h.png) no-repeat;
		}
		
		.extend-btn button .ico-sc-new-add {
			width: 15px;
			height: 15px;
			margin-right: 5px;
			margin-bottom: 3px;
			background: url(${path}plf/page/fp/img/ico-sc.png) no-repeat;
		}
		
		.extend-btn button:hover .ico-sc-new-add {
			width: 15px;
			height: 15px;
			margin-right: 5px;
			margin-bottom: 3px;
			background: url(${path}plf/page/fp/img/ico-sc-h.png) no-repeat;
		}
	</style>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>   
</head>

<body scroll="no" style="overflow-x:hidden;overflow-y:hidden;height:800px">
	<div class="mod" style="margin-top: 37px;">
		<div>
				<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>		
			<div class="hd" style="height:0;">
				<div style="margin-left:10px;margin-top:-40px;">
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

				<div class="optn"  style="right:5px;">
			    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>
			</div>
			<div style="height: 557px;padding:0 20px;">

								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name=iframeId value="${iframeId}">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		        <bu:set name="paraMapObj" value="${dataId}" formId="9e2c713356a048c8a99bf86defe6cb1e" type="edit" />
				<input type="hidden" id="isCloseWin" name="isCloseWin" />
				<input type="hidden" name="formId" value="9e2c713356a048c8a99bf86defe6cb1e">
				<input type="hidden" name="iframeId" value="${iframeId}">
				<input type="hidden" id="ids" name="ids" >
				<input type="hidden" id="groups" name="groups" >
				<input type="hidden" id="times" name="times" >
				<input type="hidden" id="timeStarts" name="timeStarts" >
				<input type="hidden" id="timeEnds" name="timeEnds" >
				<input type="hidden" name="9e2c713356a048c8a99bf86defe6cb1e" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
					<s:set name="_$viewId" value="'3e11863fa2944f03a4622887f8ccbcb6'" />
					<s:set name="_$formId_1" value="'9e2c713356a048c8a99bf86defe6cb1e'" />
					<s:set name="_$type" value="'edit'"/>
				<div class="mod-hd">
					<h3 class="tit"><dict:lang value="基本信息"/></h3>
				</div>
				<table class="basic-table">
					<tr>
						<td class="name" style="width: 72px;"/><span class="dot">*</span><bu:uitn colNo="QI_NAME" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
						<bu:td cssClass="dec" colNo="QI_NAME" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_NAME" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
					    
						<td style="width: 113px; text-align: right;"><dict:lang value="默认标志" /></td>
						<td class="dec" style="width:235px;">
						<c:if test="${dataMap.QI_ALTERATE_FLAG==Y}">
								<input type="checkbox" id="QI_DEFAULT_FALG" name="QI_DEFAULT_FALG" value="Y" formId="9e2c713356a048c8a99bf86defe6cb1e" onclick="changeVal();"    maxlength="2" />
						</c:if>
						<c:if test="${dataMap.QI_ALTERATE_FLAG==N}">
								<input type="checkbox" id="QI_DEFAULT_FALG" name="QI_DEFAULT_FALG" value="N" formId="9e2c713356a048c8a99bf86defe6cb1e" onclick="changeVal();"    maxlength="2" />
						</c:if>
							 <input type="checkbox" id="QI_DEFAULT_FALG" name="QI_DEFAULT_FALG" value="N" formId="9e2c713356a048c8a99bf86defe6cb1e" onclick="changeVal();"    maxlength="2" />
								&#x3000; 
							<dict:lang value="换班巡检" />&nbsp;<input type="checkbox" id="QI_ALTERATE_FLAG" name="QI_ALTERATE_FLAG" value="N" formId="9e2c713356a048c8a99bf86defe6cb1e" onclick="changeVal2();"   maxlength="2"/>
						</td>
					</tr>
					<tr>
						<td class="name" /><span class="dot">*</span><bu:uitn colNo="QI_TYPE" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
						<bu:td cssClass="dec" colNo="QI_TYPE" formId="9e2c713356a048c8a99bf86defe6cb1e"  ><bu:ui colNo="QI_TYPE" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
                       
						<td class="name" /><bu:uitn colNo="QI_ADVANCE_ALARM" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
						<bu:td cssClass="dec" colNo="QI_ADVANCE_ALARM" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_ADVANCE_ALARM" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
					</tr>
					<tr>
						<td class="name" /><span class="dot">*</span><bu:uitn colNo="QI_MODEL" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
						<bu:td cssClass="dec" colNo="QI_MODEL" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_MODEL" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
					    
						<td class="name" /><bu:uitn colNo="QI_INPUT_TIME" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
						<bu:td cssClass="dec" colNo="QI_INPUT_TIME" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_INPUT_TIME" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
					</tr>
				</table>
				<!--<bu:form viewId="c8f2acda26204e47aa178342e7b4595b" formId="9e2c713356a048c8a99bf86defe6cb1e" list="dataList " formidFirstId="9e2c713356a048c8a99bf86defe6cb1e" relColIds="" subFormIds="" subRelColIds="" />-->
				<div class="js-tab">
					<DIV id="container">
						<DIV id="hd">
							<UL style="display:none;" class="tab-list tab">
								<LI id="tag1">
									<A class="selectli1" onclick="switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=e8381c90ac7143a3b1ec4ac8ac8e91d2');this.blur();" href="javascript:void(0);">
										<SPAN class="selectspan1"><dict:lang
													value="班别信息" />
										</SPAN> </A>
								</LI>
								<LI id="tag2">
									<A class="" onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=f72a754bd2af4246a79dd94a1b271a8a');this.blur();" href="javascript:void(0);">
										<SPAN><dict:lang
													value="线别设置" />
										</SPAN> </A>
								</LI>
							</UL>
						</DIV>
						<DIV class="content1" id="content">
							<DIV id="content1">
								<div data-tab="tag1">
									<bu:funcsi viewId="7c413e16ba004221b215aaf7e0ad6cd7" funcId="ed334aadf26347b78c1dcaa1b677691a" isHidden="1" />
									<div id="back" class="black_overlay" /></div>
								<!-- addFCWTpop begin -->
								<!--时段信息新增-->
								<div class="dialog dialog-s1" id="addFCWTpop" style="display:none;z-index:1030;margin-left:0px;left:214px;top:89px;width:391px;height:240px;">
									
									<div class="dialog-hd">
										<h3 class="tit"><dict:lang value="时段信息新增"/></h3>
									</div>
									<a class="dialog-close" href="javascript:void(0);" onclick="hideTimeDiv();"></a>
									<div class="dialog-bd-div" style="width:100%;height:240px;">
										<div class="optn optn_div">
											<button type="button" onclick="addWorkTimeFun();"><!--'addFCWTpop','addFCWTshadow'-->
														<i class="ico ico-save"></i>
														<dict:lang value="保存" />
													</button>
											<button type="button" onclick="hideTimeDiv();">
														<i class="ico ico-cancel"></i>
														<dict:lang value="取消" />
													</button>
										</div>
										<table class="basic-table" style="margin-top: 5px;background-color: white;">
											<tr>
												<td style="width: 106px;text-align: right;">
													<dict:lang value="班别" />
												</td>
												<td class="dec">
													<dict:selectDict id="calwGroup" name="calwGroup" dictCode="CALW_GROUP" dictValue="" style="width:157px;" custom_option="<option value=''>--请选择--</option>" cssClass="dept_select" />
													<!-- <input type="text" name="calwGroup" id="calwGroup" maxlength="20"/> -->
													<br /> <span class="Eng"><span id="calwGroup_err"></span>
													</span>
												</td>
											</tr>
											<tr>
												<td style="width: 106px;text-align: right;">
													<dict:lang value="时段" />
												</td>
												<td class="dec">
													<dict:selectDict id="calwTime" name="calwTime" dictCode="CALW_TIME" dictValue="" style="width:157px;" custom_option="<option value=''>--请选择--</option>" cssClass="dept_select" />
													<!-- <input type="text" name="calwTime" id="calwTime" maxlength="20"/> -->
													<br /> <span class="Eng"><span id="calwTime_err"></span>
													</span>
												</td>
											</tr>
											<tr>
												<td style="width: 106px;text-align: right;">
													<dict:lang value="开始时间" />
												</td>
												<td class="dec"><input class="input" type="text" name="calwStartH" id="calwStartH" maxlength="2" style="width: 104px" onkeyup="value=value.replace(/[^\d]/g,'')" />&nbsp;&nbsp;:&nbsp;&nbsp;<input class="input" type="text" name="calwStartM" id="calwStartM" maxlength="2" style="width: 104px" onkeyup="value=value.replace(/[^\d]/g,'')" /> <br /> <span class="Eng"><span id="calwStart_err"></span> </span>
												</td>
											</tr>
											<tr>
												<td style="width: 106px;text-align: right;">
													<dict:lang value="结束时间" />
												</td>
												<td class="dec"><input class="input" type="text" name="calwEndH" id="calwEndH" maxlength="2" style="width: 104px" onkeyup="value=value.replace(/[^\d]/g,'')" />&nbsp;&nbsp;:&nbsp;&nbsp;<input class="input" type="text" name="calwEndM" id="calwEndM" maxlength="2" style="width: 104px" onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
											</tr>
											<tr>
												<td width="60%" colspan="2"><span style="margin-left: 145px;"><dict:lang
																value="时间范围：00：00--23：59" /></span></td>
											</tr>
										</table>
									</div>
								</div>
								<div class="dialog-mask" id="addFCWTshadow" style="z-index:1029"></div>
								<!-- addFCWTpop end -->

                                <!--列表-->
		 						<div style="margin-top:1px;">
									<div style="width:100%;float: left;">
										<div class="mod-hd" style="border: none;height: auto;margin: 5px 0;">
											<div class="mod-hd">
												<h3 class="tit"><dict:lang value="时段信息"/></h3>
												<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;">
    												<button type="button" onclick="popWorkTimeDiv();" style="padding:0;" title="新增">
    																<i class="ico ico-kl-new-add ico-small"></i>
    															</button>
    												<button type="button" onclick="delRow();" style="padding:0" title="删除">
    																<i class="ico ico-sc-new-add ico-small"></i>
    															</button>
    											</div>
											</div>
											
										</div>
											<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
										<form id="worktimeForm" name="worktimeForm" action="${path}buss/bussModel.ms" method="post">
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									    <td class="datagrid-cell" align="center" style="width:30px;">
										</td>
										<td class="datagrid-cell" align="center" style="width:30px;">
											<input type="checkbox" id="selectAll" onclick="selectAll1()" style="cursor: pointer;" title="全选">
										</td>
										<td class="datagrid-cell" align="center" style="width:175px;">
											<dict:lang value="班别" />
										</td>
										<td class="datagrid-cell" align="center" style="width:175px;">
											<dict:lang value="时段" />
										</td>
										<td class="datagrid-cell" align="center" style="width:175px;">
											<dict:lang value="开始时间" />
										</td>
										<td class="datagrid-cell" align="center" style="width:175px;">
											<dict:lang value="结束时间" />
										</td>									
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:285px;"><!--130-->
							<table class="datagrid-btable fixedTable isDefTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addworkTime" >
								 <c:forEach items="${dataList}" var="item" varStatus="status">
    								<tr id="${item.ID}" name="${item.ID}">
    									<td  align='center' style='width:30px;'>
    										${status.count}
    									</td>															      
    									<td class='datagrid-cell' style='text-align:center;width:30px;'>
											<input type='checkbox' style='cursor: pointer;'>
    									</td>
    									<td name='calwGroup' align='center' style='width:175px;'>
    										${item.QIT_GROUP}
    									</td>
    									<td name='calwTime' align='center' style='width:175px;'>
    										${item.QIT_TIME_INTERVAL}
    									</td>
    									<td name='calwStart' align='center' style='width:175px;'>
    										${fn:substring(item.QIT_BEGIN_TIME,11,16)}
    									</td>
    									<td name='calwEnd' align='center' style='width:175px;'>
											${fn:substring(item.QIT_END_TIME,11,16)}
    									</td>
    								</tr>
    							</c:forEach>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
											
										</form>
									</div>
								</div>

								

								<div>
								        <DIV id="content2" style="display:none"></DIV>
								
								</div>

							</DIV>
						</DIV>
					</DIV>
				</DIV>
			</DIV>

		</DIV>
	</div>
<script type="text/javascript">
/**	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		var qiType='${dataMap.QI_TYPE}';
		if(qiType==1){
			$("#paraMapObj_QI_ADVANCE_ALARM").attr("disabled",true);
	    	$("#paraMapObj_QI_MODEL").attr("disabled",true);
	    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled",true);
	    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		}else if(qiType==2){
			$("#paraMapObj_QI_ADVANCE_ALARM").attr("disabled",false);
	    	$("#paraMapObj_QI_MODEL").attr("disabled",false);
	    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled",true);
	    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		}else if(qiType==3){
			$("#paraMapObj_QI_ADVANCE_ALARM").attr("disabled",false);
	    	$("#paraMapObj_QI_MODEL").attr("disabled",false);
	    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled",true);
	    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		}
		var modelType='${dataMap.QI_MODEL}';
		if('${dataMap.QI_MODEL}'==1){
			$("#paraMapObj_QI_INPUT_TIME").attr("disabled",true);
		}else if('${dataMap.QI_MODEL}'==2){
			$("#paraMapObj_QI_INPUT_TIME").attr("disabled",false);
			$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	**/
	
	var paginationImpl = {};
		var loaded = 1;
		var tab_len = 2;

		var currentTag;
		var tabs = "";

		function switchTag(tag, content, url) {
			if(currentTag == tag) {
				return false;
			}
			document.getElementById("content2").style.display = "";
			for(i = 1; i < (tab_len + 1); i++) {
				if("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
				}
				$("#" + tag).addClass("current").siblings().removeClass("current");
				//if("content" + i == content) {
					//currentTag = tag;
					//document.getElementById(content).className = "";
				//} else {
					//document.getElementById("content" + i).className = "hidecontent";
				//}
				//document.getElementById("content").className = content;
			}
		}
	$(function(){
	var qiType='${dataMap.QI_TYPE}';
		if(qiType==1){
			$("#paraMapObj_QI_ADVANCE_ALARM").attr("disabled",true);
	    	$("#paraMapObj_QI_MODEL").attr("disabled",true);
	    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled",true);
	    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		}else if(qiType==2){
			$("#paraMapObj_QI_ADVANCE_ALARM").attr("disabled",false);
	    	$("#paraMapObj_QI_MODEL").attr("disabled",false);
	    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled",true);
	    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		}else if(qiType==3){
			$("#paraMapObj_QI_ADVANCE_ALARM").attr("disabled",false);
	    	$("#paraMapObj_QI_MODEL").attr("disabled",false);
	    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled",true);
	    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		}
		var modelType='${dataMap.QI_MODEL}';
		if('${dataMap.QI_MODEL}'==1){
			$("#paraMapObj_QI_INPUT_TIME").attr("disabled",true);
		}else if('${dataMap.QI_MODEL}'==2){
			$("#paraMapObj_QI_INPUT_TIME").attr("disabled",false);
			$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		}
		
	    if('${dataMap.QI_DEFAULT_FALG}'=="Y"){
			$("#QI_DEFAULT_FALG").attr("checked","checked");
			$("#QI_DEFAULT_FALG").val("Y");
		}else{
			$("#QI_DEFAULT_FALG").attr("checked",false);
			$("#QI_DEFAULT_FALG").val("N");
		}
		var  aa='${dataMap.QI_ALTERATE_FLAG}';
		console.log("aa:"+aa);
		if('${dataMap.QI_ALTERATE_FLAG}'=="Y"){
			$("#QI_ALTERATE_FLAG").attr("checked","checked");
			$("#QI_ALTERATE_FLAG").val("Y");
		}else{
			$("#QI_ALTERATE_FLAG").attr("checked",false);
			$("#QI_ALTERATE_FLAG").val("N");
		}
	    
	    
	})
	$('#paraMapObj_QI_ADVANCE_ALARM').bind('keyup', function () {
	     var calwStart=$("#paraMapObj_QI_ADVANCE_ALARM");
             if( ! /^\+?[1-9][0-9]*$/.test(this.value)){
             	//this.value='';
             	_alertValMsg($('#paraMapObj_QI_ADVANCE_ALARM'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         $('#paraMapObj_QI_INPUT_TIME').bind('keyup', function () {
	     var calwStart=$("#paraMapObj_QI_INPUT_TIME");
             if( ! /^\+?[1-9][0-9]*$/.test(this.value)){
             	//this.value='';
             	_alertValMsg($('#paraMapObj_QI_INPUT_TIME'),"<dict:lang value="该项只能为正整数" />");
             }
         });
	$("#paraMapObj_QI_TYPE").change(function() {
			var type = $(this).val();
			//alert(type);
			if(type == 1) {
				//免检
				$("#paraMapObj_QI_ADVANCE_ALARM").attr("disabled", "disabled");
		    	$("#paraMapObj_QI_MODEL").attr("disabled", "disabled");
		    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled", "disabled");
		    	$("#paraMapObj_QI_ADVANCE_ALARM").val("");
		    	$("#paraMapObj_QI_MODEL").val("");
		    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
		    	$("#paraMapObj_QI_INPUT_TIME").val("");

			} else if(type == 2) {
				//抽检
				$("#paraMapObj_QI_ADVANCE_ALARM").removeAttr("disabled");
		    	$("#paraMapObj_QI_MODEL").removeAttr("disabled");
		    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled", "disabled");
		    	$("#paraMapObj_QI_MODEL").val("");
		    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
                $("#paraMapObj_QI_INPUT_TIME").val("");
			} else if(type == 3) {
				//全检
				$("#paraMapObj_QI_ADVANCE_ALARM").removeAttr("disabled");
		    	$("#paraMapObj_QI_MODEL").removeAttr("disabled");
		    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled", "disabled");
		    	$("#paraMapObj_QI_MODEL").val("");
		    	$("#paraMapObj_QI_MODEL").trigger("chosen:updated");
				$("#paraMapObj_QI_INPUT_TIME").val("");
			}
		});
		$("#paraMapObj_QI_MODEL").change(function() {
			var type = $(this).val();
			//alert(type);
			if(type == 1) {
				//免检
		    	$("#paraMapObj_QI_INPUT_TIME").attr("disabled", "disabled");
		    	$("#paraMapObj_QI_INPUT_TIME").val("");

			} else if(type == 2) {
				//抽检
		    	$("#paraMapObj_QI_INPUT_TIME").removeAttr("disabled");
		    	//$("#addDel").css("display","none");
			} else{
				$("#paraMapObj_QI_INPUT_TIME").attr("disabled", "disabled");
		    	$("#paraMapObj_QI_INPUT_TIME").val("");
			}
		});
	
	function popWorkTimeDiv() {
			$("#addFCWTpop").show();
			$("#addFCWTshadow").show();
			$("#addFCWTpop").draggable();
			$('.chosen-container').css("width", "230px");
		}
	function hideTimeDiv() {
			document.getElementById("calwGroup_err").innerHTML = "";
			document.getElementById("calwTime_err").innerHTML = "";
			document.getElementById("calwStart_err").innerHTML = "";
			$("#calwInterDay").attr("checked", false);
			$("#calwInterDay").val("0");
			$("#calwGroup").find("option[value='']").attr("selected", true);
			$("#calwTime").find("option[value='']").attr("selected", true);
			$("#calwGroup").trigger("chosen:updated");
			$("#calwTime").trigger("chosen:updated");
			//document.getElementById(showId).style.display = 'none';
			//document.getElementById(backId).style.display = 'none';
			$("#addFCWTpop").hide();
			$("#addFCWTshadow").hide();
			document.getElementById("calwGroup").value = "";
			document.getElementById("calwTime").value = "";
			document.getElementById("calwStartH").value = "";
			document.getElementById("calwStartM").value = "";
			document.getElementById("calwEndH").value = "";
			document.getElementById("calwEndM").value = "";
			closeDivFp("addFCWTpoppop");
		}
	var workTimeCount = 0;
	
	function addWorkTimeFun() {
            
			if(!checkWData()) {
				return;
			}
			var len = $("#addworkTime tr").length;
			//$("#addCalForm").append("<input type='hidden' id='work_time_n" + workTimeCount + "' name='work_time_n" + workTimeCount + "' value='" + $("#calwGroup").val() + "'>");
			//$("#addCalForm").append("<input type='hidden' id='work_time_t" + workTimeCount + "' name='work_time_t" + workTimeCount + "' value='" + $("#calwTime").val() + "'>");
			//$("#addCalForm").append("<input type='hidden' id='work_time_s" + workTimeCount + "' name='work_time_s" + workTimeCount + "' value='" + $("#calwStartH").val() + ":" + $("#calwStartM").val() + "'>");
			//$("#addCalForm").append("<input type='hidden' id='work_time_e" + workTimeCount + "' name='work_time_e" + workTimeCount + "' value='" + $("#calwEndH").val() + ":" + $("#calwEndM").val() + "'>");
		//	$("#workTime tbody:last").append("<input type='hidden' id='sr" + workTimeCount + "' value=''>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='addNew" + workTimeCount + "' ></tr>");/*onclick=\"wGroup('" + $("#calwGroup").val() + "','" + $("#calwStartH").val() + "','" + $("#calwStartM").val() + "','" + $("#calwEndH").val() + "','" + $("#calwEndM").val() + "','" + $("#calwTime").val() + "','" + workTimeCount + "','" + $("#calwInterDay").val() + "');\"*/
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td align='center' style='width:30px;'>" +(len+1)+ "</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align:center;'><input type='checkbox' style='cursor: pointer;'></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwGroup' align='center' style='width:175px;'>" + $("#calwGroup").val() + "</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwTime' align='center' style='width:175px;'>" + $("#calwTime").val() + "</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwStart' align='center' style='width:175px;'>" + $("#calwStartH").val() + ":" + $("#calwStartM").val() + "</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwEnd' align='center' style='width:175px;'>" + $("#calwEndH").val() + ":" + $("#calwEndM").val() + "</td>");
			workTimeCount++;len++;
			//init();
			document.getElementById("calwGroup").value = "";
			document.getElementById("calwTime").value = "";
			document.getElementById("calwStartH").value = "";
			document.getElementById("calwStartM").value = "";
			document.getElementById("calwEndH").value = "";
			document.getElementById("calwEndM").value = "";
			$("#calwGroup").find("option[value='']").attr("selected", true);
			$("#calwTime").find("option[value='']").attr("selected", true);
			$("#calwGroup").trigger("chosen:updated");
			$("#calwTime").trigger("chosen:updated");
			document.getElementById("addFCWTpop").style.display = 'none';
			document.getElementById("addFCWTshadow").style.display = 'none';
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
			//var tableTrJs = $("#addworkTime tr");_tongLineColor(tableTrJs);
		}
	function checkWData() {
			//document.getElementById("calwGroup_err").innerHTML = "";
			//document.getElementById("calwTime_err").innerHTML = "";
			//document.getElementById("calwStart_err").innerHTML = "";
			if($("#calwStartH").val() == null || $("#calwStartH").val() == "") {
				$("#calwStartH").val("00");
			}

			if($("#calwStartM").val() == null || $("#calwStartM").val() == "") {
				$("#calwStartM").val("00");
			}
			if($("#calwEndH").val() == null || $("#calwEndH").val() == "") {
				$("#calwEndH").val("00");
			}
			if($("#calwEndM").val() == null || $("#calwEndM").val() == "") {
				$("#calwEndM").val("00")
			}
			if(parseInt($("#calwStartH").val()) != 0 && $("#calwStartH").val().length == 1) {
				$("#calwStartH").val("0" + $("#calwStartH").val());
			}
			if(parseInt($("#calwStartM").val()) != 0 && $("#calwStartM").val().length == 1) {
				$("#calwStartM").val("0" + $("#calwStartM").val());
			}
			if(parseInt($("#calwEndH").val()) != 0 && $("#calwEndH").val().length == 1) {
				$("#calwEndH").val("0" + $("#calwEndH").val());
			}
			if(parseInt($("#calwEndM").val()) != 0 && $("#calwEndM").val().length == 1) {
				$("#calwEndM").val("0" + $("#calwEndM").val());
			}

			var calwGroup = document.getElementById("calwGroup");
			if($("#calwGroup").val() == null || $("#calwGroup").val() == "") {
				_alertValMsg(calwGroup, "<dict:lang value='班别名称不能为空 ' />");
				return false;
			}
			
			var calwTime = document.getElementById("calwTime");
			if($("#calwTime").val() == null || $("#calwTime").val() == "") {
				_alertValMsg(calwTime, "<dict:lang value='班别时段不能为空 ' />");
				return false;
			}
			var calwStart=$("#calwStartH");
			if(parseInt($("#calwStartH").val()) < 0 || parseInt($("#calwStartH").val()) > 23 ||
				parseInt($("#calwStartM").val()) < 0 || parseInt($("#calwStartM").val()) > 60 ||
				parseInt($("#calwEndH").val()) < 0 || parseInt($("#calwEndH").val()) > 23 ||
				parseInt($("#calwEndM").val()) < 0 || parseInt($("#calwEndM").val()) > 60) {
				_alertValMsg(calwStart, "<dict:lang value='请输入正确的时间'  />");
				return false;
			}
			if (parseInt($("#calwStartH").val())>parseInt($("#calwEndH").val())) {
				_alertValMsg(calwStart,"<dict:lang value='开始时间不能晚于结束时间' />");
   				return false;
		    }else if (parseInt($("#calwStartH").val())==parseInt($("#calwEndH").val())) {
				if (parseInt($("#calwStartM").val())>parseInt($("#calwEndM").val())) {
					_alertValMsg(calwStart,"<dict:lang value='开始时间不能晚于或等于结束时间' />");
					return false;}
			}
			
			var tableWork = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var count = tableWork.rows.length;
			var calwStart, calwStarts, calwEnd, calwEnds;
			var calwStartInput=document.getElementById("calwStartH");
			
			if(count >= 1) {
				for(var i = 0; i < count; i++) {
					var calwGroup = document.getElementById("calwGroup");
					if ( $("#calwGroup").val() == $.trim(tableWork.rows[i].cells[2].innerHTML)) {
						if ($("#calwTime").val() == $.trim(tableWork.rows[i].cells[3].innerHTML)) {
   							_alertValMsg(calwGroup,"<dict:lang value="同班别下已存在该时段" />");
       						return false;
						}
				        }
				        calwStart = $.trim(tableWork.rows[i].cells[4].innerHTML);
							calwEnd = $.trim(tableWork.rows[i].cells[5].innerHTML);
							calwStarts = new Array();
							calwEnds = new Array();
							calwStarts = calwStart.split(":");
							calwEnds = calwEnd.split(":");
							if(parseInt($("#calwStartH").val()) > parseInt(calwStarts[0])) {
						if(parseInt($("#calwStartH").val()) < parseInt(calwEnds[0])) {
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}
					if(parseInt($("#calwEndH").val()) > parseInt(calwStarts[0])) {
						if(parseInt($("#calwEndH").val()) < parseInt(calwEnds[0])) {
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}
					if(parseInt($("#calwStartH").val()) < parseInt(calwStarts[0])) {
						if(parseInt($("#calwEndH").val()) > parseInt(calwEnds[0])) {
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}
					/*if(parseInt($("#calwStartH").val()) == parseInt(calwStarts[0])) {
						if(parseInt($("#calwStartM").val()) < parseInt(calwStarts[1])) {
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}
					if(parseInt($("#calwEndH").val()) == parseInt(calwEnds[0])) {
						if(parseInt($("#calwEndM").val()) < parseInt(calwEnds[1])) {
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}
					if(parseInt($("#calwEndH").val()) == parseInt(calwStarts[0])) {
						if(parseInt($("#calwEndM").val()) > parseInt(calwEnds[1])) {
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}*/
					if(parseInt($("#calwStartH").val()) == parseInt(calwStarts[0])&&parseInt($("#calwEndH").val()) != parseInt(calwStarts[0])) {
					
						if(parseInt($("#calwStartM").val()) < parseInt(calwStarts[1]) || parseInt($("#calwStartM").val()) < parseInt(calwEnds[1])) {//alert("4");
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}
					if(parseInt($("#calwEndH").val()) == parseInt(calwEnds[0])&&parseInt($("#calwEndH").val()) != parseInt(calwStarts[0])) {
					
						if(parseInt($("#calwEndM").val()) < parseInt(calwEnds[1]) || parseInt($("#calwEndM").val()) < parseInt(calwEnds[1])) {//alert("5");
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}
					if(parseInt($("#calwEndH").val()) == parseInt(calwStarts[0])) {
					
						if(parseInt(calwStarts[1]) < parseInt($("#calwStartM").val()) && parseInt($("#calwStartM").val()) < parseInt(calwEnds[1])) {//alert("6");
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
						if(parseInt(calwEnds[1]) > parseInt($("#calwEndM").val()) && parseInt($("#calwEndM").val()) > parseInt(calwStarts[1])) {//alert("6");
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
						if(parseInt(calwEnds[1]) < parseInt($("#calwEndM").val()) && parseInt($("#calwStartM").val()) < parseInt(calwStarts[1])) {//alert("6");
							_alertValMsg(calwStartInput, "<dict:lang value="时间不能交叉 " />");
							return false;
						}
					}
					//if($("#calwGroup").val() == tableWork.rows[i].cells[1].innerHTML) {
						//if($("#calwTime").val() == tableWork.rows[i].cells[2].innerHTML) {
							
						//}
					//}
				}
			}
			return true;
		}
    function selectAll1() {
		if($("#selectAll").attr("checked")) {
			$("#addworkTime :checkbox").each(function() {
				$(this).attr("checked", true);
			});
		} else {
			$("#addworkTime :checkbox").each(function() {
				$(this).attr("checked", false);
			});
		}

	}
    function delRow(){
    	var i = 0;
    	var ids="";
		$("#addworkTime :checkbox").each(function() {
			if($(this).attr("checked")) {
				i++;
				var trid = "#" + $(this).parent().parent().parent().attr("id");
				var trIdStr=$(this).parent().parent().parent().attr("id");
				if(trIdStr.indexOf("addNew")!=-1){
					$(trid).remove();
				}else{
					ids+=$.trim(trIdStr)+",";
				}
			}
		});
		var jsondata={"ids": ids};
		var listUrl=getUrl();
		$.ajax({
				type: "post",
				dataType: "json",
				url: listUrl,
				data: jsondata,
				success: function(data) {
					//删除数据
					var idStrs=ids.split(",");
					for(var i=0;i<idStrs.length;i++){
						var trId="#"+idStrs[i];
						$(trId).remove();
					}
					
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
                  util.closeLoading();
                  var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                  if (null != sessionstatus && sessionstatus == "noAuthority") {
                  }else{
                    util.alert("error:"+errorThrown);
                  }
                }
		});

		$("#selectAll").attr("checked", false);
		if(i == 0) {
			utilsFp.confirmIcon(3, "", "", "", "请选择要删除的数据", 0, "", "");
		}
		reSort("addworkTime");
		//var tableTrJs = $("#addworkTime tr");_tongLineColor(tableTrJs);
    }
    function reSort(objid){  
                   var i = 1;
                   $("#"+objid+" tr").each(function(){ 
       
                    $(this).find("td").eq(0).text(i);
                       
                    i++;
                   });
                }
    function changeVal() {
		if($("#QI_DEFAULT_FALG").attr("checked")) {
			$("#QI_DEFAULT_FALG").val("Y");
		}else {
			$("#QI_DEFAULT_FALG").val("N");
		}
	}
    function changeVal2() {
		if($("#QI_ALTERATE_FLAG").attr("checked")) {
			$("#QI_ALTERATE_FLAG").val("Y");
		}else{
			$("#QI_ALTERATE_FLAG").val("N");
		}
	}
    function saveTimeInfo(){
    	var id="";
    	var groups="";
		var times="";
	    var timeStarts="";
	    var timeEnds="";
    	var trs = $("#addworkTime tr");
		for(var i = 0; i < trs.length; i++) {
            id=$("#addworkTime tr:eq(" + i + ")").attr("id");
            
            if(id.indexOf("addNew")!=-1){
				var group = $("#addworkTime tr:eq(" + i + ")").find("td:eq(2)").text();
				groups += $.trim(group) + ",";
	
				var time = $("#addworkTime tr:eq(" + i + ")").find("td:eq(3)").text();
				times += $.trim(time) + ",";
	
				var timeStart = $("#addworkTime tr:eq(" + i + ")").find("td:eq(4)").text();
				timeStarts += $.trim(timeStart) + ",";
	
				var timeEnd = $("#addworkTime tr:eq(" + i + ")").find("td:eq(5)").text();
				timeEnds += $.trim(timeEnd) + ",";
			}
		}
		$("#groups").val(groups);
		$("#times").val(times);
		$("#timeStarts").val(timeStarts);
		$("#timeEnds").val(timeEnds);
    }
    function getUrl(){
  var url="${path}buss/bussModel_exeFunc.ms?funcMId=6354d11377f54e48b4e8789ba9a6e531&formId=%{formId}";
  return url;
}

function editInfo(){
            if(!val.valNullData()){
				return ;
			}
			
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
        		return ;
        	}
             var advanceAlarm=$("#paraMapObj_QI_ADVANCE_ALARM").val();
             if( /^\+?[1-9][0-9]*$/.test(advanceAlarm)|| /^$/.test(advanceAlarm) ){
             }else{
                  $("#paraMapObj_QI_ADVANCE_ALARM").val("")
                  return;
             }

             var inputTimeVal=$("#paraMapObj_QI_INPUT_TIME").val();
             if( /^\+?[1-9][0-9]*$/.test(inputTimeVal)|| /^$/.test(inputTimeVal) ){
             }else{
                  $("#paraMapObj_QI_INPUT_TIME").val("")
                  return;
             }

                if($("#paraMapObj_QI_TYPE").val()!="1"&&$("#paraMapObj_QI_MODEL").val()==""){
                 _alertValMsg($("#paraMapObj_QI_MODEL_chosen"),"<dict:lang value="该项不能为空 " />");				
                   
                return;
                } 
                if($("#paraMapObj_QI_TYPE").val()=="2"||$("#paraMapObj_QI_TYPE").val()=="3"){
                  if($("#paraMapObj_QI_ADVANCE_ALARM").val()==""){
                    _alertValMsg($("#paraMapObj_QI_ADVANCE_ALARM"),"<dict:lang value="该项不能为空 " />");	
                    return;
                   }
                } 
                if($("#paraMapObj_QI_MODEL").val()=="1"){
                    if($("#addworkTime tr").length==0){
                        utilsFp.confirmIcon(3, "", "", "", "请新增时段信息", 0, "", "");
                        return false;
                    }
                }
                
                if($("#paraMapObj_QI_MODEL").val()=="2"){
                  if($("#paraMapObj_QI_INPUT_TIME").val()==""){
                    _alertValMsg($("#paraMapObj_QI_INPUT_TIME"),"<dict:lang value="该项不能为空 " />");
                    return;
                   }
                   var inputTime=parseInt($("#paraMapObj_QI_INPUT_TIME").val());
                   var advanceAlarm=parseInt($("#paraMapObj_QI_ADVANCE_ALARM").val());
                   if(inputTime<advanceAlarm){
                       _alertValMsg($("#paraMapObj_QI_ADVANCE_ALARM"), "<dict:lang value="提前预警时间不能大于投产巡检时间" />");
                        return;
                   }
                }
                
            var  cc='${dataMap.QI_ALTERATE_FLAG}';
		        console.log("cc:"+cc);
                        //alert();
                        saveTimeInfo();
            
                        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=c0054e9adbb04d3ea0c22b6d91e8c609";
       
			document.forms.editForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
}
//重置	
		function resetForm(){
		    
			$("#editForm")[0].reset();
			$(".dept_select").trigger("chosen:updated");
		}
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<bu:submit viewId="3e11863fa2944f03a4622887f8ccbcb6" />
	<bu:script viewId="3e11863fa2944f03a4622887f8ccbcb6" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>