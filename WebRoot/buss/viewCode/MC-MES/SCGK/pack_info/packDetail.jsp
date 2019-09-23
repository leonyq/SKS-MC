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
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
			    <div class="optn">
			        <button type="button" onclick="addPack();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4c1b1d56bcd8473885dea36a3d2f5c5a" />
	<input type="hidden" name="4c1b1d56bcd8473885dea36a3d2f5c5a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1bee326aff0d4190b15bc34d362964c7'" />
		<s:set name="_$formId_1" value="'4c1b1d56bcd8473885dea36a3d2f5c5a'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="PTD_LEVEL" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LEVEL" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_LEVEL" style="width:200px;" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LEVEL}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTD_LEVEL_NAME" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LEVEL_NAME" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_LEVEL_NAME" style="width:200px;" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LEVEL_NAME}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTD_CAPACITY" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="PTD_CAPACITY" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_CAPACITY" style="width:200px;" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_CAPACITY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PTD_LABLE_PRINT" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LABLE_PRINT" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_LABLE_PRINT" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LABLE_PRINT}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="PTD_LABLE_TEMPLATE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LABLE_TEMPLATE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_LABLE_TEMPLATE" style="width:200px;" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LABLE_TEMPLATE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="PTD_IS_ONLINE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_IS_ONLINE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_IS_ONLINE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_IS_ONLINE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PTD_LIST_PRINT" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LIST_PRINT" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_LIST_PRINT" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LIST_PRINT}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="PTD_LIST_TEMPLATE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LIST_TEMPLATE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_LIST_TEMPLATE" style="width:200px;" disabled="disabled" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LIST_TEMPLATE}" formIndex="1" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="PTD_TITLE_FLAG" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_TITLE_FLAG" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_TITLE_FLAG" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_TITLE_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PTD_LABLE_RULE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LABLE_RULE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" ><bu:ui colNo="PTD_LABLE_RULE" style="width:200px;" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LABLE_RULE}" formIndex="1" /></bu:td>
			
		    <td class="name" /><bu:uitn colNo="PTD_CREATE_RULE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_CREATE_RULE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a"><bu:ui style="width:200px;" colNo="PTD_CREATE_RULE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_CREATE_RULE}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PTD_LABLE_ADDRESS" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LABLE_ADDRESS" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" colspan="5"><bu:ui style="width:100%" colNo="PTD_LABLE_ADDRESS" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LABLE_ADDRESS}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PTD_LIST_ADDRESS2" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_LIST_ADDRESS2" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" colspan="5"><bu:ui style="width:100%" colNo="PTD_LIST_ADDRESS2" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_LIST_ADDRESS2}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PTD_MEMO" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<bu:td cssClass="dec" colNo="PTD_MEMO" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" colspan="5" style="height:80px;"><bu:ui colNo="PTD_MEMO" style="width:100%;height:100%" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" value="%{PTD_MEMO}" formIndex="1" /></bu:td>
		</tr>
		<td style="display:none;">
    		<dict:selectDict id="isCheck" name="isCheck" dictCode="YORN" />
    	</td >
	</table>
			<bu:jsVal formId="4c1b1d56bcd8473885dea36a3d2f5c5a" formIndex="1" />
				
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
	var packLevel = '${param.packLevel}';
	var parentWindow;
	$(function(){
	    //$("#paraMap1_PTD_LEVEL").val(packLevel);
	    parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
	    getPrintName();
	    getTemplate();
	})
	$("#paraMap1_PTD_LABLE_TEMPLATE").attr("disabled",true);
	$("#paraMap1_PTD_LABLE_PRINT_1").click(function(){
	    if($(this).attr("checked")=="checked"){
	        $("#paraMap1_PTD_LABLE_TEMPLATE").attr("disabled",false);
	        $("#paraMap1_PTD_LABLE_TEMPLATE").trigger("chosen:updated");
	    }else{
	        $("#paraMap1_PTD_LABLE_TEMPLATE").attr("disabled",true);
	        $("#paraMap1_PTD_LABLE_TEMPLATE option:eq(0)").attr("selected","selected");
		    $("#paraMap1_PTD_LABLE_TEMPLATE").trigger("chosen:updated");
	    }
	});
	$("#paraMap1_PTD_LIST_TEMPLATE").attr("disabled",true);
	$("#paraMap1_PTD_LIST_PRINT_1").click(function(){
	    if($(this).attr("checked")=="checked"){
	        $("#paraMap1_PTD_LIST_TEMPLATE").attr("disabled",false);
	        $("#paraMap1_PTD_LIST_TEMPLATE").trigger("chosen:updated");
	    }else{
	        $("#paraMap1_PTD_LIST_TEMPLATE").attr("disabled",true);
	        $("#paraMap1_PTD_LIST_TEMPLATE option:eq(0)").attr("selected","selected");
		    $("#paraMap1_PTD_LIST_TEMPLATE").trigger("chosen:updated");
	    }
	});
	var tOption = "";
	//获取打印机名称
	function getPrintName(){
	    util.showLoading("处理中...");
        $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=5bf4bde793a14c7b84e6fae933515f63",
			    data: "",
				success: function(data){console.log(data);
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempOption = "";
								tOption="";
								tOption = "<option value=''>--请选择--</option>";
						
							for(var i=0;i<rccList.length;i++){
							    tempOption = tempOption + "<option value='"+rccList[i].printName+"'>"+rccList[i].printName+"</option>" ;
							    	tOption = tOption + "<option value='"+rccList[i].printName+"'>"+rccList[i].printName+"</option>";
							}
							$("#paraMap1_PTD_LABLE_ADDRESS").empty();
             				$("#paraMap1_PTD_LABLE_ADDRESS").append("<option value=''>--请选择--</option>");
             				$("#paraMap1_PTD_LABLE_ADDRESS").append(tempOption);
             				//setChosen();
             				$("#paraMap1_PTD_LABLE_ADDRESS").trigger("chosen:updated");
             				$("#paraMap1_PTD_LIST_ADDRESS2").empty();
             				$("#paraMap1_PTD_LIST_ADDRESS2").append("<option value=''>--请选择--</option>");
             				$("#paraMap1_PTD_LIST_ADDRESS2").append(tempOption);
             				//setChosen();
             				$("#paraMap1_PTD_LIST_ADDRESS2").trigger("chosen:updated");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
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
			    data: "",
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
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	//保存回填值
	function addPack(){
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
            var tempLe = 0;
            parentWindow.$("input[name='myPackLevel']").each(function(){
                if($(this).val()==$.trim($("#paraMap1_PTD_LEVEL").val())){
                     tempLe=1;
                     return false;
                }
            })
            if(tempLe==1){
                utilsFp.confirmIcon(3,"","","", "<dict:lang value="包装层级已存在" />",0,"260","");
                return;
            }
            var tempNa = 0;
            parentWindow.$("input[name='levelName']").each(function(){
                if($(this).val()==$.trim($("#paraMap1_PTD_LEVEL_NAME").val())){
                     tempNa=1;
                     return false;
                }
            })
            if(tempNa==1){
                utilsFp.confirmIcon(3,"","","", "<dict:lang value="层级名称已存在" />",0,"260","");
                return;
            }
            if($("#paraMap1_PTD_LABLE_PRINT_1:checked").val()!=undefined){
			   if($("#paraMap1_PTD_LABLE_ADDRESS").val()==""){
			         utilsFp.confirmIcon(3,"","","", "<dict:lang value="标签打印地址不能为空" />",0,"260","");
			      
			       return;
			   }
			}
			if($("#paraMap1_PTD_LIST_PRINT_1:checked").val()!=undefined){
			   if($("#paraMap1_PTD_LIST_ADDRESS2").val()==""){
			         utilsFp.confirmIcon(3,"","","", "<dict:lang value="清单打印地址不能为空" />",0,"260","");
			      
			       return;
			   }
			}
            
            var tempDiv="<div id='hidDiv_"+packLevel+"' style='display:none;'>"+
					"<input name='myPackLevel' type='hidden' value='"+$("#paraMap1_PTD_LEVEL").val()+"'>"+
					"<input name='levelName' type='hidden' value='"+$("#paraMap1_PTD_LEVEL_NAME").val()+"'>"+
					"<input name='capacity' type='hidden' value='"+$("#paraMap1_PTD_CAPACITY").val()+"'>"+
					"<input name='lablePrint' type='hidden' value='"+$("#paraMap1_PTD_LABLE_PRINT_1:checked").val()+"'>"+
					"<input name='labelTemp' type='hidden' value='"+$("#paraMap1_PTD_LABLE_TEMPLATE").val()+"'>"+
					"<input name='labelRule' type='hidden' value='"+$("#paraMap1_PTD_LABLE_RULE").val()+"'>"+
					"<input name='isOnline' type='hidden' value='"+$("#paraMap1_PTD_IS_ONLINE_1:checked").val()+"'>"+
					"<input name='listPrint' type='hidden' value='"+$("#paraMap1_PTD_LIST_PRINT_1:checked").val()+"'>"+
					"<input name='listTemp' type='hidden' value='"+$("#paraMap1_PTD_LIST_TEMPLATE").val()+"'>"+
					"<input name='labelAddress' type='hidden' value='"+$("#paraMap1_PTD_LABLE_ADDRESS").val()+"'>"+
					"<input name='listAddress' type='hidden' value='"+$("#paraMap1_PTD_LIST_ADDRESS2").val()+"'>"+
					"<input name='memo' type='hidden' value='"+$("#paraMap1_PTD_MEMO").val()+"'>"+
					"</div>";
			var  isLablePrint;
			var isListPrint;
			var isIsOnline;
			var isTitleFlag;
			var meo;
			if($("#paraMap1_PTD_LABLE_PRINT_1:checked").val()==undefined){
			    isLablePrint = "N";
			}else{
			    isLablePrint = "Y";
			}
			if($("#paraMap1_PTD_LIST_PRINT_1:checked").val()==undefined){
			    isListPrint = "N";
			}else{
			    isListPrint = "Y";
			}
			if($("#paraMap1_PTD_TITLE_FLAG_1:checked").val()==undefined){
			    isTitleFlag = "N";
			}else{
			    isTitleFlag = "Y";
			}
			if($("#paraMap1_PTD_MEMO").val()==undefined){
			    meo = "";
			}else{
			    meo=$("#paraMap1_PTD_MEMO").val();
			}
			
			
			if($("#paraMap1_PTD_IS_ONLINE_1:checked").val()==undefined){
			    isIsOnline = "N";
			}else{
			    isIsOnline = "Y";
			}
			var ruleName;
			if($("#paraMap1_PTD_LABLE_RULE").val()==""){
			    ruleName = "";
			}else{
			    ruleName = $("#paraMap1_PTD_LABLE_RULE").find("option:selected").text();
			}
			var TemplateName;
			if($("#paraMap1_PTD_LABLE_TEMPLATE").val()==""){
			    TemplateName = "";
			}else{
			    TemplateName = $("#paraMap1_PTD_LABLE_TEMPLATE").find("option:selected").text();
			}
			var ptdLableTemplate = "<select id='ptdLableTemplate_"+(packLevel+1)+"' class='selector_"+(packLevel+1)+"' name='labelTemp' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ lableTemplate +"</select>";
			var ptdLableRule = "<select id='ptdLableRule_"+(packLevel+1)+"' class='selec_"+(packLevel+1)+"' name='labelRule' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ lableRule +"</select>";
			var ptdListTemplate = "<select id='ptdListTemplate_"+(packLevel+1)+"' class='sel_"+(packLevel+1)+"' name='listTemp' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ lableTemplate +"</select>";
			 var labeAddress = "<select id='labeAddress"+(packLevel+1)+"' class='Address_"+(packLevel+1)+"' name='labelAddress' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ tOption +"</select>";
			 var listAddress2= "<select id='listAddress2"+(packLevel+1)+"' class='Address2_"+(packLevel+1)+"' name='listAddress' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ tOption +"</select>";
			 var createRuleSel = "<select id='createRule_"+(packLevel+1)+"' class='selector2_"+(packLevel+1)+"' name='createRule' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:140px;'>"+ createRuleOption +"</select>";
			 
			 
			
			var isCheckOpt = $("#isCheck").html();
            var isCheckOption ="<option value='Y'>"+"是"+"</option>";
            //var isCheckOption = isCheckOpt.substring(isCheckOpt.indexOf('<option'));
             isCheckOption = isCheckOption + "<option value='N'>"+"否"+"</option>";
            
            var isOnline = "<select id='isOnline_"+(packLevel+1)+"' class='isCheck_"+(packLevel+1)+"' name='isOnline' class=' input isSubmit _VAL_OjbsData dept_select' style='width:80px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
            var lablePrint = "<select id='lablePrint_"+(packLevel+1)+"' class='isSel_"+(packLevel+1)+"' name='lablePrint' class=' input isSubmit _VAL_OjbsData dept_select' style='width:80px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
            var listPrint = "<select id='listPrint_"+(packLevel+1)+"' class='CheckSel_"+(packLevel+1)+"' name='listPrint' class=' input isSubmit _VAL_OjbsData dept_select' style='width:80px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
            var titleFlagSel = "<select id='titleFlagSel_"+(packLevel+1)+"' class='titleFlagSel_"+(packLevel+1)+"' name='titleFlagSel' class=' input isSubmit _VAL_OjbsData dept_select' style='width:80px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
			var frameFlagSel = "<select id='frameFlagSel_"+(packLevel+1)+"' class='frameFlagSel_"+(packLevel+1)+"' name='frameFlagSel' class=' input isSubmit _VAL_OjbsData dept_select' style='width:90px;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
			var ptdCodeSel="<select id='ptdCodeSel_"+(packLevel+1)+"' class='selector3_"+(packLevel+1)+"' name='ptdCode' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:90px;'><option value=''>--请选择--</option><option value='code39'>code39</option><option value='code93'>code93</option><option value='EAN8'>EAN8</option><option value='EAN13'>EAN13</option><option value='UPC_E'>UPC_E</option><option value='UPC_A'>UPC_A</option><option value='qrcode'>qrcode</option><option value='pdf47'>pdf47</option></select>";
			
			var tempHtml = "<tr id='tr_"+packLevel+"'>"+
				"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(parentWindow.$("#addPackInfo tr").length+1)+"</td>"+
				"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/><input name='memo' type='hidden' value='"+meo+"'></td>"+
				"<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: center;'>"+$("#paraMap1_PTD_LEVEL").val()+"<input name='myPackLevel' type='hidden' value='"+$("#paraMap1_PTD_LEVEL").val()+"'></td>"+
				"<td class='datagrid-cell datagrid-cell-5' style='width:130px;text-align: center;'><input type='text' style='width: 120px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='PLAN_NUM_"+(packLevel+1)+"' name='levelName' value='"+$("#paraMap1_PTD_LEVEL_NAME").val()+"'/></td>"+
				"<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;'><input type='text' style='width: 80px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='GIFT_NUM_"+(packLevel+1)+"' name='capacity' value='"+$("#paraMap1_PTD_CAPACITY").val()+"'/></td>"+
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
				//isLablePrint
				//<input name='labelRule' type='hidden' value='"+$("#paraMap1_PTD_LABLE_RULE").val()+"'>
				//<input name='listTemp' type='hidden' value='"+$("#paraMap1_PTD_LIST_TEMPLATE").val()+"'>
				//<input name='labelTemp' type='hidden' value='"+$("#paraMap1_PTD_LABLE_TEMPLATE").val()+"'>
				//<input name='isOnline' type='hidden' value='"+$("#paraMap1_PTD_IS_ONLINE_1:checked").val()+"'>
				//<input name='labelAddress' type='hidden' value='"+$("#paraMap1_PTD_LABLE_ADDRESS").val()+"'>
				//<input name='listAddress' type='hidden' value='"+$("#paraMap1_PTD_LIST_ADDRESS2").val()+"'>
				//<input name='lablePrint' type='hidden' value='"+$("#paraMap1_PTD_LABLE_PRINT_1:checked").val()+"'>
				//<input name='listPrint' type='hidden' value='"+$("#paraMap1_PTD_LIST_PRINT_1:checked").val()+"'>
			//parentWindow.$("#addPackInfo").append(tempDiv);
			var po=$("#paraMap1_PTD_LABLE_TEMPLATE").val();
    		parentWindow.$("#addPackInfo").append(tempHtml);
            parentWindow.$("#packLevel").val(packLevel);
            parentWindow.$(".selector_"+(packLevel+1)).val(po);
			parentWindow.$(".selector_"+(packLevel+1)).find("option[text='"+TemplateName+"']").attr("selected",true);
		    parentWindow.$(".selector_"+(packLevel+1)).trigger("chosen:updated");
		    
		    parentWindow.$(".sel_"+(packLevel+1)).val($("#paraMap1_PTD_LIST_TEMPLATE").val());
		    parentWindow.$(".sel_"+(packLevel+1)).trigger("chosen:updated");
		    
		    
		    parentWindow.$(".selec_"+(packLevel+1)).val($("#paraMap1_PTD_LABLE_RULE").val());
		    parentWindow.$(".selec_"+(packLevel+1)).trigger("chosen:updated");
		    
		     parentWindow.$(".Address_"+(packLevel+1)).val($("#paraMap1_PTD_LABLE_ADDRESS").val());
		    parentWindow.$(".Address_"+(packLevel+1)).trigger("chosen:updated");
		    
		     parentWindow.$(".Address2_"+(packLevel+1)).val($("#paraMap1_PTD_LIST_ADDRESS2").val());
		    parentWindow.$(".Address2_"+(packLevel+1)).trigger("chosen:updated");
		    
		    parentWindow.$(".isCheck_"+(packLevel+1)).val(isIsOnline);
		    parentWindow.$(".isCheck_"+(packLevel+1)).trigger("chosen:updated");
		    
		    parentWindow.$(".isSel_"+(packLevel+1)).val(isLablePrint);
		    parentWindow.$(".isSel_"+(packLevel+1)).trigger("chosen:updated");
		    
		    parentWindow.$(".CheckSel_"+(packLevel+1)).val(isListPrint);
		    parentWindow.$(".CheckSel_"+(packLevel+1)).trigger("chosen:updated");
		    
		    parentWindow.$(".titleFlagSel_"+(packLevel+1)).val(isTitleFlag);
		    parentWindow.$(".titleFlagSel_"+(packLevel+1)).trigger("chosen:updated");
		    
		    parentWindow.$(".selector2_"+(packLevel+1)).val($("#paraMap1_PTD_CREATE_RULE").val());
		    parentWindow.$(".selector2_"+(packLevel+1)).trigger("chosen:updated");

            parentWindow.mySetChosen();//设置下拉框样式
            parentWindow.$("#ptdLableTemplate").chosen({search_contains: true});
            parentWindow.$("#ptdLableTemplate_chosen .chosen-search").css("display","block");
            parentWindow.$("#ptdLableRule").chosen({search_contains: true});
            parentWindow.$("#ptdLableRule_chosen .chosen-search").css("display","block");
            parentWindow.$("#ptdListTemplate").chosen({search_contains: true});
            parentWindow.$("#ptdListTemplate_chosen .chosen-search").css("display","block");
			parentWindow.$("#ptdLableTemplate_"+(packLevel+1)+"_chosen").attr("style","width:150px;");
            parentWindow.$("#ptdLableRule_"+(packLevel+1)+"_chosen").attr("style","width:150px;");						
            parentWindow.$("#ptdListTemplate_"+(packLevel+1)+"_chosen").attr("style","width:150px;");	       
            
            
    		
			packLevel++;
		
			parentWindow.clickTr("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var tableTrJs = parentWindow.$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
			parentWindow.defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
	        //parentWindow._tongLineColor(tableTrJs);
            closeCurrentWindow();
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


$('#paraMap1_PTD_LEVEL').bind('keyup', function () {
            			console.log("Ssss");
	            var calwStart=$("#paraMap1_PTD_LEVEL");
             if(!/^[1-9]\d*$/.test(this.value)){
             	this.value='';
             	_alertValMsg($('#paraMap1_PTD_LEVEL'),"<dict:lang value="请输入正整数" />");
             }
         });



</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
