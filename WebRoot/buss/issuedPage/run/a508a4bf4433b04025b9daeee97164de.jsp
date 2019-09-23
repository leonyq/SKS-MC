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
        					<!--<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>-->
			    </div>

			</div>
			<div class="bd" style="    height: 264px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6209be18186f43ba92fa495365a68c02" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6209be18186f43ba92fa495365a68c02" />
	<input type="hidden" name="6209be18186f43ba92fa495365a68c02" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d3b9dd88cef447668f09d049fe7fdbd2'" />
		<s:set name="_$formId_1" value="'6209be18186f43ba92fa495365a68c02'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:85px;"/><span class="dot">*</span><bu:uitn colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>

		    <td class="name" style="width:110px;"/><bu:uitn colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>		
            <td class="name" /><bu:uitn colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
					
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" onchange="getBegTime();"/></bu:td>
	
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" onchange="getBegTime();getMemo();"/></bu:td>
	
	        <td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
	        <td class="name" /><bu:uitn colNo="CSI_STOP_TIMES" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_STOP_TIMES" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_STOP_TIMES" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
	        <td class="name" /><bu:uitn colNo="CSI_MAINTENANCE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_MAINTENANCE" style="height:80px;" colspan="3" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MAINTENANCE" style="width:100%;height:100%;" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="6209be18186f43ba92fa495365a68c02" formIndex="1" />
									
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
	$(function(){
	    $("#paraMapObj_CSI_AREA_SN").attr("disabled","disabled");
    $("#paraMapObj_CSI_AREA_SN").attr("class","_VAL_NULL isSubmit input readonly _VAL_DATABASE");
	})
	
	function getMemo(){


        var endTimes=$("#paraMapObj_CSI_END_TIME").val();
        var staTimes =$("#paraMapObj_CSI_BEGIN_TIME").val();
        if(staTimes!='' && endTimes!=''){
          var d1 = new Date(endTimes).getTime();
          var d2 = new Date(staTimes).getTime();
          $("#paraMapObj_CSI_STOP_TIMES").val(Math.floor((d1-d2)/1000/60));
          
        }else{
             $("#paraMapObj_CSI_STOP_TIMES").val('');
        }
        if(endTimes!=""){
            $("#paraMapObj_CSI_MAINTENANCE").removeAttr("disabled");
            $("#paraMapObj_CSI_MAINTENANCE").attr("class","input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }else{
             $("#paraMapObj_CSI_MAINTENANCE").attr("disabled","disabled");
            $("#paraMapObj_CSI_MAINTENANCE").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }
    }
	/*
	function getMemo(){
        var endTimes=$("#paraMapObj_CSI_END_TIME").val();
        if(endTimes!=""){
            $("#paraMapObj_CSI_MAINTENANCE").removeAttr("disabled");
            $("#paraMapObj_CSI_MAINTENANCE").attr("class","input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }else{
             $("#paraMapObj_CSI_MAINTENANCE").attr("disabled","disabled");
            $("#paraMapObj_CSI_MAINTENANCE").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }
    }
	*/
	
	var Compare=3;
	    	function getBegTime(){
    
        
        if(areaSns!=""){
        var nowTime= $("#paraMapObj_CSI_BEGIN_TIME").val();
        var endTime= $("#paraMapObj_CSI_END_TIME").val();
        var areaSns = $("#paraMapObj_CSI_AREA_SN").val();
        var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=0bd2172ef5a043b48a64b7b0c2a6bfa0"; 
        
        $.ajax({
            type:"post",
            dataType:"json",
            data:{
               "nowTime":nowTime,
               "areaSns":areaSns,
               "endTime":endTime
            },
            url:loadItemUrl,
            success:function(data){
                 if(null==data){
	    	                return;
	    	            }
	    	            
	    	            if(null!=data.ajaxMap){
	    	                var map=eval(data.ajaxMap);
	    	                Compare=map.Compare;
	    	                
	    	                 
	    	            }
            },
            error:function(msg){
	    	            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	    	        }
            
        })
        }else{
            utilsFp.confirmIcon(3,"","","", "请先选择线别",0,"300","");
        }
    }
    
    
    
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
                             if(Compare=="1"){
	    	                     utilsFp.confirmIcon(3,"","","", "不在工作时间里",0,"300","");
	    	                     return;
	    	                 }else if(Compare=="2"){
	    	                      utilsFp.confirmIcon(3,"","","", "时间不能交叉",0,"300","");
	    	                      return;
	    	                 }else if(Compare=="0"){
	    	                      utilsFp.confirmIcon(3,"","","", "结束停线时间不能小于或等于开始停线时间",0,"300","");
	    	                      return;
	    	                 }else if(Compare=="4"){
	    	                      utilsFp.confirmIcon(3,"","","", "该线别未维护工厂日历",0,"300","");
	    	                      return;
	    	                 }else if(Compare=="5"){
	    	                      utilsFp.confirmIcon(3,"","","", "该线别周六没上班",0,"300","");
	    	                      return;
	    	                 }else if(Compare=="6"){
	    	                      utilsFp.confirmIcon(3,"","","", "该线别周日没上班",0,"300","");
	    	                      return;
	    	                      }
                            var id="<c:out value='${dataId}'/>";
                        if(Compare=="3"){
                            //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                            emptyValToHide();
                            document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=b02057123a7246e4933bf36ccdc77178&id="+id;
                            document.forms.editForm.submit();
                            isQuery = true;
                            
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
