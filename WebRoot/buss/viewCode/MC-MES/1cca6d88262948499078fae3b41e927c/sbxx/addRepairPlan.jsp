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
.input {
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height: 484px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="67b046cee49343d98ec5214366ca5c7c" type="add" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" id="addTrCount" name="addTrCount" value="0" />
	<input type="hidden" name="formIds" value="67b046cee49343d98ec5214366ca5c7c" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="67b046cee49343d98ec5214366ca5c7c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'3587bc3d24c14c0da92d7367c918a258'" />
		<s:set name="_$formId_1" value="'67b046cee49343d98ec5214366ca5c7c'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDP_TYPE" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<bu:td cssClass="dec" colNo="CDP_TYPE" formId="67b046cee49343d98ec5214366ca5c7c" ><bu:ui colNo="CDP_TYPE" formId="67b046cee49343d98ec5214366ca5c7c" value="%{CDP_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDP_PLAN_SN" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<bu:td cssClass="dec" colNo="CDP_PLAN_SN" formId="67b046cee49343d98ec5214366ca5c7c" ><bu:ui colNo="CDP_PLAN_SN" formId="67b046cee49343d98ec5214366ca5c7c" value="%{CDP_PLAN_SN}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDP_PLAN_NAME" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CDP_PLAN_NAME" formId="67b046cee49343d98ec5214366ca5c7c" ><bu:ui colNo="CDP_PLAN_NAME" formId="67b046cee49343d98ec5214366ca5c7c" value="%{CDP_PLAN_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDP_CYCLE" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<bu:td cssClass="dec" colNo="CDP_CYCLE" formId="67b046cee49343d98ec5214366ca5c7c" ><bu:ui colNo="CDP_CYCLE" formId="67b046cee49343d98ec5214366ca5c7c" value="%{CDP_CYCLE}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDP_SPACE" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<bu:td cssClass="dec" colNo="CDP_SPACE" formId="67b046cee49343d98ec5214366ca5c7c" ><bu:ui colNo="CDP_SPACE" formId="67b046cee49343d98ec5214366ca5c7c" value="%{CDP_SPACE}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDP_PRODUCT_TIMES" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<bu:td cssClass="dec" colNo="CDP_PRODUCT_TIMES" formId="67b046cee49343d98ec5214366ca5c7c" ><bu:ui colNo="CDP_PRODUCT_TIMES" formId="67b046cee49343d98ec5214366ca5c7c" value="%{CDP_PRODUCT_TIMES}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDP_MEMO" formId="67b046cee49343d98ec5214366ca5c7c" /></td>
			<bu:td cssClass="dec" colNo="CDP_MEMO" formId="67b046cee49343d98ec5214366ca5c7c" style="height:80px;" colspan="5"><bu:ui colNo="CDP_MEMO" style="width: 100%;height: 100%;" formId="67b046cee49343d98ec5214366ca5c7c" value="%{CDP_MEMO}" formIndex="1" /></bu:td>
		</tr>	
	</table>
	<div class="mod-hd" style="margin-bottom:5px;">		
        <h3 class="tit"><dict:lang value="计划明细" /></h3>	
        <div class="extend-btn" style="float: right;margin-top:5px;">
				<button type="button"  id="addButton"  onclick="addDetailInfo();"  style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="delRowInfo();" style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
				</button> 
			</div>
        </div>
        	<div class="mod" >
		
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" style="height:240px;"  >
						<div class="datagrid-header" >
						<div class="datagrid-header-inner" id="datagrid-header-inner" >
							<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
								<td class="datagrid-cell" style="width:30px;"  ></td >
								<td class="datagrid-cell" style="width:30px;" ><input type="checkbox" id="allSelect" name="allSelect"/></td >
								<td class="datagrid-cell" style="width:95px;" ><dict:lang value="保养周期" /></td >
								<td class="datagrid-cell" style="width:95px;" ><dict:lang value="半年" /></td >
								<td class="datagrid-cell" style="width:95px;" ><dict:lang value="季度" /></td >
								<td class="datagrid-cell" style="width:95px;" ><dict:lang value="月份" /></td >
								<td class="datagrid-cell" style="width:95px;" ><dict:lang value="日" /></td >
								<td class="datagrid-cell" style="width:95px;" ><dict:lang value="星期" /></td >
								<td class="datagrid-cell" style="width:135px;" ><dict:lang value="创建时间" /></td >
								<td class="datagrid-cell" style="width:135px;"><dict:lang value="创建人" /></td >
							</tr>
							</tbody>
	          					</table>
						</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:210px" >
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
					
								<tbody id="addPlanDetail">
					
				
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
        </div>
			<bu:jsVal formId="67b046cee49343d98ec5214366ca5c7c" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:script viewId="3587bc3d24c14c0da92d7367c918a258" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script type="text/javascript">

function addDetailInfo(){
     	var cdpType = $("#paraMap1_CDP_CYCLE").val();
     	var planSn = $("#paraMap1_CDP_PLAN_SN").val();
     	var planName = $("#paraMap1_CDP_PLAN_NAME").val();
     	var memo = $("#paraMap1_CDP_MEMO").val();
     	if($("#paraMap1_CDP_TYPE").val()!="1"){
     		utilsFp.confirmIcon(3,"","","", "<dict:lang value="计划类型请选择周期" />",0,"260","");
     		return;
     	}
     	if(cdpType==""){
     		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择保养周期" />",0,"260","");
     		return;
     	}
     	var trCount = $("#addTrCount").val();
     	var urlDetail = "${path}buss/bussModel.ms?exeid=68a641b0e5304c0787e041feec9a015d&dataId=&formId=67b046cee49343d98ec5214366ca5c7c&cdpType="+cdpType+"&planSn="+planSn+"&planName="+planName+"&memo="+memo+"&trCount="+trCount;
     	//console.log(urlDetail );
	showPopWinFp(urlDetail , 850, 550,null,"<dict:lang value="添加计划明细"/>","add_planDetail");
	//clickTr("planDetail");

}
//把禁用的数据塞到隐藏域中
function setHid(){
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CDP_SPACE' type='hidden' value='"+$("#paraMap1_CDP_SPACE").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CDP_PRODUCT_TIMES' type='hidden' value='"+$("#paraMap1_CDP_PRODUCT_TIMES").val()+"'>");
}
$(function(){
	setSomeVal();
	$("#paraMap1_CDP_CYCLE").attr("class","_VAL_NULL input isSubmit _VAL_OjbsData dept_select");
	$("#paraMap1_CDP_TYPE").attr("onchange","setSomeVal()");
	$("#paraMap1_CDP_CYCLE").attr("onchange","clearTable()");
	$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect']").attr("checked","checked");
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect']").removeAttr("checked","checked");
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
})
//根据选择的计划类型进行不同的操作
function setSomeVal(){
	var planType = $("#paraMap1_CDP_TYPE").val();
	$("#addButton").attr("onclick","addDetailInfo()");
	if(planType==1){  //计划类型为周期
		$("#paraMap1_CDP_CYCLE").removeAttr("disabled");
		$("#paraMap1_CDP_CYCLE").trigger("chosen:updated");
		$("#paraMap1_CDP_SPACE").attr("disabled","disabled");
		$("#paraMap1_CDP_PRODUCT_TIMES").attr("disabled","disabled");
		$("#paraMap1_CDP_SPACE").val("0");
		$("#paraMap1_CDP_PRODUCT_TIMES").val("0");
		//$("#addButton").attr("onclick","addDetailInfo()");
	}
	if(planType==2){  //计划类型为保养间隔
		$("#paraMap1_CDP_CYCLE").attr("disabled","disabled");
		$("#paraMap1_CDP_CYCLE").trigger("chosen:updated");
		$("#paraMap1_CDP_PRODUCT_TIMES").attr("disabled","disabled");
		$("#paraMap1_CDP_PRODUCT_TIMES").val("0");
		$("#paraMap1_CDP_SPACE").removeAttr("disabled");
		$("#paraMap1_CDP_SPACE").val("");
		$("#paraMap1_CDP_SPACE").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData");
	//	$("#addButton").removeAttr("onclick");
	}
	if(planType==3){  //计划类型为生产次数
		$("#paraMap1_CDP_CYCLE").attr("disabled","disabled");
		$("#paraMap1_CDP_CYCLE").trigger("chosen:updated");
		$("#paraMap1_CDP_SPACE").attr("disabled","disabled");
		$("#paraMap1_CDP_SPACE").val("0");
		$("#paraMap1_CDP_PRODUCT_TIMES").removeAttr("disabled");
		$("#paraMap1_CDP_PRODUCT_TIMES").val("");
		$("#paraMap1_CDP_PRODUCT_TIMES").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData");
	//	$("#addButton").removeAttr("onclick");
	}
}
//清空Table
function clearTable(){
	//alert($("#addPlanDetail tr").length);
	$("#addPlanDetail").empty();
	
}
//删除行操作
function delRowInfo(){
	var falg = 0; 
		$("input[name='isSelect1']:checkbox").each(function () { 
			if ($(this).attr("checked")) { 
			falg =1;
			return false; 
			} 
			});
			if (falg > 0) {
		$("input[name='isSelect1']:checked").each(function() { // 遍历选中的checkbox
	            var n = $(this).parents("#addPlanDetail tr").index();  // 获取checkbox所在行的顺序
	            var temp=$(this).val();
	            //var tempNum = temp-1;
		    $("#hidDiv_"+temp).html("");
		    //$("#hidDiv_"+temp).attr("id","hidDiv_"+tempNum);	
	            /*$("#CDPD_CYCLE_"+temp).attr("name","testTemp");
	            $("#CDPD_HALF_YEAR_"+temp).attr("name","testTemp");
	            $("#CDPD_QUARTER_"+temp).attr("name","testTemp");
	            $("#CDPD_MONTH_"+temp).attr("name","testTemp");
	            $("#CDPD_DATE_"+temp).attr("name","testTemp");
	            $("#CDPD_WEEK_"+temp).attr("name","testTemp");
	            $("#CDPD_CREATE_DATE_"+temp).attr("name","testTemp");*/
	            var trId=document.getElementById("tr_"+temp);
	            var table1=document.getElementById("addPlanDetail");
	            table1.removeChild(trId);
	            
        	 });
        	 var tCount=0;
        	 $("#addPlanDetail tr").each(function(){ 
        	 tCount++;
                     $(this).children("td:first").html(tCount); 
                     
                 }) ;
                   
        	 }else 
        	 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
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
                        setHid();
			var trCount = $("#addTrCount").val();
                        var num = $("#addPlanDetail tr").length;
                        if($("#paraMap1_CDP_TYPE").val()==1){
                          if(num==0){
                            
                             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加计划明细" />",0,"260","");
                             return;
                          }
                        }
                      
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=1b7a49aaf0bc4530b9b80edb8047b212&trCount="+trCount;
                        document.forms.addForm.submit();
                        isQuery = true;
}

</script>
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->

