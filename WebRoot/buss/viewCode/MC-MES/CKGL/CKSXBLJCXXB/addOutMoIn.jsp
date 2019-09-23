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
			        <button type="button" onclick="adds();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:390px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="dc22be86e17d468fa1b1daffaab81702" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="dc22be86e17d468fa1b1daffaab81702" />
	<input type="hidden" name="dc22be86e17d468fa1b1daffaab81702" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="stepCode" id="stepCode" value="1" />
	<input type="hidden" name="cstModelCode" id="cstModelCode" value="" />
	<input type="hidden" name="womMoNum" id="womMoNum" value="" />
	<input type="hidden" name="womOutNum" id="womOutNum" value="" />
	<input type="hidden" name="nextTimes" id="nextTimes" value="" />
	<input type="hidden" name="cstProcessFace" id="cstProcessFace" value="" />
	<input type="hidden" name="operateTime" id="operateTime" value="" />
	<input type="hidden" name="womNextNum" id="womNextNum" value="" />
	<input type="hidden" name="state" id="state" value="" />
	<input type="hidden" name="preparaInterval" id="preparaInterval" value="" />
	<input type="hidden" name="standardHours" id="standardHours" value="" />
	<input type="hidden" name="womCurrentNum" id="womCurrentNum" value="" />
		<s:set name="_$viewId" value="'7467ed68b7da4971a0e39082e870e197'" />
		<s:set name="_$formId_1" value="'dc22be86e17d468fa1b1daffaab81702'" />
		<s:set name="_$type" value="'add'" />
		<tr>
		    <td class="name" style="width:90px;"/><span class="dot">*</span><bu:uitn colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_MO_NUMBER}" formIndex="1" style="width:200px"/></bu:td>
		    			
            <td class="name" style="width:90px;"/><bu:uitn colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_MODEL_CODE}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
			
		    	<td class="name" style="width:90px;"/><bu:uitn colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_MODEL_NAME}" formIndex="1" style="width:200px" /></bu:td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_MODEL_STANDARD}" formIndex="1" style="width:200px" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_MO_NUM}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_OUT_NUM}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
			
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_PREPARA_INTERVAL}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_OPERATE_TIME}" formIndex="1" style="width:200px" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_STANDARD_HOURS}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_CURRENT_NUM}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
	
	        <td class="name" /><bu:uitn colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_STATUS}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
	
			<td class="name" /><bu:uitn colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_PROCESS_FACE}" formIndex="1" style="width:200px"/></bu:td>
		
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_NEXT_NUM}" formIndex="1" style="width:200px"/></bu:td>	
            
			<td class="name" style="width:90px;"/><bu:uitn colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self"  style="width:200px;" colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_NEXT_TIME}" formIndex="1" style="width:200px"/></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" colspan="7"><bu:ui colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" value="%{WOM_MEMO}" formIndex="1" style="height:80px;width:97.5%"/></bu:td>
		
		</tr>
	</table>
			<bu:jsVal formId="dc22be86e17d468fa1b1daffaab81702" formIndex="1" />
				
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
        	//$(function(){
        	//   GetPreparaInterval(); 
        	//});
        	function GetPreparaInterval(){
        	    var CST_MODEL_CODE = $("#paraMap1_WOM_MODEL_CODE").val();
        	    
        	    var WOM_MO_NUM = $("#paraMap1_WOM_MO_NUM").val();
        	    var  WOM_OUT_NUM = $("#paraMap1_WOM_OUT_NUM").val();
        	    var stepCode = $("#stepCode").val();
        	    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=33fb828684d547708eb2d0a0805d31d4"; //VM-时序备料-新增 操作功能 获取物料间隔
        	    $.ajax({
        	        type:"post",
        	        dataType:"json",
        	        url:loadItemUrl,
        	        data:{
        	            "CST_MODEL_CODE":CST_MODEL_CODE,
        	            "WOM_MO_NUM":WOM_MO_NUM,
        	            "WOM_OUT_NUM":WOM_OUT_NUM,
        	            "stepCode":stepCode,
        	        },
        	        //data:"="+CST_MODEL_CODE+"&WOM_MO_NUM="+WOM_MO_NUM+"&WOM_OUT_NUM="+WOM_OUT_NUM+"&stepCode="+stepCode,
        	        success:function(data){
        	            if(null==data){
        	                return;
        	            }
        	            
        	            if(null!=data.ajaxMap){
        	                var map = eval(data.ajaxMap);
        	               
        	              
        	                if(map.WOM_NEXT_NUM==null) map.WOM_NEXT_NUM="";
        	                if(map.VR_VALUE==null) map.VR_VALUE="";
        	                if(map.WOM_NEXT_TIME==null) map.WOM_NEXT_TIME="";
        	                if(map.WOM_OPERATE_TIME==null) map.WOM_OPERATE_TIME="";
        	                if(map.WOM_PROCESS_FACE==null) map.WOM_PROCESS_FACE="";
        	                if(map.WOM_STANDARD_HOURS==null) map.WOM_STANDARD_HOURS="";
        	                if(map.WOM_STATUS==null) map.WOM_STATUS="";
        	                if(map.WOM_OUT_NUM==null) map.WOM_OUT_NUM="";
        	                if(map.WOM_CURRENT_NUM==null) map.WOM_CURRENT_NUM="";
        	                
        	                $("#paraMap1_WOM_STANDARD_HOURS").val(map.WOM_STANDARD_HOURS);
        	                 $("#paraMap1_WOM_PROCESS_FACE").val(map.WOM_PROCESS_FACE);
        	                 
        	                 
        	                if($("#paraMap1_WOM_STANDARD_HOURS").val()=="" || $("#paraMap1_WOM_STANDARD_HOURS").val()==null || $("#paraMap1_WOM_STANDARD_HOURS").val()=="0"){
        	                    utilsFp.confirmIcon(3,"","","", "当前机种未维护标准工时",0,"300","");
        	                }else{
        	                    $("#paraMap1_WOM_NEXT_NUM").val(map.WOM_NEXT_NUM);
            	                $("#paraMap1_WOM_PREPARA_INTERVAL").val(map.VR_VALUE);
            	                $("#paraMap1_WOM_NEXT_TIME").val(map.WOM_NEXT_TIME);
            	                $("#paraMap1_WOM_OPERATE_TIME").val(map.WOM_OPERATE_TIME);
            	               
            	                if(map.WOM_STATUS=="1"){
            	                    $("#paraMap1_WOM_STATUS").val("正常");
            	                }else if(map.WOM_STATUS=="3"){
            	                    $("#paraMap1_WOM_STATUS").val("关结");
            	                }else{
            	                    $("#paraMap1_WOM_STATUS").val(map.WOM_STATUS);
            	                }
            	                
            	                $("#paraMap1_WOM_OUT_NUM").val(map.WOM_OUT_NUM);
            	                $("#paraMap1_WOM_CURRENT_NUM").val(map.WOM_CURRENT_NUM);
                                
                                $("#state").val(map.WOM_STATUS);
                                $("#womMoNum").val($("#paraMap1_WOM_MO_NUM").val());
                                $("#womOutNum").val(map.WOM_OUT_NUM);
                                $("#operateTime").val(map.WOM_OPERATE_TIME);
                                $("#cstProcessFace").val(map.WOM_PROCESS_FACE);
                                $("#nextTimes").val(map.WOM_NEXT_TIME);
                                $("#womCurrentNum").val(map.WOM_CURRENT_NUM);
                                $("#womNextNum").val(map.WOM_NEXT_NUM);
                                $("#preparaInterval").val(map.VR_VALUE);
                                $("#standardHours").val(map.WOM_STANDARD_HOURS);							
    
            	                
            	                if($("#paraMap1_WOM_STATUS").val() == "关结"){
            	                    $("#paraMap1_WOM_NEXT_NUM").attr("disabled",true);
            	                    //$("#paraMap1_WOM_NEXT_NUM").addClass( input isSubmit  readonly _VAL_DATABASE);
            	                }else if($("#paraMap1_WOM_STATUS").val() == "正常"){
            	                    $("#paraMap1_WOM_NEXT_NUM").removeAttr("disabled");
            	                }
            	               
            	                
        	                }
        	                $("#paraMap1_WOM_PROCESS_FACE").trigger("chosen:updated");
        	                
        	                
        	                
        	                
        	            }
        	        },
        	        error:function(msg){
        	            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        	        }
        	        
        	    });
        	}
        function adds(){
	    	
	    	    
	    	    	
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
	    	
	    	    if($("#paraMap1_WOM_STANDARD_HOURS").val()=="" || $("#paraMap1_WOM_STANDARD_HOURS").val()==null || $("#paraMap1_WOM_STANDARD_HOURS").val()=="0"){
        	                    utilsFp.confirmIcon(3,"","","", "当前机种未维护标准工时",0,"300","");
        	     }else{
        	           if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
                        	$("#addForm").append($("#isCloseWin").clone());
                        	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
                           }
                        
                           document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=1d01ac27e3fb4061bb357093c65a41bb";
                           document.forms.addForm.submit();
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
