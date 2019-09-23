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
	
	<link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>
		
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    
    <style>
 
        ._tree{
            width: 200px;
            height: 25px;
            position: relative;
        }

        ._tree input{
            height: 100%;
            width: 100%;
            outline: none;
            border: none;
            box-sizing: border-box;
            float:left;
            border: 1px solid #ccc; 
            padding-left:5px;
            cursor:pointer;
        }
        		

        ._tree .icon{
            position: absolute;
            height: 100%;
            right: 0;
            top: 0;
            cursor: pointer;
        }

        ._tree .ztree{
            border:1px solid #ccc;
            width: 100%;  
            
            max-height: 200px;
            margin-left:-1px;   
            display: none;
            overflow: auto;
            position:absolute;
            bottom:100%;
            background-color:#fff;
        }
    
</style>
</head>
<body>
<div id="_alertValMsgDiv2" style="color: rgb(255, 0, 0); background-color: rgb(254, 224, 178); left: 100px; position: absolute; top: 150px; z-index: 10; display: none;">该项只能为数字</div>
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
			    	        <button type="button" onclick="editSub_s();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:450px;">
					
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
		   				<jsp:param name="location" value="editForm" />
		            </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6c64c25e45214328b6adbec0abc8f34f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6c64c25e45214328b6adbec0abc8f34f" />
	<input type="hidden" name="6c64c25e45214328b6adbec0abc8f34f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'fdeda6663e0840018762553ad052a072'" />
		<s:set name="_$formId_1" value="'6c64c25e45214328b6adbec0abc8f34f'" />
		<s:set name="_$type" value="'edit'" />
	    <!--<tr>
			 <input type="text" name="CTI_TIN_STATUS" id="CTI_TIN_STATUS" value="${dataList[0].CTI_TIN_STATUS}"/> 
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		</tr>-->
		    <tr>
			<!--1-->	 
			<td class="name" style="width:113px;"/><span class="dot">*</span><bu:uitn colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		 
			<td class="name"  style="width:113px;"/><span class="dot">*</span><bu:uitn colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:225px;" colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		    <td class="name"  style="width:87px;"/><span class="dot">*</span><bu:uitn colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:205px;" colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"  style="width:200px;"/></bu:td>
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
			<bu:td cssClass="dec" colNo="CTI_MIX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_MIX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_MIX_TIME}" formIndex="1"  style="width:200px;"/>
			
			</bu:td>
			
			<td class="name" /><bu:uitn colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1"   style="width:200px;" />
		    </bu:td>
		    <input type='hidden' colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_MAN}" formIndex="1"  style="width:200px;"/>
			<td class="name" /><bu:uitn colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_PRODUCT_DATE}" formIndex="1"  style="width:200px;"/>
			</bu:td>
			<input type='hidden' colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_TIME}" formIndex="1"  style="width:200px;"/>
		   
			<!--7-->
			</tr><tr>	

			<!--8-->
    		<tr>
    			<td class="name" /><bu:uitn colNo="CTI_THAWING_MAX_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
    			<bu:td cssClass="dec" colNo="CTI_THAWING_MAX_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_MAX_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_MAX_CYCLE}" formIndex="1"  style="width:200px;"/></bu:td>
    		   
    		 	<td class="name" /><bu:uitn colNo="CTI_MIX_MAX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
    			<bu:td cssClass="dec" colNo="CTI_MIX_MAX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_MIX_MAX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_MIX_MAX_TIME}" formIndex="1"  style="width:200px;"/></bu:td>
				<td class="name" /><bu:uitn colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			    <bu:td cssClass="dec" colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" > 
			    		<div class="_tree" onClick="showTree(this,event)">
			    		    <input type="text" id="STORAGE_NAME" name="STORAGE_NAME" readonly="readonly" placeholder="点击弹出">
			    		    <input type="hidden" id="STORAGE_CODE" name="STORAGE_CODE">
			    		    <input type="hidden" id="WH_CODE" name="WH_CODE">
                			<div id="index_tree" class="ztree" style="display: none;"></div>
			    		</div>
			    
			    </bu:td>
    		</tr>

		    <!--9-->
    			<td class="name" /><bu:uitn colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
    			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" colspan="7">
    			<bu:ui colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" style="height:80px;width:100%;"/>
    			</bu:td>
			<!--8-->
		<!--<td>&nbsp;</td>
			
			<td class="name-six" /><bu:uitn colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
			
			<td class="name-six" /><bu:uitn colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
			
		</tr>-->
	</table>
			<bu:jsVal formId="6c64c25e45214328b6adbec0abc8f34f" formIndex="1" />		<div style="padding:1px;"></div>

		<!--<bu:form viewId="fdeda6663e0840018762553ad052a072" formId="62aabb92147842e1983bcfcda04f9a1d" isSubForm="1" list="dataListSub" formidFirstId="6c64c25e45214328b6adbec0abc8f34f" relColIds="" subFormIds="" subRelColIds="" />

		<div style="padding:1px;"></div>

		<bu:form viewId="fdeda6663e0840018762553ad052a072" formId="536730f0f221402c8ddc9bb284b26acc" isSubForm="1" list="dataListSub" formidFirstId="6c64c25e45214328b6adbec0abc8f34f" relColIds="" subFormIds="" subRelColIds="" />-->


									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
        <bu:submit viewId="fdeda6663e0840018762553ad052a072" />
	<bu:script viewId="fdeda6663e0840018762553ad052a072" />
	
	<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>	
	<script type="text/javascript">
   var setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onClick: zTreeOnclick
                },
                async: {
            enable: true,
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=848f9f24f8544ea8a4a1be288cfa9274",
            autoParam: ["id"],
            otherParam: {"dataAuth":"${sessionScope.mcDataAuth}"},
            //otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
            dataFilter: ajaxDataFilter
        }
            }
            /*
            function zTreeOnclick(event,treeId,treeNode){
                //不是库位
                if(treeNode.AREA_TYPE!=3){
                    //alert(treeNode.AREA_TYPE);
                    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择库位" />",0,"260","");
                    return false;
                }else{
                    $("#STORAGE_NAME").val(treeNode.name);
                    $("#STORAGE_CODE").val(treeNode.id);
                    $("#WH_CODE").val(getCurrentRoot(treeNode));
                }
                  // alert(getCurrentRoot(treeNode));
            }
            function ajaxDataFilter(treeId,parentNode,responseDate){
                var data = responseDate.ajaxList;
                $.each(data,function(i,v){
            v["isParent"] = true;
        });
                return data;
            }
            //获取当前节点的根节点(treeNode为当前节点)  
            function getCurrentRoot(treeNode){  
               if(treeNode.getParentNode()!=null){    
                  var parentNode = treeNode.getParentNode();    
                  return getCurrentRoot(parentNode);    
               }else{    
                  return treeNode.id;   
               }  
            }  
    function showTree(elem,event){
	
        $(elem).find('.ztree').css('display','block');
        //阻止事件冒泡
        var e = arguments.callee.caller.arguments[0]||event; 
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else if (window.event) {
            window.event.cancelBubble = true;
        }
        
    }

    //点空白处隐藏选项
    $(document).click(function () {
        $("._tree .ztree").css('display','none');
    });    	
    	$(function(){
    	    $.fn.zTree.init($("#index_tree"),setting);
    	})
    	
    	*/
    	  function zTreeOnclick(event,treeId,treeNode){
        //不是库位
        if(treeNode.AREA_TYPE!=3){
            //alert(treeNode.AREA_TYPE);
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择库位" />",0,"260","");
            return false;
        }else{
            $("#STORAGE_NAME").val(treeNode.name);
            $("#STORAGE_CODE").val(treeNode.id);
            $("#WH_CODE").val(getCurrentRoot(treeNode));
        }
          // alert(getCurrentRoot(treeNode));
    }		

    function ajaxDataFilter(treeId,parentNode,responseDate){
        var data = responseDate.ajaxList;
        $.each(data,function(i,v){
            v["isParent"] = true;
        });
        return data;
    }
    
    //获取当前节点的根节点(treeNode为当前节点)  
    function getCurrentRoot(treeNode){  
       if(treeNode.getParentNode()!=null){    
          var parentNode = treeNode.getParentNode();    
          return getCurrentRoot(parentNode);    
       }else{    
          return treeNode.id;   
       }  
    }  	

    function showTree(elem,event){
	
        $(elem).find('.ztree').css('display','block');
        //阻止事件冒泡
        var e = arguments.callee.caller.arguments[0]||event; 
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else if (window.event) {
            window.event.cancelBubble = true;
        }
        
    }

    //点空白处隐藏选项
    $(document).click(function () {
        $("._tree .ztree").css('display','none');
    });    		
	
	$(function(){
	    $.fn.zTree.init($("#index_tree"),setting);
	})
		
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
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			
			getInfo();
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
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			 
			
			$("#paraMapObj_CTI_COUNT").attr("disabled",false);  
			$("#paraMapObj_CTI_SUPPLIER").attr("disabled",false);
			$("#paraMapObj_CTI_ASSISTANTTOOLNAME").attr("disabled",false);
			$("#paraMapObj_CTI_ASSISTANTTOOLSPEC").attr("disabled",false);
			$('#paraMapObj_CTI_ADDWAY').attr("disabled",true); 
			 
			
			
			 $("#paraMapObj_CTI_TIN_SN").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_TIN_SN").addClass("readonly"); 
			 
			  $("#paraMapObj_CTI_ITEM_CODE").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_ITEM_CODE").addClass("readonly");  
			  $("#paraMapObj_CTI_ITEM_CODE_SHOW").attr("disabled","disabled");
			 
			  $("#paraMapObj_CTI_SUPPLIER").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_SUPPLIER").addClass("readonly"); 
			 
			  $("#paraMapObj_CTI_LOT").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_LOT").addClass("readonly"); 
			 
			  $("#paraMapObj_CTI_ITEM_TYPE").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_ITEM_TYPE").addClass("readonly"); 
			 
			  $("#paraMapObj_CTI_ASSISTANTTOOLNAME").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_ASSISTANTTOOLNAME").addClass("readonly"); 
			 
			  $("#paraMapObj_CTI_ASSISTANTTOOLSPEC").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_ASSISTANTTOOLSPEC").addClass("readonly"); 
			 
			 // $("#paraMapObj_CTI_QULITY_DATE").attr("readonly","readonly"); 	 
			// $("#paraMapObj_CTI_QULITY_DATE").addClass("readonly"); 
			 
			  $("#paraMapObj_CTI_EXPIRE_DATE").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_EXPIRE_DATE").addClass("readonly"); 
			 
			  //$("#paraMapObj_CTI_REFLOW_TIME").attr("readonly","readonly"); 	 
			 //$("#paraMapObj_CTI_REFLOW_TIME").addClass("readonly"); 
			 
			 // $("#paraMapObj_CTI_THAWING_CYCLE").attr("readonly","readonly"); 	 
			// $("#paraMapObj_CTI_THAWING_CYCLE").addClass("readonly"); 
			 
			//  $("#paraMapObj_CTI_QULITY_DATE_OPEN").attr("readonly","readonly"); 	 
			// $("#paraMapObj_CTI_QULITY_DATE_OPEN").addClass("readonly"); 
			 
			 // $("#paraMapObj_CTI_THAWING_TIME_MAX").attr("readonly","readonly"); 	 
			 //$("#paraMapObj_CTI_THAWING_TIME_MAX").addClass("readonly"); 
			 
			  $("#paraMapObj_CTI_INSTOCK_TIME").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_INSTOCK_TIME").addClass("readonly"); 
			 
			  $("#paraMapObj_CTI_INSTOCK_MAN").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_INSTOCK_MAN").addClass("readonly");  
			 
			 
			 $("#paraMapObj_CTI_COUNT").attr("readonly","readonly"); 	 
			 $("#paraMapObj_CTI_COUNT").addClass("readonly"); 
			 
			 
           // $("#paraMapObj_CTI_THAWING_MAX_CYCLE").attr("readonly","readonly");
		//	 $("#paraMapObj_CTI_THAWING_MAX_CYCLE").addClass("readonly"); 
			 
			 //$("#paraMapObj_CTI_MIX_MAX_TIME").attr("readonly","readonly");
			// $("#paraMapObj_CTI_MIX_MAX_TIME").addClass("readonly"); 
			 
			 
			 
			 
			 $("#paraMapObj_CTI_TIN_SN").attr("disabled",true); 
