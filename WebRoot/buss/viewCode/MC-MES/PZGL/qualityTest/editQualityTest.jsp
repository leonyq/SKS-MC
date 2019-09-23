<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>

<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<link href="${path}plf/page/common/msui/css/css_tab.css" rel="stylesheet" type="text/css" />
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>

	<style type="text/css">
	    .pageSelectUl{
	    	text-align:left;
	    	margin-left:5px;
	    }
	    .Sssss{
	        width:30px!important;
	    }
	    .pokja{
	        width:30px!important;
	    }
    	
		.datagrid-header-inner2  tbody { background-color: #e6eaf4; }
		.datagrid-header-inner2 tbody td { height: 30px; color: #666; font-size:15px;text-align: center;}
		.datagrid-header-inner2 td { color: #666; }
		.datagrid-header-inner2 .checkbox { text-align: center; }
		.datagrid-header2 td{
		  border-width: 0 1px 1px 0;
		  border-style: solid;
		  margin: 0;
		}
		.datagrid-header-inner2 tbody td { border-color: #dbe1ef; }
		.datagrid-div22{
			overflow-x: auto; overflow-y: hidden; width: 100%;
		}
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: #f8fcff;
            z-index: 1001;
            opacity:0.5;
            filter:alpha(opacity=88);  
        }
        .optBtn {float: right; width: 250px;display: inline-block;margin-top: 5px;}
        .optBtn button:hover { background-color: #aace36; color: #fff; }
        .optBtn button {float: right;  border: 1px solid #aace36; border-radius: 2px; background-color: #fff; color: #666; height: 28px; line-height: 26px; padding:0 10px; cursor: pointer; }
    </style>
	
	<!-- head里面 -->
	<script type="text/javascript">
		var addTableTrMap;
		var loaded = 1;
		var tab_len = 2;

		var currentTag;
		var tabs = "";

		function switchTag(tag, content, url) {
			
			document.getElementById("content1").style.display = "";

			for(i = 1; i < (tab_len + 1); i++) {
				if("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
				}
				$("#" + tag).addClass("current").siblings().removeClass("current");
				if("content" + i == content) {
					currentTag = tag;
					document.getElementById(content).className = "";
				} else {
					document.getElementById("content" + i).className = "hidecontent";
				}
				document.getElementById("content").className = content;
				if(tag=="tag1"){
					$("#del").css("display","none");
					$("#save").css("display","none");
					$("#edit").css("display","inline-block");
					$("#cancel").css("display","inline-block");
					$("#content1").css("display","block");
					$("#content2").css("display","none");
					$("#content3").css("display","none");
					$("#content4").css("display","none");
					$("#multiSampleLoad").css("display","none");
					$("#multiSampleSave").css("display","none");
					$("#multiSampleDel").css("display","none");
				}else if(tag=="tag2"){
					$("#del").css("display","inline-block");
					$("#save").css("display","inline-block");
					$("#edit").css("display","none");
					$("#cancel").css("display","none");
					$("#content1").css("display","none");
					$("#content2").css("display","block");
					$("#content3").css("display","none");
					$("#content4").css("display","none");
					$("#multiSampleLoad").css("display","none");
					$("#multiSampleSave").css("display","none");
					$("#multiSampleDel").css("display","none");
					
					  $("input[editname='qwer']").attr("class","input isSubmit input _VAL_DATABASE");
					  // $("#errorCodeShow1_SHOW").attr("class","input isSubmit input _VAL_DATABASE");
				}else if(tag=="tag3"){
					$("#del").css("display","none");
					$("#save").css("display","none");
					$("#edit").css("display","none");
					$("#cancel").css("display","none");
					$("#content1").css("display","none");
					$("#content2").css("display","none");
					$("#content3").css("display","block");
					$("#content4").css("display","none");
					$("#multiSampleLoad").css("display","inline-block");
					$("#multiSampleSave").css("display","inline-block");
					$("#multiSampleDel").css("display","inline-block");
					$(".chosen-drop ul").removeClass("chosen-results");
					$(".chosen-drop ul").addClass("pageSelectUl");
				}else if(tag=="tag4"){//多样本登记页面
				    getItemInfo();
					$("#del").css("display","none");
					$("#save").css("display","none");
					$("#edit").css("display","none");
					$("#cancel").css("display","none");
					$("#content1").css("display","none");
					$("#content2").css("display","none");
					$("#content3").css("display","none");
					$("#content4").css("display","block");
					$("#multiSampleLoad").css("display","none");
					$("#multiSampleSave").css("display","none");
					$("#multiSampleDel").css("display","none");
					$(".chosen-drop ul").removeClass("chosen-results");
					$(".chosen-drop ul").addClass("pageSelectUl");
				}
			}
		}
		
	</script>
</head>

<body style="background-color: white;overflow: hidden;">
<input type="hidden" name="infoId2" value="${dataMap.infoId}"/>
	<DIV class="multilist comwrap content-in">
		<div class="edit" style="background-color: white;">
			<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame" <bu:formet exeid="%{exeid}" />>
			<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
				<jsp:param name="modelName" value="VIEW_TYPE_11" />
				<jsp:param name="location" value="editForm" />
			</jsp:include>
					<div class="hd" id="headerDiv" style="margin-top: 0px; margin-bottom: 0px; height: 35px; background-color: rgb(246,245,247);">
						<div style="margin-left:10px;display: none;">
							<s:if test="${isDataAuth == '1'}">
								<span class="dot">*</span>
								<dict:lang value="组织机构" />
								<s:if test="${fn:length(deptLs)==1}">
									<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select" />
								</s:if>
								<s:else>
									<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select" />
								</s:else>
							</s:if>
						</div>
						<div class="optn" style="margin-top: -6px;">
							<button id="edit" type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
							<button id="save" style="display: none;" type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
							<button id="cancel" type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
							<button id="del" style="display: none;"  type="button" onclick="delInfo();"><i class="ico ico-sc"></i><dict:lang value="删除" /></button>
							<button id="multiSampleLoad" type="button" onclick="multiSampleLoadInfo();" style="display:none"><i class="ico ico-save"></i><dict:lang value="加载" /></button>
							<button id="multiSampleSave" style="display: none;" type="button" onclick="multiSampleSaveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
							<button id="multiSampleDel" style="display: none;" type="button" onclick="multiSampleDelInfo();"><i class="ico ico-sc"></i><dict:lang value="删除" /></button>
						</div>
					</div>
				
					<div class="js-tab">
						<DIV id="container" style="padding:0 20px;box-sizing: border-box;background-color: #fff;">
							<DIV class=""><!--<DIV class="hd"> -->
								<UL class="tab-list tab">
									<LI id="tag1">
										<A class="selectli1" onclick="switchTag('tag1','content1','','');this.blur();" href="javascript:void(0);">
											<SPAN><dict:lang value="检验单信息" /></SPAN> </A>
									</LI>
									<LI id="tag2">
										<A class="" onclick="switchTag('tag2','content2','','');this.blur();" href="javascript:void(0);">
											<SPAN class="selectspan1"><dict:lang value="样本检验" /></SPAN>
										</A>
									</LI>
									<LI id="tag3">
										<A class="" onclick="switchTag('tag3','content3','','');this.blur();" href="javascript:void(0);">
											<SPAN class="selectspan1"><dict:lang value="多样本检验" /></SPAN>
										</A>
									</LI>
									<LI id="tag4">
										<A class="" onclick="switchTag('tag4','content4','','');this.blur();" href="javascript:void(0);">
											<SPAN class="selectspan1"><dict:lang value="物料/产品信息" /></SPAN>
										</A>
									</LI>
								</UL>
							</DIV>
							<DIV class="content1" id="content">
								<DIV id="content1" data-tab="tag1">
									
									<bu:set name="paraMapObj" value="${dataId}" formId="339caba30f6c4d78957a3815da1d1fdf" type="edit" />
									<table class="basic-table">
										<input type="hidden" name="formIds" value="339caba30f6c4d78957a3815da1d1fdf" />
										<input type="hidden" name="formId" id="formId1" value='831b2dbf0dfb494695b7ce66538a1231'/>
                    					<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1232'/>
                    					<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a1233'/>
                    					<input type="hidden" name="formId" id="formId4" value='831b2dbf0dfb494695b7ce66538a1234'/>
                    					<input type="hidden" name="formId" id="formId5" value='831b2dbf0dfb494695b7ce66538a1235'/>
                    					<input type="hidden" name="formId" id="formId6" value='831b2dbf0dfb494695b7ce66538a1236'/>
                    					<input type="hidden" name="formId" id="formId7" value='831b2dbf0dfb494695b7ce66538a1237'/>
                    						<input type="hidden" name="formId" id="formId8" value='831b2dbf0dfb494695b7ce66538a1238'/>
										<input type="hidden" name="339caba30f6c4d78957a3815da1d1fdf" value="paraMap1@" />
										<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
										<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
										<input type="hidden" name="autoFlag" id="autoFlag" />
										<input type="hidden" name="inspectRes" id="inspectRes" />
										<input type="hidden" name="testStatus" id="testStatus" />
										<input type="hidden" name="errorFlag" id="errorFlag" />
										<input type="hidden" name="errorInputFlag" id="errorInputFlag" />
										<input type="hidden" name="errorNum" id="errorNum" />
										<input type="hidden" name="judgeMode" id="judgeMode" />
										<input type="hidden" name="htmlStr" id="htmlStr" />
										<input type="hidden" name="insnStr" id="insnStr" />
										<input type="hidden" name="infoId" id="infoId" value="${dataMap.infoId}"/>
									    <input type="hidden" name="subsetMulitSampleSn" id="subsetMulitSampleSn" value=""/>
									    <input type="hidden" name="index" id="index" value=""/>
									    <input type="hidden" name="dataAuth" id="dataAuth" value="${param.dataAuth}"/>
									    <input type="hidden" name="onClickMultiSampleSnInfoQipSn" id="onClickMultiSampleSnInfoQipSn" value=""/>
                                        <input type="hidden" name="onClickMultiSampleSnInfoTempMulitSampleSn" id="onClickMultiSampleSnInfoTempMulitSampleSn" value=""/>
		
										<s:set name="_$viewId" value="'ea4fafb6fafe4cf3aca52638154c266c'" />
										<s:set name="_$formId_1" value="'339caba30f6c4d78957a3815da1d1fdf'" />
										<s:set name="_$type" value="'edit'" />
										<tr>
											<td class="name" style="width: 71px;" />
											<bu:uitn colNo="QII_INSPECT_SN" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" style="width: 225px;" colNo="QII_INSPECT_SN" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_INSPECT_SN" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
											<td class="name" style="width: 52px;" />
											<bu:uitn colNo="QII_ITEM_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" style="width: 225px;" colNo="QII_ITEM_CODE" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_ITEM_CODE" disabled="disabled" style="background-color:rgb(235, 235, 228);width:200px;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"/></bu:td>
			
											<td class="name" style="width: 52px;" />
											<bu:uitn colNo="QII_ITEM_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" style="width: 205px;" colNo="QII_ITEM_NAME" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_ITEM_NAME" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
										
											<bu:td cssClass="dec" style="width: 225px;display:none;" colNo="QII_CONNECT_DOC" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_CONNECT_DOC" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QII_ITEM_SPEC" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_ITEM_SPEC" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_ITEM_SPEC" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_SEND_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_SEND_NUM" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_SEND_NUM" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_TARGET_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_TARGET_NUM" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_TARGET_NUM" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QII_ACTUAL_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_ACTUAL_NUM" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_ACTUAL_NUM" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_ERROR_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_ERROR_NUM" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_ERROR_NUM" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_LIST_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_LIST_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_LIST_FLAG" disabled="disabled"  style="background-color:rgb(235, 235, 228);width:200px;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name" style="display:none;"/>
											<bu:uitn colNo="T2#CUSTOMER" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" style="display:none;"  colNo="T2#CUSTOMER" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="T2#CUSTOMER"  formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
											
											<td class="name" style="display:none;"/>
											<bu:uitn colNo="T3#SUPPLIER_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" style="display:none;" colNo="T3#SUPPLIER_NAME" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="T3#SUPPLIER_NAME"  formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
												
											<td class="name" />
											<bu:uitn colNo="QII_CUST_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_CUST_CODE" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_CUST_CODE" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_SAMPLE_TYPE" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_SAMPLE_TYPE" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_SAMPLE_TYPE" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_SEND_DEP" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_SEND_DEP" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_SEND_DEP" style="border: 1px solid #CCCCCC;width:200px;" disabled="disabled" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QII_ATMOSPHERIC_PRESSURE" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_ATMOSPHERIC_PRESSURE" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_ATMOSPHERIC_PRESSURE" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_TEMPERATURE" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_TEMPERATURE" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_TEMPERATURE" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"  style="width:200px;" /></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_HUMIDITY" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_HUMIDITY" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_HUMIDITY" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QII_SEND_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_SEND_TIME" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_SEND_TIME" disabled="disabled" style="background-color:rgb(235, 235, 228);width:200px;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"/></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_SEND_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_SEND_EMP" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_SEND_EMP" disabled="disabled" style="border-color:#ccc;width:200px;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" /></bu:td>
			
											<td class="name" />
											<bu:uitn colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<bu:td cssClass="dec" colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" disabled="" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
												
											<bu:td cssClass="dec" style="display:none;" colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf">
												<bu:ui colNo="QII_INSEPCT_RESULT" id="testResShow" name="testResShow"  formId="339caba30f6c4d78957a3815da1d1fdf" disabled="" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
									    	<td class="name" style="width:90px;"/><bu:uitn colNo="QII_FILE_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			                                <bu:td cssClass="dec-self" colNo="QII_FILE_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" colspan='4'><bu:ui colNo="QII_FILE_NAME" name="upFile" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" style="width: 200px;"/></bu:td>
										</tr>
										<tr>
											<td style="width: 80px;text-align: right;">
												<bu:uitn colNo="QII_INSEPCT_BASIS" formId="339caba30f6c4d78957a3815da1d1fdf" />
											</td>
											<td colspan="5">
												<bu:ui colNo="QII_INSEPCT_BASIS" style="margin-left:5px;height:50px;width: 380px;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1"/> &#x3000;
												<!--<bu:uitn colNo="QII_MEMO" style="margin-left:39px;vertical-align:middle;"  formId="339caba30f6c4d78957a3815da1d1fdf" />-->
												<div style="width:155px; margin-left:2px;display:inline-block;vertical-align:middle;margin-top:-70px;"><span style="text-align:center;float:right;vertical-align:middle;">备注</span></div>
												<bu:ui colNo="QII_MEMO" style="height:50px;width: 382px;" formId="339caba30f6c4d78957a3815da1d1fdf" dataId="${dataId}" formIndex="1" />
											</td>
										</tr>
			
									</table>
									<div class="js-tab two-js-tab" style="margin-bottom: 5px;">
										<div id="hd" class="mod">
											<div class="mod-hd">
												<h3 class="tit"><dict:lang value="检验项目类型" /></h3>
											</div>
										</div>
									</div>
									<div class="panel datagrid datagrid-div1" name="itemTable" id="itemTable1">
										<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
					                		<div class="datagrid-header">
						                    	<div class="datagrid-header-inner head1"  id="">
													<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1231">
								                    	<tbody>
								                        	<tr class="datagrid-header-row thcolor">
																<td class="datagrid-cell Sssss"  style="width:30px; text-align:center;"></td>
																<td class="datagrid-cell" style="width:30px; text-align:center"><span>
																	<input type="checkbox" id="selectAll1" onclick="select_All(1)" style="cursor: pointer;" title="全选"></span>
																</td>
																<td class="datagrid-cell" style="width:100px;display:none;"><dict:lang value="项目类型" /></td>
																<td class="datagrid-cell" style="width:101px;"><dict:lang value="项目类型" /></td>
																<td class="datagrid-cell" style="width:121px;"><dict:lang value="抽样方案" /></td>
																<td class="datagrid-cell" style="width:101px;"><dict:lang value="不良等级" /></td>
																<td class="datagrid-cell" style="width:121px;"><dict:lang value="检查水平" /></td>
																<td class="datagrid-cell" style="width:81px;"><dict:lang value="水平等级" /></td>
																<td class="datagrid-cell" style="width:81px;"><dict:lang value="AQL值" /></td>
																<td class="datagrid-cell" style="width:81px;"><dict:lang value="Ac" /></td>
																<td class="datagrid-cell" style="width:81px;"><dict:lang value="Re" /></td>
																<td class="datagrid-cell" style="width:81px;"><dict:lang value="应抽数" /></td>
																<td class="datagrid-cell" style="width:81px;"><dict:lang value="已抽数" /></td>
																<td class="datagrid-cell" style="width:81px;"><dict:lang value="不良数" /></td>
																<td class="datagrid-cell" style="width:101px;"><dict:lang value="判定结果" /></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="datagrid-body datagrid-div3 scroll1  " style="height: 118px;">
												<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1231" >
													<tbody class="" id="itemDetailBody1">
														<c:forEach items="${dataMap.tagList1}" var="item" varStatus="status">
															    <tr id="${item.ID}" name="${item.ID}">
																<td class="datagrid-cell pokja"  style="width:30px; text-align:center;">
																	${item.ROWNUM}
																</td>
																<td class="datagrid-cell" style="width:30px; text-align:center;">
																	<input type='checkbox' style='cursor: pointer;'>
																</td>
																<td class="datagrid-cell" style="width:100px;text-align:center;display: none;">
																	${item.QIS_ITEM_TYPE}
																</td>
																<td class="datagrid-cell" style="width:101px;text-align:center;">
																	${item.QIS_ITEM_TYPE_NAME}
																</td>
																<td class="datagrid-cell" style="width:121px;text-align:center;">
																	${item.QSP_PLAN_NAME}
																</td>
																<td class="datagrid-cell" style="width:101px;text-align:center;">
																	${item.QIS_ERROR_GRADE}
																</td>
																<td class="datagrid-cell" style="width:121px;text-align:center;">
																	${item.QIS_TEST_LEVEL}
																</td>
																<td class="datagrid-cell" style="width:81px;text-align:center;">
																	${item.QIS_TEST_GRADE}
																</td>
																<td class="datagrid-cell" style="width:81px;text-align:right;">
																	${item.QIS_ALQ_VALUE}
																</td>
																<td class="datagrid-cell" style="width:81px;text-align:right;">
																	${item.QIS_AC_NUM}
																</td>
																<td class="datagrid-cell" style="width:81px;text-align:right;">
																	${item.QIS_RE_NUM}
																</td>
																<td class="datagrid-cell" style="width:81px;text-align:right;">
																	${item.QIS_TARGET_NUM}
																</td>
																<td class="datagrid-cell" style="width:81px;text-align:right;">
																	${item.QIS_ACTUAL_NUM}
																</td>
																<td class="datagrid-cell" style="width:81px;text-align:right;">
																	${item.QIS_ERROR_NUM}
																</td>
																<td class="datagrid-cell" style="width:101px;text-align:center;">
																	${item.QIS_TEST_RESULT}
																</td>
															</tr>
														</c:forEach>
													
													</tbody>
														
												</table>
							
											</div>
										</div>
									</div>									
								</DIV>
								<DIV id="content2" data-tab="tag2" style="display:none">
								   
									<bu:set name="paraMapObj" value="${dataId}" formId="04685069ff7e40b2b83a84462dae2208" type="edit" />
									<table class="basic-table" style="width: 300px;margin-left: 0px;display: inline-block;">
										<input type="hidden" name="formIds" value="04685069ff7e40b2b83a84462dae2208" />
										<input type="hidden" name="04685069ff7e40b2b83a84462dae2208" value="paraMap1@" />
										<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
										<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
										
										<!--<s:set name="_$viewId" value="'d3f0a4a32d724462acc3617abb8f21a2'" />-->
										<s:set name="_$formId_1" value="'04685069ff7e40b2b83a84462dae2208'" />
										<s:set name="_$type" value="'edit'" />
										<tr>
											<td class="name" style="width: 60px;" />
											<bu:uitn colNo="QIP_SN" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec" style="width: 230px;" colNo="QIP_SN" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_SN"  formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
			                            </tr>
										<tr>
											<td class="name"  />
											<bu:uitn colNo="QIP_ITEM_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec"  colNo="QIP_ITEM_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_ITEM_NUM" disabled="disabled" style="background-color:rgb(235, 235, 228);" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name"  />
											<bu:uitn colNo="QIP_SAMPLE_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec"  colNo="QIP_SAMPLE_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_SAMPLE_NUM" disabled="disabled" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name"  />
											<bu:uitn colNo="QIP_TEST_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec"  colNo="QIP_TEST_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_TEST_NUM"  formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QIP_SCARP_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec" colNo="QIP_SCARP_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_SCARP_NUM"  formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QIP_ERROR_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec" colNo="QIP_ERROR_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_ERROR_NUM"  formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr style="display:none;">
											<td class="name" />
											<bu:uitn colNo="QIP_MEMO" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec" colNo="QIP_MEMO" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_MEMO" style="width: 230px; height:40px;" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
									</table>
									<div style="width: 830px; height: 210px;display: inline-block;">
										<!--样本信息-->
										<div class="js-tab two-js-tab">
											<div id="hd" class="mod">
												<div class="mod-hd">
													<h3 class="tit"><dict:lang value="样本信息" /></h3>
												</div>
											</div>
										</div>
										<div class="panel datagrid datagrid-div1" name="itemTable" id="itemTable2">
											<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header1"><!--width:630px;-->
												<div class="datagrid-header datagrid-header2">
													<div class="datagrid-header-inner head2" id="datagrid-header-inner">
													   	<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1232">
								                            <tbody>
								                            	<tr class="datagrid-header-row thcolor">
																	<td class="datagrid-cell Sssss" style="width:30px; text-align:center;"></td>
																	<td class="datagrid-cell" style="width:30px; text-align:center"><span>
																		<input type="checkbox" id="selectAll2" onclick="select_All(2)" style="cursor: pointer;" title="全选"></span>
																	</td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="样本SN" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="样本数量" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="检验数量" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="损耗数量" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="不良数量" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="检验结果" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="检验人" /></td>
																	<td class="datagrid-cell" style="width:150px;"><dict:lang value="检验时间" /></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="datagrid-body datagrid-div3 scroll2" style="height: 148px;">
														<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1232" >
														<tbody class="" id="itemDetailBody2">
															<c:forEach items="${dataMap.inspectItemList}" var="item" varStatus="status">
																 <tr id="${item.ID}" name="${item.ID}" 	onclick="onClickSampleInfo('${item.QIP_SN}');">
																	<td class='datagrid-cell pokja' style='width:30px; text-align:center;' >
																		${item.ROWNUM}
																	</td>
																	<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id="table2Checkbox${item.ROWNUM}" style='cursor: pointer;'></td>
																	<td class='datagrid-cell' style='width:120px;' title='${item.QIP_SN}'>
																		${item.QIP_SN}
																	</td> 
																	<td class='datagrid-cell' style='width:80px;text-align:right;' title='${item.QIP_ITEM_NUM}'>
																		${item.QIP_ITEM_NUM}
																	</td> 
																	<td class='datagrid-cell' style='width:80px;text-align:right;' title='${item.QIP_TEST_NUM}'>
																		${item.QIP_TEST_NUM}
																	</td>
																	<td class='datagrid-cell' style='width:80px;text-align:right;' title='${item.QIP_SCARP_NUM}'>
																		${item.QIP_SCARP_NUM}
																	</td>
																	<td class='datagrid-cell' style='width:80px;text-align:right;' title='${item.QIP_ERROR_NUM}'>
																		${item.QIP_ERROR_NUM}
																	</td>
																	<c:if test="${item.QIP_TEST_RESULT==1}">
																		<td class='datagrid-cell' style='width:100px;text-align:center;'>
																			<span class="state" style="background-color:#4e9d0f;color:#FFFFFF;width:45px">OK</span>
																		</td>
																	</c:if>
																	<c:if test="${item.QIP_TEST_RESULT==2}">
																		<td class='datagrid-cell' style='width:100px;text-align:center;'>
																			<span class="state" style="background-color:#e69138;color:#FFFFFF;width:45px">NG</span>
																		</td>
																	</c:if>
																	<td class='datagrid-cell' style='width:80px;text-align:center;' title='${item.QIP_TEST_EMP}'>
																		${item.QIP_TEST_EMP}
																	</td> 
																	<td class='datagrid-cell' style='width:150px;text-align:center;' title='${item.QIP_TEST_TIME}'>
																		${item.QIP_TEST_TIME}
																	</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<!--检验项目信息-->
									<div style="width: 100%;height: 270px;" >
										<div class="js-tab two-js-tab">
											<div id="hd" class="mod">
												<div class="mod-hd">
													<h3 class="tit"><dict:lang value="检验项目信息" /></h3>
												</div>
											</div>
										</div>
										<table class="basic-table" style="width: 600px;display: inline-block;">
											<tr>
												<td class="name" style="width: 80px;" />
												<bu:uitn colNo="QII_ITEM_TYPE" formId="f7b0a4cafd0b42a288504b15843de68e" />
												</td>
												<td>&nbsp;</td>
												<td style="width: 230px;" />
													<select style="width:230px;" class="isSubmit input " id="QII_ITEM_TYPE" name="QII_ITEM_TYPE" >
													    <option value="-1">--请选择--</option>
														<c:forEach items="${dataMap.tagList2}" var="item" varStatus="status">
															<option value="${item.ITEM_TYPE}">${item.ITEM_TYPE_NAME}</option>
														</c:forEach>
													</select>
												</td>
				                            </tr>
										</table>
										<div class="optBtn" id="optBtn" style="">

											<button id="editNgBtn"  type="button" onclick="editNG();"><dict:lang value="一键NG" /></button>
											<button id="editOkBtn" style="margin-right: 5px; " type="button" onclick="editOK();"><dict:lang value="一键OK" /></button>
										</div>
										<div class="panel datagrid datagrid-div1" name="itemTable" id="itemTable3">
											<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header1" >
												<div class="datagrid-header ">
													<div class="datagrid-header-inner head3" id="datagrid-header-inner">
														<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1233">
									<tbody>
									<tr class="datagrid-header-row thcolor">
																	<td class="datagrid-cell Sssss" style="width:30px; text-align:center;"></td>
																	<td class="datagrid-cell" style="width:30px; text-align:center"><span>
																		<input type="checkbox" id="selectAll3" onclick="select_All(3)" style="cursor: pointer;" title="全选" checked="checked"></span>
																	</td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="检测项目类型" /></td>
																	<td class="datagrid-cell" style="width:120px;display:none;"><dict:lang value="" /></td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="检测项目" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="值域" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="单位" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="上限值" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="下限值" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="实际值" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="检测结果" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="不良代码" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="不良名称" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="不良等级" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="不良数量" /></td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="检测方法" /></td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="检测内容" /></td>
																	<td class="datagrid-cell" style="width:150px;"><dict:lang value="备注" /></td>
																	<td class="datagrid-cell" style="width:120px;display:none;"><dict:lang value="" /></td>
																	<td class="datagrid-cell" style="width:120px;display:none;"><dict:lang value="" /></td>
																	<td class="datagrid-cell" style="width:120px;display:none;"><dict:lang value="" /></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="datagrid-body datagrid-div3  scroll3" style="height: 154px;overflow: auto;">
													<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1233" >
														<tbody class="" id="itemDetailBody3">
															 <c:forEach items="${dataMap.testItemList}" var="item" varStatus="status">
																<tr>
																	<td class="datagrid-cell pokja" style="width:30px; text-align:center;">
																		${item.ROWNUM}
																	</td>
																	<td class="datagrid-cell" style="width:30px; text-align:center;"><input id="table3Checkbox${item.ROWNUM}"  type="checkbox" checked="checked" style="cursor: pointer;" value="${item.ROWNUM}"></td>
																	<td class="datagrid-cell" style="width:120px;text-align:center;">
																		${item.ITEM_TYPE_NAME}
																	</td> 
																	<td class="datagrid-cell" style="width:120px;text-align:center;display:none;">
																		${item.ITEM_TYPE}
																	</td> 
																	<td class="datagrid-cell" style="width:120px;text-align:center;">
																		${item.ITEM_NAME}
																	</td> 
																	<td class="datagrid-cell" style="width:80px;text-align:center;" id="ITEM_CLASS${item.ROWNUM}">
																		${item.ITEM_CLASS_NAME}
																	</td>
																	<td class="datagrid-cell" style="width:80px;text-align:center;">
																		${item.ITEM_UNIT}
																	</td>
																	<td class="datagrid-cell" style="width:80px;text-align:right;" id="ITEM_MAXVALUE${item.ROWNUM}">
																		${item.ITEM_MAXVALUE}
																	</td>
																	<td class="datagrid-cell" style="width:80px;text-align:right;" id="ITEM_MINVALUE${item.ROWNUM}">
																		${item.ITEM_MINVALUE}
																	</td>
																	<td class="datagrid-cell" style="width:80px;">
																		<input style="width:100%;" class="isSubmit input" type="text" id="ACTUAL_VALUE${item.ROWNUM}" name="ACTUAL_VALUE" oninput="OnInput(event,'${item.ROWNUM}')" onpropertychange="OnPropChanged(event,'${item.ROWNUM}')"/>
																		<!--<bu:ui style="width:65px;" id="ACTUAL_VALUE${item.ROWNUM}" colNo="QII_ACTUAL_VALUE" formId="f7b0a4cafd0b42a288504b15843de68e"/>-->
																	</td>
																	<td class="datagrid-cell" style="width:100px;" >
																		<select style="width:90px;"  class="isSubmit input "  id="TEST_RESULT${item.ROWNUM}" name="TEST_RESULT${item.ROWNUM}" onchange="changeTestRes('${item.ROWNUM}');">
																			<option value="0">--请选择--</option>
																			<option value="1">OK</option>
																			<option value="2">NG</option>
																		</select>
																	</td>
																	<td class="datagrid-cell" style="width:100px;">
																		<!--<button style="width:90px;background-color:white;border: 1px solid #ccc;" disabled="disabled;"  type="button" id="errorCodeShow${item.ROWNUM}" type="button" onclick="showErrorCode();">
																			<dict:lang value="不良代码" />
																		</button>-->
																		<bu:ui style="width:90px;" id="errorCodeShow${item.ROWNUM}" name="qwer" disabled="disabled" colNo="QII_ERROR_CODE" formId="f7b0a4cafd0b42a288504b15843de68e" />
																	</td>
																	<td class="datagrid-cell" id="errorCodeShow${item.ROWNUM}_SHOWdec" style="width:100px;">
																		
																	</td>
																	<td class="datagrid-cell" id="errorCodeShow${item.ROWNUM}_SHOWgrade" style="width:100px;text-align:center;">
																		
																	</td>
																	<!--///////////////////////////////////////////////////////////-->
																	<td class="datagrid-cell" style="width:80px;">
																		<input style="width:100%;" class="isSubmit input" disabled="disabled" type="text" id="ERROR_NUM${item.ROWNUM}" name="ERROR_NUM" oninput="OnInput2(event,'${item.ROWNUM}')" onpropertychange="OnPropChanged(event,'${item.ROWNUM}')"/>
																	</td>
																	<td class="datagrid-cell" style="width:120px;">
																		${item.TEST_METHOD}
																	</td>
																	<td class="datagrid-cell" style="width:120px;">
																		${item.TEST_CONTENT}
																	</td>
																	<td class="datagrid-cell" style="width:150px;">
																		<input style="width:139px;" class="isSubmit input" type="text" id="memo" name="memo" />
																	</td>
																	<td class="datagrid-cell" style="width:120px;display: none;">${item.QII_ITEM_SN}</td>
																	<td class="datagrid-cell" style="width:120px;display: none;">${item.ITEM_CLASS}</td>
																	<td class="datagrid-cell" style="width:120px;display: none;"></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</DIV>
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<DIV id="content3" data-tab="tag3" style="display:none">
								   
									<bu:set name="paraMapObj" value="${dataId}" formId="04685069ff7e40b2b83a84462dae2208" type="edit" />
									<table class="basic-table" style="width: 300px;margin-left: 0px;display: inline-block;">
										<input type="hidden" name="formIds" value="04685069ff7e40b2b83a84462dae2208" />
										<input type="hidden" name="04685069ff7e40b2b83a84462dae2208" value="paraMap1@" />
										<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
										<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
										
										<!--<s:set name="_$viewId" value="'d3f0a4a32d724462acc3617abb8f21a2'" />-->
										<s:set name="_$formId_1" value="'04685069ff7e40b2b83a84462dae2208'" />
										<s:set name="_$type" value="'edit'" />
										<tr>
											<td class="name" style="width: 60px;" />
											<bu:uitn colNo="QIP_SN" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec" style="width: 230px;" colNo="QIP_SN" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_SN" id="MULIT_SAMPLE_SN" name="MULIT_SAMPLE_SN" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
			                            </tr>
										<tr>
											<td class="name"  />
											<bu:uitn colNo="QIP_ITEM_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec"  colNo="QIP_ITEM_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_ITEM_NUM" id="MULIT_SAMPLE_ITEM_NUM" name="MULIT_SAMPLE_ITEM_NUM" disabled="disabled" style="background-color:rgb(235, 235, 228);" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name"  />
											<bu:uitn colNo="QIP_TEST_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec"  colNo="QIP_TEST_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_TEST_NUM" id="MULIT_SAMPLE_TEST_NUM" name="MULIT_SAMPLE_TEST_NUM" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QIP_SCARP_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec" colNo="QIP_SCARP_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_SCARP_NUM" id="MULIT_SAMPLE_SCARP_NUM" name="MULIT_SAMPLE_SCARP_NUM" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QIP_ERROR_NUM" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec" colNo="QIP_ERROR_NUM" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_ERROR_NUM" id="MULIT_SAMPLE_ERROR_NUM" name="MULIT_SAMPLE_ERROR_NUM" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="QIP_MEMO" formId="04685069ff7e40b2b83a84462dae2208" />
											</td>
											<bu:td cssClass="dec" colNo="QIP_MEMO" formId="04685069ff7e40b2b83a84462dae2208">
												<bu:ui colNo="QIP_MEMO" id="MULIT_SAMPLE_MEMO" name="MULIT_SAMPLE_MEMO" style="width: 230px; height:30px;" formId="04685069ff7e40b2b83a84462dae2208" dataId="${dataId}" formIndex="1" /></bu:td>
										</tr>
									</table>
									
									<div style="width: 830px; height: 190px;display: inline-block;">
										<div class="js-tab two-js-tab">
											<div id="hd" class="mod">
												<div class="mod-hd">
													<h3 class="tit"><dict:lang value="样本信息" /></h3>
												</div>
											</div>
										</div>
											<div class="panel datagrid datagrid-div1" name="itemTable" id="itemTable5">
												<div class="datagrid-div22 datagrid-div6 datagrid-view" id="datagrid-header1">
													<div class="datagrid-header datagrid-header2">
														<div class="datagrid-header-inner head4" id="datagrid-header-inner">
															<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
																		<td class="datagrid-cell Sssss" style="width:30px; text-align:center;"></td>
																		<td class="datagrid-cell" style="width:30px; text-align:center"><span>
																			<input type="checkbox" id="selectAll5" onclick="select_All(5)" style="cursor: pointer;" title="全选"></span>
																		</td>
																		<td class="datagrid-cell" style="width:120px;"><dict:lang value="样本SN" /></td>
																		<td class="datagrid-cell" style="width:80px;"><dict:lang value="样本数量" /></td>
																		<td class="datagrid-cell" style="width:80px;"><dict:lang value="检验数量" /></td>
																		<td class="datagrid-cell" style="width:80px;"><dict:lang value="损耗数量" /></td>
																		<td class="datagrid-cell" style="width:80px;"><dict:lang value="不良数量" /></td>
																		<td class="datagrid-cell" style="width:100px;"><dict:lang value="检验结果" /></td>
																		<td class="datagrid-cell" style="width:80px;"><dict:lang value="检验人" /></td>
																		<td class="datagrid-cell" style="width:150px;"><dict:lang value="检验时间" /></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="datagrid-body datagrid-div3 scroll4" style="height: 148px;overflow: auto;">
														<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
															<tbody class="" id="itemDetailBody5">
																<c:forEach items="${dataMap.inspectItemList}" var="item" varStatus="status">
																	 <tr id="${item.ID}" name="${item.ID}" onclick="onClickMultiSampleSnInfo('${item.QIP_SN}');">
																		<td class='datagrid-cell pokja' style='width:30px; text-align:center;' >
																			${item.ROWNUM}
																		</td>
																		<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id="table5Checkbox${item.ROWNUM}" style='cursor: pointer;'></td>
																		<td class='datagrid-cell' style='width:120px;' title='${item.QIP_SN}'>
																			${item.QIP_SN}
																		</td> 
																		<td class='datagrid-cell' style='width:80px;text-align:right;' title='${item.QIP_ITEM_NUM}'>
																			${item.QIP_ITEM_NUM}
																		</td> 
																		<td class='datagrid-cell' style='width:80px;text-align:right;' title='${item.QIP_TEST_NUM}'>
																			${item.QIP_TEST_NUM}
																		</td>
																		<td class='datagrid-cell' style='width:80px;text-align:right;' title='${item.QIP_SCARP_NUM}'>
																			${item.QIP_SCARP_NUM}
																		</td>
																		<td class='datagrid-cell' style='width:80px;text-align:right;' title='${item.QIP_ERROR_NUM}'>
																			${item.QIP_ERROR_NUM}
																		</td>
																		<c:if test="${item.QIP_TEST_RESULT==1}">
																			<td class='datagrid-cell' style='width:100px;text-align:center;'>
																				<span class="state" style="background-color:#4e9d0f;color:#FFFFFF;width:45px">OK</span>
																			</td>
																		</c:if>
																		<c:if test="${item.QIP_TEST_RESULT==2}">
																			<td class='datagrid-cell' style='width:100px;text-align:center;'>
																				<span class="state" style="background-color:#e69138;color:#FFFFFF;width:45px">NG</span>
																			</td>
																		</c:if>
																		<td class='datagrid-cell' style='width:80px;text-align:center;' title='${item.QIP_TEST_EMP}'>
																			${item.QIP_TEST_EMP}
																		</td> 
																		<td class='datagrid-cell' style='width:150px;text-align:center;' title='${item.QIP_TEST_TIME}'>
																			${item.QIP_TEST_TIME}
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									<!--样本信息-->
									
								<!--	<div style="width: 100%;">-->
								<div>
										<div class="js-tab two-js-tab" >
											<div id="hd" class="mod">
												<div class="mod-hd">
													<h3 class="tit"><dict:lang value="检验项目信息" /></h3>
												</div>
											</div>
										</div>
									<div style="width: 300px; height: 210px;display: inline-block;">
											<div class="panel datagrid datagrid-div1" name="itemTable" id="itemTable6">
												<div class="datagrid-div22 datagrid-div6 datagrid-view" id="datagrid-header1" style="width:630px;overflow-x: auto;height: 192px;">
													<div class="datagrid-header datagrid-header2">
														<div class="datagrid-header-inner head5" id="datagrid-header-inner" style="overflow:hidden;">
														<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1238">
																<tbody>
																		<tr class="datagrid-header-row thcolor">
																		<td class="datagrid-cell Sssss" style="width:30px; text-align:center;"></td>
																		<td class="datagrid-cell" style="width:30px; text-align:center"><span>
																			<input type="checkbox" id="selectAll2" onclick="select_All(2)" style="cursor: pointer;" title="全选"></span>
																		</td>
																		<td class="datagrid-cell" style="width:160px;"><dict:lang value="样本子集SN" /></td>
																		<td class="datagrid-cell" style="width:80px;"><dict:lang value="检验状态" /></td>
																		<td class="datagrid-cell" style="display:none;width:160px;"><dict:lang value="检验状态" /></td>
																		<td class="datagrid-cell" style="display:none;width:160px;"><dict:lang value="检验状态" /></td>
																		<td class="datagrid-cell" style="display:none;width:160px;"><dict:lang value="检验状态" /></td>
																		<td class="datagrid-cell" style="display:none;width:160px;"><dict:lang value="检验状态" /></td>
																		<td class="datagrid-cell" style="display:none;width:160px;"><dict:lang value="检验状态" /></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="datagrid-body datagrid-div3 scroll5" style="height: 160px;overflow: auto;">
														<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1238" >
															<tbody class="" id="itemDetailBody6">
																 <!--<tr id="" name="">
																	<td class='datagrid-cell' style='width:30px; text-align:center;' >
																		
																	</td>
																	<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id="" style='cursor: pointer;'></td>
																	<td class='datagrid-cell' style='width:160px;' title=''>
																		
																	</td> 
																	<td class='datagrid-cell' style='width:80px;text-align:right;' title=''>
																		
																	</td> 
																</tr>-->
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!--检验项目信息-->
									<div style="width: 830px;height: 270px;display: inline-block;" id ='top_jcxm'>
								<!--	<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;">-->
										
										<table class="basic-table" style="width: 350px;display: inline-block;">
											<tr>
												<td class="name" style="width: 80px;" />
												<bu:uitn colNo="QII_ITEM_TYPE" formId="f7b0a4cafd0b42a288504b15843de68e" /><!--  id="QII_ITEM_TYPE_TWO" -->
												</td>
												<td>&nbsp;</td>
												<td style="width: 230px;" />
													<select style="width:230px;" class="isSubmit input "  id="QII_ITEM_TYPE_TWO" name="QII_ITEM_TYPE" ><!-- id="QII_ITEM_TYPE" -->
													    <option value="-1">--请选择--</option>
														<c:forEach items="${dataMap.tagList2}" var="item" varStatus="status">
															<option value="${item.ITEM_TYPE}">${item.ITEM_TYPE_NAME}</option>
														</c:forEach>
													</select>
												</td>
				                            </tr>
										</table>
										<div class="optBtn" id="optBtn1" style="width:280px">
											<button id="editSaveBtn" style="margin-left: 5px; width: 70px;" type="button" onclick="editSAVE();"><dict:lang value="保存" /></button>
											<button id="editNgBtn"  type="button" onclick="editNGTwo();"><dict:lang value="一键NG" /></button>
											<button id="editOkBtn" style="margin-right: 5px; " type="button" onclick="editOKTwo();"><dict:lang value="一键OK" /></button>
											<!--mmz:2018-05-23<button id="fandaBtn"  type="button" onclick="fangda();" style="margin-right:5px"><dict:lang value="mx" /></button>-->
										</div>
										<div class="panel datagrid datagrid-div1" name="itemTable" id="itemTable7">
											<div class="datagrid-div22 datagrid-div6 datagrid-view" id="datagrid-header1">
												<div class="datagrid-header datagrid-header2">
													<div class="datagrid-header-inner head6" id="datagrid-header-inner" >
														<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1238">
									<tbody>
									<tr class="datagrid-header-row thcolor">
																	<td class="datagrid-cell Sssss" style="width:30px; text-align:center;"></td>
																	<td class="datagrid-cell Sssss" style="width:30px; text-align:center"><span>
																		<input type="checkbox" id="selectAll7" onclick="select_All(7)" style="cursor: pointer;" title="全选" checked="checked"></span>
																	</td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="检测项目类型" /></td>
																	<td class="datagrid-cell" style="width:120px;display:none;"><dict:lang value="检测项目" /></td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="检测项目" /></td>
																	
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="值域" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="单位" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="上限值" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="下限值" /></td>
																	<td class="datagrid-cell" style="width:80px;"><dict:lang value="实际值" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="检测结果" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="不良代码" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="不良名称" /></td>
																	<td class="datagrid-cell" style="width:100px;"><dict:lang value="不良等级" /></td>
																	<td class="datagrid-cell" style="width:80px;display: none;"></td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="检测方法" /></td>
																	<td class="datagrid-cell" style="width:120px;"><dict:lang value="检测内容" /></td>
																	<td class="datagrid-cell" style="width:150px;"><dict:lang value="备注" /></td>
																	<td class="datagrid-cell" style="width:120px;display: none;"></td>
																	<td class="datagrid-cell" style="width:120px;display: none;"></td>
																	<td class="datagrid-cell" style="width:120px;display: none;"></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="datagrid-body datagrid-div3 scroll6" style="height: 160px;overflow: auto;">
													<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1238" >
														<tbody  class="" id="itemDetailBody7" style="display:none;">
															 <c:forEach items="${dataMap.testItemList}"  var="item" varStatus="status">
																<tr >
																	<td class="datagrid-cell pokja" style="width:30px; text-align:center;">
																		${item.ROWNUM}
																	</td>
																	<td class="datagrid-cell pokja" style="width:30px; text-align:center;"><input id="table7Checkbox${item.ROWNUM}"  type="checkbox" checked="checked" style="cursor: pointer;" value="${item.ROWNUM}"></td>
																	<td class="datagrid-cell" style="width:120px;text-align:center;">
																		${item.ITEM_TYPE_NAME}
																	</td> 
																	<td class="datagrid-cell" style="width:120px;text-align:center;display:none;">
																		${item.ITEM_TYPE}
																	</td> 
																	<td class="datagrid-cell" style="width:120px;text-align:center;">
																		${item.ITEM_NAME}
																	</td> 
																	<td class="datagrid-cell" style="width:80px;text-align:center;" id="MULIT_ITEM_CLASS${item.ROWNUM}">
																		${item.ITEM_CLASS_NAME}
																	</td>
																	<td class="datagrid-cell" style="width:80px;text-align:center;">
																		${item.ITEM_UNIT}
																	</td>
																	<td class="datagrid-cell" style="width:80px;text-align:right;" id="MULIT_ITEM_MAXVALUE${item.ROWNUM}">
																		${item.ITEM_MAXVALUE}
																	</td>
																	<td class="datagrid-cell" style="width:80px;text-align:right;" id="MULIT_ITEM_MINVALUE${item.ROWNUM}">
																		${item.ITEM_MINVALUE}
																	</td>
																	<td class="datagrid-cell" style="width:80px;">
																		<input style="width:100%;" class="isSubmit input" type="text" id="MULIT_ACTUAL_VALUE${item.ROWNUM}" name="ACTUAL_VALUE" oninput="OnInputTwo(event,'${item.ROWNUM}')" onpropertychange="OnPropChanged(event,'${item.ROWNUM}')"/>
																		<!--<bu:ui style="width:65px;" id="ACTUAL_VALUE${item.ROWNUM}" colNo="QII_ACTUAL_VALUE" formId="f7b0a4cafd0b42a288504b15843de68e"/>-->
																	</td>
																	<td class="datagrid-cell" style="width:100px;" >
																		<select style="width:90px;"  class="isSubmit input "  id="MULIT_TEST_RESULT${item.ROWNUM}" name="TEST_RESULT${item.ROWNUM}" onchange="changeTestResTwo('${item.ROWNUM}');">
																			<option value="0">--请选择--</option>
																			<option value="1">OK</option>
																			<option value="2">NG</option>
																		</select>
																	</td>
																	<td class="datagrid-cell" style="width:100px;">
																		<!--<button style="width:90px;background-color:white;border: 1px solid #ccc;" disabled="disabled;"  type="button" id="errorCodeShow${item.ROWNUM}" type="button" onclick="showErrorCode();">
																			<dict:lang value="不良代码" />
																		</button>-->
																		<bu:ui style="width:100px;" id="errorCodeShowTwo${item.ROWNUM}" disabled="disabled" colNo="QII_ERROR_CODE" formId="f7b0a4cafd0b42a288504b15843de68e" />
																	</td>
																	<td class="datagrid-cell" id="errorCodeShowTwo${item.ROWNUM}_SHOWdec" style="width:100px;">
																		
																	</td>
																	<td class="datagrid-cell" id="errorCodeShowTwo${item.ROWNUM}_SHOWgrade" style="width:100px;text-align:center;">
																		
																	</td>
																	<!--///////////////////////////////////////////////////////////-->
																	<td class="datagrid-cell" style="width:80px;display: none;">
																		<input style="width:100%;" class="isSubmit input" disabled="disabled" type="text" id="ERROR_NUM${item.ROWNUM}" name="ERROR_NUM" oninput="OnInput2(event,'${item.ROWNUM}')" onpropertychange="OnPropChanged(event,'${item.ROWNUM}')"/>
																	</td>
																	<td class="datagrid-cell" style="width:120px;">
																		${item.TEST_METHOD}
																	</td>
																	<td class="datagrid-cell" style="width:120px;">
																		${item.TEST_CONTENT}
																	</td>
																	<td class="datagrid-cell" style="width:150px;">
																		<input style="width:150px;" class="isSubmit input" type="text" id="MULIT_memo" name="memo" />
																	</td>
																	<td class="datagrid-cell" style="width:120px;display: none;">${item.QII_ITEM_SN}</td>
																	<td class="datagrid-cell" style="width:120px;display: none;">${item.ITEM_CLASS}</td>
																	<td class="datagrid-cell" style="width:120px;display: none;"></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									</div>
								</DIV>
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<DIV id="content4" data-tab="tag4" style="background-color:white;display:none;border-top: 0px solid white;">
									<div class="panel datagrid datagrid-div1" name="itemTable" id="itemTable4">
										<div class="datagrid-div22 datagrid-div6 datagrid-view" id="datagrid-header1">
											<div class="datagrid-header datagrid-header2" >
												<div class="datagrid-header-inner head7" >
													<table style="margin-top:5px;"  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1237">
									<tbody>
									<tr class="datagrid-header-row thcolor">
																<td class="datagrid-cell" style="width:39px; text-align:center;"></td>
																<td class="datagrid-cell" style="width:39px; text-align:center"><span>
																	<input type="checkbox" id="selectAll4" onclick="select_All(4)" style="cursor: pointer;" title="全选"></span>
																</td>
																<td class="datagrid-cell" style="width:200px;"><dict:lang value="物料/产品SN" /></td>
																<td class="datagrid-cell" style="width:89px;"><dict:lang value="检验结果" /></td>
																<td class="datagrid-cell" style="width:89px;"><dict:lang value="检验状态" /></td>
																<td class="datagrid-cell" style="width:129px;"><dict:lang value="样本检验标志" /></td>
																<td class="datagrid-cell" style="width:89px;"><dict:lang value="检验数量" /></td>
																<td class="datagrid-cell" style="width:89px;"><dict:lang value="抽样标志" /></td>
																<td class="datagrid-cell" style="width:89px;"><dict:lang value="抽样数量" /></td>
																<td class="datagrid-cell" style="width:119px;"><dict:lang value="所属单据" /></td>
																<td class="datagrid-cell" style="width:119px;"><dict:lang value="物料料号" /></td>
																<td class="datagrid-cell" style="width:89px;"><dict:lang value="检验人" /></td>
																<td class="datagrid-cell" style="width:159px;"><dict:lang value="检验时间" /></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="datagrid-body datagrid-div3 scroll7" style="height: 420px;overflow: auto;">
												<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1237" >
													<tbody class="" id="itemDetailBody4">
														<c:forEach items="${dataMap.tagList3}" var="item" varStatus="status">
															<tr id="${item.ID}" name="${item.ID}">
																<td class="datagrid-cell" style="width:39px; text-align:center;">${item.ROWNUM}</td>
																<td class="datagrid-cell" style="width:39px; text-align:center;"><input type="checkbox" style="cursor: pointer;"></td>
																<td class="datagrid-cell" style="width:200px;">${item.QIP_SN}</td> 
																<td class="datagrid-cell" style="width:89px;text-align:center;">${item.QIP_TEST_RESULT}</td> 
																<td class="datagrid-cell" style="width:89px;text-align:center;">${item.QIP_TEST_FLAG}</td>
																<td class="datagrid-cell" style="width:129px;text-align:center;">${item.QIP_CONCESSION_FLAG}</td>
																<td class="datagrid-cell" style="width:89px;">${item.QIP_TEST_NUM}</td>
																<td class="datagrid-cell" style="width:89px;text-align:center;">${item.QIP_SAMPLE_FLAG}</td>
																<td class="datagrid-cell" style="width:89px;text-align:right;">${item.QIP_SAMPLE_NUM}</td>
																<td class="datagrid-cell" style="width:119px;">${item.QIP_DOC_NUM}</td>
																<td class="datagrid-cell" style="width:119px;text-align:center;">${item.QIP_ITEM_CODE}</td>
																<td class="datagrid-cell" style="width:89px;text-align:center;">${item.QIP_TEST_EMP}</td> 
																<td class="datagrid-cell" style="width:159px;text-align:center;">${item.QIP_TEST_TIME}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												
											</div>
										</div>
									</div>
									<div id="page" style="background-color: white;" style="height: 30px;"> 
										<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId7&showLoading=0" />
									</div>
								</DIV>
							</DIV>
						</DIV>
						<div style="width: 100%;height: 50px;background-color: white;"></div>
					</div>
					<bu:jsVal formId="339caba30f6c4d78957a3815da1d1fdf" formIndex="1" />
			</form>
		</div>
	</DIV>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<bu:submit viewId="ea4fafb6fafe4cf3aca52638154c266c" />
	<bu:script viewId="ea4fafb6fafe4cf3aca52638154c266c" />
	


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
		$(function(){
    	    $("input[name='upFile']:hidden").val("");
    	})//防止文件上传的NAME属性影响保存功能
		var editFlag=false;						
		var snErrorFlag=0;
		var snErrorFlag2=0;
		var errorInputFlag="0";
		var judgeMode="${dataMap.JUDGE_MODE}";
		var autoFlag="${dataMap.AUTO_EXAMINE}";
		var type="${dataMap.type}";
		var dataAuth = "${param.dataAuth}";
		//console.log(dataAuth);
		$("#autoFlag").val(autoFlag);
		$("#judgeMode").val(judgeMode);
		$("#_page_bar_table_formId7").attr("style","margin-top:-10px");
		if(type=="showDetail"){
			//查看
			$("#paraMapObj_QIP_SN").attr("readonly","readonly");
			$("#paraMapObj_QIP_TEST_NUM").attr("readonly","readonly");
			$("#paraMapObj_QIP_SCARP_NUM").attr("readonly","readonly");
			$("#paraMapObj_QIP_ERROR_NUM").attr("readonly","readonly");
			$("#paraMapObj_QIP_MEMO").attr("readonly","readonly");
			$("#paraMapObj_QII_ATMOSPHERIC_PRESSURE").attr("disabled","true");
			$("#paraMapObj_QII_FILE_NAME").attr("disabled","true");
			var file_text = $('#paraMapObj_QII_FILE_NAME').next().text();
            if('' != file_text) {
              $("#paraMapObj_QII_FILE_NAME").attr("style","display:none;"); 
              $('#paraMapObj_QII_FILE_NAME').next().next().text('');
            }
			$("#paraMapObj_QII_TEMPERATURE").attr("disabled","true");
			$("#paraMapObj_QII_HUMIDITY").attr("disabled","true");
			$("#paraMapObj_QII_INSEPCT_BASIS").attr("disabled","true");
			$("#paraMapObj_QII_MEMO").attr("disabled","true");
			$("#headerDiv").css("display","none");
			$("#optBtn").css("display","none");
			$("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","true");
			$("#paraMapObj_QII_INSEPCT_RESULT").attr("disabled","true");
			$("#itemDetailBody3").find("select").each(function(){
				$(this).attr("disabled","true");
			});
			$("#itemDetailBody3").find("input[type='text']").each(function(){
				$(this).attr("readonly","readonly");
			});
			if(judgeMode=="1"){
			    var testResShow=$("#testResShow").val();
		        if(testResShow=="1"){
                    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").empty();
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value=''>--请选择--</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option selected='selected' value='1'>允收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value='2'>拒收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
 		            $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").attr("disabled","disabled");
		        }else if(testResShow=="2"){
		            $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").removeAttr("disabled");
    			    $("#paraMapObj_QII_INSEPCT_RESULT").empty();
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value=''>--请选择--</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option	 value='1'>允收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option selected='selected' value='2'>拒收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
 		            $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").attr("disabled","disabled");
		        }else{
		            $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").empty();
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value=''>--请选择--</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value='1'>允收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option  value='2'>拒收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
 		            $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").attr("disabled","disabled");
		        }
			}
			$("#optBtn1").attr("style","display:none");
			//getItemInfo();
		}else{
		    $("#optBtn1").attr("style","display:block");
		    //判断	人工判定
		    if(judgeMode=="2"){
			    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","disabled");
			    $("#paraMapObj_QII_INSEPCT_RESULT").attr("disabled","disabled");
		    }else{
		        var testResShow=$("#testResShow").val();
		        if(testResShow=="1"){
                    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").empty();
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value=''>--请选择--</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option selected='selected' value='1'>允收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value='2'>拒收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
		        }else if(testResShow=="2"){
		            $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").removeAttr("disabled");
    			    $("#paraMapObj_QII_INSEPCT_RESULT").empty();
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value=''>--请选择--</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option	 value='1'>允收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option selected='selected' value='2'>拒收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
		        }else{
		            $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").removeAttr("disabled");
			        $("#paraMapObj_QII_INSEPCT_RESULT").empty();
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value=''>--请选择--</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option value='1'>允收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").append("<option  value='2'>拒收</option>");
 		            $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
		        }
		        
		    }
		}
		
		if($("input[name='paraMapObj.T2#CUSTOMER']").val()!=""){
			$("#paraMapObj_QII_CUST_CODE").val($("input[name='paraMapObj.T2#CUSTOMER']").val());
		}else if($("input[name='paraMapObj.T3#SUPPLIER_NAME']").val()!=""){
			$("#paraMapObj_QII_CUST_CODE").val($("input[name='paraMapObj.T3#SUPPLIER_NAME']").val());
		}else{
		    if($("#paraMapObj_QII_CUST_CODE").val()=="" || $("#paraMapObj_QII_CUST_CODE").val()=="null"){
		        $("#paraMapObj_QII_CUST_CODE").val("");
		    }else{
			$("#paraMapObj_QII_CUST_CODE").val($("#paraMapObj_QII_CUST_CODE").val());}
		}
		
		
		
		$("#inspectRes").val($("#paraMapObj_QII_INSEPCT_RESULT").val());
		var itemNum=parseInt($.trim($("#paraMapObj_QIP_ITEM_NUM")));
		if(itemNum==1){
			$("#paraMapObj_QIP_ITEM_NUM").val("1");
			$("#paraMapObj_QIP_ITEM_NUM").attr("readonly","readonly");
		}
		//$("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","true");
		//$("#paraMapObj_QII_INSEPCT_RESULT").attr("disabled","true");
		$(function() {
		    util.showLoading("处理中...");
			mySetChosen();
			$("#tag1").addClass("current");
			$("#QII_ITEM_TYPE").css("width","230px");
			clickTr("itemDetailBody1");
			clickTr("itemDetailBody2");
			//clickTr("itemDetailBody3");
			clickTr("itemDetailBody4");
		//	clickTr("itemDetailBody2");
			clickTr("itemDetailBody6");
			getItemInfo();
			$("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","true");
			$("#paraMapObj_QII_INSEPCT_RESULT").attr("disabled","true");
			$("#htmlStr").val($("#itemDetailBody3").html());
			$("#paraMapObj_QIP_SN").keydown(function(event){
			        		//$("#paraMapObj_QIP_SN").blur()
　　　　			if(event.keyCode == 13){
　　　　			//utilsFp.confirmIcon(3,"","","", "样本SN不存在",1,"","","paraMapObj_QIP_SN","1");
					snErrorFlag=1;
　　　　　　		var qipSn = $.trim($("#paraMapObj_QIP_SN").val());
					var inspectSn = $("#paraMapObj_QII_INSPECT_SN").val();
					var infoId=$("#infoId").val();
					var dataAuth=$("#dataAuth").val();
					var jsondata = { "qipSn": qipSn,"inspectSn":inspectSn,"infoId":infoId,"dataAuth":dataAuth};
					//console.log(qipSn+"   "+inspectSn+"   "+infoId);
					var getTestItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=bfa39cf6c9ff4b819efcf8a8c22e347a&formId=%{formId}&dataAuth="+dataAuth+"&type="+type;
			        jQuery.ajax({
			 			type: "POST",
			 	   		dataType: "json",
			 	    	//url: getTestItemUrl+"&qipSn="+qipSn+"&inspectSn="+inspectSn+"&infoId="+infoId,
			 	    	url: getTestItemUrl,
			 	    	data:jsondata,
			 	    	//url: "buss/bussModel_exeFunc.ms?FUNC_CODE=F6018&funcMId=0376d8f6545d4ee5a34deff178328877&planId="+planId,
			 			success: function(data){
			 				//snErrorFlag=2;
			 				var dataList=data.ajaxList;
			 				var dataMap=data.ajaxMap;
			 				if(dataMap==null || dataMap ==""){
			 				    snErrorFlag=1;
			 					utilsFp.confirmIcon(3,"","","", "样本SN不存在",1,"","","paraMapObj_QIP_SN","1");
			 					//utilsFp.confirmIcon(3,"","","", "样本SN不存在",0,"","",_this,"1");
			 					
			 					$("#paraMapObj_QIP_ITEM_NUM").val("");
			 				    $("#paraMapObj_QIP_TEST_NUM").val("");	
                                $("#paraMapObj_QIP_SAMPLE_NUM").val("");
			 				    $("#paraMapObj_QIP_SCARP_NUM").val("");
			 				    $("#paraMapObj_QIP_ERROR_NUM").val("");
			 				    $("#paraMapObj_QIP_MEMO").val("");
			 					//$("#itemDetailBody3").html("");
			 				//	$("#paraMapObj_QIP_SN").focus();
			 					return;
			 				}
			 				$("#paraMapObj_QIP_ITEM_NUM").val(dataMap.QIP_ITEM_NUM);
			 				if(dataMap.VR_VALUE==null || dataMap.VR_VALUE=='0'){
			 				    //样本未启用抽样
			 				    snErrorFlag=3;
			 				}else{
			 				    //样本启用抽样
    			 				if(dataMap.QIP_SAMPLE_FLAG==null || dataMap.QIP_SAMPLE_FLAG=='N'){
    			 				    snErrorFlag=0;
    			 				    utilsFp.confirmIcon(3,"","","", "样本未抽样",0,"","");
    			 					$("#paraMapObj_QIP_ITEM_NUM").val("");
    			 				    $("#paraMapObj_QIP_TEST_NUM").val("");	
                                    $("#paraMapObj_QIP_SAMPLE_NUM").val("");
    			 				    $("#paraMapObj_QIP_SCARP_NUM").val("");
    			 				    $("#paraMapObj_QIP_ERROR_NUM").val("");
    			 				    $("#paraMapObj_QIP_MEMO").val("");
    			 					//$("#itemDetailBody3").html("");
    			 					//$("#paraMapObj_QIP_SN").focus();
    			 					return;
    			 				}else{
    			 				    snErrorFlag=2;
    			 				}
    			 			}
			 				if(dataMap.QIP_TEST_NUM==null){
				 				    	$("#paraMapObj_QIP_TEST_NUM").val("0");
				 				    }else{
				 				    	$("#paraMapObj_QIP_TEST_NUM").val(dataMap.QIP_TEST_NUM);
				 				    }
				 		        if(dataMap.QIP_SCARP_NUM==null){
				 				    	$("#paraMapObj_QIP_SCARP_NUM").val("0");
				 				    }else{
				 				    	$("#paraMapObj_QIP_SCARP_NUM").val(dataMap.QIP_SCARP_NUM);
				 				    }
				 	                if(dataMap.QIP_ERROR_NUM==null){
				 				    	$("#paraMapObj_QIP_ERROR_NUM").val("0");
				 				    }else{
				 				    	$("#paraMapObj_QIP_ERROR_NUM").val(dataMap.QIP_ERROR_NUM);
				 				    }
				 				    if(dataMap.QIP_SAMPLE_NUM==null){
				 				    	$("#paraMapObj_QIP_SAMPLE_NUM").val("0");
				 				    }else{
				 				    	$("#paraMapObj_QIP_SAMPLE_NUM").val(dataMap.QIP_SAMPLE_NUM);
				 				    }
				 				   
		 				    $("#paraMapObj_QIP_MEMO").val(dataMap.QIP_MEMO);
		 				    
			 				if(dataList.length==0){
			 					
			 				}else{
				 				for(var i=0;i<dataList.length;i++){
				 				    var item=dataList[i];
				 				    
				 				    if(item.ID==null){
				 				    	item.ID="";
				 				    }
				 				    if(item.QII_ITEM_TYPE_NAME==null){
				 				    	item.QII_ITEM_TYPE_NAME="";
				 				    }
				 				    if(item.QII_ITEM_NAME==null){
				 				    	item.QII_ITEM_NAME="";
				 				    }
				 				    if(item.QII_ITEM_CLASS==null){
				 				    	item.QII_ITEM_CLASS="";
				 				    }
				 				    if(item.QII_ITEM_UNIT==null){
				 				    	item.QII_ITEM_UNIT="";
				 				    }
				 				    if(item.QII_ITEM_MAXVALUE==null){
				 				    	item.QII_ITEM_MAXVALUE="";
				 				    }
				 				    if(item.QII_ITEM_MINVALUE==null){
				 				    	item.QII_ITEM_MINVALUE="";
				 				    }
				 				    if(item.QII_TEST_METHOD==null){
				 				    	item.QII_TEST_METHOD="";
				 				    }
				 				    if(item.QII_TEST_CONTENT==null){
				 				    	item.QII_TEST_CONTENT="";
				 				    }
				 				    if(item.QII_ACTUAL_VALUE==null){
				 				    	item.QII_ACTUAL_VALUE="";
				 				    }
				 				    if(item.QII_MEMO==null){
				 				    	item.QII_MEMO="";
				 				    }
				 				    if(item.QII_ERROR_DEC==null){
				 				    	item.QII_ERROR_DEC="";
				 				    }
				 				    if(item.QII_ERROR_CODE==null){
				 				    	item.QII_ERROR_CODE="";
				 				    }
				 				    if(item.QII_ERROR_GRADE_NAME==null){
				 				    	item.QII_ERROR_GRADE_NAME="";
				 				    }
				 				    if(item.QII_ERROR_NUM==null){
				 				    	item.QII_ERROR_NUM="";
				 				    }
				 				    
									$("#itemDetailBody3 tr:eq(" + i + ")").attr("id",item.ID);
					
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(0)").text(item.ROWNUM);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(2)").text(item.QII_ITEM_TYPE_NAME);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(3)").text(item.QII_ITEM_TYPE);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(4)").text(item.QII_ITEM_NAME);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(5)").text(item.ITEM_CLASS_NAME);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(6)").text(item.QII_ITEM_UNIT);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(7)").text(item.QII_ITEM_MAXVALUE);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(8)").text(item.QII_ITEM_MINVALUE);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(9) input").val(item.QII_ACTUAL_VALUE);
									//检验结果
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(10) select").val(item.QII_TEST_RESULT);
									//不良代码
									if(item.QII_TEST_RESULT=="2"){
										var num=i+1;
										var btn="#errorCodeShow"+num+"_SHOW";
										
										var errorNumId="#ERROR_NUM"+num;
										$(btn).removeAttr("disabled");
										$(errorNumId).removeAttr("disabled");
										$(btn).val(item.QII_ERROR_CODE);
										//$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(11)").val(item.QII_ERROR_CODE);
									}else{
										var num=i+1;
										var btn="#errorCodeShow"+num+"_SHOW";
										
										var errorNumId="#ERROR_NUM"+num;
										$(btn).attr("disabled");
										$(errorNumId).attr("disabled");
										$(btn).val("");
									}
									//不良描述
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(12)").text(item.QII_ERROR_DEC);
									//缺陷等级
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(13)").text(item.QII_ERROR_GRADE_NAME);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(14) input").val(item.QII_ERROR_NUM);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(15)").text(item.QII_TEST_METHOD);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(16)").text(item.QII_TEST_CONTENT);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(17) input").val(item.QII_MEMO);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(18)").text(item.QII_ITEM_SN);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(19)").text(item.ITEM_CLASS);
									$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(20)").text(item.QII_ERROR_GRADE);
										
				 				}
				 			
			 				}
			 					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1233");
			 		            defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1231"); 
			 			},
			 			error: function(msg){
			 			util.closeLoading();
			 				/*util.closeLoading();
			 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
			 				if (null != sessionstatus && sessionstatus == "noAuthority") {
			 				}else{
			 				    //snErrorFlag=1;
			 					//utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
			 					//utilsFp.confirmIcon(3,"","","", "样本SN不存在",0,"","");
			 					//$("#paraMapObj_QIP_ITEM_NUM").val("");
			 				    //$("#paraMapObj_QIP_TEST_NUM").val("");	
                                //$("#paraMapObj_QIP_SAMPLE_NUM").val("");
			 				    //$("#paraMapObj_QIP_SCARP_NUM").val("");
			 				    //$("#paraMapObj_QIP_ERROR_NUM").val("");
			 				    //$("#paraMapObj_QIP_MEMO").val("");
			 					//$("#itemDetailBody3").html("");
			 					//$("#paraMapObj_QIP_SN").focus();
			 				}*/
			 		   }
			 		});
　　　　			}
　　			});
			$("#MULIT_SAMPLE_SN").keydown(function(event){
			        		//$("#paraMapObj_QIP_SN").blur()
　　　　			if(event.keyCode == 13){
　　　　			//utilsFp.confirmIcon(3,"","","", "样本SN不存在",1,"","","paraMapObj_QIP_SN","1");
					snErrorFlag2=1;
　　　　　　				var qipSn = $.trim($("#MULIT_SAMPLE_SN").val());
					var inspectSn = $("#paraMapObj_QII_INSPECT_SN").val();
					var infoId=$("#infoId").val();
					var dataAuth=$("#dataAuth").val();
					var getTestItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=bfa39cf6c9ff4b819efcf8a8c22e347a&formId=%{formId}&dataAuth="+dataAuth+"&type="+type;
                    var jsondata = { "qipSn": qipSn, "inspectSn":inspectSn,"infoId":infoId,"dataAuth":dataAuth};
			        jQuery.ajax({
			 			type: "POST",
			 	   		dataType: "json",
			 	    	//url: getTestItemUrl+"&qipSn="+qipSn+"&inspectSn="+inspectSn+"&infoId="+infoId,
			 	    	url: getTestItemUrl,
			 	    	data:jsondata,
			 	    	//url: "buss/bussModel_exeFunc.ms?FUNC_CODE=F6018&funcMId=0376d8f6545d4ee5a34deff178328877&planId="+planId,
			 			success: function(data){
			 				//snErrorFlag=2;
			 				var dataList=data.ajaxList;
			 				var dataMap=data.ajaxMap;
			 				if(dataMap==null || dataMap ==""){
			 				    snErrorFlag2=1;
			 					utilsFp.confirmIcon(3,"","","", "样本SN不存在",1,"","","paraMapObj_QIP_SN","1");
			 					//utilsFp.confirmIcon(3,"","","", "样本SN不存在",0,"","",_this,"1");
			 					$("#MULIT_SAMPLE_ITEM_NUM").val("");
			 				    $("#MULIT_SAMPLE_TEST_NUM").val("");	
			 				    $("#MULIT_SAMPLE_SCARP_NUM").val("");
			 				    $("#MULIT_SAMPLE_ERROR_NUM").val("");
			 				    $("#MULIT_SAMPLE_MEMO").val("");
			 					//$("#itemDetailBody3").html("");
			 				//	$("#paraMapObj_QIP_SN").focus();
			 					return;
			 				}
			 				$("#MULIT_SAMPLE_ITEM_NUM").val(dataMap.QIP_ITEM_NUM);
			 				if(dataMap.VR_VALUE==null || dataMap.VR_VALUE=='0'){
			 				    //样本未启用抽样
			 				    snErrorFlag2=3;
			 				}else{
			 				    //样本启用抽样
    			 				if(dataMap.QIP_SAMPLE_FLAG==null || dataMap.QIP_SAMPLE_FLAG=='N'){
    			 				    snErrorFlag2=0;
    			 				    utilsFp.confirmIcon(3,"","","", "样本未抽样",0,"","");
    			 					$("#MULIT_SAMPLE_ITEM_NUM").val("");
    			 				    $("#MULIT_SAMPLE_TEST_NUM").val("");	
    			 				    $("#MULIT_SAMPLE_SCARP_NUM").val("");
    			 				    $("#MULIT_SAMPLE_ERROR_NUM").val("");
    			 				    $("#MULIT_SAMPLE_MEMO").val("");
    			 					//$("#itemDetailBody3").html("");
    			 					//$("#paraMapObj_QIP_SN").focus();
    			 					return;
    			 				}else{
    			 				    snErrorFlag2=2;
    			 				}
    			 			}
			 				if(dataMap.QIP_ITEM_NUM==null){
				 				    	$("#MULIT_SAMPLE_ITEM_NUM").val("0");
				 				    }else{
				 				    	$("#MULIT_SAMPLE_ITEM_NUM").val(dataMap.QIP_ITEM_NUM);
				 				    }
			 				if(dataMap.QIP_TEST_NUM==null){
				 				    	$("#MULIT_SAMPLE_TEST_NUM").val("0");
				 				    }else{
				 				    	$("#MULIT_SAMPLE_TEST_NUM").val(dataMap.QIP_TEST_NUM);
				 				    }
				 		        if(dataMap.QIP_SCARP_NUM==null){
				 				    	$("#MULIT_SAMPLE_SCARP_NUM").val("0");
				 				    }else{
				 				    	$("#MULIT_SAMPLE_SCARP_NUM").val(dataMap.QIP_SCARP_NUM);
				 				    }
				 	                if(dataMap.QIP_ERROR_NUM==null){
				 				    	$("#MULIT_SAMPLE_ERROR_NUM").val("0");
				 				    }else{
				 				    	$("#MULIT_SAMPLE_ERROR_NUM").val(dataMap.QIP_ERROR_NUM);
				 				    }
				 				   
		 				    $("#MULIT_SAMPLE_MEMO").val(dataMap.QIP_MEMO);
		 				    
			 			},
			 			error: function(msg){
			 			util.closeLoading();
			 		   }
			 		});
　　　　			}
　　			});
		});
		
		
		function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=0de8268194ec4ba5838d160a276bdec1&formId=%{formId}&dataAuth="+dataAuth+"&type="+type;
	SearchItemInfo(paginationImpl,url);
}
		//设置下拉框样式
		function mySetChosen(){
			
			var curWinHeight = $(document).height();//当前窗口高度
			$(".dept_select").chosen({
				//inherit_select_classes:true,//继承select class
				//width:"100%",
				//disable_search:true,//是否隐藏搜索框
				disable_search_threshold:15//少于15项，隐藏搜索框
			});
		
			//大于10个选项的，显示搜索框
			var len1 = $(".dept_select").length;
			$(".dept_select").each(function(index,item){
				if(item.id!=""&&item.id.indexOf("#")<0){
				if(item != null && item.length > 10){
					//.chosen-container-single .chosen-search
					$("#"+item.id+"_chosen .chosen-search").css("display","block");
				}
		
				var offset = $("#"+item.id+"_chosen").offset(); //计算当前下拉框的偏移量
				
				var maxHeight = $("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
				
				var searchHeight = 0;//下拉搜索框的高度，默认为0
				//如果有显示搜索框，则需多计算搜索框的高度
				if(!$("#"+item.id+"_chosen .chosen-drop .chosen-search").is(":hidden")){
					searchHeight = 35;
				}
				//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
				if(offset.top > (curWinHeight/2)){
					$("#"+item.id+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
					if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
						$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
					}
				}else{
					var itemHeight = curWinHeight - offset.top;
					if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
						$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
					}
				}
				}
		
			});
		}

		
		function OnInput (event,index) {
            //alert ("The new content1: " + event.target.value);
            var newContent=event.target.value;
            var itemClass="#ITEM_CLASS"+index;
            var actualVal="#ACTUAL_VALUE"+index;
            var testRes="#TEST_RESULT"+index+" option";
            var btn="#errorCodeShow"+index+"_SHOW";
            
            var errorDec="#errorCodeShow"+index+"_SHOWdec";
            var errorGrade="#errorCodeShow"+index+"_SHOWgrade";
            var errorNum="#ERROR_NUM"+index;
            //范围值
            if(!/^(\+)?\d*\.?\d*$/.test(newContent)){
				$(actualVal).val("");            
            }
            if($.trim($(itemClass).text())=="范围值"){
            	var maxValId="#ITEM_MAXVALUE"+index;
            	var minValId="#ITEM_MINVALUE"+index;
            	var maxValStr=$(maxValId).text();
            	var minValStr=$(minValId).text();
            	var maxVal;
            	var minVal;
            	var errorFlag=false;
            	if(maxValStr!=null&&maxValStr!=""){
            		maxVal=parseFloat(maxValStr);
            		if(parseFloat(newContent)>maxVal){
            			errorFlag=true;
            		}
            	}
            	if(minValStr!=null&&minValStr!=""){
            		minVal=parseFloat(minValStr);
            		if(parseFloat(newContent)<minVal){
            			errorFlag=true;
            		}
            	}
            	if(errorFlag==true){
            		$(testRes).eq(2).attr("selected",true);
            		$(testRes).attr("disabled","disabled");
            		$(errorNum).removeAttr("disabled");
					$(btn).removeAttr("disabled");
					$(btn).val("");
					$(errorDec).text("");
					$(errorGrade).text("");
					$(btn).val("");
					$(errorNum).val("");
            	}else{
            		$(testRes).eq(0).attr("selected",true);
            		$(testRes).removeAttr("disabled");
            		$(errorNum).attr("disabled","disabled");
					$(btn).attr("disabled","true");
					$(btn).val("");
					$(btn).val("");
					$(errorDec).text("");
					$(errorGrade).text("");
					$(btn).val("");
					$(errorNum).val("");
            	}
            }
        } 
        function OnInputTwo (event,index) {
            //alert ("The new content1: " + event.target.value);
            var newContent=event.target.value;
            var itemClass="#MULIT_ITEM_CLASS"+index;
            var actualVal="#MULIT_ACTUAL_VALUE"+index;
            var testRes="#MULIT_TEST_RESULT"+index+" option";
            var btn="#errorCodeShowTwo"+index+"_SHOW";
            var errorDec="#errorCodeShowTwo"+index+"_SHOWdec";
            var errorGrade="#errorCodeShowTwo"+index+"_SHOWgrade";
            //范围值
            if(!/^(\+)?\d*\.?\d*$/.test(newContent)){
				$(actualVal).val("");            
            }
            if($.trim($(itemClass).text())=="范围值"){
            	var maxValId="#MULIT_ITEM_MAXVALUE"+index;
            	var minValId="#MULIT_ITEM_MINVALUE"+index;
            	var maxValStr=$(maxValId).text();
            	var minValStr=$(minValId).text();
            	var maxVal;
            	var minVal;
            	var errorFlag=false;
            	if(maxValStr!=null&&maxValStr!=""){
            		maxVal=parseFloat(maxValStr);
            		if(parseFloat(newContent)>maxVal){
            			errorFlag=true;
            		}
            	}
            	if(minValStr!=null&&minValStr!=""){
            		minVal=parseFloat(minValStr);
            		if(parseFloat(newContent)<minVal){
            			errorFlag=true;
            		}
            	}
            	if(errorFlag==true){
            		$(testRes).eq(2).attr("selected",true);
            		$(testRes).attr("disabled","disabled");
					$(btn).removeAttr("disabled");
					$(btn).val("");
					$(errorDec).text("");
					$(errorGrade).text("");
					$(btn).val("");
            	}else{
            		$(testRes).eq(0).attr("selected",true);
            		$(testRes).removeAttr("disabled");
					$(btn).attr("disabled","true");
					$(btn).val("");
					$(btn).val("");
					$(errorDec).text("");
					$(errorGrade).text("");
					$(btn).val("");
            	}
            }
        }
		function OnInput2 (event,index) {
            var newContent=event.target.value;
            var errorNum="#ERROR_NUM"+index;
            //范围值 !(/^(\+|-)?\d+$/  !/^-?\d*\.?\d*$/
            if(!/^(\+)?\d*\.?\d*$/.test(newContent)){
				$(errorNum).val("");            
            }
        }
		function OnPropChanged (event) {
            if (event.propertyName.toLowerCase () == "value") {
                //alert ("The new content2: " + event.srcElement.value);
            }
        }
		
		$("#QII_ITEM_TYPE").on("change",function(){
       	    var val=$("#QII_ITEM_TYPE").val();
       	    var trs = $("#itemDetailBody3 tr");
       	    /*$("#itemDetailBody3 :checkbox").each(function() {
				$(this).attr("checked", false);
			});*/
       	    var j = 1;
			for(var i = 0; i < trs.length; i++) {
				var td = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(3)").text();
				
				if(val!=-1){
				    if($.trim(val)!=$.trim(td)){
				    	//$("#itemDetailBody3 tr:eq(" + i + ")").css("display","none");
				    	$("#itemDetailBody3 tr:eq(" + i + ")").hide();
				    }else{
				        $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(0)").text(j);
						j++;
				    	//$("#itemDetailBody3 tr:eq(" + i + ")").css("display","block");
				    	$("#itemDetailBody3 tr:eq(" + i + ")").show();
				    }
				}else{
				    $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(0)").text(j);
					j++;
					//$("#itemDetailBody3 tr:eq(" + i + ")").css("display","block");
					$("#itemDetailBody3 tr:eq(" + i + ")").show();
				}
			}
        });
        
        $("#QII_ITEM_TYPE_TWO").on("change",function(){
       	    var val=$("#QII_ITEM_TYPE_TWO").val();
       	    var trs = $("#itemDetailBody7 tr");
       	    /*$("#itemDetailBody3 :checkbox").each(function() {
				$(this).attr("checked", false);
			});*/
       	    var j = 1;
			for(var i = 0; i < trs.length; i++) {
				var td = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(3)").text();
				
				if(val!=-1){
				    if($.trim(val)!=$.trim(td)){
				    	//$("#itemDetailBody3 tr:eq(" + i + ")").css("display","none");
				    	$("#itemDetailBody7 tr:eq(" + i + ")").hide();
				    }else{
				        $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(0)").text(j);
						j++;
				    	//$("#itemDetailBody3 tr:eq(" + i + ")").css("display","block");
				    	$("#itemDetailBody7 tr:eq(" + i + ")").show();
				    }
				}else{
				    $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(0)").text(j);
					j++;
					//$("#itemDetailBody3 tr:eq(" + i + ")").css("display","block");
					$("#itemDetailBody7 tr:eq(" + i + ")").show();
				}
			}
		 defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1238"); 
        });
        
		function changeTestRes(index){
		    var testRes="#TEST_RESULT"+index;
		    var btn="#errorCodeShow"+index+"_SHOW";
		    
		    var dec="#errorCodeShow"+index+"_SHOWdec";
    		var grade="#errorCodeShow"+index+"_SHOWgrade";
    		var errorNumId="#ERROR_NUM"+index;
		    if($(testRes).val()==2){
		    	$(btn).removeAttr("disabled");
		    	$(errorNumId).removeAttr("disabled");
		    }else{
		    	$(btn).attr("disabled","true");
		    	$(errorNumId).attr("disabled","true");
		    	$(btn).val("");
		    	$(errorNumId).val("");
				$(dec).text("");
				$(grade).text("");
		    }
		}
		function changeTestResTwo(index){
		    var testRes="#MULIT_TEST_RESULT"+index;
		    var btn="#errorCodeShowTwo"+index+"_SHOW";
		    
		    var dec="#errorCodeShowTwo"+index+"_SHOWdec";
    		var grade="#errorCodeShowTwo"+index+"_SHOWgrade";
		    if($(testRes).val()==2){
		    	$(btn).removeAttr("disabled");
		    }else{
		    	$(btn).attr("disabled",true);
		    	$(btn).val("");
				$(dec).text("");
				$(grade).text("");
		    }
		}
		
		function editOK(){
			$("#itemDetailBody3 :checkbox").each(function() {
				var index=$(this).val();
				var testResId="#TEST_RESULT"+index;
				var testResVal=$(testResId).val();
				var testRes="#TEST_RESULT"+index+" option";
				var errorNumId="#ERROR_NUM"+index;
	    		var btn="#errorCodeShow"+index+"_SHOW";errorCodeShow1_SHOWdec
	    		var dec="#errorCodeShow"+index+"_SHOWdec";
	    		var grade="#errorCodeShow"+index+"_SHOWgrade";
				if($(this).attr("checked")) {
					$(testRes).eq(1).attr("selected",true);
					$(btn).attr("disabled","true");
					$(errorNumId).attr("disabled","true");
					$(btn).val("");
					$(errorNumId).val("");
					$(dec).text("");
					$(grade).text("");
				}else{
					if(testResVal=="0"){
						$(testRes).eq(0).attr("selected",true);
				    	$(btn).attr("disabled","true");
				    	$(btn).val("");
				    	$(errorNumId).attr("disabled","true");
				    	$(errorNumId).val("");
						$(dec).text("");
						$(grade).text("");
					}
			    }
			});
		}
		function editOKTwo(){
			$("#itemDetailBody3 :checkbox").each(function() {
				var index=$(this).val();
				var testResId="#MULIT_TEST_RESULT"+index;
				var testResVal=$(testResId).val();
				var testRes="#MULIT_TEST_RESULT"+index+" option";
	    		var btn="#errorCodeShowTwo"+index+"_SHOW";errorCodeShow1_SHOWdec
	    		var dec="#errorCodeShowTwo"+index+"_SHOWdec";
	    		var grade="#errorCodeShowTwo"+index+"_SHOWgrade";
				if($(this).attr("checked")) {
					$(testRes).eq(1).attr("selected",true);
					$(btn).attr("disabled","true");
					$(btn).val("");
					$(dec).text("");
					$(grade).text("");
				}else{
					if(testResVal=="0"){
						$(testRes).eq(0).attr("selected",true);
				    	$(btn).attr("disabled","true");
				    	$(btn).val("");
						$(dec).text("");
						$(grade).text("");
					}
			    }
			});
		}
		
		function editNG(){
			$("#itemDetailBody3 :checkbox").each(function() {
				var index=$(this).val();
				var testResId="#TEST_RESULT"+index;
				var testResVal=$(testResId).val();
				var testRes="#TEST_RESULT"+index+" option";
				var errorNumId="#ERROR_NUM"+index;
	    		var btn="#errorCodeShow"+index+"_SHOW";
	    	
				if($(this).attr("checked")) {
					$(testRes).eq(2).attr("selected",true);
					$(btn).removeAttr("disabled");
					$(errorNumId).removeAttr("disabled");
				}else{
					if(testResVal=="0"){
						$(testRes).eq(0).attr("selected",true);
				    	$(btn).attr("disabled","true");
				    	$(errorNumId).attr("disabled","true");
				    	$(errorNumId).val("");
			    	}
			    }
			});
		}
		function editNGTwo(){
			$("#itemDetailBody3 :checkbox").each(function() {
				var index=$(this).val();
				var testResId="#MULIT_TEST_RESULT"+index;
				var testResVal=$(testResId).val();
				var testRes="#MULIT_TEST_RESULT"+index+" option";
	    		var btn="#errorCodeShowTwo"+index+"_SHOW";
				if($(this).attr("checked")) {
					$(testRes).eq(2).attr("selected",true);
					$(btn).removeAttr("disabled");
				}else{
					if(testResVal=="0"){
						$(testRes).eq(0).attr("selected",true);
				    	$(btn).attr("disabled","true");
			    	}
			    }
			});
		}
		
		function saveInfo(){
			var trs = $("#itemDetailBody3 tr");
			var eFlag=false;
			for(var i = 0; i < trs.length; i++) {
				var num=i+1;
				var testResId="#TEST_RESULT"+num;
				var testResVal=$(testResId).val();
				if(testResVal=="2"){
					eFlag=true;
				}
			}
			
			if(snErrorFlag!=2&&snErrorFlag!=3){
				if(snErrorFlag==0){
					utilsFp.confirmIcon(3,"","","", "请输入样本SN，按Enter键",0,"","");
					return;
			 		//$("#paraMapObj_QIP_SN").focus();
				}else if(snErrorFlag==1){
					utilsFp.confirmIcon(3,"","","", "样本SN不存在",0,"","");
					$("#paraMapObj_QIP_SN").val("");
			 		//$("#paraMapObj_QIP_SN").focus();
				}
			}else{
				//母本数据
				
				if(eFlag==false){
					if($("#paraMapObj_QIP_ERROR_NUM").val()!=""){
						if(parseInt($.trim($("#paraMapObj_QIP_ERROR_NUM").val()))>0){
							_alertValMsg($('#paraMapObj_QIP_ERROR_NUM'), "<dict:lang value="检测结果ok 不良数量不可编辑 " />");
	                		return;
						}
					}
				}
				var itemNum=parseInt($.trim($("#paraMapObj_QIP_ITEM_NUM").val()));
                                var testNum=parseInt($.trim($("#paraMapObj_QIP_TEST_NUM").val()));
                                var errorNum=parseInt($.trim($("#paraMapObj_QIP_ERROR_NUM").val()));
                                var scrapNum=parseInt($.trim($("#paraMapObj_QIP_SCARP_NUM").val()));
                                var sampleNum=parseInt($.trim($("#paraMapObj_QIP_SAMPLE_NUM").val()));
                            		
                            if(snErrorFlag==3){
                                if(testNum>itemNum){
                                	switchTag('tag2','content2','');
                               		_alertValMsg($("#paraMapObj_QIP_TEST_NUM"),"<dict:lang value="检验数量不能大于样本数量 " />" );
                               		return;
                            	}
                            	if(testNum<errorNum){
                               		switchTag('tag2','content2','');
                               		_alertValMsg($("#paraMapObj_QIP_ERROR_NUM"),"<dict:lang value="不良数量不能大于检验数量 " />" );
                               		return;
                            	}
                            	if(scrapNum>testNum){
                                	switchTag('tag2','content2','');
                               		_alertValMsg($("#paraMapObj_QIP_SCARP_NUM"),"<dict:lang value="损耗数量不能大于检验数量 " />" );
                               		return;
                            	}
                            }else{
                                if(testNum>sampleNum){
                                	switchTag('tag2','content2','');
                               		_alertValMsg($("#paraMapObj_QIP_TEST_NUM"),"<dict:lang value="检验数量不能大于抽样数量 " />" );
                               		return;
                            	}
                            	if(scrapNum>testNum){
                                    	switchTag('tag2','content2','');
                               		_alertValMsg($("#paraMapObj_QIP_SCARP_NUM"),"<dict:lang value="损耗数量不能大于检验数量 " />" );
                               		return;
                            	}
                            	if(testNum<errorNum){
                               		switchTag('tag2','content2','');
                               		_alertValMsg($("#paraMapObj_QIP_ERROR_NUM"),"<dict:lang value="不良数量不能大于检验数量 " />" );
                               		return;
                            	}
                            	
                            }
                            
                if($("#paraMapObj_QIP_SAMPLE_NUM").val()==""){
					//$("#paraMapObj_QIP_ERROR_NUM").val("0");
					_alertValMsg($('#paraMapObj_QIP_SAMPLE_NUM'), "<dict:lang value="该项不能为空" />");
	        		return;
				}
				if($("#paraMapObj_QIP_TEST_NUM").val()==""){
					$("#paraMapObj_QIP_ERROR_NUM").val("0");
					_alertValMsg($('#paraMapObj_QIP_TEST_NUM'), "<dict:lang value="该项不能为空" />");
	        		return;
				}
				if($("#paraMapObj_QIP_ERROR_NUM").val()==""){
					_alertValMsg($('#paraMapObj_QIP_ERROR_NUM'), "<dict:lang value="该项不能为空 " />");
	        		return;
				}
				editFlag=true;
				var inspectSn=$.trim($("#paraMapObj_QII_INSPECT_SN").val());
				var qipSn=$.trim($("#paraMapObj_QIP_SN").val());
				var itemNum=$.trim($("#paraMapObj_QIP_ITEM_NUM").val());
				var testNum=$.trim($("#paraMapObj_QIP_TEST_NUM").val());
				var scarpNum=$.trim($("#paraMapObj_QIP_SCARP_NUM").val());
				var errorInputNum=$.trim($("#paraMapObj_QIP_ERROR_NUM").val());
				var sampleNum=$.trim($("#paraMapObj_QIP_SAMPLE_NUM").val());
				var qipMemo=$.trim($("#paraMapObj_QIP_MEMO").val());
				//样本数据
				var ids = "";
				var itemTypes = "";
				var itemNames = "";
				var itemClasses = "";
				var itenUnits = "";
				var maxVals = "";
				var minVals = "";
				var actualVals = "";
				var testRes = "";
				var errorCodes = "";
				var errorDecs = "";
				var errorGrades = "";
				var testMethods = "";
				var testContents = "";
				var memos = "";
				var itemSns = "";
				var errorNums = "";
				var trs = $("#itemDetailBody3 tr");
				
				var tempCount=0;
				for(var i = 0; i < trs.length; i++) {
					var num=i+1; 
					var checkBox="#table3Checkbox"+num;
				    if($(checkBox).attr("checked")=="checked"){
				    	var testResId="#TEST_RESULT"+num;
						var testResVal=$(testResId).val();
				    	if(testResVal=="2"){
							var errorNumId="#ERROR_NUM"+num;
	    					var btn="#errorCodeShow"+num+"_SHOW";
	    					
	    					if($.trim($(btn).val())==""){
	    						_alertValMsg($(btn), "<dict:lang value="该项不能为空" />");
	    						return;
	    					}
	    					if($.trim($(errorNumId).val())==""){
	    						_alertValMsg($(errorNumId), "<dict:lang value="该项不能为空" />");
	    						return;
	    					}
				    	}
				    }
				}
				for(var i = 0; i < trs.length; i++) {
					var num=i+1; 
					var checkBox="#table3Checkbox"+num;
				    if($(checkBox).attr("checked")=="checked"){
				    	tempCount++;
				    	
				    	/*var testResId="#TEST_RESULT"+num;
						var testResVal=$(testResId).val();
				    	if(testResVal=="2"){
							var errorNumId="#ERROR_NUM"+num;
	    					var btn="#errorCodeShow"+num+"_SHOW";
	    					
	    					if($.trim($(btn).val())==""){
	    						_alertValMsg($(btn), "<dict:lang value="该项不能为空" />");
	    						return;
	    					}
	    					if($.trim($(errorNumId).val())==""){
	    						_alertValMsg($(errorNumId), "<dict:lang value="该项不能为空" />");
	    						return;
	    					}
				    	}*/
				    	
						var id = $("#itemDetailBody3 tr:eq(" + i + ")").attr("id");
						id = $.trim(id);
						ids += id + ",";
		
						var itemType = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(3)").text();
						itemType = $.trim(itemType);
						itemTypes += itemType + ",";
		
						var itemSn = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(18)").text();
						itemSn = $.trim(itemSn);
						itemSns += itemSn + ",";
		
						var itemName = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(4)").text();
						itemName = $.trim(itemName);
						itemNames += itemName + ",";
						
						var itemClass = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(19)").text();
						itemClass = $.trim(itemClass);
						itemClasses += itemClass + ",";
						
						var itenUnit = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(6)").text();
						itenUnit = $.trim(itenUnit);
						itenUnits += itenUnit + ",";
						
						var maxVal = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(7)").text();
						maxVal = $.trim(maxVal);
						maxVals += maxVal + ",";
						
						var minVal = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(8)").text();
						minVal = $.trim(minVal);
						minVals += minVal + ",";
						//实际值
						var actualVal = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(9) input").val();
						actualVal = $.trim(actualVal);
						actualVals += actualVal + ",";
						//检验结果
						var testRe = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(10) select").val();
						if($.trim(testRe)=="0"){
							testRe="1";
						}else{
							testRe = $.trim(testRe);
						}
						testRes += testRe + ",";
						//不良代码
						var num=i+1;
						var btn="#errorCodeShow"+num+"_SHOW";
					
						//var errorCode = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(11)").val();
						var errorCode = $(btn).val();
						errorCode = $.trim(errorCode);
						errorCodes += errorCode + ",";
						//不良描述
						var errorDec = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(12)").text();
						errorDec = $.trim(errorDec);
						errorDecs += errorDec + ",";
						//缺陷等级
						var errorGrade = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(13)").text();
						errorGrade = $.trim(errorGrade);
						if(errorGrade=="轻缺陷"){
							errorGrade="1";
						}else if(errorGrade=="重缺陷"){
							errorGrade="2";
						}else if(errorGrade=="致命缺陷"){
							errorGrade="3";
						}
						errorGrades += errorGrade + ",";
						
						var errorNum = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(14) input").val();
						errorNum = $.trim(errorNum);
						errorNums += errorNum + ",";
						
						var testMethod = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(15)").text();
						testMethod = $.trim(testMethod);
						testMethods += testMethod + ",";
						
						var testContent = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(16)").text();
						testContent = $.trim(testContent);
						testContents += testContent + ",";
						//备注
						var memo = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(17) input").val();
						memo = $.trim(memo);
						memos += memo + ",";
				    }
				}
				if(tempCount==0){
					utilsFp.confirmIcon(3,"","","", "请勾选检验项目",0,"","");
					return;
				}
				var jsondata = { "inspectSn":inspectSn,"qipSn": qipSn, "itemSns":itemSns, "itemNum": itemNum,"testNum": testNum,"scarpNum": scarpNum,"errorInputNum": errorInputNum,"sampleNum": sampleNum,"qipMemo": qipMemo,"ids": ids,
				"itemTypes": itemTypes,"itemNames": itemNames,"itemClasses": itemClasses,"itenUnits": itenUnits,"maxVals": maxVals,"minVals": minVals,
				"actualVals": actualVals,"testRes": testRes,"errorCodes": errorCodes,"errorDecs": errorDecs,"errorGrades": errorGrades,"testMethods": testMethods,
				"testContents": testContents,"memos": memos,"errorNums":errorNums};
				var getParentItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=3e4803a15be74f3a8707aca60909612c";
				util.showLoading("处理中...");
				$.ajax({
    				type: "POST",
    			    dataType: "json",
    			    url: getParentItemUrl,
    			    //dataType:'html',
    			    data: jsondata,
		 			success: function(data){
		 				util.closeLoading();
		 				snErrorFlag=0;
		 				$("#itemDetailBody2").html("");
		 				$("#itemDetailBody5").html("");
		 				var dataList=data.ajaxList;
		 				var dataStr=data.ajaxString;
		 				$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
		 				$("#paraMapObj_QII_LIST_FLAG").find("option[value='2']").attr("selected",true);
		 				$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
		 				$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
		 				if(dataList.length==0){
		 					
		 				}else{
			 				for(var i=0;i<dataList.length;i++){
			 				    var item=dataList[i];
			 				    var tempResult="";
			 				    if(item.QIP_TEST_RESULT=='1') tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>OK</span>";
								if(item.QIP_TEST_RESULT=='2') tempResult="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'>NG</span>";
			 				    $("#itemDetailBody2").append("<tr class='itemDetail' id='"+item.ID+"' name='"+item.ID+"'></tr>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+item.ROWNUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id='table2Checkbox"+item.ROWNUM+"' style='cursor: pointer;'></td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SN+"' style='width:120px;'>"+item.QIP_SN+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ITEM_NUM+"' style='width:80px;text-align:right;' '>"+item.QIP_ITEM_NUM+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_TEST_NUM+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SCARP_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_SCARP_NUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ERROR_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_ERROR_NUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align:center;'>"+tempResult+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_EMP+"' style='width:80px;text-align:center;'>"+item.QIP_TEST_EMP+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_TIME+"' style='width:150px;text-align:center;'>"+item.QIP_TEST_TIME+"</td>");
								
								$("#itemDetailBody5").append("<tr class='itemDetail' id='"+item.ID+"' name='"+item.ID+"' onclick=\"onClickMultiSampleSnInfo('"+item.QIP_SN+"');\"></tr>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+item.ROWNUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id='table5Checkbox"+item.ROWNUM+"' style='cursor: pointer;'></td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SN+"' style='width:120px;'>"+item.QIP_SN+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ITEM_NUM+"' style='width:80px;text-align:right;' '>"+item.QIP_ITEM_NUM+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_TEST_NUM+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SCARP_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_SCARP_NUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ERROR_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_ERROR_NUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align:center;'>"+tempResult+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_EMP+"' style='width:80px;text-align:center;'>"+item.QIP_TEST_EMP+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_TIME+"' style='width:150px;text-align:center;'>"+item.QIP_TEST_TIME+"</td>");
			 				}
			 				
			 				$("#paraMapObj_QIP_ITEM_NUM").val("");
		 				    $("#paraMapObj_QIP_TEST_NUM").val("");
		 				    $("#paraMapObj_QIP_SCARP_NUM").val("");
		 				    $("#paraMapObj_QIP_ERROR_NUM").val("");
		 				    $("#paraMapObj_QIP_SAMPLE_NUM").val("");
		 				    $("#paraMapObj_QIP_MEMO").val("");
		 					//$("#itemDetailBody3").html("");
		 					$("#paraMapObj_QIP_SN").val("");
		 					$("#paraMapObj_QIP_SN").focus();
		 					$("#itemDetailBody3").html("");
			 				$("#itemDetailBody3").html($("#htmlStr").val());
		 				}
		 				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1232");
			 				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
		 				var resulrStrs=dataStr.split("|");
		 				var table1Trs = $("#itemDetailBody1 tr");
		 				var maxActualNum=0;
						var maxErrorNum=0;
						var inspectRes="1";
						var errorFlag="0";
		 				var okNum=0;
		 				var allTestFlag=true;
		 				for(var i=0;i<resulrStrs.length;i++){
		 					var tempStrs=resulrStrs[i].split(",");
		 					for(var j=0;j<table1Trs.length; j++){
		 						var errorGrade=$.trim($("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(5)").text());
		 						
		 						if(errorGrade=="轻缺陷"){
		 							errorGrade="1";
		 						}else if(errorGrade=="重缺陷"){
		 							errorGrade="2";
		 						}else if(errorGrade=="致命缺陷"){
		 							errorGrade="3";
		 						}
		 						
		 						var tempType=$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(2)").text();
		 						if(tempStrs[1]>maxActualNum){
	 								maxActualNum=tempStrs[1];
	 							}
		 						if(tempStrs[2]>maxErrorNum){
	 								maxErrorNum=tempStrs[2];
	 							}
	 							////////////////////////////////////////////////////////////////////////////
		 						$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(12)").text(tempStrs[1]);
		 						if(tempStrs[0]==$.trim(tempType) && tempStrs[4]==errorGrade){
		 							$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(13)").text(tempStrs[2]);
		 							if(tempStrs[3]=="--"){
		 								$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(14)").text("");
		 								allTestFlag=false;
		 							}else{
		 								$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(14)").text(tempStrs[3]);
		 							}
		 							if(tempStrs[3]=="OK"){
		 								okNum++;
		 							}
		 						}
		 					}
		 				}
		 					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1231");
		 				var finalRes=false;
		 				if(okNum!=table1Trs.length){
		 					finalRes=true;
		 				}
		 				
		 				if(finalRes==true){
		 					//NG
		 					if(judgeMode!="1"){
		 					    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
							    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='2']").attr("selected",true);
							    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
							    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");
							    inspectRes="2";					
                            }
		 				}else{
		 					//OK
		 					if(judgeMode!="1"){
		 					    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
							    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='1']").attr("selected",true);
							    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
							    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");				
                            }
		 				}
		 				if(allTestFlag==true){
		 					//检验完成
		 					$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
							$("#paraMapObj_QII_LIST_FLAG").find("option[value='3']").attr("selected",true);
							$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
							$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
							
		 				}else{
		 					//检验中
		 					$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
							$("#paraMapObj_QII_LIST_FLAG").find("option[value='2']").attr("selected",true);
							$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
							$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
		 				}
		 				$("#inspectRes").val(inspectRes);
		 				$("#paraMapObj_QII_ACTUAL_NUM").val(maxActualNum);
		 				if(maxErrorNum==""){
		 				    maxErrorNum=0;
		 				}
		 				$("#paraMapObj_QII_ERROR_NUM").val(maxErrorNum);
		 				parentWindow.query(""); 
		 			},
		 			error: function(mag){
		 			    util.closeLoading();
		 			    
					    //utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		 		   }
		 		});
			}
			
		}
		
		function delInfo(){
		    var infoId=$("#infoId").val();
			var inspectSn=$("#paraMapObj_QII_INSPECT_SN").val();
			var trs = $("#itemDetailBody2 tr");
			var sampleSns="";
			var tempCheckFlag=false;
			for(var i = 0; i < trs.length; i++) {
				var num=i+1;
			    var btn="#table2Checkbox"+num;
			    if($(btn).attr("checked")=="checked"){
			    	var sn = $("#itemDetailBody2 tr:eq(" + i + ")").find("td:eq(2)").text();
					sn = $.trim(sn);
					sampleSns += sn + ",";
					tempCheckFlag=true;
			    }
			}
			if(tempCheckFlag=false){
				utilsFp.confirmIcon(3,"","","", "请勾选样本信息",0,"","");
				return;
			}
			var dataAuth=$("#dataAuth").val();
			var jsondata = { "infoId":infoId,"inspectSn":inspectSn,"sampleSns": sampleSns,"dataAuth":dataAuth};
			var delSampleInfo="${path}buss/bussModel_exeFunc.ms?funcMId=4a620a29868c4293a86e7c9e292f350a&formId=%{formId}";
			util.showLoading("处理中...");
			jQuery.ajax({
		 			type: "POST",
		 	   		dataType: "json",
		 	   		data: jsondata,
		 	    	url: delSampleInfo,
		 			success: function(data){
		 				util.closeLoading();
		 				//console.log(data.ajaxString);
		 				snErrorFlag=0;
		 				$("#itemDetailBody2").html("");
		 				$("#itemDetailBody5").html("");
		 				var dataList=data.ajaxList;
		 				var dataStr=data.ajaxString;
		 				$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
		 				$("#paraMapObj_QII_LIST_FLAG").find("option[value='2']").attr("selected",true);
		 				$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
		 				$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
		 				if(dataList.length==0){
		 					
		 				}else{
			 				for(var i=0;i<dataList.length;i++){
			 				    var item=dataList[i];
			 				    if(item.QIP_TEST_NUM==null){
			 				    	item.QIP_TEST_NUM="0";
			 				    }
			 				    if(item.QIP_ERROR_NUM==null){
			 				    	item.QIP_ERROR_NUM="0";
			 				    }
								if(item.QIP_TEST_EMP==null){
			 				    	item.QIP_TEST_EMP="";
			 				    }
								if(item.TEST_TIME==null){
			 				    	item.TEST_TIME="";
			 				    }
			 				    var tempResult="";
								if(item.QIP_TEST_RESULT=='') tempResult="<span></span>";
			 				    if(item.QIP_TEST_RESULT=='1') tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>OK</span>";
								if(item.QIP_TEST_RESULT=='2') tempResult="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'>NG</span>";
			 				    $("#itemDetailBody2").append("<tr class='itemDetail' id='"+item.ID+"' name='"+item.ID+"'></tr>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+item.ROWNUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id='table2Checkbox"+item.ROWNUM+"' style='cursor: pointer;'></td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SN+"' style='width:120px;'>"+item.QIP_SN+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ITEM_NUM+"' style='width:80px;text-align:right;' '>"+item.QIP_ITEM_NUM+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_TEST_NUM+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SCARP_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_SCARP_NUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ERROR_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_ERROR_NUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align:center;'>"+tempResult+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_EMP+"' style='width:80px;text-align:center;'>"+item.QIP_TEST_EMP+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_TIME+"' style='width:150px;text-align:center;'>"+item.QIP_TEST_TIME+"</td>");
			 				
			 					$("#itemDetailBody5").append("<tr class='itemDetail' id='"+item.ID+"' name='"+item.ID+"' onclick=\"onClickMultiSampleSnInfo('"+item.QIP_SN+"');\"></tr>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+item.ROWNUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id='table5Checkbox"+item.ROWNUM+"' style='cursor: pointer;'></td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SN+"' style='width:120px;'>"+item.QIP_SN+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ITEM_NUM+"' style='width:80px;text-align:right;' '>"+item.QIP_ITEM_NUM+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_TEST_NUM+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SCARP_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_SCARP_NUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ERROR_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_ERROR_NUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align:center;'>"+tempResult+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_EMP+"' style='width:80px;text-align:center;'>"+item.QIP_TEST_EMP+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_TIME+"' style='width:150px;text-align:center;'>"+item.QIP_TEST_TIME+"</td>");
			 				}
			 			
			 				$("#paraMapObj_QIP_ITEM_NUM").val("");
		 				    $("#paraMapObj_QIP_TEST_NUM").val("");
		 				    $("#paraMapObj_QIP_SCARP_NUM").val("");
		 				    $("#paraMapObj_QIP_ERROR_NUM").val("");
		 				    $("#paraMapObj_QIP_MEMO").val("");
		 					//$("#itemDetailBody3").html("");
		 					$("#paraMapObj_QIP_SN").val("");
		 					$("#paraMapObj_QIP_SN").focus();
		 				}
		 				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1232");
			 				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
		 				var resulrStrs=dataStr.split("|");
		 				var table1Trs = $("#itemDetailBody1 tr");
		 				var maxActualNum=0;
						var maxErrorNum=0;
						var inspectRes="1";
						var errorFlag="0";
		 				var okNum=0;
		 				var allTestFlag=true;
		 				for(var i=0;i<resulrStrs.length;i++){
		 					var tempStrs=resulrStrs[i].split(",");
		 					for(var j=0;j<table1Trs.length; j++){
		 						var errorGrade=$.trim($("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(5)").text());
		 						if(errorGrade=="轻缺陷"){
		 							errorGrade="1";
		 						}else if(errorGrade=="重缺陷"){
		 							errorGrade="2";
		 						}else if(errorGrade=="致命缺陷"){
		 							errorGrade="3";
		 						}
		 						var tempType=$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(2)").text();
		 						if(tempStrs[1]>maxActualNum){
	 								maxActualNum=tempStrs[1];
	 							}
		 						if(tempStrs[2]>maxErrorNum){
	 								maxErrorNum=tempStrs[2];
	 							}
		 						if(tempStrs[0]==$.trim(tempType) && tempStrs[4]==errorGrade ){
		 							$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(12)").text(tempStrs[1]);
		 							$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(13)").text(tempStrs[2]);
		 							if(tempStrs[3]=="--"){
		 								$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(14)").text("");
		 								allTestFlag=false;
		 							}else{
		 								$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(14)").text(tempStrs[3]);
		 							}
		 							if(tempStrs[3]=="OK"){
		 								okNum++;
		 							}
		 						}
		 					}
		 					
		 				}
		 				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1231");
		 				var finalRes=false;
		 				if(okNum!=table1Trs.length){
		 					finalRes=true;
		 				}
		 				var testStatus="3";
		 				var table2Trs = $("#itemDetailBody2 tr").length;
		 				if(table2Trs==0){
		 						$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
		 						$("#paraMapObj_QII_LIST_FLAG").find("option[value='1']").attr("selected",true);
		 						$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
		 						$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
		 						//请选择
		 						if(judgeMode!="1"){
		 						    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
								    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='']").attr("selected",true);
								    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
								    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");
								    inspectRes="";					
                                }
								testStatus="1";
		 				}else{
		 					if(finalRes==true){
		 						//NG
		 						if(judgeMode!="1"){
		 						    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
								    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='2']").attr("selected",true);
								    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
								    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");
								    inspectRes="2";					
                                }
		 					}else{
		 						//OK
							    if(judgeMode!="1"){
		 						    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
								    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='1']").attr("selected",true);
								    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
								    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");					
                                }
		 					}
		 					if(allTestFlag==true){
		 						//检验完成
		 						$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
								$("#paraMapObj_QII_LIST_FLAG").find("option[value='3']").attr("selected",true);
								$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
								$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
							
		 					}else{
		 						//检验中
		 						$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
								$("#paraMapObj_QII_LIST_FLAG").find("option[value='2']").attr("selected",true);
								$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
								$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
		 					}
		 				}
		 				
		 				$("#inspectRes").val(inspectRes);
		 				
		 				$("#paraMapObj_QII_ACTUAL_NUM").val(maxActualNum);
		 				if(maxErrorNum==""){
		 				    maxErrorNum=0;
		 				}
		 				$("#paraMapObj_QII_ERROR_NUM").val(maxErrorNum);
		 				parentWindow.query("");  
		 			},
		 			error: function(XMLHttpRequest, textStatus, errorThrown){
		 			    
		 				util.closeLoading();
		 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
		 				if (null != sessionstatus && sessionstatus == "noAuthority") {
		 				}else{
		 					utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
		 				}
		 		   }
		 		});
		}
		
		function reSort(objid) {
			var i = 1;
			$("#" + objid + " tr").each(function() {
				$(this).find("td").eq(0).text(i);
				i++;
			});
		}
		
		function select_All(index) {
		    var tempTable="#itemTable"+index;
		    var tempCheck="#selectAll"+index; 
	    	var itemTable = $(tempTable);
	    	if(index == 2){
	    	    if($(tempCheck).attr("checked")){
	    	        $(tempCheck).attr("checked",false);
	    	    }else{
	    	        $(tempCheck).attr("checked",true);
	    	    }
	    	}
			if($(tempCheck).attr("checked")) {
				itemTable.find("tbody :checkbox").each(function() {
				    if($(this).parent().parent().css("display")!="none"){
						$(this).attr("checked", true);
				    }
				});
				if(index == 2){						
				    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1238").find("tbody :checkbox").each(function(){
				        if($(this).parent().css("display")!="none"){
				            //console.log(this);
					    	$(this).attr("checked", true);
				        }
				    });
				}
			
				
			} else {
				itemTable.find("tbody :checkbox").each(function() {
					if($(this).parent().parent().css("display")!="none"){
						$(this).attr("checked", false);
					}
				});
				    					
                    if(index == 2){
                        $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1238").find("tbody :checkbox").each(function(){
				            if($(this).parent().css("display")!="none"){
						        $(this).attr("checked", false);
				            }
					
				        });
    			    }
				
			}
		}
		
		/*function searchItemInfo(paginationImpl){
	        var url = "buss/bussModel_exeFunc.ms?FUNC_CODE=F6481&funcMId=9c8cea646bde41e0825618e980bbc9bd";
			SearchItemInfo(paginationImpl,url);
		}
		*/
		function getItemInfo(){                                          
		    //var loadItemInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=0de8268194ec4ba5838d160a276bdec1&formId=%{formId}&dataAuth="+dataAuth+"&type="+type;
		    var loadItemInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=0de8268194ec4ba5838d160a276bdec1";
	        var checkNo = $("#paraMapObj_QII_INSPECT_SN").val();
	        var dataAuth=$("#dataAuth").val();
	        //var loadItemInfoUrl="buss/bussModel_exeFunc.ms?FUNC_CODE=F6479&funcMId=fa2754ab739d4b719e8735125092085d"
	        var jsondata = { "checkNo": checkNo,"dataAuth":dataAuth,"type":type};
			jQuery.ajax({
				    type: "POST",
				    dataType: "json",
				    async:false,
				    //url: loadItemInfoUrl+"&checkNo="+checkNo,
				    url: loadItemInfoUrl,
				    data:jsondata,
					success: function(data){
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							$("#itemDetailBody4").empty();
							var tempResult="";
							var tempFlag;
							var tempFlag2;
							var tempFlag3;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].QIP_DOC_NUM==null){
			 				    	rccList[i].QIP_DOC_NUM="";
			 				    }
								if(rccList[i].QIP_SAMPLE_NUM==null){
			 				    	rccList[i].QIP_SAMPLE_NUM="";
			 				    }
								if(rccList[i].QIP_TEST_EMP==null){
			 				    	rccList[i].QIP_TEST_EMP="";
			 				    }
								if(rccList[i].TEST_TIME==null){
			 				    	rccList[i].TEST_TIME="";
			 				    }
								if(rccList[i].QIP_TEST_RESULT=='1') {tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>OK</span>";}
								else if(rccList[i].QIP_TEST_RESULT=='2') {tempResult="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'>NG</span>";}
								else{tempResult=""; }
								if(rccList[i].QIP_TEST_FLAG=='1'){ tempFlag="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:45px'>已检验</span>";}
								else if(rccList[i].QIP_TEST_FLAG=='2') {tempFlag="<span class='state' style='background-color:#d67e7e;color:#FFFFFF;width:45px'>未检验</span>";}
								else if(rccList[i].QIP_TEST_FLAG=='3') {tempFlag="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:45px'>已撤销</span>";}
								else{tempFlag="";}
								if(rccList[i].QIP_SAMPLE_FLAG=='Y') tempFlag2="<img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].QIP_SAMPLE_FLAG=='N') tempFlag2="<img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].QIP_SAMPLE_FLAG==undefined) tempFlag2="";	
								if(rccList[i].QIP_INSPECT_FLAG==undefined) tempFlag3="";	
								if(rccList[i].QIP_INSPECT_FLAG=='Y') tempFlag3="<img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].QIP_INSPECT_FLAG=='N') tempFlag3="<img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								$("#itemDetailBody4").append("<tr id='"+rccList[i].ID+"' name='"+rccList[i].ID+"'></tr>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 39px;text-align: center;'>"+(i+1)+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 39px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/></td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' title='"+rccList[i].QIP_SN+"' style='width: 200px;'>"+rccList[i].QIP_SN+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-3'  style='width: 89px;text-align: center;'>"+tempResult+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-4'  style='width: 89px;text-align: center;'>"+tempFlag+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-5'  style='width: 129px;text-align: center;'>"+tempFlag3+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' title='"+rccList[i].QIP_ITEM_NUM+"' style='width: 89px;'text-align:right;>"+rccList[i].QIP_ITEM_NUM+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-7'  style='width: 89px;text-align: center;'>"+tempFlag2+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-8' title='"+rccList[i].QIP_SAMPLE_NUM+"' style='width: 89px;'text-align:right;>"+rccList[i].QIP_SAMPLE_NUM+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-9' title='"+rccList[i].QIP_DOC_NUM+"' style='width: 119px;'>"+rccList[i].QIP_DOC_NUM+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-10' title='"+rccList[i].QIP_ITEM_CODE+"' style='width: 119px;'>"+rccList[i].QIP_ITEM_CODE+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-11' title='"+rccList[i].QIP_TEST_EMP+"' style='width: 89px;text-align:center;'>"+rccList[i].QIP_TEST_EMP+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-12' title='"+rccList[i].TEST_TIME+"' style='width: 159px;text-align:center;'>"+rccList[i].TEST_TIME+"</td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId7");
						var tableTrJs = $("#itemDetailBody4 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('itemDetailBody4');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1237");
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
		var jsondata = { "paraMap.checkNo": checkNo,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    //data: "paraMap.checkNo="+checkNo+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				data:jsondata,
				success: function(data){
					util.closeLoading();
					$("#itemDetailBody4").empty();
					
					if(null != data.ajaxPage.dataList){
						var rccList = eval(data.ajaxPage.dataList);
						var tempResult="";
						var tempFlag;
						var tempFlag2;
						for(var i = 0;i < rccList.length; i++){
							if(rccList[i].QIP_DOC_NUM==null){
			 				    	rccList[i].QIP_DOC_NUM="";
			 				    }
								if(rccList[i].QIP_SAMPLE_NUM==null){
			 				    	rccList[i].QIP_SAMPLE_NUM="";
			 				    }
								if(rccList[i].QIP_TEST_EMP==null){
			 				    	rccList[i].QIP_TEST_EMP="";
			 				    }
								if(rccList[i].TEST_TIME==null){
			 				    	rccList[i].TEST_TIME="";
			 				    }
								if(rccList[i].QIP_TEST_RESULT=='1') {tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>OK</span>";}
								else if(rccList[i].QIP_TEST_RESULT=='2') {tempResult="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'>NG</span>";}
								else{tempResult=""; }
								if(rccList[i].QIP_TEST_FLAG=='1'){ tempFlag="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:45px'>已检验</span>";}
								else if(rccList[i].QIP_TEST_FLAG=='2') {tempFlag="<span class='state' style='background-color:#d67e7e;color:#FFFFFF;width:45px'>未检验</span>";}
								else if(rccList[i].QIP_TEST_FLAG=='3') {tempFlag="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:45px'>已撤销</span>";}
								else{tempFlag="";}
								if(rccList[i].QIP_SAMPLE_FLAG=='Y') tempFlag2="<img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].QIP_SAMPLE_FLAG=='N') tempFlag2="<img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									
								if(rccList[i].QIP_INSPECT_FLAG=='Y') tempFlag3="<img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].QIP_INSPECT_FLAG=='N') tempFlag3="<img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								$("#itemDetailBody4").append("<tr id='"+rccList[i].ID+"' name='"+rccList[i].ID+"'></tr>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/></td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' title='"+rccList[i].QIP_SN+"' style='width: 180px;'>"+rccList[i].QIP_SN+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-3'  style='width: 80px;text-align: center;'>"+tempResult+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-4'  style='width: 80px;text-align: center;'>"+tempFlag+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-5'  style='width: 120px;text-align: center;'>"+tempFlag3+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' title='"+rccList[i].QIP_ITEM_NUM+"' style='width: 80px;'text-align:right;>"+rccList[i].QIP_ITEM_NUM+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-7'  style='width: 80px;text-align: center;'>"+tempFlag2+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-8' title='"+rccList[i].QIP_SAMPLE_NUM+"' style='width: 80px;'text-align:right;>"+rccList[i].QIP_SAMPLE_NUM+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-9' title='"+rccList[i].QIP_DOC_NUM+"' style='width: 110px;'>"+rccList[i].QIP_DOC_NUM+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-10' title='"+rccList[i].QIP_ITEM_CODE+"' style='width: 110px;'>"+rccList[i].QIP_ITEM_CODE+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-11' title='"+rccList[i].QIP_TEST_EMP+"' style='width: 80px;text-align:center;'>"+rccList[i].QIP_TEST_EMP+"</td>");
								$("#itemDetailBody4 tr:last").append("<td class='datagrid-cell datagrid-cell-12' title='"+rccList[i].TEST_TIME+"' style='width: 150px;text-align:center;'>"+rccList[i].TEST_TIME+"</td>");
						}
					}
					pageFun(data.ajaxPage,"formId7");
						var tableTrJs = $("#itemDetailBody4 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('itemDetailBody4');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1237");
				},
				error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			  	}
			});
		}
		
		function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=a8d2ea46fc844298ac684ab9cba5dbc3&formId=%{formId}&dataAuth="+dataAuth+"&type="+type;
	SearchItemInfo(paginationImpl,url);
}
		
		
		//点击行寄选中该行
		function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			//var trId = $(this).attr("id");
			var trObj = $(this);
			var checkObj=trObj.children().first().next().find(":checkbox");
			if (checkObj.attr("checked")) {
				checkObj.attr("checked",false);
				trObj.css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).attr("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				checkObj.attr("checked",true);
				trObj.css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var checkBox=$(this);
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
				  checkBox.attr("checked",false);
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
				  checkBox.attr("checked",true);
			  }
		  });
		}
		
		function editInfo(){
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
            
            if($("#paraMapObj_QII_INSEPCT_RESULT").val() == null || $("#paraMapObj_QII_INSEPCT_RESULT").val() ==""){
               	//_alertValMsg(calName,"%{getText('日历名称不能为空')}");
               	if($("#paraMapObj_QII_LIST_FLAG").val()!="1"){
               	    _alertValMsg($('#paraMapObj_QII_INSEPCT_RESULT_chosen'), "<dict:lang value="该项不能为空" />");
                     return false;
               	}
            }  
            var len = $("#itemDetailBody2 tr").length;
            if(len > 0){
                editFlag=true;
            }
            if(editFlag==false){
                utilsFp.confirmIcon(3,"","","", "请先检验样本信息",0,"","");
				return;
            }
            if($("#paraMapObj_QII_INSEPCT_RESULT").val()=="1"){
                if(parseInt($("#paraMapObj_QII_ACTUAL_NUM").val())<parseInt($("#paraMapObj_QII_TARGET_NUM").val())){
                    utilsFp.confirmIcon(3,"","","", "实抽数小于应抽数，检验结果不能为允收",0,"","");
				    return;
                }
            }
            $("#testStatus").val($("#paraMapObj_QII_LIST_FLAG").val());          
            $("#inspectRes").val($("#paraMapObj_QII_INSEPCT_RESULT").val()); 
            $("#insnStr").val($("#paraMapObj_QII_INSPECT_SN").val());
            if($("#paraMapObj_QII_ERROR_NUM").val()==""||$("#paraMapObj_QII_ERROR_NUM").val()==null){
                $("#errorNum").val("0");
            }else{
                $("#errorNum").val($("#paraMapObj_QII_ERROR_NUM").val());
            }
            
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=a659425ffc4648588bcc610562279e84";
  document.forms.editForm.submit();
}
		/////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////
		//多样本检验
		function multiSampleLoadInfo(){
			snErrorFlag2=4;
			if($("#MULIT_SAMPLE_SN").val()==""){
				utilsFp.confirmIcon(3,"","","", "请输入样本SN，按enter键",0,"","");
				return;
			}
			$("#itemDetailBody6").empty();
			var mulitSampleSn=$.trim($("#MULIT_SAMPLE_SN").val());
			var inspectSn = $("#paraMapObj_QII_INSPECT_SN").val();
			var infoId=$("#infoId").val();
			var snErrorFlag;
			if($("#MULIT_SAMPLE_TEST_NUM").val()==""){
				//$("#MULIT_SAMPLE_TEST_NUM").val("0");
				_alertValMsg($('#MULIT_SAMPLE_TEST_NUM'), "<dict:lang value="该项不能为空" />");
        		return;
			}
			var testNum=$("#MULIT_SAMPLE_TEST_NUM").val();
			var itemNum=$("#MULIT_SAMPLE_ITEM_NUM").val();
			if($("#MULIT_SAMPLE_TEST_NUM").val()==""){
				//$("#MULIT_SAMPLE_TEST_NUM").val("0");
				_alertValMsg($('#MULIT_SAMPLE_TEST_NUM'), "<dict:lang value="该项不能为空" />");
        		return;
			}
			if($("#MULIT_SAMPLE_TEST_NUM").val()=="0"){
				_alertValMsg($('#MULIT_SAMPLE_TEST_NUM'), "<dict:lang value="检验数量为零" />");
        		return;
			}
			if(parseInt(itemNum)<parseInt(testNum)){
				_alertValMsg($('#MULIT_SAMPLE_TEST_NUM'), "<dict:lang value="检验数量不能大于样本数量" />");
        		return;
			}
			var dataAuth=$("#dataAuth").val();
			//console.log(dataAuth)
			var jsondata = { "dataAuth":dataAuth,"mulitSampleSn":mulitSampleSn,"inspectSn":inspectSn,"infoId": infoId};
			var getMulitSampleInfo="${path}buss/bussModel_exeFunc.ms?funcMId=7c10b52cb36e4efeb0e41a51378083cb&formId=%{formId}";
            var mulitSampleTestNum=parseInt($.trim($("#MULIT_SAMPLE_TEST_NUM").val()));//检测数量
            util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: getMulitSampleInfo,
			    data: jsondata,
				success: function(data){
					util.closeLoading();
					var index="";
					var tempMulitSampleSn="";
					if(data.ajaxList.length==0){
						for(var i=0;i<mulitSampleTestNum;i++){
							if((i+1)>999){
								utilsFp.confirmIcon(3,"","","", "超出流水号三位",0,"","");
								return;
							}
							index=changeMulitSampleNum(i+1);//流水号
							tempMulitSampleSn=mulitSampleSn+index;
							testFlag="<span class='state' style='background-color:#d67e7e;color:#FFFFFF;width:45px'>未检验</span>";
							$("#itemDetailBody6").append("<tr id='' name='' onclick='onClickMulitSampleInfo("+(i+1)+");'></tr>");
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value=''/></td>");
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-2' title='"+tempMulitSampleSn+"' style='width: 160px;'>"+tempMulitSampleSn+"</td>");
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-3'  style='width: 80px;text-align: center;' id='MULITSAMPLE_STATE"+index+"'>"+testFlag+"<input type='hidden' name='MULITSAMPLE_STATE'  value='1' type='hidden' /></td>");
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-4'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_INFO' id='MULITSAMPLE_INFO"+index+"' value='' /></td>");
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-5'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_SN' id='MULITSAMPLE_SN"+index+"' value='"+tempMulitSampleSn+"' /></td>");
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-6'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_ID' id='MULITSAMPLE_ID"+index+"' value='' /></td>");
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-7'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULITSAMPLE_STATE_VAL"+index+"' value='1' /></td>"); //状态
						
							$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-8'  style='width: 160px;text-align: center;display: none;'><input  type='hidden' id='MULIT_TEST_RESULT"+index+"' value='1' /></td>"); //检测状态
						}
						
					}else if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						var testFlag="已检验";
						var testFlagVal="2";
						var tempRes="2";
						for(var k=0;k<mulitSampleTestNum;k++){
							var j=k+1;
							if(j>999){
								utilsFp.confirmIcon(3,"","","", "超出流水号三位",0,"","");
								return;
							}
							var tempEqualFlag=false;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].ID==null){
			 				    	rccList[i].ID="";
			 				    	
			 				    }
								if(rccList[i].QII_SUBSET_SN==null){
			 				    	rccList[i].QII_SUBSET_SN="";
			 				    	
			 				    }
								var tempStr=rccList[i].QII_SUBSET_SN;
								var subsetSn=tempStr.substr(tempStr.length-3,tempStr.length);
								var subsetNum=parseInt(subsetSn);
							    
								if(j==subsetNum){
									tempEqualFlag=true;
									index=changeMulitSampleNum(subsetNum);
									tempMulitSampleSn=mulitSampleSn+index;
									if(rccList[i].QII_TEST_RESULT=="1"){
				 				    	tempRes="1";
				 				    }
			 				    	testFlagVal="2";
			 				    	if(testFlagVal=="1"){
										testFlag="<span class='state' style='background-color:#d67e7e;color:#FFFFFF;width:45px'>未检验</span>";
									}else{
										testFlag="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:45px'>已检验</span>";
									}
								}
							}
							if(tempEqualFlag==true){
								//存在 已检验
								$("#itemDetailBody6").append("<tr id='' name='' onclick='onClickMulitSampleInfo("+j+");'></tr>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(j)+"</td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value=''/></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-2' title='"+tempMulitSampleSn+"' style='width: 160px;'>"+tempMulitSampleSn+"</td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-3'  style='width: 80px;text-align: center;' id='MULITSAMPLE_STATE"+index+"'>"+testFlag+"<input type='hidden' name='MULITSAMPLE_STATE'  value='"+testFlagVal+"'/></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-4'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_INFO' id='MULITSAMPLE_INFO"+index+"' value=''/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-5'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_SN' id='MULITSAMPLE_SN"+index+"' value='"+tempMulitSampleSn+"'/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-6'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_ID' id='MULITSAMPLE_ID"+index+"' value=''/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-7'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULITSAMPLE_STATE_VAL"+index+"' value='"+testFlagVal+"'/ ></td>"); //状态
						
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-8'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULIT_TEST_RESULT"+index+"' value='"+tempRes+"'/ ></td>"); //检测状态
							}else{
								//不存在 未检验
								index=changeMulitSampleNum(j);
								tempMulitSampleSn=mulitSampleSn+index;
		 				    	tempRes="1";
								testFlag="待检验";
		 				    	testFlagVal="1";
		 				    	if(testFlagVal=="1"){
									testFlag="<span class='state' style='background-color:#d67e7e;color:#FFFFFF;width:45px'>未检验</span>";
								}else{
									testFlag="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:45px'>已检验</span>";
								}
								$("#itemDetailBody6").append("<tr id='' name='' onclick='onClickMulitSampleInfo("+j+");'></tr>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(j)+"</td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value=''/></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-2' title='"+tempMulitSampleSn+"' style='width: 160px;'>"+tempMulitSampleSn+"</td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-3'  style='width: 80px;text-align: center;' id='MULITSAMPLE_STATE"+index+"'>"+testFlag+"<input type='hidden' name='MULITSAMPLE_STATE'  value='1' type='hidden'/></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-4'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_INFO' id='MULITSAMPLE_INFO"+index+"' value=''/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-5'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_SN' id='MULITSAMPLE_SN"+index+"' value='"+tempMulitSampleSn+"'/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-6'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_ID' id='MULITSAMPLE_ID"+index+"' value=''/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-7'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULITSAMPLE_STATE_VAL"+index+"' value='1'/ ></td>"); //状态
							
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-8'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULIT_TEST_RESULT"+index+"' value='OK'/ ></td>"); //检测状态
							}
							
						}
						
					}
					
						var tableTrJs = $("#itemDetailBody6 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('itemDetailBody6');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1235");
				    },	
				error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			  	}
			});
		}
		
		function onClickMultiSampleSnInfo(qipSn){
			
			$("#itemDetailBody6").empty();
			var mulitSampleSn=$.trim(qipSn);
			var inspectSn = $("#paraMapObj_QII_INSPECT_SN").val();
			var infoId=$("#infoId").val();
			var dataAuth=$("#dataAuth").val();
			var jsondata = {"dataAuth":dataAuth, "mulitSampleSn":mulitSampleSn,"inspectSn":inspectSn,"infoId": infoId};
			var getMulitSampleInfo="${path}buss/bussModel_exeFunc.ms?funcMId=7c10b52cb36e4efeb0e41a51378083cb&formId=%{formId}";
            var mulitSampleTestNum=0;//检测数量
            $("#onClickMultiSampleSnInfoQipSn").val(qipSn);
            
            util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: getMulitSampleInfo,
			    data: jsondata,
				success: function(data){
					util.closeLoading();
					var index="";
					var tempMulitSampleSn="";
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						mulitSampleTestNum=rccList.length;
						for(var i=0;i<mulitSampleTestNum;i++){
						    if(rccList[i].QII_SUBSET_SN==null || rccList[i].QII_SUBSET_SN ==""){
						        return;
						    }
						}
						var testFlag="已检验";
						var testFlagVal="2";
						var tempRes="2";
						for(var k=0;k<mulitSampleTestNum;k++){
							var j=k+1;
							if(j>999){
								utilsFp.confirmIcon(3,"","","", "超出流水号三位",0,"","");
								return;
							}
							var tempEqualFlag=false;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].ID==null){
			 				    	rccList[i].ID="";
			 				    	
			 				    }
								if(rccList[i].QII_SUBSET_SN==null){
			 				    	rccList[i].QII_SUBSET_SN="";
			 				    }
								var tempStr=rccList[i].QII_SUBSET_SN;
								var subsetSn=tempStr.substr(tempStr.length-3,tempStr.length);
								var subsetNum=parseInt(subsetSn);
							    
								if(j==subsetNum){
									tempEqualFlag=true;
									index=changeMulitSampleNum(subsetNum);
									tempMulitSampleSn=mulitSampleSn+index;
									if(rccList[i].QII_TEST_RESULT=="1"){
				 				    	tempRes="1";
				 				    }
			 				    	testFlagVal="2";
			 				    	if(testFlagVal=="1"){
										testFlag="<span class='state' style='background-color:#d67e7e;color:#FFFFFF;width:45px'>未检验</span>";
									}else{
										testFlag="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:45px'>已检验</span>";
									}
								}
							}
							$("#onClickMultiSampleSnInfoTempMulitSampleSn").val(tempMulitSampleSn);
							if(tempEqualFlag==true){
								//存在 已检验
								$("#itemDetailBody6").append("<tr id='' name='' onclick=\"onClickMulitSampleSnInfo2("+j+",'"+qipSn+"','"+tempMulitSampleSn+"');\"></tr>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(j)+"</td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value=''/></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-2' title='"+tempMulitSampleSn+"' style='width: 160px;'>"+tempMulitSampleSn+"</td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-3'  style='width: 80px;text-align: center;' id='MULITSAMPLE_STATE"+index+"'>"+testFlag+"<input type='hidden' name='MULITSAMPLE_STATE'  value='"+testFlagVal+"'/></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-4'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_INFO' id='MULITSAMPLE_INFO"+index+"' value=''/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-5'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_SN' id='MULITSAMPLE_SN"+index+"' value='"+tempMulitSampleSn+"'/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-6'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_ID' id='MULITSAMPLE_ID"+index+"' value=''/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-7'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULITSAMPLE_STATE_VAL"+index+"' value='"+testFlagVal+"'/ ></td>"); //状态
						
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-8'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULIT_TEST_RESULT"+index+"' value='"+tempRes+"'/ ></td>"); //检测状态
							}else{
								//不存在 未检验
								index=changeMulitSampleNum(j);
								tempMulitSampleSn=mulitSampleSn+index;
		 				    	tempRes="1";
								testFlag="待检验";
		 				    	testFlagVal="1";
		 				    	if(testFlagVal=="1"){
									testFlag="<span class='state' style='background-color:#d67e7e;color:#FFFFFF;width:45px'>未检验</span>";
								}else{
									testFlag="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:45px'>已检验</span>";
								}
								$("#itemDetailBody6").append("<tr id='' name='' onclick=\"onClickMulitSampleSnInfo2("+j+",'"+qipSn+"','"+tempMulitSampleSn+"');\"></tr>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(j)+"</td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value=''/></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-2' title='"+tempMulitSampleSn+"' style='width: 160px;'>"+tempMulitSampleSn+"</td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-3'  style='width: 80px;text-align: center;' id='MULITSAMPLE_STATE"+index+"'>"+testFlag+"<input type='hidden' name='MULITSAMPLE_STATE'  value='1' type='hidden'/></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-4'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_INFO' id='MULITSAMPLE_INFO"+index+"' value=''/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-5'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_SN' id='MULITSAMPLE_SN"+index+"' value='"+tempMulitSampleSn+"'/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-6'  style='width: 160px;text-align: center;display: none;'><input type='hidden' name='MULITSAMPLE_ID' id='MULITSAMPLE_ID"+index+"' value=''/ ></td>");
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-7'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULITSAMPLE_STATE_VAL"+index+"' value='1'/ ></td>"); //状态
							
								$("#itemDetailBody6 tr:last").append("<td class='datagrid-cell datagrid-cell-8'  style='width: 160px;text-align: center;display: none;'><input type='hidden' id='MULIT_TEST_RESULT"+index+"' value='OK'/ ></td>"); //检测状态
							}
							
						}
						
					}
					
						var tableTrJs = $("#itemDetailBody6 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('itemDetailBody6');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1235");
				    }	,
				error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			  	}
			});
		}
		function onClickMulitSampleSnInfo2(index,qipSn,tempMulitSampleSn){
			$("#itemDetailBody7").attr("display","none");
			index=parseInt(index);
			var tempIndex=changeMulitSampleNum(index);
		    //var tempMulitSampleSn=$.trim($("#onClickMultiSampleSnInfoTempMulitSampleSn").val());
		    $("#subsetMulitSampleSn").val(tempMulitSampleSn);
		    $("#index").val(tempIndex);
			var mulitSampleSn=qipSn;
			var inspectSn = $("#paraMapObj_QII_INSPECT_SN").val();
			var infoId=$("#infoId").val();
            var dataAuth=$("#dataAuth").val();
			var getMutilSampleTestItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=5ad74cbf42034280991d8e5cf688d424";
			util.showLoading("处理中...");
	        jQuery.ajax({
	 			type: "POST",
	 	   		dataType: "json",
	 	    	url: getMutilSampleTestItemUrl+"&mulitSampleSn="+mulitSampleSn+"&inspectSn="+inspectSn+"&infoId="+infoId+"&subsetMulitSampleSn="+tempMulitSampleSn+"&dataAuth="+dataAuth,
	 	    	//url: "buss/bussModel_exeFunc.ms?FUNC_CODE=F6018&funcMId=0376d8f6545d4ee5a34deff178328877&planId="+planId,
	 			success: function(data){
	 				//snErrorFlag=2;
	 				util.closeLoading();
	 				var dataList=data.ajaxList;
	 				var dataMap=data.ajaxMap;
	 				//console.log(data.ajaxString);
	 				if(dataList.length==0){
	 					//没有数据
	 					$("#itemDetailBody7").attr("display","none");
	 				}else{
	 					$("#itemDetailBody7").css("display","table-row-group");
		 				for(var i=0;i<dataList.length;i++){
		 				    var item=dataList[i];
		 				    
		 				    if(item.ID==null){
		 				    	item.ID="";
		 				    }
		 				    if(item.QII_ITEM_TYPE_NAME==null){
		 				    	item.QII_ITEM_TYPE_NAME="";
		 				    }
		 				    if(item.QII_ITEM_NAME==null){
		 				    	item.QII_ITEM_NAME="";
		 				    }
		 				    if(item.QII_ITEM_CLASS==null){
		 				    	item.QII_ITEM_CLASS="";
		 				    }
		 				    if(item.QII_ITEM_UNIT==null){
		 				    	item.QII_ITEM_UNIT="";
		 				    }
		 				    if(item.QII_ITEM_MAXVALUE==null){
		 				    	item.QII_ITEM_MAXVALUE="";
		 				    }
		 				    if(item.QII_ITEM_MINVALUE==null){
		 				    	item.QII_ITEM_MINVALUE="";
		 				    }
		 				    if(item.QII_TEST_METHOD==null){
		 				    	item.QII_TEST_METHOD="";
		 				    }
		 				    if(item.QII_TEST_CONTENT==null){
		 				    	item.QII_TEST_CONTENT="";
		 				    }
		 				    if(item.QII_ACTUAL_VALUE==null){
		 				    	item.QII_ACTUAL_VALUE="";
		 				    }
		 				    if(item.QII_MEMO==null){
		 				    	item.QII_MEMO="";
		 				    }
		 				    if(item.QII_ERROR_DEC==null){
		 				    	item.QII_ERROR_DEC="";
		 				    }
		 				    if(item.QII_ERROR_CODE==null){
		 				    	item.QII_ERROR_CODE="";
		 				    }
		 				    if(item.QII_ERROR_GRADE_NAME==null){
		 				    	item.QII_ERROR_GRADE_NAME="";
		 				    }
		 				    if(item.QII_ERROR_NUM==null){
		 				    	item.QII_ERROR_NUM="";
		 				    }
		 				    
							$("#itemDetailBody7 tr:eq(" + i + ")").attr("id",item.ID);
			
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(0)").text(item.ROWNUM);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(2)").text(item.QII_ITEM_TYPE_NAME);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(3)").text(item.QII_ITEM_TYPE);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(4)").text(item.QII_ITEM_NAME);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(5)").text(item.ITEM_CLASS_NAME);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(6)").text(item.QII_ITEM_UNIT);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(7)").text(item.QII_ITEM_MAXVALUE);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(8)").text(item.QII_ITEM_MINVALUE);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(9) input").val(item.QII_ACTUAL_VALUE);
							//检验结果
							//console.log(item.QII_ERROR_NUM);
							//console.log(item.QII_MEMO);
							//console.log(item.QII_TEST_RESULT);
							//console.log(item.QII_ERROR_DEC);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(10) select").val(item.QII_TEST_RESULT);
							//不良代码
							if(item.QII_TEST_RESULT=="2"){
								var num=i+1;
								var btn="#errorCodeShowTwo"+num+"_SHOW";
								var errorNumId="#ERROR_NUM"+num;
								$(btn).removeAttr("disabled");
								$(errorNumId).removeAttr("disabled");
								$(btn).val(item.QII_ERROR_CODE);
								//$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(11)").val(item.QII_ERROR_CODE);
							}else{
								var num=i+1;
								var btn="#errorCodeShowTwo"+num+"_SHOW";
								var errorNumId="#ERROR_NUM"+num;
								$(btn).attr("disabled");
								$(errorNumId).attr("disabled");
								$(btn).val("");
							}
							//不良描述
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(12)").text(item.QII_ERROR_DEC);
							//缺陷等级
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(13)").text(item.QII_ERROR_GRADE_NAME);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(14) input").val(item.QII_ERROR_NUM);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(15)").text(item.QII_TEST_METHOD);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(16)").text(item.QII_TEST_CONTENT);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(17) input").val(item.QII_MEMO);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(18)").text(item.QII_ITEM_SN);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(19)").text(item.ITEM_CLASS);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(20)").text(item.QII_ERROR_GRADE);
		 				}
		 				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1238"); 
	 				}
	 		              
	 			},
	 			error: function(msg){
	 				util.closeLoading();
	 				
	 		   }
	 		});		
		}
		
		function changeMulitSampleNum(index){
			var tempStr="";
			if(index<10){
				tempStr="00"+index;
			}else if(index<100){
				tempStr="0"+index;
			}else{
				tempStr=index+"";
			}
			return tempStr;
		}
		function onClickMulitSampleInfo(index){
			$("#itemDetailBody7").attr("display","none");
			index=parseInt(index);
			var tempIndex=changeMulitSampleNum(index);
		    var tempMulitSampleSn=$.trim($("#MULITSAMPLE_SN"+tempIndex).val());
		    $("#subsetMulitSampleSn").val(tempMulitSampleSn);
		    $("#index").val(tempIndex);
			var mulitSampleSn=$("#MULIT_SAMPLE_SN").val();
			var inspectSn = $("#paraMapObj_QII_INSPECT_SN").val();
			var infoId=$("#infoId").val();
			var dataAuth=$("#dataAuth").val();
            var jsondata = { "mulitSampleSn": mulitSampleSn, "inspectSn":inspectSn,"infoId":infoId,"subsetMulitSampleSn":tempMulitSampleSn,"dataAuth":dataAuth};
			var getMutilSampleTestItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=5ad74cbf42034280991d8e5cf688d424";
			util.showLoading("处理中...");
	        jQuery.ajax({
	 			type: "POST",
	 	   		dataType: "json",
	 	    	//url: getMutilSampleTestItemUrl+"&mulitSampleSn="+mulitSampleSn+"&inspectSn="+inspectSn+"&infoId="+infoId+"&subsetMulitSampleSn="+tempMulitSampleSn,
	 	    	url: getMutilSampleTestItemUrl,
	 	    	data:jsondata,
	 	    	//url: "buss/bussModel_exeFunc.ms?FUNC_CODE=F6018&funcMId=0376d8f6545d4ee5a34deff178328877&planId="+planId,
	 			success: function(data){
	 				//snErrorFlag=2;
	 				util.closeLoading();
	 				var dataList=data.ajaxList;
	 				var dataMap=data.ajaxMap;
	 				if(dataList.length==0){
	 					//没有数据
	 					$("#itemDetailBody7").attr("display","none");
	 				}else{
	 					$("#itemDetailBody7").css("display","table-row-group");
		 				for(var i=0;i<dataList.length;i++){
		 				    var item=dataList[i];
		 				    
		 				    if(item.ID==null){
		 				    	item.ID="";
		 				    }
		 				    if(item.QII_ITEM_TYPE_NAME==null){
		 				    	item.QII_ITEM_TYPE_NAME="";
		 				    }
		 				    if(item.QII_ITEM_NAME==null){
		 				    	item.QII_ITEM_NAME="";
		 				    }
		 				    if(item.QII_ITEM_CLASS==null){
		 				    	item.QII_ITEM_CLASS="";
		 				    }
		 				    if(item.QII_ITEM_UNIT==null){
		 				    	item.QII_ITEM_UNIT="";
		 				    }
		 				    if(item.QII_ITEM_MAXVALUE==null){
		 				    	item.QII_ITEM_MAXVALUE="";
		 				    }
		 				    if(item.QII_ITEM_MINVALUE==null){
		 				    	item.QII_ITEM_MINVALUE="";
		 				    }
		 				    if(item.QII_TEST_METHOD==null){
		 				    	item.QII_TEST_METHOD="";
		 				    }
		 				    if(item.QII_TEST_CONTENT==null){
		 				    	item.QII_TEST_CONTENT="";
		 				    }
		 				    if(item.QII_ACTUAL_VALUE==null){
		 				    	item.QII_ACTUAL_VALUE="";
		 				    }
		 				    if(item.QII_MEMO==null){
		 				    	item.QII_MEMO="";
		 				    }
		 				    if(item.QII_ERROR_DEC==null){
		 				    	item.QII_ERROR_DEC="";
		 				    }
		 				    if(item.QII_ERROR_CODE==null){
		 				    	item.QII_ERROR_CODE="";
		 				    }
		 				    if(item.QII_ERROR_GRADE_NAME==null){
		 				    	item.QII_ERROR_GRADE_NAME="";
		 				    }
		 				    if(item.QII_ERROR_NUM==null){
		 				    	item.QII_ERROR_NUM="";
		 				    }
		 				    
							$("#itemDetailBody7 tr:eq(" + i + ")").attr("id",item.ID);
			
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(0)").text(item.ROWNUM);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(2)").text(item.QII_ITEM_TYPE_NAME);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(3)").text(item.QII_ITEM_TYPE);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(4)").text(item.QII_ITEM_NAME);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(4)").attr("css","display:none");
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(5)").text(item.ITEM_CLASS_NAME);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(6)").text(item.QII_ITEM_UNIT);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(7)").text(item.QII_ITEM_MAXVALUE);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(8)").text(item.QII_ITEM_MINVALUE);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(9) input").val(item.QII_ACTUAL_VALUE);
							//检验结果
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(10) select").val(item.QII_TEST_RESULT);
							//不良代码
							if(item.QII_TEST_RESULT=="2"){
								var num=i+1;
								var btn="#errorCodeShowTwo"+num+"_SHOW";
							
								var errorNumId="#ERROR_NUM"+num;
								$(btn).removeAttr("disabled");
								$(errorNumId).removeAttr("disabled");
								$(btn).val(item.QII_ERROR_CODE);
								//$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(11)").val(item.QII_ERROR_CODE);
							}else{
								var num=i+1;
								var btn="#errorCodeShowTwo"+num+"_SHOW";
								var errorNumId="#ERROR_NUM"+num;
								$(btn).attr("disabled");
								$(errorNumId).attr("disabled");
								$(btn).val("");
							}
							//不良描述
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(12)").text(item.QII_ERROR_DEC);
							//缺陷等级
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(13)").text(item.QII_ERROR_GRADE_NAME);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(14) input").val(item.QII_ERROR_NUM);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(15)").text(item.QII_TEST_METHOD);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(16)").text(item.QII_TEST_CONTENT);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(17) input").val(item.QII_MEMO);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(18)").text(item.QII_ITEM_SN);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(19)").text(item.ITEM_CLASS);
							$("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(20)").text(item.QII_ERROR_GRADE);
								
		 				}
		 			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1238"); 
	 				}
	 		        
	 			},
	 			error: function(msg){
	 				util.closeLoading();
	 				
	 		   }
	 		});		
		}
		
		function editSAVE(){
			var subsetMulitSampleSn=$.trim($("#subsetMulitSampleSn").val());
			var index=$("#index").val();
			var allInfoStr="";
			var ids = "";
			var itemTypes = "";
			var itemNames = "";
			var itemClasses = "";
			var itenUnits = "";
			var maxVals = "";
			var minVals = "";
			var actualVals = "";
			var testRes = "";
			var errorCodes = "";
			var errorDecs = "";
			var errorGrades = "";
			var testMethods = "";
			var testContents = "";
			var memos = "";
			var itemSns = "";
			var errorNums = "";
			var tempTestRes="1";//OK
			var trs = $("#itemDetailBody7 tr");
			
			var table6Trs = $("#itemDetailBody6 tr");
			if(table6Trs.length==0){
				utilsFp.confirmIcon(3,"","","", "请先检验项目信息",0,"","");
				return;
			}
			var tempCount=0;
			for(var i = 0; i < trs.length; i++) {
				var num=i+1; 
				var checkBox="#table7Checkbox"+num;
			    if($(checkBox).attr("checked")=="checked"){
			    	var testResId="#MULIT_TEST_RESULT"+num;
					var testResVal=$(testResId).val();
			    	if(testResVal=="2"){
    					var btn="#errorCodeShowTwo"+num+"_SHOW";
    					
    					if($.trim($(btn).val())==""){
    						_alertValMsg($(btn), "<dict:lang value="该项不能为空" />");
    						return;
    					}
			    	}
			    }
			}
			for(var i = 0; i < trs.length; i++) {
				var num=i+1; 
				var checkBox="#table7Checkbox"+num;
			    if($(checkBox).attr("checked")=="checked"){
			    	tempCount++;
			    	allInfoStr += subsetMulitSampleSn + ",";
			    	
					var id = $("#itemDetailBody7 tr:eq(" + i + ")").attr("id");
					id = $.trim(id);
					allInfoStr += id + ",";
	
					var itemType = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(3)").text();
					itemType = $.trim(itemType);
					allInfoStr += itemType + ",";
	
					var itemSn = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(18)").text();
					itemSn = $.trim(itemSn);
					allInfoStr += itemSn + ",";
	
					var itemName = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(4)").text();
					itemName = $.trim(itemName);
					allInfoStr += itemName + ",";
					
					var itemClass = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(19)").text();
					itemClass = $.trim(itemClass);
					allInfoStr += itemClass + ",";
					
					var itenUnit = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(6)").text();
					itenUnit = $.trim(itenUnit);
					allInfoStr += itenUnit + ",";
					
					var maxVal = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(7)").text();
					maxVal = $.trim(maxVal);
					allInfoStr += maxVal + ",";
					
					var minVal = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(8)").text();
					minVal = $.trim(minVal);
					allInfoStr += minVal + ",";
					//实际值
					var actualVal = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(9) input").val();
					actualVal = $.trim(actualVal);
					allInfoStr += actualVal + ",";
					//检验结果
					var testRe = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(10) select").val();
					if($.trim(testRe)=="0"){
						testRe="1";
					}else{
						testRe = $.trim(testRe);
					}
					allInfoStr += testRe + ",";
					//不良代码
					var num=i+1;
					var btn="#errorCodeShowTwo"+num+"_SHOW";
					//var errorCode = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(11)").val();
					var errorCode = $(btn).val();
					errorCode = $.trim(errorCode);
					allInfoStr += errorCode + ",";
					//不良描述
					var errorDec = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(12)").text();
					errorDec = $.trim(errorDec);
					allInfoStr += errorDec + ",";
					//缺陷等级
					var errorGrade = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(13)").text();
					errorGrade = $.trim(errorGrade);
					if(errorGrade=="轻缺陷"){
						errorGrade="1";
					}else if(errorGrade=="重缺陷"){
						errorGrade="2";
					}else if(errorGrade=="致命缺陷"){
						errorGrade="3";
					}
					allInfoStr += errorGrade + ",";
					
					if($.trim(testRe)=="0" || $.trim(testRe)=="1"){
						allInfoStr += "0" + ",";
					}else{
						allInfoStr += "1" + ",";
						tempTestRes="2";//NG
					}
					//var errorNum = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(14) input").val();
					//errorNum = $.trim(errorNum);
					//errorNums += errorNum + ",";
					
					var testMethod = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(15)").text();
					testMethod = $.trim(testMethod);
					allInfoStr += testMethod + ",";
					
					var testContent = $("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(16)").text();
					testContent = $.trim(testContent);
					allInfoStr += testContent + ",";
					//备注
					var memo = $("#itemDetailBody7 tr:eq(" + i + ")").find("td:eq(17) input").val();
					memo = $.trim(memo);
					allInfoStr += memo + ",";
					
					if(i!=trs.length-1){
						allInfoStr += "&&";
					}
			    }
			}
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1238"); 
			if(tempCount==0){
				utilsFp.confirmIcon(3,"","","", "请勾选检验项目",0,"","");
				return;
			}
			var inspectSn=$.trim($("#paraMapObj_QII_INSPECT_SN").val());
			var qipSn=$.trim($("#MULIT_SAMPLE_SN").val());
			
			var testFlag="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:45px'>已检验</span>";
			$("#MULITSAMPLE_SN"+index).val(subsetMulitSampleSn);
			$("#MULITSAMPLE_INFO"+index).val(allInfoStr);
			$("#MULITSAMPLE_STATE"+index).text("");
			$("#MULITSAMPLE_STATE"+index).append(testFlag);
			$("#MULITSAMPLE_STATE_VAL"+index).val("2");
			$("#MULIT_TEST_RESULT"+index).val(tempTestRes);
			
			var jsondata = { "inspectSn":inspectSn,"qipSn": qipSn, "mulitSampleInfo": allInfoStr};
			var getParentItemUrl3="${path}buss/bussModel_exeFunc.ms?funcMId=934928d15ac941af8dd465a6344453d3";
			
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: getParentItemUrl3,
			    //dataType:'html',
			    data: jsondata,
	 			success: function(data){
	 			    util.closeLoading();
	 				var itemMap=data.ajaxMap;
	 				if(itemMap.TESTFLAG=="FAIL"){
	 					utilsFp.confirmIcon(3,"","","", "保存失败",0,"","");
						return;
	 				}
	 			},
	 			error: function(mag){
	 			    util.closeLoading();
	 			    utilsFp.confirmIcon(3,"","","", "保存失败",0,"","");
	 		   }
	 		});
		}
		//多登记检验 保存
		function multiSampleSaveInfo(){
			var tempFlag=true;
			var trs = $("#itemDetailBody6 tr");
			var eFlag=false;
			var sampleInfo="";
			for(var i = 0; i < trs.length; i++) {
				var num=i+1;
				var tempIndex=changeMulitSampleNum(num);
				var testResId="#MULIT_TEST_RESULT"+tempIndex;
				var testResVal=$(testResId).val();
				
				if(testResVal=="2"){
					eFlag=true;
					
				}
				var sampleStateId="#MULITSAMPLE_STATE_VAL"+tempIndex;
				var sampleStateVal=$.trim($(sampleStateId).val());
				if(sampleStateVal=="1"){
					tempFlag=false;
				}
			}
			if(tempFlag==true){
				snErrorFlag2=4;
			}else{
				snErrorFlag2=5;
			}
			if(snErrorFlag2!=2&&snErrorFlag2!=3&&snErrorFlag2!=4){
				if(snErrorFlag2==0){
					utilsFp.confirmIcon(3,"","","", "请输入样本SN，按Enter键",0,"","");
					return;
			 		//$("#paraMapObj_QIP_SN").focus();
				}else if(snErrorFlag2==1){
					utilsFp.confirmIcon(3,"","","", "样本SN不存在",0,"","");
					$("#MULIT_SAMPLE_SN").val("");
					return;
			 		//$("#paraMapObj_QIP_SN").focus();
				}else if(snErrorFlag2==5){
					utilsFp.confirmIcon(3,"","","", "检验项目未全部检验",0,"","");
					return;
			 		//$("#paraMapObj_QIP_SN").focus();
				}
			}else{
			
				//母本数据
				if(snErrorFlag2!=4){
					utilsFp.confirmIcon(3,"","","", "请先检验项目信息",0,"","");
					return;
			 		//$("#paraMapObj_QIP_SN").focus();
				}
				if(trs.length==0){
					utilsFp.confirmIcon(3,"","","", "请先检验项目信息",0,"","");
					return;
				}
				if(eFlag==false){
					if($("#MULIT_SAMPLE_ERROR_NUM").val()!=""){
						if(parseInt($.trim($("#MULIT_SAMPLE_ERROR_NUM").val()))>0){
							_alertValMsg($('#MULIT_SAMPLE_ERROR_NUM'), "<dict:lang value="检测结果ok 不良数量不可编辑 " />");
	                		return;
						}
					}
				}
				var itemNum=parseInt($.trim($("#MULIT_SAMPLE_ITEM_NUM").val()));//样本数量
                var testNum=parseInt($.trim($("#MULIT_SAMPLE_TEST_NUM").val()));//检验数量
                var errorNum=parseInt($.trim($("#MULIT_SAMPLE_ERROR_NUM").val()));//不良数量
                var scrapNum=parseInt($.trim($("#MULIT_SAMPLE_SCARP_NUM").val()));//损耗数量
                var sampleNum=parseInt($.trim($("#paraMapObj_QIP_SAMPLE_NUM").val()));
                            		
                if(snErrorFlag2==3){
                    if(testNum>itemNum){
                    	switchTag('tag3','content3','');
                   		_alertValMsg($("#MULIT_SAMPLE_TEST_NUM"),"<dict:lang value="检验数量不能大于样本数量 " />" );
                   		return;
                	}
                	if(testNum<errorNum){
                   		switchTag('tag3','content3','');
                   		_alertValMsg($("#MULIT_SAMPLE_ERROR_NUM"),"<dict:lang value="不良数量不能大于检验数量 " />" );
                   		return;
                	}
                	if(scrapNum>testNum){
                    	switchTag('tag3','content3','');
                   		_alertValMsg($("#MULIT_SAMPLE_SCARP_NUM"),"<dict:lang value="损耗数量不能大于检验数量 " />" );
                   		return;
                	}
                	
                }else{
                    if(testNum>sampleNum){
                        switchTag('tag3','content3','');
                        _alertValMsg($("#MULIT_SAMPLE_TEST_NUM"),"<dict:lang value="检验数量不能大于抽样数量 " />" );
                        return;
                    }
                	if(scrapNum>testNum){
                        	switchTag('tag3','content3','');
                   		_alertValMsg($("#MULIT_SAMPLE_SCARP_NUM"),"<dict:lang value="损耗数量不能大于检验数量 " />" );
                   		return;
                	}
                	if(testNum<errorNum){
                   		switchTag('tag3','content3','');
                   		_alertValMsg($("#MULIT_SAMPLE_ERROR_NUM"),"<dict:lang value="不良数量不能大于检验数量 " />" );
                   		return;
                	}
                	
                }
                            
				if($("#MULIT_SAMPLE_TEST_NUM").val()==""){
					$("#MULIT_SAMPLE_TEST_NUM").val("0");
					_alertValMsg($('#MULIT_SAMPLE_TEST_NUM'), "<dict:lang value="该项不能为空" />");
	        		return;
				}
				if($("#MULIT_SAMPLE_ERROR_NUM").val()==""){
					_alertValMsg($('#MULIT_SAMPLE_ERROR_NUM'), "<dict:lang value="该项不能为空 " />");
	        		return;
				}
				editFlag=true;
				var inspectSn=$.trim($("#paraMapObj_QII_INSPECT_SN").val());
				var qipSn=$.trim($("#MULIT_SAMPLE_SN").val());
				var itemNum=$.trim($("#MULIT_SAMPLE_ITEM_NUM").val());
				var testNum=$.trim($("#MULIT_SAMPLE_TEST_NUM").val());
				var scarpNum=$.trim($("#MULIT_SAMPLE_SCARP_NUM").val());
				var errorInputNum=$.trim($("#MULIT_SAMPLE_ERROR_NUM").val());
				var qipMemo=$.trim($("#MULIT_SAMPLE_MEMO").val());
				
				var jsondata = { "inspectSn":inspectSn,"qipSn": qipSn, "itemNum": itemNum,"testNum": testNum,"scarpNum": scarpNum,"errorInputNum": errorInputNum,"qipMemo": qipMemo,"ngFlag":eFlag};
				var getParentItemUrl2="${path}buss/bussModel_exeFunc.ms?funcMId=8f970c2f6e2b4c26a9f5dd6ebffaeaf6";
				util.showLoading("处理中...");
				$.ajax({
    				type: "POST",
    			    dataType: "json",
    			    url: getParentItemUrl2,
    			    //dataType:'html',
    			    data: jsondata,
		 			success: function(data){
		 			    util.closeLoading();
		 				snErrorFlag=0;
		 				$("#itemDetailBody5").html("");
		 				$("#itemDetailBody2").html("");
		 				var dataList=data.ajaxList;
		 				var dataStr=data.ajaxString;
		 				$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
		 				$("#paraMapObj_QII_LIST_FLAG").find("option[value='2']").attr("selected",true);
		 				$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
		 				$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
		 				if(dataList.length==0){
		 				}else{
			 				for(var i=0;i<dataList.length;i++){
			 				    var item=dataList[i];
			 				    var tempResult="";
			 				    if(item.QIP_TEST_RESULT=='1') tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>OK</span>";
								if(item.QIP_TEST_RESULT=='2') tempResult="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'>NG</span>";
			 				    $("#itemDetailBody5").append("<tr class='itemDetail' id='"+item.ID+"' name='"+item.ID+"' onclick=\"onClickMultiSampleSnInfo('"+item.QIP_SN+"');\"></tr>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+item.ROWNUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id='table5Checkbox"+item.ROWNUM+"' style='cursor: pointer;'></td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SN+"' style='width:120px;'>"+item.QIP_SN+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ITEM_NUM+"' style='width:80px;text-align:right;' '>"+item.QIP_ITEM_NUM+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_TEST_NUM+"</td>"); 
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SCARP_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_SCARP_NUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ERROR_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_ERROR_NUM+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell'  style='width:100px;text-align:center;'>"+tempResult+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_EMP+"' style='width:80px;text-align:center;'>"+item.QIP_TEST_EMP+"</td>");
								$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_TIME+"' style='width:150px;text-align:center;'>"+item.QIP_TEST_TIME+"</td>");
			 				
			 					$("#itemDetailBody2").append("<tr class='itemDetail' id='"+item.ID+"' name='"+item.ID+"'></tr>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+item.ROWNUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id='table2Checkbox"+item.ROWNUM+"' style='cursor: pointer;'></td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SN+"' style='width:120px;'>"+item.QIP_SN+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ITEM_NUM+"' style='width:80px;text-align:right;' '>"+item.QIP_ITEM_NUM+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_TEST_NUM+"</td>"); 
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SCARP_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_SCARP_NUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ERROR_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_ERROR_NUM+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell'  style='width:100px;text-align:center;'>"+tempResult+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_EMP+"' style='width:80px;text-align:center;'>"+item.QIP_TEST_EMP+"</td>");
								$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_TIME+"' style='width:150px;text-align:center;'>"+item.QIP_TEST_TIME+"</td>");
			 				}
			 		
			 				$("#MULIT_SAMPLE_SN").val("");
		 				    $("#MULIT_SAMPLE_ITEM_NUM").val("");
		 				    $("#MULIT_SAMPLE_TEST_NUM").val("");
		 				    $("#MULIT_SAMPLE_SCARP_NUM").val("");
		 				    $("#MULIT_SAMPLE_ERROR_NUM").val("");
		 				    $("#MULIT_SAMPLE_MEMO").val("");
		 					//$("#itemDetailBody3").html("");
		 					$("#MULIT_SAMPLE_SN").val("");
		 					$("#MULIT_SAMPLE_SN").focus();
		 					$("#itemDetailBody7").attr("display","none");
		 					$("#itemDetailBody6").html("");
		 				}
		 					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1232");
			 				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
		 				var resulrStrs=dataStr.split("|");
		 				var table1Trs = $("#itemDetailBody1 tr");
		 				var maxActualNum=0;
						var maxErrorNum=0;
						var inspectRes="1";
						var errorFlag="0";
		 				var okNum=0;
		 				var allTestFlag=true;
		 				for(var i=0;i<resulrStrs.length;i++){
		 					var tempStrs=resulrStrs[i].split(",");
		 					for(var j=0;j<table1Trs.length; j++){
		 						var errorGrade=$.trim($("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(5)").text());
		 						
		 						if(errorGrade=="轻缺陷"){
		 							errorGrade="1";
		 						}else if(errorGrade=="重缺陷"){
		 							errorGrade="2";
		 						}else if(errorGrade=="致命缺陷"){
		 							errorGrade="3";
		 						}
		 						var tempType=$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(2)").text();
		 						if(tempStrs[1]>maxActualNum){
	 								maxActualNum=tempStrs[1];
	 							}
		 						if(tempStrs[2]>maxErrorNum){
	 								maxErrorNum=tempStrs[2];
	 							}
		 						
		 						if(tempStrs[0]==$.trim(tempType) && tempStrs[4]==errorGrade){
		 							$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(12)").text(tempStrs[1]);
		 							$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(13)").text(tempStrs[2]);
		 							if(tempStrs[3]=="--"){
		 								$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(14)").text("");
		 								allTestFlag=false;
		 							}else{
		 								$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(14)").text(tempStrs[3]);
		 							}
		 							if(tempStrs[3]=="OK"){
		 								okNum++;
		 							}
		 						}
		 					}
		 				
		 				}
		 					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1231");
		 				var finalRes=false;
		 				if(okNum!=table1Trs.length){
		 					finalRes=true;
		 				}
		 				
		 				if(finalRes==true){
		 					//NG
		 					if(judgeMode!="1"){
		 					    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
							    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='2']").attr("selected",true);
							    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
							    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");
							    inspectRes="2";					
                            }
		 				}else{
		 					//OK
		 					if(judgeMode!="1"){
		 					    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
							    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='1']").attr("selected",true);
							    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
							    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");				
                            }
		 				}
		 				if(allTestFlag==true){
		 					//检验完成
		 					$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
							$("#paraMapObj_QII_LIST_FLAG").find("option[value='3']").attr("selected",true);
							$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
							$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
							
		 				}else{
		 					//检验中
		 					$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
							$("#paraMapObj_QII_LIST_FLAG").find("option[value='2']").attr("selected",true);
							$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
							$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
		 				}
		 				$("#inspectRes").val(inspectRes);
		 				$("#paraMapObj_QII_ACTUAL_NUM").val(maxActualNum);
		 				if(maxErrorNum==""){
		 				    maxErrorNum=0;
		 				}
		 				$("#paraMapObj_QII_ERROR_NUM").val(maxErrorNum);
		 				parentWindow.query(""); 
		 			},
		 			error: function(mag){
		 			    util.closeLoading();
		 			    
					    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		 		   }
		 		});
			}
		}
		//多登记检验 删除
		function multiSampleDelInfo(){
			
			var infoId=$("#infoId").val();
			var inspectSn=$("#paraMapObj_QII_INSPECT_SN").val();
			var trs = $("#itemDetailBody5 tr");
			var sampleSns="";
			var tempCheckFlag=false;
			for(var i = 0; i < trs.length; i++) {
				var num=i+1;
			    var btn="#table5Checkbox"+num;
			    if($(btn).attr("checked")=="checked"){
			    	var sn = $("#itemDetailBody5 tr:eq(" + i + ")").find("td:eq(2)").text();
					sn = $.trim(sn);
					sampleSns += sn + ",";
					tempCheckFlag=true;
			    }
			}
			if(tempCheckFlag==false){
				utilsFp.confirmIcon(3,"","","", "请勾选样本信息",0,"","");
				return;
			}
			var dataAuth=$("#dataAuth").val();
			var jsondata = { "infoId":infoId,"inspectSn":inspectSn,"sampleSns": sampleSns,"dataAuth":dataAuth};
			var delSampleInfo2="${path}buss/bussModel_exeFunc.ms?funcMId=c4f3ada8e3d64fb393974837c16721b9&formId=%{formId}";
			util.showLoading("处理中...");
			jQuery.ajax({
	 			type: "POST",
	 	   		dataType: "json",
	 	   		data: jsondata,
	 	    	url: delSampleInfo2,
	 			success: function(data){
	 				util.closeLoading();
	 				snErrorFlag=0;
	 				$("#itemDetailBody5").html("");
	 				$("#itemDetailBody2").html("");
	 				$("#itemDetailBody7").attr("display","none");
 					$("#itemDetailBody6").html("");
	 				var dataList=data.ajaxList;
	 				var dataStr=data.ajaxString;
	 				$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
	 				$("#paraMapObj_QII_LIST_FLAG").find("option[value='2']").attr("selected",true);
	 				$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
	 				$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
	 				if(dataList.length==0){
	 					
	 				}else{
		 				for(var i=0;i<dataList.length;i++){
		 				    var item=dataList[i];
		 				    if(item.QIP_TEST_NUM==null){
		 				    	item.QIP_TEST_NUM="0";
		 				    }
		 				    if(item.QIP_ERROR_NUM==null){
		 				    	item.QIP_ERROR_NUM="0";
		 				    }
							if(item.QIP_TEST_EMP==null){
		 				    	item.QIP_TEST_EMP="";
		 				    }
							if(item.TEST_TIME==null){
		 				    	item.TEST_TIME="";
		 				    }
		 				    var tempResult="";
							if(item.QIP_TEST_RESULT=='') tempResult="<span></span>";
		 				    if(item.QIP_TEST_RESULT=='1') tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>OK</span>";
							if(item.QIP_TEST_RESULT=='2') tempResult="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'>NG</span>";
		 				    $("#itemDetailBody5").append("<tr class='itemDetail' id='"+item.ID+"' name='"+item.ID+"' onclick=\"onClickMultiSampleSnInfo('"+item.QIP_SN+"');\"></tr>");
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+item.ROWNUM+"</td>");
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id='table5Checkbox"+item.ROWNUM+"' style='cursor: pointer;'></td>");
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SN+"' style='width:120px;'>"+item.QIP_SN+"</td>"); 
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ITEM_NUM+"' style='width:80px;text-align:right;' '>"+item.QIP_ITEM_NUM+"</td>"); 
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_TEST_NUM+"</td>"); 
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SCARP_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_SCARP_NUM+"</td>");
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ERROR_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_ERROR_NUM+"</td>");
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell'  style='width:100px;text-align:center;'>"+tempResult+"</td>");
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_EMP+"' style='width:80px;text-align:center;'>"+item.QIP_TEST_EMP+"</td>");
							$("#itemDetailBody5 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_TIME+"' style='width:150px;text-align:center;'>"+item.QIP_TEST_TIME+"</td>");
		 				
		 					$("#itemDetailBody2").append("<tr class='itemDetail' id='"+item.ID+"' name='"+item.ID+"'></tr>");
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+item.ROWNUM+"</td>");
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' id='table2Checkbox"+item.ROWNUM+"' style='cursor: pointer;'></td>");
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SN+"' style='width:120px;'>"+item.QIP_SN+"</td>"); 
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ITEM_NUM+"' style='width:80px;text-align:right;' '>"+item.QIP_ITEM_NUM+"</td>"); 
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_TEST_NUM+"</td>"); 
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_SCARP_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_SCARP_NUM+"</td>");
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_ERROR_NUM+"' style='width:80px;text-align:right;'>"+item.QIP_ERROR_NUM+"</td>");
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell'  style='width:100px;text-align:center;'>"+tempResult+"</td>");
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_EMP+"' style='width:80px;text-align:center;'>"+item.QIP_TEST_EMP+"</td>");
							$("#itemDetailBody2 tr:last").append("<td class='datagrid-cell' title='"+item.QIP_TEST_TIME+"' style='width:150px;text-align:center;'>"+item.QIP_TEST_TIME+"</td>");
		 				}
		 		
		 				$("#MULIT_SAMPLE_SN").val("");
	 				    $("#MULIT_SAMPLE_ITEM_NUM").val("");
	 				    $("#MULIT_SAMPLE_TEST_NUM").val("");
	 				    $("#MULIT_SAMPLE_SCARP_NUM").val("");
	 				    $("#MULIT_SAMPLE_ERROR_NUM").val("");
	 				    $("#MULIT_SAMPLE_MEMO").val("");
	 					//$("#itemDetailBody3").html("");
	 					$("#MULIT_SAMPLE_SN").val("");
	 					$("#MULIT_SAMPLE_SN").focus();
	 					$("#itemDetailBody7").html("");
	 					$("#itemDetailBody6").html("");
	 				}
	 					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1232");
			 				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
	 				var resulrStrs=dataStr.split("|");
	 				var table1Trs = $("#itemDetailBody1 tr");
	 				var maxActualNum=0;
					var maxErrorNum=0;
					var inspectRes="1";
					var errorFlag="0";
	 				var okNum=0;
	 				var allTestFlag=true;
	 				for(var i=0;i<resulrStrs.length;i++){
	 					var tempStrs=resulrStrs[i].split(",");
	 					for(var j=0;j<table1Trs.length; j++){
	 						var errorGrade=$.trim($("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(5)").text());
	 						if(errorGrade=="轻缺陷"){
	 							errorGrade="1";
	 						}else if(errorGrade=="重缺陷"){
	 							errorGrade="2";
	 						}else if(errorGrade=="致命缺陷"){
	 							errorGrade="3";
	 						}
	 						var tempType=$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(2)").text();
	 						if(tempStrs[1]>maxActualNum){
 								maxActualNum=tempStrs[1];
 							}
	 						if(tempStrs[2]>maxErrorNum){
 								maxErrorNum=tempStrs[2];
 							}
	 						
	 						if(tempStrs[0]==$.trim(tempType) && tempStrs[4]==errorGrade ){
	 							$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(12)").text(tempStrs[1]);
	 							$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(13)").text(tempStrs[2]);
	 							if(tempStrs[3]=="--"){
	 								$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(14)").text("");
	 								allTestFlag=false;
	 							}else{
	 								$("#itemDetailBody1 tr:eq(" + j + ")").find("td:eq(14)").text(tempStrs[3]);
	 							}
	 							if(tempStrs[3]=="OK"){
	 								okNum++;
	 							}
	 						}
	 					}
	 				
	 				}
	 					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1231");
	 				var finalRes=false;
	 				if(okNum!=table1Trs.length){
	 					finalRes=true;
	 				}
	 				var testStatus="3";
	 				var table2Trs = $("#itemDetailBody2 tr").length;
	 				if(table2Trs==0){
	 						$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
	 						$("#paraMapObj_QII_LIST_FLAG").find("option[value='1']").attr("selected",true);
	 						$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
	 						$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
	 						//请选择
	 						if(judgeMode!="1"){
	 						    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
							    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='']").attr("selected",true);
							    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
							    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");
							    inspectRes="";					
                            }
							testStatus="1";
	 				}else{
	 					if(finalRes==true){
	 						//NG
	 						if(judgeMode!="1"){
	 						    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
							    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='2']").attr("selected",true);
							    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
							    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");
							    inspectRes="2";					
                            }
	 					}else{
	 						//OK
						    if(judgeMode!="1"){
	 						    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").removeAttr("disabled");
							    $("#paraMapObj_QII_INSEPCT_RESULT").find("option[value='1']").attr("selected",true);
							    $("#paraMapObj_QII_INSEPCT_RESULT").trigger("chosen:updated");
							    $("#paraMapObj_QII_INSEPCT_RESULT_chosen").attr("disabled","ture");					
                            }
	 					}
	 					if(allTestFlag==true){
	 						//检验完成
	 						$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
							$("#paraMapObj_QII_LIST_FLAG").find("option[value='3']").attr("selected",true);
							$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
							$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
						
	 					}else{
	 						//检验中
	 						$("#paraMapObj_QII_LIST_FLAG_chosen").removeAttr("disabled");
							$("#paraMapObj_QII_LIST_FLAG").find("option[value='2']").attr("selected",true);
							$("#paraMapObj_QII_LIST_FLAG").trigger("chosen:updated");
							$("#paraMapObj_QII_LIST_FLAG_chosen").attr("disabled","ture");
	 					}
	 				}
	 				
	 				$("#inspectRes").val(inspectRes);
	 				
	 				$("#paraMapObj_QII_ACTUAL_NUM").val(maxActualNum);
	 				if(maxErrorNum==""){
		 				    maxErrorNum=0;
		 				}
	 				$("#paraMapObj_QII_ERROR_NUM").val(maxErrorNum);
	 				parentWindow.query("");  
	 			},
	 			error: function(XMLHttpRequest, textStatus, errorThrown){
	 			    
	 				util.closeLoading();
	 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
	 				if (null != sessionstatus && sessionstatus == "noAuthority") {
	 				}else{
	 					utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
	 				}
	 		   }
	 		});
		}
		function onClickSampleInfo(qipSn){
			var inspectSn = $("#paraMapObj_QII_INSPECT_SN").val();
			var infoId=$("#infoId").val();
			var dataAuth=$("#dataAuth").val();
			var getTestItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=bfa39cf6c9ff4b819efcf8a8c22e347a&formId=%{formId}&dataAuth="+dataAuth+"&type="+type;
            var jsondata = { "qipSn": qipSn, "inspectSn":inspectSn,"infoId":infoId,"dataAuth":dataAuth};
	        jQuery.ajax({
	 			type: "POST",
	 	   		dataType: "json",
	 	    	//url: getTestItemUrl+"&qipSn="+qipSn+"&inspectSn="+inspectSn+"&infoId="+infoId,			
                url: getTestItemUrl,
                data:jsondata,
	 			success: function(data){
	 				var dataList=data.ajaxList;
	 				if(dataList.length==0){
	 					
	 				}else{
		 				for(var i=0;i<dataList.length;i++){
		 				    var item=dataList[i];
		 				    
		 				    if(item.ID==null){
		 				    	item.ID="";
		 				    }
		 				    if(item.QII_ITEM_TYPE_NAME==null){
		 				    	item.QII_ITEM_TYPE_NAME="";
		 				    }
		 				    if(item.QII_ITEM_NAME==null){
		 				    	item.QII_ITEM_NAME="";
		 				    }
		 				    if(item.QII_ITEM_CLASS==null){
		 				    	item.QII_ITEM_CLASS="";
		 				    }
		 				    if(item.QII_ITEM_UNIT==null){
		 				    	item.QII_ITEM_UNIT="";
		 				    }
		 				    if(item.QII_ITEM_MAXVALUE==null){
		 				    	item.QII_ITEM_MAXVALUE="";
		 				    }
		 				    if(item.QII_ITEM_MINVALUE==null){
		 				    	item.QII_ITEM_MINVALUE="";
		 				    }
		 				    if(item.QII_TEST_METHOD==null){
		 				    	item.QII_TEST_METHOD="";
		 				    }
		 				    if(item.QII_TEST_CONTENT==null){
		 				    	item.QII_TEST_CONTENT="";
		 				    }
		 				    if(item.QII_ACTUAL_VALUE==null){
		 				    	item.QII_ACTUAL_VALUE="";
		 				    }
		 				    if(item.QII_MEMO==null){
		 				    	item.QII_MEMO="";
		 				    }
		 				    if(item.QII_ERROR_DEC==null){
		 				    	item.QII_ERROR_DEC="";
		 				    }
		 				    if(item.QII_ERROR_CODE==null){
		 				    	item.QII_ERROR_CODE="";
		 				    }
		 				    if(item.QII_ERROR_GRADE_NAME==null){
		 				    	item.QII_ERROR_GRADE_NAME="";
		 				    }
		 				    if(item.QII_ERROR_NUM==null){
		 				    	item.QII_ERROR_NUM="";
		 				    }
		 				    
							$("#itemDetailBody3 tr:eq(" + i + ")").attr("id",item.ID);
			
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(0)").text(item.ROWNUM);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(2)").text(item.QII_ITEM_TYPE_NAME);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(3)").text(item.QII_ITEM_TYPE);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(4)").text(item.QII_ITEM_NAME);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(5)").text(item.ITEM_CLASS_NAME);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(6)").text(item.QII_ITEM_UNIT);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(7)").text(item.QII_ITEM_MAXVALUE);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(8)").text(item.QII_ITEM_MINVALUE);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(9) input").val(item.QII_ACTUAL_VALUE);
							//检验结果
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(10) select").val(item.QII_TEST_RESULT);
							//不良代码
							if(item.QII_TEST_RESULT=="2"){
								var num=i+1;
								var btn="#errorCodeShow"+num+"_SHOW";
							
								var errorNumId="#ERROR_NUM"+num;
								$(btn).removeAttr("disabled");
								$(errorNumId).removeAttr("disabled");
								$(btn).val(item.QII_ERROR_CODE);
								//$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(11)").val(item.QII_ERROR_CODE);
							}else{
								var num=i+1;
								var btn="#errorCodeShow"+num+"_SHOW";
							
								var errorNumId="#ERROR_NUM"+num;
								$(btn).attr("disabled");
								$(errorNumId).attr("disabled");
								$(btn).val("");
							}
							//不良描述
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(12)").text(item.QII_ERROR_DEC);
							//缺陷等级
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(13)").text(item.QII_ERROR_GRADE_NAME);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(14) input").val(item.QII_ERROR_NUM);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(15)").text(item.QII_TEST_METHOD);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(16)").text(item.QII_TEST_CONTENT);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(17) input").val(item.QII_MEMO);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(18)").text(item.QII_ITEM_SN);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(19)").text(item.ITEM_CLASS);
							$("#itemDetailBody3 tr:eq(" + i + ")").find("td:eq(20)").text(item.QII_ERROR_GRADE);
								
		 				}
		 			
	 				}
	 		      	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1233");        
	 			},
	 			error: function(msg){
	 			util.closeLoading();
	 				
	 		   }
	 		});
		}

	</script>
	<script>(function($){
  $(window).on('load',function(){
     setPopScroll('.scroll1','.head1');
     setPopScroll('.scroll2','.head2');
     setPopScroll('.scroll3','.head3');
     setPopScroll('.scroll4','.head4');
     setPopScroll('.scroll5','.head5');
     setPopScroll('.scroll6','.head6');
     setPopScroll('.scroll7','.head7');
     defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1231"); 
     defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1232"); 
     defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1233"); 
     defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234"); 
     defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1235"); 
     //defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1236"); 
     
     defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1238"); 
     defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1237"); 
 //   setPopScroll('#itemTable1 .scroll','#itemTable1 .datagrid-header-inner2');
 //   setPopScroll('#itemTable2 .scroll','#itemTable2 .datagrid-header-inner2');
  //   setPopScroll('#itemTable3 .scroll','#itemTable3 .datagrid-header-inner2');
   //  setPopScroll('#itemTable4 .scroll','#itemTable4 .datagrid-header-inner2');
  //   setPopScroll('#itemTable5 .scroll','#itemTable5 .datagrid-header-inner2');
  //   setPopScroll('#itemTable6 .scroll','#itemTable6 .datagrid-header-inner2');
   //  setPopScroll('#itemTable7 .scroll','#itemTable7 .datagrid-header-inner2');
     $("#paraMapObj_QIP_SN").attr("placeholder","请输入物料SN,按Enter键");
     $("#MULIT_SAMPLE_SN").attr("placeholder","请输入物料SN,按Enter键");
  })
})(jQuery)</script>
	<script>
		//mmz
		var oldtype = 'width: 630px;height: 270px;display: inline-block;';
		var newtype1 = 'position: absolute;top: 46px;left: 10px;height: 100%;z-index: 1000;background-color: white; width:100%'
		var newtype2 =' position:absolute;z-index:1001;left:700px; top:0px; margin-right:5px;width:280px';
		var t1 ="   width: 100%;overflow-x: auto;height: 205px;";
		var t2 ="width: 100%;overflow-x: auto;height: 510px;"
		var k1 ="display: block;";
		var k2 ="display:block;top:463px;";
		var l1 =" height: 147px;overflow: visible;    position: relative;";
		var l2 = "height: 466px;overflow: visible; width:956px;   position: relative;";
		var d1 =" max-height:none;";
		var d2="max-height:none;height: 466px;width:945px";
		var fyl = true;
		function fangda(){
			if(fyl){
			$('#optBtn1').attr('style',newtype2);
			$('#fandaBtn').html("<dict:lang value="mi" />");
//			$('#top_jcxm').css({'height':'100%','position':'absolute','top':'46px','left':'10px'});
			$('#top_jcxm').attr('style',newtype1);
			$('#top_jcxm #datagrid-header1').attr('style',t2);
			$('#mCSB_7_scrollbar_horizontal').attr('style',k2);
			$('#top_jcxm #mCSB_7').parent().attr('style',l2);
			$('#top_jcxm #mCSB_7').attr('style',d2);
				fyl=false;
				return;
			}
			if(!fyl){
			$('#optBtn1').attr('style','width:280px');
			$('#fandaBtn').html("<dict:lang value="mx" />");
			$('#top_jcxm').attr('style',oldtype);
			$('#top_jcxm #mCSB_7').parent().attr('style',l1);
			$('#top_jcxm #mCSB_7').attr('style',d1);
						$('#top_jcxm #datagrid-header1').attr('style',t1);
			$('#mCSB_7_scrollbar_horizontal').attr('style',k1);
				fyl=true;
				return;
			}
		
		}
	
	
	$("#itemDetailBody7").on('focus','td *',function(e){
	    	
	    e.stopPropagation(); 
	    defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1238"); 
	})
	</script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
 	<jsp:param name="modelName" value="VIEW_TYPE_11" />
    <jsp:param name="location" value="jsLoading" />
</jsp:include>
</body>

<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
    