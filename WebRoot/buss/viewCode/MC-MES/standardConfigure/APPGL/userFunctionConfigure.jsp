<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
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
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			         <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			        <button type="button" onclick="queryInfo();"><i class="ico ico-cancel"></i><dict:lang value="查询" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="cde7667fb3bc47d1b64355437e9de4ef" type="add" />
		
		<table class="basic-table">
		                   	 <tr>
		                   	    <td class="name" style="text-align:right;width:100px;"/><dict:lang value="导航菜单"/></td>
								<td class="dec"><input type="text" id="menuId" name="menuId" class=" input isSubmit isaddSubmit"/></td>
		                   	 
						    	<td class="name" style="text-align:right;width:100px;"/><dict:lang value="功能模块"/></td>
								<td class="dec"><input type="text" id="moudleId" name="moudleId" class=" input isSubmit isaddSubmit"/></td>
						     </tr>
						    
					    </table>
					    	<div style="width:900px;height:30px;">  
					    	<table  width="900px" class="dlist-table table-line " >
								<thead>
								<tr>
					    			<th style="width: 30px;text-align: center;"></th>
									<th style="width: 30px;text-align: center;"><input type="checkbox" id="po_list_cb1"  onchange="getAllPo1();" /></th>
									<th style="width: 200px;text-align: center;"><dict:lang value="导航菜单" /></th>
									<th style="width: 200px;text-align: center;"><dict:lang value="功能模块" /></th>
									<th style="width: 200px;text-align: center;"><dict:lang value="显示类型" /></th>
									<th style="width: 200px;text-align: center;"><dict:lang value="功能细项" /></th>
									<th style="width: 200px;text-align: center;"><dict:lang value="默认显示" /></th>
									<th style="width: 200px;text-align: center;"><dict:lang value="显示顺序" /></th>
									<th style="width: 200px;text-align: center;"><dict:lang value="是否启用" /></th>
								</tr>
					    	</thead>
					    	</table>
					    	</div>
					    	<div class="scroll1" style="width:900px;height:calc(100% - 171px);overflow-y: auto;overflow-x: hidden;" >  
					    	<table style="table-layout:fixed;width:100%;" class="dlist-table table-line " id="outTable">
						    	<tbody id="outTbody">
					            </tbody>
							</table>
							
	<!--	
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cde7667fb3bc47d1b64355437e9de4ef" />
	<input type="hidden" id="prefixInd" name="cde7667fb3bc47d1b64355437e9de4ef" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f9183e12d0f2482daa7c158101382627'" />
		<s:set name="_$formId_1" value="'cde7667fb3bc47d1b64355437e9de4ef'" />
		<s:set name="_$type" value="'add'" />
			<td class="name-four" /><bu:uitn colNo="TAS_MENU_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_MENU_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_MENU_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_MENU_ID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-four" /><bu:uitn colNo="TAS_MOUDLE_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_MOUDLE_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_MOUDLE_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_MOUDLE_ID}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-four" /><bu:uitn colNo="TAS_SHOW_TYPE" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_SHOW_TYPE" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_SHOW_TYPE" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_SHOW_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-four" /><bu:uitn colNo="TAS_FUN_NAME" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_FUN_NAME" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_FUN_NAME" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_FUN_NAME}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-four" /><bu:uitn colNo="TAS_DATA_TYPE" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_DATA_TYPE" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_DATA_TYPE" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_DATA_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-four" /><bu:uitn colNo="TAS_DATA_CONTENT" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_DATA_CONTENT" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_DATA_CONTENT" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_DATA_CONTENT}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-four" /><bu:uitn colNo="TAS_IS_DEFAULT" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_IS_DEFAULT" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_IS_DEFAULT" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_IS_DEFAULT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-four" /><bu:uitn colNo="TAS_SEQ" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_SEQ" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_SEQ" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_SEQ}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-four" /><bu:uitn colNo="TAS_STATUS" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_STATUS" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_STATUS" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_STATUS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-four" /><bu:uitn colNo="TAS_CLASS_CODE_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_CLASS_CODE_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_CLASS_CODE_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_CLASS_CODE_ID}" formIndex="1" /></bu:td>
		</tr>
		
			<td class="name-four" /><bu:uitn colNo="TAS_PIC_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<bu:td cssClass="dec-self" colNo="TAS_PIC_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" ><bu:ui colNo="TAS_PIC_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" value="%{TAS_PIC_ID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		
	</table> 
	-->
			<bu:jsVal formId="cde7667fb3bc47d1b64355437e9de4ef" formIndex="1" />
				
			</div>
		 </form>
	</div>
    
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
		
<script>
//首页/仓储/产量/   新增获取数据功能
function queryInfo(){
	util.showLoading("处理中...");
	
		var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=c2070990a80d4e25bc36c46008d966eb";
		var menuId = $("#menuId").val();//导航菜单
		var moudleId = $("#moudleId").val();//功能模块
	      $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	           	  "menuId" : menuId,
	           	  "moudleId" : moudleId,
	           	   "type" : outType,
	           	  "showList" : "all"
	           },
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	$("#outTbody").empty();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxList){
                	   var rccList = eval(data.ajaxList);
                	   for(var i=0;i<rccList.length;i++){
                	       if(rccList[i].ID==null) rccList[i].ID="";
                	       $("#outTbody").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
						   $("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:140px;text-align: center;' title='"+rccList[i].MENU_ID+"'>"+rccList[i].MENU_ID+"<input type='hidden' id='MENU_ID"+rccList[i].ID+"' value='"+rccList[i].MENU_ID+"'/><input type='hidden' id='MENU_ID_R"+rccList[i].ID+"' value='"+rccList[i].TAS_MENU_ID+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:140px;text-align: center;' title='"+rccList[i].MOUDLE_NAME+"'>"+rccList[i].MOUDLE_NAME+"<input type='hidden' id='MOUDLE_NAME"+rccList[i].ID+"' value='"+rccList[i].MOUDLE_NAME+"'/><input type='hidden' id='MOUDLE_NAME_R"+rccList[i].ID+"' value='"+rccList[i].TAS_MOUDLE_ID+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:60px;text-align: center;' title='"+rccList[i].SHOW_TYPE+"'>"+rccList[i].SHOW_TYPE+"<input type='hidden' id='SHOW_TYPE"+rccList[i].ID+"' value='"+rccList[i].SHOW_TYPE+"'/><input type='hidden' id='SHOW_TYPE_R"+rccList[i].ID+"' value='"+rccList[i].TAS_SHOW_TYPE+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:140px;text-align: center;' title='"+rccList[i].TAS_FUN_NAME+"'>"+rccList[i].TAS_FUN_NAME+"<input type='hidden' id='TAS_FUN_NAME"+rccList[i].ID+"' value='"+rccList[i].TAS_FUN_NAME+"'/></td>");
							//$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;' title='"+rccList[i].TAS_FUN_NAME+"'>"+rccList[i].TAS_FUN_NAME+"<input type='hidden' id='TAS_FUN_NAME"+rccList[i].ID+"' value='"+rccList[i].TAS_FUN_NAME+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: center;' title='"+rccList[i].IS_DEFAULT+"'>"+rccList[i].IS_DEFAULT+"<input type='hidden' id='IS_DEFAULT"+rccList[i].ID+"' value='"+rccList[i].IS_DEFAULT+"'/><input type='hidden' id='IS_DEFAULT_R"+rccList[i].ID+"' value='"+rccList[i].TAS_IS_DEFAULT+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;' title='"+rccList[i].TAS_SEQ+"'>"+rccList[i].TAS_SEQ+"<input type='hidden' id='TAS_SEQ"+rccList[i].ID+"' value='"+rccList[i].TAS_SEQ+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align: center;' title='"+rccList[i].IS_OPEN+"'>"+rccList[i].IS_OPEN+"<input type='hidden' id='IS_OPEN"+rccList[i].ID+"' value='"+rccList[i].IS_OPEN+"'/><input type='hidden' id='IS_OPEN_R"+rccList[i].ID+"' value='"+rccList[i].TAS_STATUS+"'/></td>");
                	   }
                	}
					var tableTrJs = $("#outTbody tbody tr");
					_tongLineColor(tableTrJs);
					clickTr("outTable");
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	});
}



