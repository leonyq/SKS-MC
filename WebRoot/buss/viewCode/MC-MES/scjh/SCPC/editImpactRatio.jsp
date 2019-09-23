<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->

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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd"  style="height:280px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="334ae8dac2684a3289964a13b26049cd" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="334ae8dac2684a3289964a13b26049cd" />
	<input type="hidden" name="334ae8dac2684a3289964a13b26049cd" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'8558e7b8e00b43a4ab7f6183dea98603'" />
		<s:set name="_$formId_1" value="'334ae8dac2684a3289964a13b26049cd'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:90px;"/><span class="dot">*</span><bu:uitn colNo="PPQ_PRODUCT_STEP" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" style="width:100px;" colNo="PPQ_PRODUCT_STEP" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_PRODUCT_STEP" formId="334ae8dac2684a3289964a13b26049cd" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:90px;"/><span class="dot">*</span><bu:uitn colNo="PPQ_AREA_SN" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" style="width:100px;" colNo="PPQ_AREA_SN" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_AREA_SN" formId="334ae8dac2684a3289964a13b26049cd" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_DEVICE_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_DEVICE_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_DEVICE_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_MANPOWER_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_MANPOWER_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_MANPOWER_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_EFFICIENCY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_EFFICIENCY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_EFFICIENCY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_QUALITY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_QUALITY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_QUALITY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PPQ_DUAL_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<bu:td cssClass="dec" colNo="PPQ_DUAL_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" ><bu:ui style="width:300px;" colNo="PPQ_DUAL_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="334ae8dac2684a3289964a13b26049cd" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
       $('#paraMapObj_PPQ_DEVICE_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMapObj_PPQ_DEVICE_QUOTIETY");
             if(!/^[0]+([.]{1}[0-9]{0,2})?$|^1$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_PPQ_DEVICE_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
             }
         });
         $('#paraMapObj_PPQ_MANPOWER_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMapObj_PPQ_MANPOWER_QUOTIETY");
             if(!/^[0]+([.]{1}[0-9]{0,2})?$|^1$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_PPQ_MANPOWER_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
             }
         });
         $('#paraMapObj_PPQ_EFFICIENCY_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMapObj_PPQ_EFFICIENCY_QUOTIETY");
             if(!/^[0]+([.]{1}[0-9]{0,2})?$|^1$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_PPQ_EFFICIENCY_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
             }
         });
         $('#paraMapObj_PPQ_QUALITY_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMapObj_PPQ_QUALITY_QUOTIETY");
             if(!/^[0]+([.]{1}[0-9]{0,2})?$|^1$/.test(this.value)){
             ///^[0-9]+([.]{1}[0-9]{0,2})?$/
             //^[0]+(.[0-9]{0,2})?$|^1
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_PPQ_QUALITY_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
             }
         });
         $('#paraMapObj_PPQ_DUAL_QUOTIETY').bind('keyup', function () {
	            var calwStart=$("#paraMapObj_PPQ_DUAL_QUOTIETY");
             if(!/^[1]+([.]{1}[0-9]{0,2})?$|^2$/.test(this.value)){
             ///^[0-9]+([.]{1}[0-9]{0,2})?$/
             //^[0]+(.[0-9]{0,2})?$|^1
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_PPQ_DUAL_QUOTIETY'),"<dict:lang value="系数大于1小于2以及小数不超过两位" />");
             }
         });
         
          var isQuery = false;
                    function edit(thisObj){
                        if(isQuery){util.alert("?数据正在提交，请稍候...");}
                        if(!val.valNullData()){
                            return ;
                        }
                        if(!val.valDataBaseSetData()){
                            return ;
                        }
                        if(!valData()){
                            return ;
                        }
                        if(!val.valOjbsData()){
                            return ;
                        }
                         if($("#paraMapObj_PPQ_DEVICE_QUOTIETY").val()=="0"){
                            _alertValMsg($('#paraMapObj_PPQ_DEVICE_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
                             return ;
                        }
                         if($("#paraMapObj_PPQ_MANPOWER_QUOTIETY").val()=="0"){
                            _alertValMsg($('#paraMapObj_PPQ_MANPOWER_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
                             return ;
                        }
                         if($("#paraMapObj_PPQ_EFFICIENCY_QUOTIETY").val()=="0"){
                            _alertValMsg($('#paraMapObj_PPQ_EFFICIENCY_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
                             return ;
                        }
                         if($("#paraMapObj_PPQ_QUALITY_QUOTIETY").val()=="0"){
                            _alertValMsg($('#paraMapObj_PPQ_QUALITY_QUOTIETY'),"<dict:lang value="系数大于0小于1以及小数不超过两位" />");
                             return ;
                         }
                         if($("#paraMapObj_PPQ_DUAL_QUOTIETY").val()=="0"){
                            _alertValMsg($('#paraMapObj_PPQ_DUAL_QUOTIETY'),"<dict:lang value="系数大于1小于2以及小数不超过两位" />");
                             return ;
                         }
                         var PPQ_PRODUCT_STEP = $("#paraMapObj_PPQ_PRODUCT_STEP").val();
                        var id =  "${dataId}";
                        
                        //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                        emptyValToHide();
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=ce1d0b200b3c45cab2b6c85868af7699&id="+id+"&PPQ_PRODUCT_STEP="+PPQ_PRODUCT_STEP;
                        document.forms.editForm.submit();
                        isQuery = true;
                    }
                    
    </script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
