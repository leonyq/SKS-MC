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
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
			    </div>

			</div>
			<div class="bd" style="height:534px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="080ce545617f4ff5949b1f52484c48ee" type="edit" />
<div class="mod">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="基本信息" /></h3>	
        </div>
	<table class="basic-table" >
	<input type="hidden" id="packLevel" name="packLevel" value="1" />
	<input type="hidden" id="packSn" name="packSn" value="" />
	<input type="hidden" name="formIds" value="080ce545617f4ff5949b1f52484c48ee" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="080ce545617f4ff5949b1f52484c48ee" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cb6c3a7193854ac3a0b75edde09555f3'" />
		<s:set name="_$formId_1" value="'080ce545617f4ff5949b1f52484c48ee'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTI_SN" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_SN" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_SN" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTI_NAME" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_NAME" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_NAME" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="PTI_WEIGH_WAY" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="PTI_WEIGH_WAY" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_WEIGH_WAY" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	
	    <tr>
			<td class="name" /><bu:uitn colNo="PTI_DEVIATE_RANGE" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_DEVIATE_RANGE" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_DEVIATE_RANGE" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<!--	<bu:uitn colNo="PTI_ROUTE_CHECK" formId="080ce545617f4ff5949b1f52484c48ee" />
		    <bu:ui colNo="PTI_ROUTE_CHECK" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>
				
	        <td class="name" /><bu:uitn colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>
		-->		
		
	
		</tr>
		<!--<tr>
			<td class="name" /><bu:uitn colNo="PTI_MEMO" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_MEMO" formId="080ce545617f4ff5949b1f52484c48ee" colspan="5" style="height:80px;"><bu:ui colNo="PTI_MEMO" style="width:100%;height:100%" formId="080ce545617f4ff5949b1f52484c48ee" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>-->
		
	</table>
	<div class="mod-hd" style="margin-bottom:5px;">		
        <h3 class="tit"><dict:lang value="策略明细信息" /></h3>	
        <div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
	<button type="button" onclick="addPack();" style="padding:0;" title="新增明细">
		<i class="ico ico-kl-new-add ico-small"></i>
	</button>
	<button type="button" onclick="delRow();" style="padding:0" title="删除">
		<i class="ico ico-sc-new-add ico-small"></i>
	</button>
</div>
        </div>
        
	<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td>
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="包装层级" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="层级名称" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="容量" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="条码规则" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="标签打印" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="标签模板" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="标签打印地址" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="在线打印" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="清单打印" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="清单模板" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="清单打印地址" /></td >
										<td class="datagrid-cell" style="width:100px;"><dict:lang value="分页带表头" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="生成规则" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3" style="height:235px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addPackInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				
