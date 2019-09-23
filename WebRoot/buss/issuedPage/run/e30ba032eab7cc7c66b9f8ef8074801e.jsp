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
  
	<!-- head里面 -->
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
	</style>
	
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 


</head>

<body style="">
	<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
		<div class="hd">
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

				<button type="button" onclick="saveMTInfo()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
				<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			</div>

		</div>
		<div class="bd" style="height: 534px;">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
			<bu:set name="paraMapObj" value="${dataId}" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" type="add" />
			<div class="mod">
				<div class="mod-hd">
					<h3 class="tit"><dict:lang value="保养信息"/></h3>
				</div>
				<div class="mod-hd" style="height:160px;border-bottom: none;z-index: 1;">
					<table class="basic-table">
						<input type="hidden" name="formIds" value="9fe40c6681484bbdaeeee44cc7fe3c2a" />
							<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
							<input type="hidden" name="formId" id="formId3" value='123456'/>
						<input type="hidden" name="9fe40c6681484bbdaeeee44cc7fe3c2a" value="paraMap1@" />
						<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
						<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
						<input type="hidden" name="ids" id="ids" />
						<input type="hidden" name="sns" id="sns" />
						<input type="hidden" name="codes" id="codes" />
						<input type="hidden" name="names" id="names" />
						<input type="hidden" name="types" id="types" />
						<input type="hidden" name="specs" id="specs" />
						<input type="hidden" name="cfmId" id="cfmId" value="0" />

						<s:set name="_$viewId" value="'30a234c36f704b378f9cc974598b8b1f'" />
						<s:set name="_$formId_1" value="'9fe40c6681484bbdaeeee44cc7fe3c2a'" />
						<s:set name="_$type" value="'add'" />

						<tr>
							<td class="name" style="width:84px;" /><span class="dot">*</span>
							<bu:uitn colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" />
							</td>
							<bu:td cssClass="dec" style="width:225px;" colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a">
								<bu:ui colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_TYPE}" formIndex="1" style="width:200px;" /></bu:td>

							<td class="name" style="width:72px;" /><span class="dot">*</span>
							<bu:uitn colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" />
							</td>
							<bu:td cssClass="dec" style="width:225px;" colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a">
								<bu:ui colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_REPORTER}" formIndex="1" style="width:200px;" /></bu:td>

							<td class="name" style="width:100px;" /><span class="dot">*</span>
							<bu:uitn colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" />
							</td>
							<bu:td cssClass="dec" style="width:205px;" colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a">
								<bu:ui colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_MT_MAN}" formIndex="1" style="width:200px;" /></bu:td>
						</tr>

						<tr>
							<td class="name" /><span class="dot">*</span>
							<bu:uitn colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" />
							</td>
							<bu:td cssClass="dec" colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a">
								<bu:ui colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_AUDIT}" formIndex="1" style="width:200px;" /></bu:td>

							<td class="name" />
							<bu:uitn colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" />
							</td>
							<bu:td cssClass="dec" colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a">
								<bu:ui colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCF_EC_CODE}" formIndex="1" style="width:200px;" /></bu:td>

							<td class="name" />
							<bu:uitn colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" />
							</td>
							<bu:td cssClass="dec" colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a">
								<bu:ui colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCF_EC_DES}" formIndex="1" style="width:200px; disabled:disabled;" /></bu:td>
						</tr>

						<tr>
							<td class="name" />
							<bu:uitn colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" />
							</td>
							<bu:td cssClass="dec" colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" colspan="8">
								<bu:ui colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_DEFECT_REMARK}" formIndex="1" style="height:80px;width:100%;" /></bu:td>
						</tr>
					</table>
				</div>

				<div style="width:100%;">
					<div class="mod-hd">
						<h3 class="tit">FEEDER信息</h3>
					   
						<div class="extend-btn" style="float: right;margin: 5px 0;">
							 		<button type="button" id="front_add" onclick="popWorkDiv('backShadow','BlankSpacs')" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
    						<button type="button" id="front_delete" onclick="delFrontList();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>
    					</div>
                        <div style="float: right;">
						   	<span>去除通道码</span><input type="checkbox" id="_rmCode" style="cursor: pointer;margin-right: 15px; vertical-align: top;margin-top: 12px; margin-left: 5px;" title="去除通道码">
						    <span>FEEDER SN</span><input type="text" id="_searchFeederSN" style="margin-right:10px;margin-left: 5px;" class=" input isSubmit" placeholder="请输入FEEDER SN，按Enter键查询"/>
						</div>
					</div>
					
				</div>
			
			<div class="mod-hd" style="height:150px;border-bottom: none;clear:both;margin-top: 5px;line-height: 30px;">
					<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
								<tr class=" thcolor">
								<td class="datagrid-cell" style="width:30px; text-align:center;"></td>
								<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll2" onclick="select_All()" style="cursor: pointer;" title="全选"></span></td>
								<td class="datagrid-cell" style="width:223px;">
									<dict:lang value="FEEDER SN" /> 
								</td>
								<td class="datagrid-cell" style="width:180px;"> 
									<dict:lang value="FEEDER规格" />
								</td>
								<td class="datagrid-cell" style="width:160px;">
									<dict:lang value="FEEDER类型" />
								</td>
								<td class="datagrid-cell" style="width:180px;">
									<dict:lang value="最后保养时间" />
								</td>
										
								</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
					
					<div id="BlankSpacs" class="black_overlay"> </div>
					<div class="dialog" id="backShadow" style=" top: calc(50% - 200px); left: calc(50% - 405px); margin-left:0;width: 810px; height: 400px; z-index: 3099;display: none;background-color: white;">
						<div style="display: block;">
							<div class="dialog-s1" id="addRole" style="width:810px;display:block;left:253px;">
								<div class="dialog-hd">
									选择Feeder信息
								</div>
							</div>
						</div>
						<a class="dialog-close" href="javascript:void(0);" onclick="closeAlert('backShadow','BlankSpacs');"></a>
						<div class="optn optn_div">
							<button type="button" onclick="choseZjList('backShadow','BlankSpacs')"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
							<button type="button" onclick="closeAlert('backShadow','BlankSpacs');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
							<button type="button" onclick="getZjList('formId3')"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
						</div>

						<div class="dialog-bd-div"  id="zjalert" style="z-index:9999;margin-top: 10px;">
							<!--90-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							Feeder SN <input type="text" class="dec-self input" id="zj_sn" name="zj_sn" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Feeder 类型
							<select class="dec-self input" id="zj_type" name="zj_type">
								<option value="0">--请选择--</option>
								<option value="1">单通道</option>
								<option value="2">双通道</option>
								<option value="3">三通道</option>
							</select>
				<!--<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456" target="secondTable">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" style="width:30px; text-align:center;"><span></span></td>
									<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll1" onclick="selectAll()" style="cursor: pointer;" title="全选"></span></td>
									<td class="datagrid-cell" style="width:170px">
										<dict:lang value="FEEDER SN" /> </th>
									<td class="datagrid-cell" style="width:170px">
										<dict:lang value="FEEDER规格" />
									</td>
									<td class="datagrid-cell" style="width:170px">
										<dict:lang value="FEEDER类型" />
									</td>
									<td class="datagrid-cell" style="width:170px">
										<dict:lang value="最后保养时间" />
									</td>								
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:220px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax123456" target="secondTable">
								<tbody id="zjTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>-->
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456" target="secondTable">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" style="width:30px; text-align:center;"><span></span></td>
									<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll1" onclick="selectAll()" style="cursor: pointer;" title="全选"></span></td>
									<td class="datagrid-cell" style="width:170px">
										<dict:lang value="FEEDER SN" /> </th>
									<td class="datagrid-cell" style="width:170px">
										<dict:lang value="FEEDER规格" />
									</td>
									<td class="datagrid-cell" style="width:170px">
										<dict:lang value="FEEDER类型" />
									</td>
									<td class="datagrid-cell" style="width:170px">
										<dict:lang value="最后保养时间" />
									</td>								
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:220px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax123456" target="secondTable">
								<tbody id="zjTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
							<!--<div>
								<table class="dlist-table table-line " style="width:100%;table-layout: fixed;" target="secondTable">

									<thead>
										<tr class="thcolor">
											<th class="datagrid-cell" style="width:2%; text-align:center;"><span></span></th>
											<th class="datagrid-cell" style="width:3%; text-align:center"><span><input type="checkbox" id="selectAll1" onclick="selectAll()" style="cursor: pointer;" title="全选"></span></th>
											<th class="datagrid-cell" style="width:5%;">
												<dict:lang value="FEEDER SN" /> </th>
											<th class="datagrid-cell" style="width:5%;">
												<dict:lang value="FEEDER规格" />
											</th>
											<th class="datagrid-cell" style="width:5%;">
												<dict:lang value="FEEDER类型" />
											</th>
											<th class="datagrid-cell" style="width:10%;">
												<dict:lang value="最后保养时间" />
											</th>

										</tr>
									</thead>
									<tbody id="zjTbody" style="background-color:white; height: 250px; overflow-y: auto; ">
									</tbody>
								</table>
							</div>-->

							<div style="background-color: white;">
								<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchZjList&formId=formId3&showLoading=0" />
								</div>
			     
			     
								</div>
							</div>
							
							
						</div>
					</div>
				</div>

			</div>

		</div>
		<bu:jsVal formId="9fe40c6681484bbdaeeee44cc7fe3c2a" formIndex="1" />
		</form>
	</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<bu:submit viewId="30a234c36f704b378f9cc974598b8b1f" />
	<bu:script viewId="30a234c36f704b378f9cc974598b8b1f" />
	<script type="text/javascript">
	
	$('#_searchFeederSN').keydown(function(event) {
	    
	    if (13 == event	.keyCode) {
	    console.log(111)
	    searchBySN();
	    
		}

	})
	
	function searchBySN() {
	    	
		var feederSn = $.trim($("#_searchFeederSN").val());
		if (feederSn == "") {
		    utilsFp.confirmIcon(3, "", "", "", "SN为空", 0, "", "");
		    //utilsFp.alert("SN为空");
		    return;
		}
		util.showLoading("处理中...");
		if ($('#_rmCode').prop('checked')) {
		    feederSn = feederSn.substr(0,feederSn.length-1);
		}
		
		var paginationImpl='formId3';
		var jsondata;
		if($("#cfmId").val() == 0) {
			jsondata = { "zj_sn": feederSn, "zj_type": '' ,"searchLike":"1"};
		} else {
			jsondata = { "zj_sn": feederSn, "zj_type": '',"searchLike":"1", "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
		}

		$.ajax({
			type: "post",
			dataType: "json",
			url: "${path}buss/bussModel_exeFunc.ms?funcMId=2198861b6bc54be9b9d7081175907c14",
			data: jsondata,
			success: function(data) {
				util.closeLoading();

				var zjLists = data.ajaxPage.dataList;

				if(null == data.ajaxPage.dataList) {
				    utilsFp.confirmIcon(3, "", "", "", "SN不存在", 0, "", "");
						//utilsFp.alert("SN不存在");

				} else {
				//choseZjList
                    var len = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length;
			        var	zj = zjLists[0];
			        if(len == 0) {							
                    	fillBySn(zj	,1);				
                    }else {
                     var repeat = '0';
                     var zsn = zj.TCF_FEEDER_SN;
                     $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").each(function() {
							var zjSN = $(this).find("td:eq(2)").text();
							if($.trim(zsn) == $.trim(zjSN)) {
								repeat = "1";
							}
						});

						if(	repeat == "0") {
							len = parseInt(len) + parseInt(1);
							fillBySn(zj, len);
						}
                    }
				
				}		
	            pageFun(data.ajaxPage, "formId3");
	            //defTableWidthRewrite("123456");
			},
			error: function(msg) {
				util.closeLoading();
				utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "", "");
			}
		});
	}
	
	function fillBySn(zj,j) {
		var tct_type = "";
		var lastTime = "";

    	if(zj.TCT_TYPE == "1") {
			tct_type = "单通道";
		} else if(zj.TCT_TYPE == "2") {
			tct_type = "双通道";
		} else if(zj.TCT_TYPE == "3") {
			tct_type = "三通道";
		}
		if(zj.TCF_MT_LASTTIME == null) {
			lastTime = "";
		} else {
			lastTime = zj.TCF_MT_LASTTIME;
			lastTime=lastTime.replace("T"," ");
			//alert(lastTime);
		}
		if(j % 2 == 0) {
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234").append("<tr class='datagrid-row' style='cursor:pointer;background:#f0f4fd;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
		} else {
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234").append("<tr class='datagrid-row' style='cursor:pointer;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
		}
		$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td style='width:30px; text-align:center;'><span>" + j + "</span></td>");
		$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' id='selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a' style='cursor: pointer;'></span></td>");
		$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:223px; text-align:center;'>" + zj.TCF_FEEDER_SN + "</td>");
		$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:180px; text-align:center;'>" + zj.TCS_SPEC + " </td>");
		$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:center;'>" + tct_type + "</td>");
		$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:180px; text-align:center;'>" + lastTime  + " </td>");
			
	}
	
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

				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234").append("<tr class='datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234' id='' name=''></tr>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td style='width:30px; text-align:center;'><span>1</span></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:223px;text-align:center;'>${dataList[0].TCF_FEEDER_SN} </td>"); //
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:center;'>${dataList[0].TCS_SPEC} </td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align:center;'>${dataList[0].TCT_TYPE} </td>");
				/*$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'>${dataList[0].CFM_ITEM_NAME} </td>");*/
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:180px; text-align:center;'>${dataList[0].TCF_MT_LASTTIME} </td>");
				$("#front_add").attr("disabled", true);
				$("#front_delete").attr("disabled", true);

			} else {
				$("#front_add").attr("disabled", false);
				$("#front_delete").attr("disabled", false);
			}

			//$("#").val('');
			//$("#paraMap1_TCFM_TYPE_chosen").val('${dataList[0].TCFM_TYPE}');

			$('#paraMap1_TCF_EC_CODE').attr("disabled", "disabled");
			$('#paraMap1_TCF_EC_DES').attr("readonly", "readonly");
			$('#paraMap1_TCF_EC_DES').addClass("readonly");
			$("#paraMap1_TCF_EC_CODE").trigger("chosen:updated");
			$(".<s:property value=" % { @com.more.fw.core.cont.formui.AbsBaseUi @IS_SELECT_FILTER }
				"/>").chosen();
				//defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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

		$("#paraMap1_TCFM_TYPE").change(function() {
			var type = $(this).val();
			//alert(type);
			if(type == 0) {
				//保养
				$('#paraMap1_TCF_EC_CODE').val("");
				$('#paraMap1_TCF_EC_DES').val("");
				$('#paraMap1_TCF_EC_CODE').attr("disabled", "disabled");

				$('#paraMap1_TCF_EC_DES').attr("readonly", "readonly");
				$('#paraMap1_TCF_EC_DES').addClass("readonly");
				$("#paraMap1_TCF_EC_CODE").trigger("chosen:updated");

			} else if(type == 1) {
				$('#paraMap1_TCF_EC_CODE').removeAttr("disabled");
				$('#paraMap1_TCF_EC_DES').removeAttr("disabled");
				$('#paraMap1_TCF_EC_DES').removeAttr("readonly");
				$('#paraMap1_TCF_EC_DES').removeClass("readonly");
				$("#paraMap1_TCF_EC_CODE").trigger("chosen:updated");

			}
		});

		function popWorkDiv(showId, backId) {
			$("#" + showId + ",#" + backId).show();
		//	$("#" + showId).draggable();
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
			var zj_type = $.trim($("#zj_type").val());
			var jsondata = "";
			if($("#cfmId").val() == 0) {
				jsondata = { "zj_sn": zj_sn, "zj_type": zj_type };
			} else {
				jsondata = { "zj_sn": zj_sn, "zj_type": zj_type, "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
			}

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
						utilsFp.alert("未查询到数据");
						$("#zjTbody").html("");
					} else {
						$("#zjTbody").html("");
						var j = 0;
						var tct_type = "";
						var lastTime = "";
						for(var i = 0; i < zjLists.length; i++) {
							var zj = zjLists[i];
							j = ++j;
							if(zj.TCT_TYPE == "1") {
								tct_type = "单通道";
							} else if(zj.TCT_TYPE == "2") {
								tct_type = "双通道";
							} else if(zj.TCT_TYPE == "3") {
								tct_type = "三通道";
							}
							if(zj.TCF_MT_LASTTIME == null) {
								lastTime = "";
							} else {
								lastTime = zj.TCF_MT_LASTTIME;
								lastTime=lastTime.replace("T"," ");
								//alert(lastTime);
							}
							if(j % 2 == 0) {
								$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;background:#f0f4fd;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							} else {
								$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							}
							//$("#zjTbody").append("<tr class='datagrid-row' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							$("#zjTbody tr:last").append("<td style='width:30px; text-align:center;'><span>" + j + "</span></td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' id='selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a' style='cursor: pointer;'></span></td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:170px; text-align:center;'>" + zj.TCF_FEEDER_SN + "</td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:170px; text-align:center;'>" + zj.TCS_SPEC + " </td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:170px; text-align:center;'>" + tct_type + "</td>");
							/*$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'>"+zj.ASSISTANTTOOLNAME +"</td>");*/
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:170px; text-align:center;'>" + lastTime  + " </td>");
							
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
						pageFun(data.ajaxPage, "formId3");
						defTableWidthRewrite("123456");
					}
				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "", "");
				}
			});

		}

		function searchZjList(paginationImpl) {

			util.showLoading("处理中...");
			var zj_sn = $.trim($("#zj_sn").val());
			var zj_type = $.trim($("#zj_type").val());
			var jsondata = { "zj_sn": zj_sn, "zj_type": zj_type, "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
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
						utilsFp.alert("未查询到数据");
						$("#zjTbody").html("");
					} else {
						$("#zjTbody").html("");
						var j = 0;
						var tct_type = "";
						var lastTime = "";
						for(var i = 0; i < zjLists.length; i++) {
							var zj = zjLists[i];
							j = ++j;
							if(zj.TCT_TYPE == "1") {
								tct_type = "单通道";
							} else if(zj.TCT_TYPE == "2") {
								tct_type = "双通道";
							} else if(zj.TCT_TYPE == "3") {
								tct_type = "三通道";
							}
							if(zj.TCF_MT_LASTTIME == null) {
								lastTime = "";
							} else {
								lastTime = zj.TCF_MT_LASTTIME.replace(/T/," ");
							}
							if(j % 2 == 0) {
								$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;background:#f0f4fd;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							} else {
								$("#zjTbody").append("<tr class='datagrid-row' style='cursor:pointer;' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							}
							//$("#zjTbody").append("<tr class='datagrid-row' id=zjId_" + zj.ID + " name=zjId_" + zj.ID + "></tr>");
							$("#zjTbody tr:last").append("<td style='width:30px; text-align:center;'><span>" + j + "</span></td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' id='selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a' style='cursor: pointer;'></span></td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:170px; text-align:center;'>" + zj.TCF_FEEDER_SN + " </td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:170px; text-align:center;'>" + zj.TCS_SPEC + "</td>");
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:170px; text-align:center;'>" + tct_type + "</td>");
							/*$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'>"+zj.ASSISTANTTOOLNAME+" </td>");*/
							$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:170px; text-align:center;'>" + lastTime + "</td>");
						
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
						pageFun(data.ajaxPage, "formId3");
						defTableWidthRewrite("123456");
					}
				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "", "");
				}
			});

		}

		/*function choseZjList(showId, backId) {
			$("#showZJFront").html("");
			var i = 0;
			$("#zjTbody :checkbox").each(function() {
				if($(this).attr("checked")) {
					var trid = $(this).parent().parent().parent().attr("id");
					getInfoToFront(trid, i);
					i++;
				}
			});
			if(i == 0) {
				utilsFp.confirmIcon(3, "", "", "", "请选择要添加的数据", 0, "", "");
			} else {
				$("#" + showId).hide();
				$("#" + backId).hide();
				$("#selectAll1").attr("checked", false);
			}

		}*/

		function choseZjList(showId, backId) {

			var len = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length;

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

			} else { //先判断是否存在相同的SN，若相同则忽略，否则添加

				$("#zjTbody :checkbox").each(function() {
					if($(this).attr("checked")) {
						var is = "0";
						var trid = $(this).parent().parent().parent().attr("id");
						var trSN = $(this).parent().parent().parent().find("td:eq(2)").text();

						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").each(function() {
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

				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234").append("<tr onclick='check_box()' class='datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234' style='cursor:pointer;background:#f0f4fd;' id=" + trId + " name=f" + trId + "></tr>");
			} else {
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234").append("<tr onclick='check_box()' style='cursor:pointer;' class='datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234' id=" + trId + " name=f" + trId + "></tr>");
			}
			////////////////////////////////////////////////////////////////////////////////////////
			//if(index % 2 == 0) {

			//	$("#showZJFront").append("<tr onclick='check_box()' class='showZJFront' style='cursor:pointer;background:#f0f4fd;' id=f" + trId + " name=f" + trId + "></tr>");
			//} else {
			//	$("#showZJFront").append("<tr onclick='check_box()' style='cursor:pointer;' class='showZJFront' id=f" + trId + " name=f" + trId + "></tr>");
			//}
			
			//$("#showZJFront").append("<tr class='showZJFront' id=f" + trId + " name=f" + trId + "></tr>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td style='width:30px; text-align:center;'><span>" + index + "</span></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style=' width:223px;text-align:center;'>" + tr_id.find("td:eq(2)").text() + " </td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:center;'>" + tr_id.find("td:eq(3)").text() + " </td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align:center;'>" + tr_id.find("td:eq(4)").text() + " </td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:center;'>" + tr_id.find("td:eq(5)").text() + " </td>");
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
		//defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
		}

		function saveFix() {
			var ids = "";
			var sns = "";
			var codes = "";
			var names = "";
			var types = "";
			var specs = "";
			var trs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr");
			for(var i = 0; i < trs.length; i++) {

				var id = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:eq(" + i + ")").attr("id");
				id = $.trim(id);
				ids += id + ",";

				var sn = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:eq(" + i + ")").find("td:eq(2)").text();
				sn = $.trim(sn);
				sns += sn + ",";

				var type = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:eq(" + i + ")").find("td:eq(4)").text();
				type = $.trim(type);
				types += type + ",";

				var code = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:eq(" + i + ")").find("td:eq(4)").text();
				code = $.trim(code);
				codes += code + ",";

				var name = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:eq(" + i + ")").find("td:eq(3)").text();
				name = $.trim(name);
				names += name + ",";

				var spec = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:eq(" + i + ")").find("td:eq(3)").text();
				spec = $.trim(spec);
				specs += spec + ",";

			}
			$("#ids").val(ids);
			$("#sns").val(sns);
			$("#codes").val(codes);
			$("#names").val(names);
			$("#types").val(types);
			$("#specs").val(names);
			//console.log(ids);
			//console.log(sns);
			//console.log(types);
			//console.log(names);
			//console.log(specs);
		}

		function selectAll() {
			if($("#selectAll1").attr("checked")) {
				$("#zjTbody :checkbox").each(function() {
					$(this).attr("checked", true);
				});
			} else {
				$("#zjTbody :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}

		}

		function select_All() {
			if($("#selectAll2").attr("checked")) {
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function() {
					$(this).attr("checked", true);
					$(this).parents('tr').css('background-color','#d3eafc')
				});
			} else {
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function() {
					$(this).attr("checked", false);
					$(this).parents('tr').css('background-color','')
				});
			}
		}

		function delFrontList() {
			var i = 0;
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function() {
				if($(this).attr("checked")) {
					i++;
					var trid = "#" + $(this).parent().parent().parent().attr("id");
					$(trid).remove();
				}
			});
			$("#selectAll2").attr("checked", false);
			if(i == 0) {
				utilsFp.confirmIcon(3, "", "", "", "请选择要删除的数据", 0, "", "");
				
			}
		}

		$("#paraMap1_TCF_EC_CODE").change(function() {

			var ecCode = $("#paraMap1_TCF_EC_CODE").val();
			//alert(ecCode);
			if(ecCode==""){
			  $("#paraMap1_TCF_EC_DES").val("");
			}
			//alert(cfm_type);
			var jsondata = "";
			jsondata = { "ecCode": ecCode };

			var listUrl = getEcDescUrl();
			$.ajax({
				type: "post",
				dataType: "json",
				url: listUrl,
				data: jsondata,
				success: function(data) {
					//alert(data);
					var cd = data.ajaxList;
					$("#paraMap1_TCF_EC_DES").val(cd[0].CEC_DESC);
					//alert(cd[0].CEC_DESC);
				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "", "");
				}

			});

		});
		function getEcDescUrl(){
            var url="${path}buss/bussModel_exeFunc.ms?funcMId=f4f1fa980d204df1937a84d6bc000cce"; 
            //alert(url);
            return url;
            }
		function getUrl(){
            var url="${path}buss/bussModel_exeFunc.ms?funcMId=2198861b6bc54be9b9d7081175907c14"; 
            //alert(url);
            return url;
            }
		function saveMTInfo(){

        saveFix();
        if($("#ids").val()==""){
        utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加Feeder信息" />",0,"260","");
        return;
        }
        if($("#paraMap1_TCFM_TYPE").val()=="1"&&$("#paraMap1_TCF_EC_CODE").val()==""){
         
        _alertValMsg($('#paraMap1_TCF_EC_CODE_chosen'),"<dict:lang value="请选择不良代码" />");
        return;
        } 
        //if($("#paraMap1_TCFM_REPORTER").val()==""){
         //_alertValMsg($("#paraMap1_TCFM_REPORTER_SHOW"),"%{getText('请选择报修人')}");
        //return;
        //}
        //if($("#paraMap1_TCFM_MT_MAN").val()==""){
         //_alertValMsg($("#paraMap1_TCFM_MT_MAN_SHOW"),"%{getText('请选择保养/维修人')}");
        //return;
        //}
        //if($("#paraMap1_TCFM_AUDIT").val()==""){
         //_alertValMsg($("#paraMap1_TCFM_AUDIT_SHOW"),"%{getText('请选择确认人')}");
        //return;
        //}
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
   //document.forms.addForm.action="@{funcUrl}";
   //document.forms.addForm.submit();
                        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                         if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                   
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=5a0819b98ee543d98885b64c797c7e6d"; 
       
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
}
		
	</script>

	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
    //setPopScroll('.main');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>