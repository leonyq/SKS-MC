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
                <div style="margin-left:10px;">
                 		<div class="save-close" style="display:none;" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
			    	        <button type="button" onclick="editFeeder(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 234px;">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
		   				<jsp:param name="location" value="editForm" />
		            </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="90caa73200734f6c938d5aa280a9664a" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="90caa73200734f6c938d5aa280a9664a" />
	<input type="hidden" name="90caa73200734f6c938d5aa280a9664a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c4965d60479e42cc8a5b906cf40c8aa8'" />
		<s:set name="_$formId_1" value="'90caa73200734f6c938d5aa280a9664a'" />
		<s:set name="_$type" value="'edit'" />
	<tr>
			<td class="name"  style="width:95px;"/><bu:uitn colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a"  /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="2" style="width:200px;"/></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec"  colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec"  colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
		</tr>
		
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
        	<td class="name" /><bu:uitn colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a"  colspan="7"><bu:ui colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
        </tr>
		
		<tr>
		    <td class="name" /><bu:uitn colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		
	        <td class="name" /><bu:uitn colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		
	        <td class="name" /><bu:uitn colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		
		<tr>
		    <td class="name" /><bu:uitn colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec"  colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
            <td class="name" /><bu:uitn colNo="TCS_USE_TIME" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_USE_TIME" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_USE_TIME" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		    	
		    <td class="name" /><bu:uitn colNo="TCS_REMIND_NUM" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_REMIND_NUM" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_REMIND_NUM" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
		</tr>
		
		<tr>
			 <td class="name" /><bu:uitn colNo="TCS_MAX_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_MAX_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_MAX_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		    	
		    <td class="name" /><bu:uitn colNo="TCS_MT_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_MT_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_MT_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCS_REMIND_DAY" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_REMIND_DAY" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_REMIND_DAY" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		<!--<tr>
			<td class="name" style="100px;"/><span class="dot">*</span><bu:uitn colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec-self" colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec-self" colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec-self" colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
		
	</table>
			<bu:jsVal formId="90caa73200734f6c938d5aa280a9664a" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>	
                <bu:submit viewId="c4965d60479e42cc8a5b906cf40c8aa8" />
		<bu:script viewId="c4965d60479e42cc8a5b906cf40c8aa8" />
	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
			//if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$("#paraMapObj_TCT_TYPE").trigger("chosen:updated");
			$("#paraMapObj_TCF_MT_TYPE").trigger("chosen:updated");
			getInfo();
		}
				
		
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			var tct_type=$("#paraMapObj_TCT_TYPE").val();
			if(tct_type==1){
				$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
				$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
			}else if(tct_type==2){
				$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
			}else if(tct_type==3){
				$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
			}
		
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		
		//$('#paraMapObj_TCF_FEEDER_SN').bind('keyup', function () {
	     //		$("#paraMapObj_TCT_TYPE option:eq(0)").attr("selected","selected");
        //	 });
		$("#paraMapObj_TCT_TYPE").change(function(){
			var tct_type=$(this).val();
			var sn_val=$("#paraMapObj_TCF_FEEDER_SN").val();
			if(sn_val!=""){
				if(tct_type==0){
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				}else if(tct_type==1){
					//单(左)通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
					var sn_val_left=sn_val+"A";
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
				
				}else if(tct_type==2){
					//右通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
					var sn_val_left=sn_val+"L";
					var sn_val_right=sn_val+"R";
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val(sn_val_right);
				
				
				}else if(tct_type==3){
					//中间通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
					var sn_val_left=sn_val+"L";
					var sn_val_right=sn_val+"R";
					var sn_val_middle=sn_val+"M";
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val(sn_val_right);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val(sn_val_middle);
				
				}
			}else if(sn_val==""){
				if(tct_type==0){
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				}else if(tct_type==1){
					//单(左)通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				}else if(tct_type==2){
					//右通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				}else if(tct_type==3){
					//中间通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				
				}
			}
		});
	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>


function editFeeder(thisObj){
                        $("#paraMapObj_TCF_FEEDER_SN").addClass('_VAL_NULL');
                        $("#paraMapObj_TCS_SPEC").addClass('_VAL_NULL');
                        $("#paraMapObj_TCT_TYPE").addClass('_VAL_NULL');
                        $("#paraMapObj_TCT_MAX_COUNT").addClass('_VAL_NULL');
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
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                       document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=6691bc4ca1a242adaed0f2ee658b4671";
       
			document.forms.editForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
}

$(function(){
    
    
    getInfo();
})

