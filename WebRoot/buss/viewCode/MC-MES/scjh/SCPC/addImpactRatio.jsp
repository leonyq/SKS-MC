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
			    </div>
			   
			</div>
			<div class="bd" style="height:280px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="334ae8dac2684a3289964a13b26049cd" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="334ae8dac2684a3289964a13b26049cd" />
	<input type="hidden" name="334ae8dac2684a3289964a13b26049cd" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ff3ae39b98664c09bd39879bc92823fc'" />
		<s:set name="_$formId_1" value="'334ae8dac2684a3289964a13b26049cd'" />
		<s:set name="_$type" value="'add'" />
		<tr >
			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="PPQ_PRODUCT_STEP" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" style="width:50px;" colNo="PPQ_PRODUCT_STEP"  formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_PRODUCT_STEP" formId="334ae8dac2684a3289964a13b26049cd" value="%{PPQ_PRODUCT_STEP}" formIndex="1" /></bu:td>
		</tr>
		<tr >
			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="PPQ_AREA_SN" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" style="width:50px;" colNo="PPQ_AREA_SN"  formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_AREA_SN" formId="334ae8dac2684a3289964a13b26049cd" value="%{PPQ_AREA_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_DEVICE_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_DEVICE_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;"  colNo="PPQ_DEVICE_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" value="%{PPQ_DEVICE_QUOTIETY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_MANPOWER_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_MANPOWER_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;"  colNo="PPQ_MANPOWER_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" value="%{PPQ_MANPOWER_QUOTIETY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_EFFICIENCY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_EFFICIENCY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;"  colNo="PPQ_EFFICIENCY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" value="%{PPQ_EFFICIENCY_QUOTIETY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_QUALITY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_QUALITY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;"  colNo="PPQ_QUALITY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" value="%{PPQ_QUALITY_QUOTIETY}" formIndex="1" /></bu:td>
		</tr>
			<tr >
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_DUAL_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec"  colNo="PPQ_DUAL_QUOTIETY"  formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_DUAL_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" value="%{PPQ_DUAL_QUOTIETY}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="334ae8dac2684a3289964a13b26049cd" formIndex="1" />
				
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
    <script type="text/javascript">
       $('#paraMap1_PPQ_DEVICE_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMap1_PPQ_DEVICE_QUOTIETY");
             if(!/^[0]+([.]{1}[0-9]{0,2})?$|^1$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_PPQ_DEVICE_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
             }
         });
         $('#paraMap1_PPQ_MANPOWER_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMap1_PPQ_MANPOWER_QUOTIETY");
             if(!/^[0]+([.]{1}[0-9]{0,2})?$|^1$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_PPQ_MANPOWER_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
             }
         });
         $('#paraMap1_PPQ_EFFICIENCY_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMap1_PPQ_EFFICIENCY_QUOTIETY");
             if(!/^[0]+([.]{1}[0-9]{0,2})?$|^1$/.test(this.value)){
             ///^[0-9]+([.]{1}[0-9]{0,2})?$/
             //^[0]+(.[0-9]{0,2})?$|^1
             	this.value='';
               
             	_alertValMsg($('#paraMap1_PPQ_EFFICIENCY_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
             }
         });
         $('#paraMap1_PPQ_QUALITY_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMap1_PPQ_QUALITY_QUOTIETY");
             if(!/^[0]+([.]{1}[0-9]{0,2})?$|^1$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_PPQ_QUALITY_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
             }
         });
           $('#paraMap1_PPQ_DUAL_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMap1_PPQ_DUAL_QUOTIETY");
             if(!/^[1]+([.]{1}[0-9]{0,2})?$|^2$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_PPQ_DUAL_QUOTIETY'),"<dict:lang value="系数大于1小于2以及小数不超过两位" />");
             }
         })
         /*
         function getInfos(){
            var wmsOption;
            var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=5efaee985dac4b19b1f2c69d04cc5b19";
             $.ajax({
                 type:"post",
                 dataType:"json",
                 data:"",
                 url:loadItemUrl,
                 success:function(data){
                     if(null==data){
                         return;
                     }
                     if(null!=data.ajaxList){
                         var list = eval(data.ajaxList);
                         $("#paraMap1_PPQ_PRODUCT_STEP").empty();
                         $("#paraMap1_PPQ_PRODUCT_STEP").append("<option value=''>--请选择--</option>");
                         for(var i=0;i<list.length;i++){
                            wmsOption = "<option value='"+list[i].KEY+"'>"+list[i].VAL+"</option>"; 
                            $("#paraMap1_PPQ_PRODUCT_STEP").append(wmsOption);
                         }
                         $("#paraMap1_PPQ_PRODUCT_STEP").each(function(){
            	    	        $(this).find("Option").eq("").prop("selected",true);
            	    	    })
                         $("#paraMap1_PPQ_PRODUCT_STEP").trigger("chosen:updated");
                     }
                 },
                 error:function(msg){
                     utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                 }
             })
             
         }
         */
         var isQuery = false;
         function add(thisObj){
		 
			isQuery = false;
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
            if($("#paraMap1_PPQ_QUALITY_QUOTIETY").val()=="0"){
                _alertValMsg($('#paraMap1_PPQ_QUALITY_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
                 return ;
            }
             if($("#paraMap1_PPQ_DEVICE_QUOTIETY").val()=="0"){
                _alertValMsg($('#paraMap1_PPQ_DEVICE_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
                 return ;
            }
             if($("#paraMap1_PPQ_MANPOWER_QUOTIETY").val()=="0"){
                _alertValMsg($('#paraMap1_PPQ_MANPOWER_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
                 return ;
            }
             if($("#paraMap1_PPQ_EFFICIENCY_QUOTIETY").val()=="0"){
                _alertValMsg($('#paraMap1_PPQ_EFFICIENCY_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
                 return ;
            }
             if($("#paraMap1_PPQ_DUAL_QUOTIETY  ").val()=="0"){
                _alertValMsg($('#paraMap1_PPQ_DUAL_QUOTIETY  '),"<dict:lang value="系数大于1小于2以及小数不超过两位" />");
                 return ;
            }
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			 
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
				
			}
			
			$("#saveBtn").prop("disabled",true);
			document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=e9a91465dbe74cbe80ff04d8c2b897b8";
            document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
			
		}
         
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
