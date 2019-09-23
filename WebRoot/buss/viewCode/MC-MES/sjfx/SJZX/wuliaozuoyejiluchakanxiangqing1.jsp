<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="23c204a5e01541268502229d464b65b5" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="23c204a5e01541268502229d464b65b5" />
	<input type="hidden" name="23c204a5e01541268502229d464b65b5" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0d55630e246d4b24b4892bcce1410faf'" />
		<s:set name="_$formId_1" value="'23c204a5e01541268502229d464b65b5'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
            <td class="name-six" style="width:65px;"/><bu:uitn colNo="WSI_MO_NUMBER" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" style="width:225px;" colNo="WSI_MO_NUMBER" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_MO_NUMBER" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" style="width:104px;"/><bu:uitn colNo="WSI_ACTIONTYPE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" style="width:225px;" colNo="WSI_ACTIONTYPE" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_ACTIONTYPE" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" style="width:65px;"/><bu:uitn colNo="WSI_MODEL_CODE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" style="width:205px;" colNo="WSI_MODEL_CODE" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_MODEL_CODE" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>		
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_PROCESS_FACE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_PROCESS_FACE" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_PROCESS_FACE" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_AREA_ID" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_AREA_ID" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_AREA_ID" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_WORKSTATION_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_WORKSTATION_SN" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_WORKSTATION_SN" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_ONLINE_FLAG" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ONLINE_FLAG" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_ONLINE_FLAG" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_ITEM_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ITEM_SN" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_ITEM_SN" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_ITEM_CODE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ITEM_CODE" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_ITEM_CODE" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>		
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_LOT_NO" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_LOT_NO" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_LOT_NO" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_ITEM_COUNT" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ITEM_COUNT" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_ITEM_COUNT" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_POINT" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_POINT" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_POINT" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_POINT_NUM" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_POINT_NUM" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_POINT_NUM" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_SUPPLIERS" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_SUPPLIERS" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_SUPPLIERS" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_ITEM_SN_OLD" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ITEM_SN_OLD" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_ITEM_SN_OLD" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>		
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_ITEM_CODE_OLD" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ITEM_CODE_OLD" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_ITEM_CODE_OLD" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_LOT_NO_OLD" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_LOT_NO_OLD" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_LOT_NO_OLD" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_COUNT_OLD" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_COUNT_OLD" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_COUNT_OLD" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_DEVICE_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_DEVICE_SN" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_DEVICE_SN" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_DEVICE_SEQ" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_DEVICE_SEQ" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_DEVICE_SEQ" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_TRUCK_NO" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_TRUCK_NO" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_TRUCK_NO" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>		
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_TABLE_NO" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_TABLE_NO" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_TABLE_NO" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_LOADPOINT_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_LOADPOINT_SN" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_LOADPOINT_SN" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_FEEDER_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_FEEDER_SN" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_FEEDER_SN" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_CHANEL_NO" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_CHANEL_NO" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_CHANEL_NO" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_TRAY_FLAG" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_TRAY_FLAG" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_TRAY_FLAG" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_REPEAT_FLAG" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_REPEAT_FLAG" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_REPEAT_FLAG" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>		
		<tr>
            <td class="name-six" /><bu:uitn colNo="WSI_EMP_NAME" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_EMP_NAME" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_EMP_NAME" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="WSI_LOADTIME" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_LOADTIME" formId="23c204a5e01541268502229d464b65b5" colspan="4"><bu:ui colNo="WSI_LOADTIME" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>
		
		
		
		
		
		
		
		
		
		
		
		<!--
		<tr>
			<td class="name-six" /><bu:uitn colNo="CREATE_USER" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="CREATE_USER" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="CREATE_USER" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="DEPT_ID" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="DEPT_ID" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="DEPT_ID" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CREATE_TIME" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="CREATE_TIME" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="CREATE_TIME" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="EDIT_USER" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="EDIT_USER" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="EDIT_USER" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="EDIT_TIME" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="EDIT_TIME" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="EDIT_TIME" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WSI_ITEM_TYPE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ITEM_TYPE" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_ITEM_TYPE" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="DATA_AUTH" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="DATA_AUTH" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="DATA_AUTH" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WSI_PRODUCT_NUM" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_PRODUCT_NUM" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_PRODUCT_NUM" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WSI_EMP" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_EMP" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="WSI_EMP" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ID" formId="23c204a5e01541268502229d464b65b5" /></td>
			<bu:td cssClass="dec-self" colNo="ID" formId="23c204a5e01541268502229d464b65b5" ><bu:ui colNo="ID" formId="23c204a5e01541268502229d464b65b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		-->
	</table>
			<bu:jsVal formId="23c204a5e01541268502229d464b65b5" formIndex="1" />
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
