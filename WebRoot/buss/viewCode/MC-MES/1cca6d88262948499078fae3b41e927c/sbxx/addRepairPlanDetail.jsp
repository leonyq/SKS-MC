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
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
<style type="text/css">
.input {
	width:200px !important;
}
</style>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <!--<div style="margin-left:40px;">
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
               </div>-->
			    	<div class="optn">
			    	        <button type="button" onclick="addParentVal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeCurrentWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
			    </div>

			</div>
			<div class="bd" style="height:500px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9db6d3637a2a49828bce2b8e1408fdb7" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" id ="curUser" name="curUser" value="<s:property value='%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}'/>"/>
	<input type="hidden" id ="curUserId" name="curUserId" value="<s:property value='%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].id}'/>"/>
	<input type="hidden" name="formIds" value="9db6d3637a2a49828bce2b8e1408fdb7" />
	<input type="hidden" name="9db6d3637a2a49828bce2b8e1408fdb7" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	
		<s:set name="_$viewId" value="'68a641b0e5304c0787e041feec9a015d'" />
		<s:set name="_$formId_1" value="'9db6d3637a2a49828bce2b8e1408fdb7'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CDPD_CYCLE" formId="9db6d3637a2a49828bce2b8e1408fdb7" /></td>
			<bu:td cssClass="dec" colNo="CDPD_CYCLE" formId="9db6d3637a2a49828bce2b8e1408fdb7" ><bu:ui colNo="CDPD_CYCLE" formId="9db6d3637a2a49828bce2b8e1408fdb7" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDP_PLAN_SN" formId="9db6d3637a2a49828bce2b8e1408fdb7" /></td>
			<bu:td cssClass="dec" colNo="CDP_PLAN_SN" formId="9db6d3637a2a49828bce2b8e1408fdb7" ><bu:ui colNo="CDP_PLAN_SN" formId="9db6d3637a2a49828bce2b8e1408fdb7" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDPD_PLAN_NAME" formId="9db6d3637a2a49828bce2b8e1408fdb7" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CDPD_PLAN_NAME" formId="9db6d3637a2a49828bce2b8e1408fdb7" ><bu:ui colNo="CDPD_PLAN_NAME" formId="9db6d3637a2a49828bce2b8e1408fdb7" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDPD_HALF_YEAR" formId="9db6d3637a2a49828bce2b8e1408fdb7" /></td>
			<bu:td cssClass="dec" colNo="CDPD_HALF_YEAR" formId="9db6d3637a2a49828bce2b8e1408fdb7" ><bu:ui colNo="CDPD_HALF_YEAR" formId="9db6d3637a2a49828bce2b8e1408fdb7" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CDPD_QUARTER" formId="9db6d3637a2a49828bce2b8e1408fdb7" /></td>
			<bu:td cssClass="dec" colNo="CDPD_QUARTER" formId="9db6d3637a2a49828bce2b8e1408fdb7" ><bu:ui colNo="CDPD_QUARTER" formId="9db6d3637a2a49828bce2b8e1408fdb7" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDPD_MONTH" formId="9db6d3637a2a49828bce2b8e1408fdb7" /></td>
			<bu:td cssClass="dec" colNo="CDPD_MONTH" formId="9db6d3637a2a49828bce2b8e1408fdb7" ><bu:ui colNo="CDPD_MONTH" formId="9db6d3637a2a49828bce2b8e1408fdb7" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDPD_MEMO" formId="9db6d3637a2a49828bce2b8e1408fdb7" /></td>
			<bu:td cssClass="dec" colNo="CDPD_MEMO" formId="9db6d3637a2a49828bce2b8e1408fdb7" style="height:80px;" colspan="5"><bu:ui colNo="CDPD_MEMO" style="width: 100%;height: 100%;" formId="9db6d3637a2a49828bce2b8e1408fdb7" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="详细信息" /></h3>	
        </div>
        	<div class="mod" >
        		<div id="myDiv" style="height:50px;border:1px solid #ccc;margin-top: 15px;">
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:30px;display:inline-block">周：</lable></div>
        			<div style="float: left;margin-left: 9px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect1" value="1"/>&nbsp;星期一</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect1" value="2"/>&nbsp;星期二</span></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect1" value="3"/>&nbsp;星期三</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect1" value="4"/>&nbsp;星期四</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect1" value="5"/>&nbsp;星期五</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect1" value="6"/>&nbsp;星期六</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect1" value="7"/>&nbsp;星期天</lable></div>
			</div>
			<div id="myDiv1" style="height:140px;border:1px solid #ccc;margin-top: 10px;">
				<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:30px;display:inline-block">月：</lable></div>
        			<div style="float: left;margin-left: 9px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="1"/>&nbsp;1</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="2"/>&nbsp;2</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="3"/>&nbsp;3</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="4"/>&nbsp;4</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="5"/>&nbsp;5</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="6"/>&nbsp;6</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="7"/>&nbsp;7</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="8"/>&nbsp;8</lable></div>
        			<div style="float: left;margin-left: 58px;margin-top: 10px;"><lable style="width:68px;display:block"><input type="checkbox" id="" name="allSelect" value="9"/>&nbsp;9</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="10"/>&nbsp;10</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="11"/>&nbsp;11</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="12"/>&nbsp;12</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="13"/>&nbsp;13</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="14"/>&nbsp;14</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="15"/>&nbsp;15</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="16"/>&nbsp;16</lable></div>
        			<div style="float: left;margin-left: 58px;margin-top: 10px;"><lable style="width:68px;display:block"><input type="checkbox" id="" name="allSelect" value="17"/>&nbsp;17</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="18"/>&nbsp;18</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="19"/>&nbsp;19</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="20"/>&nbsp;20</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="21"/>&nbsp;21</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="22"/>&nbsp;22</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="23"/>&nbsp;23</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="24"/>&nbsp;24</lable></div>
        			<div style="float: left;margin-left: 58px;margin-top: 10px;"><lable style="width:68px;display:block"><input type="checkbox" id="" name="allSelect" value="25"/>&nbsp;25</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="26"/>&nbsp;26</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="27"/>&nbsp;27</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="28"/>&nbsp;28</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="29"/>&nbsp;29</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="30"/>&nbsp;30</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="31"/>&nbsp;31</lable></div>
        			<div style="float: left;margin-left: 19px;margin-top: 10px;"><lable style="width:75px;display:inline-block"><input type="checkbox" id="" name="allSelect" value="0"/>&nbsp;最后一天</lable></div>
			</div>
		</div>	
        </div>
			<bu:jsVal formId="9db6d3637a2a49828bce2b8e1408fdb7" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	var parentWindow;
	var trCount = '${param.trCount}';
	$(function(){
	parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
	//如果明细数据已增加则禁用复选框
		for(var i=1;i<=trCount;i++){  //周复选框
			$('input[name="allSelect1"]:checkbox').each(function () { 
				if ($(this).val()==parentWindow.$("#CDPD_WEEK_"+i).val()) { 
					$(this).attr("disabled","disabled");
				} 
			});
		}
		
	    /*
		$("#paraMapObj_CDPD_CYCLE").val('${param.cdpType}');
		$("#paraMapObj_CDP_PLAN_SN").val('${param.planSn}');
		$("#paraMapObj_CDPD_PLAN_NAME").val('${param.planName}');
		$("#paraMapObj_CDPD_MEMO").val('${param.memo}');
		
		$("#paraMapObj_CDPD_CYCLE").val('<s:property value="#parameters.cdpType"/>');
		$("#paraMapObj_CDP_PLAN_SN").val('<s:property value="#parameters.planSn"/>');
		$("#paraMapObj_CDPD_PLAN_NAME").val('<s:property value="#parameters.planName"/>');
		$("#paraMapObj_CDPD_MEMO").val('<s:property value="#parameters.memo"/>');
		*/
		$("#paraMapObj_CDPD_CYCLE").val('<c:out value="${param.cdpType}"/>');
		$("#paraMapObj_CDP_PLAN_SN").val('<c:out value="${param.planSn}"/>');
		$("#paraMapObj_CDPD_PLAN_NAME").val('<c:out value="${param.planName}"/>');
		$("#paraMapObj_CDPD_MEMO").val('<c:out value="${param.memo}"/>');
		var cdpType = '<c:out value="${param.cdpType}"/>';
		//var cdpTypes= '${param.cdpType}';
	
		//如果保养周期为周
		if(cdpType==1){
			$("#myDiv1").attr("style","display:none;");
			$("#paraMapObj_CDPD_HALF_YEAR").attr("disabled","disabled");
			$("#paraMapObj_CDPD_QUARTER").attr("disabled","disabled");
			$("#paraMapObj_CDPD_MONTH").attr("disabled","disabled");
		}
		//如果保养周期为月
		if(cdpType==2){
		var cdpdDate;
		
		for(var i=1;i<=trCount;i++){  //日复选框
		        if(parentWindow.$("#CDPD_DATE_"+i).val()=="最后一天") cdpdDate=0;
		        else cdpdDate=parentWindow.$("#CDPD_DATE_"+i).val();
			$('input[name="allSelect"]:checkbox').each(function () { 
				if ($(this).val()==cdpdDate) { 
					$(this).attr("disabled","disabled");
				} 
			});
		}
			$("#myDiv").attr("style","display:none;");
			$("#paraMapObj_CDPD_HALF_YEAR").attr("disabled","disabled");
			$("#paraMapObj_CDPD_QUARTER").attr("disabled","disabled");
			$("#paraMapObj_CDPD_MONTH").attr("disabled","disabled");
		}
		//如果保养周期为季度
		if(cdpType==3){
			$("#myDiv").attr("style","display:none;");
			$("#paraMapObj_CDPD_HALF_YEAR").attr("disabled","disabled");
			$("#paraMapObj_CDPD_QUARTER").attr("onchange","getMonth()");
			$("#paraMapObj_CDPD_MONTH").attr("onchange","disCheck()");
		}
		//如果保养周期为半年
		if(cdpType==4){
			$("#myDiv").attr("style","display:none;");
			$("#paraMapObj_CDPD_QUARTER").attr("disabled","disabled");
			$("#paraMapObj_CDPD_HALF_YEAR").attr("onchange","getMonthByYear()");
			$("#paraMapObj_CDPD_MONTH").attr("onchange","disCheck()");
		}
		//如果保养周期为全年
		if(cdpType==5){
			$("#myDiv").attr("style","display:none;");
			$("#paraMapObj_CDPD_QUARTER").attr("disabled","disabled");
			$("#paraMapObj_CDPD_HALF_YEAR").attr("disabled","disabled");
			$("#paraMapObj_CDPD_MONTH").attr("onchange","disCheck()");
		}
	})
	
	//去除复选框的禁用
	function delCheckDis(){
		$('input[name="allSelect"]:checkbox').each(function () { 
				if ($(this).attr("disabled")) { 
					$(this).removeAttr("disabled");
				} 
		});
	}
	//根据月份禁用日复选框
	function addCheckDis(){
		var mon = $("#paraMapObj_CDPD_MONTH").val();
		var cdpdDate;
		for(var i=1;i<=trCount;i++){  //日复选框
		if(parentWindow.$("#CDPD_DATE_"+i).val()=="最后一天") cdpdDate=0;
		else cdpdDate=parentWindow.$("#CDPD_DATE_"+i).val();
			$('input[name="allSelect"]:checkbox').each(function () { 
				if ($(this).val()==cdpdDate&&mon==parentWindow.$("#CDPD_MONTH_"+i).val()) { 
					$(this).attr("disabled","disabled");
				} 
			});
		}
	}
	//根据选择的月份判断是否禁用复选框
	function disCheck(){
		delCheckDis();
		addCheckDis();
	}
	
	//根据选择的季度设置对应的月份
	function getMonth(){
		var quarter = $("#paraMapObj_CDPD_QUARTER").val();
		if(quarter==1){    //第一季度
			$("#paraMapObj_CDPD_MONTH").empty();
			$("#paraMapObj_CDPD_MONTH").append("<option value=''><dict:lang value="--请选择--" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='1'><dict:lang value="1月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='2'><dict:lang value="2月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='3'><dict:lang value="3月" /></option>");
 			$("#paraMapObj_CDPD_MONTH").trigger("chosen:updated");
		}
		if(quarter==2){    //第二季度
			$("#paraMapObj_CDPD_MONTH").empty();
			$("#paraMapObj_CDPD_MONTH").append("<option value=''><dict:lang value="--请选择--" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='4'><dict:lang value="4月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='5'><dict:lang value="5月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='6'><dict:lang value="6月" /></option>");
 			$("#paraMapObj_CDPD_MONTH").trigger("chosen:updated");
		}
		if(quarter==3){    //第三季度
			$("#paraMapObj_CDPD_MONTH").empty();
			$("#paraMapObj_CDPD_MONTH").append("<option value=''><dict:lang value="--请选择--" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='7'><dict:lang value="7月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='8'><dict:lang value="8月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='9'><dict:lang value="9月" /></option>");
 			$("#paraMapObj_CDPD_MONTH").trigger("chosen:updated");
		}
		if(quarter==4){    //第四季度
			$("#paraMapObj_CDPD_MONTH").empty();
			$("#paraMapObj_CDPD_MONTH").append("<option value=''><dict:lang value="--请选择--" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='10'><dict:lang value="10月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='11'><dict:lang value="11月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='12'><dict:lang value="12月" /></option>");
 			$("#paraMapObj_CDPD_MONTH").trigger("chosen:updated");
		}
		if(quarter==""){    //没有选择
			$("#paraMapObj_CDPD_MONTH").empty();
			$("#paraMapObj_CDPD_MONTH").append("<option value=''><dict:lang value="--请选择--" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='1'><dict:lang value="1月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='2'><dict:lang value="2月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='3'><dict:lang value="3月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='4'><dict:lang value="4月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='5'><dict:lang value="5月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='6'><dict:lang value="6月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='7'><dict:lang value="7月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='8'><dict:lang value="8月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='9'><dict:lang value="9月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='10'><dict:lang value="10月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='11'><dict:lang value="11月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='12'><dict:lang value="12月" /></option>");
 			$("#paraMapObj_CDPD_MONTH").trigger("chosen:updated");
		}
		
	}
	//根据选择的半年设置月份
	function getMonthByYear(){
		var harfYear = $("#paraMapObj_CDPD_HALF_YEAR").val();
		if(harfYear==1){  //上半年
			$("#paraMapObj_CDPD_MONTH").empty();
			$("#paraMapObj_CDPD_MONTH").append("<option value=''><dict:lang value="--请选择--" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='1'><dict:lang value="1月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='2'><dict:lang value="2月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='3'><dict:lang value="3月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='4'><dict:lang value="4月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='5'><dict:lang value="5月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='6'><dict:lang value="6月" /></option>");
			$("#paraMapObj_CDPD_MONTH").trigger("chosen:updated");
		}
		if(harfYear==2){  //下半年
			$("#paraMapObj_CDPD_MONTH").empty();
			$("#paraMapObj_CDPD_MONTH").append("<option value=''><dict:lang value="--请选择--" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='7'><dict:lang value="7月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='8'><dict:lang value="8月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='9'><dict:lang value="9月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='10'><dict:lang value="10月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='11'><dict:lang value="11月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='12'><dict:lang value="12月" /></option>");
 			$("#paraMapObj_CDPD_MONTH").trigger("chosen:updated");
		}
		if(harfYear==""){    //没有选择
			$("#paraMapObj_CDPD_MONTH").empty();
			$("#paraMapObj_CDPD_MONTH").append("<option value=''><dict:lang value="--请选择--" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='1'><dict:lang value="1月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='2'><dict:lang value="2月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='3'><dict:lang value="3月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='4'><dict:lang value="4月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='5'><dict:lang value="5月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='6'><dict:lang value="6月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='7'><dict:lang value="7月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='8'><dict:lang value="8月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='9'><dict:lang value="9月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='10'><dict:lang value="10月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='11'><dict:lang value="11月" /></option>");
			$("#paraMapObj_CDPD_MONTH").append("<option value='12'><dict:lang value="12月" /></option>");
 			$("#paraMapObj_CDPD_MONTH").trigger("chosen:updated");
		}
	}
	
	 function timeString(){
    		var datetime = new Date();
    		datetime.setDate(datetime.getDate());
    		var year = datetime.getFullYear();
    		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    		var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
    		var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    		var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    		return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
    	}
	
	
	//回填数据
	function addParentVal(){
	   
		var cdpType ='<c:out value="${param.cdpType}"/>';
		
		var tempType;
		//如果保养周期为周
		if(cdpType==1){
			var falg = 0; 
			$('input[name="allSelect1"]:checkbox').each(function () { 
				if ($(this).attr("checked")) { 
					falg =1; 
					return false;
				} 
			});
			if(falg==1){
			$('input[name="allSelect1"]:checked').each(function(){//遍历每一个名字为allSelect1的复选框，其中选中的执行函数    
            			//chk_value.push($(this).val());//将选中的值添加到数组chk_value中    
            			trCount++;
            			var tempDiv="<div id='hidDiv_"+trCount+"' style='display:none;'>"+
					"<input name='CDPD_CYCLE_"+trCount+"' type='hidden' id='CDPD_CYCLE_"+trCount+"' value='1'>"+
					"<input name='CDPD_HALF_YEAR_"+trCount+"' type='hidden' id='CDPD_HALF_YEAR_"+trCount+"' value=''>"+
					"<input name='CDPD_QUARTER_"+trCount+"' type='hidden' id='CDPD_QUARTER_"+trCount+"' value=''>"+
					"<input name='CDPD_MONTH_"+trCount+"' type='hidden' id='CDPD_MONTH_"+trCount+"' value=''>"+
					"<input name='CDPD_DATE_"+trCount+"' type='hidden' id='CDPD_DATE_"+trCount+"' value=''>"+
					"<input name='CDPD_WEEK_"+trCount+"' type='hidden' id='CDPD_WEEK_"+trCount+"' value='"+$(this).val()+"'>"+
					"<input name='CDPD_CREATE_DATE_"+trCount+"' type='hidden' id='CDPD_CREATE_DATE_"+trCount+"' value='"+timeString()+"'>"+
					"<input name='CDPD_CREATE_MAN_"+trCount+"' type='hidden' id='CDPD_CREATE_MAN_"+trCount+"' value='"+$("#curUserId").val()+"'>"+
					"</div>";
				parentWindow.$("#addPlanDetail").append(tempDiv);
				parentWindow.$("#addTrCount").val(trCount);
				var tempHtml = "<tr id='tr_"+trCount+"'>"+
				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;' name='planDetail_"+trCount+"'>"+(parentWindow.$("#addPlanDetail tr").length+1)+"</td>"+
				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;' name='planDetail_"+trCount+"'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>"+
				"<td class='datagrid-cell datagrid-cell-3' style='width:95px;text-align: center;' >周</td>"+
				"<td class='datagrid-cell datagrid-cell-4' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-5' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-6' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-7' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-8' style='width:95px;text-align: center;' >"+$(this).val()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-9' style='width:135px;text-align: center;' >"+timeString()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-10' style='width:135px;text-align: center;' >"+$("#curUser").val()+"</td>";
				parentWindow.$("#addPlanDetail").append(tempHtml);
				
            		});
            		}else{
            		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一天" />",0,"260","");
            		return;
            		}
		}
		//如果保养周期为月
		if(cdpType==2){
			var falg = 0; 
			$('input[name="allSelect"]:checkbox').each(function () { 
				if ($(this).attr("checked")) { 
					falg =1; 
					return false;
				} 
			});
			if(falg==1){
			$('input[name="allSelect"]:checked').each(function(){//遍历每一个名字为allSelect的复选框，其中选中的执行函数    
            			//chk_value.push($(this).val());//将选中的值添加到数组chk_value中    
            			trCount++;
            			var tempDiv="<div id='hidDiv_"+trCount+"' style='display:none;'>"+
					"<input name='CDPD_CYCLE_"+trCount+"' type='hidden' id='CDPD_CYCLE_"+trCount+"' value='2'>"+
					"<input name='CDPD_HALF_YEAR_"+trCount+"' type='hidden' id='CDPD_HALF_YEAR_"+trCount+"' value=''>"+
					"<input name='CDPD_QUARTER_"+trCount+"' type='hidden' id='CDPD_QUARTER_"+trCount+"' value=''>"+
					"<input name='CDPD_MONTH_"+trCount+"' type='hidden' id='CDPD_MONTH_"+trCount+"' value=''>"+
					"<input name='CDPD_DATE_"+trCount+"' type='hidden' id='CDPD_DATE_"+trCount+"' value='"+$(this).val()+"'>"+
					"<input name='CDPD_WEEK_"+trCount+"' type='hidden' id='CDPD_WEEK_"+trCount+"' value=''>"+
					"<input name='CDPD_CREATE_DATE_"+trCount+"' type='hidden' id='CDPD_CREATE_DATE_"+trCount+"' value='"+timeString()+"'>"+
					"<input name='CDPD_CREATE_MAN_"+trCount+"' type='hidden' id='CDPD_CREATE_MAN_"+trCount+"' value='"+$("#curUserId").val()+"'>"+
					"</div>";
				parentWindow.$("#addPlanDetail").append(tempDiv);
				parentWindow.$("#addTrCount").val(trCount);
				var tempDa;
				if($(this).val()==0)  tempDa="最后一天";
				else tempDa=$(this).val();
				var tempHtml = "<tr id='tr_"+trCount+"'>"+
				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;' name='planDetail_"+trCount+"'>"+(parentWindow.$("#addPlanDetail tr").length+1)+"</td>"+
				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;' name='planDetail_"+trCount+"'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>"+
				"<td class='datagrid-cell datagrid-cell-3' style='width:95px;text-align: center;' >月</td>"+
				"<td class='datagrid-cell datagrid-cell-4' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-5' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-6' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-7' style='width:95px;text-align: center;' >"+tempDa+"</td>"+
				"<td class='datagrid-cell datagrid-cell-8' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-9' style='width:135px;text-align: center;' >"+timeString()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-10' style='width:135px;text-align: center;' >"+$("#curUser").val()+"</td>";
				parentWindow.$("#addPlanDetail").append(tempHtml);
				
            		});
            		}else{
            		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一天" />",0,"260","");
            		return;
            		}
		}
		//如果保养周期为季度
		if(cdpType==3){
			$("#paraMapObj_CDPD_QUARTER").attr("class","_VAL_NULL isSubmit input dept_select");
			$("#paraMapObj_CDPD_MONTH").attr("class","_VAL_NULL isSubmit input dept_select");
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			var tempQuarter = $("#paraMapObj_CDPD_QUARTER").val();
			if(tempQuarter==1){
				tempQuarter = "第一季度";
			}else if(tempQuarter==2){
				tempQuarter = "第二季度";
			}else if(tempQuarter==3){
				tempQuarter = "第三季度";
			}else if(tempQuarter==4){
				tempQuarter = "第四季度";
			}
			if(tempYear==1){
				tempYear = "上半年";
			}else   tempYear = "下半年";
			var falg = 0; 
			$('input[name="allSelect"]:checkbox').each(function () { 
				if ($(this).attr("checked")) { 
					falg =1; 
					return false;
				} 
			});
			if(falg==1){
			$('input[name="allSelect"]:checked').each(function(){//遍历每一个名字为allSelect的复选框，其中选中的执行函数    
            			//chk_value.push($(this).val());//将选中的值添加到数组chk_value中    
            			trCount++;
            			var tempDiv="<div id='hidDiv_"+trCount+"' style='display:none;'>"+
					"<input name='CDPD_CYCLE_"+trCount+"' type='hidden' id='CDPD_CYCLE_"+trCount+"' value='3'>"+
					"<input name='CDPD_HALF_YEAR_"+trCount+"' type='hidden' id='CDPD_HALF_YEAR_"+trCount+"' value=''>"+
					"<input name='CDPD_QUARTER_"+trCount+"' type='hidden' id='CDPD_QUARTER_"+trCount+"' value='"+$("#paraMapObj_CDPD_QUARTER").val()+"'>"+
					"<input name='CDPD_MONTH_"+trCount+"' type='hidden' id='CDPD_MONTH_"+trCount+"' value='"+$("#paraMapObj_CDPD_MONTH").val()+"'>"+
					"<input name='CDPD_DATE_"+trCount+"' type='hidden' id='CDPD_DATE_"+trCount+"' value='"+$(this).val()+"'>"+
					"<input name='CDPD_WEEK_"+trCount+"' type='hidden' id='CDPD_WEEK_"+trCount+"' value=''>"+
					"<input name='CDPD_CREATE_DATE_"+trCount+"' type='hidden' id='CDPD_CREATE_DATE_"+trCount+"' value='"+timeString()+"'>"+
					"<input name='CDPD_CREATE_MAN_"+trCount+"' type='hidden' id='CDPD_CREATE_MAN_"+trCount+"' value='"+$("#curUserId").val()+"'>"+
					"</div>";
				parentWindow.$("#addPlanDetail").append(tempDiv);
				parentWindow.$("#addTrCount").val(trCount);
				var tempDa;
				if($(this).val()==0)  tempDa="最后一天";
				else tempDa=$(this).val();
				var tempHtml = "<tr id='tr_"+trCount+"'>"+
				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;' name='planDetail_"+trCount+"'>"+(parentWindow.$("#addPlanDetail tr").length+1)+"</td>"+
				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;' name='planDetail_"+trCount+"'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>"+
				"<td class='datagrid-cell datagrid-cell-3' style='width:95px;text-align: center;' >季度</td>"+
				"<td class='datagrid-cell datagrid-cell-4' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-5' style='width:95px;text-align: center;' >"+tempQuarter+"</td>"+
				"<td class='datagrid-cell datagrid-cell-6' style='width:95px;text-align: center;' >"+$("#paraMapObj_CDPD_MONTH").val()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-7' style='width:95px;text-align: center;' >"+tempDa+"</td>"+
				"<td class='datagrid-cell datagrid-cell-8' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-9' style='width:135px;text-align: center;' >"+timeString()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-10' style='width:135px;text-align: center;' >"+$("#curUser").val()+"</td>";
				parentWindow.$("#addPlanDetail").append(tempHtml);
				
            		});
            		}else{
            		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一天" />",0,"260","");
            		return;
            		}
		}
		//如果保养周期为半年
		if(cdpType==4){
			$("#paraMapObj_CDPD_HALF_YEAR").attr("class","_VAL_NULL isSubmit input dept_select");
			$("#paraMapObj_CDPD_MONTH").attr("class","_VAL_NULL isSubmit input dept_select");
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			var falg = 0; 
			var tempYear = $("#paraMapObj_CDPD_HALF_YEAR").val();
			if(tempYear==1){
				tempYear = "上半年";
			}else   tempYear = "下半年";
			$('input[name="allSelect"]:checkbox').each(function () { 
				if ($(this).attr("checked")) { 
					falg =1; 
					return false;
				} 
			});
			if(falg==1){
			$('input[name="allSelect"]:checked').each(function(){//遍历每一个名字为allSelect的复选框，其中选中的执行函数    
            			//chk_value.push($(this).val());//将选中的值添加到数组chk_value中    
            			trCount++;
            			var tempDiv="<div id='hidDiv_"+trCount+"' style='display:none;'>"+
					"<input name='CDPD_CYCLE_"+trCount+"' type='hidden' id='CDPD_CYCLE_"+trCount+"' value='4'>"+
					"<input name='CDPD_HALF_YEAR_"+trCount+"' type='hidden' id='CDPD_HALF_YEAR_"+trCount+"' value='"+$("#paraMapObj_CDPD_HALF_YEAR").val()+"'>"+
					"<input name='CDPD_QUARTER_"+trCount+"' type='hidden' id='CDPD_QUARTER_"+trCount+"' value=''>"+
					"<input name='CDPD_MONTH_"+trCount+"' type='hidden' id='CDPD_MONTH_"+trCount+"' value='"+$("#paraMapObj_CDPD_MONTH").val()+"'>"+
					"<input name='CDPD_DATE_"+trCount+"' type='hidden' id='CDPD_DATE_"+trCount+"' value='"+$(this).val()+"'>"+
					"<input name='CDPD_WEEK_"+trCount+"' type='hidden' id='CDPD_WEEK_"+trCount+"' value=''>"+
					"<input name='CDPD_CREATE_DATE_"+trCount+"' type='hidden' id='CDPD_CREATE_DATE_"+trCount+"' value='"+timeString()+"'>"+
					"<input name='CDPD_CREATE_MAN_"+trCount+"' type='hidden' id='CDPD_CREATE_MAN_"+trCount+"' value='"+$("#curUserId").val()+"'>"+
					"</div>";
				parentWindow.$("#addPlanDetail").append(tempDiv);
				parentWindow.$("#addTrCount").val(trCount);
				var tempDa;
				if($(this).val()==0)  tempDa="最后一天";
				else tempDa=$(this).val();
				var tempHtml = "<tr id='tr_"+trCount+"'>"+
				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;' name='planDetail_"+trCount+"'>"+(parentWindow.$("#addPlanDetail tr").length+1)+"</td>"+
				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;' name='planDetail_"+trCount+"'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>"+
				"<td class='datagrid-cell datagrid-cell-3' style='width:95px;text-align: center;' >半年</td>"+
				"<td class='datagrid-cell datagrid-cell-4' style='width:95px;text-align: center;' >"+tempYear+"</td>"+
				"<td class='datagrid-cell datagrid-cell-5' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-6' style='width:95px;text-align: center;' >"+$("#paraMapObj_CDPD_MONTH").val()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-7' style='width:95px;text-align: center;' >"+tempDa+"</td>"+
				"<td class='datagrid-cell datagrid-cell-8' style='width:95px;text-align: center;' >/</td>"+
				"<td class='datagrid-cell datagrid-cell-9' style='width:135px;text-align: center;' >"+timeString()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-10' style='width:135px;text-align: center;'>"+$("#curUser").val()+"</td>";
				parentWindow.$("#addPlanDetail").append(tempHtml);
				
            		});
            		}else{
            		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一天" />",0,"260","");
            		return;
            		}
		}
		//如果保养周期为全年
		if(cdpType==5){
			$("#paraMapObj_CDPD_MONTH").attr("class","_VAL_NULL isSubmit input dept_select");
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
			var falg = 0; 
			$('input[name="allSelect"]:checkbox').each(function () { 
				if ($(this).attr("checked")) { 
					falg =1; 
					return false;
				} 
			});
			if(falg==1){
			$('input[name="allSelect"]:checked').each(function(){//遍历每一个名字为allSelect的复选框，其中选中的执行函数    
            			//chk_value.push($(this).val());//将选中的值添加到数组chk_value中    
            			trCount++;
            			var tempDiv="<div id='hidDiv_"+trCount+"' style='display:none;'>"+
					"<input name='CDPD_CYCLE_"+trCount+"' type='hidden' id='CDPD_CYCLE_"+trCount+"' value='5'>"+
					"<input name='CDPD_HALF_YEAR_"+trCount+"' type='hidden' id='CDPD_HALF_YEAR_"+trCount+"' value=''>"+
					"<input name='CDPD_QUARTER_"+trCount+"' type='hidden' id='CDPD_QUARTER_"+trCount+"' value=''>"+
					"<input name='CDPD_MONTH_"+trCount+"' type='hidden' id='CDPD_MONTH_"+trCount+"' value='"+$("#paraMapObj_CDPD_MONTH").val()+"'>"+
					"<input name='CDPD_DATE_"+trCount+"' type='hidden' id='CDPD_DATE_"+trCount+"' value='"+$(this).val()+"'>"+
					"<input name='CDPD_WEEK_"+trCount+"' type='hidden' id='CDPD_WEEK_"+trCount+"' value=''>"+
					"<input name='CDPD_CREATE_DATE_"+trCount+"' type='hidden' id='CDPD_CREATE_DATE_"+trCount+"' value='"+timeString()+"'>"+
					"<input name='CDPD_CREATE_MAN_"+trCount+"' type='hidden' id='CDPD_CREATE_MAN_"+trCount+"' value='"+$("#curUserId").val()+"'>"+
					"</div>";
				parentWindow.$("#addPlanDetail").append(tempDiv);
				parentWindow.$("#addTrCount").val(trCount);
				var tempDa;
				if($(this).val()==0)  tempDa="最后一天";
				else tempDa=$(this).val();
				var tempHtml = "<tr id='tr_"+trCount+"'>"+
				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;' name='deviceItemCode1_"+trCount+"'>"+(parentWindow.$("#addPlanDetail tr").length+1)+"</td>"+
				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;' name='deviceItemCode1_"+trCount+"'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>"+
				"<td class='datagrid-cell datagrid-cell-3' style='width:95px;text-align: center;' name='deviceItemCode1_"+trCount+"'>全年</td>"+
				"<td class='datagrid-cell datagrid-cell-4' style='width:95px;text-align: center;' name='deviceItemCode1_"+trCount+"'>/</td>"+
				"<td class='datagrid-cell datagrid-cell-5' style='width:95px;text-align: center;' name='deviceItemCode1_"+trCount+"'>/</td>"+
				"<td class='datagrid-cell datagrid-cell-6' style='width:95px;text-align: center;' name='deviceItemCode1_"+trCount+"'>"+$("#paraMapObj_CDPD_MONTH").val()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-7' style='width:95px;text-align: center;' name='deviceItemCode1_"+trCount+"'>"+tempDa+"</td>"+
				"<td class='datagrid-cell datagrid-cell-8' style='width:95px;text-align: center;' name='deviceItemCode1_"+trCount+"'>/</td>"+
				"<td class='datagrid-cell datagrid-cell-9' style='width:135px;text-align: center;' name='deviceItemCode1_"+trCount+"'>"+timeString()+"</td>"+
				"<td class='datagrid-cell datagrid-cell-10' style='width:135px;text-align: center;' name='deviceItemCode1_"+trCount+"'>"+$("#curUser").val()+"</td>";
				parentWindow.$("#addPlanDetail").append(tempHtml);
				
            		});
            		}else{
            		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一天" />",0,"260","");
            		return;
            		}
		}
		closeCurrentWindow();
	}
</script>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
