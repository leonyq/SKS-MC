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
			    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 310px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="fe2f562eab2645eea5c2c4131957c06c" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="fe2f562eab2645eea5c2c4131957c06c" />
	<input type="hidden" name="fe2f562eab2645eea5c2c4131957c06c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'4b7f9ba9615f44e7bc614da15c0646e3'" />
		<s:set name="_$formId_1" value="'fe2f562eab2645eea5c2c4131957c06c'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width: 100px;" /><span class="dot">*</span><bu:uitn colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 110px;"/><span class="dot">*</span><bu:uitn colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<!--<td class="name" /><bu:uitn colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_AUTO_EXAMINE}" formIndex="1" /></bu:td>
			-->
			
			<td style="width: 90px;text-align: right;">
				<bu:uitn colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" />
		        </td>
			<td>&nbsp;
				<bu:ui colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" />
				&#x3000;
				<bu:uitn colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" />
				<bu:ui colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" />
			</td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="fe2f562eab2645eea5c2c4131957c06c" formIndex="1" />
									
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
	<bu:submit viewId="4b7f9ba9615f44e7bc614da15c0646e3" />
	<bu:script viewId="4b7f9ba9615f44e7bc614da15c0646e3" />
	<!-- js初始化方法 -->


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
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
			if(!val.valDataBaseSetData()){
        		return ;
        	}
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			//utilsFp.alert(msg);
			utilsFp.confirmIcon(3,"","","", msg,0,"","");
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$("#paraMapObj_QSC_TEST_STEP").trigger("chosen:updated");
			$("#paraMapObj_QSC_SAMPLE_TYPE").trigger("chosen:updated");
			$("#paraMapObj_QSC_PRICESS_MODE").trigger("chosen:updated");
			$("#paraMapObj_QSC_CREATE_MODE").trigger("chosen:updated");
			$("#paraMapObj_QSC_DIVIDE_MODE").trigger("chosen:updated");
			$("#paraMapObj_QSC_JUDGE_MODE").trigger("chosen:updated");	
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
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
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
<script>
           if($("#paraMapObj_QSC_CTRL_FLAG_1").attr("checked")=="checked"){
       	   }else{
       	        $("#paraMapObj_QSC_STRICT_NORMAL").val("0");
                $("#paraMapObj_QSC_STRICT_NORMAL").attr("readonly", "readonly");
       	        $("#paraMapObj_QSC_NORMAL_RELAX").val("0");
                $("#paraMapObj_QSC_NORMAL_RELAX").attr("readonly", "readonly");
                $("#paraMapObj_QSC_RELAX_NORMAL").val("0");
                $("#paraMapObj_QSC_RELAX_NORMAL").attr("readonly", "readonly");
                $("#paraMapObj_QSC_STRICT_NUM").val("0");
                $("#paraMapObj_QSC_STRICT_NUM").attr("readonly", "readonly");
                $("#paraMapObj_QSC_STRICT_TOTAL").val("0");
                $("#paraMapObj_QSC_STRICT_TOTAL").attr("readonly", "readonly");
       	   }
       
       $("#paraMapObj_QSC_CTRL_FLAG_1").on("click",function(){
       	   var check=$("#paraMapObj_QSC_CTRL_FLAG_1").attr("checked") ;
       	   if(check=="checked"){
       	        //勾
       	        $("#paraMapObj_QSC_STRICT_NORMAL").val("");
       	        $("#paraMapObj_QSC_STRICT_NORMAL").removeAttr("readonly");
       	        $("#paraMapObj_QSC_NORMAL_RELAX").val("");
       	        $("#paraMapObj_QSC_NORMAL_RELAX").removeAttr("readonly");
       	        $("#paraMapObj_QSC_RELAX_NORMAL").val("");
       	        $("#paraMapObj_QSC_RELAX_NORMAL").removeAttr("readonly");
       	        $("#paraMapObj_QSC_STRICT_NUM").val("");
       	        $("#paraMapObj_QSC_STRICT_NUM").removeAttr("readonly");
       	        $("#paraMapObj_QSC_STRICT_TOTAL").val("");
       	        $("#paraMapObj_QSC_STRICT_TOTAL").removeAttr("readonly");
       	   }else{
       	        //未勾
       	        $("#paraMapObj_QSC_STRICT_NORMAL").val("0");
       	        $("#paraMapObj_QSC_STRICT_NORMAL").attr("readonly", "readonly");
       	        $("#paraMapObj_QSC_NORMAL_RELAX").val("0");
       	        $("#paraMapObj_QSC_NORMAL_RELAX").attr("readonly", "readonly");
       	        $("#paraMapObj_QSC_RELAX_NORMAL").val("0");
       	        $("#paraMapObj_QSC_RELAX_NORMAL").attr("readonly", "readonly");
       	        $("#paraMapObj_QSC_STRICT_NUM").val("0");
       	        $("#paraMapObj_QSC_STRICT_NUM").attr("readonly", "readonly");
       	        $("#paraMapObj_QSC_STRICT_TOTAL").val("0");
       	        $("#paraMapObj_QSC_STRICT_TOTAL").attr("readonly", "readonly");
       	   }
       });
       
              $('#paraMapObj_QSC_DIVIDE_MODE').on("change",function(){
       		$('#paraMapObj_QSC_DIVIDE_VALUE').val("");
       });
       
      $('#paraMapObj_QSC_DIVIDE_VALUE').change(function() {
			
			var divideModeVal = $.trim($("#paraMapObj_QSC_DIVIDE_MODE").val());
			if(divideModeVal=="2"){
			      if(!/^-?\d*\.?\d*$/.test(this.value)) {//    |(0\.\d*[1-9])
				this.value='';
				_alertValMsg($('#paraMapObj_QSC_DIVIDE_VALUE'), "<dict:lang value="该项只能为正整数或小数" />");
			      }
			}else{
			      if(!/^-?\d*$/.test(this.value)) {//  ^-?\d*$
				this.value=''; 
				_alertValMsg($('#paraMapObj_QSC_DIVIDE_VALUE'), "<dict:lang value="该项只能为正整数" />");
			      }
			}
			
		});
       
       function checkInfo(){
                       if($("#paraMapObj_QSC_CTRL_FLAG_1").attr("checked")=="checked"){
                                  var sn=$("#paraMapObj_QSC_STRICT_NORMAL").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(sn)&& !/^$/.test(sn) ){
                                         _alertValMsg($("#paraMapObj_QSC_STRICT_NORMAL"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(sn) ){
                                         _alertValMsg($("#paraMapObj_QSC_STRICT_NORMAL"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  var nr=$("#paraMapObj_QSC_NORMAL_RELAX").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(nr)&& !/^$/.test(nr) ){
                                         _alertValMsg($("#paraMapObj_QSC_NORMAL_RELAX"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(nr) ){
                                         _alertValMsg($("#paraMapObj_QSC_NORMAL_RELAX"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  var rn=$("#paraMapObj_QSC_RELAX_NORMAL").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(rn)&& !/^$/.test(rn) ){
                                         _alertValMsg($("#paraMapObj_QSC_RELAX_NORMAL"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(rn) ){
                                         _alertValMsg($("#paraMapObj_QSC_RELAX_NORMAL"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  var snum=$("#paraMapObj_QSC_STRICT_NUM").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(snum)&& !/^$/.test(snum) ){
                                         _alertValMsg($("#paraMapObj_QSC_STRICT_NUM"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(snum) ){
                                         _alertValMsg($("#paraMapObj_QSC_STRICT_NUM"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  var stotal=$("#paraMapObj_QSC_STRICT_TOTAL").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(stotal)&& !/^$/.test(stotal) ){
                                         _alertValMsg($("#paraMapObj_QSC_STRICT_TOTAL"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(stotal) ){
                                         _alertValMsg($("#paraMapObj_QSC_STRICT_TOTAL"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  if(stotal<snum){
                                         _alertValMsg($("#paraMapObj_QSC_STRICT_NUM"),"<dict:lang value="加严不合格批次不能大于加严计算批次" />");
                                         return false;                                          
                                  }
                        } 
                           
       }
       function editInfo(){
                        if(!val.valNullData()){
				return ;
			}
			
			if(!val.valOjbsData()){
				return ;
			}
        	if(!val.valDataBaseSetData()){
        		return ;
        	}
			
		
			
			var divideModeVal = $.trim($("#paraMapObj_QSC_DIVIDE_MODE").val());
			if(divideModeVal=="2"){
			      if(!/^-?\d*\.?\d*$/.test($('#paraMapObj_QSC_DIVIDE_VALUE').val())) {//    |(0\.\d*[1-9])
				$('#paraMapObj_QSC_DIVIDE_VALUE').val("");
				_alertValMsg($('#paraMapObj_QSC_DIVIDE_VALUE'), "<dict:lang value="该项只能为正整数或小数" />");
				return;
			      }
			}else{
			      if(!/^\+?[1-9][0-9]*$/.test($('#paraMapObj_QSC_DIVIDE_VALUE').val())) {//  ^-?\d*$
			$('#paraMapObj_QSC_DIVIDE_VALUE').val("");
				_alertValMsg($('#paraMapObj_QSC_DIVIDE_VALUE'), "<dict:lang value="该项只能为正整数" />");
				return;
			      }
			}
			
		
                        var flag=checkInfo();
                        if(flag!=false){
                          $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			  $DisInput.attr("disabled", false); 
                          document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=6d07fcc51eab49528608593b542cc741";
       
			  document.forms.editForm.submit();
			  isQuery = true;
			  $DisInput.attr("disabled", true);       
                        }
                        
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
