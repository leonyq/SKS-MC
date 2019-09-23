<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
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
	}
	
	$(function() {
		$("#tag1").addClass("current");
		var nowDate = timeString();
		$("#paraMapObj_CDM_MT_TIME").val(nowDate);
		var timeS = getTimeSpace(nowDate);
		$("#paraMapObj_CDM_MT_SPACE").val(timeS.toFixed(2));
	});
	
function timeString(){
    var datetime = new Date();
    //datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    return year + "-" + month + "-" + date+" "+ hour+":"+ minute +":"+ second ;
}
//计算保养间隔
function getTimeSpace(nowDate){
    var endDate = $("#paraMapObj_CD_MT_DATE").val();
    var nowTime = new Date(nowDate);
    var endTime = new Date(endDate);
    var s1 = nowTime.getTime();
    var s2 = endTime.getTime();
    var total = (s1 - s2)/1000/3600/24;
    return total;
}
//把禁用的数据塞到隐藏域中
function setHid(){
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_TYPE' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_TYPE").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_CLASS' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_CLASS").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_CHARGE_MAN' type='hidden' value='"+$("#paraMapObj_CD_CHARGE_MAN").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_MT_DATE' type='hidden' value='"+$("#paraMapObj_CD_MT_DATE").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CDM_MT_TIME' type='hidden' value='"+$("#paraMapObj_CDM_MT_TIME").val()+"'>");
}

	//点击行寄选中该行
		function clickTr(tableId) {
			$("#" + tableId + " tr").unbind("click");
			$("#" + tableId + " tr input[type=checkbox]").unbind("click");
			$("#" + tableId + " tr").on("click", function(e) {
				var trId = $(this).attr("id");
				if($("#" + trId + " :checkbox").attr("checked")) {
					$("#" + trId + " :checkbox").prop("checked", false);
					$("#" + trId).css("background-color", "");
				} else {
					$("#" + tableId + " input[type='checkbox']").each(function() {
						if($(this).attr("checked")) {
							$(this).prop("checked", false);
							$(this).parents("tr").css("background-color", "");
						}
					});
					$("#" + trId + " :checkbox").prop("checked", true);
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
</script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
    <style>
       .maskdiv{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }    
    </style>
</head>
<body>
	<div class="edit">
		<form id="editForm" style="height:100%;" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" 
								<bu:formet exeid="%{exeid}" /> target="submitFrame">
                   				
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
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
			    	        <button type="button" id="saveInfo" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:534px;">
				
                   				<%--<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />--%>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name=iframeId value="${iframeId}">
								
		<bu:set name="paraMapObj" value="${dataId}" formId="99338dfb95df4eec8d5714a4e773b127" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
	<table class="basic-table" >
	<s:hidden id ="curId" name="curId" value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}'/>
	<s:hidden id ="curUser" name="curUser" value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}'/>
	<input type="hidden" id="selCount" name="selCount" value="0" />
	<input type="hidden" name="formIds" value="99338dfb95df4eec8d5714a4e773b127" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
    <input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
	<input type="hidden" name="99338dfb95df4eec8d5714a4e773b127" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e038776ba4c444bdbb33c4d32b715380'" />
		<s:set name="_$formId_1" value="'99338dfb95df4eec8d5714a4e773b127'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:83px;"/><bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_TYPE" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:83px;"/><bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" style="width:220px;" colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_SN" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" readonly="readonly" /></bu:td>
		
			<td class="name"/><bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_CLASS" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			
		</tr>
		<tr>
			<td class="name"/><bu:uitn colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_USE_DEP" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			
			<td class="name"/><bu:uitn colNo="CDM_MT_EMP" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<bu:td cssClass="dec" colNo="CDM_MT_EMP" formId="4981cf692e39466b9f092273166c00b4" ><bu:ui colNo="CDM_MT_EMP" style="width:200px;" formId="4981cf692e39466b9f092273166c00b4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:80px;"/><bu:uitn colNo="CD_MT_DATE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_MT_DATE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_MT_DATE" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name"/><span class="dot">*</span><bu:uitn colNo="CDM_MT_LONG" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<bu:td cssClass="dec" colNo="CDM_MT_LONG" formId="4981cf692e39466b9f092273166c00b4" ><bu:ui colNo="CDM_MT_LONG" style="width:200px;" onkeyup="value=value.replace(/[^\d.]/g,'')" formId="4981cf692e39466b9f092273166c00b4" dataId="${dataId}" formIndex="1"/></bu:td>
			
			<td class="name" style="width:80px;"/><bu:uitn colNo="CDM_MT_TIME" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<bu:td cssClass="dec" colNo="CDM_MT_TIME" formId="4981cf692e39466b9f092273166c00b4" ><bu:ui colNo="CDM_MT_TIME" style="width:200px;" formId="4981cf692e39466b9f092273166c00b4" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			
			<td class="name"/><bu:uitn colNo="CDM_MT_SPACE" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<bu:td cssClass="dec" colNo="CDM_MT_SPACE" formId="4981cf692e39466b9f092273166c00b4" ><bu:ui colNo="CDM_MT_SPACE" style="width:200px;" formId="4981cf692e39466b9f092273166c00b4" dataId="${dataId}" formIndex="1" readonly="readonly" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name"><span><dict:lang value="异常记录" /><span></span></span></td>
			<td class="dec" style="height:80px;" colspan="5"><textarea id="CDM_MT_MEMO" name="CDM_MT_MEMO" style="width: 100%;height: 100%;"></textarea></td>
		</tr>
	</table>

			<bu:jsVal formId="99338dfb95df4eec8d5714a4e773b127" formIndex="1" />		<div style="padding:1px;"></div>
	<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV>
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="保养项目" /></SPAN> </A>
									<input type="hidden" name="type1" value="保养项目"/>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="更换配件" /></SPAN> </A>
									<input type="hidden" name="type2" value="更换配件"/>
								</LI>
								

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 10px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
		<!--	<div class="extend-btn" style="float: right;margin-top:-40px;">
						<span><dict:lang value="计划代码" /></span>
						<bu:ui colNo="CDM_PLAN_SN" style="width:200px;" formId="4981cf692e39466b9f092273166c00b4" dataId="${dataId}" formIndex="1" />
			</div>-->
			<div class="mod" >
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
								        <td class="datagrid-cell" style="width:110px;" ></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目代码" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:145px;" ><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:105px;" ><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:105px;" ><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:105px;" ><dict:lang value="实际值" /></td >
										<td class="datagrid-cell" style="width:105px;" ><dict:lang value="单位" /></td >
										<td class="datagrid-cell" style="width:305px;"><dict:lang value="备注" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:215px;max-width:100%">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addDeviceItem_1" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
			   <div class="extend-btn" style="float: right;margin-top:-35px;">
						<button type="button"    onclick="popItemDiv('addItem','backItem');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="delMyRowExtend('37706529238246b884d06623606e4320');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			<div class="mod" >
			
			
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
			<!--<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" style=""  >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner37706529238246b884d06623606e4320" >
								<bu:addSub formid="6194088e0d9e4294b0f17214bfdb0a60" formIndex="1"  selfformid="37706529238246b884d06623606e4320" hidecol=""  viewid="" />
							</div>
						</div>-->
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner head2" >
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="领料单号" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="备件SN" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="备件料号" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料名称" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料规格" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="备件数量" />
												</td>
												<td class="datagrid-cell" style="width:135px;">
													<dict:lang value="更换原因" />
												</td>
												<td class="datagrid-cell" style="width:135px;">
													<dict:lang value="备注" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						<div class="datagrid-body datagrid-div3 scroll2"   style="height:225px;" onscroll="ajaxTableScroll(this,'37706529238246b884d06623606e4320')">
							<!--<table class="glxb-table fixedTable" style="width:100%"  id="addTable_37706529238246b884d06623606e4320" >
								<tbody id="tbody_37706529238246b884d06623606e4320" >
								</tbody>
							</table>-->
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
									<tbody id="addItemInfo">
									</tbody>
								</table>
						</div>
					</div>
				</div>
				 <div id="backItem" class="dialog-mask" style="z-index:1029px;" /></div>
    	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:120px;top:68px;width:660px;height:220px;">
    		<div class="dialog-hd">
    			<h3 class="tit">
    			<dict:lang value="选择明细信息" />
    			</h3>
    		</div>
    		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
    		<div class="dialog-bd-div" style="width:100%;height:120%;">
    			<div class="optn optn_div">
    				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
    				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
    			</div>
    
    			<table class="basic-table">
    				<tr>
            			<td  class="name" style="width:68px;"/><bu:uitn colNo="CDF_OUT_TYPE" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec" colNo="CDF_OUT_TYPE" formId="37706529238246b884d06623606e4320" ><bu:ui style="width:230px;" id="CDF_OUT_TYPE" colNo="CDF_OUT_TYPE" formId="37706529238246b884d06623606e4320" value="%{CDF_OUT_TYPE}" formIndex="1" /></bu:td>
            			<td  class="name" style="width:68px;" /><span class="dot">*</span><bu:uitn colNo="CDF_ITEM_SN" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec"  colNo="CDF_ITEM_SN" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_SN" formId="37706529238246b884d06623606e4320" value="%{CDF_ITEM_SN}" formIndex="1" /></bu:td>
            		</tr>
            		<tr>
            			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CDF_ITEM_CODE" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec" colNo="CDF_ITEM_CODE" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_CODE" formId="37706529238246b884d06623606e4320" value="%{CDF_ITEM_CODE}" formIndex="1" />
            			<div id="maskdiv0"></div>
            			</bu:td>
            			
            			
            			<td  class="name" style="width:68px;" /><span class="dot">*</span><bu:uitn colNo="CDF_ITEM_LIST" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec"  colNo="CDF_ITEM_LIST" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_LIST" formId="37706529238246b884d06623606e4320" disabled="disabled" value="%{CDF_ITEM_LIST}" formIndex="1" />
            			<div id="maskdiv1"></div>
            			</bu:td>
            		</tr>
            		<tr>
            			<td  class="name" style="width:68px;"/><bu:uitn colNo="CDF_ITEM_NAME" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td  colNo="CDF_ITEM_NAME" cssClass="dec" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_NAME" formId="37706529238246b884d06623606e4320" disabled="disabled" value="%{CDF_ITEM_NAME}" formIndex="1" /></bu:td>
            		
            			<td class="name" style="width:68px;"/><bu:uitn colNo="CDF_ITEM_SPEC" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td  colNo="CDF_ITEM_SPEC" cssClass="dec" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_SPEC" formId="37706529238246b884d06623606e4320" disabled="disabled" value="%{CDF_ITEM_SPEC}" formIndex="1" /></bu:td>
            		</tr>
            		<tr>
            			<td  class="name" style="width:68px;" /><bu:uitn colNo="CDF_ITEM_NUM" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec"  colNo="CDF_ITEM_NUM" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_NUM" formId="37706529238246b884d06623606e4320" disabled="disabled" value="%{CDF_ITEM_NUM}" formIndex="1" /></bu:td>
            		</tr>
            		<!--<tr>
            			<td  class="name" style="width:68px;"/><bu:uitn colNo="CDF_MEMO" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td  colNo="CDF_MEMO" cssClass="dec" formId="37706529238246b884d06623606e4320"  colspan="3"><bu:ui style="height:80px;width:567px;" id="CDF_MEMO2" colNo="CDF_MEMO" formId="37706529238246b884d06623606e4320" value="%{CDF_MEMO}" formIndex="1" /></bu:td>
            		</tr>-->
    			</table>
    		</div>
    
    	</div>
				
			</div>
		 </div>		
		 				</DIV>
		 				

						</DIV>

	</DIV>
</div>
	</div>								</form>
			</div>
		
	</div>
<bu:script viewId="e038776ba4c444bdbb33c4d32b715380" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<script type="text/javascript">
	$(function(){
	    $("#paraMapObj_CDM_MT_EMP").val($("#curId").val());
	    $("#paraMapObj_CDM_MT_EMP_SHOW").val($("#curUser").val());
	    //$("#paraMapObj_CDM_PLAN_SN").attr("onchange","getDeviceByPlan();");
	});
	//2018/07/10  通过保养计划带出保养项目
	function getDeviceByPlan(){
	    var planSn = $("#paraMapObj_CDM_PLAN_SN").val();
	    var deviceSn = $("#paraMapObj_CD_DEVICE_SN").val();	
        trCount1=0;
	    jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=abbd666f4232458e860503c116683f6d",
 	    	data: {
 	    	    "deviceSn" : deviceSn,
 	    	    "planSn" : planSn
 	    	},
 			success: function(data){
 				var itemList=data.ajaxList;		
                var tempItemClass;
                $("#addDeviceItem_1").empty();
 				for(var i=0;i<itemList.length;i++){				
 				    if(itemList[i].CDII_ITEM_CODE=='null'||itemList[i].CDII_ITEM_CODE==null){
							itemList[i].CDII_ITEM_CODE="";
					}
					if(itemList[i].CDII_ITEM_NAME=='null'||itemList[i].CDII_ITEM_NAME==null){
							itemList[i].CDII_ITEM_NAME="";
					}
					if(itemList[i].CDII_ITEM_UNIT=='null'||itemList[i].CDII_ITEM_UNIT==null){
							itemList[i].CDII_ITEM_UNIT="";
					}
								
					if(itemList[i].CDII_ITEM_MAXVALUE==null||itemList[i].CDII_ITEM_MAXVALUE=='undefined'){
							itemList[i].CDII_ITEM_MAXVALUE="";
					}
					if(itemList[i].CDII_ITEM_MINVALUE==null||itemList[i].CDII_ITEM_MINVALUE=='undefined'){
							itemList[i].CDII_ITEM_MINVALUE="";
					}
					if(itemList[i].CDII_CYCLE==null||itemList[i].CDII_CYCLE=='undefined'){
							itemList[i].CDII_CYCLE="";
					}
					if(itemList[i].CDII_ITEM_CLASS==0){
							tempItemClass="范围值";
					}
					if(itemList[i].CDII_ITEM_CLASS==1){
							tempItemClass="固定值";
					}
					if(itemList[i].CDII_ITEM_CLASS==2){
							tempItemClass="状态值";
					}   
				    trCount1++;
 				    var deviceItemCode1="deviceItemCode1_"+trCount1;
					var deviceItemName1="deviceItemName1_"+trCount1;
					var deviceItemClass1="deviceItemClass1_"+trCount1;
					var deviceitemMaxvalue1="deviceitemMaxvalue1_"+trCount1;
					var deviceitemMinvalue1="deviceitemMinvalue1_"+trCount1;
					var deviceItemUnit1_="deviceItemUnit1_"+trCount1;
									/*	var divN="<div id='hidDiv_"+trCount1+"' style='display: none;'>"+
												""+
												""+
												""+
												""+
												""+
												""+
												""+
												"</div>";
												
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);*/
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+trCount1+"' ></tr>");
									
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode1_"+trCount1+"'>"+itemList[i].CDII_ITEM_CODE+"<input name='"+deviceItemCode1+"' type='hidden' id='"+deviceItemCode1+"' value='"+itemList[i].CDII_ITEM_CODE+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName1_"+trCount1+"'>"+itemList[i].CDII_ITEM_NAME+"<input name='"+deviceItemName1+"' type='hidden' id='"+deviceItemName1+"' value='"+itemList[i].CDII_ITEM_NAME+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:145px;text-align: center;' name='deviceItemClass1_"+trCount1+"'>"+tempItemClass+"<input name='"+deviceItemClass1+"' type='hidden' id='"+deviceItemClass1+"' value='"+itemList[i].CDII_ITEM_CLASS+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:105px;text-align: center;' name='deviceitemMaxvalue1_"+trCount1+"'>"+itemList[i].CDII_ITEM_MAXVALUE+"<input name='"+deviceitemMaxvalue1+"' type='hidden' id='"+deviceitemMaxvalue1+"' value='"+itemList[i].CDII_ITEM_MAXVALUE+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:105px;text-align: center;' name='deviceitemMinvalue1_"+trCount1+"'>"+itemList[i].CDII_ITEM_MINVALUE+"<input name='"+deviceitemMinvalue1+"' type='hidden' id='"+deviceitemMinvalue1+"' value='"+itemList[i].CDII_ITEM_MINVALUE+"'></td>");
										if(itemList[i].CDII_ITEM_CLASS!=2){
										    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:105px;text-align: center;'><input style='width:82px;'  type='text' id='deviceItemReal1_"+trCount1+"' name='deviceItemReal' value=''/></td>");
										}else{
										    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:105px;text-align: center;'><select id='deviceItemReal1_"+trCount1+"' name='deviceItemReal' style='width:100%'><option value='0'>OK</option><option value='-1'>NG</option></select></td>");
										}	
                                        $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:105px;text-align: center;' name='deviceItemUnit1_"+trCount1+"'>"+itemList[i].CDII_ITEM_UNIT+"<input name='"+deviceItemUnit1_+"' type='hidden' id='"+deviceItemUnit1_+"' value='"+itemList[i].CDII_ITEM_UNIT+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:305px;text-align: center;'><input type='text' id='deviceItemContent1_"+trCount1+"' style='width:280px;' name='deviceItemContent1_"+trCount1+"' value=''/><input name='deviceSn' type='hidden' value='"+deviceSn+"'></td>");
					
 				}
 			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
 			},
 			error: function(msg){
        		if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     		    }
 		   }
 		});
 		$('#saveInfo').attr("onclick","editCal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')");
	}
	 $("#CDF_OUT_TYPE").change(function(){
    	    var addType=$(this).val();
    	        $("#paraMapObj_CDF_ITEM_LIST_SHOW").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");    	        
    	        $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	    if(addType==1){
    	        //个体
    	        //$("#CDF_OUT_TYPE").attr("disabled",true);
                $("#maskdiv1").addClass("maskdiv");
                $("#maskdiv0").addClass("maskdiv");
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").attr("disabled",true);
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").css("background-color","#ebebe4");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",false);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	    }else if(addType==2){
    	        //批量
    	        //$("#CDF_OUT_TYPE").attr("disabled",true);
                $("#maskdiv1").removeClass("maskdiv");
                $("#maskdiv0").removeClass("maskdiv");
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").attr("disabled",false);
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").css("background-color","");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",false);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("placeholder","");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");

    	    }else{
                $("#maskdiv0").addClass("maskdiv");
                $("#maskdiv1").addClass("maskdiv");
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").attr("disabled",true);
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").css("background-color","#ebebe4");    	    
    	        $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
    	        //$("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	    }
    	});
    	
        $("#paraMapObj_CDF_ITEM_SN").keydown(function(event){
　　　　			if(event.keyCode == 13){
　　　　　　		var itemSn = $("#paraMapObj_CDF_ITEM_SN").val();
　　　　　　		if(itemSn!=""){
　　　　　　		    var url="${path}buss/bussModel_exeFunc.ms?funcMId=6f6afc2e97124faeb640ae968b37219b";
    			        jQuery.ajax({
    			 			type: "POST",
    			 	   		dataType: "json",
    			 	    	url: url+"&itemSn="+itemSn,
    			 	    	data: "",
    			 			success: function(data){
    			 				var rccList = data.ajaxList;
    			 				var length=rccList.length;
    			 				if(length==0){
    			 				    utilsFp.confirmIcon(3,"","","", "物料未领用,请更换",0,"","");
    			 				    $("#paraMapObj_CDF_ITEM_LIST").val("");
    			 				    $("#paraMapObj_CDF_ITEM_LIST_SHOW").val("");
    			 				    $("#paraMapObj_CDF_ITEM_SN").val("");
                        	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
                        	        $("#paraMapObj_CDF_ITEM_CODE").val("");
                        	        $("#paraMapObj_CDF_ITEM_NAME").val("");
                        	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
	                                $("#paraMapObj_CDF_ITEM_SPEC").val("");
	                                $("#paraMapObj_CDF_ITEM_NUM").val("");
                                    $("#paraMapObj_CDF_ITEM_SN").focus();

    			 				}else{
    			 				    if(rccList[0].DOC_NUM == null) rccList[0].DOC_NUM = "";
        							if(rccList[0].ITEM_CODE == null) rccList[0].ITEM_CODE = "";
        							if(rccList[0].ITEM_NAME == null) rccList[0].ITEM_NAME = "";
        							if(rccList[0].ITEM_SPEC == null) rccList[0].ITEM_SPEC = "";
        							if(rccList[0].ITEM_NUM == null) rccList[0].ITEM_NUM = "";
    			 				    $("#paraMapObj_CDF_ITEM_LIST").val(rccList[0].DOC_NUM);
    			 				    $("#paraMapObj_CDF_ITEM_LIST_SHOW").val(rccList[0].DOC_NUM);
                        	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val(rccList[0].ITEM_CODE);
                        	        $("#paraMapObj_CDF_ITEM_CODE").val(rccList[0].ITEM_CODE);
                        	        $("#paraMapObj_CDF_ITEM_NAME").val(rccList[0].ITEM_NAME);
                        	        $("#paraMapObj_CDF_ITEM_SPEC").val(rccList[0].ITEM_SPEC);
                        	        $("#paraMapObj_CDF_ITEM_NUM").val(rccList[0].ITEM_NUM);
    			 				}
    			 			},
    			 			error: function(XMLHttpRequest, textStatus, errorThrown){
    			 				util.closeLoading();
    			 	  }
    			});
　　　　	}
　　　　}
　　});
	
	function popItemDiv(showId, backId) {
	        console.log("tee");
		    $("#CDF_OUT_TYPE_chosen").css("width","230");				
            $("#paraMapObj_CDF_ITEM_NAME").css("background-color","#EBEBE4");
    	    $("#paraMapObj_CDF_ITEM_SPEC").css("background-color","#EBEBE4");
    	    
    	   // var selectTypeValue = document.getElementById("CDF_OUT_TYPE");
    	   //selectTypeValue.options[0].selected = true;  
    	    $("#CDF_OUT_TYPE").find("option[value='']").attr("selected",true);
 			$("#CDF_OUT_TYPE").trigger("chosen:updated");
    	    
              
    	    $("#paraMapObj_CDF_ITEM_LIST").val("");
	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
	        $("#paraMapObj_CDF_ITEM_CODE").val("");
	        $("#paraMapObj_CDF_ITEM_NAME").val("");
	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
	        $("#paraMapObj_CDF_ITEM_NUM").val("");
	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
	        //$("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
	        $("#paraMapObj_CDF_ITEM_SN").val("");
		    $("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable();
		}
	
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
		
			var trrCount=0;
		function addItemList(showId, backId) {
		    var addType=$("#CDF_OUT_TYPE").val();
		    if(addType=="1"){
		        if($("#paraMapObj_CDF_ITEM_SN").val()==""){
    	            _alertValMsg($("#paraMapObj_CDF_ITEM_SN"), "<dict:lang value="该项不能为空" />");
    	    	    return;
	            }
		    }else if(addType=="2"){
		        if($("#paraMapObj_CDF_ITEM_CODE").val()==""){
    	            _alertValMsg($("#paraMapObj_CDF_ITEM_CODE_SHOW"), "<dict:lang value="该项不能为空" />");
    	    	    return;
                }
		    }
		    if($("#paraMapObj_CDF_ITEM_NUM").val()==""){
    	        _alertValMsg($("#paraMapObj_CDF_ITEM_NUM"), "<dict:lang value="该项不能为空" />");
    	    	return;
    	    }else{
    	        if(!/^\+?[1-9][0-9]*$/.test($("#paraMapObj_CDF_ITEM_NUM").val())) {
    				_alertValMsg($('#paraMapObj_CDF_ITEM_NUM'), "<dict:lang value="该项只能为正整数" />");
    				return;
    			}
    	    }
    	    var docNum=$("#paraMapObj_CDF_ITEM_LIST").val();
    	    var itemSn=$("#paraMapObj_CDF_ITEM_SN").val();
    	    var itemCode=$("#paraMapObj_CDF_ITEM_CODE").val();
    	    var itemName=$("#paraMapObj_CDF_ITEM_NAME").val();
    	    var itemSpec=$("#paraMapObj_CDF_ITEM_SPEC").val();	
    	    var itemNum=$("#paraMapObj_CDF_ITEM_NUM").val();	
    	    if(docNum == null) docNum = "";
    	    if(itemSn == null) itemSn = "";
    	    if(itemCode == null) itemCode = "";
    	    if(itemName == null) itemName = "";
    	    if(itemSpec == null) itemSpec = "";
    	    if(itemNum == null) itemNum = "";
            $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='trId_"+trrCount+"'></tr>");
		    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datgrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;' title='"+docNum+"'>" + docNum + "<input type='hidden'	 name='DOC_NUM' value='" + docNum + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;' title='"+itemSn+"'>" + itemSn + "<input type='hidden' name='ITEM_SN' value='" + itemSn + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;' title='"+itemCode+"'>" + itemCode + "<input type='hidden' name='ITEM_CODE' value='" + itemCode + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;text-align: left;' title='"+itemName+"'>" + itemName + "<input type='hidden' name='ITEM_NAME' value='" + itemName + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: left;' title='"+itemSpec+"'>" + itemSpec + "<input type='hidden' name='ITEM_SPEC' value='" + itemSpec + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:80px;text-align: right;' title='"+itemNum+"'>" + itemNum + "<input type='hidden' name='ITEM_NUM' value='" + itemNum + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:135px;text-align: right;'><input style='width:125px;' class='isSubmit input' name='CHANGE_REASON' value=''/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:135px;'><input style='width:165px;' class='isSubmit input' name='MEMO' value=''/></td>");
											
            var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678');
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
			if(addType==1){
    	        //个体
    	        //$("#CDF_OUT_TYPE").attr("disabled",true);	
                $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",false);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	    }else if(addType==2){
    	        //批量
    	        //$("#CDF_OUT_TYPE").attr("disabled",true);				
                $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",false);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("placeholder","");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
    	    }else{				
                $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
    	        //$("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	    }
    	    trrCount++;
			reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678");
			
			hideDiv(showId, backId);
			
		}
		
		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}	
		
	 function delRow() {
		    var flag=false;
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 :checkbox").each(function() {
				if($(this).attr("checked")) {
					$(this).parent().parent().remove();

					flag=true;
				}
			});
			if(flag==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加备件信息" />", 0, "260", "");
				return;
			}
			reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678");
			var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678');
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
		}
		//重新排序
		function reSort(objid) {

			var i = 1;
			$("#" + objid + " tbody tr").each(function() {

				$(this).find("td").eq(0).text(i);

				i++;
			});
		}
		//全选
		function getAllItem() {
			if($("#allSelects").attr("checked") == "checked") {
				$("#addItemInfo :checkbox").attr("checked", true);
			} else {
				$("#addItemInfo :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}	
		
		var trCount1 = 0;
	var trCount2 = 0;
	var trCount3 = 0;
	var trCount4 = 0;
	var url = "buss/bussModel_exeFunc.ms?funcMId=a0e6771d04584df7964effb7e5c1d975";
		function init(){
                $("#maskdiv1").addClass("maskdiv");
                $("#maskdiv0").addClass("maskdiv");
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").attr("disabled",true);
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").css("background-color","#ebebe4");    		
		/*$("#paraMapObj_CD_USE_DEP_SHOW_BUTTON").hide();
		$("#paraMapObj_CD_CHARGE_MAN_SHOW_BUTTON").hide();*/
		var deviceSn = $("#paraMapObj_CD_DEVICE_SN").val();
		var tempItemClass;
		$.ajax({
						url:url,
						type:"post",
						data:{"deviceSn":deviceSn},
						success:function(data){
							var itemList=data.ajaxList;
							if(itemList!=""){
								for(var i=0;i<itemList.length;i++){
									if(itemList[i].CDII_ITEM_CODE=='null'||itemList[i].CDII_ITEM_CODE==null){
										itemList[i].CDII_ITEM_CODE="";
									}
									if(itemList[i].CDII_ITEM_NAME=='null'||itemList[i].CDII_ITEM_NAME==null){
										itemList[i].CDII_ITEM_NAME="";
									}
									if(itemList[i].CDII_ITEM_UNIT=='null'||itemList[i].CDII_ITEM_UNIT==null){
										itemList[i].CDII_ITEM_UNIT="";
									}
								
									if(itemList[i].CDII_ITEM_MAXVALUE==null||itemList[i].CDII_ITEM_MAXVALUE=='undefined'){
										itemList[i].CDII_ITEM_MAXVALUE="";
									}
									if(itemList[i].CDII_ITEM_MINVALUE==null||itemList[i].CDII_ITEM_MINVALUE=='undefined'){
										itemList[i].CDII_ITEM_MINVALUE="";
									}
									if(itemList[i].CDII_CYCLE==null||itemList[i].CDII_CYCLE=='undefined'){
										itemList[i].CDII_CYCLE="";
									}
									if(itemList[i].CDII_ITEM_CLASS==0){
										tempItemClass="范围值";
									}
									if(itemList[i].CDII_ITEM_CLASS==1){
										tempItemClass="固定值";
									}
									if(itemList[i].CDII_ITEM_CLASS==2){
										tempItemClass="状态值";
									}
									if(itemList[i].CDII_ITEM_TYPE=="保养项目"){
										trCount1++;
										var deviceItemCode1="deviceItemCode1_"+trCount1;
										var deviceItemName1="deviceItemName1_"+trCount1;
										var deviceItemClass1="deviceItemClass1_"+trCount1;
										var deviceitemMaxvalue1="deviceitemMaxvalue1_"+trCount1;
										var deviceitemMinvalue1="deviceitemMinvalue1_"+trCount1;
										var deviceItemUnit1_="deviceItemUnit1_"+trCount1;
									/*	var divN="<div id='hidDiv_"+trCount1+"' style='display: none;'>"+
												"<input name='"+deviceItemCode1+"' type='hidden' id='"+deviceItemCode1+"' value='"+itemList[i].CDII_ITEM_CODE+"'>"+
												"<input name='"+deviceItemName1+"' type='hidden' id='"+deviceItemName1+"' value='"+itemList[i].CDII_ITEM_NAME+"'>"+
												"<input name='"+deviceItemClass1+"' type='hidden' id='"+deviceItemClass1+"' value='"+itemList[i].CDII_ITEM_CLASS+"'>"+
												"<input name='"+deviceitemMaxvalue1+"' type='hidden' id='"+deviceitemMaxvalue1+"' value='"+itemList[i].CDII_ITEM_MAXVALUE+"'>"+
												"<input name='"+deviceitemMinvalue1+"' type='hidden' id='"+deviceitemMinvalue1+"' value='"+itemList[i].CDII_ITEM_MINVALUE+"'>"+
												"<input name='"+deviceItemUnit1_+"' type='hidden' id='"+deviceItemUnit1_+"' value='"+itemList[i].CDII_ITEM_UNIT+"'>"+
												"<input name='deviceSn' type='hidden' value='"+deviceSn+"'>"+
												"</div>";
												
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);*/
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+trCount1+"' ></tr>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align:center;' >"+trCount1+"</td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:110px;text-align: center;' name='deviceItemCode1_"+trCount1+"'>"+itemList[i].CDII_ITEM_CODE+"<input name='"+deviceItemCode1+"' type='hidden' id='"+deviceItemCode1+"' value='"+itemList[i].CDII_ITEM_CODE+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:110px;text-align: center;' name='deviceItemName1_"+trCount1+"'>"+itemList[i].CDII_ITEM_NAME+"<input name='"+deviceItemName1+"' type='hidden' id='"+deviceItemName1+"' value='"+itemList[i].CDII_ITEM_NAME+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:145px;text-align: center;' name='deviceItemClass1_"+trCount1+"'>"+tempItemClass+"<input name='"+deviceItemClass1+"' type='hidden' id='"+deviceItemClass1+"' value='"+itemList[i].CDII_ITEM_CLASS+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:105px;text-align: center;' name='deviceitemMaxvalue1_"+trCount1+"'>"+itemList[i].CDII_ITEM_MAXVALUE+"<input name='"+deviceitemMaxvalue1+"' type='hidden' id='"+deviceitemMaxvalue1+"' value='"+itemList[i].CDII_ITEM_MAXVALUE+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:105px;text-align: center;' name='deviceitemMinvalue1_"+trCount1+"'>"+itemList[i].CDII_ITEM_MINVALUE+"<input name='"+deviceitemMinvalue1+"' type='hidden' id='"+deviceitemMinvalue1+"' value='"+itemList[i].CDII_ITEM_MINVALUE+"'></td>");
										if(itemList[i].CDII_ITEM_CLASS!=2){
										    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:105px;text-align: center;'><input type='text' style='width:82px;' id='deviceItemReal1_"+trCount1+"' name='deviceItemReal' value=''/></td>");
										}else{
										    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:105px;text-align: center;'><select id='deviceItemReal1_"+trCount1+"' name='deviceItemReal' style='width:100%'><option value='0'>OK</option><option value='-1'>NG</option></select></td>");
										}	
                                        $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:105px;text-align: center;' name='deviceItemUnit1_"+trCount1+"'>"+itemList[i].CDII_ITEM_UNIT+"<input name='"+deviceItemUnit1_+"' type='hidden' id='"+deviceItemUnit1_+"' value='"+itemList[i].CDII_ITEM_UNIT+"'></td>");
										$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:305px;text-align: center;'><input type='text' style='width:280px;' id='deviceItemContent1_"+trCount1+"' name='deviceItemContent1_"+trCount1+"' value=''/><input name='deviceSn' type='hidden' value='"+deviceSn+"'></td>");
									}
									
								}
								
							$('#saveInfo').attr("onclick","editCal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')");
							
							}
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
		$('#saveInfo').attr("onclick","editCal('"+trCount1+"','"+trCount2+"','"+trCount3+"','"+trCount4+"')");
		
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
		}
		
	
	//校验函数
	function checkContent(){
		var tempContent = $("#CDM_MT_CONTENT").val();
		var tempId = document.getElementById("CDM_MT_CONTENT");
		if(tempContent==""){
			var tempFlag = checkIsNull(tempId);
			return tempFlag;
		}else
		return "1";
	}
	function checkVal1(trCount1){
		var tempVal;
		var tempId;
		var tempFlag;
		for(var i=1;i<=trCount1;i++){
			tempVal = $("#deviceItemReal1_"+i).val();
			tempId = document.getElementById("deviceItemReal1_"+i);
			//alert($(tempId).closest("div"));
			//console.log(tempId);
			if(tempVal==null) continue;
			if(tempVal!=""){
				tempFlag = checkNum(tempVal,tempId);
			}else{
				tempFlag = checkIsNull(tempId);
			}
			if(tempFlag=="0") {switchTag('tag1','content1',''); break;}
		}
		     return tempFlag;
	}
	
	function checkNum(tempVal,tempId){
		if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test( tempVal ) || tempVal < 0){
			    _alertValMsg(tempId,"<dict:lang value="该项只能为正数" />");
			    return "0";  
		}else 
		return "1"; 
	}
	
	function checkIsNull(tempId){
		_alertValMsg(tempId,"<dict:lang value="该项不能为空" />");
		return "0";  
	}
	
	var tempNum = 0;
	function addCount(){
		tempNum++;
		//alert(tempNum);
		$("#selCount").val(tempNum);
	}
	
	function delCount(obj){
		
		//console.log(obj);
		_delRowExtendConfirm(obj);
		tempNum--;
		$("#selCount").val(tempNum);
	}
	
	function delMyRowExtend(tableId,subformids){
		if($("input[name='checkbox"+tableId+"']:checked").length==0){
		     utilsFp.confirmIcon(3,"","","", "请至少选择一条记录","","260","145");
		     return;
		  }
		  var obj = {};
		  obj.tableId = tableId;
		  obj.subformids = subformids;
		 // utilsFp.confirmIcon(1,"","delCount",obj, "确认删除?","1","250","145");
		 
	}
		function editCal(trCount1,trCount2,trCount3,trCount4){
                        if($("#paraMapObj_CDM_MT_LONG").val()<=0){
                         //  _alertValMsg(document.getElementById("paraMapObj_CDM_MT_LONG"),"%{getText("请输入大于0的数")}");
                           _alertValMsg(document.getElementById("paraMapObj_CDM_MT_LONG"),"<dict:lang value="请输入大于0的数" />");
                           return ;
                        }
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
                    var tempFlag = checkContent();
                    if(tempFlag=="0"){
                         return ;
                    }
                    /*var tempFlag1 = checkVal1(trCount1);
                    if(tempFlag1=="0"){
                         return ;
                    }*/
                    var teF = 0;
                    $("input[name='deviceItemReal']").each(function(){
                        if($.trim($(this).val())==""){				
                            switchTag('tag1','content1','');
                            utilsFp.confirmIcon(3,"","","", "<dict:lang value="实际值不能为空" />","","260","145");
                            teF = 1;
		                    return false;
                        }else if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test( $(this).val() ) || $(this).val() < 0){
                            switchTag('tag1','content1','');
                            utilsFp.confirmIcon(3,"","","", "<dict:lang value="实际值必须为正数" />","","260","145");
                            teF = 1;
		                    return false;
                        }
                    });
                    if(teF==1){
                        return;
                    }
          setHid();
           document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=30919b68187b4482b9f5e8a84c5d44a1"+"&trCount1="+trCount1+"&trCount2="+trCount2+"&trCount3="+trCount3+"&trCount4="+trCount4;
        
document.forms.editForm.submit();
}

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>


