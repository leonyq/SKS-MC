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
  
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;height:400px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="95f9041534d84ce2ab92935d2ade0945" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="95f9041534d84ce2ab92935d2ade0945" />
	<input type="hidden" name="95f9041534d84ce2ab92935d2ade0945" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1f27a4deacd3420b982f0a846615e55d'" />
		<s:set name="_$formId_1" value="'95f9041534d84ce2ab92935d2ade0945'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
		    <td class="name-four" /><span class="dot">*</span><bu:uitn colNo="QMT_MODEL_CODE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
				<bu:td cssClass="dec-self" colNo="QMT_MODEL_CODE" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_MODEL_CODE" formId="95f9041534d84ce2ab92935d2ade0945" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="QMT_ITEM_GENRE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
				<bu:td cssClass="dec-self" colNo="QMT_ITEM_GENRE" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_ITEM_GENRE" formId="95f9041534d84ce2ab92935d2ade0945" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>	
        	<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="QMT_TEST_STEP" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec-self" colNo="QMT_TEST_STEP" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_TEST_STEP" formId="95f9041534d84ce2ab92935d2ade0945" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="MODEL_CODE_NAME" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec-self" colNo="MODEL_CODE_NAME" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="MODEL_CODE_NAME" formId="95f9041534d84ce2ab92935d2ade0945" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>		
        	<td class="name-four" /><bu:uitn colNo="MODEL_CODE_SPEC" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec-self" colNo="MODEL_CODE_SPEC" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="MODEL_CODE_SPEC" formId="95f9041534d84ce2ab92935d2ade0945" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="检测类型信息" /></h3>	
        </div>
		
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header">
							<div class="datagrid-header-inner" id="datagrid-header-inner1">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();" />
										</td>
										<td class="datagrid-cell" style="width:80px;" ><dict:lang value="检测阶别" /></td >
										<td class="datagrid-cell" style="width:100px;" ><dict:lang value="项目类型" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="抽样方案" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="缺陷等级" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="检查水平" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="水平等级" /></td >
										<td class="datagrid-cell" style="width:70px;"><dict:lang value="AQL值" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="全检标志" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="全检阈值" /></td>
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:160px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addModelList" >
									<c:forEach items="${dataList}" var="cdlList" varStatus="str">
									<tr>
									<td class="datagrid-cell datagrid-cell-0" style="width:30px;text-align: center;">${str.index+1}</td>
									<td class="datagrid-cell datagrid-cell-1" align="center" style="width:30px;"><input type="checkbox" name="isSelect1"/></td>
									<td class="datagrid-cell datagrid-cell-2" width="80px;">
										${cdlList.TEST_STEP_NAME}
									</td>
									<td class="datagrid-cell datagrid-cell-3" width="100px;">
										${cdlList.ITEM_TYPE_NAME}
									</td>
									<td class="datagrid-cell datagrid-cell-4" width="120px;" title="${cdlList.PLAN_NAME}">
										${cdlList.PLAN_NAME}
									</td>
									<td class="datagrid-cell datagrid-cell-5" width="120px;" >
										${cdlList.ERROR_GRADE}
									</td>
									
									<td class="datagrid-cell datagrid-cell-6" width="120px;">
										${cdlList.TEST_LEVEL}
									</td>
									<td class="datagrid-cell datagrid-cell-7" width="120px;">
										${cdlList.TEST_GRADE}
									</td>
									<td class="datagrid-cell datagrid-cell-8" width="70px;">
										${cdlList.QMT_ALQ_VALUE}
									</td>
									<td class="datagrid-cell datagrid-cell-9" width="120px;">
										${cdlList.QMT_FULL_FLAG}
									</td>
									<td class="datagrid-cell datagrid-cell-10" >
										${cdlList.QMT_THRESHOLD}
									</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
</div>
			
			<bu:jsVal formId="95f9041534d84ce2ab92935d2ade0945" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	 <script>	
    	$('.dialog-bd',parent.document).css('background-color','#fff');
(function($){$(window).on('load',function(){
defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)

    
</script>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
   
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 