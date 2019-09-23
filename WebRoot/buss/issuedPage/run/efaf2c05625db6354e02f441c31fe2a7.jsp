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
<body style="overflow:hidden;">
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
                <div class="save-close" style="display:none;" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
			    	        <button type="button" onclick="editCfiSub();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:450px;">
					
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
		   				<jsp:param name="location" value="editForm" />
		            </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c3a183e393ea4dfabb15712f9dba1873" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c3a183e393ea4dfabb15712f9dba1873" />
	<input type="hidden" name="c3a183e393ea4dfabb15712f9dba1873" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	
	<input type="hidden" name="STORAGE_CODES" id="STORAGE_CODES"/>
	<input type="hidden" name="WH_CODES" id="WH_CODES"/>
	
		<s:set name="_$viewId" value="'af68f348e5df4d9a843f7f3b2bf07d00'" />
		<s:set name="_$formId_1" value="'c3a183e393ea4dfabb15712f9dba1873'" />
		<s:set name="_$type" value="'edit'" />
		
		
		<!--1-->
		<tr>
		   	<td class="name" style="width:85PX"/><bu:uitn colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:200px" colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		
		   	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:200px" colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		    
		    	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:200px" colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		
		<!--2-->
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		   
		    	<td class="name" /><bu:uitn colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		 
		    	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		
		<!--3-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_TYPE" disabled = "disabled" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		  
		    	<td class="name" /><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873"  colspan="7"><bu:ui colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		
		<!--4-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
	     	
	     		<td class="name" /><bu:uitn colNo="CFI_CYCLE_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_CYCLE_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_CYCLE_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
	    	
	    		<td class="name" /><bu:uitn colNo="CFI_REMIND_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_REMIND_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_REMIND_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly"  style="width:200px;"/></bu:td>
		</tr>
		<!--5-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
		 
		    	<td class="name" /><bu:uitn colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
		</tr>
		<!--6-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		  
		    	<td class="name" /><bu:uitn colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
	     	
	     		<td class="name" /><bu:uitn colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		<!--7-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		   
		    	<td class="name" /><bu:uitn colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		<!--8-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" readonly="readonly" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		   
		    	<td class="name" /><bu:uitn colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		<!--9-->
		<tr>
		    <bu:td cssClass="dec" colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" style="display:none;"> <bu:ui style="display:none" colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1"	/></bu:td>
		    
	        <td class="name" /><bu:uitn colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
		    <bu:td cssClass="dec" colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" > 
		  
	    		<div class="_tree" onClick="showTree(this,event)">
	    		    <input type="text" id="STORAGE_NAME" name="STORAGE_NAME" readonly="readonly" placeholder="点击弹出">
	    		    <input type="hidden" id="STORAGE_CODE" name="STORAGE_CODE">
	    		    <input type="hidden" id="WH_CODE" name="WH_CODE">
        			<div id="index_tree" class="ztree" style="display: none;"></div>
	    		</div>
			    
			</bu:td>
		
		    <td class="name" /><bu:uitn colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<!--10-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" colspan="7"><bu:ui colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="height:80px;width:100%"/></bu:td>
	    	</tr>
		
		<!--
		
		
		<tr>
			
			
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_WH_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_WH_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_WH_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_CLCLE_UNIT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CLCLE_UNIT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_CLCLE_UNIT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
			<td class="name-six" /><bu:uitn colNo="CFI_MT_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
			<td class="name-six" /><bu:uitn colNo="CFI_MT_DATE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_DATE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_DATE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_NOW_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_NOW_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_NOW_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
			
		</tr>
		<tr>
			
			<td class="name-six" /><bu:uitn colNo="CFI_INSTOCK_MAN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_INSTOCK_MAN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_MAN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_INSTOCK_TIME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_INSTOCK_TIME" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_TIME" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_FIX_STATUS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_FIX_STATUS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FIX_STATUS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
			
		
		</tr>
		<tr>
			
			
			
		</tr>
		<tr>
			
			
			
		</tr>
		<tr>
			
		</tr>-->
	</table>
			<bu:jsVal formId="c3a183e393ea4dfabb15712f9dba1873" formIndex="1" />
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
<bu:submit viewId="af68f348e5df4d9a843f7f3b2bf07d00" />
	<bu:script viewId="af68f348e5df4d9a843f7f3b2bf07d00" />

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
            otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
            dataFilter: ajaxDataFilter
        }
    }
    
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
	    $('#STORAGE_NAME').val($('#paraMapObj_CFI_STOCK_SN').val());
	    $('#paraMapObj_CFI_STOCK_SN').attr('readonly','readonly');
	    $('#paraMapObj_CFI_STOCK_SN_chosen').attr('style',"display:none");
	})

	 
	 
             $(function(){
               
                getInfo();
            });
            function getInfo(){
            	
            	var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=d9c542b2cbda41e59435df150a2fe8e4";
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
                  	    
                  	    
                  	    
                  	     if(list[0].CTI_DECIDE=="0"){
                                $("#paraMapObj_CFI_ADDWAY").val("1");
                                $("#paraMapObj_CFI_ADDWAY").trigger("chosen:updated");
                            }else{
                                $("#paraMapObj_CFI_ADDWAY").val("2");
                                $("#paraMapObj_CFI_ADDWAY").trigger("chosen:updated");
                            }
                  	       
                  	        var list = eval(data.ajaxList);
                  	        //console.log(list)
               				$("#STORAGE_NAME").val(list[0].WA_AREA_NAME);
                  	    }
                  	},
                  	error:function(){
                  	    console.log("S");
                  	}
                   
               })
            }
	 
	 
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
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
		
	        function addDisabled(){
	        var opt = $("#paraMapObj_CFI_ITEM_TYPE").val();
	        if(opt!="2"){
	        $("#paraMapObj_CFI_LEFT_TOP").attr("readonly",true);
	        $("#paraMapObj_CFI_RIGHT_TOP").attr("readonly",true);
	        $("#paraMapObj_CFI_MIDDLE").attr("readonly",true);
	        $("#paraMapObj_CFI_LEFT_LOWER").attr("readonly",true);
	        $("#paraMapObj_CFI_RIGHT_LOWER").attr("readonly",true);
	        }
	        
	        }		
		
		
		function init(){
		        addDisabled();
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
			//$("#paraMapObj_CFI_ADDWAY").attr("readonly",readonly);
			//$("#paraMapObj_CFI_ADDWAY").addClass("readonly");
			//$("#paraMapObj_CFI_ADDWAY").removeAttr("disabled"); 
			//$("#paraMapObj_CFI_ADDWAY").removeAttr("disabled"); 
			$('#paraMapObj_CFI_ADDWAY').attr("disabled",true); 
			
			
			$("#paraMapObj_CFI_ASSISTANTTOOLNAME").removeAttr("disabled"); 
			
			
			$("#paraMapObj_CFI_ASSISTANTTOOLNAME").removeAttr("disabled"); 
			$("#paraMapObj_CFI_ASSISTANTTOOLSPEC").removeAttr("disabled"); 
			
		 
			$("#paraMapObj_CFI_ITEM_TYPE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_ITEM_TYPE").addClass("readonly");
			
			$("#paraMapObj_CFI_ASSISTANTTOOLNAME").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_ASSISTANTTOOLNAME").addClass("readonly");
			
			//$("#paraMapObj_CFI_ADDWAY").attr("readonly","readonly"); 
			//$("#paraMapObj_CFI_ADDWAY").addClass("readonly");
			
			$("#paraMapObj_CFI_ASSISTANTTOOLSPEC").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_ASSISTANTTOOLSPEC").addClass("readonly"); 
 
      
            $("#paraMapObj_CFI_MT_VAULE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MT_VAULE").addClass("readonly");  
			
			$("#paraMapObj_CFI_MT_REMIND").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MT_REMIND").addClass("readonly");   
			
			
			$("#paraMapObj_CFI_MAX_USAGE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MAX_USAGE").addClass("readonly"); 
			
			$("#paraMapObj_CFI_MT_TYPE").attr("disabled",true);
			/*$("#paraMapObj_CFI_MAX_USAGE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MAX_USAGE").addClass("readonly");
			
			$("#paraMapObj_CFI_MT_TYPE").addAttr("disabled");
			 
			
			$("#paraMapObj_CFI_MT_VAULE").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MT_VAULE").addClass("readonly");
			
			$("#paraMapObj_CFI_MT_REMIND").attr("readonly","readonly"); 
			$("#paraMapObj_CFI_MT_REMIND").addClass("readonly");   */
			
		 
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
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
	 $('#paraMapObj_CFI_TOTAL_USAGE').bind('keyup', function () {
	var calwStart=$("#paraMapObj_CFI_TOTAL_USAGE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CFI_TOTAL_USAGE'),"<dict:lang value="该项只能为数字" />");
             }
         });
         
         $('#paraMapObj_CFI_LEFT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMapObj_CFI_LEFT_TOP");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CFI_LEFT_TOP'),"<dict:lang value="该项只能正整数" />");
             }
         });
	 
	 
	 	
		
		$('#paraMapObj_CFI_RIGHT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMapObj_CFI_RIGHT_TOP");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CFI_RIGHT_TOP'),"<dict:lang value="该项只能正整数" />");
             }
         });
         
         $('#paraMapObj_CFI_MIDDLE').bind('keyup', function () {
	var calwStart=$("#paraMapObj_CFI_MIDDLE");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CFI_MIDDLE'),"<dict:lang value="该项只能正整数" />");
             }
         });
         
         $('#paraMapObj_CFI_LEFT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMapObj_CFI_LEFT_LOWER");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CFI_LEFT_LOWER'),"<dict:lang value="该项只能正整数" />");
             }
         });
         
         $('#paraMapObj_CFI_RIGHT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMapObj_CFI_RIGHT_LOWER");
             if( !  /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CFI_RIGHT_LOWER'),"<dict:lang value="该项只能正整数" />");
             }
         });
         $('#paraMapObj_CFI_TINCKNESS').bind('keyup', function () {
	var calwStart=$("#paraMapObj_CFI_TINCKNESS");
             if( !/^[0-9]+(.[0-9]{0,2})?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CFI_TINCKNESS'),"<dict:lang value="只能输入有两位小数的正实数" />");
             }
         });
         $('#paraMapObj_CFI_FLATNESS').bind('keyup', function () {
	var calwStart=$("#paraMapObj_CFI_FLATNESS");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CFI_FLATNESS'),"<dict:lang value="该项只能正整数" />");
             }
         });
	 
	 
	 $('#paraMapObj_CFI_COUNT').bind('keyup', function () {
    var calwStart=$("#paraMapObj_CFI_COUNT");
    if( ! /^(1)$|^100$|^[1-9][0-9]?$/.test(this.value)){
 
             	this.value='';
   
             	_alertValMsg($('#paraMapObj_CFI_COUNT'),"<dict:lang value="该项只能为小于100的数字" />");
             }
 
         });
	 
	 
	 function equal_3(){
		 	$("#paraMap1_CFI_LEFT_TOP").attr("readonly","readonly"); $("#paraMap1_CFI_LEFT_TOP").addClass("readonly");$("#paraMap1_CFI_LEFT_TOP").val(0);
$("#paraMap1_CFI_RIGHT_TOP").attr("readonly","readonly");  $("#paraMap1_CFI_RIGHT_TOP").addClass("readonly");$("#paraMap1_CFI_RIGHT_TOP").val(0);
$("#paraMap1_CFI_MIDDLE").attr("readonly","readonly");  $("#paraMap1_CFI_MIDDLE").addClass("readonly");$("#paraMap1_CFI_MIDDLE").val(0);
$("#paraMap1_CFI_LEFT_LOWER").attr("readonly","readonly");  $("#paraMap1_CFI_LEFT_LOWER").addClass("readonly");$("#paraMap1_CFI_LEFT_LOWER").val(0);
$("#paraMap1_CFI_RIGHT_LOWER").attr("readonly","readonly");  $("#paraMap1_CFI_RIGHT_LOWER").addClass("readonly");$("#paraMap1_CFI_RIGHT_LOWER").val(0);$("#paraMap1_CFI_TOTAL_USAGE").val("0");
		 }
		 
		 		 function equal_2(){
		 	$("#paraMap1_CFI_LEFT_TOP").removeAttr("readonly");  $("#paraMap1_CFI_LEFT_TOP").removeClass("readonly");$("#paraMap1_CFI_LEFT_TOP").val(0);
$("#paraMap1_CFI_RIGHT_TOP").removeAttr("readonly"); $("#paraMap1_CFI_RIGHT_TOP").removeClass("readonly");$("#paraMap1_CFI_RIGHT_TOP").val(0)
$("#paraMap1_CFI_MIDDLE").removeAttr("readonly"); $("#paraMap1_CFI_MIDDLE").removeClass("readonly");$("#paraMap1_CFI_MIDDLE").val(0);
$("#paraMap1_CFI_LEFT_LOWER").removeAttr("readonly"); $("#paraMap1_CFI_LEFT_LOWER").removeClass("readonly");$("#paraMap1_CFI_LEFT_LOWER").val(0);
$("#paraMap1_CFI_RIGHT_LOWER").removeAttr("readonly"); $("#paraMap1_CFI_RIGHT_LOWER").removeClass("readonly");$("#paraMap1_CFI_RIGHT_LOWER").val(0);$("#paraMap1_CFI_TOTAL_USAGE").val("0");
		 }
		 
		 
		 
	function editCfiSub(){
		    $('#WH_CODES').val($('#WH_CODE').val());
            $('#STORAGE_CODES').val($('#STORAGE_CODE').val());
            
             $("#paraMapObj_CFI_SUPPLIER_CODE_SHOW").addClass('_VAL_NULL');
            if(!val.valNullData()){ 
                   return ;
             }
   
            if(!valData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
		        return ;
	        }
			if(!val.valOjbsData()){
        		return ;
        	}
        document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=b523553f679141eca68b53c198c78c79"; 
        document.forms.editForm.submit();  
    }
</script>

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
