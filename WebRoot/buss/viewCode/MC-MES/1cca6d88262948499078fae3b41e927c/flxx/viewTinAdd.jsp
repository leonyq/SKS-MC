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
	
    <link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
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
<div id="_alertValMsgDiv2" style="color: rgb(255, 0, 0); background-color: rgb(254, 224, 178); left: 100px; position: absolute; top: 150px; z-index: 10; display: none;">该项只能为数字</div>
<div id="_alertValMsgDiv3" style="color: rgb(255, 0, 0); background-color: rgb(254, 224, 178); left: 732px; position: absolute; top: 80px; z-index: 10; display: none;">该项只能为不大于100的数字</div>
	<div class="edit">
	<form id="addForm" name="addForm" action="" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
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
			        <button type="button" onclick="addGloble_s2();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height:450px;">
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6c64c25e45214328b6adbec0abc8f34f" type="add" />
	<table class="basic-table" >
	<input type="hidden" id ="curUser" name="curUser" value=<s:property value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}'/>
	<input type="hidden" name="formIds" value="6c64c25e45214328b6adbec0abc8f34f" />
	<input type="hidden" name="6c64c25e45214328b6adbec0abc8f34f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />  
	
	
	<input type="hidden" name="CTI_EXPIRE_DATE" id="CTI_EXPIRE_DATE" />  
	<input type="hidden" name="CTI_INSTOCK_MAN" id="CTI_INSTOCK_MAN" /> 
	<input type="hidden" name="CTI_INSTOCK_TIME" id="CTI_INSTOCK_TIME" />  
	<input type="hidden" name="CTI_ASSISTANTTOOLTYPE" id="CTI_ASSISTANTTOOLTYPE" />  
	<input type="hidden" name="CTI_QULITY_DATE" id="CTI_QULITY_DATE" />
	<input type="hidden" name="CTI_QULITY_DATE_OPEN" id="CTI_QULITY_DATE_OPEN" /> 
	<input type="hidden" name="CTI_REFLOW_TIME" id="CTI_REFLOW_TIME" /> 
	<input type="hidden" name="CTI_THAWING_CYCLE" id="CTI_THAWING_CYCLE" /> 
	<input type="hidden" name="CTI_THAWING_TIME_MAX" id="CTI_THAWING_TIME_MAX" />
	<input type="hidden" name="ctiItemType" id="ctiItemType"/>
	<input type="hidden" name="CTI_THAWING_TIME_MAX" id="CTI_THAWING_TIME_MAX"/>
	<input type="hidden" name="CTI_THAWING_MAX_CYCLE" id="CTI_THAWING_MAX_CYCLE"/>
	<input type="hidden" name="CTI_MIX_MAX_TIME" id="CTI_MIX_MAX_TIME"/>
	<input type="hidden" name="STORAGE_CODES" id="STORAGE_CODES"/>
	<input type="hidden" name="WH_CODES" id="WH_CODES"/>
	
	
		<s:set name="_$viewId" value="'006e02231a364177aa013ef88490b35e'" />
		<s:set name="_$formId_1" value="'6c64c25e45214328b6adbec0abc8f34f'" />
		<s:set name="_$type" value="'add'" />
 
		
		
		
		<!--1-->
		<tr>
			<td class="name" style="width:113px;"/><span class="dot">*</span><bu:uitn colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:225px;" colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ADDWAY}" formIndex="1"  style="width:200px;"/></bu:td>
			<input type="hidden" name="CTI_ITEM_TYPE" id="CTI_ITEM_TYPE"/>
		    
		    <td class="name"  style="width:113px;"/><span class="dot">*</span><bu:uitn colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:225px;" colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TIN_SN}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name"  style="width:87px;"/><span class="dot">*</span><bu:uitn colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec"  style="width:205px;"  colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" >
			<bu:ui colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_COUNT}"  formIndex="1"  style="width:200px;"/></bu:td>
			 
		 
		</tr>
		
		 
		
		<!--2-->
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ITEM_CODE}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f"><bu:ui colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_SUPPLIER}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_LOT}" formIndex="1"  style="width:200px;"/></bu:td> 
		</tr>
		<!--3-->
		<tr>
                 <!--  <td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
		   <bu:td cssClass="dec" colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_WEIGHT}" formIndex="1"  style="width:200px;"/></bu:td>
		    -->   
		 
		 <td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_WEIGHT}" formIndex="1"  style="width:200px;"/></bu:td>
		
 
		   <td class="name" /><bu:uitn colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
		   <bu:td cssClass="dec" colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_DOC}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		   <td class="name" /><bu:uitn colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
		   <bu:td cssClass="dec" colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ROHS_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<!--4-->
		<tr>
            <td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLTYPE}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		    <td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLNAME}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLSPEC}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<!--5-->
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE}" formIndex="1"  style="width:200px;"/></bu:td>
		    
		    <td class="name" /><bu:uitn colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_EXPIRE_DATE}" formIndex="1"  style="width:200px;"/></bu:td>
		  
		    <td class="name" /><bu:uitn colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_REFLOW_TIME}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<!--6-->
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_CYCLE}" formIndex="1"  style="width:200px;"/></bu:td>
		   
		 	<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE_OPEN}" formIndex="1"  style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_TIME_MAX}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<!--7-->
		<tr>
		    <td class="name" /><bu:uitn colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_DECAY" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_DECAY}" formIndex="1"   style="width:200px;"/>
			</bu:td>
			<td class="name" /><bu:uitn colNo="CTI_MIX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_MIX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_MIX_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_MIX_TIME}" formIndex="1"   style="width:200px;"/>
		
			</bu:td>
			<input  type='hidden' colNo="CTI_INSTOCK_MAN" name="paraMap1@0#CTI_INSTOCK_MAN" id="paraMap1_CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_MAN}" formIndex="1"  style="width:200px;"/>
			<td class="name" /><bu:uitn colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_PRODUCT_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_PRODUCT_DATE}" formIndex="1"  style="width:200px;"/>
			
			</bu:td>
			
			<input type='hidden' colNo="CTI_INSTOCK_TIME" id="paraMap1_CTI_INSTOCK_TIME" name="paraMap1@0#CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_TIME}" formIndex="1"  style="width:200px;"/>
		</tr>
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
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" colspan="7">
			<bu:ui colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_MEMO}" formIndex="1" style="height:70px;width:100%;"/>
			</bu:td>
		</tr>
	<!--	<tr>
			<td class="name" /><bu:uitn colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_STOCK_SN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_STOCK_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ROHS_FLAG" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ROHS_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_REFLOW_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_REFLOW_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_TIME_TOTAL}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_TIME_MAX}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_THAWING_CYCLE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_CYCLE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TOTAL_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TOTAL_OPEN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_EXPIRE_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_EXPIRE_DATE_OPEN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE_OPEN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE_OPEN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_EXPIRE_DATE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_MAN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TIN_STATUS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WEIGHT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_WEIGHT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_LOT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_SUPPLIER_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_SUPPLIER_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TIN_SN}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ADDWAY" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ADDWAY}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLSPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLNAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ASSISTANTTOOLTYPE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLTYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_WH_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_WH_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_INSTOCK_DOC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_DOC}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_COUNT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_COUNT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_SUPPLIER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_MEMO" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_MEMO}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ITEM_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<bu:td cssClass="dec" colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" ><bu:ui colNo="CTI_DECIDE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_DECIDE}" formIndex="1" /></bu:td>
		</tr>-->
	</table>
			 


									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
		
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<bu:submit viewId="c76d3a1541e946ce8c42be814215dbee" />
	<bu:script viewId="c76d3a1541e946ce8c42be814215dbee" />
	
	<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>	

		  <script type="text/javascript">
	
    function valData(){
    var checkRes = true;
    return checkRes;    }
  </script>
  
  
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

	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}	
		
		
		  
		  
		  
		  $("#paraMap1_CTI_ASSISTANTTOOLTYPE").attr("readonly","readonly"); 	  
		  $("#paraMap1_CTI_ASSISTANTTOOLNAME").attr("readonly","readonly"); 	  	
		  $("#paraMap1_CTI_ASSISTANTTOOLSPEC").attr("readonly","readonly");   	
		  //$("#paraMap1_CTI_QULITY_DATE").attr("readonly","readonly"); 
		  $("#paraMap1_CTI_EXPIRE_DATE").attr("readonly","readonly"); 
		  //$("#paraMap1_CTI_REFLOW_TIME").attr("readonly","readonly"); 
		  //$("#paraMap1_CTI_THAWING_CYCLE").attr("readonly","readonly"); 
		  //$("#paraMap1_CTI_QULITY_DATE_OPEN").attr("readonly","readonly"); 
		  //$("#paraMap1_CTI_THAWING_TIME_MAX").attr("readonly","readonly"); 
		  $("#paraMap1_CTI_INSTOCK_TIME").attr("readonly","readonly"); 		  		  	
		  $("#paraMap1_CTI_INSTOCK_MAN").attr("readonly","readonly"); 
		  //$("#paraMap1_CTI_THAWING_MAX_CYCLE").attr("readonly","readonly"); 		  		  	
		  //$("#paraMap1_CTI_MIX_MAX_TIME").attr("readonly","readonly");
		
		  $("#paraMap1_CTI_ASSISTANTTOOLNAME").addClass("readonly"); 
		  $("#paraMap1_CTI_ASSISTANTTOOLSPEC").addClass("readonly"); 
		  //$("#paraMap1_CTI_QULITY_DATE").addClass("readonly"); 
		  $("#paraMap1_CTI_EXPIRE_DATE").addClass("readonly"); 		    
		  //$("#paraMap1_CTI_REFLOW_TIME").addClass("readonly");
		  //$("#paraMap1_CTI_THAWING_CYCLE").addClass("readonly");
		  //$("#paraMap1_CTI_QULITY_DATE_OPEN").addClass("readonly");
		  //$("#paraMap1_CTI_THAWING_TIME_MAX").addClass("readonly");
		  $("#paraMap1_CTI_INSTOCK_TIME").addClass("readonly");
		  $("#paraMap1_CTI_INSTOCK_MAN").addClass("readonly");
		   //$("#paraMap1_CTI_THAWING_MAX_CYCLE").addClass("readonly","readonly"); 		  		  	
		  //$("#paraMap1_CTI_MIX_MAX_TIME").addClass("readonly","readonly");
		  
		 
                   $('#paraMap1_CTI_COUNT').attr("readonly","readonly"); 
              $('#paraMap1_CTI_COUNT').addClass("readonly");
        //var userName="${dataMap.curUser}";
		$("#paraMap1_CTI_INSTOCK_MAN").val($('#curUser').val()); 
		//console.log(userName);
		//console.log($("#paraMap1_CTI_INSTOCK_MAN").val());
			$("#paraMap1_CTI_COUNT").attr("disabled",false);   
		$("#paraMap1_CTI_ASSISTANTTOOLTYPE").attr("disabled",false);  
		$("#paraMap1_CTI_ASSISTANTTOOLNAME").attr("disabled",false);
		$("#paraMap1_CTI_ASSISTANTTOOLSPEC").attr("disabled",false);
		
		
		
		
		 
		  $("#paraMap1_CTI_ASSISTANTTOOLTYPE").attr("disabled",true); 
		  $("#paraMap1_CTI_ASSISTANTTOOLNAME").attr("disabled",true); 
		  $("#paraMap1_CTI_ASSISTANTTOOLSPEC").attr("disabled",true); 	
		 // $("#paraMap1_CTI_QULITY_DATE").attr("disabled",true); 
		  $("#paraMap1_CTI_EXPIRE_DATE").attr("disabled",true); 
		  //$("#paraMap1_CTI_REFLOW_TIME").attr("disabled",true); 
		  //$("#paraMap1_CTI_THAWING_CYCLE").attr("disabled",true); 
		  //$("#paraMap1_CTI_QULITY_DATE_OPEN").attr("disabled",true); 
		  //$("#paraMap1_CTI_THAWING_TIME_MAX").attr("disabled",true); 
		 // $("#paraMap1_CTI_INSTOCK_TIME").attr("disabled",true); 	   
		  $("#paraMap1_CTI_INSTOCK_MAN").attr("disabled",true); 		
		  $("#paraMapObj_CTI_INSTOCK_TIME").attr("disabled",true); 
		
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	  
 	
	 $("#paraMap1_CTI_ADDWAY").change(function(){
            if($(this).val()==1){
           
              $('#paraMap1_CTI_COUNT').val(""); 
              $('#paraMap1_CTI_COUNT').attr("readonly","readonly"); 
              $('#paraMap1_CTI_COUNT').addClass("readonly");
              $('#paraMap1_CTI_TIN_SN').removeAttr("readonly");  
              $('#paraMap1_CTI_TIN_SN').removeClass("readonly");
              $('#paraMap1_CTI_TIN_SN').removeClass("_VAL_NULL");
               $('#paraMap1_CTI_TIN_SN').addClass("_VAL_NULL ");
                 $('#paraMap1_CTI_COUNT').removeClass("_VAL_NULL ");
          //     $('#paraMap1_CTI_LOT').removeAttr("readonly"); 
          //     $('#paraMap1_CTI_LOT').removeClass("readonly");
              $('#_alertValMsgDiv3').css('display','none');
            }else{//为批次的时候
              $('#paraMap1_CTI_TIN_SN').val("");
              $('#paraMap1_CTI_COUNT').val(""); 
              $('#paraMap1_CTI_COUNT').removeAttr("readonly"); 
              $('#paraMap1_CTI_COUNT').removeClass("readonly");
              $('#paraMap1_CTI_COUNT').addClass("_VAL_NULL ");
              $("#paraMap1_CTI_TIN_SN").attr("readonly","readonly"); 
              $('#paraMap1_CTI_TIN_SN').addClass("readonly");
             $('#paraMap1_CTI_TIN_SN').removeClass("_VAL_NULL ");
         //      $("#paraMap1_CTI_LOT").attr("readonly","readonly"); 
          //     $('#paraMap1_CTI_LOT').addClass("readonly");
              
              
              $('#_alertValMsgDiv3').css('display','none');
            }
    });
	
	
 
	
	
	$('#paraMap1_CTI_WEIGHT').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_WEIGHT");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_WEIGHT'),"<dict:lang value="该项只能为数字" />");
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
 
	
$('#paraMap1_CTI_COUNT').bind('keyup', function () {
 
  if( ! /^(1)$|^100$|^[1-9][0-9]?$/.test(this.value)){
 
             	this.value='';
             	//$('#_alertValMsgDiv3').css('display','block');
             	_alertValMsg($('#paraMap1_CTI_COUNT'),"<dict:lang value="该项只能为不大于100的数字" />");
             }
 
         });
       $('#paraMap1_CTI_THAWING_TIME_MAX').bind('keyup', function () {
	var calwStart=$("#paraMap1_CTI_THAWING_TIME_MAX");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CTI_THAWING_TIME_MAX'),"该项只能为正整数");
             }
         });
		
     /*  $('#paraMap1_CTI_COUNT').bind('keydown', function () {
             
             	$('#_alertValMsgDiv3').css('display','none');
             
         }); */
         
         
         function addGloble_s2(){
        $('#CTI_EXPIRE_DATE').val($('#paraMap1_CTI_EXPIRE_DATE').val());
        $('#CTI_INSTOCK_MAN').val($('#paraMap1_CTI_INSTOCK_MAN').val());
        //console.log($('#paraMap1_CTI_INSTOCK_TIME').val());
        $('#CTI_INSTOCK_TIME').val($('#paraMap1_CTI_INSTOCK_TIME').val()); 
        $('#CTI_ASSISTANTTOOLTYPE').val($('#paraMap1_CTI_ASSISTANTTOOLTYPE').val());
        $('#CTI_QULITY_DATE').val($('#paraMap1_CTI_QULITY_DATE').val());
        $('#CTI_QULITY_DATE_OPEN').val($('#paraMap1_CTI_QULITY_DATE_OPEN').val());
        $('#CTI_REFLOW_TIME').val($('#paraMap1_CTI_REFLOW_TIME').val()); 
        $('#CTI_THAWING_CYCLE').val($('#paraMap1_CTI_THAWING_CYCLE').val());  
        $('#CTI_THAWING_TIME_MAX').val($('#paraMap1_CTI_THAWING_TIME_MAX').val());  
        $('#CTI_THAWING_MAX_CYCLE').val($('#paraMap1_CTI_THAWING_MAX_CYCLE').val());
        $('#CTI_MIX_MAX_TIME').val($('#paraMap1_CTI_MIX_MAX_TIME').val());
        $('#WH_CODES').val($('#WH_CODE').val());
        $('#STORAGE_CODES').val($('#STORAGE_CODE').val());
        //console.log($('#WH_CODES').val()+','+$('#STORAGE_CODES').val())
        //alert("CTI_THAWING_MAX_CYCLE:"+$('#CTI_THAWING_MAX_CYCLE').val());
        //alert("CTI_THAWING_MAX_CYCLE:"+$('#CTI_MIX_MAX_TIME').val());
        
        //alert($('#CTI_THAWING_CYCLE').val()+" "+$('#CTI_THAWING_TIME_MAX').val());
        
        $('#paraMap1_CTI_INSTOCK_DOC').removeClass('_VAL_NULL'); 
        
        if($("#paraMap1_CTI_ADDWAY").val()==1){
        $('#paraMap1_CTI_COUNT').removeClass('_VAL_NULL');
        $('#paraMap1_CTI_TIN_SN').addClass('_VAL_NULL'); 
        //$('#paraMap1_CTI_LOT').addClass('_VAL_NULL');
        }else{
        $('#paraMap1_CTI_COUNT').addClass('_VAL_NULL');
        $('#paraMap1_CTI_TIN_SN').removeClass('_VAL_NULL');
        //$('#paraMap1_CTI_LOT').removeClass('_VAL_NULL');
        }
        
        if(!val.valNullData()){ 
        				return ;
        			}
       if(!val.valDataBaseSetData()){
		    return ;
	    }
           if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
        	$("#addForm").append($("#isCloseWin").clone());
        	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
           }
        
           document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=7ee414380de4401cb34a9d2c2bd74a69"; 
           document.forms.addForm.submit();
}

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
