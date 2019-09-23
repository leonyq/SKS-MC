<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="辅料-查看详情" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	<style type="text/css">
		.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body style="background-color: #fff;">
	<div class="edit" sytle="margin-top: -55px;">
           <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
<jsp:param name="modelName" value="VIEW_TYPE_11" />
   <jsp:param name="location" value="editForm" />
		</jsp:include>
            <div class="hd" style="display:none;"></div>
			<div class="bd" style="border:none;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="<c:out value='${exeid}' />">
								<input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
								<input type="hidden" name="formId" value="<c:out value='${formId}' />">
								<input type="hidden" name="dataId" value="<c:out value='${dataId}' />">
								
		<bu:set name="paraMapObj" value="${dataId}" formId="e09e1f47e824490d80ba2717d25498d3" type="edit" />
	<div class="mod">		
  <div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:130px;border:none;">
	<table class="basic-table " id="table1" name="table1">
	<input type="hidden" name="formIds" value="e09e1f47e824490d80ba2717d25498d3" />
	<input type="hidden" name="e09e1f47e824490d80ba2717d25498d3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e48f5a7345ae4a2ab7ff6d9d60306d39'" />
		<s:set name="_$formId_1" value="'e09e1f47e824490d80ba2717d25498d3'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:87px;"/><bu:uitn colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name"  style="width:120px;"/><bu:uitn colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name"style="width:120px;"/><bu:uitn colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly" disabled="true"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span>条码规则</span></td>
			<td cssClass="dec" />&nbsp;<input type="text" style="width:230px;height:25px;" id="paraMapObj_TIN_BAR_RULE" class="isSubmit input _VAL_DATABASE readonly" readonly="readonly"></td>
			<td class="name" /><bu:uitn colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span>生成规则</span></td>
			<td cssClass="dec" />&nbsp;<input type="text" style="width:230px;height:25px;" id="paraMapObj_TIN_CREATE_RULE" class="isSubmit input _VAL_DATABASE readonly" readonly="readonly"></td>
		</tr>
	</table>
	</div>

	<DIV id="content1">
	<div class="mod-hd" >		
        <h3 class="tit"><dict:lang value="红胶/锡膏" /></h3>	
        </div>
        <div class="mod-hd" style="height:130px;border:none;">	
	<table class="basic-table" id="table2" name="table2">
		<tr>
			<td class="name"  style="width:120px;"/><bu:uitn colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
					<td class="name"  style="width:150px;"/><bu:uitn colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>

    	</tr>
		<tr>
			<td class="name" style="width:120px;"/><bu:uitn colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
       			<td class="name"  style="width:150px;"/><bu:uitn colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
       
       </tr>
		<tr>
			<td class="name"style="width:120px;"/><bu:uitn colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name"  style="width:150px;"/><bu:uitn colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly" disabled="true"/></bu:td>
		</tr>
		<tr>
				
			<td class="name"  style="width:120px;"/><bu:uitn colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
				<td class="name"  style="width:150px;"/><bu:uitn colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
		        <td class="name" style="width:120px;"/><bu:uitn colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
				<td class="name"  style="width:150px;"/><bu:uitn colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly" /></bu:td>
		</tr>
		
	</table>
	</div>
	</div>
	
	<DIV id="content2" style="display:none">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="钢网/刮刀" /></h3>	
 	</div>
  	<div class="mod-hd" style="height:80px;border:none;">
	<table class="basic-table" id="table3" name="table3">
		
		
		<tr>
			<td class="name" /><bu:uitn colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name" /><bu:uitn colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name" /><bu:uitn colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
			<td class="name" /><bu:uitn colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec" colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" dataId="${dataId}" formIndex="1"  cssClass="readonly" readonly="readonly"/></bu:td>
		</tr>
	</table>
	</div>
	</div>
			<bu:jsVal formId="e09e1f47e824490d80ba2717d25498d3" formIndex="1" />
									</form>
			</div>
		
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			var select_id;

			$(function(){
                 getInfo();
                 getRuleInfo();
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
  				 //alert(${paraMapObj.ASSISTANTTOOLTYPE});
				 select_id = $("#paraMapObj_ASSISTANTTOOLTYPE option:selected").val();
				 //alert(select_id);
				 //select_flag_id = '${paraMapObj.LEAD_FLAG}';
				 if(select_id=="2"||select_id=="3"){
				 	document.getElementById("content1").style.display="none";
				 	document.getElementById("content2").style.display="";
				 }else{
					document.getElementById("content2").style.display="none";
					document.getElementById("content1").style.display="";
				 }
				 $('.dialog-bd',parent.document).css('background-color','#fff');
			});
		function getInfo(){
    	    var CLAS = "${dataId}";
    	    var dataAuth="${param.dataAuthVal}";
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=61387db87c2d4f009ec8584c7961c4c1";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {
                "CLAS" : CLAS,
                "dataAuth" : dataAuth
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	        console.log(data);
    	            if(null==data){
    	                return;
    	            }
    	            if(null!=data.ajaxList){
    	                if(data.ajaxList.length>0){
    	                     var list = eval(data.ajaxList);
    	                     if(list[0].CCC_CONFIGURE_NAME==null)list[0].CCC_CONFIGURE_NAME="";
		                	$("#paraMapObj_TIN_CREATE_RULE").val(list[0].CCC_CONFIGURE_NAME);
    	                }
    	                
    	            }
    	        },
    	        error:function(msg){
    	            
    	            
    	        }
    	    });
    	}
    		function getRuleInfo(){
    	    var CLAS = "${dataId}";
    	    var dataAuth="${param.dataAuthVal}";
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=6ad1eb6ae46d42bf8f1571dd83f84be9";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {
                "CLAS" : CLAS,
                "dataAuth" : dataAuth
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	        console.log(data);
    	            if(null==data){
    	                return;
    	            }
    	            if(null!=data.ajaxList){
    	             if(data.ajaxList.length>0){
     	                 var list = eval(data.ajaxList);
    	                if(list[0].TBR_NAME==null)list[0].TBR_NAME="";
		            	$("#paraMapObj_TIN_BAR_RULE").val(list[0].TBR_NAME);   	                 
    	             }
    	   
    	            }
    	        },
    	        error:function(msg){
    	            
    	            
    	        }
    	    });
    	}
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,
		    'paraMap.formIndex':formIndex,
		    'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,
		    'paraMap.trIndex':curRowSeq,
		    'paraMap.formidFirstId':formidFirstId,
		    'paraMap.subFormId':subFormId,
		    'paraMap.subRelColId':subRelColId,
		    'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
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
		}
		
		function init(){
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
			
		}
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