$("#paraMapObj_CTI_COUNT").attr("disabled",true); 
$("#paraMapObj_CTI_ITEM_CODE").attr("disabled",true); 
$("#paraMapObj_CTI_SUPPLIER").attr("disabled",true); 
$("#paraMapObj_CTI_LOT").attr("disabled",true); 
$("#paraMapObj_CTI_ITEM_TYPE").attr("disabled",true); 
$("#paraMapObj_CTI_ASSISTANTTOOLNAME").attr("disabled",true); 
$("#paraMapObj_CTI_ASSISTANTTOOLSPEC").attr("disabled",true); 
//$("#paraMapObj_CTI_QULITY_DATE").attr("disabled",true); 
$("#paraMapObj_CTI_EXPIRE_DATE").attr("disabled",true); 
//$("#paraMapObj_CTI_REFLOW_TIME").attr("disabled",true); 
//$("#paraMapObj_CTI_THAWING_CYCLE").attr("disabled",true); 
//$("#paraMapObj_CTI_QULITY_DATE_OPEN").attr("disabled",true); 
//$("#paraMapObj_CTI_THAWING_TIME_MAX").attr("disabled",true); 
$("#paraMapObj_CTI_INSTOCK_MAN").attr("disabled",true);  
$("#paraMapObj_CTI_INSTOCK_TIME").attr("disabled",true);			 
			 
			 
			 
			 
			 
			// alert($("#paraMapObj_CTI_ROHS_FLAG_1").val());
			/* if($("#paraMapObj_CTI_ROHS_FLAG_1").val()=='Y'){
			  alert($("#paraMapObj_CTI_ROHS_FLAG_1").val());
				 	 $('#paraMapObj_CTI_ROHS_FLAG_1').attr('checked', 'checked');
				 }else{
				 alert($("#paraMapObj_CTI_ROHS_FLAG_1").val());
				  $('#paraMapObj_CTI_ROHS_FLAG_1').attr('checked', '');
				 }*/
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

		$('#paraMap1_CIG_AGING_TIME').bind('keyup', function () {
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMap1_CIG_AGING_TIME'),"<dict:lang value="该项只能为数字" />");
             }
         });

    	$('#paraMap1_CTI_QULITY_DATE').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_QULITY_DATE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_QULITY_DATE'),"<dict:lang value="该项只能为数字" />");
             }
         });
    	$('#paraMap1_CTI_REFLOW_TIME').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_REFLOW_TIME");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_REFLOW_TIME'),"<dict:lang value="该项只能为数字" />");
             }
         });     
    	$('#paraMap1_CTI_THAWING_CYCLE').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_THAWING_CYCLE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_THAWING_CYCLE'),"<dict:lang value="该项只能为数字" />");
             }
         });         
    	$('#paraMap1_CTI_QULITY_DATE_OPEN').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_QULITY_DATE_OPEN");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_QULITY_DATE_OPEN'),"<dict:lang value="该项只能为数字" />");
             }
         });      
   	$('#paraMap1_CTI_THAWING_DECAY').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_THAWING_DECAY");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_THAWING_DECAY'),"<dict:lang value="该项只能为数字" />");
             }
         });   	
   	$('#paraMap1_CTI_MIX_TIME').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_MIX_TIME");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_MIX_TIME'),"<dict:lang value="该项只能为数字" />");
             }
         });    
  	$('#paraMap1_CTI_THAWING_MAX_CYCLE').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_THAWING_MAX_CYCLE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_THAWING_MAX_CYCLE'),"<dict:lang value="该项只能为数字" />");
             }
         });   
  	$('#paraMap1_CTI_MIX_MAX_TIME').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_MIX_MAX_TIME");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_MIX_MAX_TIME'),"<dict:lang value="该项只能为数字" />");
             }
         });         
       $('#paraMap1_CTI_THAWING_TIME_MAX').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_THAWING_TIME_MAX");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CTI_THAWING_TIME_MAX'),"该项只能为正整数");
             }
         });
		
    /*   $('#paraMapObj_CTI_WEIGHT').bind('keydown', function () {
             
             	$('#_alertValMsgDiv2').css('display','none');
             
         }); */
         
         function editSub_s(){
            $('#paraMapObj_CTI_COUNT').removeClass('_VAL_NULL');
            $('#paraMapObj_CTI_INSTOCK_DOC').removeClass('_VAL_NULL');
            if(!val.valNullData()){ 
            				return ;
            			}				
            if(!val.valDataBaseSetData()){
	        	return ;
	        }
                document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=807c860a5bde485e9ee34bfa6f5916c6"; 
                          document.forms.editForm.submit();  
            
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
                   data:"CTI_TIN_SN="+CTI_TIN_SN,
                  success:function(data){
                  	    if(null==data){
                  	        return;
                  	    }
                  	    if(null!=data.ajaxList){
                  	       
                  	        var list = eval(data.ajaxList);
                  	        console.log(list)
                  	        
                  	        $("#paraMapObj_CTI_MIX_TIME").val(list[0].CTI_MIX_TIME);
                  	        $("#paraMapObj_CTI_COUNT").val(list[0].CTI_COUNT);
                            $("#paraMapObj_CTI_PRODUCT_DATE").val(list[0].CTI_PRODUCT_DATE);
                            $("#paraMapObj_CTI_THAWING_MAX_CYCLE").val(list[0].CTI_THAWING_MAX_CYCLE);
                            $("#paraMapObj_CTI_MIX_MAX_TIME").val(list[0].CTI_MIX_MAX_TIME);
               				$("#STORAGE_NAME").val(list[0].WA_AREA_NAME);
                            $("#STORAGE_CODE").val(list[0].CTI_STOCK_SN);
                            $("#WH_CODE").val(list[0].CTI_WH_CODE);
                    
                            if(list[0].CTI_DECIDE=="0"){
                                $("#paraMapObj_CTI_ADDWAY").val("1");
                                $("#paraMapObj_CTI_ADDWAY").trigger("chosen:updated");
                            }else{
                                $("#paraMapObj_CTI_ADDWAY").val("2");
                                $("#paraMapObj_CTI_ADDWAY").trigger("chosen:updated");
                            }
                  	        
                  	    }
                  	},
                  	error:function(msg){
                  	    	utilsFp.alert("error:"+msg);
                  	}
                   
               })
                
                
            }

</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
