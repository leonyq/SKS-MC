<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<style>
		input[type="text"]{
			width:200px !important;
		}
	</style>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<!-- head里面 -->
	  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	     <jsp:param name="modelName" value="VIEW_TYPE_18" />
	     <jsp:param name="location" value="inHead" />
	  </jsp:include>
</head>
<body style="background-color:#fff;overflow:hidden;">
	<div class="edit">
			<div class="bd" style="border: none">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c3a183e393ea4dfabb15712f9dba1873" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c3a183e393ea4dfabb15712f9dba1873" />
	<input type="hidden" name="c3a183e393ea4dfabb15712f9dba1873" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'77a56e4af13b4adf941db0522cce1b05'" />
		<s:set name="_$formId_1" value="'c3a183e393ea4dfabb15712f9dba1873'" />
		<s:set name="_$type" value="'detail'"/>
		
		<!--1-->
		<tr>
		   	<td class="name" style="width:70px"/><bu:uitn colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		
		   	<td class="name" style="width:93px"/><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		  
		    <td class="name" style="width:78px"/><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873"  colspan="7"><bu:ui colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		
		<!--2-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		   
		    	<td class="name" /><bu:uitn colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		 
		    	<td class="name" /><bu:uitn colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		
		<!--3-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		  
		    	<td class="name" /><bu:uitn colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		<!--4-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
	     
	     		<td class="name" /><bu:uitn colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
	    	
	    		<td class="name" /><bu:uitn colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		<!--5-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			
		
			<td class="name" /><bu:uitn colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		   
		    	<td class="name" /><bu:uitn colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
	    </tr>
		<!--6-->
		<tr> 	
	     		<td class="name" /><bu:uitn colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		  
		    	<td class="name" /><bu:uitn colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		<!--7-->
		<tr> 	
	     		<td class="name" /><bu:uitn colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		  
	    	<td class="name" /><bu:uitn colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
            
        </tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		  	
		</tr>
		
		
		<!--8-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colspan="5" colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:100%;height:80px;" readonly="readonly"/></bu:td>
	    	</tr>
		
	</table>
			<bu:jsVal formId="c3a183e393ea4dfabb15712f9dba1873" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
    

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
	<script type="text/javascript">
	
	
             $(function(){
               
                getInfo();
            });
            function getInfo(){
            	
            	var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=d9c542b2cbda41e59435df150a2fe8e4";//VM-制具-修改 操作功能 查询制具库位
            var CFI_FIX_SN = $("#paraMapObj_CFI_FIX_SN").val();
               $.ajax({
                   type:"POST",
                   dataType:"json",
                    url:getInfoUrl,
                   data:{
                     'CFI_FIX_SN':CFI_FIX_SN  
                   },
                  success:function(data){
                  	    if(null==data){
                  	        return;
                  	    }
                  	    if(null!=data.ajaxList){
                  	       
                  	        var list = eval(data.ajaxList);
                  	        console.log(list)
               				$("#paraMapObj_CFI_STOCK_SN").val(list[0].WA_AREA_NAME);
                  	    }
                  	},
                  	error:function(){
                  	    console.log("S");
                  	}
                   
               })
            }
	 
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 
