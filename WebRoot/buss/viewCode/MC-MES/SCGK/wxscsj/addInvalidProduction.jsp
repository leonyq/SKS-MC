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
			<div class="bd" style="height: 264px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6209be18186f43ba92fa495365a68c02" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6209be18186f43ba92fa495365a68c02" />
	<input type="hidden" name="6209be18186f43ba92fa495365a68c02" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="begTime" name="begTime" value="" />
	<input type="hidden" id="endTime" name="endTime" value="" />
	<input type="hidden" id="status" name="status" value="" />
	<input type="hidden" id="begHours" name="begHours" value="" />
	<input type="hidden" id="endHours" name="endHours" value="" />
	<input type="hidden" id="arerId" name="arerId" value="" />
		<s:set name="_$viewId" value="'26c1779236e1484297a764574add75ab'" />
		<s:set name="_$formId_1" value="'6209be18186f43ba92fa495365a68c02'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:85px;"/><span class="dot">*</span><bu:uitn colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" value="%{CSI_AREA_SN}" formIndex="1" onchange="getInfo()"/></bu:td>

            <td class="name" style="width:110px;"/><bu:uitn colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" value="%{CSI_MO_NUMBER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" value="%{CSI_PROJECT_ID}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" value="%{CSI_BEGIN_TIME}" formIndex="1" onchange="getBegTime();getMemo()"/></bu:td>
			
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" value="%{CSI_END_TIME}" formIndex="1" onchange="getBegTime();getMemo()"/></bu:td>	
            			
            <td class="name" /><span class="dot">*</span><bu:uitn colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" /></td>
    		 <bu:td cssClass="dec" colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" value="%{CSI_STOP_TYPE}" formIndex="1" /></bu:td>
        		
		</tr>
		<tr>
    		 
            <td class="name" /><bu:uitn colNo="CSI_STOP_TIMES" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" colNo="CSI_STOP_TIMES" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_STOP_TIMES" formId="6209be18186f43ba92fa495365a68c02" value="%{CSI_STOP_TIMES}" formIndex="1" /></bu:td>

		</tr>
		<tr>
		    	<td class="name" /><bu:uitn colNo="CSI_MAINTENANCE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec" style="height:80px;" colspan="3" colNo="CSI_MAINTENANCE" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MAINTENANCE" style="width:100%;height:100%;"  formId="6209be18186f43ba92fa495365a68c02" value="%{CSI_MAINTENANCE}" formIndex="1" /></bu:td>
		
			
		</tr>
	</table>
			<bu:jsVal formId="6209be18186f43ba92fa495365a68c02" formIndex="1" />
				
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
    		function getInfo(){
	    	    var areaSn = $("#paraMap1_CSI_AREA_SN").val();
	    	    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=afa93f498c4345368e7ca2653ca0f969"; 
	    	    $.ajax({
	    	        type:"post",
	    	        dataType:"json",
	    	        data:{
	    	          "areaSn":areaSn,  
	    	        },
	    	        url:loadItemUrl,
	    	        success:function(date){
	    	            if(null==date){
	    	                return;
	    	            }
	    	            
	    	            if(null!=date.ajaxMap){
	    	                var list=eval(date.ajaxMap);
	    	                 $("#paraMap1_CSI_MO_NUMBER").val(list.PMO_NUMBER);
	    	                 $("#paraMap1_CSI_PROJECT_ID").val(list.PMO_PROJECT_ID);
	    	                 $("#begTime").val(list.BEGIN_TIME);
	    	                 $("#endTime").val(list.END_TIMES);
	    	                 $("#status").val(list.CSI_STATUS);
	    	                 $("#arerId").val(list.CSI_AREA_SN);
	    	                 
	    	            }
	    	            getBegTime();
	    	        },
	    	        error:function(msg){
	    	            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	    	        }
	    	        
	    	    });
	    	    
	    	    
	    	}
	 var Compare=3;
    function getBegTime(){
    
        
        if(areaSns!=""){
        var nowTime= $("#paraMap1_CSI_BEGIN_TIME").val();
        var endTime= $("#paraMap1_CSI_END_TIME").val();
        var areaSns = $("#paraMap1_CSI_AREA_SN").val();
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
	    	                /*
	    	                 if(Compare=="1"){
	    	                     utilsFp.confirmIcon(3,"","","", "不在工作时间里",0,"300","");
	    	                     return;
	    	                 }else if(Compare=="2"){
	    	                      utilsFp.confirmIcon(3,"","","", "时间不能交叉",0,"300","");
	    	                      return;
	    	                 }else if(Compare=="0"){
	    	                      utilsFp.confirmIcon(3,"","","", "开始时间不能小于或等于结束时间",0,"300","");
	    	                      return;
	    	                 }else if(Compare=="4"){
	    	                      utilsFp.confirmIcon(3,"","","", "工厂无该线条时间",0,"300","");
	    	                      return;
	    	                 }
	    	                 */
	    	                 
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
    function getMemo(){


        var endTimes=$("#paraMap1_CSI_END_TIME").val();
        var staTimes =$("#paraMap1_CSI_BEGIN_TIME").val();
        if(staTimes!='' && endTimes!=''){
          var d1 = new Date(endTimes).getTime();
          var d2 = new Date(staTimes).getTime();
          $("#paraMap1_CSI_STOP_TIMES").val(Math.floor((d1-d2)/1000/60));
          
        }else{
             $("#paraMap1_CSI_STOP_TIMES").val('');
        }
        if(endTimes!=""){
            $("#paraMap1_CSI_MAINTENANCE").removeAttr("disabled");
            $("#paraMap1_CSI_MAINTENANCE").attr("class"," input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }else{
             $("#paraMap1_CSI_MAINTENANCE").attr("disabled","disabled");
            $("#paraMap1_CSI_MAINTENANCE").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }
    }
    /*
    function getMemo(){
        var endTimes=$("#paraMap1_CSI_END_TIME").val();
        if(endTimes!=""){
            $("#paraMap1_CSI_MAINTENANCE").removeAttr("disabled");
            $("#paraMap1_CSI_MAINTENANCE").attr("class"," input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }else{
             $("#paraMap1_CSI_MAINTENANCE").attr("disabled","disabled");
            $("#paraMap1_CSI_MAINTENANCE").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }
    }
    */
    var isQuery=false;
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
                            				
				
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			 
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled",true);
			
			var moNumber = $("#paraMap1_CSI_MO_NUMBER").val();
			var projectId=$("#paraMap1_CSI_PROJECT_ID").val();
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
			if(Compare=="3"){
			
			document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=f75a7779d78140b193391f3914bbeddf&moNumber="+moNumber+"&projectId="+projectId;
            document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
		}
		     
		     
		     
		 }
			
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