function add(type){//首页  1/仓储   4   产量  2/品质   3 /预警 5
	var tableId;
	var tbodyId;
	var trId;
	if(type=="1"){
		tableId = "homeInfo";
		tbodyId = "addHomeInfo";
		trId = "trr1";
	}else if(type=="2"){ //产量
		tableId = "outPutInfo";
		tbodyId = "addOutPutInfo";
		trId = "trr2";
	}else if(type=="3"){ //品质 
		tableId = "qualityInfo";
		tbodyId = "addQualityInfo";
		trId = "trr3";
	}else if(type=="4"){
		tableId = "stockInfo";
		tbodyId = "addStockInfo";
		trId = "trr4";
	}else{
		tableId = "warnInfo";
		tbodyId = "addWarnInfo";
		trId = "trr5";
	}
	getSubmitTable(tableId);
	var len = $("#submitTable tbody tr").length;
	if(len>0){
		document.forms.submit_Form.action="${path}buss/bussModel_exeFunc.ms?funcMId=abdf715c098646aab321f64ad2f16892";
		document.forms.submit_Form.submit();
		$("#submitTable").empty();
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
    	return;
	}
}
function getSubmitTable(tableId){
		var submitTable = $("#submitTable");
		submitTable.empty();
    	$("#"+tableId).find("tbody tr").each(function (seq){
    	if($(this).find("td").find("input[type='checkbox']").prop("checked")){
    		var rowClone = $(this).clone(true);
				submitTable.append(rowClone);
			}
    	});
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