function getInfo(){
    var ID = "${dataId}";
    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=cbe9804972184a0da995b03f4015844d";//VM-FEEDER信息修改 操作功能 获取信息
    $.ajax({
                   type:"POST",
                   dataType:"json",
                   data:{
                       'ID':ID
                   },
                url:getInfoUrl,
                   
                  success:function(data){
                  	    if(null==data){
                  	        return;
                  	    }
                  	    console.log(data.ajaxList);
                  	    if(null!=data.ajaxList){
                  	    
                  	        var list = eval(data.ajaxList);
                  	        
                            if(list[0].FEEDER_TYPE=="0"){
                                  $("#paraMapObj_ADD_TYPE").val("1");
                                  $("#paraMapObj_ADD_TYPE").trigger("chosen:updated");
                            }else{
                                $("#paraMapObj_ADD_TYPE").val("2");
                                  $("#paraMapObj_ADD_TYPE").trigger("chosen:updated");
                            }
                            /*
                            if(list[0].TCS_SPEC=="6"){
                                  
                                  $("#paraMapObj_TCS_SPEC").val("6");
                                  $("#paraMapObj_TCS_SPEC").trigger("chosen:updated");
                            }else{
                                
                                  $("#paraMapObj_TCS_SPEC").val("12");
                                  $("#paraMapObj_TCS_SPEC").trigger("chosen:updated");
                            }
                            
                            if(list[0].TCT_TYPE=="1"){
                                  $("#paraMapObj_TCT_TYPE").val("1");
                                  $("#paraMapObj_TCT_TYPE").trigger("chosen:updated");
                            }else if(list[0].TCT_TYPE=="2"){
                                $("#paraMapObj_TCT_TYPE").val("2");
                                  $("#paraMapObj_TCT_TYPE").trigger("chosen:updated");
                            }else{
                                $("#paraMapObj_TCT_TYPE").val("3");
                                  $("#paraMapObj_TCT_TYPE").trigger("chosen:updated");
                            }
                              	        
                  	        $("#paraMapObj_TCF_FEEDER_SN").val(list[0].TCF_FEEDER_SN);
                            $("#paraMapObj_TCF_LEFT_CHANNEL_SN").val(list[0].TCF_LEFT_CHANNEL_SN);
                            $("#paraMapObj_TCF_FEEDER_ID").val(list[0].TCF_FEEDER_ID);
                            $("#paraMapObj_TCF_LEFT_CHANNEL_SN").val(list[0].TCF_LEFT_CHANNEL_SN);
                            $("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val(list[0].TCF_RIGHT_CHANNEL_SN);
                            $("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val(list[0].MIDDLE_CHANNEL_SN);
                  	        $("#paraMapObj_TCT_MAX_COUNT").val(list[0].TCT_MAX_COUNT);
                            $("#paraMapObj_TCS_USE_TIME").val(list[0].TCS_USE_TIME);
                            $("#paraMapObj_TCS_REMIND_NUM").val(list[0].TCS_REMIND_NUM);
                            $("#paraMapObj_TCS_MAX_CYCLE").val(list[0].TCS_MAX_CYCLE);
                            $("#paraMapObj_TCS_MT_CYCLE").val(list[0].TCS_MT_CYCLE);
                            $("#paraMapObj_TCS_REMIND_DAY").val(list[0].TCS_REMIND_DAY);
                            */

                  	    }
                  	},
                  	error:function(){
                  	    alert("S");
                  	}
                   
               });
    
}

$('#paraMapObj_TCT_MAX_COUNT').bind('keyup', function () {
	var calwStart=$("#paraMapObj_TCT_MAX_COUNT");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_TCT_MAX_COUNT'),"<dict:lang value="该项只能为正整数" />");
             }
         });		

    $('#paraMapObj_TCS_USE_TIME').bind('keyup', function () {
	var calwStart=$("#paraMapObj_TCS_USE_TIME");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_TCS_USE_TIME'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
    $('#paraMapObj_TCS_REMIND_NUM').bind('keyup', function () {
	var calwStart=$("#paraMapObj_TCS_REMIND_NUM");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_TCS_REMIND_NUM'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
    $('#paraMapObj_TCS_MAX_CYCLE').bind('keyup', function () {
	var calwStart=$("#paraMapObj_TCS_MAX_CYCLE");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_TCS_MAX_CYCLE'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
    $('#paraMapObj_TCS_MT_CYCLE').bind('keyup', function () {
	var calwStart=$("#paraMapObj_TCS_MT_CYCLE");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_TCS_MT_CYCLE'),"<dict:lang value="该项只能为正整数" />");
             }
         });
    $('#paraMapObj_TCS_REMIND_DAY').bind('keyup', function () {
	var calwStart=$("#paraMapObj_TCS_REMIND_DAY");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_TCS_REMIND_DAY'),"<dict:lang value="该项只能为正整数" />");
             }
         });
</script>
<bu:submit viewId="c4965d60479e42cc8a5b906cf40c8aa8" />
<bu:script viewId="c4965d60479e42cc8a5b906cf40c8aa8" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>