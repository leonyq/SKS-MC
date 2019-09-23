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
			    	        <button type="button" onclick="editCal(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="2ea06dc3c4414e1db802eab7ed38e3ef" type="edit" />
		<div class="mod">		
  <div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:260px;border: none;">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2ea06dc3c4414e1db802eab7ed38e3ef" />
	<input type="hidden" id="prefixInd" name="2ea06dc3c4414e1db802eab7ed38e3ef" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'7569c93950d14bf5be852de7c50899fc'" />
		<s:set name="_$formId_1" value="'2ea06dc3c4414e1db802eab7ed38e3ef'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:60px;"/><span class="dot">*</span><bu:uitn colNo="TAI_PROJECT_ID" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_PROJECT_ID" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_PROJECT_ID" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TAI_TYPE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_TYPE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_TYPE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TAI_MKDH" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MKDH" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MKDH" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="TAI_MKJD" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MKJD" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MKJD" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TAI_MKBB" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MKBB" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MKBB" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TAI_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1"  disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TAI_FIND_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_FIND_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_FIND_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1"  disabled="disabled"/></bu:td>
		    <td class="name" /><bu:uitn colNo="TAI_REPORT_EMP" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			
			<bu:td cssClass="dec" colNo="TAI_REPORT_EMP" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_REPORT_EMP" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
		    
			<td class="name" /><bu:uitn colNo="TAI_SOLVE_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_SOLVE_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_SOLVE_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1"  /></bu:td>
	        <td>
	        &nbsp;
	        </td>
	        <td>&nbsp;
	        </td>
		</tr>
		<tr id="cont1">
		    <td class="name"/><bu:uitn colNo="TAI_HANDLE_OPTION" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_HANDLE_OPTION" formId="2ea06dc3c4414e1db802eab7ed38e3ef" colspan="3"><bu:ui colNo="TAI_HANDLE_OPTION" style="width:90%;height:80px" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr id="cont2" style="display:none;">	
            <td class="name"/><bu:uitn colNo="TAI_REASON" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_REASON" formId="2ea06dc3c4414e1db802eab7ed38e3ef" colspan="3"><bu:ui colNo="TAI_REASON" style="width:90%;height:80px" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr id="cont3" style="display:none;">			
            <td class="name"/><bu:uitn colNo="TAI_HANDLE_DESCRIBE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_HANDLE_DESCRIBE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" colspan="3"><bu:ui colNo="TAI_HANDLE_DESCRIBE" style="width:90%;height:80px" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr style="display:none;">
		    	<td class="name" /><bu:uitn colNo="TAI_STATUS" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_STATUS" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_STATUS" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
	</table>
	</div>
	<div id="content1">
    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="图纸不符" /></h3>	
    </div>
    <div class="mod-hd" style="height:130px;border: none;">	
        <table class="basic-table" >
        <tr>
			<td class="name" /><bu:uitn colNo="TAI_DRAW_MARKMODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_DRAW_MARKMODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_DRAW_MARKMODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="TAI_MATTER_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MATTER_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MATTER_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>	
		</table>
    </div>
    </div>
    <div id="content2" style="display:none;">
    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="缺件" /></h3>	
    </div>
    <div class="mod-hd" style="height:130px;border: none;">	
        <table class="basic-table" >
        <tr>
			<td class="name" /><bu:uitn colNo="TAI_DEVICE_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_DEVICE_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_DEVICE_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="TAI_SINGLE_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_SINGLE_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_SINGLE_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>	
	    <tr>
			<td class="name" /><bu:uitn colNo="TAI_MISS_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MISS_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MISS_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		</table>
    </div>
    </div>
    <div id="content3" style="display:none;">
    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="其它" /></h3>	
    </div>
    <div class="mod-hd" style="height:130px;border: none;">		
        <table class="basic-table" >
        <tr>
			<td class="name" style="width: 68px;"/><bu:uitn colNo="TAI_INFO_DESCRIBE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_INFO_DESCRIBE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" colspan="3"><bu:ui colNo="TAI_INFO_DESCRIBE" style="width:100%;height:80px" formId="2ea06dc3c4414e1db802eab7ed38e3ef" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
			</tr>	
		</table>
    </div>
    </div>
    </div>
			<bu:jsVal formId="2ea06dc3c4414e1db802eab7ed38e3ef" formIndex="1" />
									
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
<style>
img {
    display:none;
}
</style>
<script>
    function changeType(){
    	    var type = $("#paraMapObj_TAI_TYPE").val();
    	    if(type=="1"){
    	        $("#content1").attr("style","display:block");
    	        $("#content2").attr("style","display:none");
    	        $("#content3").attr("style","display:none");
    	        
    	        $("#cont1").removeAttr("style");
    	        $("#cont2").attr("style","display:none");
    	        $("#cont3").attr("style","display:none");
    	    }else if(type=="2"){
    	        $("#content1").attr("style","display:none");
    	        $("#content2").attr("style","display:block");
    	        $("#content3").attr("style","display:none");
    	        
    	        $("#cont1").attr("style","display:none");
    	        $("#cont2").removeAttr("style");
    	        $("#cont3").attr("style","display:none");
    	    }else if(type=="3"){
    	        $("#content1").attr("style","display:none");
    	        $("#content2").attr("style","display:none");
    	        $("#content3").attr("style","display:block");
    	        
    	        $("#cont1").attr("style","display:none");
    	        $("#cont2").attr("style","display:none");
    	        $("#cont3").removeAttr("style");
    	    }
    	}
    $(function(){
        changeType();
        $("#paraMapObj_TAI_REPORT_EMP_SHOW").removeAttr("style");
        $("#paraMapObj_TAI_SOLVE_TIME").val(timeEndString());
        $("#paraMapObj_TAI_STATUS").val("2");
    })
    function timeEndString(){
            var datetime = new Date();
            //datetime.setTime(time);
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
            var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
            var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
            return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
        }
    var isQuery = false;
                    function editCal(thisObj){
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
                        $("#paraMapObj_TAI_PROJECT_ID").removeAttr("disabled");
                        $("#paraMapObj_TAI_TYPE").removeAttr("disabled");
                        $("#paraMapObj_TAI_NUM").removeAttr("disabled");
                        //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                        emptyValToHide();
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
