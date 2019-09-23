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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
           
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="881411561f8f4940ac22575c4b8f02ef" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="881411561f8f4940ac22575c4b8f02ef" />
	<input type="hidden" name="881411561f8f4940ac22575c4b8f02ef" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'2cd342e9369c47f3add848ab0e853f82'" />
		<s:set name="_$formId_1" value="'881411561f8f4940ac22575c4b8f02ef'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
                            <td class="name" style="width:63px; "><span class="dot">*</span><bu:uitn colNo="CB_ITEM_CODE" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec" style="width:225px;">
                                <bu:ui colNo="CB_ITEM_CODE" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_ITEM_CODE}" dataId="${dataId}" disabled="disabled"  style="width:200px;"/>
                            </td>                            
                            <td class="name" style="width:52px;">
                                <bu:uitn colNo="T2#CI_ITEM_NAME" formId = "881411561f8f4940ac22575c4b8f02ef"  style="width:200px;"/>
                            </td>
                            <td class="dec" style="width:225px;">
                                <bu:ui colNo="T2#CI_ITEM_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_NAME}" dataId="${dataId}"  style="width:200px;"/>
                            </td>                        
                            <td class="name" style="width:52px;">
                                <bu:uitn colNo="T2#CI_ITEM_SPEC" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec"  style="width:205px;">
                                <bu:ui colNo="T2#CI_ITEM_SPEC" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_SPEC}" dataId="${dataId}"  style="width:200px;"/>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="name"><span class="dot">*</span><bu:uitn colNo="CB_VER" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_VER" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_VER}" dataId="${dataId}"  style="width:200px;"/>
                            </td>
                            <td class="name">
                                <bu:uitn colNo="CB_DEFAULT" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_DEFAULT" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_DEFAULT}" dataId="${dataId}" />
                            </td>                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="CB_REMARK" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec" colspan="5">
                                <bu:ui colNo="CB_REMARK" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_REMARK}" dataId="${dataId}" style="width:100%; height:80px;"/>
                            </td>               </tr>
	</table>
			<bu:jsVal formId="881411561f8f4940ac22575c4b8f02ef" formIndex="1" />		<div style="padding:1px;"></div>

		<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="BOM清单明细" /></h3>
					
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   style="width:1300px;">
						<div class="datagrid-header" >
						
							<div class="datagrid-header-inner" id="datagrid-header-innerb9f80468a9fe4b74ada4fceff23db738"	 style="overflow:hidden;">
								<table id="datagrid-htableb9f80468a9fe4b74ada4fceff23db738" style="min-width:1300px;" class="datagrid-htable fixedTable">
                                	<input type="hidden" name="formIds" value="b9f80468a9fe4b74ada4fceff23db738">
                                	<input type="hidden" name="relcol" value="3a6a195ea82c4ebbaaaacc3ee52c6438">	<input type="hidden" name="COL_NOb9f80468a9fe4b74ada4fceff23db738" value="ID">	<input type="hidden" name="COL_NO_Db9f80468a9fe4b74ada4fceff23db738" value="CB_BOMID">	<input type="hidden" name="b9f80468a9fe4b74ada4fceff23db738" value="paraMap2@">
                                	<input type="hidden" name="paraMap2@__LEVEL__" value="2">
                                	<input type="hidden" name="paraMap2@__DATA_COUNT__" value="1">
                                   <input type="hidden" id="addTable_FORM_COL_ID_Db9f80468a9fe4b74ada4fceff23db738" value="3a6a195ea82c4ebbaaaacc3ee52c6438">    <tbody>
                                   <tr>
                                <td class="" style="width:30px; text-align:center"><input type="checkbox" style="width:15px; cursor: pointer;" onclick="_selectAllExtend(this,'b9f80468a9fe4b74ada4fceff23db738')" id="1" name="1"> </td>     <td class="tr1 " width="200px"><span class="dot">*</span>料号</td>
                                     <td class="tr1 " >料号名称</td>
                                     <td class="tr1 " >料号规格</td>
                                     <td class="tr1 " ><span class="dot">*</span>单位</td>
                                     <td class="tr1 " ><span class="dot">*</span>点位</td>
                                     <td class="tr1 " >用量</td>
                                     <td class="tr1 " >物料阶别</td>
                                     <td class="tr1 " >反面点位</td>
                                     <td class="tr1 " >反面用量</td>
                                     <td class="tr1 " >正面点位</td>
                                     <td class="tr1 " >正面用量</td>
                                     <td class="tr1 " ><span class="dot">*</span>物料类型</td>
                                   </tr>
                                   </tbody>
                                   
                                	</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'b9f80468a9fe4b74ada4fceff23db738')" >
							<table class="glxb-table" style="min-width:1300px;" id="addTable_b9f80468a9fe4b74ada4fceff23db738" >
								<tbody id="tbody_b9f80468a9fe4b74ada4fceff23db738" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
<script>
function initEditDataLs(){
getEditRows("b9f80468a9fe4b74ada4fceff23db738","2","881411561f8f4940ac22575c4b8f02ef","","3a6a195ea82c4ebbaaaacc3ee52c6438","");
$('table').find('tbody tr:eq(0)').click();
}
</script>

									
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
