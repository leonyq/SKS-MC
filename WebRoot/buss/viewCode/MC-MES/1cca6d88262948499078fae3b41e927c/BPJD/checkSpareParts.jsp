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
  
  <style>
        
  </style>
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;height: 260px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ad49e8673c8d474d9f926b899bed9a9d" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ad49e8673c8d474d9f926b899bed9a9d" />
	<input type="hidden" name="ad49e8673c8d474d9f926b899bed9a9d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'53209e76581343b2849cb12a9c942518'" />
		<s:set name="_$formId_1" value="'ad49e8673c8d474d9f926b899bed9a9d'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td  class="name" style="width:68px;"/><bu:uitn colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td style="width:230px;" cssClass="dec" colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td  class="name" style="width:68px;" /><bu:uitn colNo="WSI_ITEM_CODE" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td style="width:230px;" cssClass="dec"  colNo="WSI_ITEM_CODE" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_CODE" formId="ad49e8673c8d474d9f926b899bed9a9d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td  class="name" style="width:68px;"/><bu:uitn colNo="T2#CI_ITEM_NAME" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td style="width:230px;" cssClass="dec" colNo="T2#CI_ITEM_NAME" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="T2#CI_ITEM_NAME" formId="ad49e8673c8d474d9f926b899bed9a9d" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td  class="name" style="width:68px;" /><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td style="width:230px;" cssClass="dec"  colNo="T2#CI_ITEM_SPEC" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="T2#CI_ITEM_SPEC" formId="ad49e8673c8d474d9f926b899bed9a9d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td  class="name" style="width:68px;"/><bu:uitn colNo="WSI_ITEM_NUM" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td  colNo="WSI_ITEM_NUM" cssClass="dec" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_NUM" formId="ad49e8673c8d474d9f926b899bed9a9d" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" style="width:68px;"/><bu:uitn colNo="WSI_PRODUCE_DATE" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td  colNo="WSI_PRODUCE_DATE" cssClass="dec" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_PRODUCE_DATE" formId="ad49e8673c8d474d9f926b899bed9a9d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>				
            <td class="name" colspan='1'/><bu:uitn colNo="WSI_STOCK_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td cssClass="dec" colNo="WSI_STOCK_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" > 
	    		<div class="_tree" onClick="showTree(this,event)">
	    		    <input type="text" id="STORAGE_NAME" name="STORAGE_NAME" readonly="readonly" placeholder="点击弹出" style="width: 226px;">
	    		    <input type="hidden" id="STORAGE_CODE" name="STORAGE_CODE">
	    		    <input type="hidden" id="WH_CODE" name="WH_CODE">
        			<div id="index_tree" class="ztree" style="display: none;"></div>
	    		</div>
			</bu:td>	
        </tr>
		<tr>
			<td  class="name" style="width:68px;"/><bu:uitn colNo="WSI_MEMO" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td  colNo="WSI_MEMO" cssClass="dec" formId="ad49e8673c8d474d9f926b899bed9a9d"  colspan="4"><bu:ui style="height:80px;width:100%" colNo="WSI_MEMO" formId="ad49e8673c8d474d9f926b899bed9a9d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="ad49e8673c8d474d9f926b899bed9a9d" formIndex="1" />
				</form>	
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

<script	 type="text/javascript"	>
	
	   //获取库位信息
   	$(function(){
           
        getInfo();
    });	

    function getInfo(){
    	
    	var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=6f73c456ea7343ebb091862950afccf5";
    var WSI_ITEM_SN = $("#paraMapObj_WSI_ITEM_SN").val();
       $.ajax({
           type:"POST",
           dataType:"json",
            url:getInfoUrl,
           data:{
            "WSI_ITEM_SN":WSI_ITEM_SN   
           },
          success:function(data){
          	    if(null==data){
          	        return;
          	    }
          	    if(null!=data.ajaxList){
          	       
          	        var list = eval(data.ajaxList);
          	        console.log(list)
       				$("#STORAGE_NAME").val(list[0].WA_AREA_NAME);
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