</div>	
									<bu:jsVal formId="080ce545617f4ff5949b1f52484c48ee" formIndex="1" />
			</div>
	</form>	
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
function addPack(){
     	var urlDetail = "${path}buss/bussModel.ms?exeid=1bee326aff0d4190b15bc34d362964c7&formId=080ce545617f4ff5949b1f52484c48ee&packLevel="+$("#packLevel").val();
     	//console.log(urlDetail );
	showPopWinFp(urlDetail , 880, 400,null,"<dict:lang value="添加策略明细"/>","add_packDetail");
	//clickTr("packInfo");

}
$(function(){
     getTemplate();
    var dataAuth = $("#deptLs_data_auth").val();//组织机构
});

    var lableTemplate;//标签模板
	var lableRule;//条码规则 
	var listTemplate;//清单模板
	var createRuleOption;
	
	//获取模板
	function getTemplate(){
	    util.showLoading("处理中...");
        $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=02bb46c1de4c40fb8765f40337d7adba",
			    data: $("#deptLs_data_auth").val(),
				success: function(data){
						util.closeLoading();
					   	lableTemplate	="";
					   	listTemplate	="";
					   	lableRule	="";
						lableTemplate = "<option value=''>--请选择--</option>";
						listTemplate = "<option value=''>--请选择--</option>";
						lableRule = "<option value=''>--请选择--</option>";
						createRuleOption = "<option value=''>--请选择--</option>";
						var rccList;
						
						if(null == data){return ;}
						if(null != data.ajaxMap.list1){
							rccList = eval(data.ajaxMap.list1);
							for(var i = 0;i < rccList.length; i++){
								lableTemplate = lableTemplate + "<option value='"+rccList[i].MKEY+"'>"+rccList[i].VAL+"</option>";
							}
						}
						if(null != data.ajaxMap.list2){
							var rccList = eval(data.ajaxMap.list2);
							for(var i = 0;i < rccList.length; i++){
								lableRule = lableRule + "<option value='"+rccList[i].MKEY+"'>"+rccList[i].VAL+"</option>";
							}
						}
						if(null != data.ajaxMap.list3){
							rccList = eval(data.ajaxMap.list3);
							for(var i = 0;i < rccList.length; i++){
								listTemplate = listTemplate + "<option value='"+rccList[i].MKEY+"'>"+rccList[i].VAL+"</option>";
							}
							
						}
						if(null != data.ajaxMap.list4){
							rccList = eval(data.ajaxMap.list4);
							for(var i = 0;i < rccList.length; i++){
								createRuleOption = createRuleOption + "<option value='"+rccList[i].MKEY+"'>"+rccList[i].VAL+"</option>";
							}
						}
						 getPrintName();
    
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	var tOption = "";
	//获取打印机名称
	function getPrintName(){
	    util.showLoading("处理中...");
        $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=5bf4bde793a14c7b84e6fae933515f63",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						console.log(data.ajaxList);
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempOption = "";
								tOption="";
								tOption = "<option value=''>--请选择--</option>";
						
							for(var i=0;i<rccList.length;i++){
							    tempOption = tempOption + "<option value='"+rccList[i].printName+"'>"+rccList[i].printName+"</option>" ;
							    	tOption = tOption + "<option value='"+rccList[i].printName+"'>"+rccList[i].printName+"</option>";
							}
						}
						setVal();
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
//回填信息
function setVal(){
    	var isLablePrint;
    	var isListPrint;
    	var isIsOnline;
    util.showLoading("处理中...");
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=586384c8cdec4a8985daabd2d0d63492",
			    data: {
			        pSn: $("#paraMapObj_PTI_SN").val(),
			        dataAuth: $("#deptLs_data_auth").val()
			    },
				success: function(data){
				       
						         $("#addPackInfo").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i=0;i<rccList.length;i++){
							
							    if(rccList[i].PTD_LABLE_TEMPLATE==null) rccList[i].PTD_LABLE_TEMPLATE="";
							    if(rccList[i].PTD_LABLE_ADDRESS==null) rccList[i].PTD_LABLE_ADDRESS="";
							    if(rccList[i].PTD_LIST_TEMPLATE==null) rccList[i].PTD_LIST_TEMPLATE="";
							    if(rccList[i].PTD_LIST_ADDRESS2==null) rccList[i].PTD_LIST_ADDRESS2="";
							    if(rccList[i].TBR_NAME==null) rccList[i].TBR_NAME="";
							    if(rccList[i].PTD_MEMO==null) rccList[i].PTD_MEMO="";
							    if(rccList[i].LABEL_NAME==null) rccList[i].LABEL_NAME="";
							    if(rccList[i].PTD_LABLE_RULE==null) rccList[i].PTD_LABLE_RULE="";
							    if(rccList[i].PTD_LABLE_PRINT=="Y") isLablePrint="Y";
							    if(rccList[i].PTD_LABLE_PRINT=="N") isLablePrint="N";
							    if(rccList[i].PTD_LIST_PRINT=="Y") isListPrint="Y";
							    if(rccList[i].PTD_LIST_PRINT=="N") isListPrint="N";
							    if(rccList[i].PTD_IS_ONLINE==null) isIsOnline="";
							    if(rccList[i].PTD_IS_ONLINE=="Y") isIsOnline="Y";
							    if(rccList[i].PTD_IS_ONLINE=="N") isIsOnline="N";
							    
							    
							    var ptdLableTemplate = "<select id='ptdLableTemplate_"+(i+1)+"' class='selector_"+(i+1)+"' name='labelTemp' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ lableTemplate +"</select>";
                    			var ptdLableRule = "<select id='ptdLableRule_"+(i+1)+"' class='selec_"+(i+1)+"' name='labelRule' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ lableRule +"</select>";
                    			var ptdListTemplate = "<select id='ptdListTemplate_"+(i+1)+"' class='sel_"+(i+1)+"' name='listTemp' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ lableTemplate +"</select>";
                    			 var labeAddress = "<select id='labeAddress"+(i+1)+"' class='Address_"+(i+1)+"' name='labelAddress' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ tOption +"</select>";
                    			 var listAddress2= "<select id='listAddress2"+(i+1)+"' class='Address2_"+(i+1)+"' name='listAddress' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ tOption +"</select>";
                    			 var createRuleSel = "<select id='createRule_"+(i+1)+"' class='selector2_"+(i+1)+"' name='createRule' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ createRuleOption +"</select>";
                    			 var ptdCodeSel="<select id='ptdCodeSel_"+(i+1)+"' class='selector3_"+(i+1)+"' name='ptdCode' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:90px;'><option value=''>--请选择--</option><option value='code39'>code39</option><option value='code93'>code93</option><option value='EAN8'>EAN8</option><option value='EAN13'>EAN13</option><option value='UPC_E'>UPC_E</option><option value='UPC_A'>UPC_A</option><option value='qrcode'>qrcode</option><option value='pdf47'>pdf47</option></select>";
                    			 
                    			var isCheckOpt = $("#isCheck").html();
                                var isCheckOption ="<option value='Y'>"+"是"+"</option>";
                                //var isCheckOption = isCheckOpt.substring(isCheckOpt.indexOf('<option'));
                                 isCheckOption = isCheckOption + "<option value='N'>"+"否"+"</option>";
                                
                                var isOnline = "<select id='isOnline_"+(i+1)+"' class='isCheck_"+(i+1)+"' name='isOnline' class=' input isSubmit _VAL_OjbsData dept_select' style='width:80px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                                var lablePrint = "<select id='lablePrint_"+(i+1)+"' class='isSel_"+(i+1)+"' name='lablePrint' class=' input isSubmit _VAL_OjbsData dept_select' style='width:80px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                                var listPrint = "<select id='listPrint_"+(i+1)+"' class='CheckSel_"+(i+1)+"' name='listPrint' class=' input isSubmit _VAL_OjbsData dept_select' style='width:80px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                                var titleFlagSel = "<select id='titleFlagSel_"+(i+1)+"' class='titleFlagSel_"+(i+1)+"' name='titleFlagSel' class=' input isSubmit _VAL_OjbsData dept_select' style='width:80px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
							    var frameFlagSel = "<select id='frameFlagSel_"+(i+1)+"' class='frameFlagSel_"+(i+1)+"' name='frameFlagSel' class=' input isSubmit _VAL_OjbsData dept_select' style='width:90px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
							    
							    
							  
							   /*
								var tempHtml = "<tr id='tr_"+(i+1)+"'>"+
                    				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/><input name='memo' type='hidden' value='"+rccList[i].PTD_MEMO+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: center;'>"+rccList[i].PTD_LEVEL+"<input name='myPackLevel' type='hidden' value='"+rccList[i].PTD_LEVEL+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-5' style='width:130px;text-align: center;'>"+rccList[i].PTD_LEVEL_NAME+"<input name='levelName' type='hidden' value='"+rccList[i].PTD_LEVEL_NAME+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;'>"+rccList[i].PTD_CAPACITY+"<input name='capacity' type='hidden' value='"+rccList[i].PTD_CAPACITY+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: center;'>"+rccList[i].TBR_NAME+"<input name='labelRule' type='hidden' value='"+rccList[i].PTD_LABLE_RULE+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;'>"+isLablePrint+"<input name='lablePrint' type='hidden' value='"+rccList[i].PTD_LABLE_PRINT+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: center;'>"+rccList[i].LABEL_NAME+"<input name='labelTemp' type='hidden' value='"+rccList[i].PTD_LABLE_TEMPLATE+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-10' style='width:200px;text-align: center;'>"+rccList[i].PTD_LABLE_ADDRESS+"<input name='labelAddress' type='hidden' value='"+rccList[i].PTD_LABLE_ADDRESS+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: center;'>"+isIsOnline+"<input name='isOnline' type='hidden' value='"+rccList[i].PTD_IS_ONLINE+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+isListPrint+"<input name='listPrint' type='hidden' value='"+rccList[i].PTD_LIST_PRINT+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-13' style='width:150px;text-align: center;'>"+rccList[i].PTD_LIST_TEMPLATE+"<input name='listTemp' type='hidden' value='"+rccList[i].PTD_LIST_TEMPLATE+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-14' style='text-align: center;'>"+rccList[i].PTD_LIST_ADDRESS2+"<input name='listAddress' type='hidden' value='"+rccList[i].PTD_LIST_ADDRESS2+"'></td>"+
                    				"</tr>";
                    				*/
                    				var tempHtml = "<tr id='tr_"+(i+1)+"'>"+
                    				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/><input name='memo' type='hidden' value='"+rccList[i].PTD_MEMO+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: center;'>"+rccList[i].PTD_LEVEL+"<input name='myPackLevel' type='hidden' value='"+rccList[i].PTD_LEVEL+"'></td>"+
                    				"<td class='datagrid-cell datagrid-cell-5' style='width:130px;text-align: center;'><input type='text' style='width: 120px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='PLAN_NUM_"+(i+1)+"' name='levelName' value='"+rccList[i].PTD_LEVEL_NAME+"'/></td>"+
                    				"<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;'><input type='text' style='width: 80px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='GIFT_NUM_"+(i+1)+"' name='capacity' value='"+rccList[i].PTD_CAPACITY+"'/></td>"+
                    				"<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: center;'>"+ptdLableRule+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;'>"+lablePrint+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: center;'>"+ptdLableTemplate+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: center;'>"+labeAddress+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: center;'>"+isOnline+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+listPrint+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-13' style='width:150px;text-align: center;'>"+ptdListTemplate+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-14' style='width:150px;text-align: center;'>"+listAddress2+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-14' style='width:100px;text-align: center;'>"+titleFlagSel+"</td>"+
                    				"<td class='datagrid-cell datagrid-cell-14' style='width:150px;text-align: center;'>"+createRuleSel+"</td>"+
                    				//"<td class='datagrid-cell datagrid-cell-14' style='width:100px;text-align: center;'>"+ptdCodeSel+"</td>"+
                    				//"<td class='datagrid-cell datagrid-cell-14' style='width:100px;text-align: center;'>"+frameFlagSel+"</td>"+
                    				"</tr>";
                    			$("#addPackInfo").append(tempHtml);
				
				
			
                                
                                $(".selector_"+(i+1)).val(rccList[i].PTD_LABLE_TEMPLATE);
                    		    $(".selector_"+(i+1)).trigger("chosen:updated");
                    		    
                    		   $(".sel_"+(i+1)).val(rccList[i].PTD_LIST_PRINT);
                    		   $(".sel_"+(i+1)).trigger("chosen:updated");
                    		    
                    		    
                    		    $(".selec_"+(i+1)).val(rccList[i].PTD_LABLE_RULE);
                    		    $(".selec_"+(i+1)).trigger("chosen:updated");
                    		    
                    		    $(".Address_"+(i+1)).val(rccList[i].PTD_LABLE_ADDRESS);
                    		    $(".Address_"+(i+1)).trigger("chosen:updated");
                    		    
                    		    $(".Address2_"+(i+1)).val(rccList[i].PTD_LIST_ADDRESS2);
                    		    $(".Address2_"+(i+1)).trigger("chosen:updated");
                    		    
                    		    $("#ptdListTemplate_"+(i+1)).val(rccList[i].PTD_LIST_TEMPLATE);
                    		    $("#ptdListTemplate_"+(i+1)).trigger("chosen:updated");
                    		    
                    		    $(".isCheck_"+(i+1)).val(isIsOnline);
                    		    $(".isCheck_"+(i+1)).trigger("chosen:updated");
                    		    
                    		    $(".isSel_"+(i+1)).val(isLablePrint);
                    		    $(".isSel_"+(i+1)).trigger("chosen:updated");
                    		    
                    		    $(".CheckSel_"+(i+1)).val(isListPrint);
                    		    $(".CheckSel_"+(i+1)).trigger("chosen:updated");
                    
                                $(".selector2_"+(i+1)).val(rccList[i].PTD_CREATE_RULE);
                    		    $(".selector2_"+(i+1)).trigger("chosen:updated");
                    		    
                    		    $(".titleFlagSel_"+(i+1)).val(rccList[i].PTD_TITLE_FLAG);
                    		    $(".titleFlagSel_"+(i+1)).trigger("chosen:updated");
                    			
                            //    mySetChosen();//设置下拉框样式
                                $("#ptdLableTemplate").chosen({search_contains: true});
                                $("#ptdLableTemplate_chosen .chosen-search").css("display","block");
                                $("#ptdLableRule").chosen({search_contains: true});
                                $("#ptdLableRule_chosen .chosen-search").css("display","block");
                                $("#ptdListTemplate").chosen({search_contains: true});
                                $("#ptdListTemplate_chosen .chosen-search").css("display","block");
                    		    $("#ptdLableTemplate_"+(packLevel+1)+"_chosen").attr("style","width:150px;");
                                $("#ptdLableRule_"+(packLevel+1)+"_chosen").attr("style","width:150px;");						
                                $("#ptdListTemplate_"+(packLevel+1)+"_chosen").attr("style","width:150px;");	       
                                
				                
							    
							}
							$("#packLevel").val(rccList.length+1);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
function editCal(){      

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
            
            
            
            var len = $("#addPackInfo tr").length;
                        if(len<=0){
                          // utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条单据明细信息")}",0,"260","");
                            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条策略明细信息" />",0,"260","");
                           return;
            }
            
         /*   for(var i=1;i<=len;i++){
                if($("#lablePrint_"+i).val()=="Y"){
                    	if($("#ptdLableTemplate_"+i).val()==""){
                    	    utilsFp.confirmIcon(3,"","","", "<dict:lang value="标签模板不能为空" />",0,"260","");
                           return;
                    	}
                     
                }
                 if($("#titleFlagSel_"+i).val()=="Y"){
                    	if($("#ptdListTemplate_"+i).val()==""){
                    	    utilsFp.confirmIcon(3,"","","", "<dict:lang value="清单模板不能为空" />",0,"260","");
                           return;
                    	}
                     
                }
                
            }*/
            var labeTemp;
            var listTemo;
            var Temp;
            var Temo;
            $("#addPackInfo  tr").each(function(i){
        
       var lablePrint=$(this).parent().parent().find("td").eq(6).find("select").val();
       var LableTempla=$(this).parent().parent().find("td").eq(7).find("select").val();
        var ptdLableTemplate=$(this).parent().parent().find("td").eq(8).find("select").val();
         var titleFlagSel=$(this).parent().parent().find("td").eq(10).find("select").val();
         var ListTemplate=$(this).parent().parent().find("td").eq(11).find("select").val();
         var ptdListTemplate=$(this).parent().parent().find("td").eq(12).find("select").val();
        if(lablePrint=="Y"){
            if(null==ptdLableTemplate||ptdLableTemplate==""){
               labeTemp="1";
                           return;
            }
            if(null==LableTempla||LableTempla==""){
               labeTemp="1";
                           return;
            }
        }
        if(titleFlagSel=="Y"){
            if(null==ptdListTemplate||ptdListTemplate==""){
                listTemo="1";
                           return;
            }
            if(null==ListTemplate||ListTemplate==""){
                listTemo="1";
                           return;
            }
        }
        
        
      });	
        if(labeTemp=="1"){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="标签打印地址不能为空" />",0,"260","");
             return;
        }
        if(listTemo=="1"){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="清单打印地址不能为空" />",0,"260","");
             return;
        }
        if(Temp=="1"){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="标签模板不能为空" />",0,"260","");
             return;
        }
        if(Temo=="1"){
           utilsFp.confirmIcon(3,"","","", "<dict:lang value="清单模板不能为空" />",0,"260","");
             return;
        }
	    	if(listTemo!="1" && labeTemp!="1" && Temp!="1" && Temo!="1"){
	    	     $("#packSn").val($("#paraMapObj_PTI_SN").val());
                document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=8062909cb03549ffb20566c16c2c8814";
                document.forms.editForm.submit();
	    	}
           
                        
    	}
function delRow(){

	    var falg = 0;
	var delId;
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function () { 
		if ($(this).attr("checked")) { 
			falg =1; 
			return false;
		} 
	});
	if(falg==1){
		$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	}
	
	
	
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
}
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
		if(item.id!=""){
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
			//console.log($("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
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
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
}
   //全选
     	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#addPackInfo :checkbox").attr("checked",true);
		}else{
			$("#addPackInfo :checkbox").each(function(){
				$(this).attr("checked",false);
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
$('#paraMapObj_PTI_DEVIATE_RANGE').bind('keyup', function () {
	            var calwStart=$("#paraMapObj_PTI_DEVIATE_RANGE");
             if(!/^[0-9]+([.]{1}[0-9]{0,2})?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_PTI_DEVIATE_RANGE'),"<dict:lang value="输入正数,小数不超过两位" />");
             }
         })
</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
    //setPopScroll('.scorl1','.head1');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
