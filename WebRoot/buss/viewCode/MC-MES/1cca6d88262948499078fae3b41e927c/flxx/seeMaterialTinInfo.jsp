<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="查看" /></title>
	<style>
		input[type='text']{
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
<body style="background-color:#fff;">
	<div class="edit">
			<div class="bd" style="border: none">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6c64c25e45214328b6adbec0abc8f34f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6c64c25e45214328b6adbec0abc8f34f" />
	<input type="hidden" name="6c64c25e45214328b6adbec0abc8f34f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ca915b5d6c8c477bb635fa836257832a'" />
		<s:set name="_$formId_1" value="'6c64c25e45214328b6adbec0abc8f34f'" />
		<s:set name="_$type" value="'detail'"/>
		 <tr>
			<!--1-->	 
			<td class="name" style="width:113px;"/><span class="dot">*</span><bu:uitn colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" id="addWay"><bu:ui colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		 
			<td class="name"  style="width:113px;"/><span class="dot">*</span><bu:uitn colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:225px;" colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		    <td class="name"  style="width:87px;"/><span class="dot">*</span><bu:uitn colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:205px;" colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" id="tempCount"><bu:ui colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			<!--1-->
		    </tr><tr>
			<!--2-->
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		    
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			<!--2-->
			</tr><tr>
			<!--3-->
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		    
		    	<td class="name" /><bu:uitn colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
			<!--3-->
			</tr><tr>
			<!--4-->
			<td class="name" /><bu:uitn colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" >
				<!--<select id="paraMapObj_CTI_ASSISTANTTOOLTYPE" name="paraMapObj.CTI_ASSISTANTTOOLTYPE" class="isSubmit input dept_select"><option value="">--请选择--</option><option value="0">锡膏</option>
				<option value="1">胶水</option>
				<option value="2">钢网</option>
				<option value="3">刮刀</option>
				</select>-->

				<!--<input type="text" value="${dataList[0].CTI_ASSISTANTTOOLTYPE}" style="width:200px;" class="input" id="CTI_ASSISTANTTOOLTYPE" name="CTI_ASSISTANTTOOLTYPE" class="_VAL_NULL isSubmit input readonly" null=""/>
				<input type="text" id="paraMapObj_CTI_ASSISTANTTOOLTYPE" name="paraMapObj.CTI_ASSISTANTTOOLTYPE" value="${dataList}" class="_VAL_NULL isSubmit input">-->
				<bu:ui colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;" /> 
			</bu:td>
		   
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			<!--4-->
			</tr><tr>
			<!--5-->
			<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		    <td class="name" /><bu:uitn colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			<!--5-->
			</tr><tr>
			<!--6-->
			<td class="name" /><bu:uitn colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		  
		    <td class="name" /><bu:uitn colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		    <td class="name" /><bu:uitn colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
			<!--6-->
			</tr><tr>
			<!--7-->
			<td class="name" /><bu:uitn colNo="CTI_MIX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_MIX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_MIX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_MIX_TIME}" dataId="${dataId}" formIndex="1" readonly="readonly"  style="width:200px;"/>
			<input type='hidden' colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_MAN}" formIndex="1"  style="width:200px;"/>
			</bu:td>
			<td class="name" /><bu:uitn colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" value="%{CTI_THAWING_DECAY}" formIndex="1" readonly="readonly"  style="width:200px;" />
		    </bu:td>
			<td class="name" /><bu:uitn colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" value="%{CTI_PRODUCT_DATE}" formIndex="1"  style="width:200px;"/>
			<input type='hidden' colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_TIME}" formIndex="1"  style="width:200px;"/>
			</bu:td>
			
			<!--7-->
			</tr><tr>
			<!--8-->
    		<tr>
    			<td class="name" /><bu:uitn colNo="CTI_THAWING_MAX_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
    			<bu:td cssClass="dec" colNo="CTI_THAWING_MAX_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_MAX_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}"  value="%{CTI_THAWING_MAX_CYCLE}" formIndex="1"  style="width:200px;"/></bu:td>
    		   
    		 	<td class="name" /><bu:uitn colNo="CTI_MIX_MAX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
    			<bu:td cssClass="dec" colNo="CTI_MIX_MAX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_MIX_MAX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}"  value="%{CTI_MIX_MAX_TIME}" formIndex="1"  style="width:200px;"/></bu:td>
    			
				<td class="name" /><bu:uitn colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
    			<bu:td cssClass="dec" colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}"  value="%{CTI_STOCK_SN}" formIndex="1"  style="width:200px;"/></bu:td>
    		</tr>

		    <!--9-->
			<td class="name" /><bu:uitn colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" colspan="7">
			<bu:ui colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" style="height:70px;width:100%;" readonly="readonly"/>
			</bu:td>
			<!--8-->
		
	</table>
			<bu:jsVal formId="6c64c25e45214328b6adbec0abc8f34f" formIndex="1" />		<div style="padding:1px;"></div>

		

			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $('.dialog-bd',parent.document).css('background-color','#fff');
				
			});
		
		function init(){
		    	
		        if($("#tempCount input").val()==""){
		        	$("#addWay input").val("个体");
		        }else{
		        	$("#addWay input").val("批次");
		        }
		
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		
		
		 $(function(){
               
            getInfo();
        });
        function getInfo(){
        	
        	var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=9b18f772881d48f588e7780a2884f168";
            var CTI_TIN_SN = $("#paraMapObj_CTI_TIN_SN").val();
           $.ajax({
               type:"POST",
               dataType:"json",
                url:getInfoUrl,
               data:{
                   'CTI_TIN_SN':CTI_TIN_SN
               },
              success:function(data){
              	    if(null==data){
              	        return;
              	    }
              	    if(null!=data.ajaxList){
              	       
              	        var list = eval(data.ajaxList);
                       $("#paraMapObj_CTI_STOCK_SN").val(list[0].WA_AREA_NAME);
                       console.log('s>>'+list[0].WA_AREA_NAME);
                       }
              	},
              	error:function(){
              	    console.log("S");
              	}
               
           })
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
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
